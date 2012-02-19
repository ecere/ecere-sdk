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
#line 1 "grammar.y"

import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  (Current).start = (Rhs)[1].start;      \
  (Current).end = (Rhs)[N].end;
#endif

#define PRECOMPILER
extern File fileInput;
extern char * yytext;
OldList * ast;
int yylex();
int yyerror();
bool guess;
bool deleteWatchable = false;

#define MAX_STRUCT_LEVELS     256
AccessMode memberAccessStack[MAX_STRUCT_LEVELS];
int defaultMemberAccess = -1;

#define POP_DEFAULT_ACCESS    if(defaultMemberAccess > -1) defaultMemberAccess--;

#define uint _uint
default:



/* Line 189 of yacc.c  */
#line 105 "grammar.ec"

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
     EXT_ATTRIB = 334,
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
     DATABASE_OPEN = 363
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 35 "grammar.y"

   SpecifierType specifierType;
   int i;
   AccessMode declMode;
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
   AsmField asmField;

   Instantiation instance;
   MembersInit membersInit;
   MemberInit memberInit;
   ClassFunction classFunction;
   ClassDefinition _class;
   ClassDef classDef;
   PropertyDef prop;
   char * string;
   Symbol symbol;
   PropertyWatch propertyWatch;
   TemplateParameter templateParameter;
   TemplateArgument templateArgument;
   TemplateDatatype templateDatatype;
   
   DBTableEntry dbtableEntry;
   DBIndexItem dbindexItem;
   DBTableDef dbtableDef;



/* Line 214 of yacc.c  */
#line 291 "grammar.ec"
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
#line 316 "grammar.ec"

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
#define YYFINAL  261
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   35235

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  248
/* YYNRULES -- Number of rules.  */
#define YYNRULES  1247
/* YYNRULES -- Number of states.  */
#define YYNSTATES  2033

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   363

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   128,     2,     2,   122,   130,   125,     2,
     112,   113,   109,   126,   117,   127,   120,   129,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   121,   115,
     110,   116,   111,   133,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,   131,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   119,   132,   118,   114,     2,     2,     2,
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
     105,   106,   107,   108
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    11,    14,    16,    18,    20,
      25,    30,    33,    35,    39,    44,    48,    51,    54,    56,
      60,    63,    66,    69,    72,    75,    78,    81,    84,    86,
      89,    91,    94,    97,   100,   103,   106,   109,   111,   113,
     117,   119,   123,   127,   129,   131,   135,   139,   141,   145,
     149,   153,   157,   159,   162,   165,   167,   169,   172,   175,
     178,   181,   183,   186,   189,   191,   193,   196,   199,   201,
     204,   207,   210,   213,   215,   218,   221,   225,   230,   236,
     241,   245,   250,   253,   257,   262,   268,   273,   277,   282,
     288,   294,   299,   302,   306,   310,   314,   318,   321,   326,
     330,   334,   337,   342,   346,   349,   353,   356,   360,   363,
     365,   368,   372,   376,   380,   383,   385,   389,   393,   395,
     399,   403,   406,   411,   417,   421,   426,   430,   432,   436,
     440,   444,   447,   451,   454,   459,   465,   469,   474,   478,
     480,   484,   488,   491,   493,   496,   499,   502,   504,   507,
     513,   521,   531,   538,   547,   552,   559,   561,   564,   568,
     573,   577,   580,   583,   586,   588,   590,   595,   599,   603,
     607,   610,   613,   616,   621,   623,   626,   628,   632,   636,
     638,   640,   644,   652,   654,   657,   662,   664,   667,   670,
     672,   674,   677,   681,   685,   688,   691,   693,   695,   698,
     701,   703,   706,   709,   712,   715,   717,   720,   722,   724,
     727,   732,   737,   744,   747,   752,   757,   764,   766,   768,
     772,   774,   777,   782,   784,   786,   788,   790,   794,   796,
     798,   800,   804,   808,   812,   816,   820,   824,   826,   830,
     832,   835,   838,   842,   846,   852,   858,   865,   872,   875,
     878,   882,   886,   890,   894,   898,   902,   906,   910,   914,
     918,   922,   924,   926,   930,   932,   935,   940,   942,   944,
     949,   954,   960,   969,   971,   973,   976,   983,   990,   996,
    1002,  1009,  1016,  1022,  1028,  1036,  1044,  1051,  1058,  1066,
    1074,  1081,  1088,  1093,  1099,  1104,  1111,  1116,  1118,  1120,
    1122,  1124,  1128,  1130,  1133,  1136,  1139,  1141,  1146,  1151,
    1155,  1160,  1165,  1169,  1173,  1176,  1179,  1184,  1189,  1193,
    1198,  1202,  1206,  1209,  1212,  1214,  1219,  1224,  1228,  1233,
    1238,  1242,  1246,  1249,  1252,  1257,  1262,  1266,  1271,  1275,
    1279,  1282,  1285,  1287,  1289,  1293,  1297,  1299,  1301,  1305,
    1309,  1312,  1315,  1318,  1321,  1324,  1329,  1332,  1337,  1343,
    1349,  1351,  1353,  1355,  1357,  1359,  1361,  1363,  1365,  1367,
    1369,  1371,  1373,  1375,  1380,  1382,  1386,  1390,  1394,  1398,
    1402,  1406,  1408,  1412,  1416,  1420,  1424,  1426,  1430,  1434,
    1438,  1442,  1445,  1447,  1450,  1454,  1458,  1462,  1466,  1470,
    1474,  1478,  1480,  1484,  1488,  1492,  1496,  1500,  1504,  1508,
    1512,  1514,  1518,  1522,  1526,  1530,  1532,  1536,  1540,  1544,
    1548,  1550,  1554,  1558,  1562,  1566,  1568,  1572,  1576,  1578,
    1582,  1586,  1588,  1594,  1600,  1606,  1612,  1618,  1624,  1630,
    1636,  1642,  1648,  1654,  1660,  1666,  1672,  1678,  1684,  1686,
    1690,  1694,  1698,  1702,  1706,  1710,  1714,  1718,  1720,  1722,
    1724,  1726,  1728,  1730,  1732,  1734,  1736,  1738,  1740,  1742,
    1746,  1750,  1753,  1755,  1759,  1763,  1765,  1767,  1770,  1773,
    1777,  1781,  1785,  1789,  1793,  1797,  1801,  1803,  1806,  1809,
    1813,  1817,  1821,  1825,  1829,  1833,  1837,  1840,  1843,  1846,
    1849,  1853,  1856,  1862,  1869,  1876,  1878,  1880,  1882,  1884,
    1886,  1891,  1893,  1897,  1901,  1905,  1909,  1913,  1917,  1919,
    1923,  1927,  1931,  1935,  1937,  1941,  1945,  1949,  1953,  1955,
    1958,  1962,  1966,  1970,  1974,  1978,  1982,  1986,  1988,  1992,
    1996,  2000,  2004,  2008,  2012,  2016,  2020,  2022,  2026,  2030,
    2034,  2038,  2040,  2044,  2048,  2052,  2056,  2058,  2062,  2066,
    2070,  2074,  2076,  2080,  2084,  2086,  2090,  2094,  2096,  2102,
    2108,  2114,  2120,  2125,  2130,  2135,  2140,  2146,  2152,  2158,
    2164,  2169,  2174,  2179,  2184,  2190,  2196,  2202,  2208,  2214,
    2220,  2226,  2232,  2236,  2240,  2243,  2246,  2248,  2252,  2256,
    2260,  2264,  2266,  2269,  2273,  2277,  2280,  2283,  2286,  2288,
    2291,  2295,  2299,  2301,  2303,  2305,  2307,  2309,  2311,  2313,
    2315,  2317,  2319,  2321,  2323,  2325,  2329,  2333,  2335,  2339,
    2342,  2344,  2347,  2350,  2353,  2358,  2363,  2367,  2371,  2376,
    2382,  2387,  2394,  2401,  2406,  2412,  2417,  2424,  2431,  2434,
    2437,  2440,  2446,  2450,  2456,  2463,  2469,  2477,  2485,  2494,
    2503,  2511,  2519,  2523,  2527,  2531,  2536,  2540,  2546,  2552,
    2554,  2556,  2558,  2560,  2562,  2564,  2566,  2568,  2570,  2572,
    2575,  2577,  2579,  2581,  2583,  2585,  2587,  2589,  2591,  2593,
    2595,  2597,  2599,  2601,  2603,  2605,  2607,  2612,  2617,  2622,
    2624,  2626,  2628,  2630,  2632,  2634,  2636,  2638,  2640,  2642,
    2644,  2646,  2648,  2650,  2652,  2654,  2656,  2658,  2660,  2665,
    2670,  2675,  2677,  2679,  2682,  2685,  2689,  2695,  2698,  2702,
    2708,  2714,  2720,  2722,  2726,  2729,  2732,  2735,  2739,  2743,
    2747,  2751,  2755,  2759,  2763,  2767,  2769,  2771,  2776,  2780,
    2783,  2787,  2791,  2795,  2799,  2803,  2807,  2811,  2815,  2819,
    2823,  2827,  2831,  2833,  2835,  2837,  2840,  2842,  2845,  2847,
    2850,  2852,  2855,  2857,  2860,  2862,  2865,  2867,  2870,  2872,
    2875,  2877,  2880,  2882,  2885,  2887,  2890,  2892,  2895,  2897,
    2900,  2902,  2905,  2907,  2910,  2912,  2915,  2917,  2920,  2922,
    2925,  2927,  2930,  2932,  2935,  2937,  2940,  2942,  2945,  2947,
    2950,  2952,  2955,  2957,  2960,  2962,  2965,  2967,  2969,  2971,
    2974,  2976,  2979,  2981,  2984,  2986,  2989,  2994,  3000,  3002,
    3004,  3006,  3009,  3011,  3014,  3016,  3019,  3021,  3024,  3029,
    3035,  3037,  3040,  3042,  3045,  3047,  3050,  3052,  3055,  3057,
    3060,  3062,  3065,  3070,  3076,  3078,  3081,  3083,  3086,  3088,
    3091,  3093,  3096,  3098,  3101,  3103,  3106,  3111,  3117,  3121,
    3125,  3127,  3131,  3135,  3139,  3143,  3145,  3149,  3154,  3159,
    3164,  3168,  3171,  3175,  3179,  3183,  3187,  3190,  3193,  3196,
    3200,  3205,  3207,  3209,  3212,  3215,  3217,  3219,  3224,  3226,
    3230,  3233,  3237,  3241,  3245,  3249,  3254,  3259,  3264,  3267,
    3271,  3275,  3279,  3284,  3289,  3293,  3296,  3300,  3304,  3308,
    3313,  3318,  3320,  3323,  3326,  3330,  3332,  3334,  3337,  3340,
    3343,  3347,  3349,  3351,  3354,  3357,  3360,  3364,  3366,  3369,
    3373,  3376,  3378,  3381,  3384,  3388,  3392,  3394,  3397,  3400,
    3404,  3408,  3410,  3413,  3416,  3420,  3424,  3426,  3430,  3435,
    3437,  3442,  3445,  3451,  3455,  3457,  3459,  3461,  3463,  3465,
    3467,  3471,  3475,  3478,  3481,  3483,  3487,  3490,  3494,  3496,
    3500,  3504,  3506,  3509,  3513,  3517,  3519,  3522,  3524,  3527,
    3530,  3533,  3536,  3540,  3542,  3544,  3548,  3552,  3554,  3558,
    3563,  3567,  3572,  3576,  3580,  3585,  3589,  3594,  3596,  3600,
    3604,  3609,  3613,  3617,  3621,  3626,  3628,  3632,  3636,  3640,
    3644,  3648,  3650,  3654,  3657,  3659,  3661,  3663,  3665,  3667,
    3670,  3672,  3674,  3676,  3678,  3681,  3684,  3687,  3689,  3691,
    3693,  3695,  3697,  3700,  3702,  3704,  3709,  3711,  3715,  3716,
    3723,  3732,  3743,  3756,  3765,  3776,  3787,  3793,  3801,  3811,
    3823,  3831,  3841,  3851,  3855,  3860,  3865,  3869,  3873,  3877,
    3882,  3887,  3891,  3894,  3898,  3901,  3903,  3905,  3907,  3909,
    3911,  3914,  3918,  3921,  3924,  3927,  3931,  3935,  3938,  3944,
    3951,  3954,  3957,  3960,  3963,  3966,  3969,  3971,  3974,  3977,
    3981,  3983,  3986,  3988,  3991,  3994,  3996,  3999,  4002,  4005,
    4008,  4011,  4014,  4016,  4018,  4021,  4024,  4026,  4028,  4031,
    4034,  4036,  4039,  4042,  4044,  4047,  4049,  4052,  4055,  4061,
    4067,  4075,  4083,  4089,  4095,  4099,  4102,  4108,  4113,  4118,
    4126,  4133,  4140,  4146,  4154,  4161,  4166,  4174,  4184,  4188,
    4193,  4198,  4204,  4210,  4217,  4225,  4232,  4239,  4245,  4251,
    4256,  4260,  4263,  4265,  4268,  4273,  4277,  4283,  4288,  4292,
    4295,  4298,  4301,  4305,  4309,  4313,  4317,  4320,  4323,  4325,
    4327,  4332,  4336,  4340,  4343,  4348,  4352,  4356,  4359,  4361,
    4364,  4366,  4368,  4371,  4373,  4376,  4380,  4384,  4386,  4389,
    4392,  4395,  4399,  4404,  4409,  4412,  4415,  4418,  4421,  4423,
    4426,  4428,  4431,  4433,  4436,  4439,  4441,  4444,  4446,  4449,
    4452,  4455,  4458,  4460,  4463,  4466,  4470,  4472,  4474,  4475,
    4482,  4489,  4495,  4500,  4502,  4505,  4508,  4510,  4514,  4518,
    4523,  4525,  4527,  4530,  4533,  4540,  4547,  4554
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     371,     0,    -1,   206,   109,    -1,   206,   110,    -1,   139,
      -1,   206,   206,    -1,    28,    -1,    28,    -1,   137,    -1,
     137,   110,   200,   111,    -1,   137,   110,   200,    11,    -1,
     292,   315,    -1,   315,    -1,   292,   112,   113,    -1,   114,
     292,   112,   113,    -1,    78,   292,   315,    -1,    78,   315,
      -1,   292,   316,    -1,   316,    -1,    78,   292,   316,    -1,
      78,   316,    -1,   140,   355,    -1,   143,   355,    -1,   143,
     115,    -1,   141,   355,    -1,   142,   355,    -1,   140,   115,
      -1,   140,   356,    -1,   144,    -1,   143,   356,    -1,   145,
      -1,   145,   115,    -1,   291,   315,    -1,   291,   317,    -1,
     291,   316,    -1,   148,   355,    -1,   148,   356,    -1,   149,
      -1,   148,    -1,   213,   116,   320,    -1,   320,    -1,   213,
     116,   321,    -1,   213,   116,     1,    -1,   321,    -1,   152,
      -1,   154,   117,   152,    -1,   155,   117,   152,    -1,   153,
      -1,   154,   117,   153,    -1,   155,   117,   153,    -1,   154,
     117,     1,    -1,   155,   117,     1,    -1,   117,    -1,   154,
     115,    -1,   155,   115,    -1,   156,    -1,   150,    -1,   159,
     156,    -1,   159,   150,    -1,   157,   156,    -1,   157,   150,
      -1,   115,    -1,   159,   115,    -1,   157,   115,    -1,   157,
      -1,   154,    -1,   157,   154,    -1,   159,   154,    -1,   151,
      -1,   158,   151,    -1,   159,   151,    -1,   157,   151,    -1,
     157,   155,    -1,   155,    -1,   154,     1,    -1,   161,   118,
      -1,   161,     1,   118,    -1,   291,   206,   119,   159,    -1,
     291,   206,   119,   158,     1,    -1,   291,   206,   119,   158,
      -1,   291,   206,   119,    -1,   291,   206,   119,     1,    -1,
     163,   118,    -1,   163,     1,   118,    -1,   292,   206,   119,
     159,    -1,   292,   206,   119,   158,     1,    -1,   292,   206,
     119,   158,    -1,   292,   206,   119,    -1,   292,   206,   119,
       1,    -1,   293,   206,   119,   158,   118,    -1,   293,   206,
     119,   159,   118,    -1,   293,   206,   119,   118,    -1,   166,
     118,    -1,   166,     1,   118,    -1,   139,   119,   158,    -1,
     206,   119,   158,    -1,   139,   119,   159,    -1,   139,   119,
      -1,   139,   119,   158,     1,    -1,   139,   119,     1,    -1,
     206,   119,   159,    -1,   206,   119,    -1,   206,   119,   158,
       1,    -1,   206,   119,     1,    -1,   168,   118,    -1,   168,
       1,   118,    -1,   119,   159,    -1,   119,   158,     1,    -1,
     119,     1,    -1,   119,    -1,   119,   158,    -1,   213,   116,
     320,    -1,   213,   116,   321,    -1,   213,   116,     1,    -1,
     213,     1,    -1,   169,    -1,   171,   117,   169,    -1,   172,
     117,   169,    -1,   170,    -1,   171,   117,   170,    -1,   172,
     117,   170,    -1,   171,     1,    -1,    68,   297,   206,   119,
      -1,    68,   297,   312,   206,   119,    -1,    68,   297,   119,
      -1,    68,   297,   312,   119,    -1,    68,     1,   119,    -1,
     173,    -1,   174,    69,   355,    -1,   174,    70,   355,    -1,
     174,    95,   355,    -1,   174,    91,    -1,   174,    97,   208,
      -1,   174,   118,    -1,    99,   297,   206,   119,    -1,    99,
     297,   312,   206,   119,    -1,    99,   297,   119,    -1,    99,
     297,   312,   119,    -1,    99,     1,   119,    -1,   176,    -1,
     177,    69,   355,    -1,   177,    70,   355,    -1,   177,   118,
      -1,   206,    -1,   179,   206,    -1,   179,   355,    -1,    73,
     355,    -1,   180,    -1,   181,   180,    -1,    88,   112,   179,
     113,   355,    -1,    88,   112,   234,   113,   119,   181,   118,
      -1,   234,   120,    88,   112,   234,   113,   119,   181,   118,
      -1,    89,   112,   234,   117,   179,   113,    -1,   234,   120,
      89,   112,   234,   117,   179,   113,    -1,    89,   112,   234,
     113,    -1,   234,   120,    89,   112,   234,   113,    -1,    90,
      -1,    90,   179,    -1,   213,   120,    90,    -1,   234,   120,
      90,   179,    -1,   292,   279,   115,    -1,   292,   115,    -1,
     165,   115,    -1,   162,   115,    -1,   146,    -1,   175,    -1,
     343,   292,   279,   115,    -1,   343,   292,   115,    -1,   343,
     165,   115,    -1,   343,   162,   115,    -1,   343,   146,    -1,
     343,   175,    -1,   171,   115,    -1,    98,   292,   279,   115,
      -1,   178,    -1,   182,   115,    -1,    91,    -1,    92,   206,
     115,    -1,    92,   139,   115,    -1,    93,    -1,    94,    -1,
      96,   206,   115,    -1,    99,   112,   206,   113,   116,   320,
     115,    -1,   115,    -1,   343,   121,    -1,   343,   112,   206,
     113,    -1,   147,    -1,   163,     1,    -1,   166,     1,    -1,
     162,    -1,   165,    -1,   343,   147,    -1,   343,   163,     1,
      -1,   343,   166,     1,    -1,   343,   162,    -1,   343,   165,
      -1,   172,    -1,   186,    -1,   188,   186,    -1,   189,   186,
      -1,   187,    -1,   188,     1,    -1,   189,     1,    -1,   188,
     187,    -1,   189,   187,    -1,   291,    -1,   291,   312,    -1,
     206,    -1,   190,    -1,    65,   206,    -1,    65,   206,   116,
     191,    -1,    65,   206,   121,   190,    -1,    65,   206,   121,
     190,   116,   191,    -1,    65,   138,    -1,    65,   138,   116,
     191,    -1,    65,   138,   121,   190,    -1,    65,   138,   121,
     190,   116,   191,    -1,   206,    -1,   206,    -1,   206,   116,
     193,    -1,   258,    -1,   190,   206,    -1,   190,   206,   116,
     195,    -1,   192,    -1,   194,    -1,   196,    -1,   197,    -1,
     198,   117,   197,    -1,   195,    -1,   193,    -1,   191,    -1,
     206,   116,   195,    -1,   206,   116,   193,    -1,   206,   116,
     191,    -1,   190,   116,   195,    -1,   190,   116,   193,    -1,
     190,   116,   191,    -1,   199,    -1,   200,   117,   199,    -1,
      65,    -1,   201,   206,    -1,   201,   137,    -1,   206,   201,
     206,    -1,   206,   201,   137,    -1,   201,   206,   110,   198,
     111,    -1,   201,   137,   110,   198,   111,    -1,   206,   201,
     206,   110,   198,   111,    -1,   206,   201,   137,   110,   198,
     111,    -1,   205,   118,    -1,   204,   115,    -1,   202,   119,
     118,    -1,   204,   119,   118,    -1,   201,   206,   115,    -1,
     201,   136,   115,    -1,   202,   121,   296,    -1,   202,   119,
     189,    -1,   204,   119,   189,    -1,   202,   119,   188,    -1,
     204,   119,   188,    -1,   202,   119,     1,    -1,   204,   119,
       1,    -1,     3,    -1,   209,    -1,   112,   236,   113,    -1,
     366,    -1,   122,   366,    -1,   122,   366,   120,   366,    -1,
     206,    -1,   165,    -1,    85,   112,   355,   113,    -1,    85,
     112,   236,   113,    -1,    85,   112,   327,   113,   318,    -1,
      85,   112,   327,   113,   112,   327,   113,   318,    -1,     4,
      -1,   208,    -1,   112,   113,    -1,    71,   299,   313,   123,
     258,   124,    -1,    71,   299,   313,   123,   259,   124,    -1,
      71,   299,   123,   258,   124,    -1,    71,   299,   123,   259,
     124,    -1,   102,   299,   313,   123,   258,   124,    -1,   102,
     299,   313,   123,   259,   124,    -1,   102,   299,   123,   258,
     124,    -1,   102,   299,   123,   259,   124,    -1,    72,   258,
     298,   313,   123,   258,   124,    -1,    72,   258,   298,   313,
     123,   259,   124,    -1,    72,   258,   298,   123,   258,   124,
      -1,    72,   258,   298,   123,   259,   124,    -1,   103,   258,
     298,   313,   123,   258,   124,    -1,   103,   258,   298,   313,
     123,   259,   124,    -1,   103,   258,   298,   123,   258,   124,
      -1,   103,   258,   298,   123,   259,   124,    -1,    65,   112,
     291,   113,    -1,    65,   112,   291,   312,   113,    -1,    65,
     112,   206,   113,    -1,   104,   112,   234,   117,   327,   113,
      -1,    98,   112,   206,   113,    -1,   378,    -1,   379,    -1,
     380,    -1,   381,    -1,   123,   215,   124,    -1,   167,    -1,
     168,     1,    -1,   112,   236,    -1,   112,   256,    -1,   207,
      -1,   213,   123,   236,   124,    -1,   213,   123,   256,   124,
      -1,   213,   112,   113,    -1,   213,   112,   215,   113,    -1,
     213,   112,   216,   113,    -1,   213,   120,   206,    -1,   213,
       7,   206,    -1,   213,     8,    -1,   213,     9,    -1,   238,
     123,   236,   124,    -1,   238,   123,   256,   124,    -1,   238,
     112,   113,    -1,   238,   112,   215,   113,    -1,   238,   120,
     206,    -1,   238,     7,   206,    -1,   238,     8,    -1,   238,
       9,    -1,   209,    -1,   214,   123,   236,   124,    -1,   214,
     123,   256,   124,    -1,   214,   112,   113,    -1,   214,   112,
     215,   113,    -1,   214,   112,   216,   113,    -1,   214,   120,
     206,    -1,   214,     7,   206,    -1,   214,     8,    -1,   214,
       9,    -1,   239,   123,   236,   124,    -1,   239,   123,   256,
     124,    -1,   239,   112,   113,    -1,   239,   112,   215,   113,
      -1,   239,   120,   206,    -1,   239,     7,   206,    -1,   239,
       8,    -1,   239,     9,    -1,   234,    -1,   210,    -1,   215,
     117,   234,    -1,   215,   117,   210,    -1,   255,    -1,   211,
      -1,   215,   117,   255,    -1,   215,   117,   211,    -1,   215,
     117,    -1,     8,   218,    -1,     9,   218,    -1,   220,   221,
      -1,   220,   210,    -1,     6,   112,   218,   113,    -1,     6,
     219,    -1,     6,   112,   328,   113,    -1,     6,   112,    65,
     136,   113,    -1,     6,   112,    65,   135,   113,    -1,   217,
      -1,   213,    -1,   217,    -1,   214,    -1,   125,    -1,   109,
      -1,   126,    -1,   127,    -1,   114,    -1,   128,    -1,    73,
      -1,    84,    -1,   218,    -1,   112,   327,   113,   221,    -1,
     221,    -1,   222,   109,   221,    -1,   222,   129,   221,    -1,
     222,   130,   221,    -1,   244,   109,   221,    -1,   244,   129,
     221,    -1,   244,   130,   221,    -1,   222,    -1,   223,   126,
     222,    -1,   223,   127,   222,    -1,   245,   126,   222,    -1,
     245,   127,   222,    -1,   223,    -1,   224,    10,   223,    -1,
     224,    11,   223,    -1,   246,    10,   223,    -1,   246,    11,
     223,    -1,   226,   110,    -1,   224,    -1,   225,   224,    -1,
     226,   111,   224,    -1,   226,    12,   224,    -1,   226,    13,
     224,    -1,   247,   110,   224,    -1,   247,   111,   224,    -1,
     247,    12,   224,    -1,   247,    13,   224,    -1,   226,    -1,
     227,    14,   226,    -1,   227,    15,   226,    -1,   248,    14,
     226,    -1,   248,    15,   226,    -1,   227,    14,   210,    -1,
     227,    15,   210,    -1,   248,    14,   210,    -1,   248,    15,
     210,    -1,   227,    -1,   228,   125,   227,    -1,   249,   125,
     227,    -1,   228,   125,   210,    -1,   249,   125,   210,    -1,
     228,    -1,   229,   131,   228,    -1,   250,   131,   228,    -1,
     229,   131,   210,    -1,   250,   131,   210,    -1,   229,    -1,
     230,   132,   229,    -1,   251,   132,   229,    -1,   230,   132,
     210,    -1,   251,   132,   210,    -1,   230,    -1,   231,    16,
     230,    -1,   252,    16,   230,    -1,   231,    -1,   232,    17,
     231,    -1,   253,    17,   231,    -1,   232,    -1,   232,   133,
     236,   121,   233,    -1,   232,   133,   256,   121,   233,    -1,
     253,   133,   236,   121,   233,    -1,   253,   133,   256,   121,
     233,    -1,   232,   133,   237,   121,   233,    -1,   232,   133,
     257,   121,   233,    -1,   253,   133,   237,   121,   233,    -1,
     253,   133,   257,   121,   233,    -1,   232,   133,   236,   121,
     210,    -1,   232,   133,   256,   121,   210,    -1,   253,   133,
     236,   121,   210,    -1,   253,   133,   256,   121,   210,    -1,
     232,   133,   237,   121,   210,    -1,   232,   133,   257,   121,
     210,    -1,   253,   133,   237,   121,   210,    -1,   253,   133,
     257,   121,   210,    -1,   233,    -1,   218,   235,   234,    -1,
     241,   235,   234,    -1,   233,   235,   234,    -1,   254,   235,
     234,    -1,   218,   235,   210,    -1,   241,   235,   210,    -1,
     233,   235,   210,    -1,   254,   235,   210,    -1,   116,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     234,    -1,   236,   117,   234,    -1,   256,   117,   234,    -1,
     256,   113,    -1,   210,    -1,   236,   117,   210,    -1,   256,
     117,   210,    -1,   212,    -1,     1,    -1,   213,     1,    -1,
     166,     1,    -1,   213,     7,     1,    -1,   238,     7,     1,
      -1,   213,   112,   215,    -1,   213,   112,   216,    -1,   213,
     120,     1,    -1,   238,   112,   216,    -1,   238,   120,     1,
      -1,     1,    -1,   214,     1,    -1,   166,     1,    -1,   214,
       7,     1,    -1,   239,     7,     1,    -1,   214,   112,   215,
      -1,   214,   112,   216,    -1,   214,   120,     1,    -1,   239,
     112,   216,    -1,   239,   120,     1,    -1,     8,   241,    -1,
       9,   241,    -1,   220,   243,    -1,   220,   211,    -1,     6,
     112,   241,    -1,     6,   242,    -1,     6,   112,   328,   113,
       1,    -1,     6,   112,    65,   136,   113,     1,    -1,     6,
     112,    65,   135,   113,     1,    -1,   240,    -1,   238,    -1,
     240,    -1,   239,    -1,   241,    -1,   112,   327,   113,   243,
      -1,   243,    -1,   222,   109,   243,    -1,   222,   129,   243,
      -1,   222,   130,   243,    -1,   244,   109,   243,    -1,   244,
     129,   243,    -1,   244,   130,   243,    -1,   244,    -1,   223,
     126,   244,    -1,   223,   127,   244,    -1,   245,   126,   244,
      -1,   245,   127,   244,    -1,   245,    -1,   224,    10,   245,
      -1,   224,    11,   245,    -1,   246,    10,   245,    -1,   246,
      11,   245,    -1,   246,    -1,   225,   246,    -1,   226,   111,
     246,    -1,   226,    12,   246,    -1,   226,    13,   246,    -1,
     247,   110,   246,    -1,   247,   111,   246,    -1,   247,    12,
     246,    -1,   247,    13,   246,    -1,   247,    -1,   227,    14,
     247,    -1,   227,    15,   247,    -1,   248,    14,   247,    -1,
     248,    15,   247,    -1,   227,    14,   211,    -1,   227,    15,
     211,    -1,   248,    14,   211,    -1,   248,    15,   211,    -1,
     248,    -1,   228,   125,   248,    -1,   249,   125,   248,    -1,
     228,   125,   211,    -1,   249,   125,   211,    -1,   249,    -1,
     229,   131,   249,    -1,   250,   131,   249,    -1,   229,   131,
     211,    -1,   250,   131,   211,    -1,   250,    -1,   230,   132,
     250,    -1,   251,   132,   250,    -1,   230,   132,   211,    -1,
     251,   132,   211,    -1,   251,    -1,   231,    16,   251,    -1,
     252,    16,   251,    -1,   252,    -1,   232,    17,   252,    -1,
     253,    17,   252,    -1,   253,    -1,   232,   133,   236,   121,
     253,    -1,   232,   133,   256,   121,   253,    -1,   253,   133,
     236,   121,   253,    -1,   253,   133,   256,   121,   253,    -1,
     232,   133,   236,   121,    -1,   232,   133,   256,   121,    -1,
     253,   133,   236,   121,    -1,   253,   133,   256,   121,    -1,
     232,   133,   237,   121,   253,    -1,   232,   133,   257,   121,
     253,    -1,   253,   133,   237,   121,   253,    -1,   253,   133,
     257,   121,   253,    -1,   232,   133,   237,   121,    -1,   232,
     133,   257,   121,    -1,   253,   133,   237,   121,    -1,   253,
     133,   257,   121,    -1,   232,   133,   236,   121,   211,    -1,
     232,   133,   256,   121,   211,    -1,   253,   133,   236,   121,
     211,    -1,   253,   133,   256,   121,   211,    -1,   232,   133,
     237,   121,   211,    -1,   232,   133,   257,   121,   211,    -1,
     253,   133,   237,   121,   211,    -1,   253,   133,   257,   121,
     211,    -1,   232,   133,   121,    -1,   253,   133,   121,    -1,
     232,   133,    -1,   253,   133,    -1,   254,    -1,   218,   235,
     255,    -1,   241,   235,   255,    -1,   218,   235,   211,    -1,
     241,   235,   211,    -1,   255,    -1,   234,     1,    -1,   236,
     117,   255,    -1,   256,   117,   255,    -1,   236,   236,    -1,
     256,   236,    -1,   236,   256,    -1,   211,    -1,   210,     1,
      -1,   236,   117,   211,    -1,   256,   117,   211,    -1,   233,
      -1,   254,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   206,    -1,   206,   116,   258,    -1,   206,
     116,   259,    -1,   262,    -1,   263,   117,   262,    -1,   263,
     117,    -1,    50,    -1,   264,   206,    -1,   264,   139,    -1,
     267,   118,    -1,   264,   206,   119,   118,    -1,   264,   139,
     119,   118,    -1,   264,   119,   263,    -1,   264,   119,     1,
      -1,   264,   206,   119,   263,    -1,   264,   206,   119,   263,
       1,    -1,   264,   206,   119,     1,    -1,   264,   206,   119,
     263,   115,   188,    -1,   264,   206,   119,   263,   115,   189,
      -1,   264,   139,   119,   263,    -1,   264,   139,   119,   263,
       1,    -1,   264,   139,   119,     1,    -1,   264,   139,   119,
     263,   115,   188,    -1,   264,   139,   119,   263,   115,   189,
      -1,   264,   206,    -1,   264,   139,    -1,   270,   118,    -1,
     268,   121,   296,   119,   118,    -1,   268,   119,   118,    -1,
     268,   121,   296,   119,   263,    -1,   268,   121,   296,   119,
     263,     1,    -1,   268,   121,   296,   119,     1,    -1,   268,
     121,   296,   119,   263,   115,   188,    -1,   268,   121,   296,
     119,   263,   115,   189,    -1,   268,   121,   296,   119,   263,
       1,   115,   188,    -1,   268,   121,   296,   119,   263,     1,
     115,   189,    -1,   268,   121,   296,   119,     1,   115,   188,
      -1,   268,   121,   296,   119,     1,   115,   189,    -1,   264,
     119,   263,    -1,   264,   119,     1,    -1,   268,   119,   263,
      -1,   268,   119,   263,     1,    -1,   268,   119,     1,    -1,
     268,   119,   263,   115,   188,    -1,   268,   119,   263,   115,
     189,    -1,   269,    -1,   286,    -1,   270,    -1,   287,    -1,
      75,    -1,   307,    -1,    44,    -1,    45,    -1,   273,    -1,
     274,    -1,   275,   274,    -1,    46,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,
      -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,
      -1,   283,    -1,   265,    -1,   136,    -1,    87,   112,   234,
     113,    -1,   100,   112,   136,   113,    -1,   100,   112,   206,
     113,    -1,    66,    -1,    82,    -1,    83,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,    85,    -1,   283,    -1,   265,    -1,   139,    -1,
      87,   112,   234,   113,    -1,   100,   112,   136,   113,    -1,
     100,   112,   206,   113,    -1,    66,    -1,   317,    -1,   317,
     308,    -1,   121,   258,    -1,   317,   121,   258,    -1,   317,
     121,   258,   121,   258,    -1,   121,   259,    -1,   317,   121,
     259,    -1,   317,   121,   258,   121,   259,    -1,   317,   121,
     259,   121,   259,    -1,   317,   121,   259,   121,   258,    -1,
     278,    -1,   279,   117,   278,    -1,   288,   206,    -1,   288,
     137,    -1,   282,   118,    -1,   280,   119,   118,    -1,   288,
     119,   118,    -1,   280,   119,   188,    -1,   280,   119,   189,
      -1,   280,   119,     1,    -1,   288,   119,   188,    -1,   288,
     119,   189,    -1,   288,   119,     1,    -1,   280,    -1,   280,
      -1,   280,   110,   198,   111,    -1,   284,   121,   296,    -1,
     287,   118,    -1,   285,   119,   118,    -1,   284,   119,   118,
      -1,   288,   119,   118,    -1,   285,   119,   188,    -1,   285,
     119,   189,    -1,   285,   119,     1,    -1,   284,   119,   188,
      -1,   284,   119,   189,    -1,   284,   119,     1,    -1,   288,
     119,   188,    -1,   288,   119,   189,    -1,   288,   119,     1,
      -1,    48,    -1,    49,    -1,   274,    -1,   289,   274,    -1,
     276,    -1,   289,   276,    -1,   266,    -1,   289,   266,    -1,
     281,    -1,   289,   281,    -1,   274,    -1,   290,   274,    -1,
     276,    -1,   290,   276,    -1,   135,    -1,   290,   135,    -1,
     266,    -1,   290,   266,    -1,   281,    -1,   290,   281,    -1,
     260,    -1,   291,   260,    -1,   274,    -1,   291,   274,    -1,
     277,    -1,   291,   277,    -1,   266,    -1,   291,   266,    -1,
     281,    -1,   291,   281,    -1,   260,    -1,   292,   260,    -1,
     274,    -1,   292,   274,    -1,   276,    -1,   292,   276,    -1,
     135,    -1,   292,   135,    -1,   281,    -1,   292,   281,    -1,
     266,    -1,   292,   266,    -1,   261,    -1,   293,   261,    -1,
     274,    -1,   293,   274,    -1,   276,    -1,   293,   276,    -1,
     135,    -1,   293,   135,    -1,   271,    -1,   293,   271,    -1,
     272,    -1,   293,   272,    -1,    81,    -1,    80,    -1,   260,
      -1,   295,   260,    -1,   274,    -1,   295,   274,    -1,   277,
      -1,   295,   277,    -1,   206,    -1,   295,   206,    -1,   206,
     110,   200,   111,    -1,   295,   206,   110,   200,   111,    -1,
     295,    -1,   288,    -1,   260,    -1,   297,   260,    -1,   274,
      -1,   297,   274,    -1,   277,    -1,   297,   277,    -1,   206,
      -1,   297,   206,    -1,   206,   110,   200,   111,    -1,   297,
     206,   110,   200,   111,    -1,   260,    -1,   298,   260,    -1,
     274,    -1,   298,   274,    -1,   277,    -1,   298,   277,    -1,
     281,    -1,   298,   281,    -1,   266,    -1,   298,   266,    -1,
     206,    -1,   298,   206,    -1,   206,   110,   200,   111,    -1,
     298,   206,   110,   200,   111,    -1,   260,    -1,   299,   260,
      -1,   274,    -1,   299,   274,    -1,   277,    -1,   299,   277,
      -1,   281,    -1,   299,   281,    -1,   266,    -1,   299,   266,
      -1,   206,    -1,   299,   206,    -1,   206,   110,   200,   111,
      -1,   299,   206,   110,   200,   111,    -1,   301,   117,     1,
      -1,   300,   117,     1,    -1,   206,    -1,   301,   117,   206,
      -1,   300,   117,   206,    -1,   331,   117,   206,    -1,   332,
     117,   206,    -1,   206,    -1,   112,   314,   113,    -1,   302,
     123,   258,   124,    -1,   302,   123,   259,   124,    -1,   302,
     123,   136,   124,    -1,   302,   123,   124,    -1,   302,   112,
      -1,   303,   333,   113,    -1,   303,   334,   113,    -1,   303,
     301,   113,    -1,   303,   300,   113,    -1,   303,   113,    -1,
     303,   300,    -1,   303,     1,    -1,   303,   331,   112,    -1,
     303,   292,   206,   112,    -1,   304,    -1,   302,    -1,   307,
     304,    -1,   307,   302,    -1,    74,    -1,   308,    -1,    86,
     112,   366,   113,    -1,    79,    -1,   112,   312,   113,    -1,
     123,   124,    -1,   123,   258,   124,    -1,   123,   259,   124,
      -1,   123,   136,   124,    -1,   309,   123,   124,    -1,   309,
     123,   258,   124,    -1,   309,   123,   136,   124,    -1,   309,
     123,   259,   124,    -1,   112,   113,    -1,   112,   333,   113,
      -1,   112,   334,   113,    -1,   309,   112,   113,    -1,   309,
     112,   333,   113,    -1,   309,   112,   334,   113,    -1,   112,
     313,   113,    -1,   112,   113,    -1,   112,   333,   113,    -1,
     112,   334,   113,    -1,   310,   112,   113,    -1,   310,   112,
     333,   113,    -1,   310,   112,   334,   113,    -1,   109,    -1,
     109,   275,    -1,   109,   311,    -1,   109,   275,   311,    -1,
     311,    -1,   309,    -1,   311,   309,    -1,   307,   311,    -1,
     307,   309,    -1,   307,   311,   309,    -1,   311,    -1,   310,
      -1,   311,   310,    -1,   307,   311,    -1,   307,   310,    -1,
     307,   311,   310,    -1,   306,    -1,   311,   306,    -1,   307,
     311,   306,    -1,   314,   307,    -1,   304,    -1,   311,   304,
      -1,   307,   304,    -1,   307,   311,   304,    -1,   311,   307,
     304,    -1,   305,    -1,   311,   305,    -1,   307,   305,    -1,
     307,   311,   305,    -1,   311,   307,   305,    -1,   302,    -1,
     311,   302,    -1,   307,   302,    -1,   307,   311,   302,    -1,
     311,   307,   302,    -1,   234,    -1,   119,   322,   118,    -1,
     119,   322,   117,   118,    -1,   255,    -1,   119,   322,   118,
       1,    -1,   119,   322,    -1,   119,   322,   117,   118,     1,
      -1,   119,   322,   117,    -1,   233,    -1,   210,    -1,   254,
      -1,   211,    -1,   318,    -1,   319,    -1,   322,   117,   318,
      -1,   322,   117,   319,    -1,   322,   318,    -1,   322,   319,
      -1,   314,    -1,   314,   116,   318,    -1,   314,     1,    -1,
     314,   116,   319,    -1,   323,    -1,   325,   117,   323,    -1,
     326,   117,   323,    -1,   324,    -1,   323,     1,    -1,   325,
     117,   324,    -1,   326,   117,   324,    -1,   289,    -1,   289,
     312,    -1,   290,    -1,   290,   312,    -1,   292,   314,    -1,
     292,   312,    -1,   292,   125,    -1,   292,   125,   314,    -1,
     292,    -1,    65,    -1,   292,   314,     1,    -1,   292,   312,
       1,    -1,   329,    -1,   331,   117,   329,    -1,   331,     1,
     117,   329,    -1,   332,   117,   329,    -1,   332,     1,   117,
     329,    -1,     1,   117,   329,    -1,   301,   117,   329,    -1,
     301,     1,   117,   329,    -1,   300,   117,   329,    -1,   300,
       1,   117,   329,    -1,   330,    -1,   331,   117,   330,    -1,
     332,   117,   330,    -1,   332,     1,   117,   330,    -1,     1,
     117,   330,    -1,   301,   117,   330,    -1,   300,   117,   330,
      -1,   300,     1,   117,   330,    -1,   331,    -1,   331,   117,
      51,    -1,   332,   117,    51,    -1,   301,   117,    51,    -1,
     300,   117,    51,    -1,     1,   117,    51,    -1,   332,    -1,
     331,   117,     1,    -1,   332,     1,    -1,   340,    -1,    79,
      -1,   355,    -1,   115,    -1,   121,    -1,   236,   115,    -1,
     358,    -1,   360,    -1,   362,    -1,   339,    -1,   185,   115,
      -1,   184,   115,    -1,   183,   115,    -1,   341,    -1,   361,
      -1,   356,    -1,   359,    -1,   363,    -1,   362,     1,    -1,
     256,    -1,   366,    -1,   366,   112,   234,   113,    -1,   337,
      -1,   338,   117,   337,    -1,    -1,    86,   274,   112,   366,
     113,   115,    -1,    86,   274,   112,   366,   121,   338,   113,
     115,    -1,    86,   274,   112,   366,   121,   338,   121,   338,
     113,   115,    -1,    86,   274,   112,   366,   121,   338,   121,
     338,   121,   338,   113,   115,    -1,    86,   274,   112,   366,
       3,   338,   113,   115,    -1,    86,   274,   112,   366,     3,
     338,   121,   338,   113,   115,    -1,    86,   274,   112,   366,
     121,   338,     3,   338,   113,   115,    -1,    86,   112,   366,
     113,   115,    -1,    86,   112,   366,   121,   338,   113,   115,
      -1,    86,   112,   366,   121,   338,   121,   338,   113,   115,
      -1,    86,   112,   366,   121,   338,   121,   338,   121,   338,
     113,   115,    -1,    86,   112,   366,     3,   338,   113,   115,
      -1,    86,   112,   366,     3,   338,   121,   338,   113,   115,
      -1,    86,   112,   366,   121,   338,     3,   338,   113,   115,
      -1,   206,   121,   335,    -1,    52,   258,   121,   335,    -1,
      52,   259,   121,   335,    -1,    52,   121,   335,    -1,    53,
     121,   335,    -1,   206,   121,   336,    -1,    52,   258,   121,
     336,    -1,    52,   259,   121,   336,    -1,    52,   121,   336,
      -1,    52,   121,    -1,    53,   121,   336,    -1,    53,   121,
      -1,    80,    -1,    81,    -1,    53,    -1,    80,    -1,    81,
      -1,   291,   115,    -1,   291,   325,   115,    -1,   160,   115,
      -1,   347,   115,    -1,   293,   115,    -1,   293,   325,   115,
      -1,   294,   325,   115,    -1,   164,   115,    -1,    77,   206,
     116,   233,   115,    -1,    31,    77,   206,   116,   233,   115,
      -1,   293,     1,    -1,   291,     1,    -1,   347,     1,    -1,
     161,     1,    -1,   160,     1,    -1,   291,   326,    -1,   344,
      -1,   348,   344,    -1,   349,   344,    -1,   348,     1,   115,
      -1,   347,    -1,   348,   347,    -1,   335,    -1,   350,   335,
      -1,   351,   335,    -1,   336,    -1,   350,   336,    -1,   351,
     336,    -1,   350,   344,    -1,   351,   344,    -1,   350,   347,
      -1,   351,   347,    -1,   350,    -1,   348,    -1,   348,   350,
      -1,   349,   350,    -1,   351,    -1,   349,    -1,   348,   351,
      -1,   349,   351,    -1,   119,    -1,   356,   118,    -1,   354,
     353,    -1,   354,    -1,   354,   352,    -1,   115,    -1,   236,
     115,    -1,   256,   115,    -1,    54,   112,   236,   113,   335,
      -1,    54,   112,   256,   113,   335,    -1,    54,   112,   236,
     113,   335,    64,   335,    -1,    54,   112,   256,   113,   335,
      64,   335,    -1,    55,   112,   236,   113,   335,    -1,    55,
     112,   256,   113,   335,    -1,    54,   112,   256,    -1,   358,
       1,    -1,    56,   112,   236,   113,   335,    -1,    56,   112,
     256,   335,    -1,    56,   112,   113,   335,    -1,    57,   335,
      56,   112,   236,   113,   115,    -1,    57,   335,    56,   112,
     256,   115,    -1,    58,   112,   357,   357,   113,   335,    -1,
      58,   112,   357,   113,   335,    -1,    58,   112,   357,   357,
     236,   113,   335,    -1,    58,   112,   357,   357,   256,   335,
      -1,    58,   112,   113,   335,    -1,    58,   112,   206,   121,
     236,   113,   335,    -1,    58,   112,   206,   121,   236,   115,
     236,   113,   335,    -1,    58,   112,     1,    -1,    58,   112,
     256,     1,    -1,    58,   112,   357,     1,    -1,    58,   112,
     357,   256,     1,    -1,    58,   112,   357,   357,   256,    -1,
      58,   112,   357,   357,   113,   336,    -1,    58,   112,   357,
     357,   236,   113,   336,    -1,    58,   112,   357,   357,   256,
     336,    -1,    57,   335,    56,   112,   236,   113,    -1,    57,
     335,    56,   112,   236,    -1,    57,   335,    56,   112,   256,
      -1,    57,   335,    56,   112,    -1,    57,   335,    56,    -1,
      57,   335,    -1,    57,    -1,    56,     1,    -1,    56,   112,
     113,     1,    -1,    56,   112,   256,    -1,    56,   112,   236,
     113,   336,    -1,    56,   112,   256,   336,    -1,    59,   206,
     115,    -1,    60,   115,    -1,    61,   115,    -1,    62,   115,
      -1,    62,   236,   115,    -1,    62,   256,   115,    -1,    62,
     210,   115,    -1,    62,   211,   115,    -1,    62,   256,    -1,
      62,   211,    -1,    62,    -1,    59,    -1,   293,   315,   348,
     355,    -1,   293,   315,   355,    -1,   315,   348,   355,    -1,
     315,   355,    -1,   293,   315,   348,   356,    -1,   293,   315,
     356,    -1,   315,   348,   356,    -1,   315,   356,    -1,     5,
      -1,   366,     5,    -1,   364,    -1,   203,    -1,   293,   203,
      -1,   345,    -1,    76,   366,    -1,    76,    31,   366,    -1,
      76,   206,   366,    -1,   115,    -1,   342,   364,    -1,   342,
     203,    -1,   342,   345,    -1,   342,    76,   366,    -1,   342,
      76,    31,   366,    -1,   342,    76,   206,   366,    -1,   342,
     121,    -1,    31,   121,    -1,   101,   206,    -1,   101,   139,
      -1,   372,    -1,   342,   372,    -1,   205,    -1,   293,   205,
      -1,   365,    -1,   342,   205,    -1,   342,   365,    -1,   346,
      -1,   342,   346,    -1,   368,    -1,   370,   368,    -1,   369,
     368,    -1,   370,     1,    -1,   369,     1,    -1,   367,    -1,
     370,   367,    -1,   369,   203,    -1,   369,   342,   203,    -1,
     370,    -1,   369,    -1,    -1,   105,   366,   206,   119,   377,
     118,    -1,   105,   366,   139,   119,   377,   118,    -1,   105,
     366,   119,   377,   118,    -1,   292,   206,   366,   115,    -1,
     206,    -1,   111,   206,    -1,   110,   206,    -1,   374,    -1,
     375,   117,   374,    -1,   107,   375,   115,    -1,   107,   375,
     206,   115,    -1,   373,    -1,   376,    -1,   377,   373,    -1,
     377,   376,    -1,   108,   112,   234,   117,   234,   113,    -1,
     106,   112,   366,   117,   206,   113,    -1,   107,   112,   366,
     117,   206,   113,    -1,   105,   112,   366,   113,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   263,   263,   292,   351,   352,   452,   456,   459,   460,
     461,   510,   512,   517,   522,   527,   529,   534,   536,   541,
     543,   548,   550,   552,   554,   556,   560,   565,   567,   569,
     571,   573,   579,   581,   586,   591,   596,   598,   600,   605,
     606,   610,   611,   622,   626,   627,   629,   634,   635,   637,
     640,   652,   663,   682,   684,   689,   690,   691,   692,   693,
     694,   695,   696,   697,   701,   702,   703,   704,   708,   709,
     710,   711,   712,   713,   714,   718,   720,   725,   727,   729,
     731,   733,   763,   765,   770,   772,   774,   776,   778,   807,
     809,   811,   816,   818,   823,   825,   829,   831,   833,   835,
     840,   843,   846,   849,   914,   916,   921,   923,   925,   927,
     929,   960,   964,   965,   966,   970,   971,   972,   976,   977,
     978,   979,   983,   986,   989,   992,   995,  1000,  1001,  1003,
    1005,  1007,  1009,  1014,  1018,  1021,  1024,  1027,  1030,  1035,
    1036,  1038,  1043,  1047,  1049,  1054,  1056,  1061,  1063,  1068,
    1073,  1075,  1080,  1082,  1084,  1086,  1091,  1093,  1095,  1097,
    1102,  1103,  1104,  1105,  1106,  1107,  1109,  1110,  1111,  1112,
    1113,  1114,  1116,  1117,  1118,  1119,  1120,  1121,  1122,  1123,
    1124,  1125,  1126,  1128,  1129,  1131,  1135,  1136,  1137,  1138,
    1139,  1141,  1142,  1143,  1144,  1145,  1147,  1151,  1152,  1153,
    1157,  1158,  1159,  1160,  1161,  1165,  1166,  1167,  1171,  1175,
    1176,  1177,  1178,  1179,  1180,  1181,  1182,  1186,  1190,  1191,
    1195,  1199,  1200,  1204,  1205,  1206,  1210,  1211,  1215,  1216,
    1217,  1218,  1219,  1220,  1221,  1233,  1245,  1260,  1261,  1265,
    1271,  1272,  1280,  1281,  1283,  1284,  1293,  1294,  1298,  1305,
    1312,  1318,  1325,  1331,  1340,  1347,  1353,  1359,  1365,  1371,
    1377,  1388,  1393,  1394,  1399,  1400,  1401,  1405,  1406,  1407,
    1408,  1409,  1410,  1411,  1412,  1413,  1414,  1415,  1416,  1417,
    1418,  1419,  1420,  1421,  1422,  1423,  1424,  1425,  1426,  1427,
    1428,  1429,  1430,  1431,  1432,  1433,  1435,  1436,  1437,  1438,
    1439,  1441,  1445,  1449,  1453,  1454,  1458,  1460,  1461,  1462,
    1463,  1464,  1465,  1466,  1467,  1468,  1470,  1471,  1472,  1473,
    1474,  1475,  1476,  1477,  1481,  1483,  1484,  1485,  1486,  1487,
    1488,  1489,  1490,  1491,  1493,  1494,  1495,  1496,  1497,  1498,
    1499,  1500,  1504,  1505,  1506,  1507,  1511,  1512,  1513,  1514,
    1515,  1519,  1520,  1521,  1522,  1523,  1524,  1525,  1526,  1527,
    1531,  1532,  1536,  1537,  1541,  1542,  1543,  1544,  1545,  1546,
    1547,  1548,  1552,  1553,  1557,  1558,  1559,  1560,  1561,  1562,
    1563,  1567,  1568,  1569,  1570,  1571,  1575,  1576,  1577,  1578,
    1579,  1583,  1591,  1592,  1593,  1594,  1595,  1596,  1597,  1598,
    1599,  1603,  1604,  1605,  1606,  1607,  1609,  1610,  1611,  1612,
    1616,  1617,  1618,  1620,  1621,  1625,  1626,  1627,  1629,  1630,
    1634,  1635,  1636,  1638,  1639,  1643,  1644,  1645,  1649,  1650,
    1651,  1655,  1656,  1657,  1658,  1659,  1661,  1662,  1663,  1664,
    1666,  1667,  1668,  1669,  1671,  1672,  1673,  1674,  1678,  1679,
    1680,  1681,  1682,  1684,  1685,  1686,  1687,  1691,  1692,  1693,
    1694,  1695,  1696,  1697,  1698,  1699,  1700,  1701,  1705,  1706,
    1707,  1708,  1712,  1713,  1714,  1718,  1719,  1720,  1721,  1723,
    1724,  1726,  1727,  1732,  1734,  1739,  1743,  1744,  1745,  1747,
    1748,  1750,  1751,  1756,  1758,  1763,  1767,  1768,  1769,  1770,
    1771,  1772,  1773,  1774,  1775,  1779,  1780,  1784,  1785,  1790,
    1791,  1795,  1796,  1797,  1798,  1799,  1800,  1801,  1805,  1806,
    1810,  1814,  1818,  1825,  1826,  1827,  1828,  1829,  1833,  1834,
    1885,  1886,  1887,  1888,  1889,  1890,  1891,  1895,  1896,  1897,
    1898,  1899,  1906,  1907,  1908,  1909,  1913,  1914,  1915,  1917,
    1918,  1922,  1923,  1924,  1926,  1927,  1931,  1932,  1933,  1935,
    1936,  1940,  1941,  1942,  1946,  1947,  1948,  1952,  1953,  1954,
    1955,  1956,  1957,  1958,  1959,  1960,  1962,  1963,  1964,  1965,
    1966,  1967,  1968,  1969,  1971,  1972,  1973,  1974,  1976,  1977,
    1978,  1979,  1981,  1988,  1992,  1996,  2003,  2004,  2008,  2013,
    2014,  2018,  2019,  2020,  2021,  2027,  2028,  2029,  2033,  2034,
    2035,  2036,  2040,  2042,  2046,  2047,  2048,  2049,  2050,  2054,
    2055,  2056,  2057,  2058,  2062,  2063,  2064,  2068,  2069,  2070,
    2074,  2078,  2079,  2083,  2084,  2085,  2089,  2090,  2092,  2093,
    2094,  2095,  2096,  2098,  2099,  2100,  2101,  2102,  2106,  2107,
    2111,  2112,  2113,  2117,  2118,  2119,  2120,  2121,  2122,  2123,
    2124,  2125,  2127,  2128,  2130,  2131,  2132,  2133,  2134,  2138,
    2139,  2143,  2144,  2148,  2149,  2153,  2154,  2155,  2160,  2161,
    2165,  2166,  2167,  2168,  2169,  2170,  2171,  2172,  2173,  2174,
    2175,  2176,  2177,  2178,  2179,  2180,  2181,  2182,  2183,  2184,
    2185,  2186,  2190,  2191,  2192,  2193,  2194,  2195,  2196,  2197,
    2198,  2199,  2200,  2201,  2202,  2203,  2204,  2205,  2206,  2207,
    2208,  2209,  2215,  2217,  2219,  2221,  2223,  2225,  2227,  2229,
    2231,  2233,  2238,  2239,  2243,  2249,  2258,  2259,  2260,  2264,
    2265,  2266,  2268,  2269,  2270,  2274,  2278,  2286,  2295,  2304,
    2305,  2307,  2308,  2312,  2319,  2326,  2329,  2342,  2356,  2359,
    2361,  2363,  2368,  2369,  2373,  2374,  2375,  2376,  2377,  2378,
    2379,  2380,  2384,  2385,  2386,  2387,  2388,  2389,  2390,  2391,
    2392,  2393,  2397,  2398,  2399,  2400,  2401,  2402,  2403,  2404,
    2405,  2406,  2410,  2411,  2412,  2413,  2414,  2415,  2416,  2417,
    2418,  2419,  2420,  2421,  2425,  2426,  2427,  2428,  2429,  2430,
    2431,  2432,  2433,  2434,  2438,  2439,  2443,  2444,  2445,  2446,
    2447,  2448,  2449,  2450,  2451,  2453,  2455,  2473,  2491,  2492,
    2496,  2497,  2498,  2499,  2500,  2501,  2502,  2503,  2504,  2522,
    2539,  2540,  2541,  2542,  2543,  2544,  2545,  2546,  2547,  2548,
    2549,  2550,  2551,  2569,  2586,  2587,  2588,  2589,  2590,  2591,
    2592,  2593,  2594,  2595,  2596,  2597,  2598,  2616,  2633,  2634,
    2638,  2639,  2640,  2641,  2642,  2646,  2647,  2648,  2649,  2650,
    2651,  2655,  2659,  2660,  2661,  2662,  2663,  2668,  2677,  2686,
    2695,  2709,  2710,  2711,  2713,  2758,  2759,  2760,  2772,  2777,
    2779,  2781,  2783,  2785,  2787,  2789,  2791,  2793,  2795,  2797,
    2799,  2801,  2803,  2805,  2810,  2812,  2814,  2816,  2818,  2820,
    2822,  2827,  2828,  2829,  2830,  2834,  2835,  2836,  2837,  2838,
    2839,  2843,  2844,  2845,  2846,  2847,  2848,  2852,  2853,  2855,
    2857,  2862,  2863,  2864,  2865,  2866,  2870,  2871,  2872,  2873,
    2874,  2878,  2879,  2880,  2881,  2882,  2886,  2887,  2888,  2904,
    2905,  2906,  2907,  2920,  2936,  2937,  2942,  2943,  2947,  2948,
    2949,  2950,  2953,  2954,  2958,  2959,  2963,  2967,  2971,  2972,
    2973,  2977,  2978,  2979,  2980,  2984,  2985,  2989,  2990,  2995,
    2996,  2997,  2998,  2999,  3000,  3019,  3020,  3024,  3025,  3026,
    3027,  3028,  3029,  3031,  3032,  3033,  3034,  3038,  3039,  3040,
    3041,  3042,  3044,  3045,  3046,  3050,  3051,  3052,  3053,  3054,
    3055,  3059,  3060,  3061,  3066,  3067,  3068,  3069,  3070,  3071,
    3072,  3073,  3074,  3075,  3076,  3077,  3078,  3082,  3083,  3084,
    3085,  3086,  3087,  3088,  3092,  3093,  3097,  3098,  3099,  3103,
    3104,  3105,  3106,  3108,  3109,  3110,  3112,  3113,  3114,  3115,
    3117,  3118,  3119,  3123,  3124,  3125,  3126,  3127,  3131,  3132,
    3133,  3134,  3135,  3136,  3137,  3141,  3142,  3143,  3147,  3148,
    3152,  3153,  3154,  3155,  3159,  3160,  3161,  3163,  3164,  3165,
    3169,  3173,  3174,  3176,  3177,  3178,  3182,  3183,  3184,  3185,
    3189,  3190,  3194,  3195,  3196,  3200,  3201,  3202,  3203,  3204,
    3205,  3206,  3210,  3211,  3212,  3213,  3217,  3218,  3219,  3220,
    3224,  3228,  3232,  3234,  3237,  3243,  3244,  3245,  3249,  3250,
    3251,  3252,  3253,  3254,  3258,  3259,  3263,  3264,  3265,  3267,
    3268,  3270,  3271,  3272,  3273,  3274,  3276,  3277,  3281,  3282,
    3283,  3284,  3288,  3289,  3290,  3291,  3293,  3294,  3295,  3296,
    3297,  3298,  3299,  3302,  3306,  3307,  3311,  3312,  3316,  3317,
    3318,  3319,  3320,  3321,  3322,  3323,  3327,  3328,  3329,  3330,
    3336,  3337,  3340,  3341,  3344,  3345,  3346,  3347,  3351,  3352,
    3364,  3365,  3368,  3371,  3373,  3374,  3375,  3385,  3387,  3388,
    3390,  3391,  3392,  3393,  3403,  3404,  3405,  3406,  3407,  3408,
    3412,  3413,  3421,  3423,  3424,  3426,  3428,  3432,  3433,  3434,
    3435,  3436,  3440,  3441,  3442,  3444,  3449,  3450,  3451,  3455,
    3456,  3457,  3461,  3465,  3466,  3467,  3471,  3472,  3476,  3477,
    3481,  3482,  3483,  3484,  3488,  3492,  3496,  3500
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
  "VIRTUAL", "EXT_ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT",
  "ANY_OBJECT", "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH",
  "STOPWATCHING", "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER",
  "CLASS_NO_EXPANSION", "CLASS_FIXED", "ISPROPSET",
  "CLASS_DEFAULT_PROPERTY", "PROPERTY_CATEGORY", "CLASS_DATA",
  "CLASS_PROPERTY", "SUBCLASS", "NAMESPACE", "NEW0OP", "RENEW0", "VAARG",
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "'*'", "'<'", "'>'",
  "'('", "')'", "'~'", "';'", "'='", "','", "'}'", "'{'", "'.'", "':'",
  "'$'", "'['", "']'", "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'",
  "'|'", "'?'", "$accept", "guess_type", "type", "base_strict_type",
  "base_strict_type_name", "strict_type",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start",
  "class_function_definition_start_error",
  "virtual_class_function_definition_start_error",
  "class_function_definition", "class_function_definition_error",
  "instance_class_function_definition_start",
  "instance_class_function_definition_start_error",
  "instance_class_function_definition",
  "instance_class_function_definition_error", "data_member_initialization",
  "data_member_initialization_error", "data_member_initialization_list",
  "data_member_initialization_list_error",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "members_initialization_list_error", "instantiation_named",
  "instantiation_named_error", "guess_instantiation_named",
  "guess_instantiation_named_error", "external_guess_instantiation_named",
  "instantiation_unnamed", "instantiation_unnamed_error",
  "instantiation_anon", "instantiation_anon_error", "default_property",
  "default_property_error", "default_property_list",
  "default_property_list_error", "property_start", "property_body",
  "property", "class_property_start", "class_property_body",
  "class_property", "watch_property_list", "property_watch",
  "property_watch_list", "self_watch_definition", "watch_definition",
  "stopwatching", "firewatchers", "struct_declaration",
  "struct_declaration_error", "struct_declaration_list",
  "struct_declaration_list_error", "template_datatype",
  "template_type_argument", "template_type_parameter",
  "template_identifier_argument", "template_identifier_parameter",
  "template_expression_argument", "template_expression_parameter",
  "template_parameter", "template_parameters_list", "template_argument",
  "template_arguments_list", "class_entry", "class_decl", "class",
  "class_head", "class_error", "identifier", "primary_expression",
  "i18n_string", "simple_primary_expression",
  "anon_instantiation_expression", "anon_instantiation_expression_error",
  "primary_expression_error", "postfix_expression",
  "simple_postfix_expression", "argument_expression_list",
  "argument_expression_list_error", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
  "cast_expression", "multiplicative_expression", "additive_expression",
  "shift_expression", "relational_expression_smaller_than",
  "relational_expression", "equality_expression", "and_expression",
  "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "expression_anon_inst", "postfix_expression_error",
  "simple_postfix_expression_error", "common_unary_expression_error",
  "unary_expression_error", "simple_unary_expression_error",
  "cast_expression_error", "multiplicative_expression_error",
  "additive_expression_error", "shift_expression_error",
  "relational_expression_error", "equality_expression_error",
  "and_expression_error", "exclusive_or_expression_error",
  "inclusive_or_expression_error", "logical_and_expression_error",
  "logical_or_expression_error", "conditional_expression_error",
  "assignment_expression_error", "expression_error",
  "expression_anon_inst_error", "constant_expression",
  "constant_expression_error", "storage_class_specifier",
  "external_storage_class_specifier", "enumerator", "enumerator_list",
  "enum_specifier", "enum_specifier_nocompound", "enum_specifier_compound",
  "enum_specifier_compound_error", "enum_decl", "enum_class",
  "enum_class_error", "class_specifier", "class_specifier_error",
  "ext_storage", "type_qualifier", "type_qualifier_list", "type_specifier",
  "strict_type_specifier", "struct_declarator", "struct_declarator_list",
  "struct_entry", "struct_or_union_specifier_compound",
  "struct_or_union_specifier_compound_error",
  "struct_or_union_specifier_nocompound", "struct_decl", "struct_head",
  "struct_class", "struct_class_error", "struct_or_union",
  "specifier_qualifier_list", "guess_specifier_qualifier_list",
  "declaration_specifiers", "guess_declaration_specifiers",
  "external_guess_declaration_specifiers",
  "external_guess_declaration_specifiers_error", "_inheritance_specifiers",
  "inheritance_specifiers", "property_specifiers", "renew_specifiers",
  "new_specifiers", "identifier_list_error", "identifier_list",
  "direct_declarator_nofunction", "direct_declarator_function_start",
  "direct_declarator_function", "direct_declarator_function_error",
  "direct_declarator", "ext_decl", "ext_attrib",
  "direct_abstract_declarator", "direct_abstract_declarator_noarray",
  "pointer", "abstract_declarator", "abstract_declarator_noarray",
  "declarator", "declarator_function", "declarator_function_error",
  "declarator_nofunction", "initializer", "initializer_error",
  "initializer_condition", "initializer_condition_error",
  "initializer_list", "init_declarator", "init_declarator_error",
  "init_declarator_list", "init_declarator_list_error", "type_name",
  "guess_type_name", "parameter_declaration",
  "parameter_declaration_error", "parameter_list", "parameter_list_error",
  "parameter_type_list", "parameter_type_list_error", "statement",
  "statement_error", "asm_field", "asm_field_list", "asm_statement",
  "labeled_statement", "labeled_statement_error", "declaration_mode",
  "member_access", "declaration", "external_guess_declaration",
  "external_guess_declaration_error", "declaration_error",
  "declaration_list", "declaration_list_error", "statement_list",
  "statement_list_error", "compound_inside", "compound_inside_error",
  "compound_start", "compound_statement", "compound_statement_error",
  "expression_statement", "selection_statement",
  "selection_statement_error", "iteration_statement",
  "iteration_statement_error", "jump_statement", "jump_statement_error",
  "function_definition", "function_definition_error", "string_literal",
  "external_declaration", "external_declaration_error",
  "translation_unit_error", "translation_unit", "thefile",
  "dbtable_definition", "dbfield_entry", "dbindex_item",
  "dbindex_item_list", "dbindex_entry", "dbfield_definition_list",
  "database_open", "dbfield", "dbindex", "dbtable", 0
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
     355,   356,   357,   358,   359,   360,   361,   362,   363,    42,
      60,    62,    40,    41,   126,    59,    61,    44,   125,   123,
      46,    58,    36,    91,    93,    38,    43,    45,    33,    47,
      37,    94,   124,    63
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   134,   135,   135,   136,   136,   137,   138,   139,   139,
     139,   140,   140,   141,   142,   143,   143,   144,   144,   145,
     145,   146,   146,   146,   146,   146,   146,   147,   147,   147,
     147,   147,   148,   148,   149,   150,   151,   151,   151,   152,
     152,   153,   153,   153,   154,   154,   154,   155,   155,   155,
     155,   155,   155,   156,   156,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   158,   158,   158,   158,   159,   159,
     159,   159,   159,   159,   159,   160,   160,   161,   161,   161,
     161,   161,   162,   162,   163,   163,   163,   163,   163,   164,
     164,   164,   165,   165,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   167,   167,   168,   168,   168,   168,
     168,   169,   170,   170,   170,   171,   171,   171,   172,   172,
     172,   172,   173,   173,   173,   173,   173,   174,   174,   174,
     174,   174,   174,   175,   176,   176,   176,   176,   176,   177,
     177,   177,   178,   179,   179,   180,   180,   181,   181,   182,
     183,   183,   184,   184,   184,   184,   185,   185,   185,   185,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   188,   188,   188,
     189,   189,   189,   189,   189,   190,   190,   190,   191,   192,
     192,   192,   192,   192,   192,   192,   192,   193,   194,   194,
     195,   196,   196,   197,   197,   197,   198,   198,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   200,   200,   201,
     202,   202,   202,   202,   202,   202,   202,   202,   203,   203,
     203,   203,   203,   203,   204,   205,   205,   205,   205,   205,
     205,   206,   207,   207,   208,   208,   208,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   210,   211,   212,   212,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   215,   215,   215,   215,   216,   216,   216,   216,
     216,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     218,   218,   219,   219,   220,   220,   220,   220,   220,   220,
     220,   220,   221,   221,   222,   222,   222,   222,   222,   222,
     222,   223,   223,   223,   223,   223,   224,   224,   224,   224,
     224,   225,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   227,   227,   227,   227,   227,   227,   227,   227,   227,
     228,   228,   228,   228,   228,   229,   229,   229,   229,   229,
     230,   230,   230,   230,   230,   231,   231,   231,   232,   232,
     232,   233,   233,   233,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   236,   236,
     236,   236,   237,   237,   237,   238,   238,   238,   238,   238,
     238,   238,   238,   238,   238,   238,   239,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   240,   240,   240,   240,
     240,   240,   240,   240,   240,   241,   241,   242,   242,   243,
     243,   244,   244,   244,   244,   244,   244,   244,   245,   245,
     245,   245,   245,   246,   246,   246,   246,   246,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   248,   248,   248,
     248,   248,   248,   248,   248,   248,   249,   249,   249,   249,
     249,   250,   250,   250,   250,   250,   251,   251,   251,   251,
     251,   252,   252,   252,   253,   253,   253,   254,   254,   254,
     254,   254,   254,   254,   254,   254,   254,   254,   254,   254,
     254,   254,   254,   254,   254,   254,   254,   254,   254,   254,
     254,   254,   254,   254,   254,   254,   255,   255,   255,   255,
     255,   256,   256,   256,   256,   256,   256,   256,   257,   257,
     257,   257,   258,   259,   260,   260,   260,   260,   260,   261,
     261,   261,   261,   261,   262,   262,   262,   263,   263,   263,
     264,   265,   265,   266,   266,   266,   267,   267,   267,   267,
     267,   267,   267,   267,   267,   267,   267,   267,   268,   268,
     269,   269,   269,   270,   270,   270,   270,   270,   270,   270,
     270,   270,   270,   270,   270,   270,   270,   270,   270,   271,
     271,   272,   272,   273,   273,   274,   274,   274,   275,   275,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   277,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   277,   278,   278,   278,   278,   278,   278,   278,   278,
     278,   278,   279,   279,   280,   280,   281,   281,   281,   282,
     282,   282,   282,   282,   282,   283,   284,   284,   285,   286,
     286,   286,   286,   287,   287,   287,   287,   287,   287,   287,
     287,   287,   288,   288,   289,   289,   289,   289,   289,   289,
     289,   289,   290,   290,   290,   290,   290,   290,   290,   290,
     290,   290,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   292,   292,   292,   292,   292,   292,   292,   292,
     292,   292,   292,   292,   293,   293,   293,   293,   293,   293,
     293,   293,   293,   293,   294,   294,   295,   295,   295,   295,
     295,   295,   295,   295,   295,   295,   295,   295,   296,   296,
     297,   297,   297,   297,   297,   297,   297,   297,   297,   297,
     298,   298,   298,   298,   298,   298,   298,   298,   298,   298,
     298,   298,   298,   298,   299,   299,   299,   299,   299,   299,
     299,   299,   299,   299,   299,   299,   299,   299,   300,   300,
     301,   301,   301,   301,   301,   302,   302,   302,   302,   302,
     302,   303,   304,   304,   304,   304,   304,   305,   305,   305,
     305,   306,   306,   306,   306,   307,   307,   307,   308,   309,
     309,   309,   309,   309,   309,   309,   309,   309,   309,   309,
     309,   309,   309,   309,   310,   310,   310,   310,   310,   310,
     310,   311,   311,   311,   311,   312,   312,   312,   312,   312,
     312,   313,   313,   313,   313,   313,   313,   314,   314,   314,
     314,   315,   315,   315,   315,   315,   316,   316,   316,   316,
     316,   317,   317,   317,   317,   317,   318,   318,   318,   319,
     319,   319,   319,   319,   320,   320,   321,   321,   322,   322,
     322,   322,   322,   322,   323,   323,   324,   324,   325,   325,
     325,   326,   326,   326,   326,   327,   327,   328,   328,   329,
     329,   329,   329,   329,   329,   330,   330,   331,   331,   331,
     331,   331,   331,   331,   331,   331,   331,   332,   332,   332,
     332,   332,   332,   332,   332,   333,   333,   333,   333,   333,
     333,   334,   334,   334,   335,   335,   335,   335,   335,   335,
     335,   335,   335,   335,   335,   335,   335,   336,   336,   336,
     336,   336,   336,   336,   337,   337,   338,   338,   338,   339,
     339,   339,   339,   339,   339,   339,   339,   339,   339,   339,
     339,   339,   339,   340,   340,   340,   340,   340,   341,   341,
     341,   341,   341,   341,   341,   342,   342,   342,   343,   343,
     344,   344,   344,   344,   345,   345,   345,   345,   345,   345,
     346,   347,   347,   347,   347,   347,   348,   348,   348,   348,
     349,   349,   350,   350,   350,   351,   351,   351,   351,   351,
     351,   351,   352,   352,   352,   352,   353,   353,   353,   353,
     354,   355,   356,   356,   356,   357,   357,   357,   358,   358,
     358,   358,   358,   358,   359,   359,   360,   360,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   361,   361,
     361,   361,   361,   361,   361,   361,   361,   361,   361,   361,
     361,   361,   361,   361,   361,   361,   361,   361,   362,   362,
     362,   362,   362,   362,   362,   362,   363,   363,   363,   363,
     364,   364,   364,   364,   365,   365,   365,   365,   366,   366,
     367,   367,   367,   367,   367,   367,   367,   367,   367,   367,
     367,   367,   367,   367,   367,   367,   367,   367,   367,   367,
     368,   368,   368,   368,   368,   368,   368,   369,   369,   369,
     369,   369,   370,   370,   370,   370,   371,   371,   371,   372,
     372,   372,   373,   374,   374,   374,   375,   375,   376,   376,
     377,   377,   377,   377,   378,   379,   380,   381
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     1,     2,     1,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     2,     1,     3,
       2,     2,     2,     2,     2,     2,     2,     2,     1,     2,
       1,     2,     2,     2,     2,     2,     2,     1,     1,     3,
       1,     3,     3,     1,     1,     3,     3,     1,     3,     3,
       3,     3,     1,     2,     2,     1,     1,     2,     2,     2,
       2,     1,     2,     2,     1,     1,     2,     2,     1,     2,
       2,     2,     2,     1,     2,     2,     3,     4,     5,     4,
       3,     4,     2,     3,     4,     5,     4,     3,     4,     5,
       5,     4,     2,     3,     3,     3,     3,     2,     4,     3,
       3,     2,     4,     3,     2,     3,     2,     3,     2,     1,
       2,     3,     3,     3,     2,     1,     3,     3,     1,     3,
       3,     2,     4,     5,     3,     4,     3,     1,     3,     3,
       3,     2,     3,     2,     4,     5,     3,     4,     3,     1,
       3,     3,     2,     1,     2,     2,     2,     1,     2,     5,
       7,     9,     6,     8,     4,     6,     1,     2,     3,     4,
       3,     2,     2,     2,     1,     1,     4,     3,     3,     3,
       2,     2,     2,     4,     1,     2,     1,     3,     3,     1,
       1,     3,     7,     1,     2,     4,     1,     2,     2,     1,
       1,     2,     3,     3,     2,     2,     1,     1,     2,     2,
       1,     2,     2,     2,     2,     1,     2,     1,     1,     2,
       4,     4,     6,     2,     4,     4,     6,     1,     1,     3,
       1,     2,     4,     1,     1,     1,     1,     3,     1,     1,
       1,     3,     3,     3,     3,     3,     3,     1,     3,     1,
       2,     2,     3,     3,     5,     5,     6,     6,     2,     2,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     3,     1,     2,     4,     1,     1,     4,
       4,     5,     8,     1,     1,     2,     6,     6,     5,     5,
       6,     6,     5,     5,     7,     7,     6,     6,     7,     7,
       6,     6,     4,     5,     4,     6,     4,     1,     1,     1,
       1,     3,     1,     2,     2,     2,     1,     4,     4,     3,
       4,     4,     3,     3,     2,     2,     4,     4,     3,     4,
       3,     3,     2,     2,     1,     4,     4,     3,     4,     4,
       3,     3,     2,     2,     4,     4,     3,     4,     3,     3,
       2,     2,     1,     1,     3,     3,     1,     1,     3,     3,
       2,     2,     2,     2,     2,     4,     2,     4,     5,     5,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     2,     1,     2,     3,     3,     3,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     1,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     1,     3,
       3,     3,     3,     3,     3,     3,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       3,     2,     1,     3,     3,     1,     1,     2,     2,     3,
       3,     3,     3,     3,     3,     3,     1,     2,     2,     3,
       3,     3,     3,     3,     3,     3,     2,     2,     2,     2,
       3,     2,     5,     6,     6,     1,     1,     1,     1,     1,
       4,     1,     3,     3,     3,     3,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     3,     3,     1,     2,
       3,     3,     3,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     1,     3,     3,     1,     5,     5,
       5,     5,     4,     4,     4,     4,     5,     5,     5,     5,
       4,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     3,     3,     2,     2,     1,     3,     3,     3,
       3,     1,     2,     3,     3,     2,     2,     2,     1,     2,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     3,     1,     3,     2,
       1,     2,     2,     2,     4,     4,     3,     3,     4,     5,
       4,     6,     6,     4,     5,     4,     6,     6,     2,     2,
       2,     5,     3,     5,     6,     5,     7,     7,     8,     8,
       7,     7,     3,     3,     3,     4,     3,     5,     5,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     1,     2,     2,     3,     5,     2,     3,     5,
       5,     5,     1,     3,     2,     2,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     1,     4,     3,     2,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     1,     1,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     1,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     1,     1,
       1,     2,     1,     2,     1,     2,     1,     2,     4,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     4,     5,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     4,     5,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     4,     4,     4,
       3,     2,     3,     3,     3,     3,     2,     2,     2,     3,
       4,     1,     1,     2,     2,     1,     1,     4,     1,     3,
       2,     3,     3,     3,     3,     4,     4,     4,     2,     3,
       3,     3,     4,     4,     3,     2,     3,     3,     3,     4,
       4,     1,     2,     2,     3,     1,     1,     2,     2,     2,
       3,     1,     1,     2,     2,     2,     3,     1,     2,     3,
       2,     1,     2,     2,     3,     3,     1,     2,     2,     3,
       3,     1,     2,     2,     3,     3,     1,     3,     4,     1,
       4,     2,     5,     3,     1,     1,     1,     1,     1,     1,
       3,     3,     2,     2,     1,     3,     2,     3,     1,     3,
       3,     1,     2,     3,     3,     1,     2,     1,     2,     2,
       2,     2,     3,     1,     1,     3,     3,     1,     3,     4,
       3,     4,     3,     3,     4,     3,     4,     1,     3,     3,
       4,     3,     3,     3,     4,     1,     3,     3,     3,     3,
       3,     1,     3,     2,     1,     1,     1,     1,     1,     2,
       1,     1,     1,     1,     2,     2,     2,     1,     1,     1,
       1,     1,     2,     1,     1,     4,     1,     3,     0,     6,
       8,    10,    12,     8,    10,    10,     5,     7,     9,    11,
       7,     9,     9,     3,     4,     4,     3,     3,     3,     4,
       4,     3,     2,     3,     2,     1,     1,     1,     1,     1,
       2,     3,     2,     2,     2,     3,     3,     2,     5,     6,
       2,     2,     2,     2,     2,     2,     1,     2,     2,     3,
       1,     2,     1,     2,     2,     1,     2,     2,     2,     2,
       2,     2,     1,     1,     2,     2,     1,     1,     2,     2,
       1,     2,     2,     1,     2,     1,     2,     2,     5,     5,
       7,     7,     5,     5,     3,     2,     5,     4,     4,     7,
       6,     6,     5,     7,     6,     4,     7,     9,     3,     4,
       4,     5,     5,     6,     7,     6,     6,     5,     5,     4,
       3,     2,     1,     2,     4,     3,     5,     4,     3,     2,
       2,     2,     3,     3,     3,     3,     2,     2,     1,     1,
       4,     3,     3,     2,     4,     3,     3,     2,     1,     2,
       1,     1,     2,     1,     2,     3,     3,     1,     2,     2,
       2,     3,     4,     4,     2,     2,     2,     2,     1,     2,
       1,     2,     1,     2,     2,     1,     2,     1,     2,     2,
       2,     2,     1,     2,     2,     3,     1,     1,     0,     6,
       6,     5,     4,     1,     2,     2,     1,     3,     3,     4,
       1,     1,     2,     2,     6,     6,     6,     4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
    1228,   261,     6,   619,   620,   621,   622,   623,   681,   682,
     683,   684,   685,   687,   690,   691,   688,   689,   675,   676,
     680,   686,   762,   763,   630,  1077,   239,   699,   895,   673,
       0,     0,   898,  1075,  1076,   700,   701,   692,     0,     0,
       0,     0,     0,   921,     0,  1197,   810,   695,     8,     4,
       0,     0,     0,  1191,     0,  1210,   875,   804,     0,   694,
       0,   669,   671,   812,   814,   677,   806,   808,   745,   693,
       0,     0,   670,   672,     0,     0,     0,     0,     0,   941,
     674,   896,     0,     0,     0,  1193,  1215,  1190,  1212,  1222,
    1217,     0,     0,     0,  1208,     0,  1205,  1188,     0,     0,
    1194,     0,     0,     0,     0,  1207,  1206,     0,   678,   922,
     674,   923,   875,   892,   891,   937,     0,     0,     0,     0,
    1087,     0,   241,   240,     0,     0,   249,     0,   248,     2,
       3,     0,     5,     0,   632,   631,     0,     0,   650,     0,
       0,     0,     0,   749,     0,   735,   734,  1090,   621,  1084,
     811,  1192,  1211,   875,   805,   813,   815,   807,   809,   941,
     674,     0,     0,     0,     0,   981,     0,     0,     0,   881,
       0,     0,   614,   615,   616,   617,   618,   994,   886,   798,
     870,   792,     0,   802,     0,   794,   796,   745,   800,     0,
       0,   993,     0,     0,   997,  1007,     0,     0,     0,     0,
     943,     0,   942,     0,   703,   704,   705,   706,   707,   709,
     712,   713,   710,   711,   702,   708,   721,   714,     0,     0,
    1120,   717,     0,     0,   782,   716,   788,   784,   786,   790,
     715,     0,  1096,     0,     0,     0,     0,  1183,  1187,   621,
       0,  1204,  1199,  1213,     0,  1200,  1216,  1198,  1214,  1209,
    1221,  1224,     0,     0,     0,     0,     0,  1219,  1220,  1223,
    1218,     1,     0,  1195,  1196,  1189,     0,     0,   476,   273,
       0,     0,     0,     0,     0,     0,   370,   371,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   365,     0,   368,
       0,     0,   364,   366,   367,   369,     0,   268,     0,   267,
     306,   274,   262,   475,     0,   360,   372,     0,   374,   381,
     386,   392,     0,   401,   410,   415,   420,   425,   428,   431,
     448,     0,   506,   505,   509,   511,   518,   523,   528,   537,
     546,   551,   556,   561,   564,   567,     0,   264,   297,   298,
     299,   300,     0,     0,     0,     0,     0,   679,   924,   894,
     893,     0,   938,     0,   876,   940,   714,   717,   208,   230,
     229,   228,   237,     0,   267,   372,   431,   612,   509,     0,
     220,   205,   253,     0,     0,   252,   259,     0,     0,  1078,
    1079,   692,     0,   176,     0,   179,   180,     0,     0,     0,
       0,     0,   183,   250,     4,     0,     0,     0,     0,    28,
      30,   164,   186,   189,     0,   190,     0,   115,   118,     0,
     196,   127,     0,   165,   139,     0,   174,     0,   197,   200,
       0,     0,   267,     0,     0,     0,     0,   946,   674,     0,
      12,    18,     0,   817,   816,   824,   818,     0,   820,   822,
     745,   829,   828,   254,   260,   251,     0,     0,   243,   242,
     663,   624,   627,   662,   666,   652,     0,     0,     0,     0,
     223,   224,   225,   226,     0,   218,   476,   751,     0,     0,
     748,   476,   750,     0,     0,   476,   752,     0,     0,     0,
     943,     0,   942,     0,   976,     0,     0,  1181,  1185,   982,
    1085,     0,     0,  1086,   880,     0,   267,   613,     0,     0,
       0,     0,   632,   631,   633,     0,   736,     0,     0,     0,
     991,   799,   875,   793,   803,   795,   797,   801,   674,   926,
     925,     0,     0,     0,   885,     0,     0,   884,     0,     0,
       0,  1023,     0,   882,   883,   944,   945,     0,     0,  1094,
    1082,  1093,    75,  1091,  1080,   875,   783,   789,   785,   787,
     791,   674,     0,  1095,  1092,  1083,     0,  1097,     0,  1182,
    1186,  1098,     0,     0,     0,     0,     0,     0,     0,     0,
    1179,     0,     0,     0,  1025,     0,     0,     0,   156,  1027,
    1028,     0,     0,     0,   267,     0,   372,     0,     0,   509,
     596,   601,     0,  1102,  1105,  1033,  1024,  1037,     0,     0,
       0,     0,  1124,  1122,  1026,  1039,     0,  1040,  1031,  1038,
       0,  1041,  1121,     0,     0,  1201,   875,     0,     0,     0,
    1211,     0,     0,  1187,  1225,     0,     0,     0,   897,   486,
       0,     0,   324,     0,   362,   356,   508,   507,   501,     0,
     351,   496,   352,   497,     0,   864,   854,   862,   856,   858,
     860,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   275,     0,     0,     0,   768,   764,   766,   770,
     985,     0,   265,     0,   302,     0,   343,     0,   342,     0,
     478,    92,     0,   477,     0,   314,   315,     0,     0,     0,
     458,   459,   460,   461,   462,   463,   464,   465,   466,   467,
     457,     0,     0,   354,   499,   353,   498,     0,     0,     0,
       0,     0,     0,     0,   393,   529,     0,     0,   391,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   696,
       0,   322,   323,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   697,   698,     0,
       0,     0,  1240,  1241,     0,     0,     0,   939,     0,    10,
       9,     0,     0,     0,     0,     0,   674,   925,   206,     0,
     208,     0,   267,     0,     0,   836,   830,   832,   834,     0,
       0,     0,    16,    20,     0,     0,     0,     0,     0,     0,
       0,     0,   365,     0,   267,     0,    26,    21,    27,    24,
       0,    25,    23,    22,    29,    31,   163,   187,    82,   162,
     188,   121,   172,     0,     0,     0,     0,   131,     0,     0,
     133,     0,     0,   142,   175,   201,   198,   203,   202,   199,
     204,   114,     0,     0,   161,     0,   875,   732,     0,   951,
     674,     0,    11,    17,   722,   888,   993,     0,     0,   948,
       0,   947,     0,     0,   184,   170,   191,   194,     0,   195,
       0,   171,   875,     0,     0,   632,   631,   825,   819,   821,
     823,     0,     0,     0,   629,   665,     0,     0,     7,   213,
     209,   221,   747,     0,     0,    61,    52,    91,    38,    37,
      56,    68,    44,    47,     0,    73,    55,     0,     0,     0,
     965,   967,     0,   964,   966,     0,    40,    43,   944,   945,
       0,   956,   959,   975,   977,  1180,  1184,   979,   983,   980,
     984,   879,   877,   878,  1020,  1002,  1011,   637,   636,     0,
       0,   476,   737,     0,     0,   476,   738,     0,     0,   908,
     875,     0,     0,     0,     0,     0,   900,     0,     0,     0,
     992,   929,   928,     0,     0,   927,   996,   995,     0,   869,
    1019,   872,  1005,  1013,     0,   868,  1018,   871,  1003,  1012,
       0,  1022,  1016,   873,   998,  1008,     0,  1017,   874,  1000,
    1009,     0,     0,     0,    76,     0,  1081,  1099,     0,     0,
       0,     0,     0,     0,  1163,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1025,     0,   267,     0,  1161,  1030,
    1032,     0,     0,  1169,  1170,  1171,     0,  1177,     0,     0,
       0,     0,     0,     0,   157,   143,  1036,  1035,  1034,     0,
       0,     0,   602,     0,  1029,     0,     0,     0,     0,   471,
       0,     0,   476,     0,     0,     0,     0,  1103,  1106,  1108,
       0,  1104,  1107,  1109,     0,  1135,  1042,  1202,  1203,   241,
     240,     0,     0,     0,  1185,  1186,     0,  1088,     0,   776,
     267,     0,   500,   778,   772,   774,   780,   987,     0,   488,
     487,     0,   332,   333,     0,     0,     0,     0,   340,   341,
       0,     0,     0,     0,     0,     0,     0,     0,   865,   855,
     863,   857,   859,   861,   674,   932,   931,     0,   850,   840,
     848,   842,   844,   846,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   263,     0,   769,
     765,   767,   771,   986,     0,     0,   476,     0,     0,     0,
     104,     0,   301,   476,     0,     0,    93,   476,     0,     0,
     479,   313,   309,   347,   481,   482,   346,   483,   312,     0,
       0,   453,   449,   303,   375,   512,   376,   513,   377,   514,
     382,   519,   383,   520,   387,   524,   388,   525,   395,   531,
     396,   532,   394,   530,   406,   542,   402,   538,   407,   543,
     403,   539,   413,   549,   411,   547,   418,   554,   416,   552,
     423,   559,   421,   557,   426,   562,   429,   565,   592,     0,
     608,     0,     0,     0,     0,   455,   451,   480,   321,   318,
       0,   484,   485,   320,     0,     0,   454,   450,   378,   515,
     379,   516,   380,   517,   384,   521,   385,   522,   389,   526,
     390,   527,   399,   535,   400,   536,   397,   533,   398,   534,
     408,   544,   404,   540,   409,   545,   405,   541,   414,   550,
     412,   548,   419,   555,   417,   553,   424,   560,   422,   558,
     427,   563,   430,   566,   593,     0,     0,     0,     0,   456,
     452,     0,     0,  1233,  1236,     0,     0,  1231,  1242,  1243,
       0,     0,   208,   236,   235,   234,   267,   238,   233,   232,
     231,     0,     0,     0,     0,     0,     0,     0,     0,   928,
     245,     0,   244,   126,     0,   124,   837,   831,   833,   835,
       0,    15,    19,     0,   178,   177,   181,     0,   951,   674,
       0,   138,     0,   136,   837,     0,   267,     0,    83,   116,
     119,   117,   120,   128,   129,   130,   132,   140,   141,   113,
     111,   112,    13,   724,   727,     0,   160,     0,   953,     0,
     952,     0,     0,   723,   875,   889,   949,   950,   875,   169,
     192,   168,   193,   167,     0,     0,     0,     0,     0,   625,
     626,   628,     0,     0,   655,   651,     0,     0,     0,     0,
       0,     0,   227,   219,   217,    35,    36,    74,    53,     0,
      54,     0,    63,    60,    71,    66,    72,    59,    89,    38,
      69,    62,    90,    58,    70,    67,     0,    57,     0,    32,
      34,    33,   968,   969,     0,   645,   635,     0,   640,   634,
       0,   899,   909,   910,   903,   901,   902,   930,   911,     0,
       0,   904,     0,     0,     0,  1006,  1014,   993,  1004,   999,
    1001,  1010,   718,   719,   720,   476,     0,     0,  1066,  1071,
       0,     0,  1067,  1073,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1160,   476,     0,  1125,   267,     0,     0,
       0,  1168,  1174,  1175,  1172,  1173,     0,     0,     0,     0,
     144,  1063,  1068,   158,   599,   597,     0,     0,     0,   469,
     603,   600,   598,   470,   604,     0,  1184,  1089,     0,     0,
     355,   777,   779,   773,   775,   781,   988,     0,   489,   331,
     327,   491,   492,   493,   330,     0,     0,   490,   339,   336,
       0,   494,   495,   338,     0,     0,   294,   292,     0,     0,
     915,     0,     0,     0,     0,     0,     0,   935,   934,     0,
     933,     0,     0,     0,   851,   841,   849,   843,   845,   847,
       0,   270,     0,   269,   296,     0,     0,     0,     0,     0,
       0,  1247,     0,     0,     0,   373,   510,   266,   107,   105,
     345,   344,    98,   102,   310,     0,   311,   307,   308,   609,
       0,     0,     0,     0,     0,     0,   319,   316,   317,     0,
       0,     0,     0,  1235,  1234,  1238,     0,     0,     0,  1230,
    1229,     0,     0,     0,     0,     0,     0,     0,     0,   219,
       0,     0,   122,   125,     0,     0,   173,   953,     0,   952,
       0,     0,   134,   137,     0,    14,   476,     0,     0,   733,
       0,   954,   955,   725,   728,   890,   185,   166,   826,     0,
     247,   246,     0,   654,     0,   214,   207,   215,   210,   211,
     222,    50,    45,    48,    51,    46,    49,    36,    42,    39,
      41,     0,     0,   972,   973,   644,     0,   639,     0,   912,
     913,   906,   905,   907,   990,   989,    78,  1064,  1069,  1065,
    1070,     0,     0,     0,     0,   476,  1138,     0,     0,  1137,
    1167,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1145,     0,  1126,   476,  1127,   476,     0,     0,
       0,  1048,   897,  1048,     0,     0,   154,     0,     0,     0,
     159,     0,     0,   502,   328,   329,   325,   326,   337,   334,
     335,   293,   866,   914,   916,   917,   278,   279,     0,   936,
     918,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   271,   282,   283,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   349,   348,   473,   610,   440,   584,
     432,   568,   444,   588,   436,   576,   474,   611,   441,   585,
     433,   569,   445,   589,   437,   577,   442,   586,   434,   570,
     446,   590,   438,   578,   443,   587,   435,   571,   447,   591,
     439,   579,  1237,  1239,  1232,   838,     0,   123,   149,   954,
     955,     0,   135,    85,     0,     0,   827,     0,     0,     0,
       0,     0,     0,     0,     0,   970,   971,   960,     0,     0,
       0,     0,  1128,  1129,  1132,  1133,  1136,  1166,     0,     0,
       0,     0,     0,     0,     0,  1142,   476,     0,     0,     0,
    1046,     0,  1044,  1056,     0,  1048,     0,  1048,     0,     0,
       0,     0,   504,   503,   867,   919,   920,   276,   277,   852,
     286,   287,     0,     0,     0,     0,     0,   280,   281,   290,
     291,     0,     0,   295,  1245,  1246,  1244,   839,     0,   726,
     729,   731,   730,     0,     0,   216,   212,   962,     0,     0,
       0,     0,     0,     0,     0,  1156,  1140,     0,     0,  1141,
    1153,     0,  1144,  1155,     0,     0,  1048,     0,  1048,     0,
    1048,     0,  1049,     0,     0,     0,   147,     0,   152,     0,
     155,     0,   853,   284,   285,     0,     0,   957,   288,   289,
     182,  1130,  1131,     0,     0,  1139,  1146,     0,  1143,  1154,
    1060,  1047,     0,     0,     0,  1057,     0,     0,  1048,  1048,
       0,  1048,   146,   145,   150,   148,     0,     0,   373,   510,
     272,   958,     0,     0,  1045,     0,     0,  1048,  1053,     0,
       0,  1050,     0,     0,   153,  1147,  1061,  1062,  1058,     0,
       0,     0,     0,  1048,   151,     0,  1054,  1055,  1051,     0,
    1059,     0,  1052
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,   179,    47,    48,   889,   296,   395,   396,   397,   398,
     399,   400,   401,   402,   898,   899,   900,   901,   902,   903,
     904,   905,   906,   907,   908,   909,   222,   223,   403,   404,
      50,   297,   298,   674,   702,   407,   408,   409,   410,   411,
     412,   413,   414,   415,   416,  1955,  1956,  1957,   417,   581,
     582,   583,   418,   419,   420,   421,   358,   359,   460,   360,
     461,   361,   462,   463,   781,   362,   363,    51,    52,    53,
      54,    55,   299,   300,   301,   302,   910,   911,   303,   304,
     633,   677,  1165,   305,   586,   635,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   320,
     663,   756,   588,  1222,   322,   636,   323,   589,   638,   325,
     326,   327,   328,   329,   330,   331,   332,   333,   334,   335,
     590,   591,  1017,  1224,   370,   499,   181,    57,   452,   453,
     182,    59,   183,   184,    60,    61,    62,    63,    64,    65,
     185,   109,   186,   228,   847,   848,   187,   188,   189,    69,
      70,    71,    72,    73,   190,   670,  1087,   371,   425,    75,
      76,   442,   443,   790,  1124,   651,   951,   952,    77,   426,
      79,   427,   115,   110,    81,   519,  1115,   429,   521,  1117,
     118,   430,   431,   854,  1432,  1433,   916,   917,  1434,   164,
     165,   166,   167,   671,  1088,   194,   195,   196,   197,   198,
     199,   593,   594,  1880,  1881,   595,   596,   597,    84,   432,
     232,    85,    86,   233,   234,   235,   600,   601,   602,   603,
     236,   604,   810,  1500,  1019,   607,   608,   609,  1020,   611,
      87,    88,   337,    89,    90,    91,    92,    93,    94,   762,
    1294,  1295,   763,   764,   338,   339,   340,   341
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1422
static const int yypact[] =
{
   32830, -1422, -1422, -1422, -1422,   543, -1422, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
    1065,    70, -1422, -1422, -1422, -1422, -1422, -1422,   -78,   242,
     250,  1046,   179,  1175,  1356, -1422, -1422, -1422,    87, -1422,
     218,  1046,   868, -1422,    11,   274,   954, -1422,   541, -1422,
    1013, -1422,   505, -1422, -1422, -1422, -1422, -1422,  1328, -1422,
    1152,   305, -1422,   525,   713, 32478,  1356,   745, 33092, -1422,
     872, -1422,  1284, 35116, 31192, -1422, -1422, -1422, -1422, -1422,
   -1422, 32918, 32117,   707, -1422,    70, -1422, -1422,   179,   179,
     552,   686,   179, 25916,  1046, -1422, -1422,   913, -1422,  1175,
   -1422, -1422, -1422,   745, -1422, -1422,   872,  1284,   806, 20710,
   -1422,   655,   647,   254, 26641, 34728, -1422, 26757, -1422, -1422,
   -1422,  1046, -1422,  1341,  1348,  1370,    95, 34728, -1422, 34874,
   26873, 34728, 26989, -1422, 27105, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422,   274,   570, -1422, -1422, -1422, -1422, -1422,   479,
     872,  1284,   608, 35116,   266, -1422,  1399,   698,  1414, -1422,
   24602,   748, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
    1020, -1422,   764, -1422,   796, -1422, -1422,   808, -1422,   817,
     923, 30333,   317,   489, -1422, -1422,   533,   591,   853,   939,
   -1422,   268, -1422,   268, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,   914,   967,
   -1422, -1422,   164,    39, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, 32654, -1422, 15822,  6689,  5119, 15951, -1422,   944,  1012,
    1120, -1422, -1422,   274, 32566, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422,   505,   525, 33440, 35116, 33699, -1422, -1422, -1422,
   -1422, -1422,   983,   552,   552, -1422, 25916,   484, -1422, -1422,
   25989, 26062, 26062,   996, 34947, 25916, -1422, -1422,  1008,  1027,
   34947, 25916,  1035,  1057,  1064,  1074,  1094, -1422, 20934, -1422,
     179, 24675, -1422, -1422, -1422, -1422,  1118, -1422,    48,  1161,
   -1422, -1422, -1422, -1422, 11621, -1422,  1800, 24675, -1422,  1149,
     870,   600, 25916,  1124,  1231,  1177,  1224,  1292,  1403,   169,
    1800,  1323,   573, -1422,  1800, -1422,  1248,  1129,  1603,  1212,
    1366,  1318,  1359,  1342,  1482,   330,  1800,   552, -1422, -1422,
   -1422, -1422,  1388,    54, 34124,  1390,  1413, -1422, -1422,   745,
   -1422,  1284, -1422,   268, -1422, -1422,  1008,  1118,  1406, -1422,
   -1422, -1422, -1422,  1066,   814, -1422,   362, -1422, -1422,   434,
   -1422,  6547, -1422, 20822, 34874, -1422,   625, 34436, 33784, -1422,
   -1422,  1008,  1425, -1422,  1046, -1422, -1422,    70, 33869, 33614,
    4646, 34801, -1422, -1422,  1118,  1117,  1434,  1434,  1347, -1422,
    1453, -1422, -1422,  1456,    53,  1051,    99, -1422, -1422,   337,
    1477, -1422,  1416, -1422, -1422,   974, -1422,  1505, -1422, -1422,
   26177, 26293,    59,  1029,   573, 31380, 33179, -1422,   872,  1284,
   -1422, -1422, 31286, -1422, -1422,  1493, -1422,  1046, -1422, -1422,
   -1422,  1046, 34947, -1422,   625, -1422, 26409, 26525,  1523,  1527,
   -1422,  1543, -1422,  1545, -1422, -1422,  1220,  1575,  1125,    70,
   -1422, -1422, -1422, -1422,   -14,   117,  1024, -1422, 27221, 27337,
   -1422,  1257, -1422, 27453, 27569,  1308, -1422, 27685, 27801, 19046,
    1040,  1284,   479,   268, -1422, 24748,  6689, -1422,   944, -1422,
   -1422,  1356,  1356, -1422, -1422,  1553,   185, -1422,  1586,  1594,
   34509,  1579,  1584,  1601, -1422, 27917, -1422, 28033,  9867, 24821,
    1356, -1422,  1020, -1422, -1422, -1422, -1422, -1422,   189,   805,
     755,   710,   896,  1606, -1422, 34211,  1608, -1422, 34286,  1612,
   34361,  1613, 34582, -1422, -1422, -1422, -1422, 25916,  1046, -1422,
   -1422,  1614, -1422, -1422, -1422,  1616, -1422, -1422, -1422, -1422,
   -1422,   872,  1489,   698, -1422, -1422,  1622, -1422, 16080, -1422,
     944, -1422,   267, 24894,  1610,  1627,  1637,   530, 16209,  1639,
      70,  1625,  1633, 16338, 32742,  1365,  1642,  1645,    70, -1422,
   -1422,  1644,  1648,  1651,  1488, 14656,  1800,  7193, 22339,  1800,
    1800, -1422, 14790, -1422, -1422, -1422, -1422, -1422, 16467, 16596,
   16725, 16854, -1422, -1422, -1422,   944, 16983, -1422, -1422, -1422,
   17112, -1422, -1422,   179,   179,   552,   790,  1046,  1491,  1650,
   -1422, 35116,  6689, -1422, -1422, 33527, 25916,  1652, -1422, -1422,
   21062,   137, -1422, 11774, -1422, -1422,   894, -1422, -1422, 24967,
   -1422, -1422, -1422, -1422, 34947,  1664, -1422, -1422, -1422, -1422,
   -1422,  8938, 34947, 21190,    70, 30904, 34947, 25916,   179,   179,
     179, 25916, -1422, 11929, 12110, 12244, -1422, -1422, -1422, -1422,
    7013,  1658,   205, 19174, -1422,   144, -1422,   206, -1422, 19302,
    1654, -1422, 19430, -1422,  1620, -1422, -1422,  6739,  1624, 25916,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, 24675,   155, -1422, -1422, -1422, -1422, 25916, 25916, 25916,
   25916, 25916, 25916, 25916,   600,  1603, 25916, 25916, -1422, 25916,
   24675, 24675, 24675, 24675, 24675, 25916, 25916, 12378, 24675, -1422,
    1628, -1422, -1422,  8243,  1629, 25916, 24675, 25916, 25916, 25916,
   25916, 25916, 25916, 25916, 25916, 25916, 25916, 25916, 24675, 24675,
   24675, 24675, 24675, 25916, 25916, 12512, 24675, -1422, -1422,   849,
    1020, 34801, -1422, -1422, 32205, 34124, 34124, -1422, 20710, -1422,
   -1422, 20710, 20710, 24675, 24675, 11491,   730,   908, -1422,    86,
     287,   964,  1062,  1076,  1656,  1666, -1422, -1422, -1422,  1046,
    8000, 33784, -1422, -1422,    70,  1668,  1670,  1672, 31568,  1660,
      70,  9191,  1175, 21302,  1229, 33954, -1422, -1422,   944, -1422,
     944, -1422, -1422, -1422,   944, -1422, -1422,  1655, -1422, -1422,
     746, -1422, -1422,  3370,  3370,  1434,  1434, -1422,  1434,   130,
   -1422,  1434,  1434, -1422, -1422,  1075, -1422, -1422,  1075, -1422,
   -1422,  1221, 25040,  1309, -1422, 25916,   885, -1422,  1519,   745,
     872,  1284, -1422, -1422,   557,   748, 30333, 18918,   732, -1422,
     268, -1422,   268,  1356, -1422, -1422, -1422,  1673,   171,  1675,
     228, -1422,    59, 31474, 20710, -1422, -1422,  1667, -1422, -1422,
   -1422, 34874, 34874, 25916,    70, -1422, 30005,   338, -1422,   895,
    1000,  1665, -1422, 34874,    70, -1422, -1422, -1422,  1434, -1422,
   -1422, -1422, -1422, -1422,  9328,  1525, -1422, 19558, 10388, 19686,
   -1422, -1422, 11370, -1422, -1422, 34039, -1422, -1422,   479,  1040,
   24748, -1422, -1422, -1422, -1422, -1422,   944, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,  1545,   395,
     405,  1677, -1422, 28149, 28265,  1678, -1422, 28381, 28497, -1422,
     781,   501,   560,  1684,  1686,  1687, -1422,  1680,  1685,  1689,
     850,   805,   755, 33266, 25113,   805, -1422, -1422, 34655, -1422,
   -1422,  1020, -1422, -1422, 34655, -1422, -1422,  1020, -1422, -1422,
   34655, -1422, -1422,  1020, -1422, -1422, 34655, -1422,  1020, -1422,
   -1422,  1695,  1697,   408, -1422, 19814, -1422, -1422, 17241,  1690,
    1693, 17370, 25916, 25916, -1422, 25186, 25259,  1707,  1704,  1717,
   21517,  1719,    70, 22412, -1422,  1408,  1524, 22485,  1776, -1422,
   -1422, 22558,  1718, -1422, -1422, -1422,  1720,  1721, 22631, 14919,
     179,  1725, 25916, 25916,    70, -1422, -1422, -1422, -1422, 21645,
     319, 24675, -1422,  1237, -1422, 25916, 12646, 12780, 24675, -1422,
   25916, 12914,  1622, 17499, 17628, 17757, 17886, -1422, -1422, -1422,
   18015, -1422, -1422, -1422, 18144, -1422, -1422,   552,   552,  1728,
    1729, 30120, 30235,  6689, -1422, -1422,  1726, -1422,   580, -1422,
      59,  1730, -1422, -1422, -1422, -1422, -1422,  7013,  1731,  1654,
   -1422,  1643, -1422, -1422, 22704,  1646, 25916,  1662, -1422, -1422,
   22777,  1663, 25916,  1732, 35020, 20710, 33005, 25916,  1736, -1422,
   -1422, -1422, -1422, -1422,  1181,  1742,  1750,  1740,  1754, -1422,
   -1422, -1422, -1422, -1422, 31000, 22850,  1752,  1753,  1756, 25916,
    1744, 31096,  1757,   693,   301,   397,  1758, -1422,    70, -1422,
   -1422, -1422, -1422, -1422, 25916,   179,   370, 31662, 19942,  1724,
   -1422, 24675, -1422,   385, 31753, 20070, -1422,   409, 31844, 20198,
   -1422, -1422, -1422, -1422,  1404,  1765, -1422, -1422, -1422, 22923,
    5228, -1422, -1422,  1724, -1422, -1422, -1422, -1422, -1422, -1422,
    1149,  1248,  1149,  1248,   870,  1129,   870,  1129,   600,  1603,
     600,  1603,   600,  1603, -1422, -1422,  1124,  1212, -1422, -1422,
    1124,  1212, -1422, -1422,  1231,  1366, -1422, -1422,  1177,  1318,
   -1422, -1422,  1224,  1359,  1292,  1342,  1403,  1482, -1422,    42,
   -1422, 22996,  1749,  6075,  1759, -1422, -1422, -1422, -1422, -1422,
    1427, -1422, -1422, -1422, 23069,  6337, -1422, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422,  1149,  1248,  1149,  1248,   870,  1129,
     870,  1129,   600,  1603,   600,  1603,   600,  1603,   600,  1603,
   -1422, -1422,  1124,  1212, -1422, -1422,  1124,  1212, -1422, -1422,
    1231,  1366, -1422, -1422,  1177,  1318, -1422, -1422,  1224,  1359,
    1292,  1342,  1403,  1482, -1422, 23142,  1760,  9583,  1761, -1422,
   -1422,    70,    70, -1422, -1422,    85,  1099, -1422, -1422, -1422,
   32296, 32387, -1422, -1422, -1422, -1422,   610, -1422, -1422, -1422,
   -1422, 23215,  1762, 10091,  1763, 23288,  1764, 10789,  1766,   908,
   -1422, 20710, -1422, -1422, 20710, -1422,    77, -1422, -1422, -1422,
     609, -1422, -1422,   536, -1422, -1422, -1422,  1558,  1767,   872,
    1284, -1422,  1773, -1422,   221,   628,   834,  1778, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,  2534,
   -1422, -1422, -1422, -1422, -1422, 20326, -1422,  1165,   745,   268,
     745,   268, 25916, -1422,   976, -1422, -1422, -1422,  1779, -1422,
    1655, -1422,  1654, -1422,  1561,  1079, 20710,  1116,  1142, -1422,
   -1422, -1422, 28613, 28729,  1782, -1422,  1346, 34947, 34947, 34947,
   34947, 25916, -1422, -1422, -1422, -1422,   944, -1422, -1422, 25332,
   -1422, 25405, -1422, -1422, -1422,  1570,  1525, -1422, -1422,  1434,
   -1422, -1422, -1422, -1422, -1422,  1570,  1525, -1422, 25478, -1422,
   -1422, -1422, -1422, -1422, 18273, -1422, -1422,   248, -1422, -1422,
     318, -1422, -1422, -1422, -1422, -1422, -1422,   805, -1422,  1780,
    1785, -1422,  1775,  1777,  1783, -1422, -1422, 30333, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422,   411, 31935, 20454, -1422, -1422,
   21645, 21645, -1422, -1422, 23361, 15048, 23434, 23507, 21773, 23580,
   15177, 21517,  1781,  1787, 21517, 25916, 25551,  1844, 23653,  1721,
   10995,   179, 21517,  1791, 30715, 21517, -1422,  1567, 23726, 11173,
   23799, -1422, -1422, -1422, -1422, -1422,   145,   179,  1793,  1429,
   -1422, -1422, -1422, -1422, -1422, -1422,  1798,  1799,    70, -1422,
   -1422, -1422, -1422, -1422, -1422, 34874, -1422, -1422,  1801,  1805,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, 13048, -1422, -1422,
   -1422,  1432,  1806, -1422, -1422, 23872, 21901, -1422, -1422, -1422,
    1435, -1422, -1422, -1422, 23945, 21974, -1422, -1422,  1807,  1159,
   -1422,  1809,  1812,  1814,  1788,  1789, 20710,  1742,  1750, 33353,
    1742, 25916, 20710, 25916,  1823, -1422, -1422, -1422, -1422, -1422,
    1815, -1422, 25624, -1422, -1422,  1811,  1816, 25916, 25916,  1819,
    5766, -1422,    70,    70, 25916, -1422, -1422,   552, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, 13182, -1422, -1422, -1422, -1422,
   24675, 13316, 13450, 24675, 13584, 13718, -1422, -1422, -1422, 13852,
   13986, 14120, 14254, -1422, -1422, -1422,   849,  1824,   544, -1422,
   -1422, 24675, 24675, 24675, 24675, 24675, 24675, 24675, 24675,  1932,
    1172, 20710, -1422, -1422,  1825,  1434, -1422,  1767,   268,  1767,
     268,  1830, -1422, -1422,  1829, -1422,   415, 32026, 20582, -1422,
     872,   745,   745,  1828,  1831, -1422, -1422, -1422, -1422,  1217,
   -1422, -1422, 30005,  1835, 30005, -1422, -1422,  1837, -1422,  1838,
   -1422,  1187, -1422, -1422,  1187, -1422, -1422, -1422,  1187, -1422,
   -1422, 18402, 18531, -1422, -1422, -1422, 30005, -1422, 30005, -1422,
   -1422, -1422, -1422, -1422, -1422,   850, -1422, -1422, -1422, -1422,
   -1422, 21517,  8726, 21517,  8726, 30430, -1422, 21645, 15306, -1422,
   -1422, 21517, 21517, 24018, 21517, 24091, 21389,  1839, 22047, 24164,
     306, 18660, -1422, 25916, -1422, 30525, -1422, 30810, 21517, 22120,
   25697,   179,  1841,   179,   545,  1840, -1422,    70, 25916, 25916,
      70, 14388, 14522, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,  1262,  1742,
   -1422,  1845,  1847,  1842,  1843,  1317,  1846,  1848, 20710, 25916,
   20934, 24748, -1422, -1422, -1422,  1849,  1851,  1852,  1854, 25916,
    1850,  1856,  1858,  1866, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422,   434, -1422, -1422, -1422,   434, -1422, -1422, -1422, -1422,
   -1422,   434, -1422, -1422, -1422,   434, -1422, -1422, -1422,   434,
   -1422, -1422, -1422,   434, -1422, -1422, -1422,   434, -1422, -1422,
   -1422,   434, -1422, -1422, -1422, -1422,  1339, -1422, -1422,  1767,
    1767, 24675, -1422, -1422, 25916, 25916, -1422, 28845, 28961, 30005,
   29077, 29193, 34947, 34947, 18789, -1422, -1422, -1422, 29309, 29425,
   29541, 29657,  1898,  1900, -1422, -1422, -1422, -1422, 21517, 25916,
   25770,  1841, 15435, 15564, 22193, -1422, 30620, 21645, 24237, 15693,
   -1422,  1255,   412, -1422,   186,   179,  1865,   179,    61,   563,
    1868,  1437, -1422, -1422, -1422, -1422, -1422, -1422, -1422, -1422,
   -1422, -1422,  1343,  1859,  1860,  1869,  7442, -1422, -1422, -1422,
   -1422,  1861,  1862, -1422, -1422, -1422, -1422, -1422,  1873, -1422,
   -1422, -1422, -1422, 29773, 29889, -1422, -1422, -1422, 21517, 21517,
   24310, 22266, 21517, 24383, 21389,  1876, -1422, 21517, 25916, -1422,
   -1422, 21645, -1422, -1422,  1877,   179,   179, 25916,   179,  1878,
     179,  1391, -1422,   280,  1434,   654, -1422,   326, -1422,  1879,
   -1422,    70, -1422, -1422, -1422, 25843, 24456, -1422, -1422, -1422,
   -1422, -1422, -1422,  1876, 21517, -1422, -1422, 24529, -1422, -1422,
   -1422, -1422,  1442,  1882,  1445, -1422,  1402,  1884,   179,   179,
    1885,   179, -1422, -1422, -1422, -1422,    61,   584, -1422, -1422,
   -1422, -1422, 21517,  1886, -1422,  1888,  1889,   179, -1422,  1447,
    1448, -1422,  1426,   753, -1422, -1422, -1422, -1422, -1422,  1457,
    1892,  1894,  1897,   179, -1422,  1901, -1422, -1422, -1422,  1464,
   -1422,  1902, -1422
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
   -1422,   194,   -27,   134, -1422,  1936, -1422, -1422, -1422, -1422,
   -1422, -1422,  1533,  1583,  -894, -1422,  -838,  -799, -1298,   286,
    -613,  -612,  -442, -1422,  -650,  -634, -1422, -1422,  1589,  1590,
   -1422,  2781,  1287, -1422,  -230,   830,   858, -1422, -1422, -1422,
   -1422,  1591, -1422, -1422, -1422,  -572, -1420,    22, -1422, -1422,
   -1422, -1422,  1919,  2400,    72,   119,   -46,  -759, -1422,  -747,
   -1422,  -730, -1422,  1131,  -104,  1254,  -867,    -4,  1772,    31,
    1790,    80,     0, -1422,  1200,  1769,  4370,  4776, -1422,  3528,
   -1422,  -601,  -700,  1771,  4109, -1422, -1422,  -222,   650,   703,
      -7, -1422,   664,    -8,   110,   309,   247,   264,   -36,  8980,
    2590,  -219,  9494,  -398,  2007, -1422,  1784,  4916, -1422,  -153,
     762,   763,   160,   779,   390,   392,   430,   439,   463,   884,
    5199,   -72,  8525,   -83,    51,  1026,  6731,   -20,  1146,   -70,
    1661,  8277,  6838, -1422, -1422, -1422,   -80,    -3,   -12, -1422,
    6030, -1422,   151,   658,   666,  -521,  2342,  7539, -1422,  8400,
   -1422, -1422, -1422,   -73,  2670, -1422, -1422,  1621,  2772,   -38,
   -1422, -1422,  1450,  1647,  1375,  1755,   -68,   -58,  4115,  7600,
   10655,  -223,   -67,  3038,  1180,  -501, -1046, 10215,  -335,  -627,
     -16,    37,  -232,  1122,  -469,  -473,  -839,  -840,   261,  1199,
    1208,   -54,  1821,  -645, -1422,  -305,  -321,  1619, -1422,  -503,
    -493,  2572,  -353,   101,  -776, -1422, -1422, -1422,  1956, -1422,
     562,  1969,   -37,  1070,  -137,  1820,  1103,  1107, -1422, -1422,
   -1422,   -82,   209, -1421,   187, -1422, -1422, -1422,   213, -1422,
    1973,   -19,    60,  1966,  1636, -1422, -1422, -1422,  1975,  -760,
     436, -1422,  -737,   950, -1422, -1422, -1422, -1422
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1228
static const yytype_int16 yytable[] =
{
      56,   237,  1361,  1360,  1298,   954,  1034,  1385,  1126,  1303,
     192,   252,   924,  1308,  1419,   955,   923,   961,   253,   965,
     193,  1304,   168,  1147,   121,  1309,   486,  1299,  1130,  1154,
      99,   101,  1158,  1231,   102,   464,   778,    83,  1305,  1148,
     541,   106,  1310,  1609,   112,  1155,   244,   246,  1159,   680,
     352,   123,   131,   254,   817,   154,   132,     1,   135,   162,
     162,   675,     1,   156,     1,   248,   456,  1729,  1567,  1413,
    1570,  1423,   155,     1,   146,   153,   112,   342,   180,  1740,
     112,   487,   112,   366,    56,   705,  1164,   701,     1,     1,
     100,    56,    56,   459,   352,   262,   454,   892,     1,   598,
     820,   728,   107,   893,   343,   736,   151,   346,  1414,  1420,
    1424,  1682,   163,  1685,   888,   242,   112,   112,   622,   364,
    -207,    83,   251,   132,   422,   435,   126,   422,   255,    83,
     127,   449,  1230,   451,  1954,    97,   451,   435,  1089,   465,
     422,   435,   422,   495,   422,  1149,   793,  1403,  1741,   131,
     265,    67,   559,   132,   706,   152,  1173,   542,   263,   264,
     112,   112,   267,  -472,   243,   539,   681,   758,   129,   130,
     496,   818,  1380,   953,   252,   522,   252,   552,   682,   936,
     132,   253,   503,   253,    97,   122,   726,  1641,     1,  1948,
     146,   512,     1,   853,    46,   935,  1642,   119,   644,   446,
    1625,   112,  1626,   112,   973,   859,   861,   979,   145,   985,
     265,   990,   468,   455,   473,   162,   477,   681,   625,   246,
     972,   498,  1333,   978,   154,   984,   158,   989,   162,  1382,
     366,   545,   156,   894,   154,    67,   584,   248,  1559,   366,
     614,   155,    67,    67,   616,   366,   447,  1058,  1062,  1695,
     617,   155,   290,  1419,    56,   681,    56,     1,  1742,   469,
    1419,   474,  1150,   478,  1419,   448,  1743,   489,   554,   150,
     783,     1,   954,  1150,   645,   961,   965,  1337,    46,   540,
     645,   163,   955,  1989,   767,    46,    46,   624,   496,   818,
       1,   621,   238,   255,  1415,  1416,  1425,  1426,    43,  1949,
     615,   508,   727,  1945,   682,   714,   265,  1950,  1870,  1741,
    1423,   265,   509,   807,   809,   811,   813,  1423,   523,  1697,
    1167,  1423,     1,  1151,   145,  1145,   652,   780,   459,     1,
    1152,  1641,   656,   120,   620,  1143,   243,   366,   821,  1394,
    1652,     1,   516,   132,   760,  1466,   681,   754,  1420,  1424,
     672,   112,  1384,   112,   103,  1420,  1424,  1286,   857,  1420,
    1424,  1467,   104,  1696,   374,   884,  -643,  1041,   193,   375,
    1048,  -108,   488,   782,   465,  1312,  1316,   785,   512,   726,
      44,  -978,   555,  -978,   796,   511,   -99,   797,   760,   785,
     804,   760,   128,  1990,  1542,   158,  1435,  1945,     1,  1954,
    1551,  1991,   265,   768,   925,   158,  1438,    67,     1,  1513,
    -103,     1,   -81,   922,   767,   792,   -88,   265,  1592,  1871,
     422,   422,   132,   606,   142,   846,   180,  1743,   112,   112,
     524,   938,   872,  1698,   525,   884,  -638,   876,   150,   668,
     953,   146,   877,   560,  1994,   605,   422,   422,   150,   610,
      46,   754,   822,   352,   823,  1330,  1395,  1640,   890,   891,
    1449,  1447,   852,   755,   623,  1417,  1345,  1427,   422,   422,
    1450,   675,   715,   422,   422,   162,   162,   422,   422,  1561,
    -891,   112,   957,   112,  1073,  1174,  1176,  1178,  -108,   265,
     526,   112,   112,  1541,   960,   773,   132,  1580,   675,  1550,
     760,   451,   523,   -99,  1589,   422,   675,   422,   950,   496,
     112,   992,   132,  1436,  1593,  1238,  1240,  1242,   112,  1669,
     112,  1464,  1769,  1439,  1947,   971,   675,  -103,   977,   -81,
     983,  1004,   988,   -88,   529,  1425,  1426,  1995,   993,     1,
    1298,  1298,  1425,  1426,     1,   252,  1425,  1426,  1885,   265,
     265,   112,   253,  -891,  1175,  1177,  1179,   265,  -891,  1332,
     958,   526,  1308,  1299,  1299,  -891,     1,   774,  1016,     2,
    1022,  1127,  1419,     1,  1639,   145,   516,   943,  1035,   947,
     730,   731,   732,     1,  1239,  1241,  1243,     1,  1690,  1689,
     366,  1310,   531,  1995,  -891,  -891,  -891,   628,   584,   584,
     584,   584,   527,  1562,   808,   154,   528,   814,     2,   484,
     712,   713,     1,  1563,   999,  1166,   132,  1070,   525,   511,
      95,  -207,   155,   138,   944,   512,   948,   859,   861,  1423,
    1080,     1,  -476,  -476,  -476,    26,    32,  1376,  1675,  1377,
    1678,   853,  1005,   143,  1103,  1469, -1015,  1456,  1473,  1645,
     530,  1108,  1118,   496,  1128,  1108,  1118,     1,  1886,  1834,
     133,  1166,   621,  1455,    96,  1461,  1887,  1420,  1424,  1458,
    1138,  1680,  1288,  1067,  1068,  1459,  1958,   528,  1372,   129,
     130,  1460,    28,  1430,  1161,   733,  1512,    32,  1168,   479,
    1314,  1318,   644,   734,    38,   926,   735,  2014,   265,  1768,
    1058,  1062,  1058,  1062, -1021,  1775,  1427,   261,   532,  1188,
    1190,   966,  1192,  1427,  1204,  1657,     1,  1427,  1133,  1134,
    1135,  -207,  1302,  -974,   485,  -974,  1302,  -207,  1643,   682,
    1228,  1658,   366,   529,  1233,   366,   366,  1252,  1254,  1256,
    1258,     2,  1270,  1353,  1354,  -476,  1355,  1653,  -476,  1357,
    1358,  1069,  1536,  -478,  -478,  -478,     1,   373,     1,  1293,
     132,  1296,    -8,  1419,   760,   760,   760,     1,  1306,  1558,
     372,   364,  1306,   220,  1836,   180,   158,  1387,  1388,   890,
     891,  1085,  -870,   439,     1,   606,   606,   606,   606,   146,
    1326,   512,     2,     1,  1035,   439,   557,   561,   512,   439,
    1342,  1344,   266,  1346,   668,   760,  1591,   605,   605,   605,
     605,   610,   610,   610,   610,   492,  1405,  1396,  1447,   150,
    1423,  1141,  -990,  -990,  1079,  -207,  1954,  -990,  1331,    28,
    1074,  1075,   144,  1208,    32,   459,   459,     1,   366,    43,
     522,    38,   775,   112,  1375, -1015,   132,   459,   922,   530,
     112,   112,     1,   509,  1425,  1426,  1374,   169,  1420,  1424,
     112,  1274,   112,  1378,  1156,   500,  -478,   508,   170,  1437,
    1440,  2024,   132,   846,   364,     1,  1189,  1191,   509,  1193,
      28,   465,   465,   501,   451,    32,   422,   451,     1,   549,
     129,   130,    38,   465,  1404,   767,  1363,   967,  -870,   129,
     130,  1097,  1098,  1099,  1253,  1255,  1257,  1259,  -875,   479,
     852,  1902,   516,  -875,   504,   112,     1,   963,   265,   354,
    -875,   675,  1595,   145,    28,  -207,     1,   505,   964,    32,
     772,  -207,   649,   682,  1389,   506,    38,  1452,   649,   451,
     451,     2,   516,   422,   422,  1790,  1750,   422,   422,   516,
     132,     2,  1429,   682,   668,   511,   516,     1,  1392,  1291,
    1292,  1694,   112,   180,   496,  1693,   533,  1884,   760,  1515,
      28,   132,  1214,  1520,   760,    32,  1522,   132,  1524,     1,
     760,    43,    38,   132,    44,   511,   760,   124,   132,   125,
    1216,  1596,   511,   132,   129,   130,   710,   711,   584,   511,
    1280,   584,  1918,   369,  1365,  1393,  1100,   516,  -989,  -989,
    1016,  1397,  1022,  -989,  1101,  1453,  1398,  1102,  1282,    26,
     775,  1497,  1166,     1,   516,  1427,   537,  -758,  1166,   549,
     841,   509,   344,  1212,  1510,   788,   684,   685,   686,   584,
    1168,  -893,   507,   831,   832,  1425,  1426,   788,   557,     1,
     511,  1529,   534,   584,   584,   584,   584,  1482,  -268,  -268,
    -268,  1278,   612,   129,   130,  -207,  1771,   511,     1,   366,
      97,   422,   422,  -207,     2,  1320,  1772,   769,   760,   538,
     132,   893,  -476,  -476,  -476,   129,   130,   760,  1665,    95,
    1506,  1539,   833,  1925,  1926,  1544,    98,  1548,  -758,   626,
     880,  1553,     1,  -758,    97,   364,   180,  1406,   644,  1951,
    -758,  1953,  1205,  1782,  -893,  1209,  1399,  1708,  1710,  -893,
     653,  1400,  1704,     1,  1574,    97,  -893,  1720,     1,   129,
     130,  1574,   136,  -758,   137,  1905,   716,   717,   132,   654,
    1271,   687,  -758,  1275,   446,   842,  1376,   657,  1377,   688,
     369,   613,   689,   888,  1213,  -893,  -893,  -893,  1564,   369,
     557,   561,  1059,  1063,  1215,   369,   819,  -268,     1,   658,
    1982,  -268,  1984,  -207,  1986,  1889,   659,   770,  1321,  -207,
    1585,   682,  1279,   771,   557,   606,   660,  1322,   606,  1217,
    1668,   447,  1281,   893,  -476,  -476,   771,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  1597,   661,   605,   129,   130,
     605,   610,  2009,  2010,   610,  2012,  1427,  1283,  1856,    18,
      19,   885,  1855,  -664,   744,   745,   606,  1670,  -477,  -477,
    -477,  2019,   806,   893,   718,   719,   220,   679,  1534,    28,
     606,   606,   606,   606,    32,   720,   721,  2029,   605,    28,
      29,    38,   610,  1671,    32,   740,   741,   369,   707,   893,
    -755,    38,   605,   605,   605,   605,   610,   610,   610,   610,
    1762,   140,  1528,   141,    43,  1302,   771,    44,   708,   709,
     682,  1531,  1526,  1835,    43,   366,   845,     1,   366,   771,
      43,  1623,  1624,  1106,  -664,  1627,   132,  -476,  -476,  -664,
     760,   760,   722,  -875,   558,   562,  -664,  -476,  -875,  1112,
    1122,  -761,     1,  1112,  1122,  -875,  -476,  -476,  -476,  -476,
    -476,  1306,   746,   747,   364,  1516,  1517,  1518,  1846,  -664,
    1644,  -755,  -664,  1510,   771,   886,  -755,   884,  -664,   112,
     112,  -477,   450,  -755,     1,  1654,   132,  1673,   682,  -653,
     366,  1302,  1677,  1302,  1679,   723,  1628,   737,    28,     1,
    1180,  1182,   922,    32,  1867,   366,  -755,   112,  1944,   112,
      38,   112,  1945,  1894,   132,  -755,  1946,   738,   739,   771,
     748,   749,  -761,    28,  1196,  1200,   364,  -761,    32,  1997,
    1244,  1246,   422,   422,  -761,    38,    44,  1676,  1676,  1676,
    1676,   675,   675,   675,   675,   675,   675,   675,   675,    18,
      19,   406,  1262,  1266,   406,  1184,  1186,  -761,    43,   725,
    -653,    44,  1362,  1663,   724,  -653,  -761,   406,  1899,   406,
      28,   406,  -653,  1694,   771,    32,   729,  1693,   139,    28,
      29,  1705,    38,   750,    32,  1248,  1250,  -746,  1329,  -746,
    1917,    38,    18,    19,  1962,  -653,   771,   512,  -653,  1329,
     771,  1674,   812,   884,  -653,    43,   220,  -649,    44,  -649,
     584,   584,  1181,  1183,   752,  1185,  1187,  1030,  1016,   459,
     584,  1016,    28,    29,  1016,   825,   826,    32,  1497,  -648,
     751,  -648,  1016,  1856,    38,  1016,  2000,  1855,   753,  1197,
    1201,   757,  1245,  1247,  1987,  1249,  1251,   827,  1945,   765,
     369,   828,  1988,   829,   490,  2006,   491,  1604,  1035,  1945,
    1491,  1605,   768,  2007,  1940,   465,  1943,  1263,  1267,   493,
     366,   491,   766,  1795,   830,   959,   366,   794,  1520,  2022,
    1616,  1524,  1746,  1945,  1605,  1754,  1747,  2023,  1758,  1605,
    1960,  1730,  1605,   220,  1961,  2003,   558,   631,  2005,  1945,
    2020,  2021,  1945,  1838,  1945,  1945,   364,  1744,   815,   180,
    2025,   816,   364,   549,  1945,   366,   366,  2031,   366,   366,
     937,  1945,     1,   366,   366,   366,   366,   457,  1979,  1000,
    1138,   470,  1791,  1792,   824,   366,   366,   366,   366,   366,
     366,   366,   366,   874,   996,   366,   491,   682,   516,  1039,
    1071,   675,   125,   742,   743,  1059,  1063,  1059,  1063,   922,
     834,  1160,  1773,     1,  1776,  1167,  1293,     1,  1687,  1227,
    1232,     1,     1,   881,  1366,   557,  1367,   882,  1785,  1787,
    1410,   364,  1411,   682,  1538,  1492,     1,  1543,   112,     1,
     112,   511,   369,  1349,  1351,   369,   369,   606,   606,   883,
     112,    58,   884,  1547,  1552,     1,     1,   606,   558,   562,
    1060,  1064,   422,  1646,   422,  1367,  1667,   931,  1367,   605,
     605,  1350,  1352,   610,   610,  1408,   682,  1409,  1733,   605,
     927,   929,   558,   610,   887,  1683,   422,  1686,   422,   928,
     930,  1053,  1055,   939,   231,  1054,  1056,   406,   406,   922,
     932,  1016,  1016,  1016,  1016,  1300,  1301,   584,   933,   870,
     940,  1016,  1016,   968,  1016,   974,  1016,   257,   260,   980,
     986,  1001,   994,   406,   406,   995,    58,   997,  1016,  1002,
    1023,   668,   366,  1998,  1847,    58,  1850,  1035,  1024,  1003,
    1510,  1021,    58,    58,  1032,   406,   406,  1033,   369,  1036,
     406,   406,   549,  1037,   406,   406,  1038,  1077,  1858,  1072,
    1860,  1144,  1156,  1348,  1105,  1323,  1324,  1386,   364,  1341,
     496,  1401,  1578,  1334,   231,  1335,   437,  1336,  1379,  1578,
    1381,  1848,   406,  1851,   406,  -741,  -744,  1441,   437,  1442,
    1443,  1882,   437,  1882,  1444,   366,  1302,  1302,  1462,  1445,
    1463,  1470,  1999,  1446,  1471,  1859,  1485,  1861,   690,   691,
     692,   693,   694,   695,   696,   697,   698,   699,  1484,  1486,
    1903,  1488,  1493,  1501,   922,  1502,  1503,  1507,  1525,   374,
    1911,  1527,  1599,  1530,  1537,  1556,  1566,   422,   422,   422,
     422,   422,  1676,  1676,  1569,   231,   231,   231,   422,   422,
     422,   422,  1106,  1571,  1572,  1582,  1583,  1587,  1016,  1584,
    1612,  1364,  1992,  1993,  1590,  1594,   231,   584,  1606,   584,
    1615,  1620,  1622,  1632,  1634,  1636,  1651,  1638,  1035,  1510,
     170,  1655,  1666,  1699,   922,  1919,  1921,  1672,  1700,  1701,
    1727,  1702,  1721,  1731,   606,    58,  1745,  1703,  1722,  1390,
    1748,  1749,  1766,  1767,  1751,    58,   700,    58,  1752,  1755,
    1761,  1923,  1763,   422,   422,  1764,   605,  1765,  1016,  1016,
     610,   668,  1016,  1778,  1016,  1783,    49,  1016,  1779,  1833,
    1784,   584,  1789,  -232,  1837,  1882,  1841,  1882,  1842,  1844,
    1849,  1869,  1845,  1852,  1853,  1510,  1883,  1035,  1895,  1888,
    1896,  1035,  1928,  1913,  1929,   865,  1897,  1898,  1924,  1914,
    1900,  1915,  1901,  1907,  1016,  1908,  1909,   105,  1910,  1916,
    1952,  1959,  1965,  1963,  1964,  1968,  1969,    49,  1970,   369,
    1454,  1975,  1980,  1985,   134,  2004,  1035,  1510,  1996,  2008,
    2011,  2016,  1016,  2017,  2018,  1882,  1882,  2026,  1882,  2027,
    1882,    49,  2028,  1035,    49,   866,  2030,  2032,  2013,   221,
      49,   867,   868,   871,  1402,  1307,   618,    49,    49,  1356,
    1391,  1131,  1483,  1659,  1373,   655,   801,  1431,   437,   632,
      49,   634,  1906,   345,   619,   858,  1981,   256,  1882,  1882,
     437,  1882,   553,   245,   637,   357,   599,   247,   259,   249,
     394,   221,  1832,   394,   606,     0,   606,  1882,     0,     0,
       0,     0,     0,   221,     0,   221,   394,   221,   394,     0,
     394,     0,     0,  1882,     0,     0,   605,     0,   605,     0,
     610,     0,   610,     0,     0,     0,     0,     0,     0,   221,
     915,     0,     0,   437,     0,     0,   394,   231,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   502,     0,
       0,     0,     0,  1060,  1064,  1060,  1064,    49,   606,     0,
       0,   424,     0,  1565,   424,     0,     0,     0,     0,     0,
       0,     0,     0,   558,     0,     0,     0,   424,     0,   424,
     605,   424,     0,     0,   610,  1586,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   221,     0,     0,
     221,   221,   357,   406,     0,     0,     0,     0,     0,     0,
      49,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      49,   221,    49,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   369,     0,     0,   369,     0,
     221,     0,     0,     0,     0,     0,   221,     0,     0,   231,
     231,   231,   231,     0,   394,     0,     0,     0,     0,     0,
     406,   406,     0,     0,   406,   406,     0,     0,     0,     0,
       0,     0,   231,   231,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1104,     0,     0,     0,     0,
     369,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      49,     0,     0,     0,     0,   369,    58,     0,     0,     0,
       0,     0,     0,     0,   915,     0,     0,     0,     0,     0,
     915,     0,     0,   915,     0,     0,     0,   221,     0,   357,
     221,     0,     0,   221,    49,     0,     0,     0,     0,     0,
     795,     0,     0,     0,    49,   221,     0,    49,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   836,
     839,     0,    68,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   394,   394,   406,   406,
       0,    49,    49,     0,     0,   836,   839,     0,   394,     0,
       0,     0,     0,   875,     0,     0,     0,     0,   221,     0,
       0,     0,   394,   394,     0,     0,     0,   836,   839,     0,
       0,     0,   836,   839,     0,     0,   836,   839,  1664,     0,
       0,     0,     0,     0,   394,   394,     0,     0,     0,   394,
     394,     0,     0,   394,   394,   357,     0,    68,     0,     0,
       0,     0,   221,     0,     0,     0,    68,   424,   424,     0,
       0,     0,     0,    68,    68,     0,    49,     0,     0,     0,
       0,   394,     0,   394,    49,   394,     0,     0,     0,     0,
     369,   437,     0,   424,   424,     0,   369,     0,     0,     0,
       0,    49,   437,     0,    49,     0,    49,   440,    49,     0,
       0,     0,     0,     0,    49,   424,   424,     0,     0,   440,
     424,   424,     0,   440,   424,   424,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1801,  1805,     0,  1811,  1815,
       0,     0,     0,  1819,  1823,  1827,  1831,     0,     0,     0,
       0,     0,   424,     0,   424,   369,   369,   369,   369,   369,
     369,   369,   369,     0,     0,   369,     0,     0,   915,   915,
     915,     0,     0,     0,   357,   357,   357,   357,     0,     0,
       0,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,     0,     0,     0,     0,     0,   221,   221,     0,
       0,    49,     0,     0,     0,     0,   394,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     221,     0,     0,     0,     0,     0,    68,   221,   221,   394,
       0,   221,   221,     0,     0,     0,    68,  1774,    68,  1777,
       0,     0,     0,     0,     0,     0,    49,     0,     0,   357,
       0,     0,     0,  1786,  1788,   357,   915,     0,   357,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -476,  -476,     0,     0,     0,     0,
       0,     0,     0,     0,  -476,     0,     0,     0,     0,  -476,
    -476,  -476,   369,  -476,  -476,  -476,  -476,  -476,     0,     0,
      74,     0,     0,     0,   231,   231,   231,   231,     0,   406,
     406,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   321,   231,     0,     0,    49,     0,     0,
      49,    49,    49,     0,   357,     0,     0,   357,   357,     0,
       0,    49,     0,     0,     0,     0,     0,     0,     0,   440,
       0,     0,     0,     0,     0,   369,   221,    49,     0,     0,
       0,   440,     0,     0,    49,     0,     0,   221,     0,   394,
       0,    49,     0,     0,     0,    74,     0,     0,     0,     0,
       0,     0,     0,     0,    74,     0,     0,     0,     0,     0,
       0,    74,    74,     0,     0,     0,     0,     0,   915,   915,
       0,     0,     0,     0,     0,   915,   915,     0,     0,   915,
     915,     0,     0,     0,   440,     0,     0,     0,     0,     0,
       0,     0,    49,     0,     0,   441,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1904,     0,   441,     0,    49,
     357,   441,     0,     0,     0,  1912,     0,   221,   221,     0,
     837,   840,   394,     0,     0,     0,   587,     0,     0,   221,
     424,   424,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   357,   221,   357,   837,   840,     0,     0,
     191,   221,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   836,   839,     0,     0,   836,   839,   837,   840,
    1920,  1922,     0,   837,   840,     0,     0,   837,   840,   394,
     394,   678,     0,   394,   394,     0,     0,     0,     0,     0,
       0,     0,     0,   424,     0,     0,     0,     0,     0,    49,
     394,     0,     0,     0,    49,   405,     0,     0,   405,     0,
      49,     0,     0,     0,    74,     0,    49,     0,     0,     0,
       0,   405,    49,   405,    74,   405,    74,     0,     0,     0,
       0,   357,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     424,   424,     0,     0,   424,   424,     0,     0,     0,   406,
       0,   406,     0,     0,     0,     0,     0,    68,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   406,     0,   406,   915,     0,     0,   357,
     357,   357,   357,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   394,   394,   221,
       0,     0,     0,     0,    49,     0,     0,     0,     0,     0,
       0,     0,     0,    49,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
     221,   357,    49,     0,     0,     0,     0,   789,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   789,
     221,     0,     0,     0,     0,     0,     0,   221,     0,     0,
       0,     0,     0,     0,     0,   921,     0,     0,   424,   424,
       0,     0,   116,   221,   357,     0,     0,   915,   915,     0,
     221,   357,     0,     0,   221,   357,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   789,   160,   116,     0,   761,     0,     0,     0,
     203,     0,    80,     0,     0,     0,     0,   991,     0,    80,
      80,     0,   440,     0,   406,   406,   406,   406,   406,     0,
    1018,     0,     0,   440,     0,   406,   406,   406,   406,     0,
     791,     0,     0,     0,     0,   353,   355,     0,   587,     0,
     798,     0,   428,   805,     0,   428,     0,     0,     0,     0,
       0,     0,  1057,  1061,     0,     0,     0,     0,   428,     0,
     428,     0,   428,     0,     0,     0,     0,     0,   587,   587,
     587,   587,     0,     0,     0,     0,     0,     0,   856,   483,
     355,   405,   405,     0,   873,     0,     0,     0,     0,     0,
     406,   406,     0,   869,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   405,   405,   518,
       0,     0,     0,     0,     0,     0,    49,    49,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1132,     0,   405,
     405,  1136,     0,     0,   405,   405,     0,   357,   405,   405,
     357,     0,     0,     0,     0,     0,     0,     0,     0,   551,
       0,     0,   191,     0,     0,     0,     0,   678,   915,   915,
     191,     0,   160,     0,     0,     0,   405,     0,   405,     0,
       0,  1172,    80,     0,    80,    74,     0,   191,     0,     0,
     191,   357,   191,     0,   191,     0,     0,     0,     0,     0,
       0,   836,   839,     0,     0,     0,     0,     0,  1226,     0,
       0,     0,   357,   678,     0,     0,  1237,     0,   394,   394,
       0,     0,     0,   221,   221,   221,   221,     0,     0,     0,
       0,     0,     0,   837,   840,     0,  1290,   837,   840,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   268,     0,     1,   269,    97,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   353,
       0,     0,     0,    49,     0,     0,     0,     0,     2,   424,
     424,     0,   221,   357,     0,     0,     0,     0,     0,   776,
       0,     0,     0,     0,     0,     0,   428,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   116,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   278,     0,     0,   428,   428,
     789,   221,     0,   850,     0,     0,     0,   862,   279,     0,
     428,   789,   280,   281,   282,   283,   284,   285,   286,     0,
       0,     0,   639,     0,   428,   428,     0,     0,     0,     0,
       0,     0,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,   357,     0,     0,    49,   428,   428,   357,     0,
     921,   428,   428,     0,     0,   428,   428,     0,     0,   353,
       0,     0,     0,     0,     0,     0,    49,     0,     0,   116,
     116,     0,     0,     0,     0,     0,   761,   761,   761,     0,
       0,     0,     0,   428,     0,   428,   518,   191,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   353,     0,
     355,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1468,     0,     0,  1472,     0,     0,     0,   357,     0,     0,
       0,     0,  1487,     0,     0,     0,     0,     0,   587,     0,
       0,   587,     0,   221,   357,     0,     0,     0,     0,     0,
     587,     0,     0,     0,     0,     0,     0,     0,   394,     0,
     394,  1511,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1508,  1509,     0,  1057,  1061,  1057,  1061,   587,
       0,  1172,   394,     0,   394,  1519,     0,     0,  1237,     0,
    1523,     0,     0,   587,   587,   587,   587,     0,     0,     0,
       0,     0,   423,     0,     0,   423,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,   405,   423,     0,
     423,     0,   423,     0,     0,     0,     0,     0,     0,   424,
       0,   424,     0,     0,   678,     0,     0,     0,     0,  1114,
     678,     0,     0,  1114,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   424,     0,   424,     0,     0,   776,     0,
       0,     0,     0,     0,   357,     0,   394,     0,     0,     0,
       0,     0,     0,     0,   405,   405,     0,     0,   405,   405,
       0,     0,     0,     0,     0,   191,     0,     0,     0,     0,
     191,  1601,     0,     0,     0,     0,  1457,     0,     0,     0,
       0,     0,  1457,     0,     0,     0,     0,     0,   191,     0,
       0,     0,     0,     0,   585,     0,   836,   839,     0,   836,
     839,     0,     0,     0,     0,     0,     0,   836,   839,   836,
     839,     0,     0,   394,   394,   394,   394,   394,   221,   221,
       0,     0,   837,   840,   394,   394,   394,   394,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   776,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   776,   428,
       0,     0,     0,     0,     0,     0,  1339,     0,     0,   776,
       0,   551,   836,   839,     0,     0,     0,     0,     0,     0,
       0,     0,   405,   405,   424,   424,   424,   424,   424,   394,
     394,     0,     0,     0,     0,   424,   424,   424,   424,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   191,     0,
       0,   116,     0,     0,     0,     0,     0,     0,     0,  1371,
       0,     0,     0,     0,   518,     0,     0,     0,     0,     0,
       0,   116,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   850,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   428,     0,     0,     0,     0,     0,
     424,   424,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   423,   423,
       0,     0,     0,   850,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   423,   423,     0,     0,     0,     0,
       0,   428,   428,     0,     0,   428,   428,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   423,   423,   355,     0,
     353,   423,   423,     0,     0,   423,   423,   912,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   921,     0,     0,     0,     0,     0,
       0,     0,     0,   423,     0,   423,     0,     0,     0,     0,
       0,     0,  1707,  1709,     0,     0,     0,     0,     0,     0,
    1716,     0,  1719,  1468,     0,     0,  1472,     0,     0,     0,
     587,   587,     0,     0,  1511,     0,     0,  1732,   587,     0,
     587,   587,   761,   761,   587,     0,     0,     0,     0,     0,
       0,     0,   587,     0,     0,   587,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   585,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   428,
     428,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   776,   585,   585,   585,   585,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   776,     0,  1114,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   113,
       0,     0,  1114,     0,     0,     0,     0,     0,     0,  1114,
       0,     0,   921,   405,   405,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1793,     0,     0,     0,     0,     0,
     113,   113,     0,     0,     0,  1601,     0,     0,     0,     0,
    1519,   912,     0,  1523,     0,     0,     0,   912,     0,     0,
     912,     0,   306,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     0,
       0,   349,   113,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   837,   840,     0,
     837,   840,     0,     0,     0,     0,     0,     0,   837,   840,
     837,   840,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   349,   113,     0,     0,   365,
       0,   921,     0,  1862,  1863,  1864,  1865,     0,     0,  1866,
       0,     0,     0,  1707,  1709,     0,  1716,     0,  1719,     0,
       0,   587,   587,   587,   587,     0,   113,   587,     0,     0,
    1875,   587,   587,     0,   587,     0,   587,     0,     0,     0,
       0,     0,     0,   837,   840,     0,     0,     0,   587,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1890,  1891,
       0,   191,     0,     0,     0,     0,   113,     0,     0,     0,
       0,   423,   423,     0,     0,     0,     0,     0,     0,   113,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   921,     0,     0,     0,   365,     0,     0,  1650,     0,
     640,   642,     0,     0,   365,     0,     0,     0,     0,     0,
     365,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     306,     0,     0,     0,     0,  1660,     0,     0,     0,     0,
       0,     0,     0,     0,   423,     0,   365,     0,     0,     0,
       0,   365,     0,     0,     0,     0,     0,     0,     0,     0,
     428,   428,     0,     0,     0,   912,     0,   912,     0,     0,
    1866,     0,     0,     0,     0,     0,     0,     0,     0,  1939,
       0,  1942,     0,   405,     0,   405,     0,     0,   587,     0,
       0,     0,     0,     0,     0,     0,   113,   587,   349,   587,
       0,   423,   423,     0,     0,   423,   423,   405,     0,   405,
       0,     0,   365,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   518,   921,     0,     0,     0,
    1971,  1972,     0,     0,  1939,   113,  1942,     0,     0,  1976,
       0,     0,     0,  1978,     0,     0,     0,     0,   587,   587,
       0,     0,   587,   912,   587,     0,   585,   587,     0,   585,
       0,   587,     0,     0,     0,     0,     0,  1983,   585,     0,
     849,     0,     0,     0,     0,     0,  1978,     0,     0,     0,
       0,     0,     0,     0,     0,   921,   921,     0,     0,     0,
       0,     0,     0,     0,   587,     0,     0,   585,     0,     0,
       0,     0,     0,     0,  2015,     0,     0,     0,     0,     0,
       0,   585,   585,   585,   585,     0,     0,     0,   365,     0,
       0,     0,   587,     0,     0,     0,   113,     0,   349,   423,
     423,     0,     0,     0,     0,     0,   113,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     0,
       0,     0,     0,   113,     0,   113,     0,     0,   405,   405,
     405,   405,   405,   349,     0,   113,     0,     0,     0,   405,
     405,   405,   405,     0,     0,     0,   306,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,   676,     0,     0,     0,     0,   349,     0,     0,     0,
       0,     0,   365,     0,     2,     0,   912,   703,     0,     0,
       0,     0,     0,   912,     0,     0,     0,   912,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   405,   405,     0,     0,     0,     0,
     428,   273,   428,     0,     0,     0,     0,   274,   275,   276,
      28,     0,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   278,    38,     0,   428,   365,   428,     0,     0,  1081,
       0,     0,     0,   355,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   802,     0,     0,   803,   662,
     289,     0,     0,     0,     0,     0,   306,     0,   290,   291,
     306,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,   365,     0,     0,     0,     0,     0,   365,     0,
       0,   365,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     306,     0,     0,     0,     0,     0,   365,   365,   365,   365,
     365,   365,   365,     0,     0,   365,   365,     0,   365,   365,
     365,   365,   365,   365,   365,   365,     0,   306,     0,     0,
       0,     0,     0,     0,     0,   306,   365,   365,   365,   365,
     365,   365,   365,   365,   365,   365,   365,   365,   365,   365,
     365,   365,   365,   365,     0,   306,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   365,     0,     0,
     365,   365,     0,     0,     0,   428,   428,   428,   428,   428,
       0,     0,     0,   912,     0,     0,   428,   428,   428,   428,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1338,     0,     0,     0,     0,   113,     0,
     423,   423,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   912,     0,   912,
       0,     0,     0,  1026,     0,     0,     0,     0,     0,     0,
       0,   365,     0,     0,   365,     0,     0,     0,   113,     0,
       0,   428,   428,     0,     0,  1368,  1370,     0,     0,     0,
       0,   113,     0,     0,     0,     0,     0,     0,   113,     0,
       0,     0,     0,   365,     0,     0,     0,     0,   849,     0,
       0,     0,   365,     0,     0,   912,     0,     0,   585,   585,
       0,     0,     0,     0,     0,     0,   585,     0,   585,   585,
       0,     0,   585,     0,     0,     0,   365,     0,   365,   324,
     585,     0,     0,   585,     0,     0,     0,     0,     0,     0,
     849,     0,     0,     0,     0,   368,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   676,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1171,     0,   365,     0,     0,     0,   113,     0,     0,
       0,     0,     0,   704,     0,     0,   368,     0,     0,     0,
    1194,  1198,  1202,  1206,  1210,     0,     0,  1219,  1225,     0,
       0,     0,     0,   676,   365,     0,  1236,     0,     0,     0,
       0,     0,     0,     0,     0,   365,     0,     0,  1260,  1264,
    1268,  1272,  1276,     0,     0,  1219,  1289,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   306,   306,  1219,  1219,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,   216,   912,   641,   643,     0,
       0,   368,     0,    28,    29,     0,     0,   368,    32,     0,
     423,     0,   423,     0,   217,    38,   218,   324,     0,     0,
       0,     0,     0,     0,   365,     0,   365,     0,     0,   219,
       0,     0,     0,   368,   423,     0,   423,     0,   368,   268,
       0,     1,   269,    97,   270,     0,   271,   272,   365,   585,
     585,   585,   585,     0,     0,   585,     0,     0,     0,   585,
     585,     0,   585,   365,   585,     0,     2,   365,     0,     0,
     306,     0,     0,     0,   365,     0,   585,     0,   365,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   368,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   336,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1049,   289,     0,     0,  1050,     0,     0,     0,  1027,
     290,   291,  1608,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   497,
       0,     0,     0,     0,     0,   423,   423,   423,   423,   423,
       0,     0,     0,  1026,     0,     0,   423,   423,   423,   423,
       0,     0,     0,     0,     0,   368,   585,     0,     0,     0,
       0,     0,     0,     0,     0,   585,     0,   585,     0,     0,
       0,  1171,     0,     0,     0,     0,     0,     0,  1236,     0,
       0,     0,     0,     0,     0,   368,     0,     0,     0,     0,
     365,     0,     0,   365,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   423,   423,   324,  1647,  1649,   585,   585,     0,     0,
     585,     0,   585,  1163,   676,   585,     0,     0,     0,   585,
     676,     0,     0,     0,   365,     0,     0,     0,     0,   368,
       0,   365,  1338,     0,  1661,     0,  1662,     0,     0,     0,
     336,     0,     0,     0,     0,   365,  1195,  1199,  1203,  1207,
    1211,     0,   585,  1220,     0,     0,     0,     0,     0,  1163,
     365,     0,     0,     0,     0,     0,     0,     0,   365,     0,
     365,  1600,     0,     0,  1261,  1265,  1269,  1273,  1277,     0,
     585,  1220,     0,     0,     0,     0,     0,   365,     0,     0,
       0,     0,   368,     0,     0,     0,  1082,     0,     0,  1220,
    1220,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   113,   324,     0,     0,   365,   324,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   368,
       0,     0,     0,     0,     0,   368,     0,     0,   368,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   324,     0,     0,
       0,     0,     0,   368,   368,   368,   368,   368,   368,   368,
       0,     0,   368,   368,     0,   368,   368,   368,   368,   368,
     368,   368,   368,     0,   324,     0,     0,     0,     0,     0,
       0,     0,   324,   368,   368,   368,   368,   368,   368,   368,
     368,   368,   368,   368,   368,   368,   368,   368,   368,   368,
     368,     0,   324,     0,     0,   365,     0,     0,   914,     0,
     365,   365,   365,     0,   368,     0,     0,   368,   368,     0,
       0,   306,     0,     0,     0,     0,   365,   365,     0,     0,
       0,     0,     0,   306,     0,     0,     0,     0,   497,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     365,   365,     0,   365,   365,     0,     0,     0,   365,   365,
     365,   365,     0,     0,     0,     0,   336,     0,     0,     0,
     365,   365,   365,   365,   365,   365,   365,   365,     0,     0,
     365,     0,     0,     0,     0,     0,     0,     0,   368,     0,
       0,   368,   497,  1839,     0,  1840,     0,   365,     0,     1,
       0,     0,     0,     0,     0,  1647,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1489,
     368,     0,     0,     0,     2,     0,     0,     0,     0,   368,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,  1514,     0,     0,
       0,     0,     0,   368,  1521,   368,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,   336,   306,   306,     0,
     336,     0,     0,     0,     0,     0,    40,     0,     0,     0,
    1163,     0,   914,     0,     0,     0,  1163,     0,   914,     0,
     368,   914,     0,     0,     0,     0,     0,   365,   365,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   365,     0,
     336,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   368,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,     0,     0,   336,     0,     0,
       0,     0,     0,     0,     0,   336,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   324,   324,
     365,     0,     0,   365,   365,   336,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1600,     0,     0,     0,     0,
    1796,  1798,  1802,  1806,  1808,  1812,     0,     0,     0,  1816,
    1820,  1824,  1828,     0,     0,     0,     0,     0,     0,     0,
       0,  1798,  1802,  1808,  1812,  1816,  1820,  1824,  1828,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   368,     0,   368,     0,     0,     0,     0,     0,     0,
      66,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   914,     0,     0,   497,   368,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   306,     0,     0,     0,
     368,     0,     0,     0,   368,     0,     0,   324,     0,     0,
       0,   368,     0,   108,   306,   368,   268,     0,     1,   269,
      97,   270,   497,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,   157,   914,     0,   914,     0,
       0,     0,     0,   227,    66,     0,     0,     0,     0,     0,
       0,    66,    66,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   347,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   227,
       0,     0,     0,     0,     0,   438,     0,     0,     0,   277,
     278,     0,     0,   497,     0,     0,     0,   438,     0,   227,
       0,   438,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1049,   289,
       0,     0,  1613,   227,   914,     0,  1614,   290,   291,     0,
     292,   293,   294,   295,     0,   497,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   515,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   336,   336,     0,     0,     0,     0,   368,     0,     0,
     368,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   548,     0,     0,   227,   227,   227,     0,     0,     0,
       0,     0,     0,     0,   157,     0,     0,     0,     0,     0,
       0,   368,     0,     0,   157,   227,    66,     0,   368,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,   648,     0,   497,     0,     0,     0,
     648,     0,     0,     0,     0,     0,     0,   368,   667,     0,
       0,     0,     0,     0,     0,   368,     0,   368,   497,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   268,     0,
       1,   269,    97,   270,   368,   271,   272,   914,     0,     0,
     336,     0,     0,     0,   914,     0,     0,     0,   914,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1794,     0,   368,     0,     0,  1797,  1799,  1803,  1807,
    1809,  1813,     0,     0,     0,  1817,  1821,  1825,  1829,     0,
       0,   548,   273,   227,   227,     0,     0,   787,   274,   275,
     276,     0,     0,     0,     0,     0,     0,     0,     0,   787,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1049,   289,     0,     0,  1050,   515,     0,     0,     0,   290,
     291,  1618,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,   879,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,     0,     0,   368,   368,   368,
       0,     0,     0,     0,     0,     0,     0,     0,   324,     0,
       0,     0,     0,   368,   368,     0,     0,     0,     0,   227,
     324,     0,     0,     0,     0,     0,   227,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   368,   368,     0,
     368,   368,     0,     0,     0,   368,   368,   368,   368,     0,
       0,     0,     0,     0,     0,     0,     0,   368,   368,   368,
     368,   368,   368,   368,   368,     0,     0,   368,     0,     0,
       0,     0,     0,     0,   914,     0,     0,     0,     0,     0,
       0,   497,     0,     0,   368,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,  1031,     0,     0,   914,     0,
     914,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,   914,   227,   227,
     227,   227,   217,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,   227,   227,     0,     0,   157,    43,     0,     0,   775,
    1084,     0,     0,     0,   324,   324,   914,     0,     0,     0,
     509,     0,     0,     0,   227,     0,     0,     0,     0,     0,
       0,  1111,  1121,   667,     0,  1111,  1121,     0,     0,     0,
     556,     0,     0,     0,   368,   368,     0,     0,     0,     0,
    1140,     0,     0,   227,     0,   368,     0,     0,     0,   227,
       0,     0,   227,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,   216,     0,   368,     0,     0,
     368,   368,     0,    28,    29,     0,     0,     2,    32,     0,
     497,     0,   497,     0,   217,    38,   218,     0,     0,     0,
       0,   336,     0,     0,     0,     0,   497,   497,     0,   219,
       0,   515,     0,   336,     0,     0,     0,     0,   227,     0,
       0,   227,   227,     0,   273,     0,     0,     0,   220,     0,
     274,   275,   276,     0,   224,     0,     0,     0,     0,     0,
    1328,   515,     0,   277,   278,     0,     0,     0,   515,     0,
       0,  1328,   108,   667,     0,   515,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
     224,   288,  1162,   289,     0,     0,   436,   914,   673,     0,
       0,   290,   291,   324,   292,   293,   294,   295,   436,     0,
     224,     0,   436,     0,     0,     0,     0,     0,     0,     0,
       0,   324,     0,     0,     0,     0,   515,     0,     0,     0,
       0,     0,     0,     0,   224,     0,     0,     0,     0,     0,
       0,     0,     0,   515,   227,     0,     0,     0,     0,     0,
       0,   227,   227,     0,     0,     0,     0,     0,     0,     0,
       0,   226,   513,   227,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   227,   227,   227,
       0,     0,     0,     0,     0,   548,     0,   336,   336,     0,
       0,     0,     0,     0,     0,     0,     0,   226,     0,     0,
       0,     0,   546,     0,     0,   224,   224,   224,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   226,   497,     0,
       0,     0,     0,     0,     0,     0,   224,     0,   497,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   226,     0,     0,     0,   646,     0,     0,     0,     0,
       0,   646,     0,     0,     0,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,   227,     0,     0,     0,   514,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,   497,   497,  1031,     0,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,   547,
       0,     0,   226,   226,   226,     0,     0,     0,     0,    27,
       0,     0,     0,   227,   227,   227,   227,    28,    29,     0,
       0,     0,    32,   226,     0,    35,    36,     0,    37,    38,
      39,     0,   546,   227,   224,   224,     0,     0,   786,     0,
       0,     0,   647,    40,     0,     0,     0,  1533,   647,     0,
     786,     0,    43,     0,     0,   775,   666,     0,     0,     0,
       0,     0,     0,     0,   548,   227,   509,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   336,     0,     0,     0,
       0,     0,     0,     0,  1577,     0,   513,     0,     0,     0,
       0,  1577,     0,     0,   336,     0,     0,     0,     0,     0,
       0,     0,     0,   878,     0,     0,     0,   227,   227,     0,
       0,     0,     0,     0,   227,   227,     0,     0,   227,   227,
       0,     0,     0,  -468,  1042,     0,  -468,  -468,  -468,  -468,
       0,  -468,  -468,     0,     0,     0,     0,     0,     0,   547,
     224,   226,   226,     0,     0,     0,     0,   224,     0,     0,
       0,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,     0,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,     0,     0,  -468,  -468,
       0,  -468,     0,   514,  -468,  -468,  -468,  -468,  -468,     0,
       0,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,     0,  -468,
       0,  -468,  -468,  -468,     0,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,     0,     0,  -468,  -468,  -468,  -468,     0,
    -468,  -468,  -468,  1043,  -468,  -468,  -468,   226,  -468,  -468,
    -468,  -468,     0,     0,   226,     0,     0,     0,     0,   224,
     224,   224,   224,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,   224,   224,   227,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   224,     0,     0,     0,     0,
       0,     0,  1109,  1119,     0,     0,  1109,  1119,     0,     0,
       0,     0,     0,     0,     0,   227,     0,     0,     0,     0,
       0,     0,     0,     0,   224,     0,     0,     0,     0,     0,
     224,     0,     0,   224,     0,     0,   227,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   227,   227,   227,
     227,     0,     0,     0,     0,     0,   226,   226,   226,   226,
       0,     0,     0,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,   226,
     226,     0,     0,     0,     0,     0,     0,     0,  1083,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,     0,     0,     0,     0,   515,     0,  1110,
    1120,   666,   513,  1110,  1120,     0,   227,   227,     0,   224,
       0,     0,   224,   224,     0,     0,     0,   273,  1139,     0,
       0,   226,     0,   274,   275,   276,     0,   226,     0,     0,
     226,  1327,   513,     0,     0,     0,   277,   278,     0,   513,
       0,     0,  1327,     0,     0,     0,   513,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,   227,   289,     0,     0,  1966,
    1967,   920,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   513,     0,     0,
       0,     0,     0,     0,     0,     0,   227,     0,     0,   514,
      78,     0,   227,     0,   513,   224,   226,     0,     0,   226,
     226,     0,   224,   224,     0,     0,     0,     0,     0,     0,
     667,     0,   229,     0,   224,     0,     0,     0,     0,   514,
       0,     0,     0,     0,     0,     0,   514,     0,   224,   224,
     224,   666,     0,   514,    78,     0,   546,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,     0,     0,     0,    78,    78,     0,   229,     0,
      78,     0,    78,     0,    78,     0,     0,   227,   227,     0,
       0,    78,    78,     0,   514,     0,     0,     0,     0,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,     0,
       0,   514,   226,     0,     0,     0,    78,    78,     0,   226,
     226,     0,     0,     0,     0,     0,   224,     0,     0,     0,
     517,   226,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,   226,     0,     0,
       0,     0,     0,   547,     0,     0,     0,     0,     0,     0,
      78,    78,     0,     0,     0,     0,     0,     0,     0,     0,
     550,     0,     0,   229,   229,   229,     0,     0,     0,     0,
       0,     0,     0,     0,   224,   224,   224,   224,     0,     0,
       0,    78,     0,     0,   229,     0,     0,     0,     0,     0,
       0,    78,     0,    78,   224,     0,     0,     0,   227,     0,
     667,     0,     0,   650,     0,     0,     0,     0,     0,   650,
       0,     0,     0,     0,     0,     0,     0,   669,     0,     0,
       0,    78,     0,   226,     0,   546,   224,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,  1575,    78,     0,     0,     0,
       0,     0,  1575,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   224,   224,
       0,     0,   227,   227,     0,   224,   224,     0,     0,   224,
     224,   226,   226,   226,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     550,   226,   229,   229,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1532,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   547,   226,     0,     0,     0,     0,     0,     0,
       0,    78,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,  1576,     0,   517,     0,     0,     0,     0,  1576,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,     0,     0,     0,
      78,     0,   226,   226,     0,     0,   226,   226,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,     0,     0,   229,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,   224,     0,     0,   224,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,    78,     0,    78,     0,   217,    38,   218,     0,     0,
       0,    78,    78,     0,     0,     0,   224,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,    78,    43,
      78,     0,   775,     0,     0,     0,     0,   224,    78,  1325,
      78,     0,     0,   509,     0,     0,     0,     0,   224,   224,
     224,   224,     0,     0,     0,     0,     0,   229,   229,   229,
     229,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,   226,
     229,   229,   226,     0,     0,     0,     0,     0,     0,  1086,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   229,     0,     0,     0,     0,   513,     0,
    1113,  1123,   669,     0,  1113,  1123,     0,   224,   224,     0,
       0,     0,     0,   226,     0,     0,     0,     0,     0,  1142,
       0,     0,   229,     0,     0,     0,     0,     0,   229,     0,
       0,   229,     0,     0,   226,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,   226,   226,     0,
       0,     0,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,   224,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   514,     0,   224,     0,     0,
     517,     0,     0,   224,   226,   226,     0,   229,   273,     0,
     229,   229,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     0,
     517,     0,     0,     0,     0,     0,     0,   517,     0,     0,
       0,   279,   669,     0,   517,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1229,   289,     0,     0,
     225,     0,   673,   226,     0,   290,   291,     0,   292,   293,
     294,   295,   224,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   224,   224,
       0,     0,     0,     0,     0,   517,   225,     0,     0,     0,
       0,     0,   225,    78,   226,     0,     0,     0,     0,     0,
     226,     0,   517,   229,   225,     0,   225,     0,   225,     0,
     229,   229,     0,     0,     0,     0,     0,     0,   666,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,    78,     0,     0,   229,   229,   229,     0,
       0,     0,     0,     0,   550,     0,    78,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   226,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,   226,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,   224,
       0,   225,   225,   225,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
       0,     0,   225,     0,   229,     0,     0,   230,     0,   230,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   225,     0,     0,     0,     0,     0,   225,     0,     0,
       0,     0,    78,   230,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   224,   224,     0,     0,     0,     0,     0,
       0,     0,   229,   229,   229,   229,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   229,     0,     0,     0,   226,     0,   666,     0,
       0,     0,     0,     0,     0,     0,  1535,     0,     0,     0,
       0,   230,     0,     0,   230,   230,   230,     0,     0,     0,
       0,     0,     0,   550,   229,     0,     0,     0,   225,     0,
     225,   225,     0,     0,   225,   230,     0,     0,     0,     0,
       0,     0,     0,  1579,     0,     0,   225,     0,     0,     0,
    1579,     0,     0,     0,   230,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,   229,   229,     0,     0,
     226,   226,     0,   229,   229,     0,     0,   229,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   225,
       0,     0,     0,     0,     0,     0,     0,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,   225,     0,     0,     0,
       0,   592,     0,   225,     0,     0,     0,     0,     0,     0,
       0,   230,     0,   230,   230,     0,     0,   230,  1006,  1007,
    1008,   566,  1009,  1010,  1011,  1012,   571,   572,  1013,   230,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
       0,     0,     0,     0,     0,  1014,     0,     0,     0,     0,
     277,   278,  1015,   665,   576,   577,   578,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  -471,
     289,   579,   230,  -471,     0,   220,     0,   580,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
     229,     0,     0,   229,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   225,   225,   225,   225,   230,
       0,     0,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,   225,
       0,     0,     0,     0,   229,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   665,     0,     0,     0,     0,
       0,   225,     0,     0,     0,   229,     0,     0,   225,   225,
       0,     0,   225,   225,     0,     0,   229,   229,   229,   229,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,     0,     0,     0,   225,     0,     0,   225,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,   517,     0,   230,   230,
     230,   230,     0,     0,   216,   229,   229,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,   230,   230,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,   230,   225,     0,    43,   225,   225,
    1106,   230,   230,     0,     0,   230,   230,    78,     0,     0,
       0,  1107,     0,     0,   229,     0,     0,   225,     0,     0,
       0,     0,     0,   230,     0,     0,     0,     0,   225,   230,
       0,     0,   230,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1029,   367,
       0,     0,     0,     0,     0,   229,     0,     0,     0,     0,
       0,   229,     0,  1047,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   592,   592,   592,   592,     0,     0,   669,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     367,   225,     0,     0,     0,     0,     0,     0,   225,   225,
       0,     0,     0,     0,   665,     0,     0,     0,   230,     0,
     225,   230,   230,     0,     0,     0,     0,     0,     0,     0,
     229,     0,     0,     0,   225,   225,   225,     0,     0,  1047,
     230,     0,   225,     0,     1,     0,   229,   229,     0,     0,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1170,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,   627,     0,     0,     0,
       0,     0,  1223,     0,     0,   367,     0,   216,     0,     0,
    1235,   367,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,   225,     0,   230,     0,   217,    38,   218,     0,
    1287,   230,   230,     0,     0,     0,     0,     0,     0,     0,
       0,   219,     0,   230,     0,     0,     0,     0,  1313,  1317,
      43,     0,     0,   775,     0,     0,     0,   230,   230,   230,
    1343,     0,     0,     0,   509,   230,     0,   229,     0,   669,
       0,     0,     0,     0,     0,     0,     0,     0,   665,  1407,
     225,   225,   225,   225,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     225,     0,     0,   367,     0,     0,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,     0,
       0,   225,   225,     0,     0,     0,     0,     0,     0,     0,
       0,   229,   229,     0,   -65,   230,     0,     0,     0,     0,
       0,   225,   -65,   -65,     0,     0,     0,   -65,   225,     0,
       0,     0,     0,   -65,   -65,   -65,     0,     0,     0,     0,
       0,     0,     0,     0,   225,   225,     0,     0,   -65,     0,
       0,   225,   225,     0,     0,   225,   225,     0,     0,     0,
       0,     0,     0,  1408,     0,  1409,   -65,     0,     0,     0,
       0,     0,     0,   230,   230,   230,   230,     0,     0,   913,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   230,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   367,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   230,   230,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   592,   230,     0,   592,  1475,  1477,     0,
    1480,   230,     0,     0,     0,     0,     0,     0,  1490,     0,
       0,     0,     0,   367,     0,     0,  1499,   230,   230,     0,
       0,     0,     0,  1047,   230,   230,     0,     0,   230,   230,
       0,     0,     0,     0,   592,     0,     0,     0,     0,     0,
       0,  1047,     0,     0,     0,     0,  1047,     0,   592,   592,
     592,   592,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,   225,     0,
       0,   225,     0,     0,     0,     0,  1076,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1546,     0,     0,     0,     0,     0,  1555,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,     0,     0,     0,     0,     0,   273,     0,
    1047,     0,     0,   913,   274,   275,   276,     0,     0,   913,
       0,     0,   913,   225,     0,     0,     0,   277,   278,     0,
       0,     0,     0,     0,   225,   225,   225,   225,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,  1047,   288,  1049,   289,     0,     0,
    1613,     0,     0,     0,  1621,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   230,     0,     0,   230,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   225,   225,     0,  1047,     0,   367,     0,
       0,   367,   367,     0,     0,     0,     0,     0,     0,  1047,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   664,     0,     0,     0,   230,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   230,   230,   230,
     230,     0,   225,     0,     0,     0,     0,     0,     0,     0,
    1047,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   913,     0,     0,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1047,     0,     0,     0,
    1047,     0,     0,   225,     0,     0,     0,     0,     0,   225,
       0,     0,     0,     0,   367,     0,     0,     0,     0,     0,
       0,     0,     0,   367,     0,     0,   230,   230,   171,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   664,     0,     0,   913,     0,   913,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,   225,     0,
       0,     0,     0,     0,     0,   230,     0,     0,     0,     0,
       0,     0,   177,    27,   225,   225,     0,     0,     0,     0,
       0,    28,    29,     0,   367,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,    40,     0,     0,
       0,     0,   230,     0,     0,   913,    43,     0,     0,   508,
     949,     0,     0,     0,     0,     0,   367,     0,     0,     0,
     509,     0,     0,     0,     0,   592,   592,     0,     0,  1047,
       0,  1047,     0,     0,  1047,   592,     0,     0,     0,     0,
    1723,  1726,     0,  1728,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1047,     0,  1739,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   225,     0,   230,   230,     0,
       0,     0,     0,     0,     0,     0,     0,  1028,     0,     0,
    1047,     0,     0,     0,     0,     0,     0,     0,     0,  1047,
       0,     0,  1046,     0,     0,   367,  1051,   367,     0,     0,
       0,     0,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,   367,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,   913,   225,
     225,     0,     0,   664,     0,   913,     0,     0,     0,   913,
       0,     0,     0,     0,     0,     0,     0,  1125,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,  1046,  1051,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     0,   230,     0,
       0,     0,     0,  1169,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1049,   289,     0,     0,  1613,     0,
       0,     0,  1633,   290,   291,    82,   292,   293,   294,   295,
       0,  1221,     0,     0,     0,     0,     0,     0,     0,  1234,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   592,  1047,     0,     0,     0,     0,     0,  1285,
    1047,     0,   230,   230,  1728,     0,  1873,     0,   111,   117,
       0,     0,     0,     0,     0,  1879,     0,  1311,  1315,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     161,   117,     0,     0,     0,   201,     0,   664,     0,    82,
       0,   367,     0,     0,   367,   665,    82,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   348,     0,     0,     0,     0,     0,
       0,   351,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   913,     0,     0,     0,     0,
       0,     0,   367,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,     0,   481,     0,     0,     0,     0,
       0,   367,     0,     0,     0,     0,     0,     0,     0,   913,
       0,   913,     0,     0,  1931,  1934,     0,  1047,     0,  1047,
       0,     0,   592,  1047,   592,     0,   520,     0,   913,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,   117,   913,     0,     0,
       0,     0,     0,     0,   216,  1047,     0,     0,  1047,   161,
       0,     0,    28,    29,     0,     0,   592,    32,     0,    82,
       0,    82,     0,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,  1474,  1476,     0,  1479,
       0,     0,  1047,     0,     0,     0,  1418,  1028,     0,     0,
       0,  1051,     0,     0,     0,  1498,     0,     0,     0,     0,
       0,     0,  1046,  1051,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1046,  1051,     0,     0,     0,  1046,   367,     0,     0,     0,
       0,   367,   367,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   367,   367,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   777,     0,     0,     0,
    1545,  1800,  1804,     0,  1810,  1814,  1554,     0,     0,  1818,
    1822,  1826,  1830,     0,     0,   117,     0,     0,     0,     0,
       0,  1800,  1804,  1810,  1814,  1818,  1822,  1826,  1830,  1046,
       0,   367,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   913,     0,
     851,     0,     0,   860,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1046,  1051,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   114,
       0,     0,     0,     0,     0,     0,   117,   117,     0,     0,
       0,     0,     0,     0,     0,  1046,     0,  1051,     0,     0,
       0,     0,     0,   520,     0,   117,     0,     0,  1046,  1051,
     159,   114,     0,   962,     0,   200,     0,   202,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   367,   367,
       0,     0,     0,     0,     0,     0,   351,     0,     0,   367,
       0,   350,   114,     0,     0,     0,     0,     0,     0,  1046,
       0,  1051,     0,     0,     0,     0,     0,     0,     0,     0,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,  1046,     0,  1051,     0,  1046,
       0,  1051,     0,     0,     0,   480,   482,     2,     0,     0,
       0,   913,     0,     0,   367,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,   114,     0,     0,     0,
       0,     0,     0,     0,   273,     0,   535,     0,   536,     0,
     274,   275,   276,     0,     0,     0,  1116,     0,     0,     0,
    1116,     0,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   777,   114,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,   159,
       0,   288,  1049,   289,     0,     0,  1613,     0,     0,     0,
    1637,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1046,  1051,
    1046,  1051,     0,  1046,  1718,     0,     0,     0,     0,  1474,
    1725,     0,  1498,     0,  1051,     0,     0,     0,     0,     0,
     777,  1319,  1046,  1051,  1498,     0,   268,     0,     1,   269,
      97,   270,     0,   271,   272,   777,   114,     0,   350,     0,
       0,     0,     0,  1340,     0,     0,   777,   111,   117,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1046,
    1051,     0,     0,     0,     0,   114,     0,     0,  1046,  1051,
       0,     0,     0,     0,     0,     0,     0,     0,   117,     0,
     273,     0,     0,     0,     0,  1369,   274,   275,   276,     0,
       0,   520,     0,     0,     0,     0,     0,     0,   117,   277,
     278,     0,     0,   200,   202,     0,     0,     0,   851,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1049,   289,
    1505,     0,  1050,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
     851,     0,     0,     0,     0,     0,   918,     0,   919,     0,
       0,     0,     0,     0,     0,     0,   114,   114,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,     0,   114,     0,     0,     0,     0,
       0,     0,     0,   350,  1735,   114,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,   350,     0,     0,     0,
       0,     0,  1046,     0,     0,     0,     0,  1051,     0,  1046,
    1718,     0,  1051,  1498,     0,  1872,     0,  1874,     0,     0,
       0,     0,     0,  1051,  1878,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,   664,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1049,   289,  1736,     0,
    1050,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,   777,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   777,
       0,  1116,     0,     0,     0,     0,     0,     0,     0,  1568,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1116,
       0,     0,     0,     0,     0,     0,  1116,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1930,  1933,     0,  1046,  1051,  1046,     0,
       0,   683,  1046,  1718,     0,     0,     0,   684,   685,   686,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,     0,     0,     0,  1046,  1051,     0,  1046,  1718,     0,
       0,     0,  1977,     0,     0,     0,  -361,     0,     0,     0,
       0,     0,     0,     0,  -361,  -361,     0,     0,     0,  -361,
       0,     0,     0,     0,     0,  -361,  -361,  -361,   114,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -361,  1046,     0,     0,     0,     0,     0,     0,     0,  -361,
    -361,  -361,   687,     0,     0,  -361,  1428,  -361,  -361,     0,
     688,     0,   171,   689,     1,  -361,  -361,  -361,   114,  -361,
    -361,  -361,  -361,  -361,     0,   200,   202,     0,     0,     0,
       0,   114,     0,     0,     0,   535,     0,   536,   114,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1648,     0,   177,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,  1340,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,   775,   949,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   509,     0,     0,   114,     0,     0,
       0,  -361,   683,     0,  -361,  -361,  -361,  -361,   684,   685,
     686,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,   520,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,     0,     0,  -361,  -361,     0,  -361,
       0,     0,  -361,  -361,  -361,  -361,  -361,     0,     0,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,     0,  -361,     0,  -361,
    -361,  -361,     0,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,   687,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,   688,  -361,  -361,   689,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -363,  1090,     0,  -363,  -363,  -363,
    -363,  1091,  1092,  1093,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,     0,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,     0,     0,  -363,
    -363,     0,  -363,     0,     0,  -363,  -363,  -363,  -363,  -363,
       0,     0,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,     0,
    -363,     0,  -363,  -363,  -363,  1648,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  1094,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  1095,  -363,  -363,  1096,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  -468,
    1042,     0,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
       0,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,     0,     0,  -468,  -468,     0,  -468,     0,     0,
    -468,  -468,  -468,  -468,  -468,     0,     0,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,   535,  -468,   536,  -468,  -468,  -468,
       0,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,  -468,
    -468,  -468,  -468,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -304,   268,   114,     1,   269,    97,   270,  -304,   271,   272,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,     2,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,     0,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,     0,     0,   273,  -304,     0,  -304,     0,
       0,   274,   275,   276,  -304,  -304,     0,     0,  -304,  -304,
    -304,  -304,  -304,  -304,   277,   278,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,     0,  -304,     0,   279,  -304,
    -304,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -304,  -304,   288,  1137,   289,  -304,  -304,  1045,  -304,  -304,
    -304,  -304,   290,   291,  -304,   292,   293,   294,   295,  -304,
    -304,  -304,  -304,  -304,  -305,   268,     0,     1,   269,    97,
     270,  -305,   271,   272,  -305,  -305,  -305,  -305,  -305,  -305,
    -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,
    -305,  -305,     2,  -305,  -305,  -305,  -305,  -305,  -305,  -305,
    -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,
    -305,  -305,  -305,  -305,  -305,     0,  -305,  -305,  -305,  -305,
    -305,  -305,  -305,  -305,  -305,  -305,  -305,     0,     0,   273,
    -305,     0,  -305,     0,     0,   274,   275,   276,  -305,  -305,
       0,     0,  -305,  -305,  -305,  -305,  -305,  -305,   277,   278,
    -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,  -305,     0,
    -305,     0,   279,  -305,  -305,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -305,  -305,   288,  1049,   289,  -305,
    -305,  1050,  -305,  -305,  -305,  -305,   290,   291,  -305,   292,
     293,   294,   295,  -305,  -305,  -305,  -305,  -305,  -594,   268,
       0,     1,   269,    97,   270,  -594,   271,   272,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,     2,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,     0,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,     0,     0,   273,  -594,     0,  -594,     0,     0,   274,
     275,   276,  -594,  -594,     0,     0,  -594,  -594,  -594,  -594,
    -594,  -594,   277,   278,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,     0,  -594,     0,   279,  -594,  -594,     0,
     280,   281,   282,   283,   284,   285,   286,   287,  -594,  -594,
     288,  -594,   289,  -594,  -594,  -594,  -594,   673,  -594,  1218,
     290,   291,  -594,   292,   293,   294,   295,  -594,  -594,  -594,
    -594,  -594,  -595,   268,     0,     1,   269,    97,   270,  -595,
     271,   272,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
       2,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,     0,  -595,  -595,  -595,  -595,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,     0,     0,   273,  -595,     0,
    -595,     0,     0,   274,   275,   276,  -595,  -595,     0,     0,
    -595,  -595,  -595,  -595,  -595,  -595,   277,   278,  -595,  -595,
    -595,  -595,  -595,  -595,  -595,  -595,  -595,     0,  -595,     0,
     279,  -595,  -595,     0,   280,   281,   282,   283,   284,   285,
     286,   287,  -595,  -595,   288,  -595,   289,  -595,  -595,  -595,
    -595,   673,  -595,  1284,   290,   291,  -595,   292,   293,   294,
     295,  -595,  -595,  -595,  -595,  -595,  -605,   268,     0,     1,
     269,    97,   270,  -605,   271,   272,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,     2,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,     0,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,     0,
       0,   273,  -605,     0,  -605,     0,     0,   274,   275,   276,
    -605,  -605,     0,     0,  -605,  -605,  -605,  -605,  -605,  -605,
     277,   278,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,     0,  -605,     0,   279,  -605,  -605,     0,   280,   281,
     282,   283,   284,   285,   286,   287,  -605,  -605,   288,  -605,
     289,  -605,  -605,  1045,  -605,  -605,  -605,  -605,   290,   291,
    -605,   292,   293,   294,   295,  -605,  -605,  -605,  -605,  -605,
    -607,   268,     0,     1,   269,    97,   270,  -607,   271,   272,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,     2,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,     0,  -607,  -607,  -607,  -607,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,     0,     0,   273,  -607,     0,  -607,     0,
       0,   274,   275,   276,  -607,  -607,     0,     0,  -607,  -607,
    -607,  -607,  -607,  -607,   277,   278,  -607,  -607,  -607,  -607,
    -607,  -607,  -607,  -607,  -607,     0,  -607,     0,   279,  -607,
    -607,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -607,  -607,   288,  1049,   289,  -607,  -607,  1050,  -607,  -607,
    -607,  -607,   290,   291,  -607,   292,   293,   294,   295,  -607,
    -607,  -607,  -607,  -607,  -606,   268,     0,     1,   269,    97,
     270,  -606,   271,   272,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,     2,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,     0,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,     0,     0,   273,
    -606,     0,  -606,     0,     0,   274,   275,   276,  -606,  -606,
       0,     0,  -606,  -606,  -606,  -606,  -606,  -606,   277,   278,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,     0,
    -606,     0,   279,  -606,  -606,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -606,  -606,   288,  -606,   289,  -606,
    -606,  1045,  -606,  -606,  -606,  -606,   290,   291,  -606,   292,
     293,   294,   295,  -606,  -606,  -606,  -606,  -606,  -357,  1753,
       0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,     0,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,     0,     0,  -357,  -357,     0,  -357,     0,     0,  -357,
    -357,  -357,  -357,  -357,     0,     0,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,     0,  -357,     0,  -357,  -357,  -357,     0,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -350,   268,     0,     1,   269,    97,   270,  -350,
     271,   272,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,
    -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,
       2,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,
    -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,  -350,
    -350,  -350,  -350,     0,  -350,  -350,  -350,  -350,  -350,  -350,
    -350,  -350,  -350,  -350,  -350,     0,     0,   273,  -350,     0,
    -350,     0,     0,   274,   275,   276,  -350,  -350,     0,     0,
    -350,  -350,  -350,  -350,  -350,  -350,   277,   278,  -350,  -350,
    -350,  -350,  -350,  -350,  -350,  -350,  -350,     0,  -350,     0,
     279,  -350,  -350,     0,   280,   281,   282,   283,   284,   285,
     286,   287,  -350,  -350,   288,  -350,   289,  -350,  -350,  -350,
    -350,   673,  -350,  -350,   290,   291,  -350,   292,   293,   294,
     295,  -350,  -350,  -350,  -350,  -350,  -572,   268,     0,     1,
     269,    97,   270,  -572,   271,   272,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,     2,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,     0,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,     0,
       0,   273,  -572,     0,  -572,     0,     0,   274,   275,   276,
    -572,  -572,     0,     0,  -572,  -572,  -572,  -572,  -572,  -572,
     277,   278,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,     0,  -572,     0,   279,  -572,  -572,     0,   280,   281,
     282,   283,   284,   285,   286,   287,  -572,  -572,   288,  -572,
     289,  -572,  -572,  -572,  -572,   673,  -572,  -572,   290,   291,
    -572,   292,   293,   294,   295,  -572,  -572,  -572,  -572,  -572,
    -580,   268,     0,     1,   269,    97,   270,  -580,   271,   272,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,     2,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,     0,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,     0,     0,   273,  -580,     0,  -580,     0,
       0,   274,   275,   276,  -580,  -580,     0,     0,  -580,  -580,
    -580,  -580,  -580,  -580,   277,   278,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,     0,  -580,     0,   279,  -580,
    -580,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -580,  -580,   288,  -580,   289,  -580,  -580,  -580,  -580,   673,
    -580,  -580,   290,   291,  -580,   292,   293,   294,   295,  -580,
    -580,  -580,  -580,  -580,  -573,   268,     0,     1,   269,    97,
     270,  -573,   271,   272,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,     2,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,     0,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,     0,     0,   273,
    -573,     0,  -573,     0,     0,   274,   275,   276,  -573,  -573,
       0,     0,  -573,  -573,  -573,  -573,  -573,  -573,   277,   278,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,     0,
    -573,     0,   279,  -573,  -573,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -573,  -573,   288,  -573,   289,  -573,
    -573,  -573,  -573,   673,  -573,  -573,   290,   291,  -573,   292,
     293,   294,   295,  -573,  -573,  -573,  -573,  -573,  -581,   268,
       0,     1,   269,    97,   270,  -581,   271,   272,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,     2,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,     0,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,     0,     0,   273,  -581,     0,  -581,     0,     0,   274,
     275,   276,  -581,  -581,     0,     0,  -581,  -581,  -581,  -581,
    -581,  -581,   277,   278,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,     0,  -581,     0,   279,  -581,  -581,     0,
     280,   281,   282,   283,   284,   285,   286,   287,  -581,  -581,
     288,  -581,   289,  -581,  -581,  -581,  -581,   673,  -581,  -581,
     290,   291,  -581,   292,   293,   294,   295,  -581,  -581,  -581,
    -581,  -581,  -574,   268,     0,     1,   269,    97,   270,  -574,
     271,   272,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
       2,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,     0,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,     0,     0,   273,  -574,     0,
    -574,     0,     0,   274,   275,   276,  -574,  -574,     0,     0,
    -574,  -574,  -574,  -574,  -574,  -574,   277,   278,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,     0,  -574,     0,
     279,  -574,  -574,     0,   280,   281,   282,   283,   284,   285,
     286,   287,  -574,  -574,   288,  -574,   289,  -574,  -574,  -574,
    -574,   673,  -574,  -574,   290,   291,  -574,   292,   293,   294,
     295,  -574,  -574,  -574,  -574,  -574,  -582,   268,     0,     1,
     269,    97,   270,  -582,   271,   272,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,     2,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,     0,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,     0,
       0,   273,  -582,     0,  -582,     0,     0,   274,   275,   276,
    -582,  -582,     0,     0,  -582,  -582,  -582,  -582,  -582,  -582,
     277,   278,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,     0,  -582,     0,   279,  -582,  -582,     0,   280,   281,
     282,   283,   284,   285,   286,   287,  -582,  -582,   288,  -582,
     289,  -582,  -582,  -582,  -582,   673,  -582,  -582,   290,   291,
    -582,   292,   293,   294,   295,  -582,  -582,  -582,  -582,  -582,
    -575,   268,     0,     1,   269,    97,   270,  -575,   271,   272,
    -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,
    -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,     2,  -575,
    -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,
    -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,
    -575,     0,  -575,  -575,  -575,  -575,  -575,  -575,  -575,  -575,
    -575,  -575,  -575,     0,     0,   273,  -575,     0,  -575,     0,
       0,   274,   275,   276,  -575,  -575,     0,     0,  -575,  -575,
    -575,  -575,  -575,  -575,   277,   278,  -575,  -575,  -575,  -575,
    -575,  -575,  -575,  -575,  -575,     0,  -575,     0,   279,  -575,
    -575,     0,   280,   281,   282,   283,   284,   285,   286,   287,
    -575,  -575,   288,  -575,   289,  -575,  -575,  -575,  -575,   673,
    -575,  -575,   290,   291,  -575,   292,   293,   294,   295,  -575,
    -575,  -575,  -575,  -575,  -583,   268,     0,     1,   269,    97,
     270,  -583,   271,   272,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,     2,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,     0,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,     0,     0,   273,
    -583,     0,  -583,     0,     0,   274,   275,   276,  -583,  -583,
       0,     0,  -583,  -583,  -583,  -583,  -583,  -583,   277,   278,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,     0,
    -583,     0,   279,  -583,  -583,     0,   280,   281,   282,   283,
     284,   285,   286,   287,  -583,  -583,   288,  -583,   289,  -583,
    -583,  -583,  -583,   673,  -583,  -583,   290,   291,  -583,   292,
     293,   294,   295,  -583,  -583,  -583,  -583,  -583,  -359,  1892,
       0,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,     0,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,     0,     0,  -359,  -359,     0,  -359,     0,     0,  -359,
    -359,  -359,  -359,  -359,     0,     0,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,     0,  -359,     0,  -359,  -359,  -359,     0,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,  -359,
    -359,  -359,  -358,  1893,     0,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,     0,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,     0,     0,  -358,  -358,     0,
    -358,     0,     0,  -358,  -358,  -358,  -358,  -358,     0,     0,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,     0,  -358,     0,
    -358,  -358,  -358,     0,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -361,   683,     0,  -361,
    -361,  -361,  -361,   684,   685,   686,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,     0,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,     0,
       0,  -361,  -361,     0,  -361,     0,     0,  -361,  -361,  -361,
    -361,  -361,     0,     0,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
    -361,     0,  -361,     0,  -361,  -361,  -361,     0,  -361,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,   687,  -361,
    -361,  -361,  -361,  -361,  -361,  -361,  1040,  -361,  -361,   689,
       0,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,  -361,
   -1043,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2, -1043,
   -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043,
   -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043,
   -1043,     0, -1043, -1043, -1043, -1043, -1043, -1043, -1043, -1043,
   -1043, -1043, -1043,     0,     0,   273, -1043,     0, -1043,     0,
       0,   274,   275,   276, -1043, -1043,     0,     0, -1043, -1043,
   -1043, -1043, -1043, -1043,   277,   278, -1043, -1043, -1043, -1043,
   -1043, -1043, -1043, -1043, -1043,     0, -1043,     0,   279, -1043,
   -1043,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1049,   289, -1043,     0,  1050, -1043, -1043,
       0, -1043,   290,   291,     0,   292,   293,   294,   295, -1176,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1176, -1176,
   -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176,
   -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176,
       0, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176, -1176,
   -1176, -1176,     0,     0,   273, -1176,     0, -1176,     0,     0,
     274,   275,   276, -1176, -1176,     0,     0, -1176, -1176, -1176,
   -1176, -1176, -1176,   277,   278, -1176, -1176, -1176, -1176, -1176,
   -1176, -1176, -1176, -1176,     0, -1176,     0,   279, -1176, -1176,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1049,   289,  1505,     0,  1050, -1176, -1176,     0,
   -1176,   290,   291,     0,   292,   293,   294,   295, -1134,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2, -1134, -1134, -1134,
   -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134,
   -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134,     0,
   -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134, -1134,
   -1134,     0,     0,   273, -1134,     0, -1134,     0,     0,   274,
     275,   276, -1134, -1134,     0,     0, -1134, -1134, -1134, -1134,
   -1134, -1134,   277,   278, -1134, -1134, -1134, -1134, -1134, -1134,
   -1134, -1134, -1134,     0, -1134,     0,   279, -1134, -1134,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1712,   289, -1134,     0,  1050, -1134, -1134,     0, -1134,
     290,   291,     0,   292,   293,   294,   295, -1165,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1165, -1165, -1165, -1165,
   -1165, -1165, -1165, -1165, -1165, -1165, -1165, -1165, -1165, -1165,
   -1165, -1165, -1165, -1165, -1165, -1165, -1165, -1165,     0,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,   573,
       0,     0,   273, -1165,     0, -1165,     0,     0,   274,   275,
     276, -1165, -1165,     0,     0, -1165,  1014, -1165, -1165, -1165,
   -1165,   277,   278,  1015, -1165,   576,   577,   578, -1165, -1165,
   -1165, -1165,     0, -1165,     0,   279, -1165, -1165,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1049,   289,   579,     0,  1050, -1165,   220,     0,   580,   290,
     291,     0,   292,   293,   294,   295,  -606,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,     0,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,     0,
       0,   273,  -606,     0,  -606,     0,     0,   274,   275,   276,
    -606,  -606,     0,     0,  -606,  -606,  -606,  -606,  -606,  -606,
     277,   278,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,     0,  -606,     0,   279,  -606,  -606,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  -606,
     289,  1044,     0,  1045,  -606,  -606,     0,  -606,   290,   291,
       0,   292,   293,   294,   295, -1157,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1157, -1157, -1157, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157, -1157, -1157,     0, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157,     0,     0,
     273, -1157,     0, -1157,     0,     0,   274,   275,   276, -1157,
   -1157,     0,     0, -1157, -1157, -1157, -1157, -1157, -1157,   277,
     278, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157,
       0, -1157,     0,   279, -1157, -1157,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1935,   289,
   -1157,     0,  1045, -1157, -1157,     0, -1157,   290,   291,     0,
     292,   293,   294,   295, -1158,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1158, -1158, -1158, -1158, -1158, -1158, -1158,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158,
   -1158, -1158, -1158, -1158, -1158,     0, -1158, -1158, -1158, -1158,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158,     0,     0,   273,
   -1158,     0, -1158,     0,     0,   274,   275,   276, -1158, -1158,
       0,     0, -1158, -1158, -1158, -1158, -1158, -1158,   277,   278,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158,     0,
   -1158,     0,   279, -1158, -1158,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1049,   289,  1936,
       0,  1050, -1158, -1158,     0, -1158,   290,   291,     0,   292,
     293,   294,   295, -1152,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2, -1152, -1152, -1152, -1152, -1152, -1152, -1152, -1152,
   -1152, -1152, -1152, -1152, -1152, -1152, -1152, -1152, -1152, -1152,
   -1152, -1152, -1152, -1152,     0,   563,   564,   565,   566,   567,
     568,   569,   570,   571,   572,   573,     0,     0,   273, -1152,
       0, -1152,     0,     0,   274,   275,   276, -1152, -1152,     0,
       0, -1152,  1014, -1152, -1152, -1152, -1152,   277,   278,  1015,
   -1152,   576,   577,   578, -1152, -1152, -1152, -1152,     0, -1152,
       0,   279, -1152, -1152,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1049,   289,   579,     0,
    1050, -1152,   220,     0,   580,   290,   291,     0,   292,   293,
     294,   295, -1100,   554,     0, -1100, -1100, -1100, -1100,     0,
   -1100, -1100,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100,     0, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100,     0,     0, -1100, -1100,     0,
   -1100,     0,     0, -1100, -1100, -1100, -1100, -1100,     0,     0,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100,     0, -1100,     0,
   -1100, -1100, -1100,     0, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100,     0,     0, -1100,     0, -1100,   555,     0, -1100,
   -1100, -1100,     0, -1100, -1100, -1100,     0, -1100, -1100, -1100,
   -1100, -1123,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,   573,     0,     0,   273,   216,     0, -1123,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1123,
     574, -1123, -1123, -1123, -1123,   277,   356,   575,   218,   576,
     577,   578, -1123, -1123, -1123, -1123,     0, -1123,     0,   279,
   -1123,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   579,     0, -1123, -1123,
     220,     0,   580,   290,   291,     0,   292,   293,   294,   295,
   -1101,   554,     0, -1101, -1101, -1101, -1101,     0, -1101, -1101,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1101, -1101,
   -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101,
   -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101,
   -1101,     0, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101,
   -1101, -1101, -1101,     0,     0, -1101, -1101,     0, -1101,     0,
       0, -1101, -1101, -1101, -1101, -1101,     0,     0, -1101, -1101,
   -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101,
   -1101, -1101, -1101, -1101, -1101,     0, -1101,     0, -1101, -1101,
   -1101,     0, -1101, -1101, -1101, -1101, -1101, -1101, -1101, -1101,
       0,     0, -1101,     0, -1101,   555,     0, -1101, -1101, -1101,
       0, -1101, -1101, -1101,     0, -1101, -1101, -1101, -1101, -1162,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2, -1162, -1162,
   -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162,
   -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162, -1162,
       0,  1006,  1007,  1008,   566,  1009,  1010,  1011,  1012,   571,
     572,  1013,     0,     0,   273, -1162,     0, -1162,     0,     0,
     274,   275,   276, -1162, -1162,     0,     0, -1162,  1014, -1162,
   -1162, -1162, -1162,   277,   278,  1015, -1162,   576,   577,   578,
   -1162, -1162, -1162, -1162,     0, -1162,     0,   279, -1162, -1162,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   579,     0, -1162, -1162,   220,     0,
     580,   290,   291,     0,   292,   293,   294,   295, -1178,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2, -1178, -1178, -1178,
   -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178,     0,
   -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178,     0,     0,   273, -1178,     0, -1178,     0,     0,   274,
     275,   276, -1178, -1178,     0,     0, -1178, -1178, -1178, -1178,
   -1178, -1178,   277,   278, -1178, -1178, -1178, -1178, -1178, -1178,
   -1178, -1178, -1178,     0, -1178,     0,   279, -1178, -1178,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  1025,     0, -1178, -1178,   673,     0, -1178,
     290,   291,     0,   292,   293,   294,   295, -1113,  1052,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,   573,
       0,     0,   273,   216,     0, -1113,     0,     0,   274,   275,
     276,    28,    29,     0,     0, -1113,   574, -1113, -1113, -1113,
   -1113,   277,   356,   575,   218,   576,   577,   578, -1113, -1113,
   -1113, -1113,     0, -1113,     0,   279, -1113,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   579,     0, -1113, -1113,   220,     0,   580,   290,
     291,     0,   292,   293,   294,   295, -1117,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,   573,     0,
       0,   273,   216,     0, -1117,     0,     0,   274,   275,   276,
      28,    29,     0,     0, -1117,   574, -1117, -1117, -1117, -1117,
     277,   356,   575,   218,   576,   577,   578, -1117, -1117, -1117,
   -1117,     0, -1117,     0,   279, -1117,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   579,     0, -1117, -1117,   220,     0,   580,   290,   291,
       0,   292,   293,   294,   295, -1112,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,   573,     0,     0,
     273,   216,     0, -1112,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1112,   574, -1112, -1112, -1112, -1112,   277,
     356,   575,   218,   576,   577,   578, -1112, -1112, -1112, -1112,
       0, -1112,     0,   279, -1112,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     579,     0, -1112, -1112,   220,     0,   580,   290,   291,     0,
     292,   293,   294,   295, -1116,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,   573,     0,     0,   273,
     216,     0, -1116,     0,     0,   274,   275,   276,    28,    29,
       0,     0, -1116,   574, -1116, -1116, -1116, -1116,   277,   356,
     575,   218,   576,   577,   578, -1116, -1116, -1116, -1116,     0,
   -1116,     0,   279, -1116,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   579,
       0, -1116, -1116,   220,     0,   580,   290,   291,     0,   292,
     293,   294,   295, -1030,  1065,     0, -1030, -1030, -1030, -1030,
       0, -1030, -1030,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030,
   -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030,
   -1030, -1030, -1030, -1030,     0, -1030, -1030, -1030, -1030, -1030,
   -1030, -1030, -1030, -1030, -1030, -1030,     0,     0, -1030, -1030,
       0, -1030,     0,     0, -1030, -1030, -1030, -1030, -1030,     0,
       0, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030,
   -1030, -1030, -1030, -1030, -1030, -1030, -1030, -1030,     0, -1030,
       0, -1030, -1030, -1030,     0, -1030, -1030, -1030, -1030, -1030,
   -1030, -1030, -1030,     0,     0, -1030,     0, -1030, -1030,     0,
   -1030, -1030, -1030,     0, -1030, -1030, -1030,     0, -1030, -1030,
   -1030, -1030, -1032,  1066,     0, -1032, -1032, -1032, -1032,     0,
   -1032, -1032,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032,
   -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032,
   -1032, -1032, -1032,     0, -1032, -1032, -1032, -1032, -1032, -1032,
   -1032, -1032, -1032, -1032, -1032,     0,     0, -1032, -1032,     0,
   -1032,     0,     0, -1032, -1032, -1032, -1032, -1032,     0,     0,
   -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032, -1032,
   -1032, -1032, -1032, -1032, -1032, -1032, -1032,     0, -1032,     0,
   -1032, -1032, -1032,     0, -1032, -1032, -1032, -1032, -1032, -1032,
   -1032, -1032,     0,     0, -1032,     0, -1032, -1032,     0, -1032,
   -1032, -1032,     0, -1032, -1032, -1032,     0, -1032, -1032, -1032,
   -1032, -1072,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072,
   -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072, -1072,
   -1072, -1072,     0,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,   573,     0,     0,   273, -1072,     0, -1072,
       0,     0,   274,   275,   276, -1072, -1072,     0,     0, -1072,
    1014, -1072, -1072, -1072, -1072,   277,   278,  1015, -1072,   576,
     577,   578, -1072, -1072, -1072, -1072,     0, -1072,     0,   279,
   -1072, -1072,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   579,     0, -1072, -1072,
     220,     0,   580,   290,   291,     0,   292,   293,   294,   295,
   -1074,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2, -1074,
   -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074,
   -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074, -1074,
   -1074,     0,   563,   564,   565,   566,   567,   568,   569,   570,
     571,   572,   573,     0,     0,   273, -1074,     0, -1074,     0,
       0,   274,   275,   276, -1074, -1074,     0,     0, -1074,  1014,
   -1074, -1074, -1074, -1074,   277,   278,  1015, -1074,   576,   577,
     578, -1074, -1074, -1074, -1074,     0, -1074,     0,   279, -1074,
   -1074,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   579,     0, -1074, -1074,   220,
       0,   580,   290,   291,     0,   292,   293,   294,   295, -1114,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,   563,   564,   565,   566,   567,   568,   569,   570,   571,
     572,   573,     0,     0,   273,   216,     0, -1114,     0,     0,
     274,   275,   276,    28,    29,     0,     0, -1114,   574, -1114,
   -1114, -1114, -1114,   277,   356,   575,   218,   576,   577,   578,
   -1114, -1114, -1114, -1114,     0, -1114,     0,   279, -1114,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   579,     0, -1114, -1114,   220,     0,
     580,   290,   291,     0,   292,   293,   294,   295, -1118,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
     573,     0,     0,   273,   216,     0, -1118,     0,     0,   274,
     275,   276,    28,    29,     0,     0, -1118,   574, -1118, -1118,
   -1118, -1118,   277,   356,   575,   218,   576,   577,   578, -1118,
   -1118, -1118, -1118,     0, -1118,     0,   279, -1118,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   579,     0, -1118, -1118,   220,     0,   580,
     290,   291,     0,   292,   293,   294,   295, -1115,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,   573,
       0,     0,   273,   216,     0, -1115,     0,     0,   274,   275,
     276,    28,    29,     0,     0, -1115,   574, -1115, -1115, -1115,
   -1115,   277,   356,   575,   218,   576,   577,   578, -1115, -1115,
   -1115, -1115,     0, -1115,     0,   279, -1115,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   579,     0, -1115, -1115,   220,     0,   580,   290,
     291,     0,   292,   293,   294,   295, -1119,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,   573,     0,
       0,   273,   216,     0, -1119,     0,     0,   274,   275,   276,
      28,    29,     0,     0, -1119,   574, -1119, -1119, -1119, -1119,
     277,   356,   575,   218,   576,   577,   578, -1119, -1119, -1119,
   -1119,     0, -1119,     0,   279, -1119,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   579,     0, -1119, -1119,   220,     0,   580,   290,   291,
       0,   292,   293,   294,   295, -1110,   554,     0, -1110, -1110,
   -1110, -1110,     0, -1110, -1110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110,     0, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,     0,     0,
   -1110, -1110,     0, -1110,     0,     0, -1110, -1110, -1110, -1110,
   -1110,     0,     0, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
       0, -1110,     0, -1110, -1110, -1110,     0, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110,     0,     0, -1110,     0, -1110,
     555,     0, -1110, -1110, -1110,     0, -1110, -1110, -1110,     0,
   -1110, -1110, -1110, -1110, -1111,   554,     0, -1111, -1111, -1111,
   -1111,     0, -1111, -1111,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111,
   -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111,
   -1111, -1111, -1111, -1111, -1111,     0, -1111, -1111, -1111, -1111,
   -1111, -1111, -1111, -1111, -1111, -1111, -1111,     0,     0, -1111,
   -1111,     0, -1111,     0,     0, -1111, -1111, -1111, -1111, -1111,
       0,     0, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111,
   -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111, -1111,     0,
   -1111,     0, -1111, -1111, -1111,     0, -1111, -1111, -1111, -1111,
   -1111, -1111, -1111, -1111,     0,     0, -1111,     0, -1111,   555,
       0, -1111, -1111, -1111,     0, -1111, -1111, -1111,     0, -1111,
   -1111, -1111, -1111,  -961,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,  -961,  -961,  -961,  -961,  -961,  -961,  -961,  -961,
    -961,  -961,  -961,  -961,  -961,  -961,  -961,  -961,  -961,  -961,
    -961,  -961,  -961,  -961,     0,  -961,  -961,  -961,  -961,  -961,
    -961,  -961,  -961,  -961,  -961,  -961,     0,     0,   273,  -961,
       0,  -961,     0,     0,   274,   275,   276,  -961,  -961,     0,
       0,  -961,  -961,  -961,  -961,  -961,  -961,   277,   278,  -961,
    -961,  -961,  -961,  -961,  -961,  -961,  -961,  -961,     0,  -961,
       0,   279,  -961,  -961,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,  -961,     0,
    1691,  1692,   920,     0,  -961,   290,   291,     0,   292,   293,
     294,   295,  -963,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,  -963,  -963,  -963,  -963,  -963,  -963,  -963,  -963,  -963,
    -963,  -963,  -963,  -963,  -963,  -963,  -963,  -963,  -963,  -963,
    -963,  -963,  -963,     0,  -963,  -963,  -963,  -963,  -963,  -963,
    -963,  -963,  -963,  -963,  -963,     0,     0,   273,  -963,     0,
    -963,     0,     0,   274,   275,   276,  -963,  -963,     0,     0,
    -963,  -963,  -963,  -963,  -963,  -963,   277,   278,  -963,  -963,
    -963,  -963,  -963,  -963,  -963,  -963,  -963,     0,  -963,     0,
     279,  -963,  -963,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  -963,     0,  -963,
    1854,   920,     0,  -963,   290,   291,     0,   292,   293,   294,
     295,  -957,  1857,     0,  -957,  -957,  -957,  -957,     0,  -957,
    -957,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,     0,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,     0,     0,  -957,  -957,     0,  -957,
       0,     0,  -957,  -957,  -957,  -957,  -957,     0,     0,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,     0,  -957,     0,  -957,
    -957,  -957,     0,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,     0,     0,  -957,     0,  -957,  -957,     0,  -957,  -957,
    -957,     0,  -957,  -957,  -957,     0,  -957,  -957,  -957,  -957,
   -1159,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2, -1159,
   -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159,
   -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159,
   -1159,     0, -1159, -1159, -1159, -1159, -1159, -1159, -1159, -1159,
   -1159, -1159, -1159,     0,     0,   273, -1159,     0, -1159,     0,
       0,   274,   275,   276, -1159, -1159,     0,     0, -1159, -1159,
   -1159, -1159, -1159, -1159,   277,   278, -1159, -1159, -1159, -1159,
   -1159, -1159, -1159, -1159, -1159,     0, -1159,     0,   279, -1159,
   -1159,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289, -1159,     0, -1159, -1159, -1159,
       0, -1159,   290,   291,     0,   292,   293,   294,   295,  -958,
    1927,     0,  -958,  -958,  -958,  -958,     0,  -958,  -958,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  -958,  -958,  -958,
    -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,
    -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,
       0,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,
    -958,  -958,     0,     0,  -958,  -958,     0,  -958,     0,     0,
    -958,  -958,  -958,  -958,  -958,     0,     0,  -958,  -958,  -958,
    -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,
    -958,  -958,  -958,  -958,     0,  -958,     0,  -958,  -958,  -958,
       0,  -958,  -958,  -958,  -958,  -958,  -958,  -958,  -958,     0,
       0,  -958,     0,  -958,  -958,     0,  -958,  -958,  -958,     0,
    -958,  -958,  -958,     0,  -958,  -958,  -958,  -958,  -887,   523,
       0,  -887,  -887,  -887,  -887,     0,  -887,  -887,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -887,  -887,  -887,  -887,
    -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,
    -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,     0,
       0,  -887,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -887,  -887,     0,  -887,     0,     0,  -887,
    -887,  -887,  -887,  -887,     0,     0,  -887,  -887,  -887,  -887,
    -887,  -887,  -887,  -887,  -887,  -887,  -887,     0,     0,  -887,
    -887,  -887,  -887,     0,  -887,     0,  -887,  -887,  -887,     0,
    -887,  -887,  -887,  -887,  -887,  -887,  -887,  -887,     0,     0,
    -887,   524,  -887,  -887,     0,   525,  -887,  -887,     0,     0,
    -887,  -887,     0,  -887,  -887,  -887,  -887,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   356,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   895,     0,   896,   897,   673,     0,     0,   290,   291,
       0,   292,   293,   294,   295,  1146,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   356,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   895,
       0,   896,  -109,   673,     0,     0,   290,   291,     0,   292,
     293,   294,   295,  1153,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   356,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,   895,     0,   896,
     -97,   673,     0,     0,   290,   291,     0,   292,   293,   294,
     295,  1157,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   356,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,   895,     0,   896,  -101,   673,
       0,     0,   290,   291,     0,   292,   293,   294,   295,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   356,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  1412,     0,   896,   -64,   673,     0,     0,
     290,   291,     0,   292,   293,   294,   295,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   356,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1421,     0,   896,  1422,   673,     0,     0,   290,   291,
       0,   292,   293,   294,   295,  1465,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   356,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   895,
       0,   896,   -80,   673,     0,     0,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   356,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1421,     0,   896,
    -106,   673,     0,     0,   290,   291,     0,   292,   293,   294,
     295,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   356,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  1421,     0,   896,   -96,   673,
       0,     0,   290,   291,     0,   292,   293,   294,   295,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,   216,     0,     0,     0,     0,   274,
     275,   276,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,   277,   356,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,  1421,     0,   896,  -100,   673,     0,     0,
     290,   291,     0,   292,   293,   294,   295,  1656,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,   216,     0,     0,     0,     0,   274,   275,   276,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
     277,   356,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   895,     0,   896,   -87,   673,     0,     0,   290,   291,
       0,   292,   293,   294,   295,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
     216,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,   277,   356,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,  1421,
       0,   896,   -77,   673,     0,     0,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   356,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1421,     0,   896,
     -84,   673,     0,     0,   290,   291,     0,   292,   293,   294,
     295,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,   216,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,   277,   356,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
     219,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,   268,   289,     1,   269,    97,   270,     0,
     271,   272,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   779,   216,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,   277,   356,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,   268,   289,     1,   269,    97,
     270,     0,   271,   272,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,     0,     0,     0,   274,   275,   276,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,   277,   381,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,    40,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,   662,   289,     0,
       0,     0,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1078,    27,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,   277,   381,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,    40,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   639,   662,   289,     0,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,     0,     0,
       0,   274,   275,   276,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,   277,   381,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
      40,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,   268,   289,     1,   269,    97,   270,   220,
     271,   272,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,    27,     0,
       0,     0,     0,   274,   275,   276,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,   277,   381,    38,    39,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     279,     0,    40,     0,   280,   281,   282,   283,   284,   285,
     286,   802,     0,     0,   803,   662,   289,     2,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1006,  1007,  1008,   566,  1009,  1010,  1011,  1012,   571,
     572,  1013,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,     0,  1014,     0,
       0,     0,     0,   277,   278,  1015,     0,   576,   577,   578,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1049,   289,   579,     0,  1050,     0,   220,     0,
     580,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1006,
    1007,  1008,   566,  1009,  1010,  1011,  1012,   571,   572,  1013,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,  1014,     0,     0,     0,
       0,   277,   278,  1015,     0,   576,   577,   578,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   579,     0,     0,     0,   220,     0,   580,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,   573,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,     0,  1014,     0,     0,     0,     0,   277,
     278,  1015,     0,   576,   577,   578,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     579,     0,     0,     0,   220,     0,   580,   290,   291,     0,
     292,   293,   294,   295,  1715,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1006,  1007,  1008,   566,  1009,
    1010,  1011,  1012,   571,   572,  1013,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
       0,     0,  1014,     0,     0,     0,     0,   277,   278,  1015,
       0,   576,   577,   578,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   579,     0,
       0,     0,   220,     0,   580,   290,   291,     0,   292,   293,
     294,   295,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1049,   289,     0,     0,  1050,     0,
       0,     0,     0,   290,   291,  1757,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1049,   289,     0,
       0,  1050,     0,     0,     0,     0,   290,   291,  1760,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1876,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1049,   289,  1736,     0,  1050,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1049,   289,  1736,     0,  1050,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1937,   289,  1938,     0,
    1045,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1049,
     289,  1936,     0,  1050,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1044,     0,  1045,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,  1025,     0,     0,
       0,   673,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1494,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1049,   289,
       0,     0,  1050,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1495,   289,  1496,     0,     0,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,  1504,     0,  1045,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1540,   289,     0,
       0,     0,     0,   673,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1549,   289,     0,     0,     0,     0,   673,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1581,   289,     0,     0,  1045,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1045,     0,     0,     0,     0,   290,   291,  1607,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1610,     0,     0,     0,  1611,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,  1045,     0,     0,     0,
       0,   290,   291,  1617,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,  1610,
       0,     0,     0,  1619,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,  1610,     0,     0,     0,  1631,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,  1610,     0,     0,     0,  1635,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1711,   289,     0,     0,  1045,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1713,   289,     0,
       0,  1045,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1714,   289,     0,     0,  1050,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1717,   289,     0,     0,  1045,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1495,   289,  1496,     0,
       0,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1737,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1734,     0,  1045,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1738,   289,  1496,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,  1045,
       0,     0,     0,     0,   290,   291,  1756,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,  1045,     0,     0,     0,     0,   290,   291,  1759,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1712,   289,     0,     0,  1050,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1868,   289,     0,     0,  1045,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1738,   289,  1496,
       0,     0,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1941,   289,     0,     0,  1045,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1973,   289,     0,     0,  1045,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1974,   289,     0,     0,
    1045,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,  2001,   920,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  2002,   289,     0,     0,  1045,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,     0,     0,     0,   290,   291,   494,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,   673,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   920,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,   956,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,     0,     0,   998,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,  1359,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
     662,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,   673,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,     0,     0,     0,   290,   291,  1451,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1478,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1681,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,     0,     0,
    1481,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1684,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,   673,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,  1688,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,   673,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,   673,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1724,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,  1780,     0,   289,     0,
       0,     0,     0,  1781,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1877,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1932,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,  1781,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     629,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   630,     0,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   639,     0,   289,  -257,   835,     0,
       1,   269,    97,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
    -257,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,  -255,   838,  -257,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,  -255,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,  -258,
     835,  -255,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,  -258,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,  -256,   838,  -258,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,  -256,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   376,  -256,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   444,   393,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   466,   445,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     471,   467,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   475,   472,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   835,   476,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   838,  -756,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   835,  -757,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     838,  -753,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   835,  -754,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   838,  -759,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   941,  -760,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   945,   942,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     835,   946,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   838,  -739,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   835,  -740,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   838,  -742,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   835,  -743,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     838,  -667,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   835,  -668,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   838,  -660,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   835,  -661,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   838,  -656,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     835,  -657,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   838,  -646,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,   835,  -647,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   377,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   378,
      32,   379,   380,    35,    36,     0,   381,    38,    39,   382,
       0,     0,   383,   384,   385,   386,     0,   387,     0,   388,
     389,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   390,     0,   391,   392,     0,   838,  -641,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   377,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   378,    32,   379,   380,    35,
      36,     0,   381,    38,    39,   382,     0,     0,   383,   384,
     385,   386,     0,   387,     0,   388,   389,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   390,
       0,   391,   392,     0,   835,  -642,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   377,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   378,    32,   379,   380,    35,    36,     0,   381,    38,
      39,   382,     0,     0,   383,   384,   385,   386,     0,   387,
       0,   388,   389,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   390,     0,   391,   392,     0,
     838,  -658,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   377,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   378,    32,   379,
     380,    35,    36,     0,   381,    38,    39,   382,     0,     0,
     383,   384,   385,   386,     0,   387,     0,   388,   389,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   390,     0,   391,   392,     0,   268,  -659,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,   376,     0,     1,   269,    97,     0,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,    27,     0,   377,     0,
       0,   274,   275,     0,    28,    29,     0,     0,   378,    32,
     379,   380,    35,    36,     0,   381,    38,    39,   382,     0,
       0,   383,   384,   385,   386,     0,   387,     0,   388,   389,
      40,     0,   280,   281,   282,   283,   284,   285,   286,    43,
       0,     0,   390,     0,   391,   392,   444,     0,     1,   269,
      97,     0,   290,   291,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   377,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   378,    32,   379,   380,    35,    36,     0,
     381,    38,    39,   382,     0,     0,   383,   384,   385,   386,
       0,   387,     0,   388,   389,    40,     1,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   390,     0,   391,
     392,     0,     0,     0,     0,     0,     0,   290,   291,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   -1164,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,   508,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   509,     0,   510, -1164,
   -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164,
   -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164,
   -1164,     0, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164,
   -1164, -1164, -1164,     0,     0,     0, -1164,     0, -1164,     0,
       0,     0,     0,     0, -1164, -1164,     0,     0, -1164, -1164,
   -1164, -1164, -1164, -1164,     0,     0, -1164, -1164, -1164, -1164,
   -1164, -1164, -1164, -1164, -1164, -1149, -1164,     0,     0, -1164,
   -1164,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0, -1164,     0,     0, -1164, -1164,
       0, -1164,     0,     0, -1149, -1149, -1149, -1149, -1149, -1149,
   -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,
   -1149, -1149, -1149, -1149, -1149, -1149,     0, -1149, -1149, -1149,
   -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,     0,     0,
       0, -1149,     0, -1149,     0,     0,     0,     0,     0, -1149,
   -1149,     0,     0, -1149, -1149, -1149, -1149, -1149, -1149,     0,
       0, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,
   -1151, -1149,     0,     0, -1149, -1149,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   -1149,     0,     0, -1149, -1149,     0, -1149,     0,     0, -1151,
   -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151,
   -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151,
   -1151,     0, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151,
   -1151, -1151, -1151,     0,     0,     0, -1151,     0, -1151,     0,
       0,     0,     0,     0, -1151, -1151,     0,     0, -1151, -1151,
   -1151, -1151, -1151, -1151,     0,     0, -1151, -1151, -1151, -1151,
   -1151, -1151, -1151, -1151, -1151, -1148, -1151,     0,     0, -1151,
   -1151,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0, -1151,     0,     0, -1151, -1151,
       0, -1151,     0,     0, -1148, -1148, -1148, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148,     0, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148,     0,     0,
       0, -1148,     0, -1148,     0,     0,     0,     0,     0, -1148,
   -1148,     0,     0, -1148, -1148, -1148, -1148, -1148, -1148,     0,
       0, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148,
   -1150, -1148,     0,     0, -1148, -1148,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1148, -1148,     0, -1148,     0,     0, -1150,
   -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150,     0, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150, -1150, -1150,     0,     0,     0, -1150,     0, -1150,     0,
       0,     0,     0,     0, -1150, -1150,     0,     0, -1150, -1150,
   -1150, -1150, -1150, -1150,     0,     0, -1150, -1150, -1150, -1150,
   -1150, -1150, -1150, -1150, -1150,     0, -1150,     1,     0, -1150,
   -1150,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1150, -1150,
       0, -1150,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,   219,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,  1106,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1129,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
     219,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,  1106,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1573,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,   219,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,  1106,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1588,
       2,     3,     4,   239,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,   240,    31,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     0,    40,     0,     0,     0,     0,    42,     0,     0,
       0,    43,     0,     0,    44,     0,     0,     0,     0,     0,
       0,     0,     0,   241,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,   377,     0,     0,     0,     0,     0,
      28,    29,     0,     0,   378,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,   863,     0,
     391,     0,     0,     0,     0,     0,     0,   864,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,   843,     0,     0,   844,     0,     0,     0,     0,
       0,   845,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,   843,     0,     0,  1383,
       0,     0,     0,     0,     0,   845,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,  1598,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
      44,     0,     0,     0,     0,     0,     0,     0,     0,   845,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,  1602,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -110,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   216,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,     0,   217,    38,
     218,     0,     0,     0,     0,  1603,     0,     0,     0,     0,
       0,     0,     0,   219,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   -94,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,  1706,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   -95,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,  1843,     0,     0,
       0,     0,     0,     0,     0,   219,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   -79,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0, -1226,   258,     0,
       1,     0,     0,     0,     0,     0,   219,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   -86,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,    30,    31,     0,    32,    33,    34,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,    40,    41,     0,
       0,     0,    42,     0,     0,     0,    43,     0,     0,    44,
       0,     0,    45,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,   759,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1297,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       1,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,   759,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1629,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,   147,
       0,     1,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,   759,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1630,     2,     3,     4,   148,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,   147,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
      44,     0,     0,   149,     2,     3,     4,   148,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,   543,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,    44,     0,
       0,   149,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,  -898,     0,  -898,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,    44,     0,     0,   544,
    -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,
    -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,  -898,
    -898,  -898,  -898,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -898,     0,
       0,     0,     0,     0,     0,     0,  -898,  -898,     0,     0,
       0,  -898,     0,     0,     0,     0,     0,  -898,  -898,  -898,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,  -898,     0,     0,     0,     0,     0,     0,     0,
       0,  -898,     0,     0,  -898,     0,     0,  -898,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,    30,    31,     0,    32,
      33,    34,    35,    36,     0,    37,    38,    39, -1227,   250,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      40,    41,     0,     0,     0,    42,     0,     0,     0,    43,
       0,     0,    44,     0,     0,    45,     2,     3,     4,   148,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,    33,    34,
      35,    36,     0,    37,    38,    39,   171,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
      44,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     177,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,   171,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,  1106,  1560,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
     855,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   178,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,   171,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   178,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,   171,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1448,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,   147,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1770,     0,     2,     3,
       4,   148,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,   147,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,    44,     0,     0,     2,     3,     4,   148,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,   799,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   800,     2,     3,     4,
     148,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,    44,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,    44,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   654,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1347,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,    44,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,   969,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,   759,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,   970,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   177,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,   975,     0,     1,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,   976,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,   981,     0,     1,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,   982,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   177,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,   784,     0,     1,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     1,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     934,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     1,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,   987,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     1,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     177,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     1,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     1,     0,     0,    32,   433,   434,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     1,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   458,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       1,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,   775,  1557,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   509,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   220
};

static const yytype_int16 yycheck[] =
{
       0,    83,   842,   842,   764,   508,   578,   874,   653,   768,
      78,    91,   485,   772,   908,   508,   485,   518,    91,   520,
      78,   768,    76,   673,    51,   772,   163,   764,   655,   679,
      30,    31,   682,   733,   112,   139,   371,     0,   768,   673,
       1,    41,   772,     1,    44,   679,    84,    84,   682,     1,
     117,    51,    56,    91,     1,    75,    56,     3,    58,    75,
      76,   291,     3,    75,     3,    84,   136,  1488,  1114,   907,
    1116,   909,    75,     3,    74,    75,    76,   104,    78,  1500,
      80,   163,    82,   119,    84,   307,   687,   306,     3,     3,
      30,    91,    92,   139,   161,    95,     1,   111,     3,   236,
       1,   320,    42,   117,   104,   324,    75,   107,   907,   908,
     909,  1409,    75,  1411,    28,    84,   116,   117,   255,   119,
       3,    84,    91,   123,   124,   125,   115,   127,    91,    92,
     119,   131,   733,   133,    73,     5,   136,   137,     1,   139,
     140,   141,   142,   170,   144,     1,   378,   894,     3,   153,
       5,     0,   234,   153,   307,    75,     1,   118,    98,    99,
     160,   161,   102,   121,    84,     1,   118,   113,   109,   110,
     170,   118,     1,   508,   254,   191,   256,   231,   119,   500,
     180,   254,   182,   256,     5,    51,    17,   110,     3,     3,
     190,   191,     3,   425,     0,   500,   119,   110,   112,   127,
     115,   201,   117,   203,   525,   428,   429,   528,    74,   530,
       5,   532,   140,   118,   142,   231,   144,   118,   256,   256,
     525,   170,   794,   528,   244,   530,    75,   532,   244,     1,
     266,   231,   244,   116,   254,    84,   236,   256,  1105,   275,
     240,   244,    91,    92,   244,   281,   127,   600,   601,     1,
     254,   254,   122,  1147,   254,   118,   256,     3,   113,   140,
    1154,   142,   118,   144,  1158,   131,   121,     1,     1,    75,
     374,     3,   775,   118,   274,   776,   777,   798,    84,   115,
     280,   244,   775,     3,   351,    91,    92,   256,   288,   118,
       3,   254,    83,   256,   907,   907,   909,   909,   109,   113,
     240,   112,   133,   117,   119,   312,     5,   121,  1729,     3,
    1148,     5,   123,   395,   396,   397,   398,  1155,     1,     1,
       1,  1159,     3,   117,   190,   120,   275,   373,   374,     3,
     124,   110,   281,   115,   254,   670,   256,   373,     1,     1,
     119,     3,   191,   343,   344,   995,   118,    17,  1147,  1148,
     290,   351,   873,   353,   112,  1154,  1155,   755,   426,  1158,
    1159,   995,   112,   115,   110,   117,   118,   586,   426,   115,
     589,     1,   163,   373,   374,   773,   774,   377,   378,    17,
     112,   115,   115,   117,   384,   191,     1,   387,   388,   389,
     390,   391,   118,   113,  1094,   244,     1,   117,     3,    73,
    1100,   121,     5,   116,   486,   254,     1,   256,     3,    90,
       1,     3,     1,   485,   481,   378,     1,     5,   117,   113,
     420,   421,   422,   236,   119,   425,   426,   121,   428,   429,
     113,   501,   432,   115,   117,   117,   118,   437,   244,   288,
     775,   441,   442,   234,   118,   236,   446,   447,   254,   236,
     256,    17,   115,   520,   117,   790,   118,  1324,   458,   459,
     963,   962,   425,   133,   255,   907,   801,   909,   468,   469,
     963,   701,   312,   473,   474,   491,   492,   477,   478,  1106,
       1,   481,   509,   483,   621,   707,   708,   709,   118,     5,
       1,   491,   492,  1094,   510,   133,   496,  1124,   728,  1100,
     500,   501,     1,   118,  1131,   505,   736,   507,   508,   509,
     510,   538,   512,   118,   117,   737,   738,   739,   518,  1386,
     520,   113,  1568,   118,   112,   525,   756,   118,   528,   118,
     530,     1,   532,   118,     1,  1148,  1148,  1957,   538,     3,
    1300,  1301,  1155,  1155,     3,   625,  1159,  1159,     3,     5,
       5,   551,   625,    74,   707,   708,   709,     5,    79,   791,
     509,     1,  1321,  1300,  1301,    86,     3,   133,   568,    28,
     570,   653,  1466,     3,  1321,   441,   425,   505,   578,   507,
       7,     8,     9,     3,   737,   738,   739,     3,  1428,  1428,
     626,  1321,     1,  2013,   115,   116,   117,   113,   598,   599,
     600,   601,   113,  1106,   395,   625,   117,   398,    28,     1,
      10,    11,     3,  1106,   563,   687,   616,   617,   117,   425,
      77,    11,   625,   118,   505,   625,   507,   850,   851,  1467,
     630,     3,     7,     8,     9,    65,    79,   860,  1397,   862,
    1399,   873,   112,   118,   644,   998,   113,   968,  1001,   113,
     117,   651,   652,   653,   654,   655,   656,     3,   113,   115,
     119,   733,   625,   968,   121,   986,   121,  1466,  1467,   974,
     670,  1401,   755,   613,   614,   980,   113,   117,   121,   109,
     110,   986,    74,   915,   684,   112,  1039,    79,   688,   119,
     773,   774,   112,   120,    86,   486,   123,   113,     5,  1566,
    1053,  1054,  1055,  1056,   113,  1572,  1148,     0,   117,   716,
     717,     1,   719,  1155,   722,  1365,     3,  1159,   658,   659,
     660,   111,   768,   115,   116,   117,   772,   117,   119,   119,
     730,  1365,   768,     1,   734,   771,   772,   744,   745,   746,
     747,    28,   750,   825,   826,   120,   828,   119,   123,   831,
     832,   617,  1087,     7,     8,     9,     3,   110,     3,   759,
     760,   761,   115,  1657,   764,   765,   766,     3,   768,  1104,
     115,   771,   772,   119,  1641,   775,   625,   881,   882,   779,
     780,   630,     1,   125,     3,   598,   599,   600,   601,   789,
     790,   791,    28,     3,   794,   137,   234,   235,   798,   141,
     800,   801,   116,   803,   653,   805,   113,   598,   599,   600,
     601,   598,   599,   600,   601,   117,   898,   887,  1319,   625,
    1658,   670,   112,   113,   630,    11,    73,   117,   791,    74,
     621,   622,   119,   723,    79,   881,   882,     3,   874,   109,
     856,    86,   112,   843,   112,   113,   846,   893,   920,   117,
     850,   851,     3,   123,  1467,  1467,   856,   112,  1657,  1658,
     860,   751,   862,   863,   118,   117,   120,   112,   123,   939,
     940,   118,   872,   873,   874,     3,   716,   717,   123,   719,
      74,   881,   882,   119,   884,    79,   886,   887,     3,   231,
     109,   110,    86,   893,   894,   962,   845,     1,   117,   109,
     110,     7,     8,     9,   744,   745,   746,   747,    74,   119,
     873,  1778,   761,    79,   118,   915,     3,   112,     5,   113,
      86,  1151,  1144,   789,    74,   111,     3,   119,   123,    79,
     116,   117,   274,   119,   883,   118,    86,   964,   280,   939,
     940,    28,   791,   943,   944,  1590,  1518,   947,   948,   798,
     950,    28,   915,   119,   803,   761,   805,     3,   886,   110,
     111,  1434,   962,   963,   964,  1434,   113,  1743,   968,  1041,
      74,   971,   725,  1045,   974,    79,  1048,   977,  1050,     3,
     980,   109,    86,   983,   112,   791,   986,   119,   988,   121,
     726,  1144,   798,   993,   109,   110,   126,   127,   998,   805,
     753,  1001,  1841,   119,   119,   886,   112,   856,   112,   113,
    1010,   116,  1012,   117,   120,   964,   121,   123,   754,    65,
     112,  1021,  1094,     3,   873,  1467,   112,     3,  1100,   371,
       1,   123,   119,   724,  1034,   377,     7,     8,     9,  1039,
    1040,     1,   119,    69,    70,  1658,  1658,   389,   486,     3,
     856,  1078,   113,  1053,  1054,  1055,  1056,  1006,     7,     8,
       9,   752,   118,   109,   110,     3,  1569,   873,     3,  1105,
       5,  1071,  1072,    11,    28,   111,  1569,    11,  1078,   112,
    1080,   117,     7,     8,     9,   109,   110,  1087,   112,    77,
    1030,  1091,   118,  1852,  1853,  1095,    31,  1097,    74,   116,
     442,  1101,     3,    79,     5,  1105,  1106,   898,   112,  1885,
      86,  1887,   722,  1582,    74,   723,   116,  1470,  1471,    79,
     112,   121,  1457,     3,  1124,     5,    86,  1480,     3,   109,
     110,  1131,   119,   109,   121,  1780,    12,    13,  1138,   112,
     750,   112,   118,   751,  1072,   116,  1369,   112,  1371,   120,
     266,    31,   123,    28,   724,   115,   116,   117,  1107,   275,
     598,   599,   600,   601,   725,   281,   115,   116,     3,   112,
    1946,   120,  1948,   111,  1950,  1747,   112,   111,   116,   117,
    1129,   119,   752,   117,   622,   998,   112,   111,  1001,   726,
     111,  1072,   753,   117,     7,   120,   117,    10,    11,    12,
      13,    14,    15,    16,    17,  1145,   112,   998,   109,   110,
    1001,   998,  1988,  1989,  1001,  1991,  1658,   754,  1691,    44,
      45,     1,  1691,     3,    12,    13,  1039,   111,     7,     8,
       9,  2007,   115,   117,   110,   111,   119,   119,  1087,    74,
    1053,  1054,  1055,  1056,    79,    14,    15,  2023,  1039,    74,
      75,    86,  1039,   111,    79,   126,   127,   373,   109,   117,
       3,    86,  1053,  1054,  1055,  1056,  1053,  1054,  1055,  1056,
     111,   119,  1078,   121,   109,  1321,   117,   112,   129,   130,
     119,  1087,  1073,   111,   109,  1321,   121,     3,  1324,   117,
     109,  1291,  1292,   112,    74,  1295,  1296,   110,   111,    79,
    1300,  1301,   125,    74,   234,   235,    86,   120,    79,   651,
     652,     3,     3,   655,   656,    86,   129,   130,   131,   132,
     133,  1321,   110,   111,  1324,    88,    89,    90,   111,   109,
    1330,    74,   112,  1333,   117,   115,    79,   117,   118,  1339,
    1340,   120,     1,    86,     3,  1345,  1346,     1,   119,     3,
    1386,  1397,  1398,  1399,  1400,   131,  1296,   109,    74,     3,
     710,   711,  1434,    79,  1717,  1401,   109,  1367,   113,  1369,
      86,  1371,   117,   111,  1374,   118,   121,   129,   130,   117,
      14,    15,    74,    74,   720,   721,  1386,    79,    79,  1961,
     740,   741,  1392,  1393,    86,    86,   112,  1397,  1398,  1399,
    1400,  1631,  1632,  1633,  1634,  1635,  1636,  1637,  1638,    44,
      45,   124,   748,   749,   127,   712,   713,   109,   109,    16,
      74,   112,   113,  1372,   132,    79,   118,   140,   111,   142,
      74,   144,    86,  1906,   117,    79,   113,  1906,   110,    74,
      75,  1457,    86,   125,    79,   742,   743,   119,   790,   121,
     111,    86,    44,    45,   111,   109,   117,  1457,   112,   801,
     117,   115,   115,   117,   118,   109,   119,   119,   112,   121,
    1470,  1471,   710,   711,   132,   712,   713,   112,  1478,  1525,
    1480,  1481,    74,    75,  1484,    69,    70,    79,  1488,   119,
     131,   121,  1492,  1966,    86,  1495,  1965,  1966,    16,   720,
     721,   113,   740,   741,   113,   742,   743,    91,   117,   119,
     626,    95,   121,    97,   115,   113,   117,   113,  1518,   117,
     112,   117,   116,   121,  1877,  1525,  1879,   748,   749,   115,
    1566,   117,   119,  1605,   118,   509,  1572,   112,  1610,   113,
     113,  1613,   113,   117,   117,   113,   117,   121,   113,   117,
     113,  1491,   117,   119,   117,   113,   486,   270,   113,   117,
     113,   113,   117,  1645,   117,   117,  1566,  1507,   115,  1569,
     113,   115,  1572,   915,   117,  1611,  1612,   113,  1614,  1615,
       1,   117,     3,  1619,  1620,  1621,  1622,   137,  1941,   563,
    1590,   141,  1592,  1593,   117,  1631,  1632,  1633,  1634,  1635,
    1636,  1637,  1638,   110,   115,  1641,   117,   119,  1457,   121,
     119,  1841,   121,    10,    11,  1053,  1054,  1055,  1056,  1691,
     115,     1,  1571,     3,  1573,     1,  1626,     3,  1419,     1,
       1,     3,     3,   110,   115,  1073,   117,   110,  1587,  1588,
     115,  1641,   117,   119,     1,   121,     3,     1,  1648,     3,
    1650,  1457,   768,   823,   824,   771,   772,  1470,  1471,   116,
    1660,     0,   117,     1,     1,     3,     3,  1480,   598,   599,
     600,   601,  1672,   115,  1674,   117,   115,   124,   117,  1470,
    1471,   823,   824,  1470,  1471,   115,   119,   117,   121,  1480,
     491,   492,   622,  1480,   119,  1409,  1696,  1411,  1698,   491,
     492,   598,   599,   119,    83,   598,   599,   420,   421,  1781,
     124,  1711,  1712,  1713,  1714,   765,   766,  1717,   124,   432,
     119,  1721,  1722,   117,  1724,   117,  1726,    91,    92,   117,
     117,   121,   118,   446,   447,   119,    75,   115,  1738,   112,
     115,  1590,  1778,  1965,  1672,    84,  1674,  1747,   115,   112,
    1750,   112,    91,    92,   112,   468,   469,   112,   874,   115,
     473,   474,  1104,   115,   477,   478,   115,   115,  1696,   119,
    1698,   113,   118,   118,   110,   119,   110,   110,  1778,   119,
    1780,   116,  1124,   115,   163,   115,   125,   115,   115,  1131,
     115,  1672,   505,  1674,   507,   118,   118,   113,   137,   113,
     113,  1741,   141,  1743,   124,  1841,  1852,  1853,   113,   124,
     113,   121,  1965,   124,   121,  1696,   112,  1698,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,   121,   112,
    1779,   112,    56,   115,  1906,   115,   115,   112,   110,   110,
    1789,   115,   118,   113,   113,   113,   110,  1847,  1848,  1849,
    1850,  1851,  1852,  1853,   112,   234,   235,   236,  1858,  1859,
    1860,  1861,   112,   123,   110,   113,   113,   123,  1868,   113,
     121,   845,  1954,  1955,   117,   117,   255,  1877,   113,  1879,
     121,   121,   121,   121,   121,   121,   113,   121,  1888,  1889,
     123,   113,   113,   113,  1966,  1844,  1845,   115,   113,   124,
      56,   124,   121,   112,  1717,   244,   113,   124,   121,   883,
     112,   112,   124,   124,   113,   254,   116,   256,   113,   113,
     113,  1849,   113,  1923,  1924,   113,  1717,   113,  1928,  1929,
    1717,  1780,  1932,   110,  1934,   124,     0,  1937,   123,   115,
     124,  1941,   123,    11,   119,  1885,   116,  1887,   119,   121,
     115,   112,   121,   116,   116,  1955,   115,  1957,   113,   119,
     113,  1961,    64,   113,    64,   432,   124,   124,  1849,   113,
     124,   113,   124,   124,  1974,   124,   124,    41,   124,   113,
     115,   113,   113,   124,   124,   124,   124,    51,   115,  1105,
     964,   115,   115,   115,    58,   113,  1996,  1997,   119,   115,
     115,   115,  2002,   115,   115,  1945,  1946,   115,  1948,   115,
    1950,    75,   115,  2013,    78,   432,   115,   115,  1996,    83,
      84,   432,   432,   432,   893,   771,   254,    91,    92,   829,
     884,   656,  1006,  1367,   854,   280,   389,   915,   377,   270,
     104,   270,  1781,   107,   254,   426,  1945,    91,  1988,  1989,
     389,  1991,   231,    84,   270,   119,   236,    84,    92,    84,
     124,   125,  1626,   127,  1877,    -1,  1879,  2007,    -1,    -1,
      -1,    -1,    -1,   137,    -1,   139,   140,   141,   142,    -1,
     144,    -1,    -1,  2023,    -1,    -1,  1877,    -1,  1879,    -1,
    1877,    -1,  1879,    -1,    -1,    -1,    -1,    -1,    -1,   163,
     479,    -1,    -1,   442,    -1,    -1,   170,   486,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   182,    -1,
      -1,    -1,    -1,  1053,  1054,  1055,  1056,   191,  1941,    -1,
      -1,   124,    -1,  1107,   127,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1073,    -1,    -1,    -1,   140,    -1,   142,
    1941,   144,    -1,    -1,  1941,  1129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,
     234,   235,   236,   886,    -1,    -1,    -1,    -1,    -1,    -1,
     244,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     254,   255,   256,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1321,    -1,    -1,  1324,    -1,
     274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,   598,
     599,   600,   601,    -1,   288,    -1,    -1,    -1,    -1,    -1,
     943,   944,    -1,    -1,   947,   948,    -1,    -1,    -1,    -1,
      -1,    -1,   621,   622,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   644,    -1,    -1,    -1,    -1,
    1386,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     344,    -1,    -1,    -1,    -1,  1401,   625,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   673,    -1,    -1,    -1,    -1,    -1,
     679,    -1,    -1,   682,    -1,    -1,    -1,   371,    -1,   373,
     374,    -1,    -1,   377,   378,    -1,    -1,    -1,    -1,    -1,
     384,    -1,    -1,    -1,   388,   389,    -1,   391,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   420,
     421,    -1,     0,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   420,   421,  1071,  1072,
      -1,   425,   426,    -1,    -1,   446,   447,    -1,   432,    -1,
      -1,    -1,    -1,   437,    -1,    -1,    -1,    -1,   442,    -1,
      -1,    -1,   446,   447,    -1,    -1,    -1,   468,   469,    -1,
      -1,    -1,   473,   474,    -1,    -1,   477,   478,  1372,    -1,
      -1,    -1,    -1,    -1,   468,   469,    -1,    -1,    -1,   473,
     474,    -1,    -1,   477,   478,   479,    -1,    75,    -1,    -1,
      -1,    -1,   486,    -1,    -1,    -1,    84,   420,   421,    -1,
      -1,    -1,    -1,    91,    92,    -1,   500,    -1,    -1,    -1,
      -1,   505,    -1,   507,   508,   509,    -1,    -1,    -1,    -1,
    1566,   790,    -1,   446,   447,    -1,  1572,    -1,    -1,    -1,
      -1,   525,   801,    -1,   528,    -1,   530,   125,   532,    -1,
      -1,    -1,    -1,    -1,   538,   468,   469,    -1,    -1,   137,
     473,   474,    -1,   141,   477,   478,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1611,  1612,    -1,  1614,  1615,
      -1,    -1,    -1,  1619,  1620,  1621,  1622,    -1,    -1,    -1,
      -1,    -1,   505,    -1,   507,  1631,  1632,  1633,  1634,  1635,
    1636,  1637,  1638,    -1,    -1,  1641,    -1,    -1,   907,   908,
     909,    -1,    -1,    -1,   598,   599,   600,   601,    -1,    -1,
      -1,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    -1,    -1,    -1,    -1,    -1,   621,   622,    -1,
      -1,   625,    -1,    -1,    -1,    -1,   630,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     644,    -1,    -1,    -1,    -1,    -1,   244,   651,   652,   653,
      -1,   655,   656,    -1,    -1,    -1,   254,  1571,   256,  1573,
      -1,    -1,    -1,    -1,    -1,    -1,   670,    -1,    -1,   673,
      -1,    -1,    -1,  1587,  1588,   679,   995,    -1,   682,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,
     126,   127,  1778,   129,   130,   131,   132,   133,    -1,    -1,
       0,    -1,    -1,    -1,  1053,  1054,  1055,  1056,    -1,  1392,
    1393,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,  1073,    -1,    -1,   761,    -1,    -1,
     764,   765,   766,    -1,   768,    -1,    -1,   771,   772,    -1,
      -1,   775,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   377,
      -1,    -1,    -1,    -1,    -1,  1841,   790,   791,    -1,    -1,
      -1,   389,    -1,    -1,   798,    -1,    -1,   801,    -1,   803,
      -1,   805,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    84,    -1,    -1,    -1,    -1,    -1,
      -1,    91,    92,    -1,    -1,    -1,    -1,    -1,  1147,  1148,
      -1,    -1,    -1,    -1,    -1,  1154,  1155,    -1,    -1,  1158,
    1159,    -1,    -1,    -1,   442,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   856,    -1,    -1,   125,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1779,    -1,   137,    -1,   873,
     874,   141,    -1,    -1,    -1,  1789,    -1,   881,   882,    -1,
     420,   421,   886,    -1,    -1,    -1,   236,    -1,    -1,   893,
     823,   824,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   907,   908,   909,   446,   447,    -1,    -1,
      78,   915,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   943,   944,    -1,    -1,   947,   948,   468,   469,
    1844,  1845,    -1,   473,   474,    -1,    -1,   477,   478,   943,
     944,   291,    -1,   947,   948,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   886,    -1,    -1,    -1,    -1,    -1,   963,
     964,    -1,    -1,    -1,   968,   124,    -1,    -1,   127,    -1,
     974,    -1,    -1,    -1,   244,    -1,   980,    -1,    -1,    -1,
      -1,   140,   986,   142,   254,   144,   256,    -1,    -1,    -1,
      -1,   995,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     943,   944,    -1,    -1,   947,   948,    -1,    -1,    -1,  1672,
      -1,  1674,    -1,    -1,    -1,    -1,    -1,   625,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1696,    -1,  1698,  1365,    -1,    -1,  1053,
    1054,  1055,  1056,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1071,  1072,  1073,
      -1,    -1,    -1,    -1,  1078,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1087,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     0,    -1,
    1104,  1105,  1106,    -1,    -1,    -1,    -1,   377,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   389,
    1124,    -1,    -1,    -1,    -1,    -1,    -1,  1131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   485,    -1,    -1,  1071,  1072,
      -1,    -1,    44,  1147,  1148,    -1,    -1,  1466,  1467,    -1,
    1154,  1155,    -1,    -1,  1158,  1159,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   442,    75,    76,    -1,   344,    -1,    -1,    -1,
      82,    -1,    84,    -1,    -1,    -1,    -1,   537,    -1,    91,
      92,    -1,   790,    -1,  1847,  1848,  1849,  1850,  1851,    -1,
     568,    -1,    -1,   801,    -1,  1858,  1859,  1860,  1861,    -1,
     378,    -1,    -1,    -1,    -1,   117,   118,    -1,   568,    -1,
     388,    -1,   124,   391,    -1,   127,    -1,    -1,    -1,    -1,
      -1,    -1,   600,   601,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,   144,    -1,    -1,    -1,    -1,    -1,   598,   599,
     600,   601,    -1,    -1,    -1,    -1,    -1,    -1,   426,   161,
     162,   420,   421,    -1,   432,    -1,    -1,    -1,    -1,    -1,
    1923,  1924,    -1,   432,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   446,   447,   191,
      -1,    -1,    -1,    -1,    -1,    -1,  1300,  1301,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   657,    -1,   468,
     469,   661,    -1,    -1,   473,   474,    -1,  1321,   477,   478,
    1324,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   231,
      -1,    -1,   500,    -1,    -1,    -1,    -1,   687,  1657,  1658,
     508,    -1,   244,    -1,    -1,    -1,   505,    -1,   507,    -1,
      -1,   701,   254,    -1,   256,   625,    -1,   525,    -1,    -1,
     528,  1365,   530,    -1,   532,    -1,    -1,    -1,    -1,    -1,
      -1,  1392,  1393,    -1,    -1,    -1,    -1,    -1,   728,    -1,
      -1,    -1,  1386,   733,    -1,    -1,   736,    -1,  1392,  1393,
      -1,    -1,    -1,  1397,  1398,  1399,  1400,    -1,    -1,    -1,
      -1,    -1,    -1,   943,   944,    -1,   756,   947,   948,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   351,
      -1,    -1,    -1,  1457,    -1,    -1,    -1,    -1,    28,  1392,
    1393,    -1,  1466,  1467,    -1,    -1,    -1,    -1,    -1,   371,
      -1,    -1,    -1,    -1,    -1,    -1,   378,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   390,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,   420,   421,
     790,  1525,    -1,   425,    -1,    -1,    -1,   429,    98,    -1,
     432,   801,   102,   103,   104,   105,   106,   107,   108,    -1,
      -1,    -1,   112,    -1,   446,   447,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1566,    -1,    -1,  1569,   468,   469,  1572,    -1,
     920,   473,   474,    -1,    -1,   477,   478,    -1,    -1,   481,
      -1,    -1,    -1,    -1,    -1,    -1,  1590,    -1,    -1,   491,
     492,    -1,    -1,    -1,    -1,    -1,   764,   765,   766,    -1,
      -1,    -1,    -1,   505,    -1,   507,   508,   775,   510,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   520,    -1,
     522,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     998,    -1,    -1,  1001,    -1,    -1,    -1,  1641,    -1,    -1,
      -1,    -1,  1010,    -1,    -1,    -1,    -1,    -1,   998,    -1,
      -1,  1001,    -1,  1657,  1658,    -1,    -1,    -1,    -1,    -1,
    1010,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1672,    -1,
    1674,  1039,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1032,  1033,    -1,  1053,  1054,  1055,  1056,  1039,
      -1,  1041,  1696,    -1,  1698,  1045,    -1,    -1,  1048,    -1,
    1050,    -1,    -1,  1053,  1054,  1055,  1056,    -1,    -1,    -1,
      -1,    -1,   124,    -1,    -1,   127,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   625,    -1,    -1,    -1,   886,   140,    -1,
     142,    -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,  1672,
      -1,  1674,    -1,    -1,  1094,    -1,    -1,    -1,    -1,   651,
    1100,    -1,    -1,   655,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1696,    -1,  1698,    -1,    -1,   670,    -1,
      -1,    -1,    -1,    -1,  1778,    -1,  1780,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   943,   944,    -1,    -1,   947,   948,
      -1,    -1,    -1,    -1,    -1,   963,    -1,    -1,    -1,    -1,
     968,  1151,    -1,    -1,    -1,    -1,   974,    -1,    -1,    -1,
      -1,    -1,   980,    -1,    -1,    -1,    -1,    -1,   986,    -1,
      -1,    -1,    -1,    -1,   236,    -1,  1847,  1848,    -1,  1850,
    1851,    -1,    -1,    -1,    -1,    -1,    -1,  1858,  1859,  1860,
    1861,    -1,    -1,  1847,  1848,  1849,  1850,  1851,  1852,  1853,
      -1,    -1,  1392,  1393,  1858,  1859,  1860,  1861,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   775,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   790,   791,
      -1,    -1,    -1,    -1,    -1,    -1,   798,    -1,    -1,   801,
      -1,   803,  1923,  1924,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1071,  1072,  1847,  1848,  1849,  1850,  1851,  1923,
    1924,    -1,    -1,    -1,    -1,  1858,  1859,  1860,  1861,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1106,    -1,
      -1,   843,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   851,
      -1,    -1,    -1,    -1,   856,    -1,    -1,    -1,    -1,    -1,
      -1,   863,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   886,    -1,    -1,    -1,    -1,    -1,
    1923,  1924,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   420,   421,
      -1,    -1,    -1,   915,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   446,   447,    -1,    -1,    -1,    -1,
      -1,   943,   944,    -1,    -1,   947,   948,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   468,   469,   960,    -1,
     962,   473,   474,    -1,    -1,   477,   478,   479,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1434,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   505,    -1,   507,    -1,    -1,    -1,    -1,
      -1,    -1,  1470,  1471,    -1,    -1,    -1,    -1,    -1,    -1,
    1478,    -1,  1480,  1481,    -1,    -1,  1484,    -1,    -1,    -1,
    1470,  1471,    -1,    -1,  1492,    -1,    -1,  1495,  1478,    -1,
    1480,  1481,  1300,  1301,  1484,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1492,    -1,    -1,  1495,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   568,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1071,
    1072,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1087,   598,   599,   600,   601,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1104,    -1,  1106,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    44,
      -1,    -1,  1124,    -1,    -1,    -1,    -1,    -1,    -1,  1131,
      -1,    -1,  1582,  1392,  1393,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1594,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,  1605,    -1,    -1,    -1,    -1,
    1610,   673,    -1,  1613,    -1,    -1,    -1,   679,    -1,    -1,
     682,    -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      -1,   116,   117,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1847,  1848,    -1,
    1850,  1851,    -1,    -1,    -1,    -1,    -1,    -1,  1858,  1859,
    1860,  1861,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   160,   161,    -1,    -1,   170,
      -1,  1691,    -1,  1711,  1712,  1713,  1714,    -1,    -1,  1717,
      -1,    -1,    -1,  1721,  1722,    -1,  1724,    -1,  1726,    -1,
      -1,  1711,  1712,  1713,  1714,    -1,   191,  1717,    -1,    -1,
    1738,  1721,  1722,    -1,  1724,    -1,  1726,    -1,    -1,    -1,
      -1,    -1,    -1,  1923,  1924,    -1,    -1,    -1,  1738,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1748,  1749,
      -1,  1569,    -1,    -1,    -1,    -1,   231,    -1,    -1,    -1,
      -1,   823,   824,    -1,    -1,    -1,    -1,    -1,    -1,   244,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1781,    -1,    -1,    -1,   266,    -1,    -1,  1340,    -1,
     271,   272,    -1,    -1,   275,    -1,    -1,    -1,    -1,    -1,
     281,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     291,    -1,    -1,    -1,    -1,  1367,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   886,    -1,   307,    -1,    -1,    -1,
      -1,   312,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1392,  1393,    -1,    -1,    -1,   907,    -1,   909,    -1,    -1,
    1868,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1877,
      -1,  1879,    -1,  1672,    -1,  1674,    -1,    -1,  1868,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   351,  1877,   353,  1879,
      -1,   943,   944,    -1,    -1,   947,   948,  1696,    -1,  1698,
      -1,    -1,   373,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1457,  1906,    -1,    -1,    -1,
    1928,  1929,    -1,    -1,  1932,   390,  1934,    -1,    -1,  1937,
      -1,    -1,    -1,  1941,    -1,    -1,    -1,    -1,  1928,  1929,
      -1,    -1,  1932,   995,  1934,    -1,   998,  1937,    -1,  1001,
      -1,  1941,    -1,    -1,    -1,    -1,    -1,  1947,  1010,    -1,
     425,    -1,    -1,    -1,    -1,    -1,  1974,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1965,  1966,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1974,    -1,    -1,  1039,    -1,    -1,
      -1,    -1,    -1,    -1,  2002,    -1,    -1,    -1,    -1,    -1,
      -1,  1053,  1054,  1055,  1056,    -1,    -1,    -1,   479,    -1,
      -1,    -1,  2002,    -1,    -1,    -1,   481,    -1,   483,  1071,
    1072,    -1,    -1,    -1,    -1,    -1,   491,   492,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   509,    -1,
      -1,    -1,    -1,   508,    -1,   510,    -1,    -1,  1847,  1848,
    1849,  1850,  1851,   518,    -1,   520,    -1,    -1,    -1,  1858,
    1859,  1860,  1861,    -1,    -1,    -1,   537,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,   291,    -1,    -1,    -1,    -1,   551,    -1,    -1,    -1,
      -1,    -1,   563,    -1,    28,    -1,  1148,   307,    -1,    -1,
      -1,    -1,    -1,  1155,    -1,    -1,    -1,  1159,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1923,  1924,    -1,    -1,    -1,    -1,
    1672,    65,  1674,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    -1,  1696,   626,  1698,    -1,    -1,   630,
      -1,    -1,    -1,  1705,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,   657,    -1,   122,   123,
     661,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   673,    -1,    -1,    -1,    -1,    -1,   679,    -1,
      -1,   682,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     701,    -1,    -1,    -1,    -1,    -1,   707,   708,   709,   710,
     711,   712,   713,    -1,    -1,   716,   717,    -1,   719,   720,
     721,   722,   723,   724,   725,   726,    -1,   728,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   736,   737,   738,   739,   740,
     741,   742,   743,   744,   745,   746,   747,   748,   749,   750,
     751,   752,   753,   754,    -1,   756,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   768,    -1,    -1,
     771,   772,    -1,    -1,    -1,  1847,  1848,  1849,  1850,  1851,
      -1,    -1,    -1,  1365,    -1,    -1,  1858,  1859,  1860,  1861,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   798,    -1,    -1,    -1,    -1,   803,    -1,
    1392,  1393,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1409,    -1,  1411,
      -1,    -1,    -1,   573,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   842,    -1,    -1,   845,    -1,    -1,    -1,   843,    -1,
      -1,  1923,  1924,    -1,    -1,   850,   851,    -1,    -1,    -1,
      -1,   856,    -1,    -1,    -1,    -1,    -1,    -1,   863,    -1,
      -1,    -1,    -1,   874,    -1,    -1,    -1,    -1,   873,    -1,
      -1,    -1,   883,    -1,    -1,  1467,    -1,    -1,  1470,  1471,
      -1,    -1,    -1,    -1,    -1,    -1,  1478,    -1,  1480,  1481,
      -1,    -1,  1484,    -1,    -1,    -1,   907,    -1,   909,   103,
    1492,    -1,    -1,  1495,    -1,    -1,    -1,    -1,    -1,    -1,
     915,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   687,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   701,    -1,   964,    -1,    -1,    -1,   962,    -1,    -1,
      -1,    -1,    -1,   307,    -1,    -1,   170,    -1,    -1,    -1,
     720,   721,   722,   723,   724,    -1,    -1,   727,   728,    -1,
      -1,    -1,    -1,   733,   995,    -1,   736,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1006,    -1,    -1,   748,   749,
     750,   751,   752,    -1,    -1,   755,   756,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1032,  1033,   773,   774,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   266,    -1,    -1,    66,  1658,   271,   272,    -1,
      -1,   275,    -1,    74,    75,    -1,    -1,   281,    79,    -1,
    1672,    -1,  1674,    -1,    85,    86,    87,   291,    -1,    -1,
      -1,    -1,    -1,    -1,  1105,    -1,  1107,    -1,    -1,   100,
      -1,    -1,    -1,   307,  1696,    -1,  1698,    -1,   312,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,  1129,  1711,
    1712,  1713,  1714,    -1,    -1,  1717,    -1,    -1,    -1,  1721,
    1722,    -1,  1724,  1144,  1726,    -1,    28,  1148,    -1,    -1,
    1151,    -1,    -1,    -1,  1155,    -1,  1738,    -1,  1159,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   373,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,   573,
     122,   123,   124,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   170,
      -1,    -1,    -1,    -1,    -1,  1847,  1848,  1849,  1850,  1851,
      -1,    -1,    -1,  1013,    -1,    -1,  1858,  1859,  1860,  1861,
      -1,    -1,    -1,    -1,    -1,   479,  1868,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1877,    -1,  1879,    -1,    -1,
      -1,  1041,    -1,    -1,    -1,    -1,    -1,    -1,  1048,    -1,
      -1,    -1,    -1,    -1,    -1,   509,    -1,    -1,    -1,    -1,
    1321,    -1,    -1,  1324,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1923,  1924,   537,  1339,  1340,  1928,  1929,    -1,    -1,
    1932,    -1,  1934,   687,  1094,  1937,    -1,    -1,    -1,  1941,
    1100,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,   563,
      -1,  1372,  1367,    -1,  1369,    -1,  1371,    -1,    -1,    -1,
     291,    -1,    -1,    -1,    -1,  1386,   720,   721,   722,   723,
     724,    -1,  1974,   727,    -1,    -1,    -1,    -1,    -1,   733,
    1401,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1409,    -1,
    1411,  1151,    -1,    -1,   748,   749,   750,   751,   752,    -1,
    2002,   755,    -1,    -1,    -1,    -1,    -1,  1428,    -1,    -1,
      -1,    -1,   626,    -1,    -1,    -1,   630,    -1,    -1,   773,
     774,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1457,   657,    -1,    -1,  1467,   661,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   673,
      -1,    -1,    -1,    -1,    -1,   679,    -1,    -1,   682,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   701,    -1,    -1,
      -1,    -1,    -1,   707,   708,   709,   710,   711,   712,   713,
      -1,    -1,   716,   717,    -1,   719,   720,   721,   722,   723,
     724,   725,   726,    -1,   728,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   736,   737,   738,   739,   740,   741,   742,   743,
     744,   745,   746,   747,   748,   749,   750,   751,   752,   753,
     754,    -1,   756,    -1,    -1,  1566,    -1,    -1,   479,    -1,
    1571,  1572,  1573,    -1,   768,    -1,    -1,   771,   772,    -1,
      -1,  1582,    -1,    -1,    -1,    -1,  1587,  1588,    -1,    -1,
      -1,    -1,    -1,  1594,    -1,    -1,    -1,    -1,   509,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1611,  1612,    -1,  1614,  1615,    -1,    -1,    -1,  1619,  1620,
    1621,  1622,    -1,    -1,    -1,    -1,   537,    -1,    -1,    -1,
    1631,  1632,  1633,  1634,  1635,  1636,  1637,  1638,    -1,    -1,
    1641,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   842,    -1,
      -1,   845,   563,  1648,    -1,  1650,    -1,  1658,    -1,     3,
      -1,    -1,    -1,    -1,    -1,  1660,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1013,
     874,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,   883,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,  1041,    -1,    -1,
      -1,    -1,    -1,   907,  1048,   909,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,   657,  1748,  1749,    -1,
     661,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
    1094,    -1,   673,    -1,    -1,    -1,  1100,    -1,   679,    -1,
     964,   682,    -1,    -1,    -1,    -1,    -1,  1778,  1779,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1789,    -1,
     701,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   995,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1006,    -1,    -1,    -1,    -1,   728,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   736,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1032,  1033,
    1841,    -1,    -1,  1844,  1845,   756,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1605,    -1,    -1,    -1,    -1,
    1610,  1611,  1612,  1613,  1614,  1615,    -1,    -1,    -1,  1619,
    1620,  1621,  1622,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1631,  1632,  1633,  1634,  1635,  1636,  1637,  1638,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1105,    -1,  1107,    -1,    -1,    -1,    -1,    -1,    -1,
       0,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   842,    -1,    -1,   845,  1129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1947,    -1,    -1,    -1,
    1144,    -1,    -1,    -1,  1148,    -1,    -1,  1151,    -1,    -1,
      -1,  1155,    -1,    43,  1965,  1159,     1,    -1,     3,     4,
       5,     6,   883,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    75,   907,    -1,   909,    -1,
      -1,    -1,    -1,    83,    84,    -1,    -1,    -1,    -1,    -1,
      -1,    91,    92,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,   119,
      -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,    84,
      85,    -1,    -1,   964,    -1,    -1,    -1,   137,    -1,   139,
      -1,   141,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,   163,   995,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,    -1,  1006,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   191,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1032,  1033,    -1,    -1,    -1,    -1,  1321,    -1,    -1,
    1324,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   231,    -1,    -1,   234,   235,   236,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   244,    -1,    -1,    -1,    -1,    -1,
      -1,  1365,    -1,    -1,   254,   255,   256,    -1,  1372,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1386,    -1,   274,    -1,  1107,    -1,    -1,    -1,
     280,    -1,    -1,    -1,    -1,    -1,    -1,  1401,   288,    -1,
      -1,    -1,    -1,    -1,    -1,  1409,    -1,  1411,  1129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,  1428,     8,     9,  1148,    -1,    -1,
    1151,    -1,    -1,    -1,  1155,    -1,    -1,    -1,  1159,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1605,    -1,  1467,    -1,    -1,  1610,  1611,  1612,  1613,
    1614,  1615,    -1,    -1,    -1,  1619,  1620,  1621,  1622,    -1,
      -1,   371,    65,   373,   374,    -1,    -1,   377,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   389,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,   117,   425,    -1,    -1,    -1,   122,
     123,   124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,   442,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1566,    -1,    -1,    -1,    -1,  1571,  1572,  1573,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1582,    -1,
      -1,    -1,    -1,  1587,  1588,    -1,    -1,    -1,    -1,   479,
    1594,    -1,    -1,    -1,    -1,    -1,   486,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1611,  1612,    -1,
    1614,  1615,    -1,    -1,    -1,  1619,  1620,  1621,  1622,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1631,  1632,  1633,
    1634,  1635,  1636,  1637,  1638,    -1,    -1,  1641,    -1,    -1,
      -1,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,    -1,
      -1,  1372,    -1,    -1,  1658,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   575,    -1,    -1,  1409,    -1,
    1411,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,  1428,   598,   599,
     600,   601,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,   621,   622,    -1,    -1,   625,   109,    -1,    -1,   112,
     630,    -1,    -1,    -1,  1748,  1749,  1467,    -1,    -1,    -1,
     123,    -1,    -1,    -1,   644,    -1,    -1,    -1,    -1,    -1,
      -1,   651,   652,   653,    -1,   655,   656,    -1,    -1,    -1,
       1,    -1,    -1,    -1,  1778,  1779,    -1,    -1,    -1,    -1,
     670,    -1,    -1,   673,    -1,  1789,    -1,    -1,    -1,   679,
      -1,    -1,   682,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,  1841,    -1,    -1,
    1844,  1845,    -1,    74,    75,    -1,    -1,    28,    79,    -1,
    1571,    -1,  1573,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,  1582,    -1,    -1,    -1,    -1,  1587,  1588,    -1,   100,
      -1,   761,    -1,  1594,    -1,    -1,    -1,    -1,   768,    -1,
      -1,   771,   772,    -1,    65,    -1,    -1,    -1,   119,    -1,
      71,    72,    73,    -1,    83,    -1,    -1,    -1,    -1,    -1,
     790,   791,    -1,    84,    85,    -1,    -1,    -1,   798,    -1,
      -1,   801,   802,   803,    -1,   805,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
     119,   112,   113,   114,    -1,    -1,   125,  1658,   119,    -1,
      -1,   122,   123,  1947,   125,   126,   127,   128,   137,    -1,
     139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1965,    -1,    -1,    -1,    -1,   856,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   873,   874,    -1,    -1,    -1,    -1,    -1,
      -1,   881,   882,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    83,   191,   893,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   907,   908,   909,
      -1,    -1,    -1,    -1,    -1,   915,    -1,  1748,  1749,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   231,    -1,    -1,   234,   235,   236,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,  1779,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   255,    -1,  1789,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   163,    -1,    -1,    -1,   274,    -1,    -1,    -1,    -1,
      -1,   280,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   995,    -1,    -1,    -1,   191,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,  1844,  1845,  1015,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,   231,
      -1,    -1,   234,   235,   236,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,  1053,  1054,  1055,  1056,    74,    75,    -1,
      -1,    -1,    79,   255,    -1,    82,    83,    -1,    85,    86,
      87,    -1,   371,  1073,   373,   374,    -1,    -1,   377,    -1,
      -1,    -1,   274,   100,    -1,    -1,    -1,  1087,   280,    -1,
     389,    -1,   109,    -1,    -1,   112,   288,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1104,  1105,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1947,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1124,    -1,   425,    -1,    -1,    -1,
      -1,  1131,    -1,    -1,  1965,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   442,    -1,    -1,    -1,  1147,  1148,    -1,
      -1,    -1,    -1,    -1,  1154,  1155,    -1,    -1,  1158,  1159,
      -1,    -1,    -1,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   371,
     479,   373,   374,    -1,    -1,    -1,    -1,   486,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,   425,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,   118,   119,   120,   121,   122,   123,   479,   125,   126,
     127,   128,    -1,    -1,   486,    -1,    -1,    -1,    -1,   598,
     599,   600,   601,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1321,   621,   622,  1324,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   644,    -1,    -1,    -1,    -1,
      -1,    -1,   651,   652,    -1,    -1,   655,   656,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   673,    -1,    -1,    -1,    -1,    -1,
     679,    -1,    -1,   682,    -1,    -1,  1386,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1397,  1398,  1399,
    1400,    -1,    -1,    -1,    -1,    -1,   598,   599,   600,   601,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   621,
     622,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   630,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   644,    -1,    -1,    -1,    -1,  1457,    -1,   651,
     652,   653,   761,   655,   656,    -1,  1466,  1467,    -1,   768,
      -1,    -1,   771,   772,    -1,    -1,    -1,    65,   670,    -1,
      -1,   673,    -1,    71,    72,    73,    -1,   679,    -1,    -1,
     682,   790,   791,    -1,    -1,    -1,    84,    85,    -1,   798,
      -1,    -1,   801,    -1,    -1,    -1,   805,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,  1525,   114,    -1,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   856,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1566,    -1,    -1,   761,
       0,    -1,  1572,    -1,   873,   874,   768,    -1,    -1,   771,
     772,    -1,   881,   882,    -1,    -1,    -1,    -1,    -1,    -1,
    1590,    -1,    83,    -1,   893,    -1,    -1,    -1,    -1,   791,
      -1,    -1,    -1,    -1,    -1,    -1,   798,    -1,   907,   908,
     909,   803,    -1,   805,    44,    -1,   915,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1641,    -1,    -1,    -1,    75,    76,    -1,   139,    -1,
      80,    -1,    82,    -1,    84,    -1,    -1,  1657,  1658,    -1,
      -1,    91,    92,    -1,   856,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   163,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   873,   874,    -1,    -1,    -1,   116,   117,    -1,   881,
     882,    -1,    -1,    -1,    -1,    -1,   995,    -1,    -1,    -1,
     191,   893,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   907,   908,   909,    -1,    -1,
      -1,    -1,    -1,   915,    -1,    -1,    -1,    -1,    -1,    -1,
     160,   161,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     231,    -1,    -1,   234,   235,   236,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1053,  1054,  1055,  1056,    -1,    -1,
      -1,   191,    -1,    -1,   255,    -1,    -1,    -1,    -1,    -1,
      -1,   201,    -1,   203,  1073,    -1,    -1,    -1,  1778,    -1,
    1780,    -1,    -1,   274,    -1,    -1,    -1,    -1,    -1,   280,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   288,    -1,    -1,
      -1,   231,    -1,   995,    -1,  1104,  1105,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   244,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   254,  1124,   256,    -1,    -1,    -1,
      -1,    -1,  1131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1147,  1148,
      -1,    -1,  1852,  1853,    -1,  1154,  1155,    -1,    -1,  1158,
    1159,  1053,  1054,  1055,  1056,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     371,  1073,   373,   374,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1087,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1104,  1105,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   351,    -1,   353,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1124,    -1,   425,    -1,    -1,    -1,    -1,  1131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1147,  1148,    -1,    -1,    -1,
     390,    -1,  1154,  1155,    -1,    -1,  1158,  1159,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   479,    -1,
      -1,    -1,    -1,    -1,    -1,   486,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,  1321,    -1,    -1,  1324,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,   481,    -1,   483,    -1,    85,    86,    87,    -1,    -1,
      -1,   491,   492,    -1,    -1,    -1,  1365,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   508,   109,
     510,    -1,   112,    -1,    -1,    -1,    -1,  1386,   518,   119,
     520,    -1,    -1,   123,    -1,    -1,    -1,    -1,  1397,  1398,
    1399,  1400,    -1,    -1,    -1,    -1,    -1,   598,   599,   600,
     601,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   551,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1321,
     621,   622,  1324,    -1,    -1,    -1,    -1,    -1,    -1,   630,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   644,    -1,    -1,    -1,    -1,  1457,    -1,
     651,   652,   653,    -1,   655,   656,    -1,  1466,  1467,    -1,
      -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,    -1,   670,
      -1,    -1,   673,    -1,    -1,    -1,    -1,    -1,   679,    -1,
      -1,   682,    -1,    -1,  1386,   625,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1397,  1398,  1399,  1400,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,  1525,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1457,    -1,  1566,    -1,    -1,
     761,    -1,    -1,  1572,  1466,  1467,    -1,   768,    65,    -1,
     771,   772,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,
     791,    -1,    -1,    -1,    -1,    -1,    -1,   798,    -1,    -1,
      -1,    98,   803,    -1,   805,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
      83,    -1,   119,  1525,    -1,   122,   123,    -1,   125,   126,
     127,   128,  1641,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1657,  1658,
      -1,    -1,    -1,    -1,    -1,   856,   119,    -1,    -1,    -1,
      -1,    -1,   125,   803,  1566,    -1,    -1,    -1,    -1,    -1,
    1572,    -1,   873,   874,   137,    -1,   139,    -1,   141,    -1,
     881,   882,    -1,    -1,    -1,    -1,    -1,    -1,  1590,    -1,
      -1,    -1,   893,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     163,    -1,    -1,   843,    -1,    -1,   907,   908,   909,    -1,
      -1,    -1,    -1,    -1,   915,    -1,   856,    -1,    -1,    -1,
      -1,    -1,    -1,   863,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1641,
      -1,    -1,    -1,    83,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1657,  1658,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   231,  1778,
      -1,   234,   235,   236,    -1,    -1,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,
      -1,    -1,   255,    -1,   995,    -1,    -1,   137,    -1,   139,
      -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,
      -1,    -1,   962,   163,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1852,  1853,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1053,  1054,  1055,  1056,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1073,    -1,    -1,    -1,  1778,    -1,  1780,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1087,    -1,    -1,    -1,
      -1,   231,    -1,    -1,   234,   235,   236,    -1,    -1,    -1,
      -1,    -1,    -1,  1104,  1105,    -1,    -1,    -1,   371,    -1,
     373,   374,    -1,    -1,   377,   255,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1124,    -1,    -1,   389,    -1,    -1,    -1,
    1131,    -1,    -1,    -1,   274,    -1,    -1,    -1,    -1,    -1,
     280,    -1,    -1,    -1,    -1,    -1,  1147,  1148,    -1,    -1,
    1852,  1853,    -1,  1154,  1155,    -1,    -1,  1158,  1159,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   442,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,   479,    -1,    -1,    -1,
      -1,   236,    -1,   486,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   371,    -1,   373,   374,    -1,    -1,   377,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,   389,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,   288,    88,    89,    90,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,   442,   117,    -1,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
    1321,    -1,    -1,  1324,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   598,   599,   600,   601,   479,
      -1,    -1,    -1,    -1,    -1,    -1,   486,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   621,   622,
      -1,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   390,    -1,    -1,    -1,    -1,
      -1,   644,    -1,    -1,    -1,  1386,    -1,    -1,   651,   652,
      -1,    -1,   655,   656,    -1,    -1,  1397,  1398,  1399,  1400,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     673,    -1,    -1,    -1,    -1,    -1,   679,    -1,    -1,   682,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1457,    -1,   598,   599,
     600,   601,    -1,    -1,    66,  1466,  1467,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,   621,   622,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,   644,   768,    -1,   109,   771,   772,
     112,   651,   652,    -1,    -1,   655,   656,  1457,    -1,    -1,
      -1,   123,    -1,    -1,  1525,    -1,    -1,   790,    -1,    -1,
      -1,    -1,    -1,   673,    -1,    -1,    -1,    -1,   801,   679,
      -1,    -1,   682,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   573,   119,
      -1,    -1,    -1,    -1,    -1,  1566,    -1,    -1,    -1,    -1,
      -1,  1572,    -1,   588,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   598,   599,   600,   601,    -1,    -1,  1590,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     170,   874,    -1,    -1,    -1,    -1,    -1,    -1,   881,   882,
      -1,    -1,    -1,    -1,   639,    -1,    -1,    -1,   768,    -1,
     893,   771,   772,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1641,    -1,    -1,    -1,   907,   908,   909,    -1,    -1,   664,
     790,    -1,   915,    -1,     3,    -1,  1657,  1658,    -1,    -1,
      -1,   801,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   689,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,   266,    -1,    -1,    -1,
      -1,    -1,   727,    -1,    -1,   275,    -1,    66,    -1,    -1,
     735,   281,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,   995,    -1,   874,    -1,    85,    86,    87,    -1,
     755,   881,   882,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   893,    -1,    -1,    -1,    -1,   773,   774,
     109,    -1,    -1,   112,    -1,    -1,    -1,   907,   908,   909,
     119,    -1,    -1,    -1,   123,   915,    -1,  1778,    -1,  1780,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   803,     1,
    1053,  1054,  1055,  1056,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1073,    -1,    -1,   373,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,  1104,  1105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1852,  1853,    -1,    66,   995,    -1,    -1,    -1,    -1,
      -1,  1124,    74,    75,    -1,    -1,    -1,    79,  1131,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1147,  1148,    -1,    -1,   100,    -1,
      -1,  1154,  1155,    -1,    -1,  1158,  1159,    -1,    -1,    -1,
      -1,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,    -1,
      -1,    -1,    -1,  1053,  1054,  1055,  1056,    -1,    -1,   479,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1073,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   509,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1104,  1105,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   998,  1124,    -1,  1001,  1002,  1003,    -1,
    1005,  1131,    -1,    -1,    -1,    -1,    -1,    -1,  1013,    -1,
      -1,    -1,    -1,   563,    -1,    -1,  1021,  1147,  1148,    -1,
      -1,    -1,    -1,  1028,  1154,  1155,    -1,    -1,  1158,  1159,
      -1,    -1,    -1,    -1,  1039,    -1,    -1,    -1,    -1,    -1,
      -1,  1046,    -1,    -1,    -1,    -1,  1051,    -1,  1053,  1054,
    1055,  1056,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,  1321,    -1,
      -1,  1324,    -1,    -1,    -1,    -1,   626,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1096,    -1,    -1,    -1,    -1,    -1,  1102,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1365,    -1,    -1,    -1,    -1,    -1,    65,    -1,
    1125,    -1,    -1,   673,    71,    72,    73,    -1,    -1,   679,
      -1,    -1,   682,  1386,    -1,    -1,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,  1397,  1398,  1399,  1400,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,  1169,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1321,    -1,    -1,  1324,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1466,  1467,    -1,  1221,    -1,   768,    -1,
      -1,   771,   772,    -1,    -1,    -1,    -1,    -1,    -1,  1234,
      -1,    -1,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   288,    -1,    -1,    -1,  1386,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1397,  1398,  1399,
    1400,    -1,  1525,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1285,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   842,    -1,    -1,   845,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1311,    -1,    -1,    -1,
    1315,    -1,    -1,  1566,    -1,    -1,    -1,    -1,    -1,  1572,
      -1,    -1,    -1,    -1,   874,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   883,    -1,    -1,  1466,  1467,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   390,    -1,    -1,   907,    -1,   909,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,  1641,    -1,
      -1,    -1,    -1,    -1,    -1,  1525,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,  1657,  1658,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,   964,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1566,   100,    -1,    -1,
      -1,    -1,  1572,    -1,    -1,   995,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,    -1,    -1,  1006,    -1,    -1,    -1,
     123,    -1,    -1,    -1,    -1,  1470,  1471,    -1,    -1,  1474,
      -1,  1476,    -1,    -1,  1479,  1480,    -1,    -1,    -1,    -1,
    1485,  1486,    -1,  1488,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1498,    -1,  1500,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1641,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1778,    -1,  1657,  1658,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   573,    -1,    -1,
    1545,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1554,
      -1,    -1,   588,    -1,    -1,  1105,   592,  1107,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1148,  1852,
    1853,    -1,    -1,   639,    -1,  1155,    -1,    -1,    -1,  1159,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   653,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,   664,   665,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    -1,  1778,    -1,
      -1,    -1,    -1,   689,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,   121,   122,   123,     0,   125,   126,   127,   128,
      -1,   727,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   735,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1717,  1718,    -1,    -1,    -1,    -1,    -1,   755,
    1725,    -1,  1852,  1853,  1729,    -1,  1731,    -1,    43,    44,
      -1,    -1,    -1,    -1,    -1,  1740,    -1,   773,   774,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,   803,    -1,    84,
      -1,  1321,    -1,    -1,  1324,  1780,    91,    92,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,   116,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1365,    -1,    -1,    -1,    -1,
      -1,    -1,  1372,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1386,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   160,    -1,    -1,    -1,    -1,
      -1,  1401,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1409,
      -1,  1411,    -1,    -1,  1869,  1870,    -1,  1872,    -1,  1874,
      -1,    -1,  1877,  1878,  1879,    -1,   191,    -1,  1428,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   231,  1467,    -1,    -1,
      -1,    -1,    -1,    -1,    66,  1930,    -1,    -1,  1933,   244,
      -1,    -1,    74,    75,    -1,    -1,  1941,    79,    -1,   254,
      -1,   256,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1002,  1003,    -1,  1005,
      -1,    -1,  1977,    -1,    -1,    -1,   118,  1013,    -1,    -1,
      -1,  1017,    -1,    -1,    -1,  1021,    -1,    -1,    -1,    -1,
      -1,    -1,  1028,  1029,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1046,  1047,    -1,    -1,    -1,  1051,  1566,    -1,    -1,    -1,
      -1,  1571,  1572,  1573,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1587,  1588,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   371,    -1,    -1,    -1,
    1096,  1611,  1612,    -1,  1614,  1615,  1102,    -1,    -1,  1619,
    1620,  1621,  1622,    -1,    -1,   390,    -1,    -1,    -1,    -1,
      -1,  1631,  1632,  1633,  1634,  1635,  1636,  1637,  1638,  1125,
      -1,  1641,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1658,    -1,
     425,    -1,    -1,   428,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1169,  1170,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    44,
      -1,    -1,    -1,    -1,    -1,    -1,   491,   492,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1221,    -1,  1223,    -1,    -1,
      -1,    -1,    -1,   508,    -1,   510,    -1,    -1,  1234,  1235,
      75,    76,    -1,   518,    -1,    80,    -1,    82,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1778,  1779,
      -1,    -1,    -1,    -1,    -1,    -1,   551,    -1,    -1,  1789,
      -1,   116,   117,    -1,    -1,    -1,    -1,    -1,    -1,  1285,
      -1,  1287,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,  1311,    -1,  1313,    -1,  1315,
      -1,  1317,    -1,    -1,    -1,   160,   161,    28,    -1,    -1,
      -1,  1841,    -1,    -1,  1844,  1845,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     625,    -1,    -1,    -1,    -1,    -1,   191,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,   201,    -1,   203,    -1,
      71,    72,    73,    -1,    -1,    -1,   651,    -1,    -1,    -1,
     655,    -1,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   670,   231,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   244,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1474,  1475,
    1476,  1477,    -1,  1479,  1480,    -1,    -1,    -1,    -1,  1485,
    1486,    -1,  1488,    -1,  1490,    -1,    -1,    -1,    -1,    -1,
     775,   776,  1498,  1499,  1500,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   790,   351,    -1,   353,    -1,
      -1,    -1,    -1,   798,    -1,    -1,   801,   802,   803,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1545,
    1546,    -1,    -1,    -1,    -1,   390,    -1,    -1,  1554,  1555,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   843,    -1,
      65,    -1,    -1,    -1,    -1,   850,    71,    72,    73,    -1,
      -1,   856,    -1,    -1,    -1,    -1,    -1,    -1,   863,    84,
      85,    -1,    -1,   428,   429,    -1,    -1,    -1,   873,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
     915,    -1,    -1,    -1,    -1,    -1,   481,    -1,   483,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   491,   492,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   508,    -1,   510,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   518,     1,   520,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,   551,    -1,    -1,    -1,
      -1,    -1,  1718,    -1,    -1,    -1,    -1,  1723,    -1,  1725,
    1726,    -1,  1728,  1729,    -1,  1731,    -1,  1733,    -1,    -1,
      -1,    -1,    -1,  1739,  1740,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,  1780,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,  1087,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1104,
      -1,  1106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1124,
      -1,    -1,    -1,    -1,    -1,    -1,  1131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1869,  1870,    -1,  1872,  1873,  1874,    -1,
      -1,     1,  1878,  1879,    -1,    -1,    -1,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,  1930,  1931,    -1,  1933,  1934,    -1,
      -1,    -1,  1938,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,   803,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,  1977,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,    -1,    -1,   115,   116,   117,   118,    -1,
     120,    -1,     1,   123,     3,   125,   126,   127,   843,   129,
     130,   131,   132,   133,    -1,   850,   851,    -1,    -1,    -1,
      -1,   856,    -1,    -1,    -1,   860,    -1,   862,   863,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1339,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,  1367,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   123,    -1,    -1,   962,    -1,    -1,
      -1,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,  1457,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,  1660,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,  1369,    96,  1371,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       0,     1,  1457,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     1,    -1,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   128,   129,
     130,   131,   132,   133,     0,     1,    -1,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   121,   122,   123,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   133,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,     0,     1,    -1,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,   119,   120,   121,   122,   123,
      -1,   125,   126,   127,   128,   129,   130,   131,   132,   133,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,     0,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     0,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    78,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    -1,    96,    -1,    98,    99,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     0,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,     0,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     0,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,    -1,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,     0,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,   121,   122,   123,    -1,   125,   126,   127,   128,
       0,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,     0,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     0,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    -1,    -1,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,
     118,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,     1,   114,     3,     4,     5,     6,    -1,
       8,     9,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,     1,   114,     3,     4,     5,
       6,    -1,     8,     9,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    84,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    84,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    84,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,     1,   114,     3,     4,     5,     6,   119,
       8,     9,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    84,    85,    86,    87,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      98,    -1,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,    28,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    -1,    88,    89,    90,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,    -1,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    -1,    88,    89,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,    -1,    -1,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    -1,    88,    89,    90,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,   119,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      -1,    88,    89,    90,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    -1,   119,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,   124,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,   124,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,   115,    -1,   117,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,   115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,
      -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,   117,    -1,    -1,    -1,   121,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,
      -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,   117,    -1,    -1,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,   117,    -1,    -1,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,
      -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,   118,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   122,   123,   124,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,    -1,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,    -1,   114,     0,     1,    -1,
       3,     4,     5,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,     0,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,     0,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,     0,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,     1,   118,     3,     4,     5,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    88,    -1,    -1,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,     1,   118,     3,     4,     5,   122,
     123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,    88,    -1,    -1,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
       1,   118,     3,     4,     5,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,     1,   118,     3,     4,
       5,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,     1,    -1,     3,     4,     5,    -1,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    88,    -1,
      -1,    91,    92,    93,    94,    -1,    96,    -1,    98,    99,
     100,    -1,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,     1,    -1,     3,     4,
       5,    -1,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,     3,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       0,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   123,    -1,   125,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    -1,    86,    87,    88,    89,
      90,    91,    92,    93,    94,     0,    96,    -1,    -1,    99,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   115,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      -1,    86,    87,    88,    89,    90,    91,    92,    93,    94,
       0,    96,    -1,    -1,    99,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     115,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    -1,    86,    87,    88,    89,
      90,    91,    92,    93,    94,     0,    96,    -1,    -1,    99,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   115,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    -1,
      -1,    86,    87,    88,    89,    90,    91,    92,    93,    94,
       0,    96,    -1,    -1,    99,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    78,    79,
      80,    81,    82,    83,    -1,    -1,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    -1,    96,     3,    -1,    99,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,   119,
      -1,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   123,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,   100,    -1,    -1,    -1,    -1,   105,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,    -1,    -1,   121,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,   115,    -1,    -1,    -1,    -1,
      -1,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,    -1,    -1,    -1,    -1,   121,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,     1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,     0,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,    77,    -1,    79,    80,    81,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,   101,    -1,
      -1,    -1,   105,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    76,    77,    -1,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,     0,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,   101,    -1,    -1,    -1,   105,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    80,    81,
      82,    83,    -1,    85,    86,    87,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,   107,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     1,    -1,     3,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     1,    -1,     3,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     1,    -1,     3,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     3,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,     3,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,     3,    -1,    -1,    79,    80,    81,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       3,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   123,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    53,    65,    66,    74,    75,
      76,    77,    79,    80,    81,    82,    83,    85,    86,    87,
     100,   101,   105,   109,   112,   115,   135,   136,   137,   139,
     164,   201,   202,   203,   204,   205,   206,   261,   264,   265,
     268,   269,   270,   271,   272,   273,   274,   276,   280,   283,
     284,   285,   286,   287,   288,   293,   294,   302,   303,   304,
     307,   308,   311,   315,   342,   345,   346,   364,   365,   367,
     368,   369,   370,   371,   372,    77,   121,     5,    31,   206,
     366,   206,   112,   112,   112,   139,   206,   366,   274,   275,
     307,   311,   206,   302,   304,   306,   307,   311,   314,   110,
     115,   136,   137,   206,   119,   121,   115,   119,   118,   109,
     110,   201,   206,   119,   139,   206,   119,   121,   118,   110,
     119,   121,   119,   118,   119,   137,   206,     1,    31,   115,
     135,   203,   205,   206,   261,   271,   272,   274,   276,   304,
     307,   311,   314,   315,   323,   324,   325,   326,   325,   112,
     123,     1,    29,    30,    31,    32,    33,    65,   113,   135,
     206,   260,   264,   266,   267,   274,   276,   280,   281,   282,
     288,   292,   300,   301,   329,   330,   331,   332,   333,   334,
     304,   311,   304,   307,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    66,    85,    87,   100,
     119,   139,   160,   161,   260,   265,   266,   274,   277,   281,
     283,   291,   344,   347,   348,   349,   354,   355,   356,    31,
      76,   121,   203,   205,   293,   345,   346,   364,   365,   372,
       1,   203,   270,   287,   293,   315,   342,   368,     1,   367,
     368,     0,   206,   366,   366,     5,   116,   366,     1,     4,
       6,     8,     9,    65,    71,    72,    73,    84,    85,    98,
     102,   103,   104,   105,   106,   107,   108,   109,   112,   114,
     122,   123,   125,   126,   127,   128,   139,   165,   166,   206,
     207,   208,   209,   212,   213,   217,   218,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     233,   234,   238,   240,   241,   243,   244,   245,   246,   247,
     248,   249,   250,   251,   252,   253,   254,   366,   378,   379,
     380,   381,   136,   206,   119,   139,   206,   274,   311,   302,
     304,   311,   306,   307,   113,   307,    85,   139,   190,   191,
     193,   195,   199,   200,   206,   218,   232,   233,   241,   253,
     258,   291,   115,   110,   110,   115,     1,    68,    78,    80,
      81,    85,    88,    91,    92,    93,    94,    96,    98,    99,
     112,   114,   115,   118,   139,   140,   141,   142,   143,   144,
     145,   146,   147,   162,   163,   165,   166,   169,   170,   171,
     172,   173,   174,   175,   176,   177,   178,   182,   186,   187,
     188,   189,   206,   213,   238,   292,   303,   305,   307,   311,
     315,   316,   343,    80,    81,   206,   260,   264,   274,   277,
     280,   288,   295,   296,     1,   118,   188,   189,   137,   206,
       1,   206,   262,   263,     1,   118,   263,   296,    65,   190,
     192,   194,   196,   197,   198,   206,     1,   118,   188,   189,
     296,     1,   118,   188,   189,     1,   118,   188,   189,   119,
     304,   311,   304,   307,     1,   116,   348,   355,   356,     1,
     115,   117,   117,   115,   124,   136,   206,   254,   258,   259,
     117,   119,   139,   206,   118,   119,   118,   119,   112,   123,
     125,   135,   206,   260,   266,   274,   276,   281,   307,   309,
     311,   312,   314,     1,   113,   117,     1,   113,   117,     1,
     117,     1,   117,   113,   113,   304,   304,   112,   112,     1,
     115,     1,   118,     1,   115,   206,   260,   266,   274,   277,
     281,   307,   325,   326,     1,   115,     1,   344,   347,   355,
     356,   344,   347,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    79,    86,    88,    89,    90,   115,
     121,   183,   184,   185,   206,   213,   218,   234,   236,   241,
     254,   255,   256,   335,   336,   339,   340,   341,   348,   349,
     350,   351,   352,   353,   355,   356,   358,   359,   360,   361,
     362,   363,   118,    31,   206,   366,   206,   201,   202,   204,
     205,   315,   348,   356,   203,   293,   116,   233,   113,     1,
     112,   166,   209,   214,   217,   219,   239,   240,   242,   112,
     218,   241,   218,   241,   112,   206,   260,   266,   274,   277,
     281,   299,   258,   112,   112,   299,   258,   112,   112,   112,
     112,   112,   113,   234,   236,   256,   266,   274,   276,   281,
     289,   327,   366,   119,   167,   168,   210,   215,   234,   119,
       1,   118,   119,     1,     7,     8,     9,   112,   120,   123,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
     116,   235,   168,   210,   211,   221,   243,   109,   129,   130,
     126,   127,    10,    11,   224,   246,    12,    13,   110,   111,
      14,    15,   125,   131,   132,    16,    17,   133,   235,   113,
       7,     8,     9,   112,   120,   123,   235,   109,   129,   130,
     126,   127,    10,    11,    12,    13,   110,   111,    14,    15,
     125,   131,   132,    16,    17,   133,   235,   113,   113,   107,
     206,   292,   373,   376,   377,   119,   119,   306,   116,    11,
     111,   117,   116,   133,   133,   112,   307,   311,   312,    65,
     190,   198,   206,   198,     1,   206,   260,   274,   277,   288,
     297,   292,   315,   316,   112,   139,   206,   206,   292,     1,
     112,   297,   109,   112,   206,   292,   115,   355,   356,   355,
     356,   355,   115,   355,   356,   115,   115,     1,   118,   115,
       1,     1,   115,   117,   117,    69,    70,    91,    95,    97,
     118,    69,    70,   118,   115,     1,   186,   187,     1,   186,
     187,     1,   116,   112,   115,   121,   206,   278,   279,   302,
     307,   311,   315,   316,   317,     1,   292,   300,   331,   305,
     311,   305,   307,   112,   121,   146,   147,   162,   163,   165,
     166,   175,   206,   292,   110,   139,   206,   206,   260,   274,
     277,   110,   110,   116,   117,     1,   115,   119,    28,   138,
     206,   206,   111,   117,   116,   115,   117,   118,   148,   149,
     150,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     210,   211,   213,   233,   254,   291,   320,   321,   304,   304,
     119,   234,   255,   318,   319,   355,   356,   323,   324,   323,
     324,   124,   124,   124,    51,   329,   330,     1,   263,   119,
     119,     1,   118,   188,   189,     1,   118,   188,   189,   113,
     206,   300,   301,   312,   333,   334,   124,   136,   258,   259,
     314,   309,   311,   112,   123,   309,     1,     1,   117,     1,
      51,   206,   329,   330,   117,     1,    51,   206,   329,   330,
     117,     1,    51,   206,   329,   330,   117,    51,   206,   329,
     330,   234,   136,   206,   118,   119,   115,   115,   121,   258,
     259,   121,   112,   112,     1,   112,    52,    53,    54,    56,
      57,    58,    59,    62,    79,    86,   206,   256,   335,   358,
     362,   112,   206,   115,   115,   115,   210,   211,   236,   256,
     112,   274,   112,   112,   179,   206,   115,   115,   115,   121,
     120,   235,     1,   120,   115,   117,   236,   256,   235,   113,
     117,   236,     1,   350,   351,   350,   351,   335,   336,   344,
     347,   335,   336,   344,   347,     1,     1,   366,   366,   137,
     206,   119,   119,   348,   356,   356,   233,   115,    65,   135,
     206,   218,   241,   266,   274,   276,   281,   290,   328,     1,
       1,     7,     8,     9,   112,   120,   123,     7,     8,     9,
     112,   120,   123,   206,   291,   110,   112,   123,   206,   260,
     266,   274,   277,   281,   307,   310,   311,   313,   206,   260,
     266,   274,   277,   281,   298,   236,   327,   355,   206,   123,
     313,   298,   234,   366,   366,   366,   234,   113,   206,   266,
     274,   276,   281,   312,   113,   120,     1,   158,   159,     1,
     118,   117,   124,     1,   158,   159,   118,     1,   158,   159,
       1,   206,   113,   211,   215,   216,   255,     1,   206,   236,
     256,   210,   234,     1,   221,   243,   221,   243,   221,   243,
     222,   244,   222,   244,   223,   245,   223,   245,   224,   246,
     224,   246,   224,   246,   210,   211,   226,   247,   210,   211,
     226,   247,   210,   211,   227,   248,   210,   211,   228,   249,
     210,   211,   229,   250,   230,   251,   231,   252,   121,   210,
     211,   236,   237,   256,   257,   210,   234,     1,   206,   113,
     215,   216,     1,   206,   236,   256,   210,   234,   221,   243,
     221,   243,   221,   243,   222,   244,   222,   244,   223,   245,
     223,   245,   224,   246,   224,   246,   224,   246,   224,   246,
     210,   211,   226,   247,   210,   211,   226,   247,   210,   211,
     227,   248,   210,   211,   228,   249,   210,   211,   229,   250,
     230,   251,   231,   252,   121,   236,   237,   256,   257,   210,
     234,   110,   111,   206,   374,   375,   206,   118,   373,   376,
     377,   377,   190,   191,   193,   195,   206,   199,   191,   193,
     195,   236,   237,   256,   257,   236,   237,   256,   257,   311,
     111,   116,   111,   119,   110,   119,   206,   260,   274,   277,
     312,   315,   316,   179,   115,   115,   115,   279,   302,   307,
     311,   119,   206,   119,   206,   312,   206,   112,   118,   169,
     170,   169,   170,   355,   355,   355,   208,   355,   355,     1,
     320,   321,   113,   258,   259,   119,   115,   117,   302,   311,
     302,   307,   121,   308,   206,   112,   305,   305,   206,   115,
       1,   115,     1,   115,   279,   200,   110,   198,   198,   258,
     259,   262,   188,   189,     1,   118,   263,   116,   121,   116,
     121,   116,   197,   193,   206,   355,   356,     1,   115,   117,
     115,   117,   115,   150,   151,   154,   155,   156,   118,   148,
     151,   115,   118,   150,   151,   154,   155,   156,   116,   315,
     316,   317,   318,   319,   322,     1,   118,   263,     1,   118,
     263,   113,   113,   113,   124,   124,   124,   309,   113,   333,
     334,   124,   136,   258,   259,   329,   330,   292,   329,   329,
     329,   330,   113,   113,   113,     1,   158,   159,   335,   336,
     121,   121,   335,   336,   236,   256,   236,   256,   113,   236,
     256,   121,   258,   259,   121,   112,   112,   335,   112,   211,
     256,   112,   121,    56,     1,   113,   115,   206,   236,   256,
     357,   115,   115,   115,   115,   115,   366,   112,   234,   234,
     206,   335,   336,    90,   211,   255,    88,    89,    90,   234,
     255,   211,   255,   234,   255,   110,   356,   115,   135,   136,
     113,   135,   266,   274,   276,   281,   312,   113,     1,   206,
     113,   215,   216,     1,   206,   236,   256,     1,   206,   113,
     215,   216,     1,   206,   236,   256,   113,   113,   312,   200,
     113,   313,   333,   334,   258,   259,   110,   310,   311,   112,
     310,   123,   110,   123,   206,   260,   266,   274,   277,   281,
     313,   113,   113,   113,   113,   258,   259,   123,   123,   313,
     117,   113,   117,   117,   117,   221,   243,   366,     1,   118,
     210,   234,     1,     1,   113,   117,   113,   124,   124,     1,
     117,   121,   121,   117,   121,   121,   113,   124,   124,   121,
     121,   121,   121,   206,   206,   115,   117,   206,   366,   118,
     118,   121,   121,   121,   121,   121,   121,   121,   121,   193,
     200,   110,   119,   119,   206,   113,   115,   302,   311,   302,
     307,   113,   119,   119,   206,   113,     1,   158,   159,   278,
     307,   302,   302,   258,   259,   112,   113,   115,   111,   200,
     111,   111,   115,     1,   115,   191,   206,   190,   191,   190,
     195,     1,   152,   153,     1,   152,   153,   356,     1,   320,
     321,   117,   118,   318,   319,     1,   115,     1,   115,   113,
     113,   124,   124,   124,   312,   314,     1,   335,   336,   335,
     336,   113,   113,   113,   113,     1,   335,   113,   236,   335,
     336,   121,   121,   256,   113,   236,   256,    56,   256,   357,
     366,   112,   335,   121,   115,     1,   115,     1,   113,   256,
     357,     3,   113,   121,   366,   113,   113,   117,   112,   112,
     179,   113,   113,     1,   113,   113,   124,   124,   113,   124,
     124,   113,   111,   113,   113,   113,   124,   124,   200,   310,
     113,   333,   334,   258,   259,   200,   258,   259,   110,   123,
     112,   119,   318,   124,   124,   258,   259,   258,   259,   123,
     327,   206,   206,   234,   211,   255,   210,   211,   210,   211,
     233,   253,   210,   211,   233,   253,   210,   211,   210,   211,
     233,   253,   210,   211,   233,   253,   210,   211,   233,   253,
     210,   211,   233,   253,   210,   211,   233,   253,   210,   211,
     233,   253,   374,   115,   115,   111,   200,   119,   355,   302,
     302,   116,   119,     1,   121,   121,   111,   188,   189,   115,
     188,   189,   116,   116,   118,   318,   319,     1,   188,   189,
     188,   189,   335,   335,   335,   335,   335,   336,   113,   112,
     357,   113,   236,   256,   236,   335,     1,   113,   236,   256,
     337,   338,   366,   115,   338,     3,   113,   121,   119,   179,
     234,   234,     1,     1,   111,   113,   113,   124,   124,   111,
     124,   124,   200,   258,   259,   327,   322,   124,   124,   124,
     124,   258,   259,   113,   113,   113,   113,   111,   320,   258,
     259,   258,   259,   188,   189,   191,   191,     1,    64,    64,
     236,   256,   113,   236,   256,   113,   115,   113,   115,   335,
     336,   113,   335,   336,   113,   117,   121,   112,     3,   113,
     121,   338,   115,   338,    73,   179,   180,   181,   113,   113,
     113,   117,   111,   124,   124,   113,   117,   118,   124,   124,
     115,   335,   335,   113,   113,   115,   335,   236,   335,   336,
     115,   337,   338,   234,   338,   115,   338,   113,   121,     3,
     113,   121,   355,   355,   118,   180,   119,   179,   221,   243,
     318,   118,   113,   113,   113,   113,   113,   121,   115,   338,
     338,   115,   338,   181,   113,   335,   115,   115,   115,   338,
     113,   113,   113,   121,   118,   113,   115,   115,   115,   338,
     115,   113,   115
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
      case 135: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10018 "grammar.ec"
	break;
      case 136: /* "type" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10027 "grammar.ec"
	break;
      case 137: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10036 "grammar.ec"
	break;
      case 139: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10045 "grammar.ec"
	break;
      case 140: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10054 "grammar.ec"
	break;
      case 141: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10063 "grammar.ec"
	break;
      case 142: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10072 "grammar.ec"
	break;
      case 143: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10081 "grammar.ec"
	break;
      case 144: /* "class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10090 "grammar.ec"
	break;
      case 145: /* "virtual_class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10099 "grammar.ec"
	break;
      case 146: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10108 "grammar.ec"
	break;
      case 147: /* "class_function_definition_error" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10117 "grammar.ec"
	break;
      case 148: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10126 "grammar.ec"
	break;
      case 149: /* "instance_class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10135 "grammar.ec"
	break;
      case 150: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10144 "grammar.ec"
	break;
      case 151: /* "instance_class_function_definition_error" */

/* Line 1009 of yacc.c  */
#line 225 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10153 "grammar.ec"
	break;
      case 152: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 223 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10162 "grammar.ec"
	break;
      case 153: /* "data_member_initialization_error" */

/* Line 1009 of yacc.c  */
#line 223 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10171 "grammar.ec"
	break;
      case 154: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10180 "grammar.ec"
	break;
      case 155: /* "data_member_initialization_list_error" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10189 "grammar.ec"
	break;
      case 156: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10198 "grammar.ec"
	break;
      case 157: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10207 "grammar.ec"
	break;
      case 158: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10216 "grammar.ec"
	break;
      case 159: /* "members_initialization_list_error" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10225 "grammar.ec"
	break;
      case 160: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 221 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10234 "grammar.ec"
	break;
      case 161: /* "instantiation_named_error" */

/* Line 1009 of yacc.c  */
#line 221 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10243 "grammar.ec"
	break;
      case 165: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 221 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10252 "grammar.ec"
	break;
      case 166: /* "instantiation_unnamed_error" */

/* Line 1009 of yacc.c  */
#line 221 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10261 "grammar.ec"
	break;
      case 169: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 223 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10270 "grammar.ec"
	break;
      case 170: /* "default_property_error" */

/* Line 1009 of yacc.c  */
#line 223 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10279 "grammar.ec"
	break;
      case 171: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10288 "grammar.ec"
	break;
      case 172: /* "default_property_list_error" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10297 "grammar.ec"
	break;
      case 175: /* "property" */

/* Line 1009 of yacc.c  */
#line 234 "grammar.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 10306 "grammar.ec"
	break;
      case 186: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 232 "grammar.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 10315 "grammar.ec"
	break;
      case 187: /* "struct_declaration_error" */

/* Line 1009 of yacc.c  */
#line 232 "grammar.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 10324 "grammar.ec"
	break;
      case 188: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 247 "grammar.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 10333 "grammar.ec"
	break;
      case 189: /* "struct_declaration_list_error" */

/* Line 1009 of yacc.c  */
#line 247 "grammar.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 10342 "grammar.ec"
	break;
      case 190: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 253 "grammar.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 10351 "grammar.ec"
	break;
      case 191: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10360 "grammar.ec"
	break;
      case 192: /* "template_type_parameter" */

/* Line 1009 of yacc.c  */
#line 251 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10369 "grammar.ec"
	break;
      case 193: /* "template_identifier_argument" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10378 "grammar.ec"
	break;
      case 194: /* "template_identifier_parameter" */

/* Line 1009 of yacc.c  */
#line 251 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10387 "grammar.ec"
	break;
      case 195: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10396 "grammar.ec"
	break;
      case 196: /* "template_expression_parameter" */

/* Line 1009 of yacc.c  */
#line 251 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10405 "grammar.ec"
	break;
      case 197: /* "template_parameter" */

/* Line 1009 of yacc.c  */
#line 251 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10414 "grammar.ec"
	break;
      case 198: /* "template_parameters_list" */

/* Line 1009 of yacc.c  */
#line 254 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTemplateParameter); };

/* Line 1009 of yacc.c  */
#line 10423 "grammar.ec"
	break;
      case 199: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10432 "grammar.ec"
	break;
      case 200: /* "template_arguments_list" */

/* Line 1009 of yacc.c  */
#line 255 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTemplateArgument); };

/* Line 1009 of yacc.c  */
#line 10441 "grammar.ec"
	break;
      case 201: /* "class_entry" */

/* Line 1009 of yacc.c  */
#line 229 "grammar.y"
	{ Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; };

/* Line 1009 of yacc.c  */
#line 10450 "grammar.ec"
	break;
      case 202: /* "class_decl" */

/* Line 1009 of yacc.c  */
#line 230 "grammar.y"
	{ Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; };

/* Line 1009 of yacc.c  */
#line 10459 "grammar.ec"
	break;
      case 203: /* "class" */

/* Line 1009 of yacc.c  */
#line 231 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10468 "grammar.ec"
	break;
      case 204: /* "class_head" */

/* Line 1009 of yacc.c  */
#line 231 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10477 "grammar.ec"
	break;
      case 205: /* "class_error" */

/* Line 1009 of yacc.c  */
#line 231 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10486 "grammar.ec"
	break;
      case 206: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 186 "grammar.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 10495 "grammar.ec"
	break;
      case 207: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10504 "grammar.ec"
	break;
      case 208: /* "i18n_string" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10513 "grammar.ec"
	break;
      case 212: /* "primary_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10522 "grammar.ec"
	break;
      case 213: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10531 "grammar.ec"
	break;
      case 215: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 236 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10540 "grammar.ec"
	break;
      case 216: /* "argument_expression_list_error" */

/* Line 1009 of yacc.c  */
#line 236 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10549 "grammar.ec"
	break;
      case 218: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10558 "grammar.ec"
	break;
      case 221: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10567 "grammar.ec"
	break;
      case 222: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10576 "grammar.ec"
	break;
      case 223: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10585 "grammar.ec"
	break;
      case 224: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10594 "grammar.ec"
	break;
      case 226: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10603 "grammar.ec"
	break;
      case 227: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10612 "grammar.ec"
	break;
      case 228: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10621 "grammar.ec"
	break;
      case 229: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10630 "grammar.ec"
	break;
      case 230: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10639 "grammar.ec"
	break;
      case 231: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10648 "grammar.ec"
	break;
      case 232: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10657 "grammar.ec"
	break;
      case 233: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10666 "grammar.ec"
	break;
      case 234: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10675 "grammar.ec"
	break;
      case 236: /* "expression" */

/* Line 1009 of yacc.c  */
#line 236 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10684 "grammar.ec"
	break;
      case 238: /* "postfix_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10693 "grammar.ec"
	break;
      case 241: /* "unary_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10702 "grammar.ec"
	break;
      case 243: /* "cast_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10711 "grammar.ec"
	break;
      case 244: /* "multiplicative_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10720 "grammar.ec"
	break;
      case 245: /* "additive_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10729 "grammar.ec"
	break;
      case 246: /* "shift_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10738 "grammar.ec"
	break;
      case 247: /* "relational_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10747 "grammar.ec"
	break;
      case 248: /* "equality_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10756 "grammar.ec"
	break;
      case 249: /* "and_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10765 "grammar.ec"
	break;
      case 250: /* "exclusive_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10774 "grammar.ec"
	break;
      case 251: /* "inclusive_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10783 "grammar.ec"
	break;
      case 252: /* "logical_and_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10792 "grammar.ec"
	break;
      case 253: /* "logical_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10801 "grammar.ec"
	break;
      case 254: /* "conditional_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10810 "grammar.ec"
	break;
      case 255: /* "assignment_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10819 "grammar.ec"
	break;
      case 256: /* "expression_error" */

/* Line 1009 of yacc.c  */
#line 236 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10828 "grammar.ec"
	break;
      case 258: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10837 "grammar.ec"
	break;
      case 259: /* "constant_expression_error" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10846 "grammar.ec"
	break;
      case 260: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10855 "grammar.ec"
	break;
      case 261: /* "external_storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10864 "grammar.ec"
	break;
      case 262: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 204 "grammar.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 10873 "grammar.ec"
	break;
      case 263: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 237 "grammar.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 10882 "grammar.ec"
	break;
      case 265: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10891 "grammar.ec"
	break;
      case 266: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10900 "grammar.ec"
	break;
      case 267: /* "enum_specifier_compound_error" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10909 "grammar.ec"
	break;
      case 269: /* "enum_class" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10918 "grammar.ec"
	break;
      case 270: /* "enum_class_error" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10927 "grammar.ec"
	break;
      case 271: /* "class_specifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10936 "grammar.ec"
	break;
      case 272: /* "class_specifier_error" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10945 "grammar.ec"
	break;
      case 273: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10954 "grammar.ec"
	break;
      case 274: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10963 "grammar.ec"
	break;
      case 275: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 10972 "grammar.ec"
	break;
      case 276: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10981 "grammar.ec"
	break;
      case 277: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10990 "grammar.ec"
	break;
      case 278: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 10999 "grammar.ec"
	break;
      case 279: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 240 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 11008 "grammar.ec"
	break;
      case 280: /* "struct_entry" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11017 "grammar.ec"
	break;
      case 281: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11026 "grammar.ec"
	break;
      case 282: /* "struct_or_union_specifier_compound_error" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11035 "grammar.ec"
	break;
      case 283: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11044 "grammar.ec"
	break;
      case 284: /* "struct_decl" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11053 "grammar.ec"
	break;
      case 285: /* "struct_head" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11062 "grammar.ec"
	break;
      case 286: /* "struct_class" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11071 "grammar.ec"
	break;
      case 287: /* "struct_class_error" */

/* Line 1009 of yacc.c  */
#line 199 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11080 "grammar.ec"
	break;
      case 289: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11089 "grammar.ec"
	break;
      case 290: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11098 "grammar.ec"
	break;
      case 291: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11107 "grammar.ec"
	break;
      case 292: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11116 "grammar.ec"
	break;
      case 293: /* "external_guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11125 "grammar.ec"
	break;
      case 294: /* "external_guess_declaration_specifiers_error" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11134 "grammar.ec"
	break;
      case 295: /* "_inheritance_specifiers" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11143 "grammar.ec"
	break;
      case 296: /* "inheritance_specifiers" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11152 "grammar.ec"
	break;
      case 300: /* "identifier_list_error" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11161 "grammar.ec"
	break;
      case 301: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11170 "grammar.ec"
	break;
      case 302: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11179 "grammar.ec"
	break;
      case 303: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11188 "grammar.ec"
	break;
      case 304: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11197 "grammar.ec"
	break;
      case 305: /* "direct_declarator_function_error" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11206 "grammar.ec"
	break;
      case 306: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11215 "grammar.ec"
	break;
      case 307: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 233 "grammar.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 11224 "grammar.ec"
	break;
      case 309: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11233 "grammar.ec"
	break;
      case 310: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11242 "grammar.ec"
	break;
      case 311: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 187 "grammar.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 11251 "grammar.ec"
	break;
      case 312: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11260 "grammar.ec"
	break;
      case 313: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11269 "grammar.ec"
	break;
      case 314: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11278 "grammar.ec"
	break;
      case 315: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11287 "grammar.ec"
	break;
      case 316: /* "declarator_function_error" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11296 "grammar.ec"
	break;
      case 317: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11305 "grammar.ec"
	break;
      case 318: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 210 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11314 "grammar.ec"
	break;
      case 319: /* "initializer_error" */

/* Line 1009 of yacc.c  */
#line 210 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11323 "grammar.ec"
	break;
      case 320: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 210 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11332 "grammar.ec"
	break;
      case 321: /* "initializer_condition_error" */

/* Line 1009 of yacc.c  */
#line 210 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11341 "grammar.ec"
	break;
      case 322: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 242 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 11350 "grammar.ec"
	break;
      case 323: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 11359 "grammar.ec"
	break;
      case 324: /* "init_declarator_error" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 11368 "grammar.ec"
	break;
      case 325: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 243 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 11377 "grammar.ec"
	break;
      case 326: /* "init_declarator_list_error" */

/* Line 1009 of yacc.c  */
#line 243 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 11386 "grammar.ec"
	break;
      case 327: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11395 "grammar.ec"
	break;
      case 328: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11404 "grammar.ec"
	break;
      case 329: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11413 "grammar.ec"
	break;
      case 330: /* "parameter_declaration_error" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11422 "grammar.ec"
	break;
      case 331: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11431 "grammar.ec"
	break;
      case 332: /* "parameter_list_error" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11440 "grammar.ec"
	break;
      case 333: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11449 "grammar.ec"
	break;
      case 334: /* "parameter_type_list_error" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11458 "grammar.ec"
	break;
      case 335: /* "statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11467 "grammar.ec"
	break;
      case 336: /* "statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11476 "grammar.ec"
	break;
      case 340: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11485 "grammar.ec"
	break;
      case 341: /* "labeled_statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11494 "grammar.ec"
	break;
      case 342: /* "declaration_mode" */

/* Line 1009 of yacc.c  */
#line 256 "grammar.y"
	{ };

/* Line 1009 of yacc.c  */
#line 11503 "grammar.ec"
	break;
      case 344: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 217 "grammar.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 11512 "grammar.ec"
	break;
      case 348: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 241 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 11521 "grammar.ec"
	break;
      case 349: /* "declaration_list_error" */

/* Line 1009 of yacc.c  */
#line 241 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 11530 "grammar.ec"
	break;
      case 350: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 11539 "grammar.ec"
	break;
      case 351: /* "statement_list_error" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 11548 "grammar.ec"
	break;
      case 352: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11557 "grammar.ec"
	break;
      case 353: /* "compound_inside_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11566 "grammar.ec"
	break;
      case 354: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 250 "grammar.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 11575 "grammar.ec"
	break;
      case 355: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11584 "grammar.ec"
	break;
      case 356: /* "compound_statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11593 "grammar.ec"
	break;
      case 357: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11602 "grammar.ec"
	break;
      case 358: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11611 "grammar.ec"
	break;
      case 359: /* "selection_statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11620 "grammar.ec"
	break;
      case 360: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11629 "grammar.ec"
	break;
      case 361: /* "iteration_statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11638 "grammar.ec"
	break;
      case 362: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11647 "grammar.ec"
	break;
      case 363: /* "jump_statement_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11656 "grammar.ec"
	break;
      case 364: /* "function_definition" */

/* Line 1009 of yacc.c  */
#line 218 "grammar.y"
	{ FreeFunction((yyvaluep->function)); };

/* Line 1009 of yacc.c  */
#line 11665 "grammar.ec"
	break;
      case 365: /* "function_definition_error" */

/* Line 1009 of yacc.c  */
#line 218 "grammar.y"
	{ FreeFunction((yyvaluep->function)); };

/* Line 1009 of yacc.c  */
#line 11674 "grammar.ec"
	break;
      case 366: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 233 "grammar.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 11683 "grammar.ec"
	break;
      case 367: /* "external_declaration" */

/* Line 1009 of yacc.c  */
#line 219 "grammar.y"
	{ FreeExternal((yyvaluep->external)); };

/* Line 1009 of yacc.c  */
#line 11692 "grammar.ec"
	break;
      case 368: /* "external_declaration_error" */

/* Line 1009 of yacc.c  */
#line 219 "grammar.y"
	{ FreeExternal((yyvaluep->external)); };

/* Line 1009 of yacc.c  */
#line 11701 "grammar.ec"
	break;
      case 369: /* "translation_unit_error" */

/* Line 1009 of yacc.c  */
#line 246 "grammar.y"
	{ if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };

/* Line 1009 of yacc.c  */
#line 11710 "grammar.ec"
	break;
      case 370: /* "translation_unit" */

/* Line 1009 of yacc.c  */
#line 246 "grammar.y"
	{ if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };

/* Line 1009 of yacc.c  */
#line 11719 "grammar.ec"
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
#line 264 "grammar.y"
    {
      (yyval.specifier) = null;
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
   ;}
    break;

  case 3:

/* Line 1464 of yacc.c  */
#line 293 "grammar.y"
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
#line 351 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 353 "grammar.y"
    {
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
      FreeIdentifier((yyvsp[(2) - (2)].id));

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
   #else
      Location tmpLoc = yylloc; (yyval.specifier) = (yyvsp[(2) - (2)].id); yylloc = (yylsp[(1) - (2)]); 
      Compiler_Error("Not a type: %s\n", (yyvsp[(1) - (2)].id).string);      
      yylloc = tmpLoc; (yyvsp[(2) - (2)].id).badID = (yyvsp[(1) - (2)].id);
   #endif
   ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 452 "grammar.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 456 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 460 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 462 "grammar.y"
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
#line 511 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 513 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 518 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 523 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[(2) - (4)].list), FreeSpecifier) ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 528 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 530 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 535 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 537 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 542 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 544 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 549 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 551 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 553 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 555 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 557 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 561 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 566 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 568 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 570 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 572 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 574 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 580 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 582 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, MkDeclaratorFunction((yyvsp[(2) - (2)].declarator), null), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 587 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 592 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 597 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 599 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 601 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 605 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 606 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 610 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 612 "grammar.y"
    { 
         (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), MkInitializerAssignment(MkExpDummy()));
         (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yyval.memberInit).initializer.loc.end = (yylsp[(2) - (3)]).end; 

         fileInput.Seek((yylsp[(2) - (3)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(2) - (3)]).end);
         (yyloc).start = (yylsp[(1) - (3)]).start;
         (yyloc).end = (yylsp[(2) - (3)]).end;
      ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 622 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 626 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 628 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 630 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 634 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 636 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 638 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 641 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(2) - (3)]).end; 
         { 
            Initializer dummy = MkInitializerAssignment(MkExpDummy()); 
            MemberInit memberInit = MkMemberInit(null, dummy); 
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[(2) - (3)]).end; 
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[(2) - (3)]).end; 
            ListAdd((yyvsp[(1) - (3)].list), memberInit); 
          }
          (yyval.list) = (yyvsp[(1) - (3)].list);
       ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 653 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(2) - (3)]).end; 
         { 
            Initializer dummy = MkInitializerAssignment(MkExpDummy()); 
            MemberInit memberInit = MkMemberInit(null, dummy); 
            memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[(2) - (3)]).end; 
            memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[(2) - (3)]).end; 
            ListAdd((yyvsp[(1) - (3)].list), memberInit); 
          }
          (yyval.list) = (yyvsp[(1) - (3)].list);
       ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 664 "grammar.y"
    {
         Initializer dummy = MkInitializerAssignment(MkExpDummy());
         MemberInit memberInit = MkMemberInit(null, dummy); 
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[(1) - (1)]).start; 
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[(1) - (1)]).start; 

         (yyval.list) = MkList();
         ListAdd((yyval.list), memberInit); 

         dummy = MkInitializerAssignment(MkExpDummy()); 
         memberInit = MkMemberInit(null, dummy); 
         memberInit.realLoc.start = memberInit.loc.start = dummy.loc.start = (yylsp[(1) - (1)]).end; 
         memberInit.realLoc.end = memberInit.loc.end = dummy.loc.end = (yylsp[(1) - (1)]).end; 
         ListAdd((yyval.list), memberInit); 
      ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 683 "grammar.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 685 "grammar.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 689 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 690 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 691 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members);  members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 692 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 693 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 694 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 695 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 697 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 702 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 703 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 704 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 708 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 709 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 710 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 711 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 712 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitList((yyvsp[(2) - (2)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 713 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 714 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (2)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 719 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; (yyval.instance) = (yyvsp[(1) - (2)].instance); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 721 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; (yyval.instance) = (yyvsp[(1) - (3)].instance); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 726 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 728 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (5)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 730 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 732 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (3)].list), MkExpIdentifier((yyvsp[(2) - (3)].id)), null); (yyval.instance).exp.loc = (yylsp[(2) - (3)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (3)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 734 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 764 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 766 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 771 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list));(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 773 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (5)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 775 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list));(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 777 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (3)].list), MkExpIdentifier((yyvsp[(2) - (3)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (3)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (3)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 779 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 808 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 810 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 812 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 817 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; (yyval.instance) = (yyvsp[(1) - (2)].instance); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 819 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; (yyval.instance) = (yyvsp[(1) - (3)].instance); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 824 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 826 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 830 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 832 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (2)].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 834 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 836 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 841 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 844 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (2)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (2)].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (2)].id)); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 847 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 850 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 915 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 917 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 922 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (2)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 924 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 926 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(1) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 928 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (1)]).end; (yyval.instance).insideLoc.end = (yylsp[(1) - (1)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 930 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (2)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 960 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 964 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 965 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), MkInitializerAssignment(MkExpDummy())); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; (yyval.memberInit).initializer.loc.end = (yylsp[(2) - (3)]).end; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 966 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (2)].exp), null); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 970 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 971 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 972 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 976 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 977 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 978 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 984 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, (yyvsp[(3) - (4)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 987 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), (yyvsp[(4) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 990 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (3)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 993 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 996 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 1002 "grammar.y"
    { (yyvsp[(1) - (3)].prop).setStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 1004 "grammar.y"
    { (yyvsp[(1) - (3)].prop).getStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 1006 "grammar.y"
    { (yyvsp[(1) - (3)].prop).issetStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 1008 "grammar.y"
    { (yyvsp[(1) - (2)].prop).isWatchable = true; ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 1010 "grammar.y"
    { (yyvsp[(1) - (3)].prop).category = (yyvsp[(3) - (3)].exp); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 1014 "grammar.y"
    { (yyvsp[(1) - (2)].prop).loc.end = (yylsp[(2) - (2)]).end; (yyval.prop) = (yyvsp[(1) - (2)].prop); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 1019 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, (yyvsp[(3) - (4)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 1022 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), (yyvsp[(4) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 1025 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (3)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 1028 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 1031 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 1037 "grammar.y"
    { (yyvsp[(1) - (3)].prop).setStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 1039 "grammar.y"
    { (yyvsp[(1) - (3)].prop).getStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 1043 "grammar.y"
    { (yyvsp[(1) - (2)].prop).loc.end = (yylsp[(2) - (2)]).end; ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 1048 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].id)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 1050 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].id)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 1055 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 1057 "grammar.y"
    { (yyval.propertyWatch) = MkDeleteWatch((yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 1062 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].propertyWatch)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 1064 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].propertyWatch)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 1069 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 1074 "grammar.y"
    { (yyval.stmt) = MkWatchStmt(null, (yyvsp[(3) - (7)].exp), (yyvsp[(6) - (7)].list)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 1076 "grammar.y"
    { (yyval.stmt) = MkWatchStmt((yyvsp[(1) - (9)].exp), (yyvsp[(5) - (9)].exp), (yyvsp[(8) - (9)].list)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 1081 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].list)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 1083 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[(1) - (8)].exp), (yyvsp[(5) - (8)].exp), (yyvsp[(7) - (8)].list)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 1085 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[(3) - (4)].exp), null); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 1087 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[(1) - (6)].exp), (yyvsp[(5) - (6)].exp), null); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 1092 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, null); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 1094 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, (yyvsp[(2) - (2)].list)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 1096 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[(1) - (3)].exp), null); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 1098 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[(1) - (4)].exp), (yyvsp[(4) - (4)].list)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 1102 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 1103 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 1104 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 1105 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 1106 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 1107 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 1109 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (4)].declMode); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 1110 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(2) - (3)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 1111 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 1112 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 1113 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(2) - (2)].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 1114 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(2) - (2)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 1116 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 1117 "grammar.y"
    { (yyval.classDef) = MkClassDefClassData(MkStructDeclaration((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 1118 "grammar.y"
    { (yyval.classDef) = MkClassDefClassProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 1119 "grammar.y"
    { (yyval.classDef) = MkClassDefPropertyWatch((yyvsp[(1) - (2)].propertyWatch)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 1120 "grammar.y"
    { (yyval.classDef) = null; deleteWatchable = true; ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 1121 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[(2) - (3)].id).string); FreeIdentifier((yyvsp[(2) - (3)].id)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 1122 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[(2) - (3)].specifier).name); FreeSpecifier((yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 1123 "grammar.y"
    { (yyval.classDef) = MkClassDefNoExpansion(); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 1124 "grammar.y"
    { (yyval.classDef) = MkClassDefFixed(); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 1125 "grammar.y"
    { (yyval.classDef) = MkClassDefDesignerDefaultProperty((yyvsp[(2) - (3)].id)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 1126 "grammar.y"
    { (yyval.classDef) = MkClassDefClassPropertyValue((yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].initializer)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 1128 "grammar.y"
    { (yyval.classDef) = null; ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 1129 "grammar.y"
    { memberAccessStack[defaultMemberAccess] = (yyvsp[(1) - (2)].declMode); if(defaultMemberAccess == 0) { (yyval.classDef) = MkClassDefMemberAccess(); (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); (yyval.classDef).loc = (yyloc); } else (yyval.classDef) = null; ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 1131 "grammar.y"
    { (yyval.classDef) = MkClassDefAccessOverride((yyvsp[(1) - (4)].declMode), (yyvsp[(3) - (4)].id)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 1135 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyvsp[(1) - (1)].classFunction).loc;  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 1136 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (2)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 1137 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (2)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 1138 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (1)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (1)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 1139 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (1)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (1)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 1141 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(2) - (2)].classFunction)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 1142 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 1143 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 1144 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 1145 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 1147 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (1)].list)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 1151 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 1152 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 1153 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 1157 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 1160 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyval.list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 1161 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyval.list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 1165 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 1166 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 1167 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[(1) - (1)].id).string)), null); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 1171 "grammar.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[(1) - (1)].templateDatatype)); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 1175 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (2)].id), null, null); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 1176 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (4)].id), null, (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 1177 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (4)].id), (yyvsp[(4) - (4)].templateDatatype), null); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 1178 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].templateDatatype), (yyvsp[(6) - (6)].templateArgument)); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 1179 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (2)].string)), null, null); delete (yyvsp[(2) - (2)].string); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 1180 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (4)].string)), null, (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 1181 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (4)].string)), (yyvsp[(4) - (4)].templateDatatype), null); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 1182 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (6)].string)), (yyvsp[(4) - (6)].templateDatatype), (yyvsp[(6) - (6)].templateArgument)); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 1186 "grammar.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[(1) - (1)].id)); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 1190 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[(1) - (1)].id), dataMember, null); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 1191 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[(1) - (3)].id), dataMember, (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 1195 "grammar.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 1199 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[(2) - (2)].id), (yyvsp[(1) - (2)].templateDatatype), null); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 1200 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[(2) - (4)].id), (yyvsp[(1) - (4)].templateDatatype), (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 1210 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateParameter)); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 1211 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateParameter)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 1218 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 1219 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 1220 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 1222 "grammar.y"
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

  case 235:

/* Line 1464 of yacc.c  */
#line 1234 "grammar.y"
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

  case 236:

/* Line 1464 of yacc.c  */
#line 1246 "grammar.y"
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

  case 237:

/* Line 1464 of yacc.c  */
#line 1260 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 1261 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 1266 "grammar.y"
    {
      (yyval.context) = PushContext();
   ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 1271 "grammar.y"
    { (yyvsp[(1) - (2)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (2)].id).string); FreeIdentifier((yyvsp[(2) - (2)].id)); (yyval.symbol).nameLoc = (yylsp[(2) - (2)]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 1273 "grammar.y"
    { 
      (yyvsp[(1) - (2)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(2) - (2)].specifier).name); 
      (yyval.symbol).nameLoc = (yylsp[(2) - (2)]); 
      FreeSpecifier((yyvsp[(2) - (2)].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 1280 "grammar.y"
    { (yyvsp[(2) - (3)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (3)].id).string); FreeIdentifier((yyvsp[(1) - (3)].id)); FreeIdentifier((yyvsp[(3) - (3)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (3)]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 1281 "grammar.y"
    { (yyvsp[(2) - (3)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(3) - (3)].specifier).name); FreeIdentifier((yyvsp[(1) - (3)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (3)]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[(3) - (3)].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 1283 "grammar.y"
    { (yyvsp[(1) - (5)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); (yyval.symbol).templateParams = (yyvsp[(4) - (5)].list); FreeIdentifier((yyvsp[(2) - (5)].id)); (yyval.symbol).nameLoc = (yylsp[(2) - (5)]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 1285 "grammar.y"
    { 
      (yyvsp[(1) - (5)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name);
      (yyval.symbol).templateParams = (yyvsp[(4) - (5)].list); 
      (yyval.symbol).nameLoc = (yylsp[(2) - (5)]); 
      FreeSpecifier((yyvsp[(2) - (5)].specifier)); 
      ++defaultMemberAccess;
      memberAccessStack[defaultMemberAccess] = privateAccess;
   ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 1293 "grammar.y"
    { (yyvsp[(2) - (6)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); (yyval.symbol).templateParams = (yyvsp[(5) - (6)].list); FreeIdentifier((yyvsp[(1) - (6)].id)); FreeIdentifier((yyvsp[(3) - (6)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (6)]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 1294 "grammar.y"
    { (yyvsp[(2) - (6)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); (yyval.symbol).templateParams = (yyvsp[(5) - (6)].list); FreeIdentifier((yyvsp[(1) - (6)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (6)]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[(3) - (6)].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 1299 "grammar.y"
    {
         (yyval._class).loc = (yyloc);
         (yyval._class) = (yyvsp[(1) - (2)]._class); 
      ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 1306 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (2)]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[(2) - (2)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 1313 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, MkList()); (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 1319 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 1326 "grammar.y"
    {
         (yyvsp[(1) - (3)].context); (yyval._class) = MkClass(DeclClassAddNameSpace(0, (yyvsp[(2) - (3)].id).string), null, null); FreeIdentifier((yyvsp[(2) - (3)].id));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 1332 "grammar.y"
    {
         (yyvsp[(1) - (3)].context); (yyval._class) = MkClass(DeclClass(0, (yyvsp[(2) - (3)].specifier).name), null, null); FreeSpecifier((yyvsp[(2) - (3)].specifier));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 1341 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].list), null);
      ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 1348 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, (yyvsp[(3) - (3)].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 1354 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = (yyvsp[(3) - (3)].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 1360 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, (yyvsp[(3) - (3)].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 1366 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = (yyvsp[(3) - (3)].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 1372 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, MkList()); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 1378 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = MkList(); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 1389 "grammar.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 1395 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 1399 "grammar.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 1400 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 1401 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 1405 "grammar.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 1406 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 1407 "grammar.y"
    { (yyval.exp) = MkExpExtensionCompound((yyvsp[(3) - (4)].stmt)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 1408 "grammar.y"
    { (yyval.exp) = MkExpExtensionExpression((yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 1409 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[(3) - (5)].typeName), (yyvsp[(5) - (5)].initializer)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 1410 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[(3) - (8)].typeName), MkInitializerAssignment(MkExpExtensionInitializer((yyvsp[(6) - (8)].typeName), (yyvsp[(8) - (8)].initializer)))); (yyval.exp).loc = (yyloc); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 1411 "grammar.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 1413 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 1414 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 1415 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 1416 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 1417 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 1418 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 1419 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 1420 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 1421 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 1422 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 1423 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 1424 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 1425 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 1426 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 1427 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 1428 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 1429 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 1430 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[(3) - (4)].list), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 1431 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[(3) - (5)].list), (yyvsp[(4) - (5)].declarator)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 1432 "grammar.y"
    { (yyval.exp) = MkExpClass(MkListOne(MkSpecifierName((yyvsp[(3) - (4)].id).string)), null); FreeIdentifier((yyvsp[(3) - (4)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 1433 "grammar.y"
    { (yyval.exp) = MkExpVaArg((yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 1435 "grammar.y"
    { (yyval.exp) = MkExpClassData((yyvsp[(3) - (4)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 1441 "grammar.y"
    { (yyval.exp) = MkExpArray((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 1445 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1449 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1453 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (2)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1454 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (2)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1460 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1461 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1462 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1463 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1464 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); if((yyvsp[(3) - (4)].list)->last) ((Expression)(yyvsp[(3) - (4)].list)->last).loc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1465 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1466 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1467 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1468 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1470 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1471 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1472 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1473 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1474 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1475 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1476 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1477 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1483 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1484 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1485 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1486 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1487 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); if((yyvsp[(3) - (4)].list)->last) ((Expression)(yyvsp[(3) - (4)].list)->last).loc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1488 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1489 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1490 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1491 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1493 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1494 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1495 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1496 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1497 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1498 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1499 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1500 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1504 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1505 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1506 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1507 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1511 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1512 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1513 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1514 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1515 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(2) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), exp); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1519 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1520 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1521 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1522 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1523 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1524 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1525 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1526 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (5)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1527 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (5)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1541 "grammar.y"
    { (yyval.i) = '&'; ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1542 "grammar.y"
    { (yyval.i) = '*'; ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1543 "grammar.y"
    { (yyval.i) = '+'; ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1544 "grammar.y"
    { (yyval.i) = '-'; ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1545 "grammar.y"
    { (yyval.i) = '~'; ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1546 "grammar.y"
    { (yyval.i) = '!'; ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1547 "grammar.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1548 "grammar.y"
    { (yyval.i) = _INCREF; ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1553 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1558 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1559 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1560 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1561 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1562 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1563 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1568 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1569 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1570 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1571 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1576 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1577 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1578 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1579 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1584 "grammar.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1592 "grammar.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1593 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1594 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1595 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1596 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1597 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1598 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1599 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1604 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1605 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1606 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1607 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1609 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1610 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1611 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1612 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1617 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1618 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1620 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1621 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1626 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1627 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1629 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1630 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1635 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1636 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1638 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1639 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1644 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1645 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1650 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1651 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1656 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1657 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1658 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1659 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1661 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1662 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1663 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1664 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1666 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1667 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1668 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1669 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1671 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1672 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1673 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1674 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1679 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1680 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1681 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1682 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1684 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1685 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1686 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1687 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1691 "grammar.y"
    { (yyval.i) = '='; ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1692 "grammar.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1693 "grammar.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1694 "grammar.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1695 "grammar.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1696 "grammar.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1697 "grammar.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1698 "grammar.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1699 "grammar.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1700 "grammar.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1701 "grammar.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1705 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1706 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1707 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1712 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1713 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1714 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1719 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); /*printf("Sorry, didn't mean that syntax error\n");*/ ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1721 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1723 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1724 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1726 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1727 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1732 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1734 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1739 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1743 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1745 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1747 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1748 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1750 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1751 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1756 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1758 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1763 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1767 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1768 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1769 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1770 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1771 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1772 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1773 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (5)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1774 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (6)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1775 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (6)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 510:

/* Line 1464 of yacc.c  */
#line 1791 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 512:

/* Line 1464 of yacc.c  */
#line 1796 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 513:

/* Line 1464 of yacc.c  */
#line 1797 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 514:

/* Line 1464 of yacc.c  */
#line 1798 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 515:

/* Line 1464 of yacc.c  */
#line 1799 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 516:

/* Line 1464 of yacc.c  */
#line 1800 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 517:

/* Line 1464 of yacc.c  */
#line 1801 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 519:

/* Line 1464 of yacc.c  */
#line 1806 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 520:

/* Line 1464 of yacc.c  */
#line 1810 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 521:

/* Line 1464 of yacc.c  */
#line 1814 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 522:

/* Line 1464 of yacc.c  */
#line 1818 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 524:

/* Line 1464 of yacc.c  */
#line 1826 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 525:

/* Line 1464 of yacc.c  */
#line 1827 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 526:

/* Line 1464 of yacc.c  */
#line 1828 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 527:

/* Line 1464 of yacc.c  */
#line 1829 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 529:

/* Line 1464 of yacc.c  */
#line 1835 "grammar.y"
    {
      if((yyvsp[(1) - (2)].exp).type == identifierExp)
      {
         if((yyvsp[(1) - (2)].exp).identifier._class && !(yyvsp[(1) - (2)].exp).identifier._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[(1) - (2)].exp).identifier.string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(1) - (2)].exp).identifier.string);

         // printf("Declaring Class %s\n", $1.identifier.string);
         skipErrors = false;

         FreeExpression((yyvsp[(1) - (2)].exp));
         FreeExpression((yyvsp[(2) - (2)].exp));
         
         fileInput.Seek((yylsp[(1) - (2)]).start.pos, start); 
         resetScannerPos(&(yylsp[(1) - (2)]).start);
         yyclearin;

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
/*         
         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);

         YYPOPSTACK(1);
         yystate = *yyssp;
         YY_STACK_PRINT (yyss, yyssp);
*/
         yyerrok;

         goto yysetstate;
      }
      else
      {
         (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp));
         (yyval.exp).loc = (yyloc);
      } 
      skipErrors = false;
   ;}
    break;

  case 530:

/* Line 1464 of yacc.c  */
#line 1885 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 531:

/* Line 1464 of yacc.c  */
#line 1886 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 532:

/* Line 1464 of yacc.c  */
#line 1887 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 533:

/* Line 1464 of yacc.c  */
#line 1888 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 534:

/* Line 1464 of yacc.c  */
#line 1889 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 535:

/* Line 1464 of yacc.c  */
#line 1890 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 536:

/* Line 1464 of yacc.c  */
#line 1891 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 538:

/* Line 1464 of yacc.c  */
#line 1896 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 539:

/* Line 1464 of yacc.c  */
#line 1897 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 540:

/* Line 1464 of yacc.c  */
#line 1898 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 541:

/* Line 1464 of yacc.c  */
#line 1899 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 542:

/* Line 1464 of yacc.c  */
#line 1906 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 543:

/* Line 1464 of yacc.c  */
#line 1907 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 544:

/* Line 1464 of yacc.c  */
#line 1908 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 545:

/* Line 1464 of yacc.c  */
#line 1909 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 547:

/* Line 1464 of yacc.c  */
#line 1914 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 548:

/* Line 1464 of yacc.c  */
#line 1915 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 549:

/* Line 1464 of yacc.c  */
#line 1917 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 550:

/* Line 1464 of yacc.c  */
#line 1918 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 552:

/* Line 1464 of yacc.c  */
#line 1923 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 553:

/* Line 1464 of yacc.c  */
#line 1924 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 554:

/* Line 1464 of yacc.c  */
#line 1926 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 555:

/* Line 1464 of yacc.c  */
#line 1927 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 557:

/* Line 1464 of yacc.c  */
#line 1932 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 558:

/* Line 1464 of yacc.c  */
#line 1933 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 559:

/* Line 1464 of yacc.c  */
#line 1935 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 560:

/* Line 1464 of yacc.c  */
#line 1936 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 562:

/* Line 1464 of yacc.c  */
#line 1941 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 563:

/* Line 1464 of yacc.c  */
#line 1942 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 565:

/* Line 1464 of yacc.c  */
#line 1947 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 566:

/* Line 1464 of yacc.c  */
#line 1948 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 568:

/* Line 1464 of yacc.c  */
#line 1953 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 569:

/* Line 1464 of yacc.c  */
#line 1954 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 570:

/* Line 1464 of yacc.c  */
#line 1955 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 571:

/* Line 1464 of yacc.c  */
#line 1956 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 572:

/* Line 1464 of yacc.c  */
#line 1957 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 573:

/* Line 1464 of yacc.c  */
#line 1958 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 574:

/* Line 1464 of yacc.c  */
#line 1959 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 575:

/* Line 1464 of yacc.c  */
#line 1960 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 576:

/* Line 1464 of yacc.c  */
#line 1962 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 577:

/* Line 1464 of yacc.c  */
#line 1963 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 578:

/* Line 1464 of yacc.c  */
#line 1964 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 579:

/* Line 1464 of yacc.c  */
#line 1965 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 580:

/* Line 1464 of yacc.c  */
#line 1966 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 581:

/* Line 1464 of yacc.c  */
#line 1967 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 582:

/* Line 1464 of yacc.c  */
#line 1968 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 583:

/* Line 1464 of yacc.c  */
#line 1969 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 584:

/* Line 1464 of yacc.c  */
#line 1971 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 585:

/* Line 1464 of yacc.c  */
#line 1972 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 586:

/* Line 1464 of yacc.c  */
#line 1973 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 587:

/* Line 1464 of yacc.c  */
#line 1974 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 588:

/* Line 1464 of yacc.c  */
#line 1976 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 589:

/* Line 1464 of yacc.c  */
#line 1977 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 590:

/* Line 1464 of yacc.c  */
#line 1978 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 591:

/* Line 1464 of yacc.c  */
#line 1979 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 592:

/* Line 1464 of yacc.c  */
#line 1982 "grammar.y"
    { 
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (3)].exp), MkListOne(MkExpDummy()), MkExpDummy()); 
         (yyval.exp).loc = (yyloc); 
         ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (3)]); 
         (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (3)]); 
      ;}
    break;

  case 593:

/* Line 1464 of yacc.c  */
#line 1989 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (3)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (3)]); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (3)]);
      ;}
    break;

  case 594:

/* Line 1464 of yacc.c  */
#line 1993 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (2)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (2)]); (yyval.exp).cond.elseExp.loc = (yylsp[(2) - (2)]);
      ;}
    break;

  case 595:

/* Line 1464 of yacc.c  */
#line 1997 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (2)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (2)]); (yyval.exp).cond.elseExp.loc = (yylsp[(2) - (2)]);
      ;}
    break;

  case 597:

/* Line 1464 of yacc.c  */
#line 2004 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 598:

/* Line 1464 of yacc.c  */
#line 2008 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 599:

/* Line 1464 of yacc.c  */
#line 2013 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 600:

/* Line 1464 of yacc.c  */
#line 2014 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 601:

/* Line 1464 of yacc.c  */
#line 2018 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 602:

/* Line 1464 of yacc.c  */
#line 2019 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].exp)); ;}
    break;

  case 603:

/* Line 1464 of yacc.c  */
#line 2020 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 604:

/* Line 1464 of yacc.c  */
#line 2021 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 605:

/* Line 1464 of yacc.c  */
#line 2027 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 606:

/* Line 1464 of yacc.c  */
#line 2028 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 607:

/* Line 1464 of yacc.c  */
#line 2029 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 608:

/* Line 1464 of yacc.c  */
#line 2033 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 609:

/* Line 1464 of yacc.c  */
#line 2034 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].exp)); ;}
    break;

  case 610:

/* Line 1464 of yacc.c  */
#line 2035 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 611:

/* Line 1464 of yacc.c  */
#line 2036 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 614:

/* Line 1464 of yacc.c  */
#line 2046 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 615:

/* Line 1464 of yacc.c  */
#line 2047 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 616:

/* Line 1464 of yacc.c  */
#line 2048 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 617:

/* Line 1464 of yacc.c  */
#line 2049 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 618:

/* Line 1464 of yacc.c  */
#line 2050 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 619:

/* Line 1464 of yacc.c  */
#line 2054 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); declMode = defaultAccess; ;}
    break;

  case 620:

/* Line 1464 of yacc.c  */
#line 2055 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 621:

/* Line 1464 of yacc.c  */
#line 2056 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); declMode = staticAccess; ;}
    break;

  case 622:

/* Line 1464 of yacc.c  */
#line 2057 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 623:

/* Line 1464 of yacc.c  */
#line 2058 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 624:

/* Line 1464 of yacc.c  */
#line 2062 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 625:

/* Line 1464 of yacc.c  */
#line 2063 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 626:

/* Line 1464 of yacc.c  */
#line 2064 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 627:

/* Line 1464 of yacc.c  */
#line 2068 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 628:

/* Line 1464 of yacc.c  */
#line 2069 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 630:

/* Line 1464 of yacc.c  */
#line 2074 "grammar.y"
    { memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 631:

/* Line 1464 of yacc.c  */
#line 2078 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 632:

/* Line 1464 of yacc.c  */
#line 2079 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); POP_DEFAULT_ACCESS ;}
    break;

  case 633:

/* Line 1464 of yacc.c  */
#line 2083 "grammar.y"
    { (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS (yyval.specifier) = (yyvsp[(1) - (2)].specifier); ;}
    break;

  case 634:

/* Line 1464 of yacc.c  */
#line 2084 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 635:

/* Line 1464 of yacc.c  */
#line 2085 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), null); FreeSpecifier((yyvsp[(2) - (4)].specifier)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 636:

/* Line 1464 of yacc.c  */
#line 2089 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 637:

/* Line 1464 of yacc.c  */
#line 2090 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 638:

/* Line 1464 of yacc.c  */
#line 2092 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), (yyvsp[(4) - (4)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 639:

/* Line 1464 of yacc.c  */
#line 2093 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list));  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 640:

/* Line 1464 of yacc.c  */
#line 2094 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), null);  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 641:

/* Line 1464 of yacc.c  */
#line 2095 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 642:

/* Line 1464 of yacc.c  */
#line 2096 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 643:

/* Line 1464 of yacc.c  */
#line 2098 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), (yyvsp[(4) - (4)].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (4)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 644:

/* Line 1464 of yacc.c  */
#line 2099 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (5)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 645:

/* Line 1464 of yacc.c  */
#line 2100 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), null); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (4)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 646:

/* Line 1464 of yacc.c  */
#line 2101 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (6)].specifier).name), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list); FreeSpecifier((yyvsp[(2) - (6)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 647:

/* Line 1464 of yacc.c  */
#line 2102 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (6)].specifier).name), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list); FreeSpecifier((yyvsp[(2) - (6)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 648:

/* Line 1464 of yacc.c  */
#line 2106 "grammar.y"
    { (yyval.id) = (yyvsp[(2) - (2)].id); if(declMode) DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 649:

/* Line 1464 of yacc.c  */
#line 2107 "grammar.y"
    { (yyval.id) = MkIdentifier((yyvsp[(2) - (2)].specifier).name); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 650:

/* Line 1464 of yacc.c  */
#line 2111 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 651:

/* Line 1464 of yacc.c  */
#line 2112 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 652:

/* Line 1464 of yacc.c  */
#line 2113 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 653:

/* Line 1464 of yacc.c  */
#line 2117 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(5) - (5)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 654:

/* Line 1464 of yacc.c  */
#line 2118 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (6)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 655:

/* Line 1464 of yacc.c  */
#line 2119 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 656:

/* Line 1464 of yacc.c  */
#line 2120 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), (yyvsp[(5) - (7)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 657:

/* Line 1464 of yacc.c  */
#line 2121 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), (yyvsp[(5) - (7)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 658:

/* Line 1464 of yacc.c  */
#line 2122 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (8)].id), (yyvsp[(5) - (8)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (8)].list); (yyval.specifier).definitions = (yyvsp[(8) - (8)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 659:

/* Line 1464 of yacc.c  */
#line 2123 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (8)].id), (yyvsp[(5) - (8)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (8)].list); (yyval.specifier).definitions = (yyvsp[(8) - (8)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 660:

/* Line 1464 of yacc.c  */
#line 2124 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 661:

/* Line 1464 of yacc.c  */
#line 2125 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 662:

/* Line 1464 of yacc.c  */
#line 2127 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 663:

/* Line 1464 of yacc.c  */
#line 2128 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 664:

/* Line 1464 of yacc.c  */
#line 2130 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 665:

/* Line 1464 of yacc.c  */
#line 2131 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (4)].id), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 666:

/* Line 1464 of yacc.c  */
#line 2132 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 667:

/* Line 1464 of yacc.c  */
#line 2133 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(3) - (5)].list)); (yyval.specifier).definitions = (yyvsp[(5) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 668:

/* Line 1464 of yacc.c  */
#line 2134 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(3) - (5)].list)); (yyval.specifier).definitions = (yyvsp[(5) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 673:

/* Line 1464 of yacc.c  */
#line 2148 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 674:

/* Line 1464 of yacc.c  */
#line 2149 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); ;}
    break;

  case 675:

/* Line 1464 of yacc.c  */
#line 2153 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 676:

/* Line 1464 of yacc.c  */
#line 2154 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 677:

/* Line 1464 of yacc.c  */
#line 2155 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 678:

/* Line 1464 of yacc.c  */
#line 2160 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 679:

/* Line 1464 of yacc.c  */
#line 2161 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 680:

/* Line 1464 of yacc.c  */
#line 2165 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 681:

/* Line 1464 of yacc.c  */
#line 2166 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 682:

/* Line 1464 of yacc.c  */
#line 2167 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 683:

/* Line 1464 of yacc.c  */
#line 2168 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 684:

/* Line 1464 of yacc.c  */
#line 2169 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 685:

/* Line 1464 of yacc.c  */
#line 2170 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 686:

/* Line 1464 of yacc.c  */
#line 2171 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 687:

/* Line 1464 of yacc.c  */
#line 2172 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 688:

/* Line 1464 of yacc.c  */
#line 2173 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 689:

/* Line 1464 of yacc.c  */
#line 2174 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 690:

/* Line 1464 of yacc.c  */
#line 2175 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 691:

/* Line 1464 of yacc.c  */
#line 2176 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 692:

/* Line 1464 of yacc.c  */
#line 2177 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 696:

/* Line 1464 of yacc.c  */
#line 2181 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 697:

/* Line 1464 of yacc.c  */
#line 2182 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 698:

/* Line 1464 of yacc.c  */
#line 2183 "grammar.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 699:

/* Line 1464 of yacc.c  */
#line 2184 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 700:

/* Line 1464 of yacc.c  */
#line 2185 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 701:

/* Line 1464 of yacc.c  */
#line 2186 "grammar.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 702:

/* Line 1464 of yacc.c  */
#line 2190 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 703:

/* Line 1464 of yacc.c  */
#line 2191 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 704:

/* Line 1464 of yacc.c  */
#line 2192 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 705:

/* Line 1464 of yacc.c  */
#line 2193 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 706:

/* Line 1464 of yacc.c  */
#line 2194 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 707:

/* Line 1464 of yacc.c  */
#line 2195 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 708:

/* Line 1464 of yacc.c  */
#line 2196 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 709:

/* Line 1464 of yacc.c  */
#line 2197 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 710:

/* Line 1464 of yacc.c  */
#line 2198 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 711:

/* Line 1464 of yacc.c  */
#line 2199 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 712:

/* Line 1464 of yacc.c  */
#line 2200 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 713:

/* Line 1464 of yacc.c  */
#line 2201 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 714:

/* Line 1464 of yacc.c  */
#line 2202 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 718:

/* Line 1464 of yacc.c  */
#line 2206 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 719:

/* Line 1464 of yacc.c  */
#line 2207 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 720:

/* Line 1464 of yacc.c  */
#line 2208 "grammar.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 721:

/* Line 1464 of yacc.c  */
#line 2209 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 722:

/* Line 1464 of yacc.c  */
#line 2216 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 723:

/* Line 1464 of yacc.c  */
#line 2218 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 724:

/* Line 1464 of yacc.c  */
#line 2220 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 725:

/* Line 1464 of yacc.c  */
#line 2222 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 726:

/* Line 1464 of yacc.c  */
#line 2224 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 727:

/* Line 1464 of yacc.c  */
#line 2226 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 728:

/* Line 1464 of yacc.c  */
#line 2228 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 729:

/* Line 1464 of yacc.c  */
#line 2230 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 730:

/* Line 1464 of yacc.c  */
#line 2232 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 731:

/* Line 1464 of yacc.c  */
#line 2234 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 732:

/* Line 1464 of yacc.c  */
#line 2238 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 733:

/* Line 1464 of yacc.c  */
#line 2239 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 734:

/* Line 1464 of yacc.c  */
#line 2244 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null);
         (yyval.specifier).addNameSpace = true;
         (yyval.specifier).ctx = PushContext();
      ;}
    break;

  case 735:

/* Line 1464 of yacc.c  */
#line 2250 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null);
         (yyval.specifier).ctx = PushContext();
         FreeSpecifier((yyvsp[(2) - (2)].specifier));
      ;}
    break;

  case 736:

/* Line 1464 of yacc.c  */
#line 2258 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 737:

/* Line 1464 of yacc.c  */
#line 2259 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 738:

/* Line 1464 of yacc.c  */
#line 2260 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 739:

/* Line 1464 of yacc.c  */
#line 2264 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); AddStructDefinitions((yyvsp[(1) - (3)].specifier), (yyvsp[(3) - (3)].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 740:

/* Line 1464 of yacc.c  */
#line 2265 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); AddStructDefinitions((yyvsp[(1) - (3)].specifier), (yyvsp[(3) - (3)].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 741:

/* Line 1464 of yacc.c  */
#line 2266 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 742:

/* Line 1464 of yacc.c  */
#line 2268 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 743:

/* Line 1464 of yacc.c  */
#line 2269 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 744:

/* Line 1464 of yacc.c  */
#line 2270 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 745:

/* Line 1464 of yacc.c  */
#line 2274 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 746:

/* Line 1464 of yacc.c  */
#line 2279 "grammar.y"
    {
        (yyval.specifier) = (yyvsp[(1) - (1)].specifier);
        if(declMode)
        {
           ((yyvsp[(1) - (1)].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[(1) - (1)].specifier).id.string);
        }
     ;}
    break;

  case 747:

/* Line 1464 of yacc.c  */
#line 2287 "grammar.y"
    {
      Symbol symbol = ((yyvsp[(1) - (4)].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[(1) - (4)].specifier).id.string);
      (yyval.specifier) = (yyvsp[(1) - (4)].specifier);
      symbol.templateParams = (yyvsp[(3) - (4)].list);
   ;}
    break;

  case 748:

/* Line 1464 of yacc.c  */
#line 2296 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).baseSpecs = (yyvsp[(3) - (3)].list);
      SetupBaseSpecs(null, (yyvsp[(3) - (3)].list));
   ;}
    break;

  case 749:

/* Line 1464 of yacc.c  */
#line 2304 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 750:

/* Line 1464 of yacc.c  */
#line 2306 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 751:

/* Line 1464 of yacc.c  */
#line 2307 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 752:

/* Line 1464 of yacc.c  */
#line 2308 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 753:

/* Line 1464 of yacc.c  */
#line 2313 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 754:

/* Line 1464 of yacc.c  */
#line 2320 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 755:

/* Line 1464 of yacc.c  */
#line 2327 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext);;}
    break;

  case 756:

/* Line 1464 of yacc.c  */
#line 2330 "grammar.y"
    {
        PopContext(curContext);
        if(!declMode)
        {
           (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifier).type, (yyvsp[(1) - (3)].specifier).id, (yyvsp[(3) - (3)].list));
           (yyvsp[(1) - (3)].specifier).id = null;
           FreeSpecifier((yyvsp[(1) - (3)].specifier));
        }
        else
           (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
        POP_DEFAULT_ACCESS
     ;}
    break;

  case 757:

/* Line 1464 of yacc.c  */
#line 2343 "grammar.y"
    {
        PopContext(curContext);

        if(!declMode)
        {
           (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifier).type, (yyvsp[(1) - (3)].specifier).id, (yyvsp[(3) - (3)].list));
           (yyvsp[(1) - (3)].specifier).id = null;
           FreeSpecifier((yyvsp[(1) - (3)].specifier));
        }
        else
           (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
        POP_DEFAULT_ACCESS
     ;}
    break;

  case 758:

/* Line 1464 of yacc.c  */
#line 2357 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 759:

/* Line 1464 of yacc.c  */
#line 2360 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS  ;}
    break;

  case 760:

/* Line 1464 of yacc.c  */
#line 2362 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 761:

/* Line 1464 of yacc.c  */
#line 2364 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 762:

/* Line 1464 of yacc.c  */
#line 2368 "grammar.y"
    { (yyval.specifierType) = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 763:

/* Line 1464 of yacc.c  */
#line 2369 "grammar.y"
    { (yyval.specifierType) = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 764:

/* Line 1464 of yacc.c  */
#line 2373 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 765:

/* Line 1464 of yacc.c  */
#line 2374 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 766:

/* Line 1464 of yacc.c  */
#line 2375 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 767:

/* Line 1464 of yacc.c  */
#line 2376 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 768:

/* Line 1464 of yacc.c  */
#line 2377 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 769:

/* Line 1464 of yacc.c  */
#line 2378 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 770:

/* Line 1464 of yacc.c  */
#line 2379 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 771:

/* Line 1464 of yacc.c  */
#line 2380 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 772:

/* Line 1464 of yacc.c  */
#line 2384 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 773:

/* Line 1464 of yacc.c  */
#line 2385 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 774:

/* Line 1464 of yacc.c  */
#line 2386 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 775:

/* Line 1464 of yacc.c  */
#line 2387 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 776:

/* Line 1464 of yacc.c  */
#line 2388 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 777:

/* Line 1464 of yacc.c  */
#line 2389 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 778:

/* Line 1464 of yacc.c  */
#line 2390 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 779:

/* Line 1464 of yacc.c  */
#line 2391 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 780:

/* Line 1464 of yacc.c  */
#line 2392 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 781:

/* Line 1464 of yacc.c  */
#line 2393 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 782:

/* Line 1464 of yacc.c  */
#line 2397 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 783:

/* Line 1464 of yacc.c  */
#line 2398 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 784:

/* Line 1464 of yacc.c  */
#line 2399 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 785:

/* Line 1464 of yacc.c  */
#line 2400 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 786:

/* Line 1464 of yacc.c  */
#line 2401 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 787:

/* Line 1464 of yacc.c  */
#line 2402 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 788:

/* Line 1464 of yacc.c  */
#line 2403 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 789:

/* Line 1464 of yacc.c  */
#line 2404 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 790:

/* Line 1464 of yacc.c  */
#line 2405 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 791:

/* Line 1464 of yacc.c  */
#line 2406 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 792:

/* Line 1464 of yacc.c  */
#line 2410 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 793:

/* Line 1464 of yacc.c  */
#line 2411 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 794:

/* Line 1464 of yacc.c  */
#line 2412 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 795:

/* Line 1464 of yacc.c  */
#line 2413 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 796:

/* Line 1464 of yacc.c  */
#line 2414 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 797:

/* Line 1464 of yacc.c  */
#line 2415 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 798:

/* Line 1464 of yacc.c  */
#line 2416 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 799:

/* Line 1464 of yacc.c  */
#line 2417 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 800:

/* Line 1464 of yacc.c  */
#line 2418 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 801:

/* Line 1464 of yacc.c  */
#line 2419 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 802:

/* Line 1464 of yacc.c  */
#line 2420 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 803:

/* Line 1464 of yacc.c  */
#line 2421 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 804:

/* Line 1464 of yacc.c  */
#line 2425 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 805:

/* Line 1464 of yacc.c  */
#line 2426 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 806:

/* Line 1464 of yacc.c  */
#line 2427 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 807:

/* Line 1464 of yacc.c  */
#line 2428 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 808:

/* Line 1464 of yacc.c  */
#line 2429 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 809:

/* Line 1464 of yacc.c  */
#line 2430 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 810:

/* Line 1464 of yacc.c  */
#line 2431 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 811:

/* Line 1464 of yacc.c  */
#line 2432 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 812:

/* Line 1464 of yacc.c  */
#line 2433 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 813:

/* Line 1464 of yacc.c  */
#line 2434 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 814:

/* Line 1464 of yacc.c  */
#line 2438 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 815:

/* Line 1464 of yacc.c  */
#line 2439 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 816:

/* Line 1464 of yacc.c  */
#line 2443 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PRIVATE)); ;}
    break;

  case 817:

/* Line 1464 of yacc.c  */
#line 2444 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PUBLIC)); ;}
    break;

  case 818:

/* Line 1464 of yacc.c  */
#line 2445 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 819:

/* Line 1464 of yacc.c  */
#line 2446 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 820:

/* Line 1464 of yacc.c  */
#line 2447 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 821:

/* Line 1464 of yacc.c  */
#line 2448 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 822:

/* Line 1464 of yacc.c  */
#line 2449 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 823:

/* Line 1464 of yacc.c  */
#line 2450 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 824:

/* Line 1464 of yacc.c  */
#line 2452 "grammar.y"
    { _DeclClass(0, (yyvsp[(1) - (1)].id).string); (yyval.list) = MkListOne(MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 825:

/* Line 1464 of yacc.c  */
#line 2453 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); _DeclClass(0, (yyvsp[(2) - (2)].id).string); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 826:

/* Line 1464 of yacc.c  */
#line 2456 "grammar.y"
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

  case 827:

/* Line 1464 of yacc.c  */
#line 2474 "grammar.y"
    {
         (yyval.list) = (yyvsp[(1) - (5)].list);
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

  case 829:

/* Line 1464 of yacc.c  */
#line 2492 "grammar.y"
    { (yyval.list) = MkListOne(MkStructOrUnion((yyvsp[(1) - (1)].specifierType), null, null)); POP_DEFAULT_ACCESS ;}
    break;

  case 830:

/* Line 1464 of yacc.c  */
#line 2496 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 831:

/* Line 1464 of yacc.c  */
#line 2497 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 832:

/* Line 1464 of yacc.c  */
#line 2498 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 833:

/* Line 1464 of yacc.c  */
#line 2499 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 834:

/* Line 1464 of yacc.c  */
#line 2500 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 835:

/* Line 1464 of yacc.c  */
#line 2501 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 836:

/* Line 1464 of yacc.c  */
#line 2502 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 837:

/* Line 1464 of yacc.c  */
#line 2503 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 838:

/* Line 1464 of yacc.c  */
#line 2505 "grammar.y"
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

  case 839:

/* Line 1464 of yacc.c  */
#line 2523 "grammar.y"
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

  case 840:

/* Line 1464 of yacc.c  */
#line 2539 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 841:

/* Line 1464 of yacc.c  */
#line 2540 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 842:

/* Line 1464 of yacc.c  */
#line 2541 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 843:

/* Line 1464 of yacc.c  */
#line 2542 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 844:

/* Line 1464 of yacc.c  */
#line 2543 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 845:

/* Line 1464 of yacc.c  */
#line 2544 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 846:

/* Line 1464 of yacc.c  */
#line 2545 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 847:

/* Line 1464 of yacc.c  */
#line 2546 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 848:

/* Line 1464 of yacc.c  */
#line 2547 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 849:

/* Line 1464 of yacc.c  */
#line 2548 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 850:

/* Line 1464 of yacc.c  */
#line 2549 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 851:

/* Line 1464 of yacc.c  */
#line 2550 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 852:

/* Line 1464 of yacc.c  */
#line 2552 "grammar.y"
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

  case 853:

/* Line 1464 of yacc.c  */
#line 2570 "grammar.y"
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

  case 854:

/* Line 1464 of yacc.c  */
#line 2586 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 855:

/* Line 1464 of yacc.c  */
#line 2587 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 856:

/* Line 1464 of yacc.c  */
#line 2588 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 857:

/* Line 1464 of yacc.c  */
#line 2589 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 858:

/* Line 1464 of yacc.c  */
#line 2590 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 859:

/* Line 1464 of yacc.c  */
#line 2591 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 860:

/* Line 1464 of yacc.c  */
#line 2592 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 861:

/* Line 1464 of yacc.c  */
#line 2593 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 862:

/* Line 1464 of yacc.c  */
#line 2594 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 863:

/* Line 1464 of yacc.c  */
#line 2595 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 864:

/* Line 1464 of yacc.c  */
#line 2596 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 865:

/* Line 1464 of yacc.c  */
#line 2597 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 866:

/* Line 1464 of yacc.c  */
#line 2599 "grammar.y"
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

  case 867:

/* Line 1464 of yacc.c  */
#line 2617 "grammar.y"
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

  case 868:

/* Line 1464 of yacc.c  */
#line 2633 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 869:

/* Line 1464 of yacc.c  */
#line 2634 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 870:

/* Line 1464 of yacc.c  */
#line 2638 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 871:

/* Line 1464 of yacc.c  */
#line 2639 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 872:

/* Line 1464 of yacc.c  */
#line 2640 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 873:

/* Line 1464 of yacc.c  */
#line 2641 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 874:

/* Line 1464 of yacc.c  */
#line 2642 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 875:

/* Line 1464 of yacc.c  */
#line 2646 "grammar.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 876:

/* Line 1464 of yacc.c  */
#line 2647 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 877:

/* Line 1464 of yacc.c  */
#line 2648 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 878:

/* Line 1464 of yacc.c  */
#line 2649 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 879:

/* Line 1464 of yacc.c  */
#line 2650 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 880:

/* Line 1464 of yacc.c  */
#line 2651 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 882:

/* Line 1464 of yacc.c  */
#line 2659 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 883:

/* Line 1464 of yacc.c  */
#line 2660 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 884:

/* Line 1464 of yacc.c  */
#line 2661 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 885:

/* Line 1464 of yacc.c  */
#line 2662 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 886:

/* Line 1464 of yacc.c  */
#line 2663 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 887:

/* Line 1464 of yacc.c  */
#line 2669 "grammar.y"
    {
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), (yyvsp[(2) - (2)].list)); 
         fileInput.Seek((yylsp[(1) - (2)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (2)]).end);
         (yyloc).start = (yylsp[(1) - (2)]).start;
         (yyloc).end = (yylsp[(1) - (2)]).end;
      ;}
    break;

  case 888:

/* Line 1464 of yacc.c  */
#line 2678 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); 
         fileInput.Seek((yylsp[(1) - (2)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (2)]).end);
         (yyloc).start = (yylsp[(1) - (2)]).start;
         (yyloc).end = (yylsp[(1) - (2)]).end;
      ;}
    break;

  case 889:

/* Line 1464 of yacc.c  */
#line 2687 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); 
         fileInput.Seek((yylsp[(1) - (3)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (3)]).end);
         (yyloc).start = (yylsp[(1) - (3)]).start;
         (yyloc).end = (yylsp[(1) - (3)]).end;
      ;}
    break;

  case 890:

/* Line 1464 of yacc.c  */
#line 2696 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), null); 
         fileInput.Seek((yylsp[(1) - (4)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (4)]).end);
         (yyloc).start = (yylsp[(1) - (4)]).start;
         (yyloc).end = (yylsp[(1) - (4)]).end;
         FreeList((yyvsp[(2) - (4)].list), FreeSpecifier);
         FreeIdentifier((yyvsp[(3) - (4)].id));
      ;}
    break;

  case 893:

/* Line 1464 of yacc.c  */
#line 2712 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 894:

/* Line 1464 of yacc.c  */
#line 2714 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 895:

/* Line 1464 of yacc.c  */
#line 2758 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 897:

/* Line 1464 of yacc.c  */
#line 2761 "grammar.y"
    {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, (yyvsp[(3) - (4)].string));
         strcat(temp, ")");
         (yyval.string) = CopyString(temp);
         delete (yyvsp[(3) - (4)].string);
      ;}
    break;

  case 898:

/* Line 1464 of yacc.c  */
#line 2772 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 899:

/* Line 1464 of yacc.c  */
#line 2778 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 900:

/* Line 1464 of yacc.c  */
#line 2780 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 901:

/* Line 1464 of yacc.c  */
#line 2782 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 902:

/* Line 1464 of yacc.c  */
#line 2784 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 903:

/* Line 1464 of yacc.c  */
#line 2786 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 904:

/* Line 1464 of yacc.c  */
#line 2788 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 905:

/* Line 1464 of yacc.c  */
#line 2790 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 906:

/* Line 1464 of yacc.c  */
#line 2792 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 907:

/* Line 1464 of yacc.c  */
#line 2794 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 908:

/* Line 1464 of yacc.c  */
#line 2796 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 909:

/* Line 1464 of yacc.c  */
#line 2798 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 910:

/* Line 1464 of yacc.c  */
#line 2800 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 911:

/* Line 1464 of yacc.c  */
#line 2802 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 912:

/* Line 1464 of yacc.c  */
#line 2804 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 913:

/* Line 1464 of yacc.c  */
#line 2806 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 914:

/* Line 1464 of yacc.c  */
#line 2811 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 915:

/* Line 1464 of yacc.c  */
#line 2813 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 916:

/* Line 1464 of yacc.c  */
#line 2815 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 917:

/* Line 1464 of yacc.c  */
#line 2817 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 918:

/* Line 1464 of yacc.c  */
#line 2819 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 919:

/* Line 1464 of yacc.c  */
#line 2821 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 920:

/* Line 1464 of yacc.c  */
#line 2823 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 921:

/* Line 1464 of yacc.c  */
#line 2827 "grammar.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 922:

/* Line 1464 of yacc.c  */
#line 2828 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 923:

/* Line 1464 of yacc.c  */
#line 2829 "grammar.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 924:

/* Line 1464 of yacc.c  */
#line 2830 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 925:

/* Line 1464 of yacc.c  */
#line 2834 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 927:

/* Line 1464 of yacc.c  */
#line 2836 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 928:

/* Line 1464 of yacc.c  */
#line 2837 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 929:

/* Line 1464 of yacc.c  */
#line 2838 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 930:

/* Line 1464 of yacc.c  */
#line 2839 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 931:

/* Line 1464 of yacc.c  */
#line 2843 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 933:

/* Line 1464 of yacc.c  */
#line 2845 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 934:

/* Line 1464 of yacc.c  */
#line 2846 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 935:

/* Line 1464 of yacc.c  */
#line 2847 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 936:

/* Line 1464 of yacc.c  */
#line 2848 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 938:

/* Line 1464 of yacc.c  */
#line 2854 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 939:

/* Line 1464 of yacc.c  */
#line 2856 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 940:

/* Line 1464 of yacc.c  */
#line 2858 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].string), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 942:

/* Line 1464 of yacc.c  */
#line 2863 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 943:

/* Line 1464 of yacc.c  */
#line 2864 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 944:

/* Line 1464 of yacc.c  */
#line 2865 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 945:

/* Line 1464 of yacc.c  */
#line 2866 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 947:

/* Line 1464 of yacc.c  */
#line 2871 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 948:

/* Line 1464 of yacc.c  */
#line 2872 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 949:

/* Line 1464 of yacc.c  */
#line 2873 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 950:

/* Line 1464 of yacc.c  */
#line 2874 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 952:

/* Line 1464 of yacc.c  */
#line 2879 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 953:

/* Line 1464 of yacc.c  */
#line 2880 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 954:

/* Line 1464 of yacc.c  */
#line 2881 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 955:

/* Line 1464 of yacc.c  */
#line 2882 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 956:

/* Line 1464 of yacc.c  */
#line 2886 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 957:

/* Line 1464 of yacc.c  */
#line 2887 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 958:

/* Line 1464 of yacc.c  */
#line 2889 "grammar.y"
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

  case 959:

/* Line 1464 of yacc.c  */
#line 2904 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 960:

/* Line 1464 of yacc.c  */
#line 2905 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (4)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 961:

/* Line 1464 of yacc.c  */
#line 2906 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (2)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 962:

/* Line 1464 of yacc.c  */
#line 2908 "grammar.y"
    { 
         (yyval.initializer) = MkInitializerList((yyvsp[(2) - (5)].list)); 
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[(3) - (5)]);
            exp.loc = (yylsp[(3) - (5)]);
            ListAdd((yyvsp[(2) - (5)].list), init); 
         }
      ;}
    break;

  case 963:

/* Line 1464 of yacc.c  */
#line 2921 "grammar.y"
    { 
         (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); 
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[(3) - (3)]);
            exp.loc = (yylsp[(3) - (3)]);
            ListAdd((yyvsp[(2) - (3)].list), init); 
         }
      ;}
    break;

  case 964:

/* Line 1464 of yacc.c  */
#line 2936 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 965:

/* Line 1464 of yacc.c  */
#line 2938 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 966:

/* Line 1464 of yacc.c  */
#line 2942 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 967:

/* Line 1464 of yacc.c  */
#line 2943 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 968:

/* Line 1464 of yacc.c  */
#line 2947 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 969:

/* Line 1464 of yacc.c  */
#line 2948 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 970:

/* Line 1464 of yacc.c  */
#line 2949 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 971:

/* Line 1464 of yacc.c  */
#line 2950 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 972:

/* Line 1464 of yacc.c  */
#line 2953 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].initializer)); ;}
    break;

  case 973:

/* Line 1464 of yacc.c  */
#line 2954 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].initializer)); ;}
    break;

  case 974:

/* Line 1464 of yacc.c  */
#line 2958 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 975:

/* Line 1464 of yacc.c  */
#line 2959 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 976:

/* Line 1464 of yacc.c  */
#line 2963 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 977:

/* Line 1464 of yacc.c  */
#line 2967 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 978:

/* Line 1464 of yacc.c  */
#line 2971 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 979:

/* Line 1464 of yacc.c  */
#line 2972 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 980:

/* Line 1464 of yacc.c  */
#line 2973 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 981:

/* Line 1464 of yacc.c  */
#line 2977 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 982:

/* Line 1464 of yacc.c  */
#line 2978 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].initDeclarator)); ;}
    break;

  case 983:

/* Line 1464 of yacc.c  */
#line 2979 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 984:

/* Line 1464 of yacc.c  */
#line 2980 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 985:

/* Line 1464 of yacc.c  */
#line 2984 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 986:

/* Line 1464 of yacc.c  */
#line 2985 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 987:

/* Line 1464 of yacc.c  */
#line 2989 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 988:

/* Line 1464 of yacc.c  */
#line 2990 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 989:

/* Line 1464 of yacc.c  */
#line 2995 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 990:

/* Line 1464 of yacc.c  */
#line 2996 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 991:

/* Line 1464 of yacc.c  */
#line 2997 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 992:

/* Line 1464 of yacc.c  */
#line 2998 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 993:

/* Line 1464 of yacc.c  */
#line 2999 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 994:

/* Line 1464 of yacc.c  */
#line 3001 "grammar.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 995:

/* Line 1464 of yacc.c  */
#line 3019 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 996:

/* Line 1464 of yacc.c  */
#line 3020 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 997:

/* Line 1464 of yacc.c  */
#line 3024 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 998:

/* Line 1464 of yacc.c  */
#line 3025 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 999:

/* Line 1464 of yacc.c  */
#line 3026 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1000:

/* Line 1464 of yacc.c  */
#line 3027 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1001:

/* Line 1464 of yacc.c  */
#line 3028 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1002:

/* Line 1464 of yacc.c  */
#line 3029 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1003:

/* Line 1464 of yacc.c  */
#line 3031 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1004:

/* Line 1464 of yacc.c  */
#line 3032 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1005:

/* Line 1464 of yacc.c  */
#line 3033 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1006:

/* Line 1464 of yacc.c  */
#line 3034 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1007:

/* Line 1464 of yacc.c  */
#line 3038 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 1008:

/* Line 1464 of yacc.c  */
#line 3039 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1009:

/* Line 1464 of yacc.c  */
#line 3040 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1010:

/* Line 1464 of yacc.c  */
#line 3041 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1011:

/* Line 1464 of yacc.c  */
#line 3042 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1012:

/* Line 1464 of yacc.c  */
#line 3044 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1013:

/* Line 1464 of yacc.c  */
#line 3045 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1014:

/* Line 1464 of yacc.c  */
#line 3046 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1016:

/* Line 1464 of yacc.c  */
#line 3051 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1017:

/* Line 1464 of yacc.c  */
#line 3052 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1018:

/* Line 1464 of yacc.c  */
#line 3053 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1019:

/* Line 1464 of yacc.c  */
#line 3054 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1020:

/* Line 1464 of yacc.c  */
#line 3055 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, null)); ;}
    break;

  case 1022:

/* Line 1464 of yacc.c  */
#line 3060 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 1025:

/* Line 1464 of yacc.c  */
#line 3067 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1027:

/* Line 1464 of yacc.c  */
#line 3069 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1028:

/* Line 1464 of yacc.c  */
#line 3070 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1029:

/* Line 1464 of yacc.c  */
#line 3071 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1037:

/* Line 1464 of yacc.c  */
#line 3082 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1038:

/* Line 1464 of yacc.c  */
#line 3083 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1039:

/* Line 1464 of yacc.c  */
#line 3084 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1040:

/* Line 1464 of yacc.c  */
#line 3085 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1041:

/* Line 1464 of yacc.c  */
#line 3086 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1042:

/* Line 1464 of yacc.c  */
#line 3087 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (2)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1043:

/* Line 1464 of yacc.c  */
#line 3088 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (1)].list)); Compiler_Error("syntax error\n"); (yyval.stmt).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 1044:

/* Line 1464 of yacc.c  */
#line 3092 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[(1) - (1)].string), null); (yyval.asmField).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 1045:

/* Line 1464 of yacc.c  */
#line 3093 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[(1) - (4)].string), (yyvsp[(3) - (4)].exp)); (yyval.asmField).loc = (yyloc); ;}
    break;

  case 1046:

/* Line 1464 of yacc.c  */
#line 3097 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].asmField)); ;}
    break;

  case 1047:

/* Line 1464 of yacc.c  */
#line 3098 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[(3) - (3)].asmField)); ;}
    break;

  case 1048:

/* Line 1464 of yacc.c  */
#line 3099 "grammar.y"
    { (yyval.list) = null; ;}
    break;

  case 1049:

/* Line 1464 of yacc.c  */
#line 3103 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (6)].specifier), (yyvsp[(4) - (6)].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1050:

/* Line 1464 of yacc.c  */
#line 3104 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (8)].specifier), (yyvsp[(4) - (8)].string), (yyvsp[(6) - (8)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1051:

/* Line 1464 of yacc.c  */
#line 3105 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), (yyvsp[(6) - (10)].list), (yyvsp[(8) - (10)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1052:

/* Line 1464 of yacc.c  */
#line 3106 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (12)].specifier), (yyvsp[(4) - (12)].string), (yyvsp[(6) - (12)].list), (yyvsp[(8) - (12)].list), (yyvsp[(10) - (12)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1053:

/* Line 1464 of yacc.c  */
#line 3108 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (8)].specifier), (yyvsp[(4) - (8)].string), null, (yyvsp[(6) - (8)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1054:

/* Line 1464 of yacc.c  */
#line 3109 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), null, (yyvsp[(6) - (10)].list), (yyvsp[(8) - (10)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1055:

/* Line 1464 of yacc.c  */
#line 3110 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), (yyvsp[(6) - (10)].list), null, (yyvsp[(8) - (10)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1056:

/* Line 1464 of yacc.c  */
#line 3112 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (5)].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1057:

/* Line 1464 of yacc.c  */
#line 3113 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (7)].string), (yyvsp[(5) - (7)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1058:

/* Line 1464 of yacc.c  */
#line 3114 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1059:

/* Line 1464 of yacc.c  */
#line 3115 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (11)].string), (yyvsp[(5) - (11)].list), (yyvsp[(7) - (11)].list), (yyvsp[(9) - (11)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1060:

/* Line 1464 of yacc.c  */
#line 3117 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (7)].string), null, (yyvsp[(5) - (7)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1061:

/* Line 1464 of yacc.c  */
#line 3118 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), null, (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1062:

/* Line 1464 of yacc.c  */
#line 3119 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), (yyvsp[(5) - (9)].list), null, (yyvsp[(7) - (9)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1063:

/* Line 1464 of yacc.c  */
#line 3123 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1064:

/* Line 1464 of yacc.c  */
#line 3124 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1065:

/* Line 1464 of yacc.c  */
#line 3125 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1066:

/* Line 1464 of yacc.c  */
#line 3126 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (3)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (3)]).end; ;}
    break;

  case 1067:

/* Line 1464 of yacc.c  */
#line 3127 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1068:

/* Line 1464 of yacc.c  */
#line 3131 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1069:

/* Line 1464 of yacc.c  */
#line 3132 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1070:

/* Line 1464 of yacc.c  */
#line 3133 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1071:

/* Line 1464 of yacc.c  */
#line 3134 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (3)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (3)]).end; ;}
    break;

  case 1072:

/* Line 1464 of yacc.c  */
#line 3135 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), null); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (2)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (2)]).end; ;}
    break;

  case 1073:

/* Line 1464 of yacc.c  */
#line 3136 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1074:

/* Line 1464 of yacc.c  */
#line 3137 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1075:

/* Line 1464 of yacc.c  */
#line 3141 "grammar.y"
    { (yyval.declMode) = declMode = publicAccess; ;}
    break;

  case 1076:

/* Line 1464 of yacc.c  */
#line 3142 "grammar.y"
    { (yyval.declMode) = declMode = privateAccess; ;}
    break;

  case 1077:

/* Line 1464 of yacc.c  */
#line 3143 "grammar.y"
    { (yyval.declMode) = declMode = defaultAccess; ;}
    break;

  case 1078:

/* Line 1464 of yacc.c  */
#line 3147 "grammar.y"
    { (yyval.declMode) = publicAccess; ;}
    break;

  case 1079:

/* Line 1464 of yacc.c  */
#line 3148 "grammar.y"
    { (yyval.declMode) = privateAccess; ;}
    break;

  case 1080:

/* Line 1464 of yacc.c  */
#line 3152 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1081:

/* Line 1464 of yacc.c  */
#line 3153 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1082:

/* Line 1464 of yacc.c  */
#line 3154 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1083:

/* Line 1464 of yacc.c  */
#line 3155 "grammar.y"
    { (yyval.declaration) = (yyvsp[(1) - (2)].declaration); ;}
    break;

  case 1084:

/* Line 1464 of yacc.c  */
#line 3159 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1085:

/* Line 1464 of yacc.c  */
#line 3160 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1086:

/* Line 1464 of yacc.c  */
#line 3161 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1087:

/* Line 1464 of yacc.c  */
#line 3163 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1088:

/* Line 1464 of yacc.c  */
#line 3164 "grammar.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1089:

/* Line 1464 of yacc.c  */
#line 3165 "grammar.y"
    { declMode = staticAccess; (yyval.declaration) = MkDeclarationDefine((yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1090:

/* Line 1464 of yacc.c  */
#line 3169 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); yyerrok; ;}
    break;

  case 1091:

/* Line 1464 of yacc.c  */
#line 3173 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1092:

/* Line 1464 of yacc.c  */
#line 3174 "grammar.y"
    {;}
    break;

  case 1093:

/* Line 1464 of yacc.c  */
#line 3176 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1094:

/* Line 1464 of yacc.c  */
#line 3177 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1095:

/* Line 1464 of yacc.c  */
#line 3178 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1096:

/* Line 1464 of yacc.c  */
#line 3182 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1097:

/* Line 1464 of yacc.c  */
#line 3183 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1098:

/* Line 1464 of yacc.c  */
#line 3184 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1099:

/* Line 1464 of yacc.c  */
#line 3185 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 1100:

/* Line 1464 of yacc.c  */
#line 3189 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 1101:

/* Line 1464 of yacc.c  */
#line 3190 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 1102:

/* Line 1464 of yacc.c  */
#line 3194 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 1103:

/* Line 1464 of yacc.c  */
#line 3195 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1104:

/* Line 1464 of yacc.c  */
#line 3196 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1105:

/* Line 1464 of yacc.c  */
#line 3200 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 1106:

/* Line 1464 of yacc.c  */
#line 3201 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1107:

/* Line 1464 of yacc.c  */
#line 3202 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1108:

/* Line 1464 of yacc.c  */
#line 3203 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1109:

/* Line 1464 of yacc.c  */
#line 3204 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1110:

/* Line 1464 of yacc.c  */
#line 3205 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1111:

/* Line 1464 of yacc.c  */
#line 3206 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1112:

/* Line 1464 of yacc.c  */
#line 3210 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 1113:

/* Line 1464 of yacc.c  */
#line 3211 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 1114:

/* Line 1464 of yacc.c  */
#line 3212 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1115:

/* Line 1464 of yacc.c  */
#line 3213 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1116:

/* Line 1464 of yacc.c  */
#line 3217 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 1117:

/* Line 1464 of yacc.c  */
#line 3218 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 1118:

/* Line 1464 of yacc.c  */
#line 3219 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1119:

/* Line 1464 of yacc.c  */
#line 3220 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1120:

/* Line 1464 of yacc.c  */
#line 3224 "grammar.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 1121:

/* Line 1464 of yacc.c  */
#line 3228 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (2)].stmt); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1122:

/* Line 1464 of yacc.c  */
#line 3233 "grammar.y"
    { (yyval.stmt) = (yyvsp[(2) - (2)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (2)].context); PopContext((yyvsp[(1) - (2)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1123:

/* Line 1464 of yacc.c  */
#line 3235 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, null); (yyval.stmt).compound.context = (yyvsp[(1) - (1)].context); PopContext((yyvsp[(1) - (1)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1124:

/* Line 1464 of yacc.c  */
#line 3238 "grammar.y"
    { (yyval.stmt) = (yyvsp[(2) - (2)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (2)].context); PopContext((yyvsp[(1) - (2)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1125:

/* Line 1464 of yacc.c  */
#line 3243 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1126:

/* Line 1464 of yacc.c  */
#line 3244 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1127:

/* Line 1464 of yacc.c  */
#line 3245 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1128:

/* Line 1464 of yacc.c  */
#line 3249 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1129:

/* Line 1464 of yacc.c  */
#line 3250 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1130:

/* Line 1464 of yacc.c  */
#line 3251 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1131:

/* Line 1464 of yacc.c  */
#line 3252 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1132:

/* Line 1464 of yacc.c  */
#line 3253 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1133:

/* Line 1464 of yacc.c  */
#line 3254 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1134:

/* Line 1464 of yacc.c  */
#line 3258 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (3)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1136:

/* Line 1464 of yacc.c  */
#line 3263 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1137:

/* Line 1464 of yacc.c  */
#line 3264 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (4)].list), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1138:

/* Line 1464 of yacc.c  */
#line 3265 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1139:

/* Line 1464 of yacc.c  */
#line 3267 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1140:

/* Line 1464 of yacc.c  */
#line 3268 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (6)].stmt), (yyvsp[(5) - (6)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1141:

/* Line 1464 of yacc.c  */
#line 3270 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1142:

/* Line 1464 of yacc.c  */
#line 3271 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1143:

/* Line 1464 of yacc.c  */
#line 3272 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1144:

/* Line 1464 of yacc.c  */
#line 3273 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), (yyvsp[(5) - (6)].list), (yyvsp[(6) - (6)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1145:

/* Line 1464 of yacc.c  */
#line 3274 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1146:

/* Line 1464 of yacc.c  */
#line 3276 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[(3) - (7)].id), (yyvsp[(5) - (7)].list), null, (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1147:

/* Line 1464 of yacc.c  */
#line 3277 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[(3) - (9)].id), (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list), (yyvsp[(9) - (9)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1148:

/* Line 1464 of yacc.c  */
#line 3281 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1149:

/* Line 1464 of yacc.c  */
#line 3282 "grammar.y"
    { (yyval.stmt) = MkForStmt(MkExpressionStmt((yyvsp[(3) - (4)].list)), null, null, null); (yyval.stmt).forStmt.init.loc = (yylsp[(3) - (4)]); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1150:

/* Line 1464 of yacc.c  */
#line 3283 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (4)].stmt), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1151:

/* Line 1464 of yacc.c  */
#line 3284 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), MkExpressionStmt((yyvsp[(4) - (5)].list)), null, null); (yyval.stmt).loc = (yyloc); (yyval.stmt).forStmt.check.loc = (yylsp[(4) - (5)]); ;}
    break;

  case 1152:

/* Line 1464 of yacc.c  */
#line 3288 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), (yyvsp[(4) - (5)].stmt), (yyvsp[(5) - (5)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1153:

/* Line 1464 of yacc.c  */
#line 3289 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1154:

/* Line 1464 of yacc.c  */
#line 3290 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1155:

/* Line 1464 of yacc.c  */
#line 3291 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), (yyvsp[(5) - (6)].list), (yyvsp[(6) - (6)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1156:

/* Line 1464 of yacc.c  */
#line 3293 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (6)].stmt), (yyvsp[(5) - (6)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1157:

/* Line 1464 of yacc.c  */
#line 3294 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (5)].stmt), (yyvsp[(5) - (5)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1158:

/* Line 1464 of yacc.c  */
#line 3295 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (5)].stmt), (yyvsp[(5) - (5)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1159:

/* Line 1464 of yacc.c  */
#line 3296 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (4)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1160:

/* Line 1464 of yacc.c  */
#line 3297 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (3)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1161:

/* Line 1464 of yacc.c  */
#line 3298 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (2)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1162:

/* Line 1464 of yacc.c  */
#line 3299 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1163:

/* Line 1464 of yacc.c  */
#line 3302 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1164:

/* Line 1464 of yacc.c  */
#line 3306 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1165:

/* Line 1464 of yacc.c  */
#line 3307 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (3)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1166:

/* Line 1464 of yacc.c  */
#line 3311 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1167:

/* Line 1464 of yacc.c  */
#line 3312 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (4)].list), (yyvsp[(4) - (4)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1168:

/* Line 1464 of yacc.c  */
#line 3316 "grammar.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1169:

/* Line 1464 of yacc.c  */
#line 3317 "grammar.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1170:

/* Line 1464 of yacc.c  */
#line 3318 "grammar.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1171:

/* Line 1464 of yacc.c  */
#line 3319 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 1172:

/* Line 1464 of yacc.c  */
#line 3320 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1173:

/* Line 1464 of yacc.c  */
#line 3321 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1174:

/* Line 1464 of yacc.c  */
#line 3322 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (3)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1175:

/* Line 1464 of yacc.c  */
#line 3323 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (3)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1176:

/* Line 1464 of yacc.c  */
#line 3327 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1177:

/* Line 1464 of yacc.c  */
#line 3328 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (2)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1178:

/* Line 1464 of yacc.c  */
#line 3329 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc.start = exp.loc.end = (yylsp[(1) - (1)]).end; ;}
    break;

  case 1179:

/* Line 1464 of yacc.c  */
#line 3330 "grammar.y"
    { (yyval.stmt) = MkGotoStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1180:

/* Line 1464 of yacc.c  */
#line 3336 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (4)].list), (yyvsp[(2) - (4)].declarator), (yyvsp[(3) - (4)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(4) - (4)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1181:

/* Line 1464 of yacc.c  */
#line 3338 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1182:

/* Line 1464 of yacc.c  */
#line 3340 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1183:

/* Line 1464 of yacc.c  */
#line 3341 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (2)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(2) - (2)].stmt)); (yyval.function).loc = (yyloc);;}
    break;

  case 1184:

/* Line 1464 of yacc.c  */
#line 3344 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (4)].list), (yyvsp[(2) - (4)].declarator), (yyvsp[(3) - (4)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(4) - (4)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(4) - (4)].stmt).loc.end; ;}
    break;

  case 1185:

/* Line 1464 of yacc.c  */
#line 3345 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(3) - (3)].stmt).loc.end; ;}
    break;

  case 1186:

/* Line 1464 of yacc.c  */
#line 3346 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(3) - (3)].stmt).loc.end; ;}
    break;

  case 1187:

/* Line 1464 of yacc.c  */
#line 3347 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (2)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(2) - (2)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 1188:

/* Line 1464 of yacc.c  */
#line 3351 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 1189:

/* Line 1464 of yacc.c  */
#line 3353 "grammar.y"
    { 
      int len1 = strlen((yyvsp[(1) - (2)].string));
      int len2 = strlen(yytext);
      (yyval.string) = new byte[len1-1 + len2-1 + 1];
      memcpy((yyval.string), (yyvsp[(1) - (2)].string), len1-1);
      memcpy((yyval.string) + len1-1, yytext+1, len2);
      delete (yyvsp[(1) - (2)].string);
   ;}
    break;

  case 1190:

/* Line 1464 of yacc.c  */
#line 3364 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(1) - (1)].function)); (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1191:

/* Line 1464 of yacc.c  */
#line 3366 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(1) - (1)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1192:

/* Line 1464 of yacc.c  */
#line 3369 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; FreeList((yyvsp[(1) - (2)].list), FreeSpecifier); ;}
    break;

  case 1193:

/* Line 1464 of yacc.c  */
#line 3372 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(1) - (1)].declaration));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1194:

/* Line 1464 of yacc.c  */
#line 3373 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(2) - (2)].string), normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1195:

/* Line 1464 of yacc.c  */
#line 3374 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1196:

/* Line 1464 of yacc.c  */
#line 3376 "grammar.y"
    {
      bool isRemote = !strcmp((yyvsp[(2) - (3)].id).string, "remote");
      (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), isRemote ? remoteImport : normalImport, (declMode != defaultAccess) ? declMode : privateAccess); 
      (yyval.external).loc = (yyloc);
      FreeIdentifier((yyvsp[(2) - (3)].id));
      if(!isRemote)
         yyerror(); 
   ;}
    break;

  case 1197:

/* Line 1464 of yacc.c  */
#line 3385 "grammar.y"
    { (yyval.external) = null; ;}
    break;

  case 1198:

/* Line 1464 of yacc.c  */
#line 3387 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(2) - (2)].function)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].function).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1199:

/* Line 1464 of yacc.c  */
#line 3389 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)]._class).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? (yyvsp[(1) - (2)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1200:

/* Line 1464 of yacc.c  */
#line 3390 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(2) - (2)].declaration)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].declaration).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1201:

/* Line 1464 of yacc.c  */
#line 3391 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), normalImport, ((yyvsp[(1) - (3)].declMode) != defaultAccess) ? (yyvsp[(1) - (3)].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1202:

/* Line 1464 of yacc.c  */
#line 3392 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(4) - (4)].string), staticImport, ((yyvsp[(1) - (4)].declMode) != defaultAccess) ? (yyvsp[(1) - (4)].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1203:

/* Line 1464 of yacc.c  */
#line 3394 "grammar.y"
    {
      bool isRemote = !strcmp((yyvsp[(3) - (4)].id).string, "remote");
      (yyval.external) = MkExternalImport((yyvsp[(4) - (4)].string), isRemote ? remoteImport : normalImport, ((yyvsp[(1) - (4)].declMode) != defaultAccess) ? (yyvsp[(1) - (4)].declMode) : privateAccess);
      (yyval.external).loc = (yyloc);
      FreeIdentifier((yyvsp[(3) - (4)].id));
      declMode = defaultDeclMode;
      if(!isRemote)
         yyerror();  
   ;}
    break;

  case 1204:

/* Line 1464 of yacc.c  */
#line 3403 "grammar.y"
    { defaultDeclMode = (yyvsp[(1) - (2)].declMode); (yyval.external) = null; ;}
    break;

  case 1205:

/* Line 1464 of yacc.c  */
#line 3404 "grammar.y"
    { defaultDeclMode = staticAccess; (yyval.external) = null; ;}
    break;

  case 1206:

/* Line 1464 of yacc.c  */
#line 3405 "grammar.y"
    { (yyval.external) = MkExternalNameSpace((yyvsp[(2) - (2)].id)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1207:

/* Line 1464 of yacc.c  */
#line 3406 "grammar.y"
    { (yyval.external) = MkExternalNameSpace(MkIdentifier((yyvsp[(2) - (2)].specifier).name)); FreeSpecifier((yyvsp[(2) - (2)].specifier)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1208:

/* Line 1464 of yacc.c  */
#line 3407 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[(1) - (1)].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[(1) - (1)].dbtableDef).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1209:

/* Line 1464 of yacc.c  */
#line 3408 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[(2) - (2)].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[(2) - (2)].dbtableDef).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1210:

/* Line 1464 of yacc.c  */
#line 3412 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(1) - (1)]._class));  (yyval.external).loc = (yyvsp[(1) - (1)]._class).loc; (yyvsp[(1) - (1)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1211:

/* Line 1464 of yacc.c  */
#line 3414 "grammar.y"
    {
      FreeList((yyvsp[(1) - (2)].list), FreeSpecifier);
      (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));
      (yyval.external).loc = (yyvsp[(2) - (2)]._class).loc;
      (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess;
      declMode = defaultDeclMode;
   ;}
    break;

  case 1212:

/* Line 1464 of yacc.c  */
#line 3421 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(1) - (1)].function)); (yyval.external).loc = (yyvsp[(1) - (1)].function).loc;  (yyvsp[(1) - (1)].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1213:

/* Line 1464 of yacc.c  */
#line 3423 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyvsp[(2) - (2)]._class).loc; (yyvsp[(2) - (2)]._class).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? (yyvsp[(1) - (2)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1214:

/* Line 1464 of yacc.c  */
#line 3424 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(2) - (2)].function)); (yyval.external).loc = (yyvsp[(2) - (2)].function).loc; (yyvsp[(2) - (2)].function).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1215:

/* Line 1464 of yacc.c  */
#line 3427 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(1) - (1)].declaration));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1216:

/* Line 1464 of yacc.c  */
#line 3428 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(2) - (2)].declaration)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].declaration).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1217:

/* Line 1464 of yacc.c  */
#line 3432 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].external)); ast = (yyval.list); ;}
    break;

  case 1218:

/* Line 1464 of yacc.c  */
#line 3433 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1219:

/* Line 1464 of yacc.c  */
#line 3434 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1222:

/* Line 1464 of yacc.c  */
#line 3440 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].external)); ast = (yyval.list); ;}
    break;

  case 1223:

/* Line 1464 of yacc.c  */
#line 3441 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1224:

/* Line 1464 of yacc.c  */
#line 3443 "grammar.y"
    { External _class = MkExternalClass((yyvsp[(2) - (2)]._class)); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), _class); _class.loc = (yylsp[(2) - (2)]);  (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1225:

/* Line 1464 of yacc.c  */
#line 3445 "grammar.y"
    { External _class = MkExternalClass((yyvsp[(3) - (3)]._class)); (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), _class); _class.loc = (yylsp[(3) - (3)]);  (yyvsp[(3) - (3)]._class).declMode = ((yyvsp[(2) - (3)].declMode) != defaultAccess) ? (yyvsp[(2) - (3)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1228:

/* Line 1464 of yacc.c  */
#line 3451 "grammar.y"
    { ast = MkList(); ;}
    break;

  case 1229:

/* Line 1464 of yacc.c  */
#line 3455 "grammar.y"
    { Symbol symbol = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); FreeIdentifier((yyvsp[(3) - (6)].id)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (6)].string), symbol, (yyvsp[(5) - (6)].list)); ;}
    break;

  case 1230:

/* Line 1464 of yacc.c  */
#line 3456 "grammar.y"
    { Symbol symbol = DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (6)].string), symbol, (yyvsp[(5) - (6)].list)); ;}
    break;

  case 1231:

/* Line 1464 of yacc.c  */
#line 3457 "grammar.y"
    { (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (5)].string), null, (yyvsp[(4) - (5)].list)); ;}
    break;

  case 1232:

/* Line 1464 of yacc.c  */
#line 3461 "grammar.y"
    { (yyval.dbtableEntry) = MkDBFieldEntry(MkTypeName((yyvsp[(1) - (4)].list), null), (yyvsp[(2) - (4)].id), (yyvsp[(3) - (4)].string)); ;}
    break;

  case 1233:

/* Line 1464 of yacc.c  */
#line 3465 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(1) - (1)].id), ascending); ;}
    break;

  case 1234:

/* Line 1464 of yacc.c  */
#line 3466 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(2) - (2)].id), descending); ;}
    break;

  case 1235:

/* Line 1464 of yacc.c  */
#line 3467 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(2) - (2)].id), ascending); ;}
    break;

  case 1236:

/* Line 1464 of yacc.c  */
#line 3471 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbindexItem)); ;}
    break;

  case 1237:

/* Line 1464 of yacc.c  */
#line 3472 "grammar.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].dbindexItem)); ;}
    break;

  case 1238:

/* Line 1464 of yacc.c  */
#line 3476 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[(2) - (3)].list), null); ;}
    break;

  case 1239:

/* Line 1464 of yacc.c  */
#line 3477 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].id)); ;}
    break;

  case 1240:

/* Line 1464 of yacc.c  */
#line 3481 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbtableEntry)); ;}
    break;

  case 1241:

/* Line 1464 of yacc.c  */
#line 3482 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbtableEntry)); ;}
    break;

  case 1242:

/* Line 1464 of yacc.c  */
#line 3483 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].dbtableEntry)); ;}
    break;

  case 1243:

/* Line 1464 of yacc.c  */
#line 3484 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].dbtableEntry)); ;}
    break;

  case 1244:

/* Line 1464 of yacc.c  */
#line 3488 "grammar.y"
    { (yyval.exp) = MkExpDBOpen((yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].exp)); ;}
    break;

  case 1245:

/* Line 1464 of yacc.c  */
#line 3492 "grammar.y"
    { (yyval.exp) = MkExpDBField((yyvsp[(3) - (6)].string), (yyvsp[(5) - (6)].id)); ;}
    break;

  case 1246:

/* Line 1464 of yacc.c  */
#line 3496 "grammar.y"
    { (yyval.exp) = MkExpDBIndex((yyvsp[(3) - (6)].string), (yyvsp[(5) - (6)].id)); ;}
    break;

  case 1247:

/* Line 1464 of yacc.c  */
#line 3500 "grammar.y"
    { (yyval.exp) = MkExpDBTable((yyvsp[(3) - (4)].string)); ;}
    break;



/* Line 1464 of yacc.c  */
#line 20632 "grammar.ec"
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
#line 3503 "grammar.y"


