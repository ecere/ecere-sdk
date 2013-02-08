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
     __ATTRIB = 366
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
#line 294 "type.ec"
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
#line 319 "type.ec"

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
#define YYFINAL  104
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8707

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  506
/* YYNRULES -- Number of states.  */
#define YYNSTATES  868

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   366

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   126,     2,     2,   118,   128,   123,     2,
     115,   116,   112,   124,   122,   125,   119,   127,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   132,   134,
     113,   133,   114,   131,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   120,     2,   121,   129,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   135,   130,   136,   117,     2,     2,     2,
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
     105,   106,   107,   108,   109,   110,   111
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
     639,   641,   643,   645,   647,   649,   651,   653,   658,   660,
     663,   667,   674,   680,   682,   684,   686,   688,   690,   692,
     694,   696,   698,   700,   702,   704,   706,   708,   710,   712,
     714,   716,   718,   720,   722,   727,   732,   734,   736,   738,
     740,   742,   744,   746,   748,   750,   752,   754,   756,   758,
     760,   762,   764,   769,   774,   776,   782,   787,   792,   796,
     802,   809,   815,   821,   826,   833,   836,   839,   843,   847,
     849,   852,   854,   856,   858,   860,   864,   868,   872,   876,
     878,   882,   884,   886,   888,   891,   895,   897,   901,   911,
     921,   929,   937,   943,   954,   965,   974,   983,   990,   999,
    1008,  1015,  1022,  1027,  1037,  1047,  1055,  1063,  1069,  1073,
    1076,  1079,  1082,  1084,  1087,  1089,  1091,  1093,  1097,  1099,
    1102,  1105,  1109,  1115,  1118,  1121,  1126,  1132,  1140,  1148,
    1154,  1156,  1160,  1162,  1166,  1170,  1173,  1177,  1181,  1185,
    1190,  1195,  1198,  1202,  1206,  1211,  1215,  1218,  1222,  1226,
    1231,  1233,  1235,  1238,  1241,  1244,  1248,  1250,  1252,  1255,
    1258,  1261,  1265,  1267,  1270,  1274,  1277,  1279,  1283,  1288,
    1292,  1297,  1299,  1302,  1305,  1309,  1313,  1316,  1320,  1324,
    1327,  1329,  1331,  1334,  1337,  1339,  1342,  1345,  1349,  1353,
    1355,  1358,  1360,  1363,  1366,  1370,  1372,  1376,  1378,  1382,
    1385,  1388,  1390,  1392,  1394,  1397,  1400,  1404,  1406,  1409,
    1411,  1414,  1417,  1419,  1423,  1425,  1428,  1430,  1433,  1435,
    1439,  1444,  1446,  1448,  1450,  1454,  1456,  1458,  1460,  1462,
    1464,  1466,  1470,  1475,  1479,  1481,  1484,  1486,  1489,  1492,
    1494,  1496,  1499,  1501,  1504,  1508,  1510,  1513,  1519,  1527,
    1533,  1539,  1547,  1554,  1562,  1567,  1573,  1578,  1582,  1585,
    1588,  1591,  1595,  1597,  1603,  1608,  1614,  1619,  1624,  1628,
    1633,  1637,  1641,  1644,  1647,  1650,  1653,  1656,  1659,  1662,
    1665,  1668,  1672,  1674,  1676,  1680,  1683,  1685,  1687,  1690,
    1693,  1695,  1698,  1700,  1702,  1705,  1707
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     261,     0,    -1,   147,   112,    -1,   147,   113,    -1,   147,
       1,    -1,   142,    -1,   147,   147,    -1,    28,    -1,   141,
      -1,   141,   113,   202,   114,    -1,   141,   113,   202,    11,
      -1,   179,   221,    -1,   221,    -1,   179,   115,   116,    -1,
     117,   179,   115,   116,    -1,    78,   179,   221,    -1,    78,
     221,    -1,     3,    -1,   149,    -1,   115,   173,   116,    -1,
     147,    -1,   251,    -1,     4,    -1,   248,    -1,   118,   248,
      -1,   118,   248,   119,   248,    -1,   115,   116,    -1,    71,
     179,   218,   120,   174,   121,    -1,    71,   179,   120,   174,
     121,    -1,   102,   179,   218,   120,   174,   121,    -1,   102,
     179,   120,   174,   121,    -1,    72,   174,   182,   218,   120,
     174,   121,    -1,    72,   174,   182,   120,   174,   121,    -1,
     103,   174,   182,   218,   120,   174,   121,    -1,   103,   174,
     182,   120,   174,   121,    -1,     1,    -1,   148,    -1,   150,
     120,   173,   121,    -1,   150,   115,   116,    -1,   150,   115,
     153,   116,    -1,   150,   119,   147,    -1,   150,     7,   147,
      -1,   150,     8,    -1,   150,     9,    -1,   252,    -1,   149,
      -1,   152,   120,   173,   121,    -1,   152,   115,   116,    -1,
     152,   115,   153,   116,    -1,   152,   119,   147,    -1,   152,
       7,   147,    -1,   152,     8,    -1,   152,     9,    -1,   171,
      -1,   151,    -1,   153,   122,   171,    -1,   153,   122,   151,
      -1,     8,   155,    -1,     9,   155,    -1,   157,   158,    -1,
       6,   115,   155,   116,    -1,     6,   156,    -1,     6,   115,
     233,   116,    -1,   109,   115,   155,   116,    -1,   109,   156,
      -1,   109,   115,   233,   116,    -1,   154,    -1,   150,    -1,
     154,    -1,   152,    -1,   123,    -1,   112,    -1,   124,    -1,
     125,    -1,   117,    -1,   126,    -1,    73,    -1,   155,    -1,
     115,   232,   116,   158,    -1,   158,    -1,   159,   112,   158,
      -1,   159,   127,   158,    -1,   159,   128,   158,    -1,   159,
      -1,   160,   124,   159,    -1,   160,   125,   159,    -1,   160,
      -1,   161,    10,   160,    -1,   161,    11,   160,    -1,   163,
     113,    -1,   161,    -1,   162,   161,    -1,   163,   114,   161,
      -1,   163,    12,   161,    -1,   163,    13,   161,    -1,   163,
      -1,   164,    14,   163,    -1,   164,    15,   163,    -1,   164,
      -1,   165,   123,   164,    -1,   165,    -1,   166,   129,   165,
      -1,   166,    -1,   167,   130,   166,    -1,   167,    -1,   168,
      16,   167,    -1,   168,    -1,   169,    17,   168,    -1,   169,
      -1,   169,   131,   173,   132,   170,    -1,   170,    -1,   155,
     172,   171,    -1,   155,   172,   151,    -1,   133,    -1,    18,
      -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,
      -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,   171,
      -1,   173,   122,   171,    -1,   170,    -1,   178,   134,    -1,
     178,   183,   134,    -1,   249,   134,    -1,    77,   147,   133,
     174,   134,    -1,   193,    -1,   176,   193,    -1,   194,    -1,
     176,   194,    -1,   212,    -1,   176,   212,    -1,   196,    -1,
     176,   196,    -1,   193,    -1,   177,   193,    -1,   194,    -1,
     177,   194,    -1,   138,    -1,   177,   138,    -1,   212,    -1,
     177,   212,    -1,   196,    -1,   177,   196,    -1,   185,    -1,
     178,   185,    -1,   193,    -1,   178,   193,    -1,   194,    -1,
     178,   194,    -1,   212,    -1,   178,   212,    -1,   196,    -1,
     178,   196,    -1,   185,    -1,   179,   185,    -1,   193,    -1,
     179,   193,    -1,   194,    -1,   179,   194,    -1,   138,    -1,
     179,   138,    -1,   196,    -1,   179,   196,    -1,   212,    -1,
     179,   212,    -1,   179,    -1,   139,    -1,   185,    -1,   181,
     185,    -1,   193,    -1,   181,   193,    -1,   195,    -1,   181,
     195,    -1,   147,    -1,   181,   147,    -1,   147,   113,   202,
     114,    -1,   181,   147,   113,   202,   114,    -1,   185,    -1,
     182,   185,    -1,   193,    -1,   182,   193,    -1,   195,    -1,
     182,   195,    -1,   196,    -1,   182,   196,    -1,   212,    -1,
     182,   212,    -1,   147,    -1,   182,   147,    -1,   147,   113,
     202,   114,    -1,   182,   147,   113,   202,   114,    -1,   184,
      -1,   183,   122,   184,    -1,   219,    -1,   219,   133,   234,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    74,    -1,   191,    -1,    79,    -1,   110,    -1,   111,
      -1,     3,    -1,    28,    -1,    75,    -1,    74,    -1,    44,
      -1,   188,    -1,   188,   115,   173,   116,    -1,   189,    -1,
     190,   189,    -1,   190,   122,   189,    -1,   187,   115,   115,
     190,   116,   116,    -1,   187,   115,   115,   116,   116,    -1,
      75,    -1,   186,    -1,    44,    -1,    45,    -1,   192,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   197,    -1,   211,    -1,
     140,    -1,   100,   115,   140,   116,    -1,   100,   115,   147,
     116,    -1,    66,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,   197,    -1,
     211,    -1,   142,    -1,   100,   115,   140,   116,    -1,   100,
     115,   147,   116,    -1,    66,    -1,   203,   147,   135,   204,
     136,    -1,   203,   135,   204,   136,    -1,   203,   147,   135,
     136,    -1,   203,   135,   136,    -1,   203,   141,   135,   204,
     136,    -1,   203,   186,   147,   135,   204,   136,    -1,   203,
     186,   135,   204,   136,    -1,   203,   186,   147,   135,   136,
      -1,   203,   186,   135,   136,    -1,   203,   186,   142,   135,
     204,   136,    -1,   203,   147,    -1,   203,   142,    -1,   203,
     186,   147,    -1,   203,   186,   142,    -1,   178,    -1,   178,
     217,    -1,   198,    -1,   161,    -1,   200,    -1,   199,    -1,
     147,   133,   200,    -1,   147,   133,   199,    -1,   198,   133,
     200,    -1,   198,   133,   199,    -1,   201,    -1,   202,   122,
     201,    -1,    48,    -1,    49,    -1,   208,    -1,   204,   208,
      -1,   150,   133,   235,    -1,   205,    -1,   206,   122,   205,
      -1,    68,   181,   147,   135,    69,   243,    70,   243,   136,
      -1,    68,   181,   147,   135,    70,   243,    69,   243,   136,
      -1,    68,   181,   147,   135,    69,   243,   136,    -1,    68,
     181,   147,   135,    70,   243,   136,    -1,    68,   181,   147,
     135,   136,    -1,    68,   181,   217,   147,   135,    69,   243,
      70,   243,   136,    -1,    68,   181,   217,   147,   135,    70,
     243,    69,   243,   136,    -1,    68,   181,   217,   147,   135,
      69,   243,   136,    -1,    68,   181,   217,   147,   135,    70,
     243,   136,    -1,    68,   181,   217,   147,   135,   136,    -1,
      68,   181,   135,    69,   243,    70,   243,   136,    -1,    68,
     181,   135,    70,   243,    69,   243,   136,    -1,    68,   181,
     135,    69,   243,   136,    -1,    68,   181,   135,    70,   243,
     136,    -1,    68,   181,   135,   136,    -1,    68,   181,   217,
     135,    69,   243,    70,   243,   136,    -1,    68,   181,   217,
     135,    70,   243,    69,   243,   136,    -1,    68,   181,   217,
     135,    69,   243,   136,    -1,    68,   181,   217,   135,    70,
     243,   136,    -1,    68,   181,   217,   135,   136,    -1,   179,
     209,   134,    -1,   179,   134,    -1,   251,   134,    -1,   250,
     134,    -1,   253,    -1,   206,   134,    -1,   207,    -1,   134,
      -1,   210,    -1,   209,   122,   210,    -1,   225,    -1,   225,
     191,    -1,   132,   174,    -1,   225,   132,   174,    -1,   225,
     132,   174,   132,   174,    -1,    50,   147,    -1,    50,   142,
      -1,    50,   135,   213,   136,    -1,    50,   147,   135,   213,
     136,    -1,    50,   147,   135,   213,   134,   204,   136,    -1,
      50,   142,   135,   213,   134,   204,   136,    -1,    50,   142,
     135,   213,   136,    -1,   214,    -1,   213,   122,   214,    -1,
     147,    -1,   147,   133,   174,    -1,   115,   217,   116,    -1,
     120,   121,    -1,   120,   174,   121,    -1,   120,   140,   121,
      -1,   215,   120,   121,    -1,   215,   120,   174,   121,    -1,
     215,   120,   140,   121,    -1,   115,   116,    -1,   115,   228,
     116,    -1,   215,   115,   116,    -1,   215,   115,   228,   116,
      -1,   115,   218,   116,    -1,   115,   116,    -1,   115,   228,
     116,    -1,   216,   115,   116,    -1,   216,   115,   228,   116,
      -1,   227,    -1,   215,    -1,   227,   215,    -1,   186,   227,
      -1,   186,   215,    -1,   186,   227,   215,    -1,   227,    -1,
     216,    -1,   227,   216,    -1,   186,   227,    -1,   186,   216,
      -1,   186,   227,   216,    -1,   224,    -1,   227,   224,    -1,
     186,   227,   224,    -1,   219,   186,    -1,   147,    -1,   115,
     219,   116,    -1,   220,   120,   174,   121,    -1,   220,   120,
     121,    -1,   220,   120,   140,   121,    -1,   223,    -1,   227,
     223,    -1,   186,   223,    -1,   186,   227,   223,    -1,   227,
     186,   223,    -1,   220,   115,    -1,   222,   228,   116,    -1,
     222,   231,   116,    -1,   222,   116,    -1,   223,    -1,   220,
      -1,   186,   223,    -1,   186,   220,    -1,   220,    -1,   227,
     220,    -1,   186,   220,    -1,   186,   227,   220,    -1,   227,
     186,   220,    -1,   193,    -1,   226,   193,    -1,   112,    -1,
     112,   226,    -1,   112,   227,    -1,   112,   226,   227,    -1,
     229,    -1,   229,   122,    51,    -1,   230,    -1,   229,   122,
     230,    -1,   179,   219,    -1,   179,   217,    -1,   180,    -1,
      65,    -1,    82,    -1,    82,   123,    -1,    82,   219,    -1,
      82,   123,   219,    -1,    83,    -1,    83,   219,    -1,     1,
      -1,     1,   219,    -1,     1,   217,    -1,   147,    -1,   231,
     122,   147,    -1,   176,    -1,   176,   217,    -1,   177,    -1,
     177,   217,    -1,   171,    -1,   135,   236,   136,    -1,   135,
     236,   122,   136,    -1,   170,    -1,   151,    -1,   234,    -1,
     236,   122,   234,    -1,   238,    -1,   243,    -1,   244,    -1,
     245,    -1,   246,    -1,   247,    -1,   147,   132,   237,    -1,
      52,   174,   132,   237,    -1,    53,   132,   237,    -1,   175,
      -1,   239,   175,    -1,   237,    -1,   240,   237,    -1,   240,
     175,    -1,   240,    -1,   239,    -1,   239,   240,    -1,   135,
      -1,   135,   136,    -1,   242,   241,   136,    -1,   134,    -1,
     173,   134,    -1,    54,   115,   173,   116,   237,    -1,    54,
     115,   173,   116,   237,    64,   237,    -1,    55,   115,   173,
     116,   237,    -1,    56,   115,   173,   116,   237,    -1,    57,
     237,    56,   115,   173,   116,   134,    -1,    58,   115,   244,
     244,   116,   237,    -1,    58,   115,   244,   244,   173,   116,
     237,    -1,    56,   115,   116,   237,    -1,    58,   115,   244,
     116,   237,    -1,    58,   115,   116,   237,    -1,    59,   147,
     134,    -1,    60,   134,    -1,    61,   134,    -1,    62,   134,
      -1,    62,   173,   134,    -1,     5,    -1,   178,   147,   135,
     260,   136,    -1,   178,   147,   135,   136,    -1,   179,   147,
     135,   260,   136,    -1,   179,   147,   135,   136,    -1,   140,
     135,   260,   136,    -1,   140,   135,   136,    -1,   147,   135,
     260,   136,    -1,   147,   135,   136,    -1,   135,   260,   136,
      -1,   135,   136,    -1,   143,   243,    -1,   146,   243,    -1,
     146,   134,    -1,   144,   243,    -1,   145,   243,    -1,   178,
     221,    -1,   178,   225,    -1,   254,   243,    -1,   150,   133,
     235,    -1,   235,    -1,   256,    -1,   257,   122,   256,    -1,
     257,   134,    -1,   258,    -1,   255,    -1,   259,   258,    -1,
     259,   255,    -1,   134,    -1,   259,   134,    -1,   259,    -1,
     257,    -1,   259,   257,    -1,   230,    -1,   230,   132,   174,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   225,   225,   243,   277,   327,   328,   355,   359,   360,
     361,   378,   380,   385,   390,   395,   397,   402,   407,   408,
     413,   415,   417,   419,   421,   422,   423,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   438,   439,   440,   441,
     442,   443,   444,   445,   449,   454,   455,   456,   457,   458,
     459,   460,   461,   465,   466,   467,   468,   472,   473,   474,
     475,   476,   477,   478,   479,   480,   484,   485,   489,   490,
     494,   495,   496,   497,   498,   499,   500,   504,   505,   509,
     510,   511,   512,   516,   517,   518,   522,   523,   524,   528,
     536,   537,   538,   539,   540,   544,   545,   546,   550,   551,
     555,   556,   560,   561,   565,   566,   570,   571,   575,   576,
     580,   581,   582,   586,   587,   588,   589,   590,   591,   592,
     593,   594,   595,   596,   600,   601,   605,   609,   610,   611,
     612,   616,   617,   618,   619,   620,   621,   622,   623,   627,
     628,   629,   630,   631,   632,   633,   634,   635,   636,   640,
     641,   642,   643,   644,   645,   646,   647,   648,   649,   653,
     654,   655,   656,   657,   658,   659,   660,   661,   662,   663,
     664,   668,   669,   673,   674,   675,   676,   677,   678,   679,
     680,   681,   699,   716,   717,   718,   719,   720,   721,   722,
     723,   724,   725,   726,   727,   728,   746,   763,   764,   768,
     769,   773,   774,   775,   776,   777,   781,   782,   786,   787,
     788,   793,   794,   795,   796,   797,   801,   802,   806,   807,
     808,   812,   813,   817,   818,   822,   823,   824,   829,   830,
     831,   832,   833,   834,   835,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   847,   851,   852,   853,
     854,   855,   856,   857,   858,   859,   860,   861,   862,   863,
     864,   865,   866,   867,   868,   873,   874,   875,   876,   877,
     880,   881,   882,   883,   884,   889,   890,   893,   895,   900,
     901,   906,   916,   920,   922,   923,   925,   926,   950,   965,
     966,   970,   971,   975,   976,   980,   984,   985,   989,   991,
     993,   995,   997,  1000,  1002,  1004,  1006,  1008,  1011,  1013,
    1015,  1017,  1019,  1022,  1024,  1026,  1028,  1030,  1035,  1036,
    1037,  1038,  1039,  1040,  1041,  1042,  1046,  1048,  1053,  1055,
    1057,  1059,  1061,  1066,  1067,  1071,  1073,  1074,  1075,  1076,
    1080,  1082,  1087,  1089,  1095,  1097,  1099,  1101,  1103,  1105,
    1107,  1109,  1111,  1113,  1115,  1120,  1122,  1124,  1126,  1128,
    1133,  1134,  1135,  1136,  1137,  1138,  1142,  1143,  1144,  1145,
    1146,  1147,  1193,  1194,  1196,  1198,  1203,  1205,  1207,  1209,
    1211,  1216,  1217,  1220,  1222,  1224,  1230,  1234,  1236,  1238,
    1243,  1244,  1245,  1247,  1252,  1253,  1254,  1255,  1256,  1260,
    1261,  1265,  1266,  1267,  1268,  1272,  1273,  1277,  1278,  1282,
    1283,  1284,  1295,  1297,  1299,  1301,  1303,  1305,  1307,  1310,
    1312,  1314,  1318,  1319,  1323,  1324,  1328,  1329,  1333,  1335,
    1337,  1353,  1355,  1377,  1379,  1384,  1385,  1386,  1387,  1388,
    1389,  1393,  1395,  1397,  1402,  1403,  1407,  1408,  1411,  1415,
    1416,  1417,  1421,  1425,  1433,  1438,  1439,  1443,  1444,  1445,
    1449,  1450,  1451,  1452,  1454,  1455,  1456,  1460,  1461,  1462,
    1463,  1464,  1468,  1472,  1474,  1479,  1481,  1506,  1508,  1510,
    1512,  1517,  1519,  1523,  1525,  1527,  1529,  1531,  1537,  1539,
    1544,  1549,  1550,  1554,  1556,  1561,  1566,  1567,  1568,  1569,
    1570,  1571,  1575,  1576,  1577,  1581,  1582
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
  "DBINDEX", "DATABASE_OPEN", "ALIGNOF", "ATTRIB_DEP", "__ATTRIB", "'*'",
  "'<'", "'>'", "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','",
  "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "guess_type", "real_guess_type",
  "type", "base_strict_type", "strict_type",
  "class_function_definition_start",
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
     365,   366,    42,    60,    62,    40,    41,   126,    36,    46,
      91,    93,    44,    38,    43,    45,    33,    47,    37,    94,
     124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   137,   138,   138,   139,   140,   140,   141,   142,   142,
     142,   143,   143,   144,   145,   146,   146,   147,   148,   148,
     149,   149,   149,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   149,   150,   150,   150,   150,
     150,   150,   150,   150,   151,   152,   152,   152,   152,   152,
     152,   152,   152,   153,   153,   153,   153,   154,   154,   154,
     154,   154,   154,   154,   154,   154,   155,   155,   156,   156,
     157,   157,   157,   157,   157,   157,   157,   158,   158,   159,
     159,   159,   159,   160,   160,   160,   161,   161,   161,   162,
     163,   163,   163,   163,   163,   164,   164,   164,   165,   165,
     166,   166,   167,   167,   168,   168,   169,   169,   170,   170,
     171,   171,   171,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   173,   173,   174,   175,   175,   175,
     175,   176,   176,   176,   176,   176,   176,   176,   176,   177,
     177,   177,   177,   177,   177,   177,   177,   177,   177,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   180,   180,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   182,   182,   182,   182,   182,   182,   182,
     182,   182,   182,   182,   182,   182,   182,   183,   183,   184,
     184,   185,   185,   185,   185,   185,   186,   186,   187,   187,
     187,   188,   188,   188,   188,   188,   189,   189,   190,   190,
     190,   191,   191,   192,   192,   193,   193,   193,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   196,   196,   196,   196,   196,
     196,   196,   196,   196,   196,   197,   197,   197,   197,   198,
     198,   199,   200,   201,   201,   201,   201,   201,   201,   202,
     202,   203,   203,   204,   204,   205,   206,   206,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   208,   208,
     208,   208,   208,   208,   208,   208,   209,   209,   210,   210,
     210,   210,   210,   211,   211,   212,   212,   212,   212,   212,
     213,   213,   214,   214,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   216,   216,   216,   216,   216,
     217,   217,   217,   217,   217,   217,   218,   218,   218,   218,
     218,   218,   219,   219,   219,   219,   220,   220,   220,   220,
     220,   221,   221,   221,   221,   221,   222,   223,   223,   223,
     224,   224,   224,   224,   225,   225,   225,   225,   225,   226,
     226,   227,   227,   227,   227,   228,   228,   229,   229,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   231,   231,   232,   232,   233,   233,   234,   234,
     234,   235,   235,   236,   236,   237,   237,   237,   237,   237,
     237,   238,   238,   238,   239,   239,   240,   240,   240,   241,
     241,   241,   242,   243,   243,   244,   244,   245,   245,   245,
     246,   246,   246,   246,   246,   246,   246,   247,   247,   247,
     247,   247,   248,   249,   249,   250,   250,   251,   251,   251,
     251,   252,   252,   253,   253,   253,   253,   253,   254,   254,
     255,   256,   256,   257,   257,   258,   259,   259,   259,   259,
     259,   259,   260,   260,   260,   261,   261
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
       1,     1,     1,     1,     1,     1,     1,     4,     1,     2,
       3,     6,     5,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     1,     5,     4,     4,     3,     5,
       6,     5,     5,     4,     6,     2,     2,     3,     3,     1,
       2,     1,     1,     1,     1,     3,     3,     3,     3,     1,
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
       2,     1,     1,     1,     2,     2,     3,     1,     2,     1,
       2,     2,     1,     3,     1,     2,     1,     2,     1,     3,
       4,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     3,     4,     3,     1,     2,     1,     2,     2,     1,
       1,     2,     1,     2,     3,     1,     2,     5,     7,     5,
       5,     7,     6,     7,     4,     5,     4,     3,     2,     2,
       2,     3,     1,     5,     4,     5,     4,     4,     3,     4,
       3,     3,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     3,     1,     1,     3,     2,     1,     1,     2,     2,
       1,     2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,   419,    17,     7,   201,   202,   203,   204,   205,   229,
     230,   231,   232,   233,   235,   238,   239,   236,   237,   225,
     226,   228,   234,   291,   292,     0,   412,   246,   206,   223,
     208,   413,   417,   240,     0,   209,   210,   165,   172,   243,
       8,     5,     0,   171,   411,   159,   224,     0,   207,   227,
     161,   163,   167,   241,     0,   242,   169,   505,     0,   401,
       0,     0,   376,     0,   361,   421,   420,   391,     0,   390,
     372,   360,     0,   334,   333,     0,   414,     0,   415,     0,
     418,     0,     0,     4,     2,     3,     6,   166,   376,   160,
     224,   162,   164,   168,   170,   410,   409,     0,     0,     8,
     276,   275,     0,     0,     1,   399,   402,   403,   351,     0,
       0,     0,     0,   405,   407,    35,    22,   472,     0,     0,
       0,     0,     0,    76,     0,     0,     0,    71,     0,    74,
       0,   345,    70,    72,    73,    75,     0,    20,    36,    18,
      67,    66,    77,     0,    79,    83,    86,    90,     0,    95,
      98,   100,   102,   104,   106,   108,   126,     0,    23,    21,
     364,   393,   392,   363,     0,     0,   375,   386,     0,   389,
       0,     0,     0,     0,   362,   373,   342,     0,   340,     0,
       0,   416,     0,     0,     0,   243,    20,   282,   279,   149,
     151,   153,   157,   281,   284,   283,   289,     0,   155,     0,
       0,     0,     0,     0,   325,   268,     0,     0,     0,     0,
      20,     0,     0,   224,     0,   296,     0,   324,   293,     0,
      12,   381,     0,     0,    21,   322,     0,     0,     0,   278,
     277,     0,   506,   400,   404,   344,   377,   352,     0,     0,
      45,    69,    68,    61,     0,    57,    58,     0,     0,     0,
       0,     0,     0,    64,    26,    77,   110,   124,     0,   424,
     131,   133,   137,   135,     0,    24,   347,     0,     0,     0,
      42,    43,     0,     0,     0,    59,     0,     0,     0,     0,
       0,     0,     0,    91,     0,     0,    89,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   346,   365,   374,   353,
       0,   348,     0,     0,   379,     0,     0,   387,   388,     0,
       0,     0,   335,     0,     0,   244,   245,     0,     0,     0,
     150,   224,   152,   154,   158,   156,   280,   360,     0,    10,
       9,     0,   211,   212,   215,   214,   213,     0,   216,   218,
       0,   248,   249,   250,   251,   252,   254,   257,   258,   255,
     256,   247,   253,     0,   264,     0,   261,   179,     0,   173,
     175,   177,   259,     0,   260,     0,    16,    71,     0,    20,
       0,   452,     0,   483,   486,   487,   485,   484,     0,     0,
       0,   319,   376,   224,     0,   326,   394,    11,   328,     0,
     383,     0,   266,   294,     0,   323,     0,   382,   321,   320,
       0,   267,     0,   273,     0,     0,     0,   406,   408,   143,
      20,     0,   426,   139,   141,   147,   145,     0,     0,    51,
      52,     0,     0,     0,     0,     0,   224,   367,     0,   366,
     193,     0,   183,   185,   187,   189,   191,     0,     0,     0,
       0,     0,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   113,     0,    19,     0,   132,   134,   138,   136,
     425,     0,     0,   500,     0,   478,    67,   432,   431,     0,
     492,    44,     0,   497,   493,   503,   496,     0,     0,   480,
       0,    41,    38,    54,     0,    53,    40,     0,    80,    81,
      82,    84,    85,    87,    88,    93,    94,    92,    96,    97,
      99,   101,   103,   105,   107,     0,   354,   350,   349,   380,
     378,   423,   343,   341,     0,   339,     0,   336,   281,   286,
     285,   363,   288,   287,   290,   222,     0,     0,     0,   219,
     334,   333,     0,     0,     0,   180,   174,   176,   178,     0,
     275,     0,    15,   224,     0,   453,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   455,    20,
       0,   444,     0,   446,   435,     0,     0,     0,   436,   437,
     438,   439,   440,     0,   295,    13,   330,     0,   396,     0,
       0,   318,     0,   329,     0,   395,   384,   297,   385,   269,
     265,   271,     0,   272,     0,    60,   144,   140,   142,   148,
     146,   427,    62,    50,    47,     0,    49,     0,   356,     0,
       0,     0,   370,   369,     0,     0,   368,     0,     0,   194,
     184,   186,   188,   190,   192,     0,     0,     0,     0,     0,
      63,    65,   112,   111,   125,    78,    25,   482,     0,     0,
     376,   488,   489,   490,     0,   495,   501,   499,   504,   498,
     477,   479,    39,     0,    37,     0,     0,     0,     0,   221,
     220,     0,     0,     0,     0,     0,   312,     0,     0,     0,
       0,   278,   277,    14,     0,     0,     0,     0,     0,     0,
       0,     0,   468,   469,   470,     0,     0,     0,   456,   127,
     376,     0,   197,   199,   445,     0,   448,   447,   454,   129,
     476,     0,   397,     0,   327,   394,     0,   331,   398,   274,
     270,    48,    46,   355,   357,    28,   371,   358,     0,     0,
       0,     0,     0,     0,    30,     0,     0,     0,   481,   491,
     494,    56,    55,   109,   338,   337,   217,   262,   263,   181,
       0,     0,     0,     0,     0,   302,     0,     0,   317,     0,
       0,   443,     0,     0,     0,     0,     0,     0,     0,   467,
     471,     0,   441,     0,     0,   128,     0,   475,   396,     0,
       0,   395,     0,   359,    27,   195,    32,     0,     0,    29,
      34,     0,     0,   310,     0,   311,   182,     0,     0,     0,
       0,     0,     0,   307,   442,     0,     0,   464,     0,     0,
     466,     0,     0,     0,   474,     0,   198,     0,   428,   200,
     397,   398,   332,   196,    31,    33,     0,     0,     0,   300,
       0,   301,     0,   315,     0,   316,     0,     0,   457,   459,
     460,     0,   465,     0,     0,   130,   473,   433,     0,   308,
     309,     0,     0,     0,     0,     0,   305,     0,   306,     0,
       0,   462,     0,     0,   429,   298,   299,   313,   314,     0,
       0,   458,   461,   463,   430,   434,   303,   304
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    37,    38,   231,    40,    41,   206,   207,   208,   209,
     137,   138,   139,   140,   467,   241,   484,   141,   142,   243,
     143,   144,   145,   146,   147,   148,   149,   150,   151,   152,
     153,   154,   155,   256,   257,   453,   560,   157,   696,   259,
     412,   188,   212,    44,   358,   431,   691,   692,    45,    46,
      47,   338,   339,   340,    48,    49,    50,    51,   434,    52,
      53,   193,   194,   195,   196,   197,    54,   214,   215,   216,
     217,   218,   384,   385,    55,    56,   177,   178,    64,   427,
     110,   428,   111,   219,   220,    68,   221,    70,   388,   106,
     222,   112,   113,   114,   172,   264,   417,   809,   470,   838,
     563,   564,   565,   566,   567,   372,   568,   569,   570,   571,
     572,   158,   573,   223,   159,   471,   225,   472,   473,   474,
     475,   476,   477,   478,    58
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -723
static const yytype_int16 yypact[] =
{
    8344,   334,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,  -723,  -723,    25,  -723,  -723,  -723,  -723,
    -723,   617,   758,  -723,   -89,  -723,  -723,  -723,  -723,  -723,
     -33,  -723,    64,  7121,  -723,  -723,  -723,   -22,  -723,  -723,
    -723,  -723,  -723,  -723,   353,  -723,  -723,    33,   134,   781,
    6935,  6374,  -723,    15,    23,  -723,   374,   260,  7816,  -723,
    -723,   533,   188,    88,    95,   758,   758,   171,   374,   620,
     374,    45,  5940,  -723,  -723,  -723,  -723,  -723,   145,  -723,
      15,  -723,  -723,  -723,  -723,  -723,   374,   161,  3697,   -12,
    -723,   211,    34,  6676,  -723,  -723,   781,  -723,  -723,   626,
     239,   531,   248,   256,  -723,  -723,  -723,  -723,  6734,  6807,
    6807,  8428,  6676,  -723,  8428,  6676,  6825,  -723,  6066,  -723,
     398,  -723,  -723,  -723,  -723,  -723,   -51,    27,  -723,  -723,
     589,  -723,  -723,  6676,  -723,   399,   -75,   283,  6676,   301,
     302,   284,   294,   308,   418,    52,  -723,   326,  -723,  -723,
      23,   260,  -723,   533,  7905,  6447,  -723,  -723,  6503,  -723,
     349,   340,   390,    14,    23,  -723,   369,   -39,  -723,   188,
     188,   374,   620,   362,    35,   394,    11,   283,  7214,  -723,
    -723,  -723,  -723,   405,  -723,  -723,  -723,   142,  -723,   514,
    8512,  8083,  5697,  8428,  -723,  -723,   396,   396,   396,   341,
     149,   385,  5717,   171,  3815,  -723,   -48,  -723,  -723,   260,
    -723,  -723,   620,   422,   433,  -723,  5415,  3933,  4051,   434,
     443,   394,  -723,  -723,  -723,  -723,  -723,  -723,  8259,  6192,
    -723,   628,  -723,  -723,  6529,  -723,  -723,   145,  7307,  8596,
    7400,  8596,  6192,  -723,  -723,   763,  -723,  -723,   430,  7634,
    -723,  -723,  -723,  -723,   465,   492,  -723,  2891,  3027,   188,
    -723,  -723,  5198,   188,  6676,  -723,  6676,  6676,  6676,  6676,
    6676,  6676,  6676,   283,  6676,  6676,  -723,  6676,  6676,  6676,
    6676,  6676,  6676,  6676,  6676,  6676,  -723,    23,  -723,  -723,
     497,  -723,   -10,   505,  -723,   154,   524,  -723,  -723,   188,
    6676,   188,  -723,   263,   345,  -723,  -723,  5940,  7028,   188,
    -723,   187,  -723,  -723,  -723,  -723,  -723,   440,  5940,  -723,
    -723,  5940,  -723,  -723,  -723,  -723,  -723,   539,   548,  -723,
     408,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,    45,  -723,   553,  -723,   558,  5607,  -723,
    -723,  -723,  -723,   844,  -723,  8083,  -723,   781,  6318,   363,
    8171,   545,  5113,  -723,  -723,  -723,  -723,  -723,  1507,   698,
    6676,  -723,   226,   171,   264,  -723,   260,  -723,   309,   620,
    -723,    14,  -723,  -723,   567,  -723,    14,  -723,  -723,  -723,
    4169,  -723,  4287,  -723,  4405,  5415,  4523,  -723,  -723,  -723,
     149,   562,  7634,  -723,  -723,  -723,  -723,   570,   188,  -723,
    -723,  5254,   188,  6676,  7727,  6676,   155,   559,   568,   577,
     580,  7493,  -723,  -723,  -723,  -723,  -723,  6676,   587,  7586,
     594,   595,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,  1507,  -723,  6676,  -723,  -723,  -723,  -723,
    -723,  6676,   398,  -723,  3163,  -723,   513,  -723,  -723,  8083,
    -723,  -723,   396,  -723,  -723,   295,  -723,  3299,   581,  -723,
     584,  -723,  -723,  -723,   460,  -723,  -723,   426,  -723,  -723,
    -723,   399,   399,   -75,   -75,   283,   283,   283,   301,   301,
     302,   284,   294,   308,   418,   114,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,  -723,  5415,  -723,  5415,  -723,  -723,  -723,
    -723,   440,  -723,  -723,  -723,  -723,  6676,   597,    92,  -723,
    -723,  -723,    45,  5940,   304,    -3,  -723,  -723,  -723,    37,
    -723,    45,  -723,   171,   600,  -723,  6676,   592,   606,   610,
     618,  2331,   619,   188,   611,   615,  2051,   188,  -723,    86,
     355,  -723,  5827,  -723,  -723,  2481,  2619,   608,  -723,  -723,
    -723,  -723,  -723,   624,  -723,  -723,  -723,  3435,   260,    14,
     381,  -723,  6676,  -723,    14,   260,  -723,  -723,  -723,  -723,
    -723,  -723,  4641,  -723,  4759,  -723,  -723,  -723,  -723,  -723,
    -723,  -723,  -723,  -723,  -723,   461,  -723,   482,  -723,   635,
     644,   641,   559,   577,  7994,  6676,   559,  5940,  6676,   652,
    -723,  -723,  -723,  -723,  -723,   647,   650,  6676,  6676,   648,
    -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,   637,  1507,
     188,  -723,  -723,  -723,  1507,  -723,  -723,  -723,   295,  -723,
    -723,  -723,  -723,  1507,  -723,  6676,  4877,  4995,   477,  -723,
    -723,   658,   100,   222,   396,   396,  -723,  5940,   389,   425,
     640,  -723,  -723,  -723,   646,  2331,  6676,  6676,  6585,   720,
    5467,   657,  -723,  -723,  -723,   365,   660,  2331,  -723,  -723,
      61,   406,  -723,   475,  -723,  2755,  -723,  -723,  -723,  -723,
    -723,   661,   260,   171,  -723,   679,   620,   668,   260,  -723,
    -723,  -723,  -723,  -723,  -723,  -723,   559,  -723,   664,   681,
     227,   683,  5940,  6676,  -723,   685,   686,  6676,  -723,  -723,
    -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,  -723,
     -49,    49,   237,   396,   396,  -723,   396,   396,  -723,   439,
    2331,  -723,   499,   500,  2331,   509,   696,  2331,  5500,  -723,
    -723,  6676,  -723,  3571,   758,  -723,  5289,  -723,   679,    14,
      14,   679,  6676,  -723,  -723,  -723,  -723,   287,   691,  -723,
    -723,   694,   396,  -723,   396,  -723,  -723,   -29,   196,   -24,
     218,   396,   396,  -723,  -723,  2331,  2331,  -723,  2331,  6676,
    -723,  2331,  6658,   682,  -723,   684,  -723,  5289,  -723,  -723,
     679,   679,  -723,  -723,  -723,  -723,   687,   692,   396,  -723,
     396,  -723,   396,  -723,   396,  -723,    21,   259,   767,  -723,
    -723,   538,  -723,  2331,   542,  -723,  -723,  -723,   174,  -723,
    -723,   699,   702,   704,   706,   396,  -723,   396,  -723,  2331,
     688,  -723,  2331,  1193,  -723,  -723,  -723,  -723,  -723,   709,
     710,  -723,  -723,  -723,  -723,  -723,  -723,  -723
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -723,    56,  -723,   591,   773,     4,  -723,  -723,  -723,  -723,
       0,  -723,   307,   746,  -266,  -723,   413,   397,  1017,   722,
    -723,  -136,   370,   384,   -43,  -723,   388,   561,   563,   565,
     560,   569,  -723,  1849,  -263,  -723,   -76,    -9,  -360,  -723,
    -723,  -244,   139,  -723,  -723,   613,  -723,    97,  1634,   870,
    -723,  -723,  -313,  -723,   474,  -723,  1423,  1679,  -141,  1417,
    -134,  -195,    -5,    -2,   534,  -513,  -187,  -171,   480,  -723,
    -723,  -122,  -723,   296,  -104,  1656,   504,   564,   -55,  -382,
      18,  -199,     2,   118,  -190,  -723,   835,   166,   410,  -723,
    1004,   -64,  -723,     5,  -723,  -723,   625,  -722,  -368,  -723,
     603,  -723,  -723,   315,  -723,  -723,  1444,  -644,  -723,  -723,
    -723,  -128,  -723,  -723,   945,  -723,  -723,  -723,   404,   240,
     409,   412,  -723,  -253,  -723
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -503
static const yytype_int16 yytable[] =
{
      42,    62,   265,    66,   171,    57,   483,   275,   160,   485,
     574,   366,   561,   363,     2,   480,   174,     2,     2,    65,
     663,   782,   387,   469,   469,    74,    81,   529,     2,    73,
       2,    62,    62,    78,    80,   160,   758,     2,     2,   187,
       2,   818,    86,    88,   612,    96,   822,   616,     2,   279,
     280,   438,   258,     3,   101,   400,   402,   404,   100,   361,
     109,    95,     3,    62,     2,    83,   362,     2,   170,   294,
     266,    62,   176,     3,   394,    62,    62,    62,   181,    62,
      82,   184,   186,   311,   267,   837,   395,   783,    86,     2,
      62,   845,   393,    97,   232,   332,   364,   312,   210,    87,
     300,    82,   230,     2,   720,   283,   229,   819,   297,    86,
     667,   507,   823,   249,   802,   362,   251,   362,   784,    67,
     333,   247,   518,   226,   247,   267,   258,    59,   562,    75,
      60,   865,   668,   518,   104,    61,   334,    86,   164,    43,
     488,   489,   490,   165,   317,   364,   268,   364,     2,    67,
      67,   316,     2,   329,   742,   483,   303,   846,   485,   306,
      72,    67,   268,    62,    42,   103,   335,   336,   258,   228,
      86,   363,   669,    62,     2,   542,    84,    85,    67,   176,
     176,   161,    62,   295,    86,   785,    86,   632,   319,    67,
     633,     2,   634,    67,    67,   161,   763,    67,   487,    43,
     357,    88,   369,   247,   356,   694,   326,    43,   161,   777,
      86,   638,   382,    62,   210,   660,   738,   538,   687,   505,
     469,   268,    62,   179,   362,   609,   210,   210,   210,     2,
     180,   716,   625,   469,   592,   594,   455,   175,    42,   410,
     629,   495,   496,   408,   497,   175,   655,    86,   247,   430,
     247,   430,   410,   356,   364,   356,   330,    84,    85,   319,
     248,    84,    85,   250,   331,   820,   160,    59,    87,   481,
     424,   729,   174,   486,   187,   509,   199,   460,   393,   641,
     393,    67,   393,    59,   268,   187,    75,   824,   187,   267,
     622,   161,   258,   281,   282,   409,   853,   362,   622,    59,
      67,   512,   318,    43,    87,   362,    87,    61,   409,   511,
     854,   176,   519,   284,   285,   520,   288,   289,    42,    86,
      67,   562,   562,   522,   701,   635,   523,   364,   847,   298,
     386,   186,   821,   469,   636,   364,   739,     2,    84,    85,
     365,   775,   370,   656,   331,   657,   227,   607,   298,   331,
      83,   786,     2,   531,   825,   235,     2,   530,   535,   331,
     610,   577,   356,   540,   237,    88,     2,   100,   369,    86,
     247,   576,   559,   664,   665,   167,   539,    43,   238,    62,
     168,     3,    86,    62,     2,   311,   580,   731,    30,    62,
     732,    62,   269,   270,   271,   848,    62,   514,   581,   515,
     210,   813,   210,   117,   210,   210,   210,   290,    28,   331,
      86,   332,   247,    30,   286,   287,   611,   644,   603,    35,
      36,    87,   606,   291,    42,   240,    87,    28,   626,   645,
     601,   619,    30,   240,   293,   356,   333,  -376,   292,   619,
     666,   582,  -376,   356,    35,    36,    59,   296,    28,    60,
     658,   562,   334,    30,    61,    28,   307,    43,   743,   744,
      30,    84,    85,    35,    36,  -422,   297,   311,   596,   640,
     393,  -422,   393,  -376,  -376,   376,   371,   455,   315,   516,
     685,   517,   335,   336,    35,    36,    67,   455,    98,   688,
     187,    35,    36,    59,   746,   747,    75,    67,   268,   760,
     272,   578,   310,   808,   273,   274,   308,   585,   791,   792,
     805,   276,   309,   380,   210,   242,   210,   332,   378,   469,
     269,   270,   271,   242,   527,   745,   277,   278,   764,   267,
     528,   371,   662,   186,   393,   393,     2,   674,   328,   670,
     765,   672,   333,    62,   808,   671,   454,   654,   455,    28,
     718,   559,   455,   681,    30,   318,   398,   686,   334,    86,
      61,   748,   690,    43,   693,   559,   559,   399,   115,   405,
       2,   116,   117,   707,   187,   793,   652,   711,   406,    62,
      62,   461,   653,   653,    62,    35,    36,   386,   335,   336,
     808,    39,   210,   736,   210,     3,   269,   270,   271,   455,
     752,   753,   755,   712,   455,    28,   719,    28,   766,   721,
      30,   462,    30,   506,    42,   795,   796,   186,   725,   726,
       2,   455,   455,     2,   187,   798,   508,    83,   272,     2,
     337,   455,   273,   274,    39,   418,   419,   420,   121,   122,
      86,    35,    36,    35,    36,   510,   639,   236,    60,   491,
     492,    39,   136,    61,   850,   525,   210,   210,   852,    39,
     455,   161,    86,   526,   455,   493,   494,   186,   532,   124,
     125,   533,   183,   185,   614,   559,   498,   499,   595,   187,
      67,   545,   244,   313,   314,   130,   602,   559,   615,   185,
      86,    28,   424,   617,    28,   559,    30,   702,   705,    30,
    -376,     2,   708,    62,   272,  -376,    62,   627,   273,   274,
     630,   631,    39,   659,   778,    39,   673,   650,   781,   185,
     651,   676,   186,   831,   675,   677,   834,    35,    36,    59,
      35,    36,    75,   678,   680,    75,  -376,  -376,    84,    85,
      76,  -376,  -376,   421,   698,   682,  -376,   422,   423,   683,
     559,   713,   803,    43,   559,    39,   302,   559,   699,   305,
     714,     2,   715,   812,    62,   722,   693,   723,   727,    62,
      62,   724,    28,   728,   737,   749,   756,    30,   750,    39,
     773,   442,   443,   444,   445,   446,   447,   448,   449,   450,
     451,   759,    39,   761,    39,   559,   559,   767,   559,   168,
     772,   559,   774,    39,   776,   185,   779,   780,    35,    36,
      59,   799,   814,    75,   575,   815,   835,   185,   185,   185,
     836,   768,   862,   839,   771,    19,    20,    99,   840,    39,
     185,   849,    28,   559,   605,   855,    69,    30,   856,    39,
     857,    39,   858,   185,   211,   866,   867,     2,   253,   559,
      39,   500,   559,   503,   501,    28,    29,   502,   185,   185,
      30,   806,   583,   504,   439,   524,    69,    69,    35,    36,
      59,    63,     3,    75,   587,   513,   704,   441,    69,   642,
     695,   647,    67,     0,   730,     0,   648,   810,   811,   649,
       0,    35,    36,    59,     0,    69,   452,     0,   162,     0,
       0,    77,    77,     0,     0,     0,    69,     0,   185,    39,
      69,    69,   162,    90,    69,     0,     0,     0,    28,   185,
       0,     0,   185,    30,   102,   162,     0,     0,     0,     0,
      90,     0,     0,     0,     0,     0,   166,     0,     0,     0,
       0,   173,     0,     0,     0,    77,    77,     0,   166,   173,
     166,     0,     0,     0,    35,    36,    39,     0,     0,   185,
     211,    39,     0,   185,     0,     0,   166,     0,   213,     0,
       0,     0,   211,   211,   211,     0,     0,     0,     0,     0,
       0,   166,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   185,     0,   185,     0,   185,   185,   185,    69,     0,
       0,     0,     0,    39,     0,    71,     0,     0,   162,     0,
       0,     0,     0,   466,   466,    39,     0,    69,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   173,     0,    79,    79,    69,     0,     0,
       0,     0,     0,   224,     0,     0,     0,    71,   390,     0,
       0,   166,   173,     0,     0,   185,     0,   397,   321,     0,
      39,     0,     0,   107,    71,     0,     0,   163,   185,     0,
       0,   213,    77,     0,     0,     0,     0,     0,     0,    79,
      79,   182,   383,     0,   213,     0,     0,     0,     0,     0,
       0,     0,   396,     0,   163,     0,   213,   213,   213,     0,
       0,     0,     0,     0,     0,   185,     0,   185,     0,     0,
     234,     0,     0,     0,     0,     0,     0,     0,   426,     0,
     426,     0,     0,   661,   185,     0,     0,     0,     0,   321,
       0,     0,     0,     0,     0,     0,   245,   246,     0,     0,
     211,     0,     0,     0,     0,   255,   211,     0,   211,     0,
     211,   211,   211,    39,   679,     0,   185,   185,     0,   224,
       0,     0,     0,     0,     0,     0,     0,     0,   185,   697,
       0,   224,   224,   224,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   185,     0,   185,     0,     0,   321,     0,
       0,     0,   327,     0,   115,     0,     2,   116,   117,   118,
       0,   119,   120,    69,     0,    39,    79,     0,   185,     0,
     466,     0,     0,     0,    69,     0,   389,   391,   390,   255,
       0,     3,     0,   466,   397,     0,   586,     0,   321,     0,
       0,   588,     0,   541,     0,   213,     0,     0,   543,     0,
       0,     0,     0,     0,     0,     0,     0,   185,   185,    77,
       0,     0,   429,     0,   429,     0,   411,     0,   185,   584,
     211,   255,   211,   327,   121,   122,   123,     0,     0,   440,
     213,     0,   213,     0,   213,   213,   213,     0,   751,     0,
       0,     0,   321,     0,     0,     0,   185,     0,     0,   255,
     762,   255,     0,     0,   426,   124,   125,     0,   697,     0,
       0,   426,   126,     0,     0,   127,     0,     0,   128,   426,
     129,   130,   255,   185,     0,     0,   132,   133,   134,   135,
       0,     0,   327,   466,     0,   521,     0,     0,   807,   864,
       0,     0,     0,     0,     0,     0,     0,     0,   211,   383,
     211,     0,     0,     0,     0,   224,     0,   224,     0,   224,
     224,   224,     0,   794,   185,     0,     0,   797,     0,     0,
     800,     0,   327,     0,     0,     0,     0,     0,     0,     0,
       0,   107,    79,     0,     0,     0,     0,     0,   162,     0,
       0,     0,     0,    79,   213,   255,   213,   579,     0,   255,
     466,     0,     0,     0,     0,     0,     0,    69,   828,   829,
       0,   830,   211,   211,   832,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   586,     0,   327,     0,     0,   588,
       0,     0,     0,     0,     0,     0,     0,     0,   429,     0,
     613,     0,   543,     0,     0,   429,   851,     0,   255,     0,
     255,     0,     0,   429,     0,     0,     0,     0,     0,     0,
     703,     0,   861,     0,     0,   863,     0,     0,     0,   224,
      93,   224,   213,     0,   213,     0,    91,     0,     0,     0,
     255,     0,   255,   389,     0,     0,     0,     0,     0,     0,
       0,     0,   105,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   192,
       0,     0,     0,     0,     0,   190,     0,     0,   115,   466,
       2,   116,   117,   118,     0,   119,   120,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   213,   213,     0,   233,
       0,     0,     0,     0,     0,     3,     0,   224,     0,   224,
       0,     0,     0,   255,     0,   262,     0,   182,     0,     0,
       0,   260,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   166,     0,     0,    79,     0,   255,     0,
       0,     0,     0,   255,     0,     0,   770,     0,   121,   122,
     123,     0,   255,   255,   706,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    69,
       0,   224,   224,     0,     0,   324,     0,     0,     0,   124,
     125,   322,     0,     0,     0,     0,   126,     0,     0,   127,
       0,     0,   128,   360,   129,   130,     0,     0,     0,    93,
     132,   133,   134,   135,    77,    91,     0,     0,     0,     0,
       0,     0,   464,     0,     0,     0,     0,     0,     0,     0,
     373,   374,   375,   377,     0,     0,   415,     0,     0,     0,
       0,     0,   413,     0,     0,    93,   435,    93,   435,   415,
     255,    91,   433,    91,   433,   413,   458,    89,     0,     0,
       0,     0,   456,     0,   192,   192,     0,     0,     0,     0,
     190,   190,   255,   255,   255,   255,     0,   255,     0,    94,
       0,     0,     0,     0,   255,     0,     0,   769,     0,     0,
       0,     0,   255,     0,     0,     0,   189,     0,     0,     0,
       0,     0,    92,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   192,     0,     0,     0,   198,     0,
     190,     0,     0,     0,     0,   192,     0,     0,   192,     0,
       0,   190,     0,     0,   190,     0,     0,     0,     0,     0,
       0,   191,     0,     0,     0,     0,     0,   255,    79,     0,
       0,   255,     0,     0,   255,   255,     0,     0,     0,     0,
       0,   537,    93,   255,   263,   262,     0,    93,    91,   192,
     105,   260,     0,    91,     0,   190,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   261,     0,     0,
       0,     0,   255,   255,     0,   255,   255,     0,   255,   255,
       0,     0,   320,     0,   255,     0,     0,     0,     0,   599,
       0,     0,     0,     0,   359,   597,     0,     0,     0,     0,
       0,     0,     0,     0,   325,     0,    89,     0,   623,     0,
     255,     0,     0,     0,   621,     0,   623,     0,     0,     0,
       0,     0,   621,     0,     0,     0,   255,   323,    94,   255,
     255,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   192,    89,   432,    89,   432,   324,   190,     0,     0,
       0,    92,   322,     0,   192,   416,     0,     0,     0,     0,
     190,   189,   189,     0,    94,   436,    94,   436,   416,     0,
     156,     0,     0,     0,     0,   459,   643,     0,   414,     0,
       0,     0,     0,   198,   198,     0,     0,    92,     0,    92,
       0,   414,     0,     0,     0,     0,     0,     0,   457,     0,
       0,     0,     0,     0,     0,     0,   191,   191,     0,     0,
     192,   189,   156,     0,     0,     0,   190,     0,     0,     0,
       0,     0,   189,     0,     0,   189,     0,     0,     0,     0,
       0,   156,     0,   198,   156,     0,     0,     0,     0,   324,
       0,     0,   192,   192,   198,   322,     0,   198,   190,   190,
       0,     0,   536,     0,   192,     0,   191,     0,     0,    89,
     190,     0,     0,     0,    89,     0,   189,   191,     0,     0,
     191,     0,     0,     0,   156,     0,     0,   156,     0,     0,
       0,    94,     0,     0,   263,     0,    94,     0,   198,     0,
       0,     0,     0,     0,   192,     0,     0,     0,     0,     0,
     190,     0,     0,     0,    92,     0,     0,   261,     0,    92,
       0,   191,   115,     0,     2,   116,   117,   118,     0,   119,
     120,     0,     0,     0,     0,   620,     0,     0,   600,     0,
       0,     0,     0,   620,     0,     0,     0,     0,     0,     3,
       0,     0,     0,     0,   192,     0,     0,   624,     0,     0,
     190,   598,     0,     0,     0,   624,     0,     0,   189,     0,
       0,     0,     0,   320,     0,     0,     0,     0,   740,   741,
       0,   189,   192,     0,     0,     0,   468,   468,   190,     0,
     198,     0,   121,   122,   123,   325,     0,     0,     0,     0,
       0,     0,     0,   198,     0,     0,     0,     0,     0,   192,
       0,     0,     0,   191,     0,   190,     0,     0,   323,     0,
       0,     0,     0,   124,   125,     0,   191,     0,     0,   156,
     126,     0,     0,   127,     0,     0,   128,   189,   129,   130,
       0,     0,     0,     0,   132,   133,   134,   135,     0,     0,
     192,     0,     0,     0,     0,   684,   190,   787,   788,   198,
     789,   790,     0,     0,     0,     0,   320,     0,     0,   189,
     189,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   189,   191,     0,     0,     0,     0,     0,   325,     0,
       0,   198,   198,     0,     0,     0,   816,   468,   817,   156,
       0,     0,     0,   198,     0,   826,   827,     0,     0,     0,
       0,   323,     0,     0,   191,   191,     0,     0,     0,     0,
       0,   189,     0,     0,     0,     0,   191,     0,     0,     0,
       0,     0,   841,     0,   842,     0,   843,     0,   844,     0,
       0,     0,     0,   198,   156,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   156,     0,     0,   859,
       0,   860,     0,     0,     0,     0,   191,     0,     0,     0,
       0,   189,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   468,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   198,     0,     0,   468,     0,     0,   189,
       0,     0,   115,     0,     2,   116,   117,   118,     0,   119,
     120,     0,     0,     0,     0,     0,   191,     0,     0,     0,
       0,   198,     0,     0,     0,     0,   189,     0,     0,     3,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   191,     0,     0,     0,   198,     0,
       0,     0,     0,   546,   547,   548,   549,   550,   551,   552,
     553,   554,   555,   556,     0,   156,     0,   189,     0,     0,
       0,   191,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   198,
       0,     0,     0,     0,     0,     0,   468,     0,     0,     0,
       0,   156,     0,   124,   125,     0,     0,     0,     0,     0,
     126,     0,   191,   127,     0,     0,   128,     0,   129,   130,
       0,     0,     0,     0,   132,   133,   134,   135,     0,     0,
       0,     0,     0,     0,   156,   558,   371,   156,     0,     0,
       0,     0,     0,     0,     0,     0,   156,   156,     0,     0,
       0,     0,   115,     0,     2,   116,   117,   118,   468,   119,
     120,     0,     0,   468,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   733,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,   546,   547,   548,   549,   550,   551,   552,
     553,   554,   555,   556,     0,     0,     0,    27,     0,     0,
       0,     0,   121,   122,   123,    28,    29,     0,   557,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,   156,     0,     0,     0,   156,     0,     0,     0,
       0,    34,     0,   124,   125,     0,     0,     0,     0,     0,
     126,    35,    36,   127,     0,     0,   128,     0,   129,   130,
       0,     0,     0,     0,   132,   133,   134,   135,     0,     0,
     156,     0,   468,     0,     0,   558,   371,  -450,     0,     0,
     115,   156,     2,   116,   117,   118,     0,   119,   120,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,   546,   547,   548,   549,   550,   551,   552,   553,   554,
     555,   556,     0,     0,     0,    27,     0,     0,     0,     0,
     121,   122,   123,    28,    29,     0,   557,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   124,   125,     0,     0,     0,     0,     0,   126,    35,
      36,   127,     0,     0,   128,     0,   129,   130,     0,     0,
       0,     0,   132,   133,   134,   135,     0,     0,     0,     0,
       0,     0,     0,   558,   371,  -449,   115,     0,     2,   116,
     117,   118,     0,   119,   120,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,   546,   547,   548,
     549,   550,   551,   552,   553,   554,   555,   556,     0,     0,
       0,    27,     0,     0,     0,     0,   121,   122,   123,    28,
      29,     0,   557,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,   126,    35,    36,   127,     0,     0,
     128,     0,   129,   130,     0,     0,     0,     0,   132,   133,
     134,   135,     0,     0,     0,     0,     0,     0,     0,   558,
     371,  -451,   115,     0,     2,   116,   117,   118,     0,   119,
     120,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   121,   122,   123,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   124,   125,     0,     0,     0,     0,     0,
     126,    35,    36,   127,     0,     0,   128,     0,   129,   130,
       0,     0,     0,     0,   132,   133,   134,   135,     0,     0,
       0,     0,     0,     0,     0,   463,   464,   465,   115,     0,
       2,   116,   117,   118,     0,   119,   120,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   121,   122,
     123,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   124,
     125,     0,     0,     0,     0,     0,   126,    35,    36,   127,
       0,     0,   128,     0,   129,   130,     0,     0,     0,     0,
     132,   133,   134,   135,     0,     0,     0,     0,     0,     0,
       0,   463,   464,   479,   115,     0,     2,   116,   117,   118,
       0,   119,   120,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   121,   122,   123,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   124,   125,     0,     0,     0,
       0,     0,   126,    35,    36,   127,     0,     0,   128,     0,
     129,   130,     0,     0,     0,     0,   132,   133,   134,   135,
       0,     0,     0,     0,     0,     0,     0,   463,   464,   637,
     115,     0,     2,   116,   117,   118,     0,   119,   120,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     121,   122,   123,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   124,   125,     0,     0,     0,     0,     0,   126,    35,
      36,   127,     0,     0,   128,     0,   129,   130,     0,     0,
       0,     0,   132,   133,   134,   135,     0,     0,     0,     0,
       0,     0,     0,   646,   464,  -502,   115,     0,     2,   116,
     117,   118,     0,   119,   120,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,   121,   122,   123,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,   126,    35,    36,   127,     0,     0,
     128,     0,   129,   130,     0,     0,     0,     0,   132,   133,
     134,   135,     0,     0,     0,     0,     0,     0,     0,   463,
     464,   700,   115,     0,     2,   116,   117,   118,     0,   119,
     120,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   121,   122,   123,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   124,   125,     0,     0,     0,     0,     0,
     126,    35,    36,   127,     0,     0,   128,     0,   129,   130,
       0,     0,     0,     0,   132,   133,   134,   135,   115,     0,
       2,   116,   117,     0,     0,   463,   464,   804,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   200,     0,     0,   121,   122,
       0,    28,    29,     0,     0,   201,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   124,
     125,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   202,     0,   203,   130,   115,     0,     2,   116,
     117,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   204,     0,   205,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   200,     0,     0,   121,   122,     0,    28,
      29,     0,     0,   201,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     202,     0,   203,   130,   115,     0,     2,   116,   117,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   204,
       0,   392,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,   200,     0,     0,   121,   122,     0,    28,    29,     0,
       0,   201,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   124,   125,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,   202,     0,
     203,   130,   115,     0,     2,   116,   117,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   204,     0,   401,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,   200,
       0,     0,   121,   122,     0,    28,    29,     0,     0,   201,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   124,   125,     0,     0,     0,     0,     0,
       0,    35,    36,    59,     0,     0,   202,     0,   203,   130,
     115,     0,     2,   116,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   204,     0,   403,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   200,     0,     0,
     121,   122,     0,    28,    29,     0,     0,   201,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   124,   125,     0,     0,     0,     0,     0,     0,    35,
      36,    59,     0,     0,   202,     0,   203,   130,   115,     0,
       2,   116,   117,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   204,     0,   589,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   200,     0,     0,   121,   122,
       0,    28,    29,     0,     0,   201,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   124,
     125,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   202,     0,   203,   130,   115,     0,     2,   116,
     117,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   204,     0,   590,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   200,     0,     0,   121,   122,     0,    28,
      29,     0,     0,   201,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     202,     0,   203,   130,   115,     0,     2,   116,   117,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   204,
       0,   591,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,   200,     0,     0,   121,   122,     0,    28,    29,     0,
       0,   201,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   124,   125,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,   202,     0,
     203,   130,   115,     0,     2,   116,   117,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   204,     0,   593,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,   200,
       0,     0,   121,   122,     0,    28,    29,     0,     0,   201,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   124,   125,     0,     0,     0,     0,     0,
       0,    35,    36,    59,     0,     0,   202,     0,   203,   130,
     115,     0,     2,   116,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   204,     0,   709,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   200,     0,     0,
     121,   122,     0,    28,    29,     0,     0,   201,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   124,   125,     0,     0,     0,     0,     0,     0,    35,
      36,    59,     0,     0,   202,     0,   203,   130,   115,     0,
       2,   116,   117,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   204,     0,   710,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   200,     0,     0,   121,   122,
       0,    28,    29,     0,     0,   201,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   124,
     125,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   202,     0,   203,   130,   115,     0,     2,   116,
     117,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   204,     0,   734,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   200,     0,     0,   121,   122,     0,    28,
      29,     0,     0,   201,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     202,     0,   203,   130,   115,     0,     2,   116,   117,   118,
       0,   119,   120,     0,     0,     0,     0,     0,     0,   204,
       0,   735,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,   546,   547,   548,   549,   550,
     551,   552,   553,   554,   555,   556,     0,     0,     0,    27,
       0,     0,     0,     0,   121,   122,   123,    28,    29,     0,
     557,     0,    30,     0,     0,     0,     0,     0,    33,   115,
       0,     2,   116,   117,   118,     0,   119,   120,     0,     0,
       0,     0,     0,    34,     0,   124,   125,     0,     0,     0,
       0,     0,   126,    35,    36,   127,     3,     0,   128,     0,
     129,   130,     0,     0,     0,     0,   132,   133,   134,   135,
       0,     0,     0,     0,     0,     0,     0,   558,   371,     0,
       0,     0,     0,     0,     0,   115,     0,     2,   116,   117,
     118,     0,   119,   120,     0,     0,     0,     0,     0,   121,
     122,   123,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     0,     0,     0,     0,     0,     0,     0,
     115,     0,     2,   116,   117,   118,     0,   119,   120,     0,
     124,   125,     0,     0,     0,     0,     0,   126,     0,     0,
     127,     0,     0,   128,   482,   129,   130,     3,     0,     0,
       0,   132,   133,   134,   135,   121,   122,   123,     0,     0,
       0,     0,     0,   464,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   124,   125,     0,     0,
     121,   122,   123,   126,     0,     0,   127,     0,     0,   128,
     604,   129,   130,     0,     0,     0,     0,   132,   133,   134,
     135,     0,     0,     0,     0,     0,     0,     0,     0,   464,
       0,   124,   125,     0,     0,     0,     0,     0,   126,     0,
       0,   127,     0,     0,   128,     0,   129,   130,     0,     0,
       0,     0,   132,   133,   134,   135,   115,     0,     2,   116,
     117,     0,     0,     0,   807,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,   115,     0,
       2,   116,   117,   118,     0,   119,   120,     0,     0,     0,
       0,    27,     0,   200,     0,     0,   121,   122,     0,    28,
      29,     0,     0,   201,    30,     3,     0,     0,     0,     0,
      33,   115,     0,     2,   116,   117,   118,     0,   119,   120,
       0,     0,     0,     0,     0,    34,     0,   124,   125,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     3,     0,
     202,     0,   203,   130,     0,     0,     0,     0,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,     0,   204,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   124,
     125,   121,   122,   123,     0,     0,   126,     0,     0,   127,
       0,     0,   128,   757,   129,   130,     0,     0,     0,     0,
     132,   133,   134,   135,     0,     0,     0,     0,     0,     0,
       0,   558,   124,   125,     0,     0,     0,     0,     0,   126,
       2,     0,   127,     0,     0,   128,   801,   129,   130,     0,
       0,     0,     0,   132,   133,   134,   135,     0,     0,     0,
       0,     0,     0,     0,   558,     3,     4,     5,     6,     7,
       8,   341,   342,   343,   344,   345,   346,   347,   348,   349,
     350,    19,    20,   351,   352,    23,    24,   353,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   354,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   115,     0,
       2,   116,   117,   118,     0,   119,   120,   355,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       2,     0,   318,     0,     0,     3,     0,    61,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   534,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,   121,   122,
     123,    28,     0,     0,     0,     0,    30,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,   124,
     125,     0,    33,     0,     0,     0,   126,    35,    36,   367,
       0,     0,   368,   254,   129,   130,     0,    34,     0,     0,
     132,   133,   134,   135,     0,     0,     0,    35,    36,    59,
       2,     0,   379,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   380,
       0,   381,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,   115,    75,     2,   116,   117,   118,     0,   119,   120,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   689,     0,     0,     0,     0,     0,     0,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,   121,   122,   123,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   124,   125,     0,     0,     0,     0,     0,   126,
      35,    36,   127,     0,     0,   128,     0,   129,   130,     0,
       0,     0,     0,   132,   133,   134,   135,   115,     0,     2,
     116,   117,   118,     0,   119,   120,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     3,     0,     0,     0,     0,     0,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,   121,   122,   123,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   124,   125,
       0,     0,     0,     0,     0,   126,    35,    36,   127,     0,
       0,   128,   254,   129,   130,     0,     0,     0,     0,   132,
     133,   134,   135,   115,     0,     2,   116,   117,   118,     0,
     119,   120,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     0,     0,     0,     0,     0,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   121,   122,   123,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   124,   125,     0,     0,     0,     0,
       0,   126,    35,    36,   127,     0,     0,   244,   254,   129,
     130,     0,     0,     0,     0,   132,   133,   134,   135,   115,
       0,     2,   116,   117,   118,     0,   119,   120,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     0,     0,     0,
       0,     0,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,   115,     0,     2,   116,   117,
     118,     0,   119,   120,    27,     0,     0,     0,     0,   121,
     122,   123,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     3,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     124,   125,     0,     0,     0,     0,     0,   126,    35,    36,
     367,     0,     0,   368,   254,   129,   130,     0,     0,     0,
       0,   132,   133,   134,   135,   121,   122,   123,   115,     0,
       2,   116,   117,   118,     0,   119,   120,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,   124,   125,     0,     0,
       0,     0,     0,   126,     0,     0,   127,     0,     0,   128,
       0,   129,   130,     0,     0,   131,     0,   132,   133,   134,
     135,     0,     0,     0,   115,     0,     2,   116,   117,   118,
       0,   119,   120,     0,     0,     0,     0,     0,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     115,     3,     2,   116,   117,   118,     0,   119,   120,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   124,
     125,     0,     0,     0,     0,     0,   126,     3,     0,   127,
       0,     0,   128,     0,   129,   130,     0,     0,   301,     0,
     132,   133,   134,   135,   121,   122,   123,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   115,     0,     2,   116,
     117,   118,     0,   119,   120,     0,     0,     0,     0,     0,
     121,   122,   123,     0,     0,   124,   125,     0,     0,     0,
       0,     0,   126,     3,     0,   127,     0,     0,   128,     0,
     129,   130,     0,     0,   304,     0,   132,   133,   134,   135,
       0,   124,   125,     0,     0,     0,     0,     0,   126,     0,
       0,   127,     0,     0,   128,   254,   129,   130,     0,     0,
       0,     0,   132,   133,   134,   135,   121,   122,   123,   115,
       0,     2,   116,   117,   118,     0,   119,   120,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   115,     0,     2,
     116,   117,   118,     0,   119,   120,     3,   124,   125,     0,
       0,     0,     0,     0,   126,     0,     0,   127,     0,     0,
     128,   754,   129,   130,     3,     0,     0,     0,   132,   133,
     134,   135,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   121,
     122,   123,     0,     0,     0,   115,     0,     2,   116,   117,
     118,     0,   119,   120,     0,     0,     0,   121,   122,   123,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     124,   125,     3,     0,     0,     0,     0,   126,     0,     0,
     127,     0,     0,   128,   833,   129,   130,     0,   124,   125,
       0,   132,   133,   134,   135,   126,     0,     0,   127,     0,
       0,   128,     0,   129,   130,     0,     0,     0,     0,   132,
     133,   134,   135,     0,     0,   121,   122,   123,   115,     0,
       2,   116,   117,   118,     0,   119,   120,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   115,     0,     2,   116,
     117,   118,     0,   119,   120,     3,   124,   125,     0,     0,
       0,     0,     0,   126,     0,     0,   127,     0,     0,   239,
       0,   129,   130,     3,     0,     0,     0,   132,   133,   134,
     135,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   121,   122,   123,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   124,
     125,     0,     0,     0,     0,     0,   126,     0,     0,   127,
       0,     0,   244,     0,   129,   130,     0,   124,   125,     0,
     132,   133,   134,   135,   126,     0,     1,   127,     2,     0,
     252,     0,   129,   130,     0,     0,     0,     0,   132,   133,
     134,   135,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     2,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
      60,   108,     0,     0,     0,    61,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      59,     0,     0,   318,   108,     0,     0,     0,    61,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    59,     0,     0,    60,     0,     0,     0,
       0,    61,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    59,     0,     0,   318,
       0,     0,     0,     0,    61,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   424,     0,     0,     0,     0,   425,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    59,     0,     0,   424,     0,     0,     0,     0,
     437,     3,     4,     5,     6,     7,     8,   341,   342,   343,
     344,   345,   346,   347,   348,   349,   350,    19,    20,   351,
     352,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   354,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,   355,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,   424,     0,
       0,     0,     0,   618,     3,     4,     5,     6,     7,     8,
     341,   342,   343,   344,   345,   346,   347,   348,   349,   350,
      19,    20,   351,   352,    23,    24,    25,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   354,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     3,     0,     0,    30,     0,     0,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,   355,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    59,     0,
      27,   424,     0,     0,     0,     0,   628,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
       2,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    59,     0,     0,   318,
       0,     0,     0,     0,    61,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     0,     1,     0,     2,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   424,   608,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,     0,     0,     0,     1,     0,     2,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,     0,     0,
       0,     0,   169,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     0,     0,     0,     1,     0,     2,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,     0,     0,     0,
       0,   299,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,    31,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,     0,     0,     0,     0,
     717,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,    75,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,     0,     0,     0,   544,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
     407,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     1,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,    31,    32,     0,    33,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
       3,     4,     5,     6,     7,     8,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,    19,    20,   351,   352,
      23,    24,   353,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   354,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   355,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,     3,     4,     5,     6,     7,     8,
     341,   342,   343,   344,   345,   346,   347,   348,   349,   350,
      19,    20,   351,   352,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   354,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   355,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36
};

static const yytype_int16 yycheck[] =
{
       0,     1,   130,     1,    68,     0,   272,   143,    63,   272,
     378,   201,   372,   200,     3,   268,    71,     3,     3,     1,
     533,    70,   212,   267,   268,    25,   115,   340,     3,    25,
       3,    31,    32,    31,    32,    90,   680,     3,     3,    82,
       3,    70,    42,    43,   426,    43,    70,   429,     3,   124,
     125,   250,   128,    28,    54,   226,   227,   228,    54,   200,
      60,    43,    28,    63,     3,     1,   200,     3,    68,    17,
     121,    71,    72,    28,   122,    75,    76,    77,    76,    79,
     113,    81,    82,   122,   135,   807,   134,   136,    88,     3,
      90,    70,   214,   115,   103,     3,   200,   136,    98,    43,
     164,   113,   102,     3,   617,   148,   102,   136,   163,   109,
     113,   121,   136,   122,   758,   249,   125,   251,    69,     1,
      28,   121,   317,   135,   124,   135,   202,   112,   372,   115,
     115,   853,   135,   328,     0,   120,    44,   137,   115,     0,
     276,   277,   278,   120,   133,   249,   135,   251,     3,    31,
      32,   116,     3,    11,   667,   421,   165,   136,   421,   168,
     135,    43,   135,   163,   164,   132,    74,    75,   244,   135,
     170,   358,   135,   173,     3,   365,   112,   113,    60,   179,
     180,    63,   182,   131,   184,   136,   186,   453,   188,    71,
     453,     3,   455,    75,    76,    77,   135,    79,   274,    60,
     200,   201,   202,   203,   200,   565,   188,    68,    90,   722,
     210,   464,   212,   213,   214,   528,   116,   358,   132,   295,
     464,   135,   222,   135,   358,   424,   226,   227,   228,     3,
     135,   613,   431,   477,   405,   406,   122,    71,   238,   239,
     439,   284,   285,   238,   287,    79,   132,   247,   248,   249,
     250,   251,   252,   249,   358,   251,   114,   112,   113,   259,
     121,   112,   113,   124,   122,    69,   321,   112,   212,   269,
     115,   639,   327,   273,   317,   121,   115,   259,   400,   469,
     402,   163,   404,   112,   135,   328,   115,    69,   331,   135,
     431,   173,   368,    10,    11,   239,   122,   431,   439,   112,
     182,   310,   115,   164,   248,   439,   250,   120,   252,   309,
     136,   311,   317,    12,    13,   317,    14,    15,   318,   319,
     202,   565,   566,   328,   577,   461,   328,   431,    69,   163,
     212,   331,   136,   577,   462,   439,   114,     3,   112,   113,
     201,   114,   203,   514,   122,   516,   135,   423,   182,   122,
       1,   114,     3,   353,   136,   116,     3,   353,   358,   122,
     424,   135,   358,   363,   116,   365,     3,   363,   368,   369,
     370,   380,   372,    69,    70,   115,   358,   238,   122,   379,
     120,    28,   382,   383,     3,   122,   122,   653,    79,   389,
     653,   391,     7,     8,     9,   136,   396,   134,   134,   136,
     400,   114,   402,     5,   404,   405,   406,   123,    74,   122,
     410,     3,   412,    79,   113,   114,   425,   122,   418,   110,
     111,   365,   422,   129,   424,   118,   370,    74,   437,   134,
     412,   431,    79,   126,    16,   431,    28,    74,   130,   439,
     136,   132,    79,   439,   110,   111,   112,   121,    74,   115,
     526,   695,    44,    79,   120,    74,   116,   318,    69,    70,
      79,   112,   113,   110,   111,   116,   521,   122,   412,   469,
     592,   122,   594,   110,   111,   134,   135,   122,   116,   134,
     556,   136,    74,    75,   110,   111,   368,   122,   135,   134,
     533,   110,   111,   112,    69,    70,   115,   379,   135,   134,
     115,   383,   133,   766,   119,   120,   116,   389,    69,    70,
     763,   112,   122,   132,   514,   118,   516,     3,   133,   763,
       7,     8,     9,   126,   116,   136,   127,   128,   122,   135,
     122,   135,   532,   533,   656,   657,     3,   546,   133,   539,
     134,   541,    28,   543,   807,   541,   116,   121,   122,    74,
     614,   551,   122,   553,    79,   115,   134,   557,    44,   559,
     120,   136,   562,   424,   562,   565,   566,   134,     1,   135,
       3,     4,     5,   582,   617,   136,   116,   116,   135,   579,
     580,   116,   122,   122,   584,   110,   111,   469,    74,    75,
     853,     0,   592,   116,   594,    28,     7,     8,     9,   122,
     676,   677,   678,   121,   122,    74,   615,    74,   133,   618,
      79,   119,    79,   116,   614,   116,   116,   617,   627,   628,
       3,   122,   122,     3,   667,   116,   121,     1,   115,     3,
     116,   122,   119,   120,    43,     7,     8,     9,    71,    72,
     640,   110,   111,   110,   111,   121,   133,   116,   115,   279,
     280,    60,    61,   120,   116,   116,   656,   657,   116,    68,
     122,   543,   662,   115,   122,   281,   282,   667,   115,   102,
     103,   113,    81,    82,   115,   675,   288,   289,   116,   722,
     562,   136,   115,   179,   180,   118,   116,   687,   120,    98,
     690,    74,   115,   113,    74,   695,    79,   579,   580,    79,
      74,     3,   584,   703,   115,    79,   706,   120,   119,   120,
     116,   116,   121,   116,   723,   124,   116,   136,   727,   128,
     136,   115,   722,   799,   132,   115,   802,   110,   111,   112,
     110,   111,   115,   115,   115,   115,   110,   111,   112,   113,
     123,   115,   116,   115,   136,   134,   120,   119,   120,   134,
     750,   116,   761,   614,   754,   164,   165,   757,   134,   168,
     116,     3,   121,   772,   764,   113,   764,   120,   120,   769,
     770,   121,    74,   136,   116,   135,    56,    79,   132,   188,
     116,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   134,   201,   133,   203,   795,   796,   136,   798,   120,
     132,   801,   121,   212,   121,   214,   121,   121,   110,   111,
     112,   115,   121,   115,   116,   121,   134,   226,   227,   228,
     136,   703,   134,   136,   706,    44,    45,    54,   136,   238,
     239,    64,    74,   833,   421,   136,     1,    79,   136,   248,
     136,   250,   136,   252,    98,   136,   136,     3,   126,   849,
     259,   290,   852,   293,   291,    74,    75,   292,   267,   268,
      79,   764,   388,   294,   251,   331,    31,    32,   110,   111,
     112,     1,    28,   115,   394,   311,   580,   252,    43,   469,
     565,   477,   764,    -1,   644,    -1,   477,   769,   770,   477,
      -1,   110,   111,   112,    -1,    60,   133,    -1,    63,    -1,
      -1,    31,    32,    -1,    -1,    -1,    71,    -1,   317,   318,
      75,    76,    77,    43,    79,    -1,    -1,    -1,    74,   328,
      -1,    -1,   331,    79,    54,    90,    -1,    -1,    -1,    -1,
      60,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    -1,    -1,    -1,    75,    76,    -1,    78,    79,
      80,    -1,    -1,    -1,   110,   111,   365,    -1,    -1,   368,
     214,   370,    -1,   372,    -1,    -1,    96,    -1,    98,    -1,
      -1,    -1,   226,   227,   228,    -1,    -1,    -1,    -1,    -1,
      -1,   111,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   400,    -1,   402,    -1,   404,   405,   406,   163,    -1,
      -1,    -1,    -1,   412,    -1,     1,    -1,    -1,   173,    -1,
      -1,    -1,    -1,   267,   268,   424,    -1,   182,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   163,    -1,    31,    32,   202,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,    43,   213,    -1,
      -1,   181,   182,    -1,    -1,   464,    -1,   222,   188,    -1,
     469,    -1,    -1,    59,    60,    -1,    -1,    63,   477,    -1,
      -1,   201,   202,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    77,   212,    -1,   214,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   222,    -1,    90,    -1,   226,   227,   228,    -1,
      -1,    -1,    -1,    -1,    -1,   514,    -1,   516,    -1,    -1,
     106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   248,    -1,
     250,    -1,    -1,   532,   533,    -1,    -1,    -1,    -1,   259,
      -1,    -1,    -1,    -1,    -1,    -1,   119,   120,    -1,    -1,
     394,    -1,    -1,    -1,    -1,   128,   400,    -1,   402,    -1,
     404,   405,   406,   562,   551,    -1,   565,   566,    -1,   214,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   577,   566,
      -1,   226,   227,   228,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   592,    -1,   594,    -1,    -1,   318,    -1,
      -1,    -1,   188,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   368,    -1,   614,   202,    -1,   617,    -1,
     464,    -1,    -1,    -1,   379,    -1,   212,   213,   383,   202,
      -1,    28,    -1,   477,   389,    -1,   391,    -1,   358,    -1,
      -1,   396,    -1,   363,    -1,   365,    -1,    -1,   368,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   656,   657,   379,
      -1,    -1,   248,    -1,   250,    -1,   239,    -1,   667,   389,
     514,   244,   516,   259,    71,    72,    73,    -1,    -1,   252,
     400,    -1,   402,    -1,   404,   405,   406,    -1,   675,    -1,
      -1,    -1,   412,    -1,    -1,    -1,   695,    -1,    -1,   272,
     687,   274,    -1,    -1,   424,   102,   103,    -1,   695,    -1,
      -1,   431,   109,    -1,    -1,   112,    -1,    -1,   115,   439,
     117,   118,   295,   722,    -1,    -1,   123,   124,   125,   126,
      -1,    -1,   318,   577,    -1,   321,    -1,    -1,   135,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   592,   469,
     594,    -1,    -1,    -1,    -1,   400,    -1,   402,    -1,   404,
     405,   406,    -1,   750,   763,    -1,    -1,   754,    -1,    -1,
     757,    -1,   358,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   367,   368,    -1,    -1,    -1,    -1,    -1,   543,    -1,
      -1,    -1,    -1,   379,   514,   368,   516,   383,    -1,   372,
     644,    -1,    -1,    -1,    -1,    -1,    -1,   562,   795,   796,
      -1,   798,   656,   657,   801,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   579,    -1,   412,    -1,    -1,   584,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   424,    -1,
     426,    -1,   562,    -1,    -1,   431,   833,    -1,   421,    -1,
     423,    -1,    -1,   439,    -1,    -1,    -1,    -1,    -1,    -1,
     580,    -1,   849,    -1,    -1,   852,    -1,    -1,    -1,   514,
      43,   516,   592,    -1,   594,    -1,    43,    -1,    -1,    -1,
     453,    -1,   455,   469,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    59,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    82,
      -1,    -1,    -1,    -1,    -1,    82,    -1,    -1,     1,   763,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   656,   657,    -1,   106,
      -1,    -1,    -1,    -1,    -1,    28,    -1,   592,    -1,   594,
      -1,    -1,    -1,   526,    -1,   128,    -1,   543,    -1,    -1,
      -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   693,    -1,    -1,   562,    -1,   551,    -1,
      -1,    -1,    -1,   556,    -1,    -1,   706,    -1,    71,    72,
      73,    -1,   565,   566,   580,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   764,
      -1,   656,   657,    -1,    -1,   188,    -1,    -1,    -1,   102,
     103,   188,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,   200,   117,   118,    -1,    -1,    -1,   212,
     123,   124,   125,   126,   764,   212,    -1,    -1,    -1,    -1,
      -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     206,   207,   208,   209,    -1,    -1,   239,    -1,    -1,    -1,
      -1,    -1,   239,    -1,    -1,   248,   249,   250,   251,   252,
     653,   248,   249,   250,   251,   252,   259,    43,    -1,    -1,
      -1,    -1,   259,    -1,   267,   268,    -1,    -1,    -1,    -1,
     267,   268,   675,   676,   677,   678,    -1,   680,    -1,    43,
      -1,    -1,    -1,    -1,   687,    -1,    -1,   703,    -1,    -1,
      -1,    -1,   695,    -1,    -1,    -1,    82,    -1,    -1,    -1,
      -1,    -1,    43,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   317,    -1,    -1,    -1,    82,    -1,
     317,    -1,    -1,    -1,    -1,   328,    -1,    -1,   331,    -1,
      -1,   328,    -1,    -1,   331,    -1,    -1,    -1,    -1,    -1,
      -1,    82,    -1,    -1,    -1,    -1,    -1,   750,   764,    -1,
      -1,   754,    -1,    -1,   757,   758,    -1,    -1,    -1,    -1,
      -1,   358,   365,   766,   128,   368,    -1,   370,   365,   372,
     367,   368,    -1,   370,    -1,   372,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   128,    -1,    -1,
      -1,    -1,   795,   796,    -1,   798,   799,    -1,   801,   802,
      -1,    -1,   188,    -1,   807,    -1,    -1,    -1,    -1,   412,
      -1,    -1,    -1,    -1,   200,   412,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   188,    -1,   212,    -1,   431,    -1,
     833,    -1,    -1,    -1,   431,    -1,   439,    -1,    -1,    -1,
      -1,    -1,   439,    -1,    -1,    -1,   849,   188,   212,   852,
     853,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   464,   248,   249,   250,   251,   469,   464,    -1,    -1,
      -1,   212,   469,    -1,   477,   239,    -1,    -1,    -1,    -1,
     477,   267,   268,    -1,   248,   249,   250,   251,   252,    -1,
      61,    -1,    -1,    -1,    -1,   259,   472,    -1,   239,    -1,
      -1,    -1,    -1,   267,   268,    -1,    -1,   248,    -1,   250,
      -1,   252,    -1,    -1,    -1,    -1,    -1,    -1,   259,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   267,   268,    -1,    -1,
     533,   317,   103,    -1,    -1,    -1,   533,    -1,    -1,    -1,
      -1,    -1,   328,    -1,    -1,   331,    -1,    -1,    -1,    -1,
      -1,   122,    -1,   317,   125,    -1,    -1,    -1,    -1,   562,
      -1,    -1,   565,   566,   328,   562,    -1,   331,   565,   566,
      -1,    -1,   358,    -1,   577,    -1,   317,    -1,    -1,   365,
     577,    -1,    -1,    -1,   370,    -1,   372,   328,    -1,    -1,
     331,    -1,    -1,    -1,   165,    -1,    -1,   168,    -1,    -1,
      -1,   365,    -1,    -1,   368,    -1,   370,    -1,   372,    -1,
      -1,    -1,    -1,    -1,   617,    -1,    -1,    -1,    -1,    -1,
     617,    -1,    -1,    -1,   365,    -1,    -1,   368,    -1,   370,
      -1,   372,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,   431,    -1,    -1,   412,    -1,
      -1,    -1,    -1,   439,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,   667,    -1,    -1,   431,    -1,    -1,
     667,   412,    -1,    -1,    -1,   439,    -1,    -1,   464,    -1,
      -1,    -1,    -1,   469,    -1,    -1,    -1,    -1,   664,   665,
      -1,   477,   695,    -1,    -1,    -1,   267,   268,   695,    -1,
     464,    -1,    71,    72,    73,   469,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   477,    -1,    -1,    -1,    -1,    -1,   722,
      -1,    -1,    -1,   464,    -1,   722,    -1,    -1,   469,    -1,
      -1,    -1,    -1,   102,   103,    -1,   477,    -1,    -1,   310,
     109,    -1,    -1,   112,    -1,    -1,   115,   533,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
     763,    -1,    -1,    -1,    -1,   134,   763,   743,   744,   533,
     746,   747,    -1,    -1,    -1,    -1,   562,    -1,    -1,   565,
     566,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   577,   533,    -1,    -1,    -1,    -1,    -1,   562,    -1,
      -1,   565,   566,    -1,    -1,    -1,   782,   378,   784,   380,
      -1,    -1,    -1,   577,    -1,   791,   792,    -1,    -1,    -1,
      -1,   562,    -1,    -1,   565,   566,    -1,    -1,    -1,    -1,
      -1,   617,    -1,    -1,    -1,    -1,   577,    -1,    -1,    -1,
      -1,    -1,   818,    -1,   820,    -1,   822,    -1,   824,    -1,
      -1,    -1,    -1,   617,   425,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   437,    -1,    -1,   845,
      -1,   847,    -1,    -1,    -1,    -1,   617,    -1,    -1,    -1,
      -1,   667,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   464,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   667,    -1,    -1,   477,    -1,    -1,   695,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,   667,    -1,    -1,    -1,
      -1,   695,    -1,    -1,    -1,    -1,   722,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   695,    -1,    -1,    -1,   722,    -1,
      -1,    -1,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,   546,    -1,   763,    -1,    -1,
      -1,   722,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   763,
      -1,    -1,    -1,    -1,    -1,    -1,   577,    -1,    -1,    -1,
      -1,   582,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,   763,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,    -1,    -1,    -1,   615,   134,   135,   618,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   627,   628,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,   639,     8,
       9,    -1,    -1,   644,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   655,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    77,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,   723,    -1,    -1,    -1,   727,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
     761,    -1,   763,    -1,    -1,   134,   135,   136,    -1,    -1,
       1,   772,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    77,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   134,   135,   136,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    77,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,
     115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
     135,   136,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   134,   135,   136,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
      -1,    -1,   115,    -1,   117,   118,    -1,    -1,    -1,    -1,
     123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,   135,   136,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,    -1,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,   136,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   134,   135,   136,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,
     115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
     135,   136,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,     1,    -1,
       3,     4,     5,    -1,    -1,   134,   135,   136,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,    -1,   117,   118,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,    -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    -1,   117,   118,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,
     117,   118,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,    -1,   115,    -1,   117,   118,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,   115,    -1,   117,   118,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,    -1,   117,   118,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,    -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    -1,   117,   118,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,
     117,   118,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,    -1,   115,    -1,   117,   118,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,   115,    -1,   117,   118,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,    -1,   117,   118,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,    -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    -1,   117,   118,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,    28,    -1,   115,    -1,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,   116,   117,   118,    28,    -1,    -1,
      -1,   123,   124,   125,   126,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      71,    72,    73,   109,    -1,    -1,   112,    -1,    -1,   115,
     116,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   135,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    28,    -1,    -1,    -1,    -1,
      85,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    28,    -1,
     115,    -1,   117,   118,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    71,    72,    73,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,   116,   117,   118,    -1,    -1,    -1,    -1,
     123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
       3,    -1,   112,    -1,    -1,   115,   116,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
       3,    -1,   115,    -1,    -1,    28,    -1,   120,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   135,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    71,    72,
      73,    74,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,   102,
     103,    -1,    85,    -1,    -1,    -1,   109,   110,   111,   112,
      -1,    -1,   115,   116,   117,   118,    -1,   100,    -1,    -1,
     123,   124,   125,   126,    -1,    -1,    -1,   110,   111,   112,
       3,    -1,   115,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   132,
      -1,   134,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,     1,   115,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,    -1,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,
      -1,   115,   116,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,    -1,    -1,   115,   116,   117,
     118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    28,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,    -1,    -1,   115,   116,   117,   118,    -1,    -1,    -1,
      -1,   123,   124,   125,   126,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    28,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    28,    -1,   112,
      -1,    -1,   115,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,   125,   126,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    28,    -1,   112,    -1,    -1,   115,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,   125,   126,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,   116,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,   116,   117,   118,    28,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    28,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,   116,   117,   118,    -1,   102,   103,
      -1,   123,   124,   125,   126,   109,    -1,    -1,   112,    -1,
      -1,   115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    28,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    28,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    -1,   117,   118,    -1,   102,   103,    -1,
     123,   124,   125,   126,   109,    -1,     1,   112,     3,    -1,
     115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,   116,    -1,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    -1,   115,   116,    -1,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,    -1,   115,    -1,    -1,    -1,
      -1,   120,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,
      -1,    -1,    -1,    -1,   120,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,    -1,    -1,    -1,    -1,   120,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,   115,    -1,    -1,    -1,    -1,
     120,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,
      -1,    -1,    -1,   120,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    28,    -1,    -1,    79,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      66,   115,    -1,    -1,    -1,    -1,   120,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,
      -1,    -1,    -1,    -1,   120,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,    -1,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,   116,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    -1,    -1,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,    -1,
      -1,    -1,   116,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    -1,    -1,    -1,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,    -1,    -1,    -1,
      -1,   116,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,    -1,    -1,    -1,    -1,
     116,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,    -1,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     3,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    65,    66,    74,    75,
      79,    82,    83,    85,   100,   110,   111,   138,   139,   140,
     141,   142,   147,   179,   180,   185,   186,   187,   191,   192,
     193,   194,   196,   197,   203,   211,   212,   230,   261,   112,
     115,   120,   147,   186,   215,   217,   219,   220,   222,   223,
     224,   227,   135,   142,   147,   115,   123,   186,   219,   227,
     219,   115,   113,     1,   112,   113,   147,   138,   147,   185,
     186,   193,   194,   196,   212,   217,   219,   115,   135,   141,
     142,   147,   186,   132,     0,   193,   226,   227,   116,   147,
     217,   219,   228,   229,   230,     1,     4,     5,     6,     8,
       9,    71,    72,    73,   102,   103,   109,   112,   115,   117,
     118,   121,   123,   124,   125,   126,   140,   147,   148,   149,
     150,   154,   155,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   168,   169,   170,   174,   248,   251,
     215,   220,   223,   227,   115,   120,   186,   115,   120,   116,
     147,   228,   231,   186,   215,   224,   147,   213,   214,   135,
     135,   219,   227,   140,   147,   140,   147,   161,   178,   185,
     193,   194,   196,   198,   199,   200,   201,   202,   212,   115,
      68,    78,   115,   117,   134,   136,   143,   144,   145,   146,
     147,   150,   179,   186,   204,   205,   206,   207,   208,   220,
     221,   223,   227,   250,   251,   253,   135,   135,   135,   142,
     147,   140,   174,   193,   227,   116,   116,   116,   122,   115,
     149,   152,   154,   156,   115,   155,   155,   147,   179,   174,
     179,   174,   115,   156,   116,   155,   170,   171,   173,   176,
     193,   194,   196,   212,   232,   248,   121,   135,   135,     7,
       8,     9,   115,   119,   120,   158,   112,   127,   128,   124,
     125,    10,    11,   161,    12,    13,   113,   114,    14,    15,
     123,   129,   130,    16,    17,   131,   121,   215,   224,   116,
     228,   121,   140,   174,   121,   140,   174,   116,   116,   122,
     133,   122,   136,   213,   213,   116,   116,   133,   115,   147,
     185,   186,   193,   194,   196,   212,   217,   227,   133,    11,
     114,   122,     3,    28,    44,    74,    75,   116,   188,   189,
     190,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    46,    47,    50,    66,   100,   142,   147,   181,   185,
     193,   195,   197,   203,   211,   179,   221,   112,   115,   147,
     179,   135,   242,   243,   243,   243,   134,   243,   133,   115,
     132,   134,   147,   186,   209,   210,   220,   221,   225,   227,
     223,   227,   136,   208,   122,   134,   186,   223,   134,   134,
     204,   136,   204,   136,   204,   135,   135,    51,   230,   138,
     147,   155,   177,   193,   194,   196,   212,   233,     7,     8,
       9,   115,   119,   120,   115,   120,   186,   216,   218,   227,
     147,   182,   185,   193,   195,   196,   212,   120,   218,   182,
     155,   233,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,   133,   172,   116,   122,   193,   194,   196,   212,
     217,   116,   119,   134,   135,   136,   150,   151,   170,   178,
     235,   252,   254,   255,   256,   257,   258,   259,   260,   136,
     260,   147,   116,   151,   153,   171,   147,   173,   158,   158,
     158,   159,   159,   160,   160,   161,   161,   161,   163,   163,
     164,   165,   166,   167,   168,   173,   116,   121,   121,   121,
     121,   147,   174,   214,   134,   136,   134,   136,   198,   199,
     200,   227,   199,   200,   201,   116,   115,   116,   122,   189,
     142,   147,   115,   113,   135,   147,   185,   193,   195,   217,
     147,   186,   221,   186,   115,   136,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    77,   134,   147,
     173,   175,   178,   237,   238,   239,   240,   241,   243,   244,
     245,   246,   247,   249,   235,   116,   174,   135,   220,   227,
     122,   134,   132,   191,   186,   220,   223,   205,   223,   136,
     136,   136,   204,   136,   204,   116,   138,   193,   194,   196,
     212,   217,   116,   147,   116,   153,   147,   173,   116,   218,
     228,   174,   216,   227,   115,   120,   216,   113,   120,   147,
     185,   193,   195,   196,   212,   218,   174,   120,   120,   218,
     116,   116,   151,   171,   171,   158,   248,   136,   260,   133,
     147,   221,   225,   243,   122,   134,   134,   255,   257,   258,
     136,   136,   116,   122,   121,   132,   204,   204,   173,   116,
     189,   140,   147,   202,    69,    70,   136,   113,   135,   135,
     147,   142,   147,   116,   174,   132,   115,   115,   115,   237,
     115,   147,   134,   134,   134,   173,   147,   132,   134,   134,
     147,   183,   184,   219,   175,   240,   175,   237,   136,   134,
     136,   260,   220,   186,   210,   220,   227,   174,   220,   136,
     136,   116,   121,   116,   116,   121,   216,   116,   228,   174,
     202,   174,   113,   120,   121,   174,   174,   120,   136,   235,
     256,   151,   171,   170,   136,   136,   116,   116,   116,   114,
     243,   243,   202,    69,    70,   136,    69,    70,   136,   135,
     132,   237,   173,   173,   116,   173,    56,   116,   244,   134,
     134,   133,   237,   135,   122,   134,   133,   136,   220,   227,
     186,   220,   132,   116,   121,   114,   121,   202,   174,   121,
     121,   174,    70,   136,    69,   136,   114,   243,   243,   243,
     243,    69,    70,   136,   237,   116,   116,   237,   116,   115,
     237,   116,   244,   174,   136,   260,   184,   135,   171,   234,
     220,   220,   174,   114,   121,   121,   243,   243,    70,   136,
      69,   136,    70,   136,    69,   136,   243,   243,   237,   237,
     237,   173,   237,   116,   173,   134,   136,   234,   236,   136,
     136,   243,   243,   243,   243,    70,   136,    69,   136,    64,
     116,   237,   116,   122,   136,   136,   136,   136,   136,   243,
     243,   237,   134,   237,   136,   234,   136,   136
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
      case 138: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3707 "type.ec"
	break;
      case 140: /* "type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3716 "type.ec"
	break;
      case 141: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3725 "type.ec"
	break;
      case 142: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3734 "type.ec"
	break;
      case 143: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3743 "type.ec"
	break;
      case 144: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3752 "type.ec"
	break;
      case 145: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3761 "type.ec"
	break;
      case 146: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3770 "type.ec"
	break;
      case 147: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3779 "type.ec"
	break;
      case 148: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3788 "type.ec"
	break;
      case 150: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3797 "type.ec"
	break;
      case 153: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3806 "type.ec"
	break;
      case 155: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3815 "type.ec"
	break;
      case 158: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3824 "type.ec"
	break;
      case 159: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3833 "type.ec"
	break;
      case 160: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3842 "type.ec"
	break;
      case 161: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3851 "type.ec"
	break;
      case 163: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3860 "type.ec"
	break;
      case 164: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3869 "type.ec"
	break;
      case 165: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3878 "type.ec"
	break;
      case 166: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3887 "type.ec"
	break;
      case 167: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3896 "type.ec"
	break;
      case 168: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3905 "type.ec"
	break;
      case 169: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3914 "type.ec"
	break;
      case 170: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3923 "type.ec"
	break;
      case 171: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3932 "type.ec"
	break;
      case 173: /* "expression" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3941 "type.ec"
	break;
      case 174: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3950 "type.ec"
	break;
      case 175: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3959 "type.ec"
	break;
      case 176: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3968 "type.ec"
	break;
      case 177: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3977 "type.ec"
	break;
      case 178: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3986 "type.ec"
	break;
      case 179: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3995 "type.ec"
	break;
      case 183: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4004 "type.ec"
	break;
      case 184: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4013 "type.ec"
	break;
      case 185: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4022 "type.ec"
	break;
      case 186: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4031 "type.ec"
	break;
      case 188: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4040 "type.ec"
	break;
      case 189: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4049 "type.ec"
	break;
      case 190: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4058 "type.ec"
	break;
      case 191: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4067 "type.ec"
	break;
      case 192: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4076 "type.ec"
	break;
      case 193: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4085 "type.ec"
	break;
      case 194: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4094 "type.ec"
	break;
      case 195: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4103 "type.ec"
	break;
      case 196: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4112 "type.ec"
	break;
      case 197: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4121 "type.ec"
	break;
      case 198: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4130 "type.ec"
	break;
      case 199: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4139 "type.ec"
	break;
      case 200: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4148 "type.ec"
	break;
      case 201: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4157 "type.ec"
	break;
      case 204: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4166 "type.ec"
	break;
      case 205: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4175 "type.ec"
	break;
      case 206: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4184 "type.ec"
	break;
      case 207: /* "property" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4193 "type.ec"
	break;
      case 208: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4202 "type.ec"
	break;
      case 209: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4211 "type.ec"
	break;
      case 210: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4220 "type.ec"
	break;
      case 211: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4229 "type.ec"
	break;
      case 212: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4238 "type.ec"
	break;
      case 213: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4247 "type.ec"
	break;
      case 214: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4256 "type.ec"
	break;
      case 215: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4265 "type.ec"
	break;
      case 216: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4274 "type.ec"
	break;
      case 217: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4283 "type.ec"
	break;
      case 218: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4292 "type.ec"
	break;
      case 219: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4301 "type.ec"
	break;
      case 220: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4310 "type.ec"
	break;
      case 221: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4319 "type.ec"
	break;
      case 222: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4328 "type.ec"
	break;
      case 223: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4337 "type.ec"
	break;
      case 224: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4346 "type.ec"
	break;
      case 225: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4355 "type.ec"
	break;
      case 226: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4364 "type.ec"
	break;
      case 227: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4373 "type.ec"
	break;
      case 228: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4382 "type.ec"
	break;
      case 229: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4391 "type.ec"
	break;
      case 230: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4400 "type.ec"
	break;
      case 231: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4409 "type.ec"
	break;
      case 232: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4418 "type.ec"
	break;
      case 233: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4427 "type.ec"
	break;
      case 234: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4436 "type.ec"
	break;
      case 235: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4445 "type.ec"
	break;
      case 236: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4454 "type.ec"
	break;
      case 237: /* "statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4463 "type.ec"
	break;
      case 238: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4472 "type.ec"
	break;
      case 239: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4481 "type.ec"
	break;
      case 240: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4490 "type.ec"
	break;
      case 241: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4499 "type.ec"
	break;
      case 242: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4508 "type.ec"
	break;
      case 243: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4517 "type.ec"
	break;
      case 244: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4526 "type.ec"
	break;
      case 245: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4535 "type.ec"
	break;
      case 246: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4544 "type.ec"
	break;
      case 247: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4553 "type.ec"
	break;
      case 248: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4562 "type.ec"
	break;
      case 249: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4571 "type.ec"
	break;
      case 251: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4580 "type.ec"
	break;
      case 253: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4589 "type.ec"
	break;
      case 254: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4598 "type.ec"
	break;
      case 255: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4607 "type.ec"
	break;
      case 256: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4616 "type.ec"
	break;
      case 257: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4625 "type.ec"
	break;
      case 258: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4634 "type.ec"
	break;
      case 259: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4643 "type.ec"
	break;
      case 260: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4652 "type.ec"
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
#line 226 "type.y"
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
#line 244 "type.y"
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
#line 278 "type.y"
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
#line 327 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 329 "type.y"
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
#line 355 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 360 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 362 "type.y"
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
#line 379 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 381 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 386 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 391 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 396 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 398 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 403 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 409 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 414 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 420 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 424 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 426 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 433 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 434 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 439 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 440 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 441 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 442 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 449 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 455 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 456 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 457 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 458 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 459 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 460 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 461 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 465 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 466 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 467 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 468 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 472 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 473 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 474 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 475 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 476 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 477 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 478 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 479 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 480 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 494 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 496 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 497 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 498 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 499 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 500 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 505 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 510 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 511 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 512 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 517 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 518 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 529 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 537 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 538 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 540 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 545 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 546 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 556 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 561 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 566 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 571 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 576 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 581 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 582 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 586 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 587 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 588 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 589 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 590 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 591 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 592 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 593 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 594 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 595 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 596 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 600 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 601 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 609 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 610 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 611 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 612 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 616 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 627 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 635 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 636 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 640 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 653 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 678 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 679 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 680 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 682 "type.y"
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
#line 700 "type.y"
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
#line 716 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 721 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 722 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 723 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 724 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 725 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 726 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 727 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 729 "type.y"
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
#line 747 "type.y"
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
#line 763 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 764 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 768 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 769 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 773 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 775 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 776 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 777 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 781 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 782 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 786 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 787 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 788 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 793 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 794 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 795 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 797 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 801 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 806 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 807 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 882 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 889 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 900 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 901 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 906 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[(1) - (1)].templateDatatype)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 923 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 925 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 927 "type.y"
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

  case 288:

/* Line 1464 of yacc.c  */
#line 951 "type.y"
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

  case 289:

/* Line 1464 of yacc.c  */
#line 965 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 966 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 970 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 971 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 975 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 976 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 980 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 984 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 990 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1038 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1039 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1040 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1041 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1042 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1056 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1058 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1060 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1062 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1066 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1067 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1073 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1075 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1076 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1081 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1088 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1090 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1096 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1098 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1100 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1102 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1104 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1106 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1108 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1121 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1125 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1127 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1137 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1138 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1146 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1197 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1199 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1204 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1206 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1208 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1210 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1218 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1221 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1223 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1225 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1237 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1239 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1248 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1254 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1256 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1261 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1266 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1267 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1268 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1277 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1278 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1282 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1283 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1284 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1296 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1298 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1300 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1302 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[(2) - (2)].declarator));  ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1304 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1306 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1308 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1311 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1312 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1314 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1318 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1319 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1328 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1334 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1336 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1338 "type.y"
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

  case 431:

/* Line 1464 of yacc.c  */
#line 1354 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1356 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1378 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1380 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1394 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1396 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1402 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1403 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1407 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1411 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1415 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1416 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1417 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1421 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1426 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1434 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1438 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1443 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1444 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1452 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1463 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1464 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1468 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1473 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1475 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1480 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1482 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1507 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1509 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1511 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1518 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1520 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1524 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1526 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1528 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1530 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1532 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1538 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1540 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1545 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1549 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1550 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1555 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1557 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1562 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1566 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1567 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1570 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1576 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1577 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 505:

/* Line 1464 of yacc.c  */
#line 1581 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 506:

/* Line 1464 of yacc.c  */
#line 1582 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8383 "type.ec"
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
#line 1585 "type.y"


