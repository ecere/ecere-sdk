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
#define YYLAST   35720

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  247
/* YYNRULES -- Number of rules.  */
#define YYNRULES  1246
/* YYNRULES -- Number of states.  */
#define YYNSTATES  2032

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
     918,   922,   924,   926,   930,   932,   934,   939,   944,   950,
     959,   961,   963,   966,   971,   974,   981,   988,   994,  1000,
    1007,  1014,  1020,  1026,  1034,  1042,  1049,  1056,  1064,  1072,
    1079,  1086,  1091,  1097,  1102,  1109,  1114,  1116,  1118,  1120,
    1122,  1126,  1128,  1131,  1134,  1137,  1139,  1144,  1149,  1153,
    1158,  1163,  1167,  1171,  1174,  1177,  1182,  1187,  1191,  1196,
    1200,  1204,  1207,  1210,  1212,  1217,  1222,  1226,  1231,  1236,
    1240,  1244,  1247,  1250,  1255,  1260,  1264,  1269,  1273,  1277,
    1280,  1283,  1285,  1287,  1291,  1295,  1297,  1299,  1303,  1307,
    1310,  1313,  1316,  1319,  1322,  1327,  1330,  1335,  1341,  1347,
    1349,  1351,  1353,  1355,  1357,  1359,  1361,  1363,  1365,  1367,
    1369,  1371,  1373,  1378,  1380,  1384,  1388,  1392,  1396,  1400,
    1404,  1406,  1410,  1414,  1418,  1422,  1424,  1428,  1432,  1436,
    1440,  1443,  1445,  1448,  1452,  1456,  1460,  1464,  1468,  1472,
    1476,  1478,  1482,  1486,  1490,  1494,  1498,  1502,  1506,  1510,
    1512,  1516,  1520,  1524,  1528,  1530,  1534,  1538,  1542,  1546,
    1548,  1552,  1556,  1560,  1564,  1566,  1570,  1574,  1576,  1580,
    1584,  1586,  1592,  1598,  1604,  1610,  1616,  1622,  1628,  1634,
    1640,  1646,  1652,  1658,  1664,  1670,  1676,  1682,  1684,  1688,
    1692,  1696,  1700,  1704,  1708,  1712,  1716,  1718,  1720,  1722,
    1724,  1726,  1728,  1730,  1732,  1734,  1736,  1738,  1740,  1744,
    1748,  1751,  1753,  1757,  1761,  1763,  1765,  1768,  1771,  1775,
    1779,  1783,  1787,  1791,  1795,  1799,  1801,  1804,  1807,  1811,
    1815,  1819,  1823,  1827,  1831,  1835,  1838,  1841,  1844,  1847,
    1851,  1854,  1860,  1867,  1874,  1876,  1878,  1880,  1882,  1884,
    1889,  1891,  1895,  1899,  1903,  1907,  1911,  1915,  1917,  1921,
    1925,  1929,  1933,  1935,  1939,  1943,  1947,  1951,  1953,  1956,
    1960,  1964,  1968,  1972,  1976,  1980,  1984,  1986,  1990,  1994,
    1998,  2002,  2006,  2010,  2014,  2018,  2020,  2024,  2028,  2032,
    2036,  2038,  2042,  2046,  2050,  2054,  2056,  2060,  2064,  2068,
    2072,  2074,  2078,  2082,  2084,  2088,  2092,  2094,  2100,  2106,
    2112,  2118,  2123,  2128,  2133,  2138,  2144,  2150,  2156,  2162,
    2167,  2172,  2177,  2182,  2188,  2194,  2200,  2206,  2212,  2218,
    2224,  2230,  2234,  2238,  2241,  2244,  2246,  2250,  2254,  2258,
    2262,  2264,  2267,  2271,  2275,  2278,  2281,  2284,  2286,  2289,
    2293,  2297,  2299,  2301,  2303,  2305,  2307,  2309,  2311,  2313,
    2315,  2317,  2319,  2321,  2323,  2327,  2331,  2333,  2337,  2340,
    2342,  2345,  2348,  2351,  2356,  2361,  2365,  2369,  2374,  2380,
    2385,  2392,  2399,  2404,  2410,  2415,  2422,  2429,  2432,  2435,
    2438,  2444,  2448,  2454,  2461,  2467,  2475,  2483,  2492,  2501,
    2509,  2517,  2521,  2525,  2529,  2534,  2538,  2544,  2550,  2552,
    2554,  2556,  2558,  2560,  2562,  2564,  2566,  2568,  2570,  2573,
    2575,  2577,  2579,  2581,  2583,  2585,  2587,  2589,  2591,  2593,
    2595,  2597,  2599,  2601,  2603,  2605,  2610,  2615,  2620,  2622,
    2624,  2626,  2628,  2630,  2632,  2634,  2636,  2638,  2640,  2642,
    2644,  2646,  2648,  2650,  2652,  2654,  2656,  2658,  2663,  2668,
    2673,  2675,  2677,  2680,  2683,  2687,  2693,  2696,  2700,  2706,
    2712,  2718,  2720,  2724,  2727,  2730,  2733,  2737,  2741,  2745,
    2749,  2753,  2757,  2761,  2765,  2767,  2769,  2774,  2778,  2781,
    2785,  2789,  2793,  2797,  2801,  2805,  2809,  2813,  2817,  2821,
    2825,  2829,  2831,  2833,  2835,  2838,  2840,  2843,  2845,  2848,
    2850,  2853,  2855,  2858,  2860,  2863,  2865,  2868,  2870,  2873,
    2875,  2878,  2880,  2883,  2885,  2888,  2890,  2893,  2895,  2898,
    2900,  2903,  2905,  2908,  2910,  2913,  2915,  2918,  2920,  2923,
    2925,  2928,  2930,  2933,  2935,  2938,  2940,  2943,  2945,  2948,
    2950,  2953,  2955,  2958,  2960,  2963,  2965,  2967,  2969,  2972,
    2974,  2977,  2979,  2982,  2984,  2987,  2992,  2998,  3000,  3002,
    3004,  3007,  3009,  3012,  3014,  3017,  3019,  3022,  3027,  3033,
    3035,  3038,  3040,  3043,  3045,  3048,  3050,  3053,  3055,  3058,
    3060,  3063,  3068,  3074,  3076,  3079,  3081,  3084,  3086,  3089,
    3091,  3094,  3096,  3099,  3101,  3104,  3109,  3115,  3119,  3123,
    3125,  3129,  3133,  3137,  3141,  3143,  3147,  3152,  3157,  3162,
    3166,  3169,  3173,  3177,  3181,  3185,  3188,  3191,  3194,  3198,
    3203,  3205,  3207,  3210,  3213,  3215,  3217,  3222,  3224,  3228,
    3231,  3235,  3239,  3243,  3247,  3252,  3257,  3262,  3265,  3269,
    3273,  3277,  3282,  3287,  3291,  3294,  3298,  3302,  3306,  3311,
    3316,  3318,  3321,  3324,  3328,  3330,  3332,  3335,  3338,  3341,
    3345,  3347,  3349,  3352,  3355,  3358,  3362,  3364,  3367,  3371,
    3374,  3376,  3379,  3382,  3386,  3390,  3392,  3395,  3398,  3402,
    3406,  3408,  3411,  3414,  3418,  3422,  3424,  3428,  3433,  3435,
    3440,  3443,  3449,  3453,  3455,  3457,  3459,  3461,  3463,  3465,
    3469,  3473,  3476,  3479,  3481,  3485,  3488,  3492,  3494,  3498,
    3502,  3504,  3507,  3511,  3515,  3517,  3520,  3522,  3525,  3528,
    3531,  3534,  3538,  3540,  3542,  3546,  3550,  3552,  3556,  3561,
    3565,  3570,  3574,  3578,  3583,  3587,  3592,  3594,  3598,  3602,
    3607,  3611,  3615,  3619,  3624,  3626,  3630,  3634,  3638,  3642,
    3646,  3648,  3652,  3655,  3657,  3659,  3661,  3663,  3665,  3668,
    3670,  3672,  3674,  3676,  3679,  3682,  3685,  3687,  3689,  3691,
    3693,  3695,  3698,  3700,  3702,  3707,  3709,  3713,  3714,  3721,
    3730,  3741,  3754,  3763,  3774,  3785,  3791,  3799,  3809,  3821,
    3829,  3839,  3849,  3853,  3858,  3863,  3867,  3871,  3875,  3880,
    3885,  3889,  3892,  3896,  3899,  3901,  3903,  3905,  3907,  3909,
    3912,  3916,  3919,  3922,  3925,  3929,  3933,  3936,  3942,  3949,
    3952,  3955,  3958,  3961,  3964,  3967,  3969,  3972,  3975,  3979,
    3981,  3984,  3986,  3989,  3992,  3994,  3997,  4000,  4003,  4006,
    4009,  4012,  4014,  4016,  4019,  4022,  4024,  4026,  4029,  4032,
    4034,  4037,  4040,  4042,  4045,  4047,  4050,  4053,  4059,  4065,
    4073,  4081,  4087,  4093,  4097,  4100,  4106,  4111,  4116,  4124,
    4131,  4138,  4144,  4152,  4159,  4164,  4172,  4182,  4186,  4191,
    4196,  4202,  4208,  4215,  4223,  4230,  4237,  4243,  4249,  4254,
    4258,  4261,  4263,  4266,  4271,  4275,  4281,  4286,  4290,  4293,
    4296,  4299,  4303,  4307,  4311,  4315,  4318,  4321,  4323,  4325,
    4330,  4334,  4338,  4341,  4346,  4350,  4354,  4357,  4359,  4362,
    4364,  4366,  4369,  4371,  4374,  4378,  4382,  4384,  4387,  4390,
    4393,  4397,  4402,  4407,  4410,  4413,  4416,  4419,  4421,  4424,
    4426,  4429,  4431,  4434,  4437,  4439,  4442,  4444,  4447,  4450,
    4453,  4456,  4458,  4461,  4464,  4468,  4470,  4472,  4473,  4480,
    4487,  4493,  4498,  4500,  4503,  4506,  4508,  4512,  4516,  4521,
    4523,  4525,  4528,  4531,  4538,  4545,  4552
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     370,     0,    -1,   206,   109,    -1,   206,   110,    -1,   139,
      -1,   206,   206,    -1,    28,    -1,    28,    -1,   137,    -1,
     137,   110,   200,   111,    -1,   137,   110,   200,    11,    -1,
     291,   314,    -1,   314,    -1,   291,   112,   113,    -1,   114,
     291,   112,   113,    -1,    78,   291,   314,    -1,    78,   314,
      -1,   291,   315,    -1,   315,    -1,    78,   291,   315,    -1,
      78,   315,    -1,   140,   354,    -1,   143,   354,    -1,   143,
     115,    -1,   141,   354,    -1,   142,   354,    -1,   140,   115,
      -1,   140,   355,    -1,   144,    -1,   143,   355,    -1,   145,
      -1,   145,   115,    -1,   290,   314,    -1,   290,   316,    -1,
     290,   315,    -1,   148,   354,    -1,   148,   355,    -1,   149,
      -1,   148,    -1,   212,   116,   319,    -1,   319,    -1,   212,
     116,   320,    -1,   212,   116,     1,    -1,   320,    -1,   152,
      -1,   154,   117,   152,    -1,   155,   117,   152,    -1,   153,
      -1,   154,   117,   153,    -1,   155,   117,   153,    -1,   154,
     117,     1,    -1,   155,   117,     1,    -1,   117,    -1,   154,
     115,    -1,   155,   115,    -1,   156,    -1,   150,    -1,   159,
     156,    -1,   159,   150,    -1,   157,   156,    -1,   157,   150,
      -1,   115,    -1,   159,   115,    -1,   157,   115,    -1,   157,
      -1,   154,    -1,   157,   154,    -1,   159,   154,    -1,   151,
      -1,   158,   151,    -1,   159,   151,    -1,   157,   151,    -1,
     157,   155,    -1,   155,    -1,   154,     1,    -1,   161,   118,
      -1,   161,     1,   118,    -1,   290,   206,   119,   159,    -1,
     290,   206,   119,   158,     1,    -1,   290,   206,   119,   158,
      -1,   290,   206,   119,    -1,   290,   206,   119,     1,    -1,
     163,   118,    -1,   163,     1,   118,    -1,   291,   206,   119,
     159,    -1,   291,   206,   119,   158,     1,    -1,   291,   206,
     119,   158,    -1,   291,   206,   119,    -1,   291,   206,   119,
       1,    -1,   292,   206,   119,   158,   118,    -1,   292,   206,
     119,   159,   118,    -1,   292,   206,   119,   118,    -1,   166,
     118,    -1,   166,     1,   118,    -1,   139,   119,   158,    -1,
     206,   119,   158,    -1,   139,   119,   159,    -1,   139,   119,
      -1,   139,   119,   158,     1,    -1,   139,   119,     1,    -1,
     206,   119,   159,    -1,   206,   119,    -1,   206,   119,   158,
       1,    -1,   206,   119,     1,    -1,   168,   118,    -1,   168,
       1,   118,    -1,   119,   159,    -1,   119,   158,     1,    -1,
     119,     1,    -1,   119,    -1,   119,   158,    -1,   212,   116,
     319,    -1,   212,   116,   320,    -1,   212,   116,     1,    -1,
     212,     1,    -1,   169,    -1,   171,   117,   169,    -1,   172,
     117,   169,    -1,   170,    -1,   171,   117,   170,    -1,   172,
     117,   170,    -1,   171,     1,    -1,    68,   296,   206,   119,
      -1,    68,   296,   311,   206,   119,    -1,    68,   296,   119,
      -1,    68,   296,   311,   119,    -1,    68,     1,   119,    -1,
     173,    -1,   174,    69,   354,    -1,   174,    70,   354,    -1,
     174,    95,   354,    -1,   174,    91,    -1,   174,    97,   365,
      -1,   174,   118,    -1,    99,   296,   206,   119,    -1,    99,
     296,   311,   206,   119,    -1,    99,   296,   119,    -1,    99,
     296,   311,   119,    -1,    99,     1,   119,    -1,   176,    -1,
     177,    69,   354,    -1,   177,    70,   354,    -1,   177,   118,
      -1,   206,    -1,   179,   206,    -1,   179,   354,    -1,    73,
     354,    -1,   180,    -1,   181,   180,    -1,    88,   112,   179,
     113,   354,    -1,    88,   112,   233,   113,   119,   181,   118,
      -1,   233,   120,    88,   112,   233,   113,   119,   181,   118,
      -1,    89,   112,   233,   117,   179,   113,    -1,   233,   120,
      89,   112,   233,   117,   179,   113,    -1,    89,   112,   233,
     113,    -1,   233,   120,    89,   112,   233,   113,    -1,    90,
      -1,    90,   179,    -1,   212,   120,    90,    -1,   233,   120,
      90,   179,    -1,   291,   278,   115,    -1,   291,   115,    -1,
     165,   115,    -1,   162,   115,    -1,   146,    -1,   175,    -1,
     342,   291,   278,   115,    -1,   342,   291,   115,    -1,   342,
     165,   115,    -1,   342,   162,   115,    -1,   342,   146,    -1,
     342,   175,    -1,   171,   115,    -1,    98,   291,   278,   115,
      -1,   178,    -1,   182,   115,    -1,    91,    -1,    92,   206,
     115,    -1,    92,   139,   115,    -1,    93,    -1,    94,    -1,
      96,   206,   115,    -1,    99,   112,   206,   113,   116,   319,
     115,    -1,   115,    -1,   342,   121,    -1,   342,   112,   206,
     113,    -1,   147,    -1,   163,     1,    -1,   166,     1,    -1,
     162,    -1,   165,    -1,   342,   147,    -1,   342,   163,     1,
      -1,   342,   166,     1,    -1,   342,   162,    -1,   342,   165,
      -1,   172,    -1,   186,    -1,   188,   186,    -1,   189,   186,
      -1,   187,    -1,   188,     1,    -1,   189,     1,    -1,   188,
     187,    -1,   189,   187,    -1,   290,    -1,   290,   311,    -1,
     206,    -1,   190,    -1,    65,   206,    -1,    65,   206,   116,
     191,    -1,    65,   206,   121,   190,    -1,    65,   206,   121,
     190,   116,   191,    -1,    65,   138,    -1,    65,   138,   116,
     191,    -1,    65,   138,   121,   190,    -1,    65,   138,   121,
     190,   116,   191,    -1,   206,    -1,   206,    -1,   206,   116,
     193,    -1,   257,    -1,   190,   206,    -1,   190,   206,   116,
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
     201,   136,   115,    -1,   202,   121,   295,    -1,   202,   119,
     189,    -1,   204,   119,   189,    -1,   202,   119,   188,    -1,
     204,   119,   188,    -1,   202,   119,     1,    -1,   204,   119,
       1,    -1,     3,    -1,   208,    -1,   112,   235,   113,    -1,
     206,    -1,   165,    -1,    85,   112,   354,   113,    -1,    85,
     112,   235,   113,    -1,    85,   112,   326,   113,   317,    -1,
      85,   112,   326,   113,   112,   326,   113,   317,    -1,     4,
      -1,   365,    -1,   122,   365,    -1,   122,   365,   120,   365,
      -1,   112,   113,    -1,    71,   298,   312,   123,   257,   124,
      -1,    71,   298,   312,   123,   258,   124,    -1,    71,   298,
     123,   257,   124,    -1,    71,   298,   123,   258,   124,    -1,
     102,   298,   312,   123,   257,   124,    -1,   102,   298,   312,
     123,   258,   124,    -1,   102,   298,   123,   257,   124,    -1,
     102,   298,   123,   258,   124,    -1,    72,   257,   297,   312,
     123,   257,   124,    -1,    72,   257,   297,   312,   123,   258,
     124,    -1,    72,   257,   297,   123,   257,   124,    -1,    72,
     257,   297,   123,   258,   124,    -1,   103,   257,   297,   312,
     123,   257,   124,    -1,   103,   257,   297,   312,   123,   258,
     124,    -1,   103,   257,   297,   123,   257,   124,    -1,   103,
     257,   297,   123,   258,   124,    -1,    65,   112,   290,   113,
      -1,    65,   112,   290,   311,   113,    -1,    65,   112,   206,
     113,    -1,   104,   112,   233,   117,   326,   113,    -1,    98,
     112,   206,   113,    -1,   377,    -1,   378,    -1,   379,    -1,
     380,    -1,   123,   214,   124,    -1,   167,    -1,   168,     1,
      -1,   112,   235,    -1,   112,   255,    -1,   207,    -1,   212,
     123,   235,   124,    -1,   212,   123,   255,   124,    -1,   212,
     112,   113,    -1,   212,   112,   214,   113,    -1,   212,   112,
     215,   113,    -1,   212,   120,   206,    -1,   212,     7,   206,
      -1,   212,     8,    -1,   212,     9,    -1,   237,   123,   235,
     124,    -1,   237,   123,   255,   124,    -1,   237,   112,   113,
      -1,   237,   112,   214,   113,    -1,   237,   120,   206,    -1,
     237,     7,   206,    -1,   237,     8,    -1,   237,     9,    -1,
     208,    -1,   213,   123,   235,   124,    -1,   213,   123,   255,
     124,    -1,   213,   112,   113,    -1,   213,   112,   214,   113,
      -1,   213,   112,   215,   113,    -1,   213,   120,   206,    -1,
     213,     7,   206,    -1,   213,     8,    -1,   213,     9,    -1,
     238,   123,   235,   124,    -1,   238,   123,   255,   124,    -1,
     238,   112,   113,    -1,   238,   112,   214,   113,    -1,   238,
     120,   206,    -1,   238,     7,   206,    -1,   238,     8,    -1,
     238,     9,    -1,   233,    -1,   209,    -1,   214,   117,   233,
      -1,   214,   117,   209,    -1,   254,    -1,   210,    -1,   214,
     117,   254,    -1,   214,   117,   210,    -1,   214,   117,    -1,
       8,   217,    -1,     9,   217,    -1,   219,   220,    -1,   219,
     209,    -1,     6,   112,   217,   113,    -1,     6,   218,    -1,
       6,   112,   327,   113,    -1,     6,   112,    65,   136,   113,
      -1,     6,   112,    65,   135,   113,    -1,   216,    -1,   212,
      -1,   216,    -1,   213,    -1,   125,    -1,   109,    -1,   126,
      -1,   127,    -1,   114,    -1,   128,    -1,    73,    -1,    84,
      -1,   217,    -1,   112,   326,   113,   220,    -1,   220,    -1,
     221,   109,   220,    -1,   221,   129,   220,    -1,   221,   130,
     220,    -1,   243,   109,   220,    -1,   243,   129,   220,    -1,
     243,   130,   220,    -1,   221,    -1,   222,   126,   221,    -1,
     222,   127,   221,    -1,   244,   126,   221,    -1,   244,   127,
     221,    -1,   222,    -1,   223,    10,   222,    -1,   223,    11,
     222,    -1,   245,    10,   222,    -1,   245,    11,   222,    -1,
     225,   110,    -1,   223,    -1,   224,   223,    -1,   225,   111,
     223,    -1,   225,    12,   223,    -1,   225,    13,   223,    -1,
     246,   110,   223,    -1,   246,   111,   223,    -1,   246,    12,
     223,    -1,   246,    13,   223,    -1,   225,    -1,   226,    14,
     225,    -1,   226,    15,   225,    -1,   247,    14,   225,    -1,
     247,    15,   225,    -1,   226,    14,   209,    -1,   226,    15,
     209,    -1,   247,    14,   209,    -1,   247,    15,   209,    -1,
     226,    -1,   227,   125,   226,    -1,   248,   125,   226,    -1,
     227,   125,   209,    -1,   248,   125,   209,    -1,   227,    -1,
     228,   131,   227,    -1,   249,   131,   227,    -1,   228,   131,
     209,    -1,   249,   131,   209,    -1,   228,    -1,   229,   132,
     228,    -1,   250,   132,   228,    -1,   229,   132,   209,    -1,
     250,   132,   209,    -1,   229,    -1,   230,    16,   229,    -1,
     251,    16,   229,    -1,   230,    -1,   231,    17,   230,    -1,
     252,    17,   230,    -1,   231,    -1,   231,   133,   235,   121,
     232,    -1,   231,   133,   255,   121,   232,    -1,   252,   133,
     235,   121,   232,    -1,   252,   133,   255,   121,   232,    -1,
     231,   133,   236,   121,   232,    -1,   231,   133,   256,   121,
     232,    -1,   252,   133,   236,   121,   232,    -1,   252,   133,
     256,   121,   232,    -1,   231,   133,   235,   121,   209,    -1,
     231,   133,   255,   121,   209,    -1,   252,   133,   235,   121,
     209,    -1,   252,   133,   255,   121,   209,    -1,   231,   133,
     236,   121,   209,    -1,   231,   133,   256,   121,   209,    -1,
     252,   133,   236,   121,   209,    -1,   252,   133,   256,   121,
     209,    -1,   232,    -1,   217,   234,   233,    -1,   240,   234,
     233,    -1,   232,   234,   233,    -1,   253,   234,   233,    -1,
     217,   234,   209,    -1,   240,   234,   209,    -1,   232,   234,
     209,    -1,   253,   234,   209,    -1,   116,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   233,    -1,
     235,   117,   233,    -1,   255,   117,   233,    -1,   255,   113,
      -1,   209,    -1,   235,   117,   209,    -1,   255,   117,   209,
      -1,   211,    -1,     1,    -1,   212,     1,    -1,   166,     1,
      -1,   212,     7,     1,    -1,   237,     7,     1,    -1,   212,
     112,   214,    -1,   212,   112,   215,    -1,   212,   120,     1,
      -1,   237,   112,   215,    -1,   237,   120,     1,    -1,     1,
      -1,   213,     1,    -1,   166,     1,    -1,   213,     7,     1,
      -1,   238,     7,     1,    -1,   213,   112,   214,    -1,   213,
     112,   215,    -1,   213,   120,     1,    -1,   238,   112,   215,
      -1,   238,   120,     1,    -1,     8,   240,    -1,     9,   240,
      -1,   219,   242,    -1,   219,   210,    -1,     6,   112,   240,
      -1,     6,   241,    -1,     6,   112,   327,   113,     1,    -1,
       6,   112,    65,   136,   113,     1,    -1,     6,   112,    65,
     135,   113,     1,    -1,   239,    -1,   237,    -1,   239,    -1,
     238,    -1,   240,    -1,   112,   326,   113,   242,    -1,   242,
      -1,   221,   109,   242,    -1,   221,   129,   242,    -1,   221,
     130,   242,    -1,   243,   109,   242,    -1,   243,   129,   242,
      -1,   243,   130,   242,    -1,   243,    -1,   222,   126,   243,
      -1,   222,   127,   243,    -1,   244,   126,   243,    -1,   244,
     127,   243,    -1,   244,    -1,   223,    10,   244,    -1,   223,
      11,   244,    -1,   245,    10,   244,    -1,   245,    11,   244,
      -1,   245,    -1,   224,   245,    -1,   225,   111,   245,    -1,
     225,    12,   245,    -1,   225,    13,   245,    -1,   246,   110,
     245,    -1,   246,   111,   245,    -1,   246,    12,   245,    -1,
     246,    13,   245,    -1,   246,    -1,   226,    14,   246,    -1,
     226,    15,   246,    -1,   247,    14,   246,    -1,   247,    15,
     246,    -1,   226,    14,   210,    -1,   226,    15,   210,    -1,
     247,    14,   210,    -1,   247,    15,   210,    -1,   247,    -1,
     227,   125,   247,    -1,   248,   125,   247,    -1,   227,   125,
     210,    -1,   248,   125,   210,    -1,   248,    -1,   228,   131,
     248,    -1,   249,   131,   248,    -1,   228,   131,   210,    -1,
     249,   131,   210,    -1,   249,    -1,   229,   132,   249,    -1,
     250,   132,   249,    -1,   229,   132,   210,    -1,   250,   132,
     210,    -1,   250,    -1,   230,    16,   250,    -1,   251,    16,
     250,    -1,   251,    -1,   231,    17,   251,    -1,   252,    17,
     251,    -1,   252,    -1,   231,   133,   235,   121,   252,    -1,
     231,   133,   255,   121,   252,    -1,   252,   133,   235,   121,
     252,    -1,   252,   133,   255,   121,   252,    -1,   231,   133,
     235,   121,    -1,   231,   133,   255,   121,    -1,   252,   133,
     235,   121,    -1,   252,   133,   255,   121,    -1,   231,   133,
     236,   121,   252,    -1,   231,   133,   256,   121,   252,    -1,
     252,   133,   236,   121,   252,    -1,   252,   133,   256,   121,
     252,    -1,   231,   133,   236,   121,    -1,   231,   133,   256,
     121,    -1,   252,   133,   236,   121,    -1,   252,   133,   256,
     121,    -1,   231,   133,   235,   121,   210,    -1,   231,   133,
     255,   121,   210,    -1,   252,   133,   235,   121,   210,    -1,
     252,   133,   255,   121,   210,    -1,   231,   133,   236,   121,
     210,    -1,   231,   133,   256,   121,   210,    -1,   252,   133,
     236,   121,   210,    -1,   252,   133,   256,   121,   210,    -1,
     231,   133,   121,    -1,   252,   133,   121,    -1,   231,   133,
      -1,   252,   133,    -1,   253,    -1,   217,   234,   254,    -1,
     240,   234,   254,    -1,   217,   234,   210,    -1,   240,   234,
     210,    -1,   254,    -1,   233,     1,    -1,   235,   117,   254,
      -1,   255,   117,   254,    -1,   235,   235,    -1,   255,   235,
      -1,   235,   255,    -1,   210,    -1,   209,     1,    -1,   235,
     117,   210,    -1,   255,   117,   210,    -1,   232,    -1,   253,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,   206,    -1,   206,   116,   257,    -1,   206,   116,   258,
      -1,   261,    -1,   262,   117,   261,    -1,   262,   117,    -1,
      50,    -1,   263,   206,    -1,   263,   139,    -1,   266,   118,
      -1,   263,   206,   119,   118,    -1,   263,   139,   119,   118,
      -1,   263,   119,   262,    -1,   263,   119,     1,    -1,   263,
     206,   119,   262,    -1,   263,   206,   119,   262,     1,    -1,
     263,   206,   119,     1,    -1,   263,   206,   119,   262,   115,
     188,    -1,   263,   206,   119,   262,   115,   189,    -1,   263,
     139,   119,   262,    -1,   263,   139,   119,   262,     1,    -1,
     263,   139,   119,     1,    -1,   263,   139,   119,   262,   115,
     188,    -1,   263,   139,   119,   262,   115,   189,    -1,   263,
     206,    -1,   263,   139,    -1,   269,   118,    -1,   267,   121,
     295,   119,   118,    -1,   267,   119,   118,    -1,   267,   121,
     295,   119,   262,    -1,   267,   121,   295,   119,   262,     1,
      -1,   267,   121,   295,   119,     1,    -1,   267,   121,   295,
     119,   262,   115,   188,    -1,   267,   121,   295,   119,   262,
     115,   189,    -1,   267,   121,   295,   119,   262,     1,   115,
     188,    -1,   267,   121,   295,   119,   262,     1,   115,   189,
      -1,   267,   121,   295,   119,     1,   115,   188,    -1,   267,
     121,   295,   119,     1,   115,   189,    -1,   263,   119,   262,
      -1,   263,   119,     1,    -1,   267,   119,   262,    -1,   267,
     119,   262,     1,    -1,   267,   119,     1,    -1,   267,   119,
     262,   115,   188,    -1,   267,   119,   262,   115,   189,    -1,
     268,    -1,   285,    -1,   269,    -1,   286,    -1,    75,    -1,
     306,    -1,    44,    -1,    45,    -1,   272,    -1,   273,    -1,
     274,   273,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   282,
      -1,   264,    -1,   136,    -1,    87,   112,   233,   113,    -1,
     100,   112,   136,   113,    -1,   100,   112,   206,   113,    -1,
      66,    -1,    82,    -1,    83,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
      85,    -1,   282,    -1,   264,    -1,   139,    -1,    87,   112,
     233,   113,    -1,   100,   112,   136,   113,    -1,   100,   112,
     206,   113,    -1,    66,    -1,   316,    -1,   316,   307,    -1,
     121,   257,    -1,   316,   121,   257,    -1,   316,   121,   257,
     121,   257,    -1,   121,   258,    -1,   316,   121,   258,    -1,
     316,   121,   257,   121,   258,    -1,   316,   121,   258,   121,
     258,    -1,   316,   121,   258,   121,   257,    -1,   277,    -1,
     278,   117,   277,    -1,   287,   206,    -1,   287,   137,    -1,
     281,   118,    -1,   279,   119,   118,    -1,   287,   119,   118,
      -1,   279,   119,   188,    -1,   279,   119,   189,    -1,   279,
     119,     1,    -1,   287,   119,   188,    -1,   287,   119,   189,
      -1,   287,   119,     1,    -1,   279,    -1,   279,    -1,   279,
     110,   198,   111,    -1,   283,   121,   295,    -1,   286,   118,
      -1,   284,   119,   118,    -1,   283,   119,   118,    -1,   287,
     119,   118,    -1,   284,   119,   188,    -1,   284,   119,   189,
      -1,   284,   119,     1,    -1,   283,   119,   188,    -1,   283,
     119,   189,    -1,   283,   119,     1,    -1,   287,   119,   188,
      -1,   287,   119,   189,    -1,   287,   119,     1,    -1,    48,
      -1,    49,    -1,   273,    -1,   288,   273,    -1,   275,    -1,
     288,   275,    -1,   265,    -1,   288,   265,    -1,   280,    -1,
     288,   280,    -1,   273,    -1,   289,   273,    -1,   275,    -1,
     289,   275,    -1,   135,    -1,   289,   135,    -1,   265,    -1,
     289,   265,    -1,   280,    -1,   289,   280,    -1,   259,    -1,
     290,   259,    -1,   273,    -1,   290,   273,    -1,   276,    -1,
     290,   276,    -1,   265,    -1,   290,   265,    -1,   280,    -1,
     290,   280,    -1,   259,    -1,   291,   259,    -1,   273,    -1,
     291,   273,    -1,   275,    -1,   291,   275,    -1,   135,    -1,
     291,   135,    -1,   280,    -1,   291,   280,    -1,   265,    -1,
     291,   265,    -1,   260,    -1,   292,   260,    -1,   273,    -1,
     292,   273,    -1,   275,    -1,   292,   275,    -1,   135,    -1,
     292,   135,    -1,   270,    -1,   292,   270,    -1,   271,    -1,
     292,   271,    -1,    81,    -1,    80,    -1,   259,    -1,   294,
     259,    -1,   273,    -1,   294,   273,    -1,   276,    -1,   294,
     276,    -1,   206,    -1,   294,   206,    -1,   206,   110,   200,
     111,    -1,   294,   206,   110,   200,   111,    -1,   294,    -1,
     287,    -1,   259,    -1,   296,   259,    -1,   273,    -1,   296,
     273,    -1,   276,    -1,   296,   276,    -1,   206,    -1,   296,
     206,    -1,   206,   110,   200,   111,    -1,   296,   206,   110,
     200,   111,    -1,   259,    -1,   297,   259,    -1,   273,    -1,
     297,   273,    -1,   276,    -1,   297,   276,    -1,   280,    -1,
     297,   280,    -1,   265,    -1,   297,   265,    -1,   206,    -1,
     297,   206,    -1,   206,   110,   200,   111,    -1,   297,   206,
     110,   200,   111,    -1,   259,    -1,   298,   259,    -1,   273,
      -1,   298,   273,    -1,   276,    -1,   298,   276,    -1,   280,
      -1,   298,   280,    -1,   265,    -1,   298,   265,    -1,   206,
      -1,   298,   206,    -1,   206,   110,   200,   111,    -1,   298,
     206,   110,   200,   111,    -1,   300,   117,     1,    -1,   299,
     117,     1,    -1,   206,    -1,   300,   117,   206,    -1,   299,
     117,   206,    -1,   330,   117,   206,    -1,   331,   117,   206,
      -1,   206,    -1,   112,   313,   113,    -1,   301,   123,   257,
     124,    -1,   301,   123,   258,   124,    -1,   301,   123,   136,
     124,    -1,   301,   123,   124,    -1,   301,   112,    -1,   302,
     332,   113,    -1,   302,   333,   113,    -1,   302,   300,   113,
      -1,   302,   299,   113,    -1,   302,   113,    -1,   302,   299,
      -1,   302,     1,    -1,   302,   330,   112,    -1,   302,   291,
     206,   112,    -1,   303,    -1,   301,    -1,   306,   303,    -1,
     306,   301,    -1,    74,    -1,   307,    -1,    86,   112,   365,
     113,    -1,    79,    -1,   112,   311,   113,    -1,   123,   124,
      -1,   123,   257,   124,    -1,   123,   258,   124,    -1,   123,
     136,   124,    -1,   308,   123,   124,    -1,   308,   123,   257,
     124,    -1,   308,   123,   136,   124,    -1,   308,   123,   258,
     124,    -1,   112,   113,    -1,   112,   332,   113,    -1,   112,
     333,   113,    -1,   308,   112,   113,    -1,   308,   112,   332,
     113,    -1,   308,   112,   333,   113,    -1,   112,   312,   113,
      -1,   112,   113,    -1,   112,   332,   113,    -1,   112,   333,
     113,    -1,   309,   112,   113,    -1,   309,   112,   332,   113,
      -1,   309,   112,   333,   113,    -1,   109,    -1,   109,   274,
      -1,   109,   310,    -1,   109,   274,   310,    -1,   310,    -1,
     308,    -1,   310,   308,    -1,   306,   310,    -1,   306,   308,
      -1,   306,   310,   308,    -1,   310,    -1,   309,    -1,   310,
     309,    -1,   306,   310,    -1,   306,   309,    -1,   306,   310,
     309,    -1,   305,    -1,   310,   305,    -1,   306,   310,   305,
      -1,   313,   306,    -1,   303,    -1,   310,   303,    -1,   306,
     303,    -1,   306,   310,   303,    -1,   310,   306,   303,    -1,
     304,    -1,   310,   304,    -1,   306,   304,    -1,   306,   310,
     304,    -1,   310,   306,   304,    -1,   301,    -1,   310,   301,
      -1,   306,   301,    -1,   306,   310,   301,    -1,   310,   306,
     301,    -1,   233,    -1,   119,   321,   118,    -1,   119,   321,
     117,   118,    -1,   254,    -1,   119,   321,   118,     1,    -1,
     119,   321,    -1,   119,   321,   117,   118,     1,    -1,   119,
     321,   117,    -1,   232,    -1,   209,    -1,   253,    -1,   210,
      -1,   317,    -1,   318,    -1,   321,   117,   317,    -1,   321,
     117,   318,    -1,   321,   317,    -1,   321,   318,    -1,   313,
      -1,   313,   116,   317,    -1,   313,     1,    -1,   313,   116,
     318,    -1,   322,    -1,   324,   117,   322,    -1,   325,   117,
     322,    -1,   323,    -1,   322,     1,    -1,   324,   117,   323,
      -1,   325,   117,   323,    -1,   288,    -1,   288,   311,    -1,
     289,    -1,   289,   311,    -1,   291,   313,    -1,   291,   311,
      -1,   291,   125,    -1,   291,   125,   313,    -1,   291,    -1,
      65,    -1,   291,   313,     1,    -1,   291,   311,     1,    -1,
     328,    -1,   330,   117,   328,    -1,   330,     1,   117,   328,
      -1,   331,   117,   328,    -1,   331,     1,   117,   328,    -1,
       1,   117,   328,    -1,   300,   117,   328,    -1,   300,     1,
     117,   328,    -1,   299,   117,   328,    -1,   299,     1,   117,
     328,    -1,   329,    -1,   330,   117,   329,    -1,   331,   117,
     329,    -1,   331,     1,   117,   329,    -1,     1,   117,   329,
      -1,   300,   117,   329,    -1,   299,   117,   329,    -1,   299,
       1,   117,   329,    -1,   330,    -1,   330,   117,    51,    -1,
     331,   117,    51,    -1,   300,   117,    51,    -1,   299,   117,
      51,    -1,     1,   117,    51,    -1,   331,    -1,   330,   117,
       1,    -1,   331,     1,    -1,   339,    -1,    79,    -1,   354,
      -1,   115,    -1,   121,    -1,   235,   115,    -1,   357,    -1,
     359,    -1,   361,    -1,   338,    -1,   185,   115,    -1,   184,
     115,    -1,   183,   115,    -1,   340,    -1,   360,    -1,   355,
      -1,   358,    -1,   362,    -1,   361,     1,    -1,   255,    -1,
     365,    -1,   365,   112,   233,   113,    -1,   336,    -1,   337,
     117,   336,    -1,    -1,    86,   273,   112,   365,   113,   115,
      -1,    86,   273,   112,   365,   121,   337,   113,   115,    -1,
      86,   273,   112,   365,   121,   337,   121,   337,   113,   115,
      -1,    86,   273,   112,   365,   121,   337,   121,   337,   121,
     337,   113,   115,    -1,    86,   273,   112,   365,     3,   337,
     113,   115,    -1,    86,   273,   112,   365,     3,   337,   121,
     337,   113,   115,    -1,    86,   273,   112,   365,   121,   337,
       3,   337,   113,   115,    -1,    86,   112,   365,   113,   115,
      -1,    86,   112,   365,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,   121,   337,   121,   337,   113,   115,
      -1,    86,   112,   365,     3,   337,   113,   115,    -1,    86,
     112,   365,     3,   337,   121,   337,   113,   115,    -1,    86,
     112,   365,   121,   337,     3,   337,   113,   115,    -1,   206,
     121,   334,    -1,    52,   257,   121,   334,    -1,    52,   258,
     121,   334,    -1,    52,   121,   334,    -1,    53,   121,   334,
      -1,   206,   121,   335,    -1,    52,   257,   121,   335,    -1,
      52,   258,   121,   335,    -1,    52,   121,   335,    -1,    52,
     121,    -1,    53,   121,   335,    -1,    53,   121,    -1,    80,
      -1,    81,    -1,    53,    -1,    80,    -1,    81,    -1,   290,
     115,    -1,   290,   324,   115,    -1,   160,   115,    -1,   346,
     115,    -1,   292,   115,    -1,   292,   324,   115,    -1,   293,
     324,   115,    -1,   164,   115,    -1,    77,   206,   116,   232,
     115,    -1,    31,    77,   206,   116,   232,   115,    -1,   292,
       1,    -1,   290,     1,    -1,   346,     1,    -1,   161,     1,
      -1,   160,     1,    -1,   290,   325,    -1,   343,    -1,   347,
     343,    -1,   348,   343,    -1,   347,     1,   115,    -1,   346,
      -1,   347,   346,    -1,   334,    -1,   349,   334,    -1,   350,
     334,    -1,   335,    -1,   349,   335,    -1,   350,   335,    -1,
     349,   343,    -1,   350,   343,    -1,   349,   346,    -1,   350,
     346,    -1,   349,    -1,   347,    -1,   347,   349,    -1,   348,
     349,    -1,   350,    -1,   348,    -1,   347,   350,    -1,   348,
     350,    -1,   119,    -1,   355,   118,    -1,   353,   352,    -1,
     353,    -1,   353,   351,    -1,   115,    -1,   235,   115,    -1,
     255,   115,    -1,    54,   112,   235,   113,   334,    -1,    54,
     112,   255,   113,   334,    -1,    54,   112,   235,   113,   334,
      64,   334,    -1,    54,   112,   255,   113,   334,    64,   334,
      -1,    55,   112,   235,   113,   334,    -1,    55,   112,   255,
     113,   334,    -1,    54,   112,   255,    -1,   357,     1,    -1,
      56,   112,   235,   113,   334,    -1,    56,   112,   255,   334,
      -1,    56,   112,   113,   334,    -1,    57,   334,    56,   112,
     235,   113,   115,    -1,    57,   334,    56,   112,   255,   115,
      -1,    58,   112,   356,   356,   113,   334,    -1,    58,   112,
     356,   113,   334,    -1,    58,   112,   356,   356,   235,   113,
     334,    -1,    58,   112,   356,   356,   255,   334,    -1,    58,
     112,   113,   334,    -1,    58,   112,   206,   121,   235,   113,
     334,    -1,    58,   112,   206,   121,   235,   115,   235,   113,
     334,    -1,    58,   112,     1,    -1,    58,   112,   255,     1,
      -1,    58,   112,   356,     1,    -1,    58,   112,   356,   255,
       1,    -1,    58,   112,   356,   356,   255,    -1,    58,   112,
     356,   356,   113,   335,    -1,    58,   112,   356,   356,   235,
     113,   335,    -1,    58,   112,   356,   356,   255,   335,    -1,
      57,   334,    56,   112,   235,   113,    -1,    57,   334,    56,
     112,   235,    -1,    57,   334,    56,   112,   255,    -1,    57,
     334,    56,   112,    -1,    57,   334,    56,    -1,    57,   334,
      -1,    57,    -1,    56,     1,    -1,    56,   112,   113,     1,
      -1,    56,   112,   255,    -1,    56,   112,   235,   113,   335,
      -1,    56,   112,   255,   335,    -1,    59,   206,   115,    -1,
      60,   115,    -1,    61,   115,    -1,    62,   115,    -1,    62,
     235,   115,    -1,    62,   255,   115,    -1,    62,   209,   115,
      -1,    62,   210,   115,    -1,    62,   255,    -1,    62,   210,
      -1,    62,    -1,    59,    -1,   292,   314,   347,   354,    -1,
     292,   314,   354,    -1,   314,   347,   354,    -1,   314,   354,
      -1,   292,   314,   347,   355,    -1,   292,   314,   355,    -1,
     314,   347,   355,    -1,   314,   355,    -1,     5,    -1,   365,
       5,    -1,   363,    -1,   203,    -1,   292,   203,    -1,   344,
      -1,    76,   365,    -1,    76,    31,   365,    -1,    76,   206,
     365,    -1,   115,    -1,   341,   363,    -1,   341,   203,    -1,
     341,   344,    -1,   341,    76,   365,    -1,   341,    76,    31,
     365,    -1,   341,    76,   206,   365,    -1,   341,   121,    -1,
      31,   121,    -1,   101,   206,    -1,   101,   139,    -1,   371,
      -1,   341,   371,    -1,   205,    -1,   292,   205,    -1,   364,
      -1,   341,   205,    -1,   341,   364,    -1,   345,    -1,   341,
     345,    -1,   367,    -1,   369,   367,    -1,   368,   367,    -1,
     369,     1,    -1,   368,     1,    -1,   366,    -1,   369,   366,
      -1,   368,   203,    -1,   368,   341,   203,    -1,   369,    -1,
     368,    -1,    -1,   105,   365,   206,   119,   376,   118,    -1,
     105,   365,   139,   119,   376,   118,    -1,   105,   365,   119,
     376,   118,    -1,   291,   206,   365,   115,    -1,   206,    -1,
     111,   206,    -1,   110,   206,    -1,   373,    -1,   374,   117,
     373,    -1,   107,   374,   115,    -1,   107,   374,   206,   115,
      -1,   372,    -1,   375,    -1,   376,   372,    -1,   376,   375,
      -1,   108,   112,   233,   117,   233,   113,    -1,   106,   112,
     365,   117,   206,   113,    -1,   107,   112,   365,   117,   206,
     113,    -1,   105,   112,   365,   113,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   264,   264,   293,   352,   353,   453,   457,   460,   461,
     462,   511,   513,   518,   523,   528,   530,   535,   537,   542,
     544,   549,   551,   553,   555,   557,   561,   566,   568,   570,
     572,   574,   580,   582,   587,   592,   597,   599,   601,   606,
     607,   611,   612,   623,   627,   628,   630,   635,   636,   638,
     641,   653,   664,   683,   685,   690,   691,   692,   693,   694,
     695,   696,   697,   698,   702,   703,   704,   705,   709,   710,
     711,   712,   713,   714,   715,   719,   721,   726,   728,   730,
     732,   734,   764,   766,   771,   773,   775,   777,   779,   808,
     810,   812,   817,   819,   824,   826,   830,   832,   834,   836,
     841,   844,   847,   850,   915,   917,   922,   924,   926,   928,
     930,   961,   965,   966,   967,   971,   972,   973,   977,   978,
     979,   980,   984,   987,   990,   993,   996,  1001,  1002,  1004,
    1006,  1008,  1010,  1015,  1019,  1022,  1025,  1028,  1031,  1036,
    1037,  1039,  1044,  1048,  1050,  1055,  1057,  1062,  1064,  1069,
    1074,  1076,  1081,  1083,  1085,  1087,  1092,  1094,  1096,  1098,
    1103,  1104,  1105,  1106,  1107,  1108,  1110,  1111,  1112,  1113,
    1114,  1115,  1117,  1118,  1119,  1120,  1121,  1122,  1123,  1124,
    1125,  1126,  1127,  1129,  1130,  1132,  1136,  1137,  1138,  1139,
    1140,  1142,  1143,  1144,  1145,  1146,  1148,  1152,  1153,  1154,
    1158,  1159,  1160,  1161,  1162,  1166,  1167,  1168,  1172,  1176,
    1177,  1178,  1179,  1180,  1181,  1182,  1183,  1187,  1191,  1192,
    1196,  1200,  1201,  1205,  1206,  1207,  1211,  1212,  1216,  1217,
    1218,  1219,  1220,  1221,  1222,  1234,  1246,  1261,  1262,  1266,
    1272,  1273,  1281,  1282,  1284,  1285,  1294,  1295,  1299,  1306,
    1313,  1319,  1326,  1332,  1341,  1348,  1354,  1360,  1366,  1372,
    1378,  1389,  1394,  1395,  1400,  1401,  1402,  1403,  1404,  1405,
    1406,  1407,  1408,  1409,  1410,  1411,  1412,  1413,  1414,  1415,
    1416,  1417,  1418,  1419,  1420,  1421,  1422,  1423,  1424,  1425,
    1426,  1427,  1428,  1429,  1430,  1432,  1433,  1434,  1435,  1436,
    1438,  1442,  1446,  1450,  1451,  1455,  1457,  1458,  1459,  1460,
    1461,  1462,  1463,  1464,  1465,  1467,  1468,  1469,  1470,  1471,
    1472,  1473,  1474,  1478,  1480,  1481,  1482,  1483,  1484,  1485,
    1486,  1487,  1488,  1490,  1491,  1492,  1493,  1494,  1495,  1496,
    1497,  1501,  1502,  1503,  1504,  1508,  1509,  1510,  1511,  1512,
    1516,  1517,  1518,  1519,  1520,  1521,  1522,  1523,  1524,  1528,
    1529,  1533,  1534,  1538,  1539,  1540,  1541,  1542,  1543,  1544,
    1545,  1549,  1550,  1554,  1555,  1556,  1557,  1558,  1559,  1560,
    1564,  1565,  1566,  1567,  1568,  1572,  1573,  1574,  1575,  1576,
    1580,  1588,  1589,  1590,  1591,  1592,  1593,  1594,  1595,  1596,
    1600,  1601,  1602,  1603,  1604,  1606,  1607,  1608,  1609,  1613,
    1614,  1615,  1617,  1618,  1622,  1623,  1624,  1626,  1627,  1631,
    1632,  1633,  1635,  1636,  1640,  1641,  1642,  1646,  1647,  1648,
    1652,  1653,  1654,  1655,  1656,  1658,  1659,  1660,  1661,  1663,
    1664,  1665,  1666,  1668,  1669,  1670,  1671,  1675,  1676,  1677,
    1678,  1679,  1681,  1682,  1683,  1684,  1688,  1689,  1690,  1691,
    1692,  1693,  1694,  1695,  1696,  1697,  1698,  1702,  1703,  1704,
    1705,  1709,  1710,  1711,  1715,  1716,  1717,  1718,  1720,  1721,
    1723,  1724,  1729,  1731,  1736,  1740,  1741,  1742,  1744,  1745,
    1747,  1748,  1753,  1755,  1760,  1764,  1765,  1766,  1767,  1768,
    1769,  1770,  1771,  1772,  1776,  1777,  1781,  1782,  1787,  1788,
    1792,  1793,  1794,  1795,  1796,  1797,  1798,  1802,  1803,  1807,
    1811,  1815,  1822,  1823,  1824,  1825,  1826,  1830,  1831,  1882,
    1883,  1884,  1885,  1886,  1887,  1888,  1892,  1893,  1894,  1895,
    1896,  1903,  1904,  1905,  1906,  1910,  1911,  1912,  1914,  1915,
    1919,  1920,  1921,  1923,  1924,  1928,  1929,  1930,  1932,  1933,
    1937,  1938,  1939,  1943,  1944,  1945,  1949,  1950,  1951,  1952,
    1953,  1954,  1955,  1956,  1957,  1959,  1960,  1961,  1962,  1963,
    1964,  1965,  1966,  1968,  1969,  1970,  1971,  1973,  1974,  1975,
    1976,  1978,  1985,  1989,  1993,  2000,  2001,  2005,  2010,  2011,
    2015,  2016,  2017,  2018,  2024,  2025,  2026,  2030,  2031,  2032,
    2033,  2037,  2039,  2043,  2044,  2045,  2046,  2047,  2051,  2052,
    2053,  2054,  2055,  2059,  2060,  2061,  2065,  2066,  2067,  2071,
    2075,  2076,  2080,  2081,  2082,  2086,  2087,  2089,  2090,  2091,
    2092,  2093,  2095,  2096,  2097,  2098,  2099,  2103,  2104,  2108,
    2109,  2110,  2114,  2115,  2116,  2117,  2118,  2119,  2120,  2121,
    2122,  2124,  2125,  2127,  2128,  2129,  2130,  2131,  2135,  2136,
    2140,  2141,  2145,  2146,  2150,  2151,  2152,  2157,  2158,  2162,
    2163,  2164,  2165,  2166,  2167,  2168,  2169,  2170,  2171,  2172,
    2173,  2174,  2175,  2176,  2177,  2178,  2179,  2180,  2181,  2182,
    2183,  2187,  2188,  2189,  2190,  2191,  2192,  2193,  2194,  2195,
    2196,  2197,  2198,  2199,  2200,  2201,  2202,  2203,  2204,  2205,
    2206,  2212,  2214,  2216,  2218,  2220,  2222,  2224,  2226,  2228,
    2230,  2235,  2236,  2240,  2246,  2255,  2256,  2257,  2261,  2262,
    2263,  2265,  2266,  2267,  2271,  2275,  2283,  2292,  2301,  2302,
    2304,  2305,  2309,  2316,  2323,  2326,  2339,  2353,  2356,  2358,
    2360,  2365,  2366,  2370,  2371,  2372,  2373,  2374,  2375,  2376,
    2377,  2381,  2382,  2383,  2384,  2385,  2386,  2387,  2388,  2389,
    2390,  2394,  2395,  2396,  2397,  2398,  2399,  2400,  2401,  2402,
    2403,  2407,  2408,  2409,  2410,  2411,  2412,  2413,  2414,  2415,
    2416,  2417,  2418,  2422,  2423,  2424,  2425,  2426,  2427,  2428,
    2429,  2430,  2431,  2435,  2436,  2440,  2441,  2442,  2443,  2444,
    2445,  2446,  2447,  2448,  2450,  2452,  2470,  2488,  2489,  2493,
    2494,  2495,  2496,  2497,  2498,  2499,  2500,  2501,  2519,  2536,
    2537,  2538,  2539,  2540,  2541,  2542,  2543,  2544,  2545,  2546,
    2547,  2548,  2566,  2583,  2584,  2585,  2586,  2587,  2588,  2589,
    2590,  2591,  2592,  2593,  2594,  2595,  2613,  2630,  2631,  2635,
    2636,  2637,  2638,  2639,  2643,  2644,  2645,  2646,  2647,  2648,
    2652,  2656,  2657,  2658,  2659,  2660,  2665,  2674,  2683,  2692,
    2706,  2707,  2708,  2710,  2755,  2756,  2757,  2769,  2774,  2776,
    2778,  2780,  2782,  2784,  2786,  2788,  2790,  2792,  2794,  2796,
    2798,  2800,  2802,  2807,  2809,  2811,  2813,  2815,  2817,  2819,
    2824,  2825,  2826,  2827,  2831,  2832,  2833,  2834,  2835,  2836,
    2840,  2841,  2842,  2843,  2844,  2845,  2849,  2850,  2852,  2854,
    2859,  2860,  2861,  2862,  2863,  2867,  2868,  2869,  2870,  2871,
    2875,  2876,  2877,  2878,  2879,  2883,  2884,  2885,  2901,  2902,
    2903,  2904,  2917,  2933,  2934,  2939,  2940,  2944,  2945,  2946,
    2947,  2950,  2951,  2955,  2956,  2960,  2964,  2968,  2969,  2970,
    2974,  2975,  2976,  2977,  2981,  2982,  2986,  2987,  2992,  2993,
    2994,  2995,  2996,  2997,  3016,  3017,  3021,  3022,  3023,  3024,
    3025,  3026,  3028,  3029,  3030,  3031,  3035,  3036,  3037,  3038,
    3039,  3041,  3042,  3043,  3047,  3048,  3049,  3050,  3051,  3052,
    3056,  3057,  3058,  3063,  3064,  3065,  3066,  3067,  3068,  3069,
    3070,  3071,  3072,  3073,  3074,  3075,  3079,  3080,  3081,  3082,
    3083,  3084,  3085,  3089,  3090,  3094,  3095,  3096,  3100,  3101,
    3102,  3103,  3105,  3106,  3107,  3109,  3110,  3111,  3112,  3114,
    3115,  3116,  3120,  3121,  3122,  3123,  3124,  3128,  3129,  3130,
    3131,  3132,  3133,  3134,  3138,  3139,  3140,  3144,  3145,  3149,
    3150,  3151,  3152,  3156,  3157,  3158,  3160,  3161,  3162,  3166,
    3170,  3171,  3173,  3174,  3175,  3179,  3180,  3181,  3182,  3186,
    3187,  3191,  3192,  3193,  3197,  3198,  3199,  3200,  3201,  3202,
    3203,  3207,  3208,  3209,  3210,  3214,  3215,  3216,  3217,  3221,
    3225,  3229,  3231,  3234,  3240,  3241,  3242,  3246,  3247,  3248,
    3249,  3250,  3251,  3255,  3256,  3260,  3261,  3262,  3264,  3265,
    3267,  3268,  3269,  3270,  3271,  3273,  3274,  3278,  3279,  3280,
    3281,  3285,  3286,  3287,  3288,  3290,  3291,  3292,  3293,  3294,
    3295,  3296,  3299,  3303,  3304,  3308,  3309,  3313,  3314,  3315,
    3316,  3317,  3318,  3319,  3320,  3324,  3325,  3326,  3327,  3333,
    3334,  3337,  3338,  3341,  3342,  3343,  3344,  3348,  3349,  3361,
    3362,  3365,  3368,  3370,  3371,  3372,  3382,  3384,  3385,  3387,
    3388,  3389,  3390,  3400,  3401,  3402,  3403,  3404,  3405,  3409,
    3410,  3418,  3420,  3421,  3423,  3425,  3429,  3430,  3431,  3432,
    3433,  3437,  3438,  3439,  3441,  3446,  3447,  3448,  3452,  3453,
    3454,  3458,  3462,  3463,  3464,  3468,  3469,  3473,  3474,  3478,
    3479,  3480,  3481,  3485,  3489,  3493,  3497
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
  "simple_primary_expression", "anon_instantiation_expression",
  "anon_instantiation_expression_error", "primary_expression_error",
  "postfix_expression", "simple_postfix_expression",
  "argument_expression_list", "argument_expression_list_error",
  "common_unary_expression", "unary_expression", "simple_unary_expression",
  "unary_operator", "cast_expression", "multiplicative_expression",
  "additive_expression", "shift_expression",
  "relational_expression_smaller_than", "relational_expression",
  "equality_expression", "and_expression", "exclusive_or_expression",
  "inclusive_or_expression", "logical_and_expression",
  "logical_or_expression", "conditional_expression",
  "assignment_expression", "assignment_operator", "expression",
  "expression_anon_inst", "postfix_expression_error",
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
     205,   206,   207,   207,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   209,   210,   211,   211,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   214,   214,   214,   214,   215,   215,   215,   215,   215,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   217,
     217,   218,   218,   219,   219,   219,   219,   219,   219,   219,
     219,   220,   220,   221,   221,   221,   221,   221,   221,   221,
     222,   222,   222,   222,   222,   223,   223,   223,   223,   223,
     224,   225,   225,   225,   225,   225,   225,   225,   225,   225,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   227,
     227,   227,   227,   227,   228,   228,   228,   228,   228,   229,
     229,   229,   229,   229,   230,   230,   230,   231,   231,   231,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   235,   235,   235,
     235,   236,   236,   236,   237,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   238,   238,   238,   238,   238,
     238,   238,   238,   238,   238,   239,   239,   239,   239,   239,
     239,   239,   239,   239,   240,   240,   241,   241,   242,   242,
     243,   243,   243,   243,   243,   243,   243,   244,   244,   244,
     244,   244,   245,   245,   245,   245,   245,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   247,   247,   247,   247,
     247,   247,   247,   247,   247,   248,   248,   248,   248,   248,
     249,   249,   249,   249,   249,   250,   250,   250,   250,   250,
     251,   251,   251,   252,   252,   252,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   253,   253,   253,   253,   253,
     253,   253,   253,   253,   253,   254,   254,   254,   254,   254,
     255,   255,   255,   255,   255,   255,   255,   256,   256,   256,
     256,   257,   258,   259,   259,   259,   259,   259,   260,   260,
     260,   260,   260,   261,   261,   261,   262,   262,   262,   263,
     264,   264,   265,   265,   265,   266,   266,   266,   266,   266,
     266,   266,   266,   266,   266,   266,   266,   267,   267,   268,
     268,   268,   269,   269,   269,   269,   269,   269,   269,   269,
     269,   269,   269,   269,   269,   269,   269,   269,   270,   270,
     271,   271,   272,   272,   273,   273,   273,   274,   274,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   275,   275,   275,   275,   275,   275,   275,   275,   275,
     275,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   276,   276,   276,   276,   276,   276,   276,   276,   276,
     276,   277,   277,   277,   277,   277,   277,   277,   277,   277,
     277,   278,   278,   279,   279,   280,   280,   280,   281,   281,
     281,   281,   281,   281,   282,   283,   283,   284,   285,   285,
     285,   285,   286,   286,   286,   286,   286,   286,   286,   286,
     286,   287,   287,   288,   288,   288,   288,   288,   288,   288,
     288,   289,   289,   289,   289,   289,   289,   289,   289,   289,
     289,   290,   290,   290,   290,   290,   290,   290,   290,   290,
     290,   291,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   291,   292,   292,   292,   292,   292,   292,   292,
     292,   292,   292,   293,   293,   294,   294,   294,   294,   294,
     294,   294,   294,   294,   294,   294,   294,   295,   295,   296,
     296,   296,   296,   296,   296,   296,   296,   296,   296,   297,
     297,   297,   297,   297,   297,   297,   297,   297,   297,   297,
     297,   297,   297,   298,   298,   298,   298,   298,   298,   298,
     298,   298,   298,   298,   298,   298,   298,   299,   299,   300,
     300,   300,   300,   300,   301,   301,   301,   301,   301,   301,
     302,   303,   303,   303,   303,   303,   304,   304,   304,   304,
     305,   305,   305,   305,   306,   306,   306,   307,   308,   308,
     308,   308,   308,   308,   308,   308,   308,   308,   308,   308,
     308,   308,   308,   309,   309,   309,   309,   309,   309,   309,
     310,   310,   310,   310,   311,   311,   311,   311,   311,   311,
     312,   312,   312,   312,   312,   312,   313,   313,   313,   313,
     314,   314,   314,   314,   314,   315,   315,   315,   315,   315,
     316,   316,   316,   316,   316,   317,   317,   317,   318,   318,
     318,   318,   318,   319,   319,   320,   320,   321,   321,   321,
     321,   321,   321,   322,   322,   323,   323,   324,   324,   324,
     325,   325,   325,   325,   326,   326,   327,   327,   328,   328,
     328,   328,   328,   328,   329,   329,   330,   330,   330,   330,
     330,   330,   330,   330,   330,   330,   331,   331,   331,   331,
     331,   331,   331,   331,   332,   332,   332,   332,   332,   332,
     333,   333,   333,   334,   334,   334,   334,   334,   334,   334,
     334,   334,   334,   334,   334,   334,   335,   335,   335,   335,
     335,   335,   335,   336,   336,   337,   337,   337,   338,   338,
     338,   338,   338,   338,   338,   338,   338,   338,   338,   338,
     338,   338,   339,   339,   339,   339,   339,   340,   340,   340,
     340,   340,   340,   340,   341,   341,   341,   342,   342,   343,
     343,   343,   343,   344,   344,   344,   344,   344,   344,   345,
     346,   346,   346,   346,   346,   347,   347,   347,   347,   348,
     348,   349,   349,   349,   350,   350,   350,   350,   350,   350,
     350,   351,   351,   351,   351,   352,   352,   352,   352,   353,
     354,   355,   355,   355,   356,   356,   356,   357,   357,   357,
     357,   357,   357,   358,   358,   359,   359,   359,   359,   359,
     359,   359,   359,   359,   359,   359,   359,   360,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   360,   360,   360,
     360,   360,   360,   360,   360,   360,   360,   361,   361,   361,
     361,   361,   361,   361,   361,   362,   362,   362,   362,   363,
     363,   363,   363,   364,   364,   364,   364,   365,   365,   366,
     366,   366,   366,   366,   366,   366,   366,   366,   366,   366,
     366,   366,   366,   366,   366,   366,   366,   366,   366,   367,
     367,   367,   367,   367,   367,   367,   368,   368,   368,   368,
     368,   369,   369,   369,   369,   370,   370,   370,   371,   371,
     371,   372,   373,   373,   373,   374,   374,   375,   375,   376,
     376,   376,   376,   377,   378,   379,   380
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
       3,     1,     1,     3,     1,     1,     4,     4,     5,     8,
       1,     1,     2,     4,     2,     6,     6,     5,     5,     6,
       6,     5,     5,     7,     7,     6,     6,     7,     7,     6,
       6,     4,     5,     4,     6,     4,     1,     1,     1,     1,
       3,     1,     2,     2,     2,     1,     4,     4,     3,     4,
       4,     3,     3,     2,     2,     4,     4,     3,     4,     3,
       3,     2,     2,     1,     4,     4,     3,     4,     4,     3,
       3,     2,     2,     4,     4,     3,     4,     3,     3,     2,
       2,     1,     1,     3,     3,     1,     1,     3,     3,     2,
       2,     2,     2,     2,     4,     2,     4,     5,     5,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       2,     1,     2,     3,     3,     3,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     3,     1,     3,     3,
       1,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     3,
       2,     1,     3,     3,     1,     1,     2,     2,     3,     3,
       3,     3,     3,     3,     3,     1,     2,     2,     3,     3,
       3,     3,     3,     3,     3,     2,     2,     2,     2,     3,
       2,     5,     6,     6,     1,     1,     1,     1,     1,     4,
       1,     3,     3,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     1,     3,     3,     3,     3,     1,     2,     3,
       3,     3,     3,     3,     3,     3,     1,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       1,     3,     3,     3,     3,     1,     3,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     1,     5,     5,     5,
       5,     4,     4,     4,     4,     5,     5,     5,     5,     4,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     3,     3,     2,     2,     1,     3,     3,     3,     3,
       1,     2,     3,     3,     2,     2,     2,     1,     2,     3,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     3,     1,     3,     2,     1,
       2,     2,     2,     4,     4,     3,     3,     4,     5,     4,
       6,     6,     4,     5,     4,     6,     6,     2,     2,     2,
       5,     3,     5,     6,     5,     7,     7,     8,     8,     7,
       7,     3,     3,     3,     4,     3,     5,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     4,     4,
       1,     1,     2,     2,     3,     5,     2,     3,     5,     5,
       5,     1,     3,     2,     2,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     4,     3,     2,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     1,     1,     2,     1,
       2,     1,     2,     1,     2,     4,     5,     1,     1,     1,
       2,     1,     2,     1,     2,     1,     2,     4,     5,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     4,     5,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     4,     5,     3,     3,     1,
       3,     3,     3,     3,     1,     3,     4,     4,     4,     3,
       2,     3,     3,     3,     3,     2,     2,     2,     3,     4,
       1,     1,     2,     2,     1,     1,     4,     1,     3,     2,
       3,     3,     3,     3,     4,     4,     4,     2,     3,     3,
       3,     4,     4,     3,     2,     3,     3,     3,     4,     4,
       1,     2,     2,     3,     1,     1,     2,     2,     2,     3,
       1,     1,     2,     2,     2,     3,     1,     2,     3,     2,
       1,     2,     2,     3,     3,     1,     2,     2,     3,     3,
       1,     2,     2,     3,     3,     1,     3,     4,     1,     4,
       2,     5,     3,     1,     1,     1,     1,     1,     1,     3,
       3,     2,     2,     1,     3,     2,     3,     1,     3,     3,
       1,     2,     3,     3,     1,     2,     1,     2,     2,     2,
       2,     3,     1,     1,     3,     3,     1,     3,     4,     3,
       4,     3,     3,     4,     3,     4,     1,     3,     3,     4,
       3,     3,     3,     4,     1,     3,     3,     3,     3,     3,
       1,     3,     2,     1,     1,     1,     1,     1,     2,     1,
       1,     1,     1,     2,     2,     2,     1,     1,     1,     1,
       1,     2,     1,     1,     4,     1,     3,     0,     6,     8,
      10,    12,     8,    10,    10,     5,     7,     9,    11,     7,
       9,     9,     3,     4,     4,     3,     3,     3,     4,     4,
       3,     2,     3,     2,     1,     1,     1,     1,     1,     2,
       3,     2,     2,     2,     3,     3,     2,     5,     6,     2,
       2,     2,     2,     2,     2,     1,     2,     2,     3,     1,
       2,     1,     2,     2,     1,     2,     2,     2,     2,     2,
       2,     1,     1,     2,     2,     1,     1,     2,     2,     1,
       2,     2,     1,     2,     1,     2,     2,     5,     5,     7,
       7,     5,     5,     3,     2,     5,     4,     4,     7,     6,
       6,     5,     7,     6,     4,     7,     9,     3,     4,     4,
       5,     5,     6,     7,     6,     6,     5,     5,     4,     3,
       2,     1,     2,     4,     3,     5,     4,     3,     2,     2,
       2,     3,     3,     3,     3,     2,     2,     1,     1,     4,
       3,     3,     2,     4,     3,     3,     2,     1,     2,     1,
       1,     2,     1,     2,     3,     3,     1,     2,     2,     2,
       3,     4,     4,     2,     2,     2,     2,     1,     2,     1,
       2,     1,     2,     2,     1,     2,     1,     2,     2,     2,
       2,     1,     2,     2,     3,     1,     1,     0,     6,     6,
       5,     4,     1,     2,     2,     1,     3,     3,     4,     1,
       1,     2,     2,     6,     6,     6,     4
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
    1227,   261,     6,   618,   619,   620,   621,   622,   680,   681,
     682,   683,   684,   686,   689,   690,   687,   688,   674,   675,
     679,   685,   761,   762,   629,  1076,   239,   698,   894,   672,
       0,     0,   897,  1074,  1075,   699,   700,   691,     0,     0,
       0,     0,     0,   920,     0,  1196,   809,   694,     8,     4,
       0,     0,     0,  1190,     0,  1209,   874,   803,     0,   693,
       0,   668,   670,   811,   813,   676,   805,   807,   744,   692,
       0,     0,   669,   671,     0,     0,     0,     0,     0,   940,
     673,   895,     0,     0,     0,  1192,  1214,  1189,  1211,  1221,
    1216,     0,     0,     0,  1207,     0,  1204,  1187,     0,     0,
    1193,     0,     0,     0,     0,  1206,  1205,     0,   677,   921,
     673,   922,   874,   891,   890,   936,     0,     0,     0,     0,
    1086,     0,   241,   240,     0,     0,   249,     0,   248,     2,
       3,     0,     5,     0,   631,   630,     0,     0,   649,     0,
       0,     0,     0,   748,     0,   734,   733,  1089,   620,  1083,
     810,  1191,  1210,   874,   804,   812,   814,   806,   808,   940,
     673,     0,     0,     0,     0,   980,     0,     0,     0,   880,
       0,     0,   613,   614,   615,   616,   617,   993,   885,   797,
     869,   791,     0,   801,     0,   793,   795,   744,   799,     0,
       0,   992,     0,     0,   996,  1006,     0,     0,     0,     0,
     942,     0,   941,     0,   702,   703,   704,   705,   706,   708,
     711,   712,   709,   710,   701,   707,   720,   713,     0,     0,
    1119,   716,     0,     0,   781,   715,   787,   783,   785,   789,
     714,     0,  1095,     0,     0,     0,     0,  1182,  1186,   620,
       0,  1203,  1198,  1212,     0,  1199,  1215,  1197,  1213,  1208,
    1220,  1223,     0,     0,     0,     0,     0,  1218,  1219,  1222,
    1217,     1,     0,  1194,  1195,  1188,     0,     0,   475,   270,
       0,     0,     0,     0,     0,     0,   369,   370,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,   367,
       0,     0,   363,   365,   366,   368,     0,   265,     0,   264,
     305,   262,   474,     0,   359,   371,     0,   373,   380,   385,
     391,     0,   400,   409,   414,   419,   424,   427,   430,   447,
       0,   505,   504,   508,   510,   517,   522,   527,   536,   545,
     550,   555,   560,   563,   566,     0,   271,   296,   297,   298,
     299,     0,     0,     0,     0,     0,   678,   923,   893,   892,
       0,   937,     0,   875,   939,   713,   716,   208,   230,   229,
     228,   237,     0,   264,   371,   430,   611,   508,     0,   220,
     205,   253,     0,     0,   252,   259,     0,     0,  1077,  1078,
     691,     0,   176,     0,   179,   180,     0,     0,     0,     0,
       0,   183,   250,     4,     0,     0,     0,     0,    28,    30,
     164,   186,   189,     0,   190,     0,   115,   118,     0,   196,
     127,     0,   165,   139,     0,   174,     0,   197,   200,     0,
       0,   264,     0,     0,     0,     0,   945,   673,     0,    12,
      18,     0,   816,   815,   823,   817,     0,   819,   821,   744,
     828,   827,   254,   260,   251,     0,     0,   243,   242,   662,
     623,   626,   661,   665,   651,     0,     0,     0,     0,   223,
     224,   225,   226,     0,   218,   475,   750,     0,     0,   747,
     475,   749,     0,     0,   475,   751,     0,     0,     0,   942,
       0,   941,     0,   975,     0,     0,  1180,  1184,   981,  1084,
       0,     0,  1085,   879,     0,   264,   612,     0,     0,     0,
       0,   631,   630,   632,     0,   735,     0,     0,     0,   990,
     798,   874,   792,   802,   794,   796,   800,   673,   925,   924,
       0,     0,     0,   884,     0,     0,   883,     0,     0,     0,
    1022,     0,   881,   882,   943,   944,     0,     0,  1093,  1081,
    1092,    75,  1090,  1079,   874,   782,   788,   784,   786,   790,
     673,     0,  1094,  1091,  1082,     0,  1096,     0,  1181,  1185,
    1097,     0,     0,     0,     0,     0,     0,     0,     0,  1178,
       0,     0,     0,  1024,     0,     0,     0,   156,  1026,  1027,
       0,     0,     0,   264,     0,   371,     0,     0,   508,   595,
     600,     0,  1101,  1104,  1032,  1023,  1036,     0,     0,     0,
       0,  1123,  1121,  1025,  1038,     0,  1039,  1030,  1037,     0,
    1040,  1120,     0,     0,  1200,   874,     0,     0,     0,  1210,
       0,     0,  1186,  1224,     0,     0,     0,   896,   485,     0,
       0,   323,     0,   361,   355,   507,   506,   500,     0,   350,
     495,   351,   496,     0,   863,   853,   861,   855,   857,   859,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   274,     0,     0,     0,   767,   763,   765,   769,   984,
       0,   272,     0,   301,     0,   342,     0,   341,     0,   477,
      92,     0,   476,     0,   313,   314,     0,     0,     0,   457,
     458,   459,   460,   461,   462,   463,   464,   465,   466,   456,
       0,     0,   353,   498,   352,   497,     0,     0,     0,     0,
       0,     0,     0,   392,   528,     0,     0,   390,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   695,     0,
     321,   322,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   696,   697,     0,     0,
       0,  1239,  1240,     0,     0,     0,   938,     0,    10,     9,
       0,     0,     0,     0,     0,   673,   924,   206,     0,   208,
       0,   264,     0,     0,   835,   829,   831,   833,     0,     0,
       0,    16,    20,     0,     0,     0,     0,     0,     0,     0,
       0,   364,     0,   264,     0,    26,    21,    27,    24,     0,
      25,    23,    22,    29,    31,   163,   187,    82,   162,   188,
     121,   172,     0,     0,     0,     0,   131,     0,     0,   133,
       0,     0,   142,   175,   201,   198,   203,   202,   199,   204,
     114,     0,     0,   161,     0,   874,   731,     0,   950,   673,
       0,    11,    17,   721,   887,   992,     0,     0,   947,     0,
     946,     0,     0,   184,   170,   191,   194,     0,   195,     0,
     171,   874,     0,     0,   631,   630,   824,   818,   820,   822,
       0,     0,     0,   628,   664,     0,     0,     7,   213,   209,
     221,   746,     0,     0,    61,    52,    91,    38,    37,    56,
      68,    44,    47,     0,    73,    55,     0,     0,     0,   964,
     966,     0,   963,   965,     0,    40,    43,   943,   944,     0,
     955,   958,   974,   976,  1179,  1183,   978,   982,   979,   983,
     878,   876,   877,  1019,  1001,  1010,   636,   635,     0,     0,
     475,   736,     0,     0,   475,   737,     0,     0,   907,   874,
       0,     0,     0,     0,     0,   899,     0,     0,     0,   991,
     928,   927,     0,     0,   926,   995,   994,     0,   868,  1018,
     871,  1004,  1012,     0,   867,  1017,   870,  1002,  1011,     0,
    1021,  1015,   872,   997,  1007,     0,  1016,   873,   999,  1008,
       0,     0,     0,    76,     0,  1080,  1098,     0,     0,     0,
       0,     0,     0,  1162,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1024,     0,   264,     0,  1160,  1029,  1031,
       0,     0,  1168,  1169,  1170,     0,  1176,     0,     0,     0,
       0,     0,     0,   157,   143,  1035,  1034,  1033,     0,     0,
       0,   601,     0,  1028,     0,     0,     0,     0,   470,     0,
       0,   475,     0,     0,     0,     0,  1102,  1105,  1107,     0,
    1103,  1106,  1108,     0,  1134,  1041,  1201,  1202,   241,   240,
       0,     0,     0,  1184,  1185,     0,  1087,     0,   775,   264,
       0,   499,   777,   771,   773,   779,   986,     0,   487,   486,
       0,   331,   332,     0,     0,     0,     0,   339,   340,     0,
       0,     0,     0,     0,     0,     0,     0,   864,   854,   862,
     856,   858,   860,   673,   931,   930,     0,   849,   839,   847,
     841,   843,   845,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   263,     0,   768,   764,
     766,   770,   985,     0,     0,   475,     0,     0,     0,   104,
       0,   300,   475,     0,     0,    93,   475,     0,     0,   478,
     312,   308,   346,   480,   481,   345,   482,   311,     0,     0,
     452,   448,   302,   374,   511,   375,   512,   376,   513,   381,
     518,   382,   519,   386,   523,   387,   524,   394,   530,   395,
     531,   393,   529,   405,   541,   401,   537,   406,   542,   402,
     538,   412,   548,   410,   546,   417,   553,   415,   551,   422,
     558,   420,   556,   425,   561,   428,   564,   591,     0,   607,
       0,     0,     0,     0,   454,   450,   479,   320,   317,     0,
     483,   484,   319,     0,     0,   453,   449,   377,   514,   378,
     515,   379,   516,   383,   520,   384,   521,   388,   525,   389,
     526,   398,   534,   399,   535,   396,   532,   397,   533,   407,
     543,   403,   539,   408,   544,   404,   540,   413,   549,   411,
     547,   418,   554,   416,   552,   423,   559,   421,   557,   426,
     562,   429,   565,   592,     0,     0,     0,     0,   455,   451,
       0,     0,  1232,  1235,     0,     0,  1230,  1241,  1242,     0,
       0,   208,   236,   235,   234,   264,   238,   233,   232,   231,
       0,     0,     0,     0,     0,     0,     0,     0,   927,   245,
       0,   244,   126,     0,   124,   836,   830,   832,   834,     0,
      15,    19,     0,   178,   177,   181,     0,   950,   673,     0,
     138,     0,   136,   836,     0,   264,     0,    83,   116,   119,
     117,   120,   128,   129,   130,   132,   140,   141,   113,   111,
     112,    13,   723,   726,     0,   160,     0,   952,     0,   951,
       0,     0,   722,   874,   888,   948,   949,   874,   169,   192,
     168,   193,   167,     0,     0,     0,     0,     0,   624,   625,
     627,     0,     0,   654,   650,     0,     0,     0,     0,     0,
       0,   227,   219,   217,    35,    36,    74,    53,     0,    54,
       0,    63,    60,    71,    66,    72,    59,    89,    38,    69,
      62,    90,    58,    70,    67,     0,    57,     0,    32,    34,
      33,   967,   968,     0,   644,   634,     0,   639,   633,     0,
     898,   908,   909,   902,   900,   901,   929,   910,     0,     0,
     903,     0,     0,     0,  1005,  1013,   992,  1003,   998,  1000,
    1009,   717,   718,   719,   475,     0,     0,  1065,  1070,     0,
       0,  1066,  1072,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1159,   475,     0,  1124,   264,     0,     0,     0,
    1167,  1173,  1174,  1171,  1172,     0,     0,     0,     0,   144,
    1062,  1067,   158,   598,   596,     0,     0,     0,   468,   602,
     599,   597,   469,   603,     0,  1183,  1088,     0,     0,   354,
     776,   778,   772,   774,   780,   987,     0,   488,   330,   326,
     490,   491,   492,   329,     0,     0,   489,   338,   335,     0,
     493,   494,   337,     0,     0,   293,   291,     0,     0,   914,
       0,     0,     0,     0,     0,     0,   934,   933,     0,   932,
       0,     0,     0,   850,   840,   848,   842,   844,   846,     0,
     267,     0,   266,   295,     0,     0,     0,     0,     0,     0,
    1246,     0,     0,     0,   372,   509,   273,   107,   105,   344,
     343,    98,   102,   309,     0,   310,   306,   307,   608,     0,
       0,     0,     0,     0,     0,   318,   315,   316,     0,     0,
       0,     0,  1234,  1233,  1237,     0,     0,     0,  1229,  1228,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,   122,   125,     0,     0,   173,   952,     0,   951,     0,
       0,   134,   137,     0,    14,   475,     0,     0,   732,     0,
     953,   954,   724,   727,   889,   185,   166,   825,     0,   247,
     246,     0,   653,     0,   214,   207,   215,   210,   211,   222,
      50,    45,    48,    51,    46,    49,    36,    42,    39,    41,
       0,     0,   971,   972,   643,     0,   638,     0,   911,   912,
     905,   904,   906,   989,   988,    78,  1063,  1068,  1064,  1069,
       0,     0,     0,     0,   475,  1137,     0,     0,  1136,  1166,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1144,     0,  1125,   475,  1126,   475,     0,     0,     0,
    1047,   896,  1047,     0,     0,   154,     0,     0,     0,   159,
       0,     0,   501,   327,   328,   324,   325,   336,   333,   334,
     292,   865,   913,   915,   916,   277,   278,     0,   935,   917,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   268,   281,   282,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   348,   347,   472,   609,   439,   583,   431,
     567,   443,   587,   435,   575,   473,   610,   440,   584,   432,
     568,   444,   588,   436,   576,   441,   585,   433,   569,   445,
     589,   437,   577,   442,   586,   434,   570,   446,   590,   438,
     578,  1236,  1238,  1231,   837,     0,   123,   149,   953,   954,
       0,   135,    85,     0,     0,   826,     0,     0,     0,     0,
       0,     0,     0,     0,   969,   970,   959,     0,     0,     0,
       0,  1127,  1128,  1131,  1132,  1135,  1165,     0,     0,     0,
       0,     0,     0,     0,  1141,   475,     0,     0,     0,  1045,
       0,  1043,  1055,     0,  1047,     0,  1047,     0,     0,     0,
       0,   503,   502,   866,   918,   919,   275,   276,   851,   285,
     286,     0,     0,     0,     0,     0,   279,   280,   289,   290,
       0,     0,   294,  1244,  1245,  1243,   838,     0,   725,   728,
     730,   729,     0,     0,   216,   212,   961,     0,     0,     0,
       0,     0,     0,     0,  1155,  1139,     0,     0,  1140,  1152,
       0,  1143,  1154,     0,     0,  1047,     0,  1047,     0,  1047,
       0,  1048,     0,     0,     0,   147,     0,   152,     0,   155,
       0,   852,   283,   284,     0,     0,   956,   287,   288,   182,
    1129,  1130,     0,     0,  1138,  1145,     0,  1142,  1153,  1059,
    1046,     0,     0,     0,  1056,     0,     0,  1047,  1047,     0,
    1047,   146,   145,   150,   148,     0,     0,   372,   509,   269,
     957,     0,     0,  1044,     0,     0,  1047,  1052,     0,     0,
    1049,     0,     0,   153,  1146,  1060,  1061,  1057,     0,     0,
       0,     0,  1047,   151,     0,  1053,  1054,  1050,     0,  1058,
       0,  1051
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,   179,    47,    48,   888,   296,   394,   395,   396,   397,
     398,   399,   400,   401,   897,   898,   899,   900,   901,   902,
     903,   904,   905,   906,   907,   908,   222,   223,   402,   403,
      50,   297,   298,   673,   701,   406,   407,   408,   409,   410,
     411,   412,   413,   414,   415,  1954,  1955,  1956,   416,   580,
     581,   582,   417,   418,   419,   420,   357,   358,   459,   359,
     460,   360,   461,   462,   780,   361,   362,    51,    52,    53,
      54,    55,   299,   300,   301,   909,   910,   302,   303,   632,
     676,  1164,   304,   585,   634,   306,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   662,
     755,   587,  1221,   321,   635,   322,   588,   637,   324,   325,
     326,   327,   328,   329,   330,   331,   332,   333,   334,   589,
     590,  1016,  1223,   369,   498,   181,    57,   451,   452,   182,
      59,   183,   184,    60,    61,    62,    63,    64,    65,   185,
     109,   186,   228,   846,   847,   187,   188,   189,    69,    70,
      71,    72,    73,   190,   669,  1086,   370,   424,    75,    76,
     441,   442,   789,  1123,   650,   950,   951,    77,   425,    79,
     426,   115,   110,    81,   518,  1114,   428,   520,  1116,   118,
     429,   430,   853,  1431,  1432,   915,   916,  1433,   164,   165,
     166,   167,   670,  1087,   194,   195,   196,   197,   198,   199,
     592,   593,  1879,  1880,   594,   595,   596,    84,   431,   232,
      85,    86,   233,   234,   235,   599,   600,   601,   602,   236,
     603,   809,  1499,  1018,   606,   607,   608,  1019,   610,    87,
      88,   336,    89,    90,    91,    92,    93,    94,   761,  1293,
    1294,   762,   763,   337,   338,   339,   340
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -1562
static const int yypact[] =
{
   33203, -1562, -1562, -1562, -1562,   322, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
    1060,   125, -1562, -1562, -1562, -1562, -1562, -1562,    46,   233,
     272,   169,   105,  1444,   938, -1562, -1562, -1562,    83, -1562,
     203,   169,    57, -1562,   647,   274,  1179, -1562,   419, -1562,
    1268, -1562,   300, -1562, -1562, -1562, -1562, -1562,    52, -1562,
    1305,   281, -1562,   324,   546, 32851,   938,   242, 33465, -1562,
     744, -1562,   817, 35510, 31568, -1562, -1562, -1562, -1562, -1562,
   -1562, 33291, 32490,   484, -1562,   125, -1562, -1562,   105,   105,
     566,   503,   105, 25800,   169, -1562, -1562,   106, -1562,  1444,
   -1562, -1562, -1562,   242, -1562, -1562,   744,   817,  1002, 20887,
   -1562,   520,   496,    64, 26525, 35026, -1562, 26641, -1562, -1562,
   -1562,   169, -1562,  1374,  1394,  1395,   183, 35026, -1562, 35172,
   26757, 35026, 26873, -1562, 26989, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562,   274,   617, -1562, -1562, -1562, -1562, -1562,   559,
     744,   817,  1050, 35510,   240, -1562,  1410,   523,  1411, -1562,
   24486,   550, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
     788, -1562,   565, -1562,   575, -1562, -1562,   558, -1562,   595,
     677, 30421,   488,   531, -1562, -1562,   589,   640,   756,   771,
   -1562,   530, -1562,   530, -1562, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,   618,   669,
   -1562, -1562,   156,   142, -1562, -1562, -1562, -1562, -1562, -1562,
   -1562, 33027, -1562, 15999,  3288, 11884, 16128, -1562,   781,   828,
    1173, -1562, -1562,   274, 32939, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562,   300,   324, 33813, 35510, 34072, -1562, -1562, -1562,
   -1562, -1562,   799,   566,   566, -1562, 25800,   121, -1562, -1562,
   25873, 25946, 25946,   823, 35245, 25800, -1562, -1562,   836,   846,
   35245, 25800,   882,   890,   945,   957,   972, -1562, 21111, -1562,
     105, 24559, -1562, -1562, -1562, -1562,   987, -1562,   165,   995,
   -1562, -1562, -1562, 11775, -1562,  1763, 24559, -1562,   842,   -33,
     803, 25800,   798,  1321,  1036,  1012,  1021,  1199,    22,  1763,
    1119,   689, -1562,  1763, -1562,  1030,  1277,  1384,  1070,  1461,
    1116,  1132,  1143,  1264,   336,  1763,   566, -1562, -1562, -1562,
   -1562,  1153,   247, 34497,  1174,  1190, -1562, -1562,   242, -1562,
     817, -1562,   530, -1562, -1562,   836,   987,  1230, -1562, -1562,
   -1562, -1562,   820,  1086, -1562,   364, -1562, -1562,   385, -1562,
   35414, -1562, 20999, 35172, -1562,   893, 10230, 34157, -1562, -1562,
     836,  1205, -1562,   169, -1562, -1562,   125, 34242, 33987,  4955,
   35099, -1562, -1562,   987,   876,  1234,  1234,   913, -1562,  1259,
   -1562, -1562,  1297,   216,   903,   228, -1562, -1562,   710,  1298,
   -1562,  1402, -1562, -1562,  1029, -1562,  1316, -1562, -1562, 26061,
   26177,   304,  1028,   689, 31662, 33552, -1562,   744,   817, -1562,
   -1562, 10690, -1562, -1562,  1329, -1562,   169, -1562, -1562, -1562,
     169, 35245, -1562,   893, -1562, 26293, 26409,  1337,  1345, -1562,
    1343, -1562,  1351, -1562, -1562,  1161,  1362,   854,   125, -1562,
   -1562, -1562, -1562,   510,   338,  1001, -1562, 27105, 27221, -1562,
    1188, -1562, 27337, 27453,  1302, -1562, 27569, 27685, 19223,  1134,
     817,   559,   530, -1562, 24632,  3288, -1562,   781, -1562, -1562,
     938,   938, -1562, -1562,  1360,   404, -1562,  1407,  1413, 34807,
    1533,  1379,  1442, -1562, 27801, -1562, 27917, 30229, 24705,   938,
   -1562,   788, -1562, -1562, -1562, -1562, -1562,   180,   751,   196,
     409,   706,  1449, -1562, 34584,  1453, -1562, 34659,  1456, 34734,
    1459, 34880, -1562, -1562, -1562, -1562, 25800,   169, -1562, -1562,
    1484, -1562, -1562, -1562,  1460, -1562, -1562, -1562, -1562, -1562,
     744,  1423,   523, -1562, -1562,  1492, -1562, 16257, -1562,   781,
   -1562,   315, 24778,  1499,  1523,  1534,   147, 16386,  1539,   125,
    1542,  1553, 16515, 33115,  1399,  1577,  1578,   125, -1562, -1562,
    1576,  1579,  1581,  1424, 14833,  1763, 11095, 22077,  1763,  1763,
   -1562, 14967, -1562, -1562, -1562, -1562, -1562, 16644, 16773, 16902,
   17031, -1562, -1562, -1562,   781, 17160, -1562, -1562, -1562, 17289,
   -1562, -1562,   105,   105,   566,   499,   169,  1428,  1573, -1562,
   35510,  3288, -1562, -1562, 33900, 25800,  1583, -1562, -1562, 21239,
     241, -1562, 11991, -1562, -1562,  1113, -1562, -1562, 24851, -1562,
   -1562, -1562, -1562, 35245,  1590, -1562, -1562, -1562, -1562, -1562,
   31184, 35245, 21367,   125, 31280, 35245, 25800,   105,   105,   105,
   25800, -1562, 12132, 12268, 12421, -1562, -1562, -1562, -1562,  7712,
    1580,   100, 19351, -1562,   245, -1562,   644, -1562, 19479,  1584,
   -1562, 19607, -1562,  1541, -1562, -1562, 22150,  1547, 25800, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
   24559,   260, -1562, -1562, -1562, -1562, 25800, 25800, 25800, 25800,
   25800, 25800, 25800,   803,  1384, 25800, 25800, -1562, 25800, 24559,
   24559, 24559, 24559, 24559, 25800, 25800, 12555, 24559, -1562,  1566,
   -1562, -1562, 22223,  1585, 25800, 24559, 25800, 25800, 25800, 25800,
   25800, 25800, 25800, 25800, 25800, 25800, 25800, 24559, 24559, 24559,
   24559, 24559, 25800, 25800, 12689, 24559, -1562, -1562,   766,   788,
   35099, -1562, -1562, 32578, 34497, 34497, -1562, 20887, -1562, -1562,
   20887, 20887, 24559, 24559, 30325,  1130,   794, -1562,    86,   570,
     991,   867,  1081,  1582,  1594, -1562, -1562, -1562,   169, 30992,
   34157, -1562, -1562,   125,  1591,  1592,  1593, 31850,  1586,   125,
   31088,  1444, 21479,  1039, 34327, -1562, -1562,   781, -1562,   781,
   -1562, -1562, -1562,   781, -1562, -1562,  1596, -1562, -1562,  1065,
   -1562, -1562,  2512,  2512,  1234,  1234, -1562,  1234,   105, -1562,
    1234,  1234, -1562, -1562,  1018, -1562, -1562,  1018, -1562, -1562,
    1051, 24924,  1304, -1562, 25800,   719, -1562,  1491,   242,   744,
     817, -1562, -1562,   332,   550, 30421, 19095,   519, -1562,   530,
   -1562,   530,   938, -1562, -1562, -1562,  1600,   267,  1602,   283,
   -1562,   304, 31756, 20887, -1562, -1562,  1599, -1562, -1562, -1562,
   35172, 35172, 25800,   125, -1562, 29889,   213, -1562,  1025,  1098,
    1603, -1562, 35172,   125, -1562, -1562, -1562,  1234, -1562, -1562,
   -1562, -1562, -1562, 31944,  1497, -1562, 19735, 35602, 19863, -1562,
   -1562, 11299, -1562, -1562, 34412, -1562, -1562,   559,  1134, 24632,
   -1562, -1562, -1562, -1562, -1562,   781, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562,  1351,   308,   321,
    1604, -1562, 28033, 28149,  1606, -1562, 28265, 28381, -1562,   667,
     500,   540,  1605,  1613,  1615, -1562,  1608,  1612,  1616,   501,
     751,   196, 33639, 24997,   751, -1562, -1562, 34953, -1562, -1562,
     788, -1562, -1562, 34953, -1562, -1562,   788, -1562, -1562, 34953,
   -1562, -1562,   788, -1562, -1562, 34953, -1562,   788, -1562, -1562,
    1617,  1630,   489, -1562, 19991, -1562, -1562, 17418,  1623,  1624,
   17547, 25800, 25800, -1562, 25070, 25143,  1626,  1639,  1640,  8428,
    1644,   125, 22296, -1562,  1536,  1505, 22369,  1673, -1562, -1562,
   22442,  1635, -1562, -1562, -1562,  1643,  1645, 22515, 15096,   105,
    1647, 25800, 25800,   125, -1562, -1562, -1562, -1562,  9167,   840,
   24559, -1562,  1414, -1562, 25800, 12823, 12957, 24559, -1562, 25800,
   13091,  1492, 17676, 17805, 17934, 18063, -1562, -1562, -1562, 18192,
   -1562, -1562, -1562, 18321, -1562, -1562,   566,   566,  1651,  1652,
   30004, 30119,  3288, -1562, -1562,  1648, -1562,   937, -1562,   304,
    1654, -1562, -1562, -1562, -1562, -1562,  7712,  1655,  1584, -1562,
    1628, -1562, -1562, 22588,  1633, 25800,  1638, -1562, -1562, 22661,
    1649, 25800,  1656, 35318, 20887, 33378, 25800,  1662, -1562, -1562,
   -1562, -1562, -1562,   847,  1661,  1663,  1641,  1664, -1562, -1562,
   -1562, -1562, -1562, 31376, 22734,  1665,  1667,  1678, 25800,  1653,
   31472,  1676,   335,   542,   629,  1677, -1562,   125, -1562, -1562,
   -1562, -1562, -1562, 25800,   105,   334, 32035, 20119,  1679, -1562,
   24559, -1562,   337, 32126, 20247, -1562,   360, 32217, 20375, -1562,
   -1562, -1562, -1562,  1245,  1683, -1562, -1562, -1562, 22807,  5651,
   -1562, -1562,  1679, -1562, -1562, -1562, -1562, -1562, -1562,   842,
    1030,   842,  1030,   -33,  1277,   -33,  1277,   803,  1384,   803,
    1384,   803,  1384, -1562, -1562,   798,  1070, -1562, -1562,   798,
    1070, -1562, -1562,  1321,  1461, -1562, -1562,  1036,  1116, -1562,
   -1562,  1012,  1132,  1021,  1143,  1199,  1264, -1562,    84, -1562,
   22880,  1680,  6503,  1681, -1562, -1562, -1562, -1562, -1562,  1250,
   -1562, -1562, -1562, 22953,  7303, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562,   842,  1030,   842,  1030,   -33,  1277,   -33,
    1277,   803,  1384,   803,  1384,   803,  1384,   803,  1384, -1562,
   -1562,   798,  1070, -1562, -1562,   798,  1070, -1562, -1562,  1321,
    1461, -1562, -1562,  1036,  1116, -1562, -1562,  1012,  1132,  1021,
    1143,  1199,  1264, -1562, 23026,  1682,  8729,  1684, -1562, -1562,
     125,   125, -1562, -1562,   232,  1172, -1562, -1562, -1562, 32669,
   32760, -1562, -1562, -1562, -1562,  1090, -1562, -1562, -1562, -1562,
   23099,  1689, 10328,  1690, 23172,  1691, 11435,  1692,   794, -1562,
   20887, -1562, -1562, 20887, -1562,   871, -1562, -1562, -1562,   600,
   -1562, -1562,   545, -1562, -1562, -1562,  1538,  1675,   744,   817,
   -1562,  1686, -1562,  1044,   622,   330,  1687, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562,   566, -1562, -1562,  3370, -1562,
   -1562, -1562, -1562, -1562, 20503, -1562,   296,   242,   530,   242,
     530, 25800, -1562,   865, -1562, -1562, -1562,  1701, -1562,  1596,
   -1562,  1584, -1562,  1543,  1082, 20887,  1089,  1105, -1562, -1562,
   -1562, 28497, 28613,  1702, -1562,  1242, 35245, 35245, 35245, 35245,
   25800, -1562, -1562, -1562, -1562,   781, -1562, -1562, 25216, -1562,
   25289, -1562, -1562, -1562,  1546,  1497, -1562, -1562,  1234, -1562,
   -1562, -1562, -1562, -1562,  1546,  1497, -1562, 25362, -1562, -1562,
   -1562, -1562, -1562, 18450, -1562, -1562,   134, -1562, -1562,   212,
   -1562, -1562, -1562, -1562, -1562, -1562,   751, -1562,  1703,  1705,
   -1562,  1695,  1696,  1697, -1562, -1562, 30421, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562,   363, 32308, 20631, -1562, -1562,  9167,
    9167, -1562, -1562, 23245, 15225, 23318, 23391, 10582, 23464, 15354,
    8428,  1707,  1710,  8428, 25800, 25435,  1766, 23537,  1645,  8927,
     105,  8428,  1711, 30803,  8428, -1562,  1545, 23610, 11638, 23683,
   -1562, -1562, -1562, -1562, -1562,    97,   105,  1713,  1252, -1562,
   -1562, -1562, -1562, -1562, -1562,  1720,  1721,   125, -1562, -1562,
   -1562, -1562, -1562, -1562, 35172, -1562, -1562,  1722,  1723, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, 13225, -1562, -1562, -1562,
    1267,  1724, -1562, -1562, 23756, 21566, -1562, -1562, -1562,  1269,
   -1562, -1562, -1562, 23829, 21639, -1562, -1562,  1727,  1137, -1562,
    1728,  1729,  1730,  1731,  1740, 20887,  1661,  1663, 33726,  1661,
   25800, 20887, 25800,  1735, -1562, -1562, -1562, -1562, -1562,  1742,
   -1562, 25508, -1562, -1562,  1745,  1746, 25800, 25800,  1743,  6631,
   -1562,   125,   125, 25800, -1562, -1562,   566, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, 13359, -1562, -1562, -1562, -1562, 24559,
   13493, 13627, 24559, 13761, 13895, -1562, -1562, -1562, 14029, 14163,
   14297, 14431, -1562, -1562, -1562,   766,  1738,   573, -1562, -1562,
   24559, 24559, 24559, 24559, 24559, 24559, 24559, 24559,  1843,  1144,
   20887, -1562, -1562,  1754,  1234, -1562,  1675,   530,  1675,   530,
    1758, -1562, -1562,  1756, -1562,   370, 32399, 20759, -1562,   744,
     242,   242,  1760,  1765, -1562, -1562, -1562, -1562,  1166, -1562,
   -1562, 29889,  1762, 29889, -1562, -1562,  1773, -1562,  1774, -1562,
     911, -1562, -1562,   911, -1562, -1562, -1562,   911, -1562, -1562,
   18579, 18708, -1562, -1562, -1562, 29889, -1562, 29889, -1562, -1562,
   -1562, -1562, -1562, -1562,   501, -1562, -1562, -1562, -1562, -1562,
    8428,  6754,  8428,  6754, 30518, -1562,  9167, 15483, -1562, -1562,
    8428,  8428, 23902,  8428, 23975,  7519,  1779, 21712, 24048,   164,
   18837, -1562, 25800, -1562, 30613, -1562, 30898,  8428, 21785, 25581,
     105,  1777,   105,   189,  1778, -1562,   125, 25800, 25800,   125,
   14565, 14699, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
   -1562, -1562, -1562, -1562, -1562, -1562, -1562,  1208,  1661, -1562,
    1780,  1783,  1775,  1781,  1213,  1782,  1786, 20887, 25800, 21111,
   24632, -1562, -1562, -1562,  1787,  1788,  1789,  1790, 25800,  1785,
    1791,  1794,  1802, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
     385, -1562, -1562, -1562,   385, -1562, -1562, -1562, -1562, -1562,
     385, -1562, -1562, -1562,   385, -1562, -1562, -1562,   385, -1562,
   -1562, -1562,   385, -1562, -1562, -1562,   385, -1562, -1562, -1562,
     385, -1562, -1562, -1562, -1562,  1226, -1562, -1562,  1675,  1675,
   24559, -1562, -1562, 25800, 25800, -1562, 28729, 28845, 29889, 28961,
   29077, 35245, 35245, 18966, -1562, -1562, -1562, 29193, 29309, 29425,
   29541,  1837,  1839, -1562, -1562, -1562, -1562,  8428, 25800, 25654,
    1777, 15612, 15741, 21858, -1562, 30708,  9167, 24121, 15870, -1562,
    1201,   424, -1562,    68,   105,  1801,   105,   320,   607,  1804,
    1288, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562, -1562,
   -1562,  1239,  1795,  1796,  1805, 21931, -1562, -1562, -1562, -1562,
    1797,  1800, -1562, -1562, -1562, -1562, -1562,  1810, -1562, -1562,
   -1562, -1562, 29657, 29773, -1562, -1562, -1562,  8428,  8428, 24194,
   22004,  8428, 24267,  7519,  1811, -1562,  8428, 25800, -1562, -1562,
    9167, -1562, -1562,  1814,   105,   105, 25800,   105,  1815,   105,
    1336, -1562,   204,  1234,   668, -1562,   135, -1562,  1813, -1562,
     125, -1562, -1562, -1562, 25727, 24340, -1562, -1562, -1562, -1562,
   -1562, -1562,  1811,  8428, -1562, -1562, 24413, -1562, -1562, -1562,
   -1562,  1289,  1821,  1301, -1562,  1369,  1820,   105,   105,  1822,
     105, -1562, -1562, -1562, -1562,   320,   619, -1562, -1562, -1562,
   -1562,  8428,  1823, -1562,  1824,  1827,   105, -1562,  1306,  1308,
   -1562,  1388,   749, -1562, -1562, -1562, -1562, -1562,  1320,  1828,
    1831,  1832,   105, -1562,  1833, -1562, -1562, -1562,  1335, -1562,
    1834, -1562
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
   -1562,  2172,    26,    -2, -1562,  1900, -1562, -1562, -1562, -1562,
   -1562, -1562,  1522,  1524,  -809, -1562,  -882,   288,   257,   264,
    -854,  -642,  -612, -1562,  -643,  -636, -1562, -1562,  1526,  1528,
   -1562,  3952,   792, -1562,  -170,   699,   729, -1562, -1562, -1562,
   -1562,  1530, -1562, -1562, -1562,  -560, -1561,   -31, -1562, -1562,
   -1562, -1562,   227,  1087,   -41,    60,   -86,  -759, -1562,  -748,
   -1562,  -734, -1562,  1071,  -130,  1192,  -857,     1,  1712,    72,
    1714,    13,     0, -1562,  1699,  2882,  3264, -1562,  3641, -1562,
    -537,  -719,  1700,  4530, -1562, -1562,  -193,   259,   560,   -54,
   -1562,   408,  -126,    32,    21,    81,   107,   -36,  9248,  2476,
    -173,  9751,    44,  1968, -1562,  1704,  5327, -1562,  -155,   594,
     630,    -6,   538,   115,   129,   394,   282,   493,  4072,  3570,
    1129,  9064,   554,    51,   664,  7063,   -32,  1088,  -131,  2005,
    8536,  7241, -1562, -1562, -1562,   -45,     4,   -12, -1562,  6408,
   -1562,   206,  1468,   599,  -435,  2278,  7993, -1562,  8827, -1562,
   -1562, -1562,   -30,  2988, -1562, -1562,  3452,  3175,   -18, -1562,
   -1562,  1317,  1588,  1312,  1706,   -57,   -46,  2342,  5738,  6229,
    -363,  -113,  2924,  1124,  -497, -1088, 10863,  -330,  -620,   -16,
    1256,  -265,  1058,  -469,  -473,  -839,  -831,   199,  1067,  1126,
      -8,  1749,  -645, -1562,  -133,  -409,  1556, -1562,  -501,  -479,
    4485,  -337,    38,  -838, -1562, -1562, -1562,  1896, -1562,  -165,
    1904,   -37,   631,  -149,  1753,  1078,  1084, -1562, -1562, -1562,
     -82,   830, -1437,   355, -1562, -1562, -1562,   590, -1562,  1906,
     -29,    66,  1901,  1587, -1562, -1562, -1562,  1910,  -760,   372,
   -1562,  -745,   923, -1562, -1562, -1562, -1562
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1227
static const yytype_int16 yytable[] =
{
      56,   237,  1359,  1297,   351,   455,   953,  1125,  1302,   463,
    1360,   923,  1307,  1230,   485,   922,  1384,  1033,  1298,  1303,
     960,   192,   964,  1308,  1412,  1566,  1422,  1569,   954,  1146,
      99,   101,   193,  1304,  1129,  1153,  1147,  1309,  1157,   725,
     777,   106,  1154,   154,   112,  1158,   252,   246,   351,   122,
    1728,   123,  1414,   458,  1424,   248,   132,   131,   135,   162,
     162,   253,  1739,   156,   858,   860,   244,     1,   168,   556,
     560,  1947,   145,   254,   146,   153,   112,   121,   180,   155,
     112,   486,   112,   365,    56,  1608,   445,   597,   152,     1,
     935,    56,    56,   709,   710,   262,   100,   243,  1418,   467,
    1740,   472,   265,   476,   342,   265,   621,   345,   107,     1,
      97,   265,   792,   704,   887,   972,   112,   112,   978,   363,
     984,   674,   989,   132,   421,   434,   265,   421,     1,   447,
     341,   448,   700,   450,     2,  1694,   450,   434,     1,   464,
     421,   434,   421,   540,   421,  1402,   727,   151,  1003,  1163,
     735,   705,   558,   132,   131,   726,   242,   538,   102,   852,
     112,   112,   139,   251,   263,   264,   679,  1740,   267,   265,
     495,  -745,     1,  -745,   373,   521,   124,   952,   125,   374,
     132,  1948,   502,     1,   453,  1944,     1,   446,   145,  1949,
     146,   511,  1884,   119,   265,  1229,   494,     2,   643,     1,
     468,   112,   473,   112,   477,  -471,    67,  1988,  1953,   252,
    1741,   252,   154,  1696,  1393,   162,     1,   816,  1742,   246,
    1144,   497,   154,   551,   253,   343,   253,   248,   162,   819,
     365,   544,   156,  1332,   627,     1,   583,   766,   624,   365,
     613,   488,  1088,   782,   615,   365,  1148,  1558,   155,  1695,
       1,   883,  -642,  1993,    56,   616,    56,   713,   155,  1004,
     541,  1172,  1057,  1061,  1415,  1422,  1425,   619,  1379,   243,
      28,   539,  1422,   953,   644,    32,  1422,  1870,   960,   964,
     644,   158,    38,   680,  1381,  1742,   779,   458,   495,    43,
      67,  1869,   507,  1424,  1416,   954,  1426,    67,    67,     1,
    1424,   454,  1885,   508,  1424,   714,   614,     1,   507,  1434,
    1886,     1,   806,   808,   810,   812,   553,  1989,   120,   508,
     556,  1944,  1437,     1,     1,  1990,   651,  1697,   623,   883,
    -637,  1394,   655,     1,   817,  -108,   365,  1418,   -99,  1142,
     265,  -207,   132,   759,  1418,   103,   680,  1624,  1418,  1625,
     112,  1465,   112,   753,   169,  -977,   671,  -977,  1466,   680,
     757,  -103,  1336,  1149,   -81,   170,   934,   766,   856,   937,
      28,   -88,   781,   464,  1541,    32,   784,   511,  1149,   193,
    1550,   725,    38,   795,   104,   817,   796,   759,   784,   803,
     759,   971,   128,  1953,   977,  1994,   983,   515,   988,    95,
     142,   680,   753,   924,  -874,    43,   351,     1,    44,  -874,
     965,    32,  1040,   129,   130,  1047,  -874,   844,   138,   421,
     421,   132,     1,   681,   845,   180,  1435,   112,   112,   265,
     554,   871,   556,   560,  1058,  1062,   875,  1383,   145,  1438,
     146,   876,   143,    96,   952,   421,   421,     2,  1590,   681,
     158,  1994,  -108,  1371,   893,   -99,   556,   889,   890,  1329,
     158,  1448,    67,   942,  1446,   946,  1639,   421,   421,   754,
    1344,  1072,   421,   421,   162,   162,   421,   421,  -103,  1768,
     112,   -81,   112,  1449,   261,  1560,   858,   860,   -88,   522,
     112,   112,     1,   959,   667,   132,  1375,   772,  1376,   759,
     450,   522,     1,  1579,   421,  1425,   421,   949,   495,   112,
    1588,   132,  1425,  1173,  1175,  1177,  1425,   112,   773,   112,
     528,  -989,  -989,   681,   970,  1331,  -989,   976,  1668,   982,
     674,   987,   525,     1,   956,  1426,  1946,   992,   133,  1297,
    1297,   525,  1426,  1237,  1239,  1241,  1426,   265,     1,     1,
     112,  1174,  1176,  1178,  1298,  1298,  1540,   674,  1455,   957,
    -890,  1307,  1549,   991,   943,   674,   947,  1015,     1,  1021,
    1126,   265,  1638,     1,     2,    28,  1460,  1034,   265,   252,
      32,  1238,  1240,  1242,  1422,   674,  1309,    38,  1688,   365,
     528,   605,   154,     2,   253,  1203,  1689,   583,   583,   583,
     583,   523,  1463,     1,  1561,   524,   372,   852,   129,   130,
       1,    -8,  1424,   998,  1068,   132,  1069,   524,   478,   266,
       1,   891,     1,  1269,   511,     1,  1562,   892,   155,  1079,
     515,  1374, -1014,  -890,   265,   371,   529,  1674,  -890,  1677,
     491,   530,    44,  1102,   526,  -890,   835,   838,   527,  1429,
    1107,  1117,   495,  1127,  1107,  1117,  1418,   527,  1644,  1591,
    1468,  1187,  1189,  1472,  1191,   144,  1679,   499,  -869,  1137,
       1,     1,   835,   838,  -890,  -890,  -890,   504,  1066,  1067,
       1,  1301,    26,  1160,   500,  1301,   767,  1167,  1833,  1251,
    1253,  1255,  1257,   503,   835,   838,   729,   730,   731,   835,
     838,  1511, -1014,   835,   838,     2,   529,   966,  1767,  1188,
    1190,   820,  1192,   505,  1774,  1057,  1061,  1057,  1061,  1642,
    1957,  1656,     1,  1132,  1133,  1134,   129,   130,  1657,  1227,
     536,   365,  2013,  1232,   365,   365,   478,  1252,  1254,  1256,
    1258,  1652,  1352,  1353,  1211,  1354,  1592,     1,  1356,  1357,
    1386,  1387,     1, -1020,  1207,  1395,  1535,   531,  1292,   132,
    1295,  1150,   126,   759,   759,   759,   127,  1305,  1151,     1,
     363,  1305,  1277,  1557,   180,  1422,   129,   130,   889,   890,
      28,   537,  1273,  1835,  -869,    32,   145,   220,   146,  1325,
     511,     1,    38,  1034,   458,   458,   506,   511,  1285,  1341,
    1343,   732,  1345,  1424,   759,  1213,   458,  1436,  1439,   733,
     715,   716,   734,   711,   712,  1404,  1311,  1315,  -988,  -988,
       1,  1446,  1953,  -988,  1425,   821,   609,   822,   129,   130,
     158,   768,  1215,  1279,  1454,  1084,  1204,   365,  1364,   521,
    1457,  1166,   112,     1,  1391,   132,  1458,  1418,   766,   112,
     112,  1208,  1459,    43,  1426,  1373,    44,     1,   667,   112,
    1281,   112,  1377,   962,  1270,   557,   561,  2023,     1,   532,
    -207,   132,   845,   363,   963,  1140,  1290,  1291,  -207,  1274,
     464,   464,   887,   450,   533,   421,   450,  1058,  1062,  1058,
    1062,    28,   464,  1403,  1355,  1362,    32,   129,   130,   611,
    -475,  -475,  -475,    38,  1883,    95,   774,   556,   717,   718,
    -265,  -265,  -265,   238,   112,   625,   405,   508,  -475,   405,
    1901,  -475,  -475,  -475,  -475,  -475,  -475,  -475,  -475,    44,
    1512,   769,   405,  1388,   405,   643,   405,   770,   450,   450,
       1,     1,   421,   421,  1789,  1392,   421,   421,   652,   132,
    1594,   706,   605,   605,   605,   605,    43,  1749,   653,  1105,
    1693,   112,   180,   495,  1692,     2,   515,   759,  1179,  1181,
     132,   707,   708,   759,   129,   130,   132,  1664,  -207,   759,
     674,  1640,   132,  1320,  -207,   759,   681,   132,  1595,  1451,
    1641,   805,   132,   487,   656,   220,   515,   583,  1243,  1245,
     583,  1917,   657,   515,  -757,  1375,  1214,  1376,   667,  1015,
     515,  1021,    28,  -475,  1452,  1425,  -475,    32,   818,  -265,
    1496,  -475,  -475,  -265,    38,  -475,  -475,  -475,   811,   840,
     445,  -475,   220,  1509,  1280,   683,   684,   685,   583,  1167,
    -475,  -475,  -475,  -475,  -475,  1426,  1950,    43,  1952,   643,
      44,   483,   583,   583,   583,   583,  1481,   658,  -476,  -476,
    -476,   515,   630,     1,   559,    97,   604,  1770,   365,   659,
     421,   421,  -477,  -477,  -477,  -757,    28,   759,   515,   132,
    -757,    32,   743,   744,   660,   622,   759,  -757,    38,  1771,
    1538,    98,  1924,  1925,  1543,  1505,  1547,  -207,   830,   831,
    1552,  -207,  1319,  1528,   363,   180,   678,  1981,   892,  1983,
    -757,  1985,  1781,  -874,   681,   353,   557,  1212,  -874,  -757,
    1096,  1097,  1098,  1573,    28,  -874,  1703,  1195,  1199,    32,
    1573,   446,  1707,  1709,  1904,  -892,    38,   132,  -475,   736,
     686,  1396,  1719,   722,   841,  1278,  1397,   832,   687,  2008,
    2009,   688,  2011,   723,  1640,  1261,  1265,  1563,   681,   737,
     738,   721,   884,  1651,  -663,  -973,   484,  -973,  2018,   835,
     838,  -476,   958,   835,   838,     1,     1,    97,    97,  1584,
     745,   746,     1,  1155,  2028,  -477,  1888,   609,   609,   609,
     609,  -754,  1321,  1667,  1413,  1419,  1423,  -207,   892,   770,
    1669,  -207,   771,  -207,   612,   681,   892,  -207,  -892,   681,
    1596,   405,   405,  -892,  1398,   724,  1670,  1855,  1216,  1399,
    -892,  1854,   892,   869,   807,  1099,   999,   813,   557,   561,
    1059,  1063,   728,  1100,  1301,  -663,  1101,   405,   405,    43,
    -663,   749,   774,  1672,    26,  -652,  1282,  -663,  1761,  -892,
    -892,  -892,   557,   508,   770,  1834,    83,  1196,  1200,   405,
     405,   770,  -754,   750,   405,   405,   756,  -754,   405,   405,
    -663,  1183,  1185,  -663,  -754,   751,   885,  1845,   883,  -663,
     752,   129,   130,   770,   365,  1262,  1266,   365,   129,   130,
    1622,  1623,  1533,   764,  1626,   132,   405,  -754,   405,   759,
     759,  1247,  1249,  1180,  1182,  -760,  -754,     1,  1287,   765,
    1301,  1676,  1301,  1678,  1943,   925,  -652,   793,  1944,  1893,
    1305,  -652,  1945,   363,  1898,   770,  1313,  1317,  -652,  1643,
     770,   163,  1509,  1244,  1246,   719,   720,  1916,   112,   112,
      83,  1184,  1186,   770,  1653,   132,   767,   255,    83,   365,
    1961,  -652,   605,   220,  -652,   605,   770,  1673,  1603,   883,
    -652,  1627,  1604,  1615,   365,  1745,   112,  1604,   112,  1746,
     112,  1248,  1250,   132,   814,   449,  -760,     1,    28,  1866,
    1753,  -760,  1757,    32,  1604,   363,  1604,   136,  -760,   137,
      38,   421,   421,   605,   741,   742,  1675,  1675,  1675,  1675,
    1996,  1959,  2002,   739,   740,  1960,  1944,   605,   605,   605,
     605,  -760,   815,    43,  2004,   823,    44,  1361,  1944,  2019,
    -760,  2020,  1662,  1944,   140,  1944,   141,   604,   604,   604,
     604,   833,  1693,  2024,  1419,  1423,  1692,  1944,   458,   873,
    1704,  1419,  1423,    18,    19,  1419,  1423,   880,  2030,  1986,
    1073,  1074,  1944,  1944,   456,   881,   511,  1987,   469,   882,
     674,   674,   674,   674,   674,   674,   674,   674,   883,   583,
     583,   824,   825,    28,    29,   747,   748,  1015,    32,   583,
    1015,   886,  2005,  1015,   930,    38,  1944,  1496,    18,    19,
    2006,  1015,  1855,   826,  1015,  1999,  1854,   827,   938,   828,
     163,  2021,  1515,  1516,  1517,  1944,   836,   839,  1363,  2022,
     620,  1029,   255,  -648,  -647,  -648,  -647,  1034,    28,    29,
     829,  1348,  1350,    32,   464,   489,   492,   490,   490,   365,
      38,   931,   836,   839,   936,   365,     1,   932,   995,  1939,
     490,  1942,  1159,   681,     1,  1038,  1389,  1070,  1166,   125,
       1,  1349,  1351,    43,   836,   839,  1729,   926,   928,   836,
     839,   939,  1837,   836,   839,   363,   967,  1226,   180,     1,
     973,   363,  1743,   979,   365,   365,   985,   365,   365,   994,
      18,    19,   365,   365,   365,   365,  1231,   609,     1,  1137,
     609,  1790,  1791,   438,   365,   365,   365,   365,   365,   365,
     365,   365,   993,  1978,   365,   438,  1365,   996,  1366,   438,
      28,    29,  1409,   921,  1410,    32,   927,   929,   835,   838,
    1000,  1772,    38,  1775,   681,  1292,  1491,  1453,   609,  1537,
    1846,     1,  1849,   791,  1542,  1001,     1,  1784,  1786,  1546,
     363,     1,   609,   609,   609,   609,  1002,   112,  1490,   112,
    1551,  1020,     1,  1645,  1857,  1366,  1859,  1022,  1666,   112,
    1366,  1407,   515,  1408,   681,  1681,  1732,  1684,  1023,  1482,
     674,   421,  1682,   421,  1685,  1052,  1054,   405,   257,   260,
     851,  1053,  1055,  1059,  1063,  1059,  1063,  1299,  1300,  1031,
    1032,  1035,  1071,  1143,  1036,   421,  1037,   421,  1076,   548,
    1104,  1322,  1155,   557,  1323,  1340,  1333,  1334,  1335,  1385,
    1015,  1015,  1015,  1015,  1347,  1378,   583,  1380,  1440,  1400,
    1015,  1015,  -740,  1015,  -743,  1015,  1441,  1405,  1442,  1492,
    1461,  1847,  1443,  1850,   405,   405,  1444,  1015,   405,   405,
    1445,   365,   648,  1462,  1469,  1470,  1034,  1483,   648,  1509,
    1500,  1484,  1485,  1419,  1423,  1858,  1487,  1860,  1501,  1506,
    1502,  1524,   373,  1526,  1570,  1301,  1301,  1529,  1536,  1555,
    1564,  1997,  1565,  1568,  1571,  1105,  1586,   363,  1581,   495,
    1582,   689,   690,   691,   692,   693,   694,   695,   696,   697,
     698,  1583,  1585,  1589,  1593,   667,  1605,  1598,   170,  1650,
    1654,  1611,  1614,  1619,   365,  1621,  1881,  1922,  1881,  1998,
    1631,  1633,  1635,  1637,  1665,  1165,  1698,  1671,  1699,  1700,
    1701,  1702,  1726,  1730,   605,   605,  1744,   604,  1720,  1902,
     604,  1721,  1747,  1748,   605,  1750,  1751,  1754,   548,  1910,
    1760,  1762,  1763,  1764,   787,  1777,   421,   421,   421,   421,
     421,  1675,  1675,  1832,  -232,  1765,   787,   421,   421,   421,
     421,  1165,   405,   405,  1766,  1778,  1788,  1015,   604,  1782,
    1783,  1991,  1992,  1836,  1840,  1841,   583,  1848,   583,   699,
     620,  1843,   604,   604,   604,   604,  1844,  1034,  1509,  1851,
    1852,  1868,  1882,  1894,  1918,  1920,  1895,  1887,  1912,  1896,
      49,  1927,  1525,  1928,  1913,  1897,  1899,  1914,  1923,   879,
    1900,  1906,  1907,  1908,  1909,  1915,  1951,  1958,  1964,  1962,
    1963,  1967,   421,   421,  1968,  1969,  1974,  1015,  1015,  1979,
    1984,  1015,  1995,  1015,  2003,  2007,  1015,  2010,  2015,  2016,
     583,   105,  2017,  2025,  1419,  1423,  2026,  2027,  2029,  2031,
    1881,    49,  1881,   864,  1509,   865,  1034,   866,   134,   867,
    1034,   870,  1306,  1401,  2012,  1658,   617,  1130,   618,   631,
     633,  1390,  1430,  1015,   636,    49,   800,  1372,    49,  1905,
     552,   857,  1980,   221,    49,   667,   654,   256,   245,   598,
     247,    49,    49,   259,   249,  1034,  1509,  1831,     0,     0,
       0,  1015,     0,     0,    49,    58,     0,   344,     0,     0,
    1881,  1881,  1034,  1881,     0,  1881,     0,     0,     0,   356,
       0,     0,     0,     0,   393,   221,     0,   393,     0,   836,
     839,     0,     0,   836,   839,  1663,     0,   221,     0,   221,
     393,   221,   393,     0,   393,     0,  1330,     0,   921,     0,
       0,     0,     0,  1881,  1881,     0,  1881,     0,     0,   609,
     609,     0,     0,   221,     0,     0,     0,     0,     0,   609,
     393,   605,  1881,   835,   838,     0,   835,   838,     0,     0,
      58,     0,   501,     0,   835,   838,   835,   838,  1881,    58,
       0,    49,   423,     0,     0,   423,    58,    58,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   423,     0,
     423,     0,   423,     0,     0,     0,     0,     0,  1111,  1121,
       0,     0,  1111,  1121,     0,     0,     0,     0,   851,     0,
     436,   221,     0,     0,   221,   221,   356,     0,     0,     0,
       0,     0,   436,     0,    49,     0,   436,     0,     0,   835,
     838,     0,     0,     0,    49,   221,    49,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1514,
    1428,     0,    46,  1519,   221,     0,  1521,     0,  1523,     0,
     221,     0,     0,   405,   405,     0,     0,     0,   393,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1165,     0,     0,     0,     0,     0,  1165,     0,
       0,   605,     0,   605,  1773,     0,  1776,     0,     0,     0,
       0,     0,     0,    49,     0,     0,     0,   150,  1686,    58,
    1785,  1787,     0,     0,     0,     0,    46,  1328,     0,    58,
       0,    58,     0,    46,    46,     0,     0,     0,  1328,     0,
     221,     0,   356,   221,     0,     0,   221,    49,    68,     0,
       0,     0,     0,   794,     0,     0,     0,    49,   221,     0,
      49,     0,     0,     0,     0,   605,     0,     0,     0,   604,
     604,     0,     0,     0,     0,     0,   609,     0,     0,   604,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   393,
     393,     0,     0,     0,    49,    49,     0,     0,     0,     0,
       0,   393,     0,     0,     0,     0,   874,     0,     0,     0,
       0,   221,     0,     0,     0,   393,   393,     0,     0,     0,
       0,     0,     0,    68,     0,     0,     0,     0,     0,     0,
       0,     0,    68,   510,     0,     0,     0,   393,   393,    68,
      68,     0,   393,   393,     0,     0,   393,   393,   356,     0,
       0,   436,   548,     0,     0,   221,   113,   423,   423,     0,
       0,     0,     0,   436,     0,     0,     0,     0,     0,    49,
       0,     0,     0,   439,   393,     0,   393,    49,   393,     0,
       0,     0,     0,   423,   423,   439,   150,   113,   113,   439,
       0,     0,     0,     0,    49,     0,   150,    49,    46,    49,
       0,    49,     0,     0,     0,   423,   423,    49,     0,     0,
     423,   423,  1903,     0,   423,   423,   436,     0,     0,     0,
       0,     0,  1911,     0,     0,     0,     0,     0,   348,   113,
       0,     0,     0,   405,     0,   405,   609,     0,   609,     0,
       0,     0,   423,     0,   423,     0,     0,     0,   836,   839,
       0,     0,     0,     0,     0,     0,     0,   405,     0,   405,
       0,     0,     0,     0,     0,     0,     0,   356,   356,   356,
     356,     0,   348,   113,     0,     0,     0,  1919,  1921,     0,
       0,     0,     0,   268,     0,     1,   269,    97,     0,     0,
     221,   221,    68,     0,    49,     0,     0,     0,     0,   393,
     609,     0,    68,   113,    68,     0,     0,     0,     0,     0,
       2,     0,     0,   221,     0,     0,   604,     0,     0,     0,
     221,   221,   393,     0,   221,   221,     0,     0,     0,     0,
       0,     0,   921,     0,     0,     0,     0,     0,     0,    49,
       0,   548,   356,   113,     0,     0,     0,   273,   356,   320,
       0,   356,     0,   274,   275,     0,   113,     0,     0,     0,
       0,  1577,     0,     0,     0,     0,   510,   278,  1577,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,     0,     0,     0,   638,     0,     0,     0,     0,    58,
       0,     0,     0,     0,   290,   291,     0,     0,   405,   405,
     405,   405,   405,     0,     0,     0,     0,     0,     0,   405,
     405,   405,   405,     0,   439,     0,     0,     0,     0,     0,
      49,     0,     0,    49,    49,    49,   439,   356,     0,     0,
     356,   356,     0,     0,    49,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   221,
      49,     0,   113,     0,   348,     0,     0,    49,     0,     0,
     221,     0,   393,     0,    49,     0,   604,     0,   604,     0,
       0,     0,   586,     0,   405,   405,     0,     0,     0,   439,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   113,     0,  1794,     0,     0,     0,     0,  1519,     0,
       0,  1523,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    49,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   848,   677,     0,     0,
     604,     0,    49,   356,     0,     0,     0,     0,     0,     0,
     221,   221,     0,     0,     0,   393,     0,     0,     0,     0,
     423,   423,   221,     0,   436,     0,   150,     0,     0,     0,
       0,  1078,     0,     0,     0,   436,   356,   221,   356,     0,
       0,     0,     0,     0,   221,     0,     0,     0,     0,   921,
       0,     0,   113,     0,   348,     0,     0,     0,     0,     0,
       0,     0,   113,   113,     0,     0,     0,     0,     0,     0,
       0,     0,   393,   393,     0,     0,   393,   393,     0,   113,
       0,   113,     0,   423,     0,     0,     0,     0,     0,   348,
       0,   113,    49,   393,     0,     0,     0,    49,     0,     0,
       0,     0,     0,    49,     0,     0,     0,     0,     0,    49,
       0,     0,     0,     0,     0,    49,     0,     0,     0,     0,
       0,     0,   348,     0,   356,     0,     0,     0,     0,     0,
       0,     0,    68,     0,     0,     0,     0,     0,     0,   921,
     423,   423,     0,     0,   423,   423,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,   510,   836,   839,     0,   836,   839,     0,     0,
       0,     0,     0,     0,   836,   839,   836,   839,     0,     0,
       0,     0,   356,   356,   356,   356,     0,     0,     0,     0,
     920,     0,   510,     0,     0,     0,     0,     0,   116,   510,
     393,   393,   221,     0,     0,     0,   510,    49,     0,     0,
       0,     0,     0,     0,     0,     0,    49,     0,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   160,
     116,     0,     0,   221,   356,    49,   203,     0,    80,   836,
     839,     0,   990,     0,     0,    80,    80,     0,     0,     0,
       0,     0,     0,   221,     0,     0,     0,   510,     0,     0,
     221,     0,     0,     0,   921,     0,     0,     0,   423,   423,
       0,   352,   354,   586,   510,     0,   221,   356,   427,     0,
       0,   427,     0,   221,   356,     0,     0,   221,   356,     0,
       0,     0,     0,    74,   427,     0,   427,   439,   427,     0,
       0,     0,    74,   586,   586,   586,   586,     0,   439,    74,
      74,     0,     0,     0,     0,   482,   354,     0,     0,     0,
       0,     0,     0,     0,   921,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   440,     0,   517,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   440,     0,     0,     0,   440,
       0,     0,  1131,     0,     0,     0,  1135,     0,     0,  1337,
       0,     0,     0,     0,   113,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   550,     0,     0,     0,     0,
       0,     0,   677,     0,     0,     0,     0,     0,   160,     0,
       0,     0,     0,   675,     0,     0,  1171,     0,    80,     0,
      80,     0,     0,     0,   113,     0,     0,     0,   702,     0,
       0,  1367,  1369,     0,     0,     0,     0,   113,     0,    49,
      49,     0,     0,  1225,   113,     0,     0,     0,   677,     0,
       0,  1236,     0,     0,   848,     0,     0,     0,     0,     0,
     356,     0,     0,   356,     0,     0,     0,     0,     0,     0,
       0,  1289,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    74,     0,    74,     0,     0,     0,     0,  1527,
       0,     0,     0,   191,     0,     0,   848,     0,  1530,     0,
       0,     0,     0,     0,   356,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   352,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   356,     0,     0,     0,   555,
       0,   393,   393,     0,   775,     0,   221,   221,   221,   221,
       0,   427,     0,   113,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   116,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,   427,   427,     0,     0,     0,   849,     0,
       0,     0,   861,     0,   216,   427,    49,     0,     0,   423,
     423,     0,    28,    29,   788,   221,   356,    32,     0,   427,
     427,     0,     0,   217,    38,   218,   788,  -475,  -475,  -475,
    -475,  -475,  -475,  -475,  -475,  -475,  -475,  -475,   219,     0,
       0,   427,   427,     0,     0,   920,   427,   427,     0,     0,
     427,   427,     0,     0,   352,     0,     0,   220,     0,     0,
       0,     0,     0,     0,   116,   116,     0,     0,     0,     0,
       0,     0,     0,     0,   221,     0,     0,     0,   427,   788,
     427,   517,     0,   116,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   352,     0,   354,     0,     0,     0,     0,
       0,     0,     0,     0,  1025,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   356,     0,     0,    49,     0,
       0,   356,     0,   586,     0,     0,   586,     0,     0,     0,
    -475,  -475,     0,     0,     0,   586,     0,     0,     0,    49,
    -475,     0,     0,     0,     0,  -475,  -475,  -475,     0,  -475,
    -475,  -475,  -475,  -475,     0,     0,     0,  1507,  1508,     0,
       0,     0,     0,     0,   586,     0,  1171,     0,   760,     0,
    1518,     0,     0,  1236,     0,  1522,     0,     0,   586,   586,
     586,   586,     0,     0,     0,   231,     0,     0,     0,     0,
     356,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,   790,     0,     0,     0,   221,   356,     0,     0,
       0,     0,   797,     0,     0,   804,     0,     0,   675,   677,
     703,   393,     0,   393,  1113,   677,     0,     0,  1113,     0,
       0,     0,  1170,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   775,     0,   393,     0,   393,     0,     0,
     855,  1193,  1197,  1201,  1205,  1209,   872,     0,  1218,  1224,
       0,     0,    74,     0,   675,   231,     0,  1235,     0,     0,
       0,     0,     0,     0,     0,     0,  1600,     0,   510,  1259,
    1263,  1267,  1271,  1275,     0,     0,  1218,  1288,     0,   423,
       0,   423,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1218,  1218,     0,     0,     0,     0,
       0,     0,     0,   423,     0,   423,     0,     0,     0,     0,
       0,     0,     0,   335,   191,     0,     0,   356,     0,   393,
    1646,  1648,   191,     0,     0,     0,   231,   231,   231,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   775,   191,
       0,     0,   191,     0,   191,     0,   191,   231,  1337,     0,
    1660,     0,  1661,   775,   427,     0,     0,     0,     0,     0,
       0,  1338,     0,     0,   775,     0,   550,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     496,     0,     0,     0,     0,     0,   393,   393,   393,   393,
     393,   221,   221,     0,     0,     0,     0,   393,   393,   393,
     393,     0,     0,     0,     0,   422,   116,     0,   422,     0,
       0,     0,     0,     0,  1370,     0,     0,   788,     0,   517,
       0,   422,     0,   422,     0,   422,   116,     0,   788,     0,
       0,     0,     0,     0,     0,     0,   849,     0,   113,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   427,
       0,     0,     0,     0,   423,   423,   423,   423,   423,     0,
       0,     0,   393,   393,     0,   423,   423,   423,   423,     0,
       0,     0,     0,     0,     0,     0,  1026,     0,   849,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   335,     0,     0,     0,     0,   427,   427,     0,     0,
     427,   427,     0,     0,     0,     0,     0,   584,     0,     0,
       0,     0,     0,   354,     0,   352,     0,     0,     0,     0,
     423,   423,     0,     0,  1025,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   920,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1170,     0,     0,     0,     0,     0,     0,  1235,
     914,     0,     0,     0,     0,     0,     0,   231,   760,   760,
     760,     0,     0,     0,     0,   586,   586,     0,     0,   191,
    1162,     0,     0,   586,     0,   586,   586,     0,     0,   586,
       0,     0,     0,     0,     0,     0,     0,   586,     0,     0,
     586,     0,     0,     0,     0,   675,     0,     0,     0,     0,
       0,   675,     0,  1194,  1198,  1202,  1206,  1210,     0,  1838,
    1219,  1839,     0,     0,   427,   427,  1162,     0,     0,     0,
       0,  1646,     0,     0,     0,     0,     0,     0,     0,     0,
     775,  1260,  1264,  1268,  1272,  1276,     0,     0,  1219,     0,
       0,     0,     0,     0,     0,     0,     0,   775,     0,  1113,
       0,     0,  1599,     0,     0,     0,  1219,  1219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1113,   913,   231,
     231,   231,   231,     0,  1113,     0,     0,   920,     0,     0,
     422,   422,     0,     0,     0,     0,     0,     0,     0,  1792,
       0,     0,   231,   231,     0,     0,   404,     0,   496,   404,
    1600,     0,     0,     0,     0,  1518,   422,   422,  1522,     0,
       0,     0,   404,     0,   404,  1103,   404,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   335,     0,   422,   422,
       0,     0,     0,   422,   422,     0,     0,   422,   422,   911,
       0,     0,     0,     0,   914,     0,     0,     0,     0,     0,
     914,     0,   496,   914,     0,     0,     0,   191,     0,     0,
       0,     0,   191,     0,     0,   422,     0,   422,  1456,     0,
       0,     0,     0,     0,  1456,     0,     0,     0,     0,     0,
     191,     0,     0,     0,     0,     0,   920,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   586,   586,   586,   586,
       0,   368,   586,     0,     0,     0,   586,   586,     0,   586,
       0,   586,     0,     0,     0,     0,     0,     0,   584,     0,
       0,     0,     0,   586,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1889,  1890,     0,   335,     0,     0,     0,
     335,     0,     0,     0,     0,     0,     0,     0,   584,   584,
     584,   584,   913,     0,     0,     0,     0,     0,   913,     0,
       0,   913,     0,     0,     0,     0,   920,     0,     0,     0,
       0,     0,     0,  1649,     0,     0,     0,     0,     0,     0,
     335,     0,     0,     0,     0,     0,  1488,     0,     0,     0,
     191,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1659,     0,     0,     0,     0,     0,     0,   335,     0,     0,
       0,     0,     0,     0,  1513,   335,     0,     0,     0,     0,
       0,  1520,     0,   911,     0,   427,   427,     0,     0,   911,
       0,     0,   911,     0,     0,   335,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   368,     0,
       0,     0,     0,   586,     0,     0,     0,   368,     0,     0,
       0,     0,   586,   368,   586,     0,     0,  1162,   914,   914,
     914,     0,     0,  1162,     0,     0,     0,     0,     0,     0,
       0,   404,   404,     0,     0,     0,     0,     0,     0,     0,
     517,   920,     0,   868,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   404,   404,     0,
       0,     0,     0,   586,   586,     0,     0,   586,     0,   586,
       0,   913,   586,     0,   496,     0,   586,     0,     0,   404,
     404,     0,  1982,     0,   404,   404,     0,     0,   404,   404,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     920,   920,     0,     0,   368,     0,   914,     0,     0,   586,
       0,     0,   496,     0,     0,     0,   404,     0,   404,     0,
       0,     0,     0,   422,   422,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   760,   760,   913,   586,   913,     0,
       0,     0,     0,     0,     0,     0,  1599,     0,     0,     0,
       0,  1795,  1797,  1801,  1805,  1807,  1811,     0,     0,     0,
    1815,  1819,  1823,  1827,   231,   231,   231,   231,     0,     0,
       0,     0,  1797,  1801,  1807,  1811,  1815,  1819,  1823,  1827,
       0,     0,     0,     0,   231,     0,   422,     0,     0,     0,
       0,     0,     0,   496,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   911,     0,   911,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   913,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   496,     0,     0,     0,     0,
       0,     0,     0,   422,   422,     0,     0,   422,   422,     0,
       0,     0,     0,     0,     0,   427,     0,   427,   914,   914,
       0,   335,   335,     0,     0,   914,   914,     0,     0,   914,
     914,     0,     0,     0,     0,     0,     0,     0,     0,   427,
       0,   427,     0,     0,     0,     0,     0,     0,   354,     0,
       0,     0,     0,   305,     0,   911,     0,     0,   584,     0,
       0,   584,     0,     0,     0,     0,     0,     0,     0,   364,
     584,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   496,     0,     0,   584,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   584,   584,   584,   584,   368,   496,     0,
     364,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   422,   422,     0,     0,     0,     0,   913,     0,     0,
     335,     0,     0,     0,   913,     0,     0,     0,   913,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   191,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     427,   427,   427,   427,   427,     0,     0,     0,     0,     0,
       0,   427,   427,   427,   427,     0,     0,     0,   911,     0,
       0,     0,     0,     0,     0,   911,   364,     0,     0,   911,
       0,   639,   641,     0,     0,   364,     0,     0,     0,     0,
       0,   364,     0,     0,     0,     0,   914,     0,     0,     0,
       0,   305,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   364,   404,     0,   368,
       0,   364,   368,   368,     0,     0,   427,   427,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1793,     0,
       0,     0,     0,  1796,  1798,  1802,  1806,  1808,  1812,     0,
       0,     0,  1816,  1820,  1824,  1828,     0,     0,     0,     0,
       0,     0,     0,     0,   404,   404,     0,     0,   404,   404,
       0,     0,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   914,   914,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   913,     0,     0,     0,     0,     0,
       0,   496,     0,     0,     0,   368,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   913,     0,
     913,     0,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   913,     0,     0,
       0,     0,     0,     0,     0,   911,     0,     0,   364,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,   404,   404,     0,     0,   274,   275,   276,    28,
       0,     0,   422,   422,    32,     0,   913,     0,   364,   277,
     278,    38,     0,     0,     0,     0,     0,     0,     0,   911,
       0,   911,  1017,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   801,     0,   305,   802,   661,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,  1056,  1060,     0,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   911,   914,   914,
     584,   584,     0,     0,     0,     0,     0,     0,   584,     0,
     584,   584,     0,     0,   584,     0,     0,     0,     0,     0,
       0,     0,   584,     0,     0,   584,     0,     0,     0,     0,
     496,     0,   496,     0,     0,     0,     0,     0,     0,     0,
       0,   335,     0,     0,     0,   364,   496,   496,     0,  1080,
       0,     0,     0,   335,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   368,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   305,     0,     0,     0,
     305,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,   364,     0,
       0,   364,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   913,     0,     0,
     305,     0,     0,     0,     0,     0,   364,   364,   364,   364,
     364,   364,   364,     0,     0,   364,   364,     0,   364,   364,
     364,   364,   364,   364,   364,   364,     0,   305,     0,     0,
       0,     0,     0,     0,     0,   305,   364,   364,   364,   364,
     364,   364,   364,   364,   364,   364,   364,   364,   364,   364,
     364,   364,   364,   364,     0,   305,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,   911,     0,
     364,   364,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   422,     0,   422,     0,     0,   335,   335,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   422,     0,   422,     0,
       0,     0,     0,   404,   404,     0,     0,     0,   496,     0,
       0,   584,   584,   584,   584,     0,     0,   584,   496,     0,
       0,   584,   584,     0,   584,     0,   584,     0,     0,     0,
       0,   364,     0,     0,   364,     0,     0,     0,   584,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,   368,     0,     0,     0,     0,
       0,     0,     0,   364,     0,     0,     0,     0,     0,     0,
       0,     0,   364,   496,   496,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     323,     0,     0,     0,     0,     0,   364,     0,   364,     0,
       0,     0,     0,     0,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   368,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1467,     0,     0,  1471,     0,   422,   422,   422,
     422,   422,     0,   364,  1486,     0,     0,   367,   422,   422,
     422,   422,     0,     0,     0,     0,     0,     0,   584,     0,
       0,     0,     0,     0,     0,     0,   335,   584,     0,   584,
       0,     0,     0,  1510,   364,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   335,   364,     0,  1056,  1060,  1056,
    1060,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   305,   305,   422,   422,     0,     0,     0,   584,   584,
       0,     0,   584,     0,   584,     0,     0,   584,     0,     0,
       0,   584,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   367,     0,     0,     0,     0,   640,   642,
       0,     0,   367,     0,     0,     0,     0,     0,   367,     0,
       0,     0,     0,     0,   584,     0,     0,     0,   323,     0,
       0,     0,     0,   404,     0,   404,     0,     0,     0,     0,
       0,     0,     0,   367,   364,     0,   364,   368,   367,     0,
       0,     0,   584,   368,     0,     0,     0,   404,     0,   404,
       0,     0,   268,     0,     1,   269,    97,   270,   364,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   364,     0,     0,     0,   364,     0,     2,
     305,     0,  1800,  1804,   364,  1810,  1814,     0,   364,     0,
    1818,  1822,  1826,  1830,     0,     0,     0,     0,     0,   367,
       0,     0,   368,   368,   368,   368,   368,   368,   368,   368,
       0,     0,   368,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   277,   278,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1048,   289,     0,     0,  1049,     0,
       0,     0,     0,   290,   291,  1607,   292,   293,   294,   295,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   404,   404,
     404,   404,   404,     0,     0,   367,     0,     0,     0,   404,
     404,   404,   404,    78,    78,     0,     0,     0,    78,     0,
      78,     0,    78,     0,     0,     0,     0,     0,     0,    78,
      78,     0,     0,     0,     0,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   368,
     364,     0,     0,   364,    78,    78,     0,     0,     0,     0,
       0,     0,     0,   323,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   404,   404,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   367,
       0,     0,     0,     0,   364,     0,     0,     0,    78,    78,
       0,   364,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   368,     0,     0,   364,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
     364,     0,     0,     0,     0,     0,     0,     0,   364,    78,
     364,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   367,     0,  1706,  1708,  1081,   364,     0,     0,
       0,     0,  1715,     0,  1718,  1467,     0,     0,  1471,    78,
       0,     0,     0,     0,     0,     0,  1510,     0,     0,  1731,
       0,     0,    78,   323,     0,     0,     0,   323,     0,     0,
       0,     0,    78,     0,    78,     0,   364,     0,     0,   367,
       0,     0,     0,     0,     0,   367,     0,     0,   367,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   323,     0,     0,
       0,     0,     0,   367,   367,   367,   367,   367,   367,   367,
       0,     0,   367,   367,     0,   367,   367,   367,   367,   367,
     367,   367,   367,     0,   323,     0,     0,     0,     0,     0,
       0,     0,   323,   367,   367,   367,   367,   367,   367,   367,
     367,   367,   367,   367,   367,   367,   367,   367,   367,   367,
     367,     0,   323,     0,     0,     0,     0,     0,    78,     0,
      78,     0,     0,     0,   367,   364,     0,   367,   367,     0,
     364,   364,   364,     0,     0,     0,     0,     0,     0,     0,
       0,   305,     0,     0,     0,     0,   364,   364,     0,     0,
       0,     0,     0,   305,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     364,   364,     0,   364,   364,     0,     0,     0,   364,   364,
     364,   364,     0,     0,     0,     0,     0,     0,     0,     0,
     364,   364,   364,   364,   364,   364,   364,   364,   367,     0,
     364,   367,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   364,     0,     0,
       0,     0,     0,     0,     0,  1861,  1862,  1863,  1864,     0,
     367,  1865,     0,     0,     0,  1706,  1708,     0,  1715,   367,
    1718,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      78,     0,  1874,     0,     0,     0,     0,     0,    78,    78,
       0,     0,     0,   367,     0,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,    78,     0,     0,
       0,     0,     0,     0,     0,    78,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,     0,     0,     0,   305,   305,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     367,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   159,   114,     0,   364,   364,   200,
       0,   202,     0,     0,     0,     0,     0,     0,   364,     0,
       0,   367,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   367,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   349,   114,     0,     0,     0,
       0,     0,  1865,     0,     0,     0,     0,     0,   323,   323,
       0,  1938,    78,  1941,     0,     0,     0,     0,     0,     0,
     364,     0,     0,   364,   364,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   479,
     481,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    66,     0,
       0,     0,  1970,  1971,     0,     0,  1938,     0,  1941,     0,
     114,  1975,     0,     0,     0,  1977,     0,     0,     0,     0,
     534,   367,   535,   367,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   108,     0,     0,     0,   367,     0,     0,  1977,     0,
     114,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     367,     0,     0,   159,   367,     0,   305,   323,     0,     0,
       0,   367,     0,   157,     0,   367,  2014,     0,     0,     0,
       0,   227,    66,     0,   305,     0,     0,     0,     0,    66,
      66,     0,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,   346,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   227,     0,     0,
       0,     2,     0,   437,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,   437,     0,   227,     0,   437,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,   227,     0,     0,   274,   275,   276,     0,     0,   114,
      78,   349,     0,     0,     0,     0,     0,   277,   278,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,   514,
      78,   279,     0,     0,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1048,   289,   114,     0,
    1612,     0,     0,     0,  1613,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     1,     0,     0,     0,     0,   547,
       0,     0,   227,   227,   227,     0,     0,   367,     0,     0,
     367,     0,   157,     0,     0,     0,   200,   202,     0,     2,
       0,     0,   157,   227,    66,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,   647,     0,     0,     0,     0,     0,   647,     0,
       0,   367,     0,     0,     0,     0,   666,    27,   367,    78,
       0,     0,     0,     0,     0,    28,    29,     0,     0,   917,
      32,   918,   367,    35,    36,     0,    37,    38,    39,   114,
     114,     0,     0,     0,     0,     0,     0,   367,     0,     0,
       0,    40,     0,     0,     0,   367,   114,   367,   114,     0,
       0,     0,     0,     0,     0,     0,   349,     0,   114,     0,
       0,     0,     0,     0,   367,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   547,   349,
     227,   227,     2,     0,   786,     0,     0,     0,     0,     0,
       0,     0,     0,   367,     0,     0,   786,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1005,  1006,  1007,   565,
    1008,  1009,  1010,  1011,   570,   571,  1012,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,     0,     0,
       0,     0,   514,  1013,     0,     0,     0,     0,   277,   278,
    1014,     0,   575,   576,   577,     0,     0,     0,     0,   878,
       0,     0,   279,     0,     0,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  -470,   289,   578,
       0,  -470,     0,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,   227,     0,     0,     0,
       0,     0,   367,   227,     0,     0,     0,   367,   367,   367,
       0,     0,     0,     0,     0,     0,     0,     0,   323,     0,
       0,     0,     0,   367,   367,     0,     0,     0,     0,     0,
     323,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   367,   367,     0,
     367,   367,     0,     0,     0,   367,   367,   367,   367,     0,
       0,     0,     0,     0,     0,     0,     0,   367,   367,   367,
     367,   367,   367,   367,   367,     0,     0,   367,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1030,     0,   367,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   227,   227,   227,   227,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   227,   227,
       0,   114,   157,     0,     0,     0,     0,  1083,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   227,     0,     0,     0,     0,     0,     0,  1110,  1120,
     666,     0,  1110,  1120,     0,     0,     0,     0,     0,     0,
       0,   114,     0,     0,   323,   323,     0,  1139,   200,   202,
     227,     0,     0,     0,   114,     0,   227,     0,   534,   227,
     535,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   367,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   367,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   367,   514,     0,
     367,   367,     0,     0,     0,   227,     0,     0,   227,   227,
       0,     0,   224,     0,     0,     0,     0,     0,   435,     0,
     114,     0,     0,     0,    78,     0,     0,  1327,   514,     0,
     435,     0,   224,     0,   435,   514,     0,     0,  1327,   108,
     666,     0,   514,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   512,     0,     0,     0,     0,     0,
       0,     0,     0,   514,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   323,     0,     0,     0,     0,     0,     0,
     514,   227,     0,     0,     0,     0,     0,     0,   227,   227,
       0,   323,     0,     0,   545,     0,     0,   224,   224,   224,
     227,     0,     0,     0,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   227,   227,   227,     0,   224,     0,
       0,     0,   547,     0,   226,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,   645,     0,     0,
       0,     0,     0,   645,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     226,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,     0,     0,     0,
     226,     0,     0,     0,     0,     0,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,   227,     0,   226,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1048,   289,     0,     0,
    1049,     0,  1030,     0,     0,   290,   291,  1617,   292,   293,
     294,   295,   513,   545,     0,   224,   224,     0,     0,   785,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   785,     0,     0,     0,     0,     0,     0,     0,     0,
     227,   227,   227,   227,     0,     0,     0,     0,     0,     0,
       0,     0,   546,     0,     0,   226,   226,   226,     0,     0,
     227,     0,     0,     0,     0,     0,     0,   512,     0,     0,
       0,     0,     0,     0,  1532,     0,   226,     0,     0,     0,
       0,     0,     0,     0,   877,     0,     0,     0,     0,     0,
       0,   547,   227,     0,     0,   646,     0,     0,     0,     0,
     268,   646,     1,   269,    97,   270,     0,   271,   272,   665,
       0,  1576,     0,     0,     0,     0,     0,     0,  1576,     0,
       0,   224,     0,     0,     0,     0,     0,     2,   224,     0,
       0,     0,     0,     0,   227,   227,     0,     0,     0,     0,
       0,   227,   227,     0,     0,   227,   227,     0,     0,     0,
       0,  1005,  1006,  1007,   565,  1008,  1009,  1010,  1011,   570,
     571,  1012,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,     0,     0,     0,     0,   534,  1013,   535,
       0,     0,     0,   277,   278,  1014,     0,   575,   576,   577,
       0,   546,     0,   226,   226,     0,     0,   279,     0,     0,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1048,   289,   578,     0,  1049,     0,   220,     0,
     579,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     224,   224,   224,   224,     0,   513,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   224,   224,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   224,     0,     0,     0,
       0,     0,     0,  1108,  1118,     1,     0,  1108,  1118,   226,
       0,     0,     0,     0,     0,     0,   226,     0,   227,     0,
       0,   227,     0,     0,     0,   224,     0,     0,     0,     0,
       2,   224,     0,     0,   224,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   227,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,   227,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,   227,   227,   227,   227,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,   512,   774,     0,     0,     0,     0,     0,
     224,     0,     0,   224,   224,   508,     0,     0,   226,   226,
     226,   226,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1326,   512,     0,     0,     0,     0,     0,     0,
     512,   226,   226,  1326,   514,     0,     0,   512,     0,     0,
    1082,     0,     0,   227,   227,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   226,     0,     0,     0,     0,     0,
       0,  1109,  1119,   665,     0,  1109,  1119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1138,     0,     0,   226,     0,     0,     0,     0,   512,   226,
       0,     0,   226,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   227,     0,     0,   512,   224,     0,     0,     0,
       0,     0,     0,   224,   224,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   224,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   224,
     224,   224,     0,   227,     0,     0,     0,   545,     0,   227,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   666,     0,     0,
       0,   513,     0,     0,     0,     0,     0,     0,   226,     0,
       0,   226,   226,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   513,     0,     0,     0,     0,     0,     0,   513,     0,
       0,     0,     0,   665,     0,   513,     0,     0,   227,     0,
       0,     0,     0,     0,     0,     0,     0,   224,     0,     0,
       0,     0,     0,     0,   227,   227,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   229,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   513,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   229,   513,   226,   224,   224,   224,   224,     0,
       0,   226,   226,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   229,   226,     0,   224,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   226,   226,   226,
       0,     0,     0,     0,     0,   546,   229,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   545,   224,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   516,   227,  1574,   666,     0,     0,
       0,     0,     0,  1574,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   224,
     224,     0,     0,     0,     0,     0,   224,   224,     0,     0,
     224,   224,     0,     0,   549,     0,     0,   229,   229,   229,
       0,     0,     0,     0,     0,   226,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   227,
     227,     0,     0,     0,     0,     0,     0,   649,     0,     0,
       0,     0,     0,   649,     0,     0,     0,     0,     0,     0,
       0,   668,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   226,   226,   226,   226,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   226,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1531,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   546,   226,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   549,  1575,   229,   229,     0,     0,     0,
       0,  1575,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   224,     0,     0,   224,   226,   226,     0,
       0,     0,     0,     0,   226,   226,     0,     0,   226,   226,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   516,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   224,     0,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   224,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,   224,
     224,   224,   224,     0,     0,     0,     0,     0,     0,     0,
       0,   229,     0,     0,     0,     0,     0,     0,   229,     0,
    1005,  1006,  1007,   565,  1008,  1009,  1010,  1011,   570,   571,
    1012,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,     0,     0,     0,     0,     0,  1013,     0,     0,
       0,     0,   277,   278,  1014,     0,   575,   576,   577,   512,
       0,     0,     0,     0,     0,     0,   279,     0,   224,   224,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   578,     0,     0,     0,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,   226,     0,     0,   226,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   224,     0,     0,
     229,   229,   229,   229,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   226,     0,     0,     0,     0,
       0,     0,     0,   229,   229,     0,     0,     0,     0,   225,
       0,     0,  1085,     0,     0,     0,   226,     0,   224,     0,
       0,     0,     0,     0,   224,     0,   229,   226,   226,   226,
     226,     0,     0,  1112,  1122,   668,     0,  1112,  1122,     0,
       0,     0,     0,     0,     0,   225,     0,     0,     0,     0,
       0,   225,  1141,     0,     0,   229,     0,     0,     0,     0,
       0,   229,     0,   225,   229,   225,     0,   225,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   513,     0,   225,
       0,     0,     0,   224,     0,     0,   226,   226,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   224,
     224,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   516,     0,     0,     0,     2,     0,     0,
     229,     0,     0,   229,   229,   226,     0,   225,     0,     0,
     225,   225,   225,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   516,     0,     0,     0,     0,     0,     0,
     516,   225,     0,     0,   273,   668,     0,   516,     0,     0,
     274,   275,   276,     0,     0,     0,   226,     0,     0,     0,
     225,     0,   226,   277,   278,     0,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
     665,   280,   281,   282,   283,   284,   285,   286,   287,     0,
     224,   288,  1048,   289,     0,     0,  1612,     0,   516,     0,
    1620,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,   516,   229,     0,     0,     0,
       0,     0,     0,   229,   229,     0,     0,     0,     0,     0,
       0,   226,     0,     0,     0,   229,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   226,   226,   229,
     229,   229,     0,     0,     0,     0,   225,   549,   225,   225,
     230,     0,   225,     0,   224,   224,     0,     0,     0,     0,
       0,     0,     0,     0,   225,     0,     0,     0,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,   230,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,   230,     0,   230,     0,   230,     0,
       0,     0,     0,     0,     0,     0,     0,   225,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   229,     0,     0,
     230,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   277,   278,     0,   225,     0,     0,     0,   226,     0,
     665,   225,     0,     0,     0,   279,     0,     0,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1048,   289,  1504,     0,  1049,   229,   229,   229,   229,   290,
     291,     0,   292,   293,   294,   295,     0,     0,   230,     0,
       0,   230,   230,   230,     0,   229,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1534,
       0,     0,   230,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,   226,     0,     0,   549,   229,     0,     0,
       0,   230,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,     0,     0,     0,  1578,     0,     0,     0,
       0,     0,     0,  1578,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   225,   225,   225,   225,     0,     0,   229,
     229,     0,     0,     0,     0,     0,   229,   229,     0,     0,
     229,   229,     0,     0,     0,     0,   225,   225,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,   225,
       0,     0,     0,     0,     0,     0,   225,   225,     0,     0,
     225,   225,     0,     0,     0,     2,     0,   230,     0,   230,
     230,     0,     0,   230,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,   225,   230,     0,   225,     0,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,     0,     0,     0,     0,     0,  1013,     0,     0,     0,
       0,   277,   278,  1014,     0,   575,   576,   577,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,   230,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   578,     0,     0,     0,   220,     0,   579,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
     591,     0,     0,   225,     0,   230,   225,   225,     0,     0,
       0,     0,   230,   229,     0,     0,   229,     0,     0,     0,
       0,     0,     0,     0,     0,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   664,     0,     0,     0,     0,   229,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   366,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   229,
     229,   229,   229,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   225,
       0,     0,     0,     0,     0,     0,   225,   225,   366,     0,
       0,     0,     0,     0,   230,   230,   230,   230,   225,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,   225,   225,     0,     0,   230,   230,   516,
     225,     0,     0,   664,     0,     0,     0,     0,   229,   229,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,     0,   230,   230,     0,
       0,   230,   230,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,     0,   230,     0,     0,   230,     0,
       0,     0,     0,     0,   626,     0,     0,   229,     0,     0,
       0,     0,     0,   366,     0,     0,     0,     0,     0,   366,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,     0,   229,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   668,     0,     0,     0,     0,     0,   225,   225,
     225,   225,     0,     0,   230,     0,     0,   230,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,     0,     0,   230,     0,     0,     0,
     366,     0,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,   229,     0,     0,  1028,     0,     0,   225,
     225,     0,     0,     0,     0,     0,     0,     0,     0,   229,
     229,  1046,     0,     0,     0,     0,     0,     0,     0,   225,
       0,   591,   591,   591,   591,     0,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   225,   225,     0,     0,     0,     0,     0,   225,
     225,     0,     0,   225,   225,     0,     0,     0,     0,     0,
     230,     0,   664,     0,     0,     0,     0,   230,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
       0,     0,     0,     0,     0,     0,   912,  1046,     0,     0,
       0,     0,     0,   230,   230,   230,     0,     0,     0,     0,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1169,     0,     0,     0,   366,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     229,     0,   668,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1222,     0,     0,     0,     0,     0,     0,     0,  1234,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     366,     0,     0,     0,     0,     0,     0,     0,  1286,     0,
       0,   230,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1312,  1316,     0,     0,
       0,     0,     0,     0,   229,   229,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   225,     0,     0,   225,
       0,     0,     0,     0,     0,     0,   664,     0,     0,     0,
       0,     0,     0,  1075,     0,     0,     0,     0,     0,   230,
     230,   230,   230,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   230,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     912,   225,     0,     0,     0,     0,   912,     0,     0,   912,
     230,   230,   225,   225,   225,   225,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   230,   230,     0,     0,     0,     0,     0,
     230,   230,     0,     0,   230,   230,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   225,   225,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   366,     0,     0,   366,   366,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   663,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     225,   591,     0,     0,   591,  1474,  1476,     0,  1479,     0,
       0,     0,     0,     0,     0,     0,  1489,     0,     0,     0,
       0,     0,     0,     0,  1498,     0,     0,     0,     0,   912,
       0,  1046,   366,     0,     0,     0,     0,     0,     0,     0,
       0,   225,   591,     0,     0,     0,     0,   225,     0,  1046,
       0,     0,     0,     0,  1046,     0,   591,   591,   591,   591,
       0,   366,     0,     0,     0,     0,     0,     0,     0,     0,
     366,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     663,     0,     0,     0,     0,     0,     0,   230,     0,     0,
     230,     0,     0,     0,   912,     0,   912,     0,     0,  1545,
       0,     0,     0,     0,     0,  1554,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   225,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1046,     0,
       0,   230,   225,   225,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   366,   230,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   230,   230,   230,   230,     0,     0,     0,
       0,   783,  1046,     1,     0,     0,     0,     0,     0,     0,
       0,     0,   912,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,     0,     0,     0,     0,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,  1046,     0,     0,     0,     0,     0,
       0,     0,   230,   230,     0,     0,   216,  1046,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,   225,     0,   217,    38,   218,     0,     0,
       0,     0,     0,  1027,     0,     0,     0,     0,     0,   268,
     219,     1,   269,    97,   270,     0,   271,   272,  1045,     0,
       0,     0,  1050,     0,     0,     0,     0,     0,  1046,     0,
       0,   230,   366,     0,   366,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1046,     0,   366,     0,  1046,     0,
       0,     0,     0,     0,     0,     0,     0,   225,   225,   663,
       0,     0,   230,   273,     0,   912,     0,     0,   230,   274,
     275,   276,   912,  1124,     0,     0,   912,     0,     0,     0,
       0,     0,   277,   278,  1045,  1050,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,  1168,
     288,  1048,   289,     0,     0,  1612,     0,     0,     0,  1632,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1220,     0,     0,
       0,     0,     0,   230,   230,  1233,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1284,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1310,  1314,     0,     0,     0,     0,     0,
       0,     0,     0,   591,   591,     0,     0,  1046,     0,  1046,
       0,     0,  1046,   591,     0,     0,     0,     0,  1722,  1725,
       0,  1727,     0,   663,     0,     0,     0,     0,     0,     0,
       0,  1046,     0,  1738,     0,     0,     0,     0,   366,     0,
       0,   366,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1714,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   230,     0,     0,     0,  1046,     0,
       2,     0,   912,     0,     0,     0,     0,  1046,     0,   366,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   366,  1005,  1006,  1007,   565,  1008,  1009,
    1010,  1011,   570,   571,  1012,     0,     0,   273,   366,     0,
       0,     0,     0,   274,   275,   276,   912,     0,   912,     0,
       0,  1013,     0,     0,     0,     0,   277,   278,  1014,     0,
     575,   576,   577,     0,     0,   912,     0,     0,   230,   230,
     279,     0,     0,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     1,   288,     0,   289,   578,     0,     0,
       0,   220,     0,   579,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,   912,     0,     0,     0,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1473,  1475,     0,  1478,    27,     0,   376,     0,
       0,     0,     0,  1027,    28,    29,     0,  1050,   377,    32,
       0,  1497,    35,    36,     0,    37,    38,    39,  1045,  1050,
     591,  1046,     0,     0,     0,     0,     0,     0,  1046,     0,
      40,     0,  1727,     0,  1872,     0,  1045,  1050,     0,    43,
       0,  1045,   862,  1878,   390,     0,     0,     0,     0,     0,
       0,   863,     0,   366,     0,     0,     0,     0,   366,   366,
     366,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   366,   366,     0,     0,     0,     0,
       0,     0,     0,   664,     0,     0,  1544,     0,     0,     0,
       0,     0,  1553,     0,     0,     0,     0,     0,  1799,  1803,
       0,  1809,  1813,    82,     0,     0,  1817,  1821,  1825,  1829,
       0,     0,     0,     0,     0,  1045,     0,     0,  1799,  1803,
    1809,  1813,  1817,  1821,  1825,  1829,     0,     0,   366,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   912,   111,   117,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1045,
    1050,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,  1930,  1933,     0,  1046,     0,  1046,   161,   117,
     591,  1046,   591,   201,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,    82,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  1045,   347,  1050,     0,     0,     0,     0,     0,   350,
       0,     0,     0,     0,  1045,  1050,     0,     0,     0,     0,
       0,     0,     0,  1046,     0,     0,  1046,     0,     0,     0,
       0,     0,     0,     0,   591,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   480,     0,   366,   366,     0,     0,     0,
       0,     0,     0,     0,     0,  1045,   366,  1050,     0,     0,
    1046,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   519,     0,     0,     0,     0,     0,
       0,  1045,     0,  1050,     0,  1045,     0,  1050,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   912,     0,
       0,   366,   366,     0,   117,  -467,  1041,     0,  -467,  -467,
    -467,  -467,     0,  -467,  -467,     0,     0,   161,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    82,
       0,     0,     0,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,     0,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,     0,     0,
    -467,  -467,     0,  -467,     0,     0,  -467,  -467,  -467,  -467,
    -467,     0,     0,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
       0,  -467,     0,  -467,  -467,  -467,     0,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,     0,     0,  -467,  -467,  -467,
    -467,     0,  -467,  -467,  -467,  1042,  -467,  -467,  -467,     0,
    -467,  -467,  -467,  -467,  1045,  1050,  1045,  1050,     0,  1045,
    1717,     0,     0,   776,     0,  1473,  1724,     0,  1497,     0,
    1050,     0,     0,     0,     0,     0,     0,     0,  1045,  1050,
    1497,     0,   117,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   850,     0,     0,
     859,     0,     0,     0,     0,  1045,  1050,     0,     0,     0,
     682,     0,     0,     0,  1045,  1050,   683,   684,   685,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
       0,     0,     0,   117,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  -360,     0,     0,     0,     0,
     519,     0,   117,  -360,  -360,     0,     0,     0,  -360,     0,
     961,     0,     0,     0,  -360,  -360,  -360,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  -360,
       0,     0,     0,     0,     0,     0,     0,     0,  -360,  -360,
    -360,   686,     0,   350,  -360,  1427,  -360,  -360,     0,   687,
       0,     0,   688,     0,  -360,  -360,  -360,     0,  -360,  -360,
    -360,  -360,  -360,     0,     0,     0,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,  1045,     0,
       0,     0,     0,  1050,     0,  1045,  1717,     0,  1050,  1497,
       0,  1871,     0,  1873,     0,     0,     0,    82,     0,  1050,
    1877,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,     0,
       0,     0,     0,  1115,     0,     0,     0,  1115,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     663,     0,   776,   279,     0,     0,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1048,   289,
       0,     0,  1612,     0,     0,     0,  1636,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1929,
    1932,     0,  1045,  1050,  1045,     0,     0,     0,  1045,  1717,
       0,     0,     0,     0,     0,     0,     0,   776,  1318,  1734,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,   776,     0,     0,     0,     0,     0,     0,     0,
    1339,     0,     0,   776,   111,   117,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1045,  1050,     0,  1045,  1717,     0,     0,     0,  1976,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,   117,     0,     0,     0,   274,
     275,   276,  1368,     0,     0,     0,     0,     0,   519,     0,
       0,     0,   277,   278,     0,   117,     0,  1045,     0,     0,
       0,     0,     0,     0,     0,   850,   279,     0,     0,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1048,   289,  1735,     0,  1049,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,  -360,   682,   850,  -360,  -360,
    -360,  -360,   683,   684,   685,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,     0,
    -360,  -360,     0,  -360,     0,     0,  -360,  -360,  -360,  -360,
    -360,     0,     0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
       0,  -360,     0,  -360,  -360,  -360,     0,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,   686,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   687,  -360,  -360,   688,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   776,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,   776,     0,  1115,   217,
      38,   218,     0,     0,     0,     0,  1567,     0,     0,     0,
       0,     0,     0,     0,   219,     0,  1115,     0,     0,     0,
       0,  -362,  1089,  1115,  -362,  -362,  -362,  -362,  1090,  1091,
    1092,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,     0,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,     0,     0,  -362,  -362,     0,  -362,
       0,     0,  -362,  -362,  -362,  -362,  -362,     0,     0,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,  -362,     0,  -362,     0,  -362,
    -362,  -362,     0,  -362,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  1093,  -362,  -362,  -362,  -362,  -362,  -362,
    -362,  1094,  -362,  -362,  1095,  -362,  -362,  -362,  -362,  -362,
    -362,  -362,  -362,  -362,  -362,     0,     0,     0,     0,     0,
       0,     0,  -467,  1041,     0,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,     0,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,     0,     0,  -467,  -467,     0,
    -467,  1647,     0,  -467,  -467,  -467,  -467,  -467,     0,     0,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,     0,  -467,  1339,
    -467,  -467,  -467,     0,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,  -467,
    -467,  -467,  -467,  -467,  -467,  -467,     0,     0,  -303,   268,
       0,     1,   269,    97,   270,  -303,   271,   272,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,     2,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,   519,
    -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,     0,     0,   273,  -303,     0,  -303,     0,     0,   274,
     275,   276,  -303,  -303,     0,     0,  -303,  -303,  -303,  -303,
    -303,  -303,   277,   278,  -303,  -303,  -303,  -303,  -303,  -303,
    -303,  -303,  -303,     0,  -303,     0,   279,  -303,  -303,     0,
     280,   281,   282,   283,   284,   285,   286,   287,  -303,  -303,
     288,  1136,   289,  -303,  -303,  1044,  -303,  -303,  -303,  -303,
     290,   291,  -303,   292,   293,   294,   295,  -303,  -303,  -303,
    -303,  -303,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -304,   268,     0,     1,   269,    97,   270,  -304,   271,
     272,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,     2,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,     0,  -304,  -304,  -304,  -304,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,     0,     0,   273,  -304,     0,  -304,
       0,     0,   274,   275,   276,  -304,  -304,     0,     0,  -304,
    -304,  -304,  -304,  -304,  -304,   277,   278,  -304,  -304,  -304,
    -304,  -304,  -304,  -304,  -304,  -304,     0,  -304,     0,   279,
    -304,  -304,  1647,   280,   281,   282,   283,   284,   285,   286,
     287,  -304,  -304,   288,  1048,   289,  -304,  -304,  1049,  -304,
    -304,  -304,  -304,   290,   291,  -304,   292,   293,   294,   295,
    -304,  -304,  -304,  -304,  -304,  -593,   268,     0,     1,   269,
      97,   270,  -593,   271,   272,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,     2,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,     0,  -593,  -593,  -593,
    -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,     0,     0,
     273,  -593,     0,  -593,     0,     0,   274,   275,   276,  -593,
    -593,     0,     0,  -593,  -593,  -593,  -593,  -593,  -593,   277,
     278,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,  -593,
       0,  -593,     0,   279,  -593,  -593,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -593,  -593,   288,  -593,   289,
    -593,  -593,  -593,  -593,   672,  -593,  1217,   290,   291,  -593,
     292,   293,   294,   295,  -593,  -593,  -593,  -593,  -593,  -594,
     268,     0,     1,   269,    97,   270,  -594,   271,   272,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,     2,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
       0,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,     0,     0,   273,  -594,     0,  -594,     0,     0,
     274,   275,   276,  -594,  -594,     0,     0,  -594,  -594,  -594,
    -594,  -594,  -594,   277,   278,  -594,  -594,  -594,  -594,  -594,
    -594,  -594,  -594,  -594,     0,  -594,     0,   279,  -594,  -594,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -594,
    -594,   288,  -594,   289,  -594,  -594,  -594,  -594,   672,  -594,
    1283,   290,   291,  -594,   292,   293,   294,   295,  -594,  -594,
    -594,  -594,  -594,  -604,   268,     0,     1,   269,    97,   270,
    -604,   271,   272,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,     2,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,     0,  -604,  -604,  -604,  -604,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,     0,     0,   273,  -604,
       0,  -604,     0,     0,   274,   275,   276,  -604,  -604,     0,
       0,  -604,  -604,  -604,  -604,  -604,  -604,   277,   278,  -604,
    -604,  -604,  -604,  -604,  -604,  -604,  -604,  -604,     0,  -604,
       0,   279,  -604,  -604,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -604,  -604,   288,  -604,   289,  -604,  -604,
    1044,  -604,  -604,  -604,  -604,   290,   291,  -604,   292,   293,
     294,   295,  -604,  -604,  -604,  -604,  -604,  -606,   268,     0,
       1,   269,    97,   270,  -606,   271,   272,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,     2,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,     0,  -606,
    -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
       0,     0,   273,  -606,     0,  -606,     0,     0,   274,   275,
     276,  -606,  -606,     0,     0,  -606,  -606,  -606,  -606,  -606,
    -606,   277,   278,  -606,  -606,  -606,  -606,  -606,  -606,  -606,
    -606,  -606,     0,  -606,     0,   279,  -606,  -606,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -606,  -606,   288,
    1048,   289,  -606,  -606,  1049,  -606,  -606,  -606,  -606,   290,
     291,  -606,   292,   293,   294,   295,  -606,  -606,  -606,  -606,
    -606,  -605,   268,     0,     1,   269,    97,   270,  -605,   271,
     272,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,     2,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,     0,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,     0,     0,   273,  -605,     0,  -605,
       0,     0,   274,   275,   276,  -605,  -605,     0,     0,  -605,
    -605,  -605,  -605,  -605,  -605,   277,   278,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,     0,  -605,     0,   279,
    -605,  -605,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -605,  -605,   288,  -605,   289,  -605,  -605,  1044,  -605,
    -605,  -605,  -605,   290,   291,  -605,   292,   293,   294,   295,
    -605,  -605,  -605,  -605,  -605,  -356,  1752,     0,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,     0,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,     0,     0,
    -356,  -356,     0,  -356,     0,     0,  -356,  -356,  -356,  -356,
    -356,     0,     0,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
       0,  -356,     0,  -356,  -356,  -356,     0,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,
    -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -356,  -349,
     268,     0,     1,   269,    97,   270,  -349,   271,   272,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,     2,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
       0,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,     0,     0,   273,  -349,     0,  -349,     0,     0,
     274,   275,   276,  -349,  -349,     0,     0,  -349,  -349,  -349,
    -349,  -349,  -349,   277,   278,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,     0,  -349,     0,   279,  -349,  -349,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -349,
    -349,   288,  -349,   289,  -349,  -349,  -349,  -349,   672,  -349,
    -349,   290,   291,  -349,   292,   293,   294,   295,  -349,  -349,
    -349,  -349,  -349,  -571,   268,     0,     1,   269,    97,   270,
    -571,   271,   272,  -571,  -571,  -571,  -571,  -571,  -571,  -571,
    -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,
    -571,     2,  -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,
    -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,
    -571,  -571,  -571,  -571,     0,  -571,  -571,  -571,  -571,  -571,
    -571,  -571,  -571,  -571,  -571,  -571,     0,     0,   273,  -571,
       0,  -571,     0,     0,   274,   275,   276,  -571,  -571,     0,
       0,  -571,  -571,  -571,  -571,  -571,  -571,   277,   278,  -571,
    -571,  -571,  -571,  -571,  -571,  -571,  -571,  -571,     0,  -571,
       0,   279,  -571,  -571,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -571,  -571,   288,  -571,   289,  -571,  -571,
    -571,  -571,   672,  -571,  -571,   290,   291,  -571,   292,   293,
     294,   295,  -571,  -571,  -571,  -571,  -571,  -579,   268,     0,
       1,   269,    97,   270,  -579,   271,   272,  -579,  -579,  -579,
    -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,
    -579,  -579,  -579,  -579,  -579,     2,  -579,  -579,  -579,  -579,
    -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,
    -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,     0,  -579,
    -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,  -579,
       0,     0,   273,  -579,     0,  -579,     0,     0,   274,   275,
     276,  -579,  -579,     0,     0,  -579,  -579,  -579,  -579,  -579,
    -579,   277,   278,  -579,  -579,  -579,  -579,  -579,  -579,  -579,
    -579,  -579,     0,  -579,     0,   279,  -579,  -579,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -579,  -579,   288,
    -579,   289,  -579,  -579,  -579,  -579,   672,  -579,  -579,   290,
     291,  -579,   292,   293,   294,   295,  -579,  -579,  -579,  -579,
    -579,  -572,   268,     0,     1,   269,    97,   270,  -572,   271,
     272,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,     2,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,     0,  -572,  -572,  -572,  -572,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,     0,     0,   273,  -572,     0,  -572,
       0,     0,   274,   275,   276,  -572,  -572,     0,     0,  -572,
    -572,  -572,  -572,  -572,  -572,   277,   278,  -572,  -572,  -572,
    -572,  -572,  -572,  -572,  -572,  -572,     0,  -572,     0,   279,
    -572,  -572,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -572,  -572,   288,  -572,   289,  -572,  -572,  -572,  -572,
     672,  -572,  -572,   290,   291,  -572,   292,   293,   294,   295,
    -572,  -572,  -572,  -572,  -572,  -580,   268,     0,     1,   269,
      97,   270,  -580,   271,   272,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,     2,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,     0,  -580,  -580,  -580,
    -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,     0,     0,
     273,  -580,     0,  -580,     0,     0,   274,   275,   276,  -580,
    -580,     0,     0,  -580,  -580,  -580,  -580,  -580,  -580,   277,
     278,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,  -580,
       0,  -580,     0,   279,  -580,  -580,     0,   280,   281,   282,
     283,   284,   285,   286,   287,  -580,  -580,   288,  -580,   289,
    -580,  -580,  -580,  -580,   672,  -580,  -580,   290,   291,  -580,
     292,   293,   294,   295,  -580,  -580,  -580,  -580,  -580,  -573,
     268,     0,     1,   269,    97,   270,  -573,   271,   272,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,     2,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
       0,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,     0,     0,   273,  -573,     0,  -573,     0,     0,
     274,   275,   276,  -573,  -573,     0,     0,  -573,  -573,  -573,
    -573,  -573,  -573,   277,   278,  -573,  -573,  -573,  -573,  -573,
    -573,  -573,  -573,  -573,     0,  -573,     0,   279,  -573,  -573,
       0,   280,   281,   282,   283,   284,   285,   286,   287,  -573,
    -573,   288,  -573,   289,  -573,  -573,  -573,  -573,   672,  -573,
    -573,   290,   291,  -573,   292,   293,   294,   295,  -573,  -573,
    -573,  -573,  -573,  -581,   268,     0,     1,   269,    97,   270,
    -581,   271,   272,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,     2,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,     0,  -581,  -581,  -581,  -581,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,     0,     0,   273,  -581,
       0,  -581,     0,     0,   274,   275,   276,  -581,  -581,     0,
       0,  -581,  -581,  -581,  -581,  -581,  -581,   277,   278,  -581,
    -581,  -581,  -581,  -581,  -581,  -581,  -581,  -581,     0,  -581,
       0,   279,  -581,  -581,     0,   280,   281,   282,   283,   284,
     285,   286,   287,  -581,  -581,   288,  -581,   289,  -581,  -581,
    -581,  -581,   672,  -581,  -581,   290,   291,  -581,   292,   293,
     294,   295,  -581,  -581,  -581,  -581,  -581,  -574,   268,     0,
       1,   269,    97,   270,  -574,   271,   272,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,     2,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,     0,  -574,
    -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
       0,     0,   273,  -574,     0,  -574,     0,     0,   274,   275,
     276,  -574,  -574,     0,     0,  -574,  -574,  -574,  -574,  -574,
    -574,   277,   278,  -574,  -574,  -574,  -574,  -574,  -574,  -574,
    -574,  -574,     0,  -574,     0,   279,  -574,  -574,     0,   280,
     281,   282,   283,   284,   285,   286,   287,  -574,  -574,   288,
    -574,   289,  -574,  -574,  -574,  -574,   672,  -574,  -574,   290,
     291,  -574,   292,   293,   294,   295,  -574,  -574,  -574,  -574,
    -574,  -582,   268,     0,     1,   269,    97,   270,  -582,   271,
     272,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,     2,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,     0,  -582,  -582,  -582,  -582,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,     0,     0,   273,  -582,     0,  -582,
       0,     0,   274,   275,   276,  -582,  -582,     0,     0,  -582,
    -582,  -582,  -582,  -582,  -582,   277,   278,  -582,  -582,  -582,
    -582,  -582,  -582,  -582,  -582,  -582,     0,  -582,     0,   279,
    -582,  -582,     0,   280,   281,   282,   283,   284,   285,   286,
     287,  -582,  -582,   288,  -582,   289,  -582,  -582,  -582,  -582,
     672,  -582,  -582,   290,   291,  -582,   292,   293,   294,   295,
    -582,  -582,  -582,  -582,  -582,  -358,  1891,     0,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,     0,     0,
    -358,  -358,     0,  -358,     0,     0,  -358,  -358,  -358,  -358,
    -358,     0,     0,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
       0,  -358,     0,  -358,  -358,  -358,     0,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,
    -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -358,  -357,
    1892,     0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
       0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,     0,     0,  -357,  -357,     0,  -357,     0,     0,
    -357,  -357,  -357,  -357,  -357,     0,     0,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,     0,  -357,     0,  -357,  -357,  -357,
       0,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,  -357,
    -357,  -357,  -357,  -360,   682,     0,  -360,  -360,  -360,  -360,
     683,   684,   685,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,     0,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,     0,     0,  -360,  -360,
       0,  -360,     0,     0,  -360,  -360,  -360,  -360,  -360,     0,
       0,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,     0,  -360,
       0,  -360,  -360,  -360,     0,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   686,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  1039,  -360,  -360,   688,     0,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360, -1042,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1042, -1042, -1042, -1042,
   -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042,
   -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042,     0, -1042,
   -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042, -1042,
       0,     0,   273, -1042,     0, -1042,     0,     0,   274,   275,
     276, -1042, -1042,     0,     0, -1042, -1042, -1042, -1042, -1042,
   -1042,   277,   278, -1042, -1042, -1042, -1042, -1042, -1042, -1042,
   -1042, -1042,     0, -1042,     0,   279, -1042, -1042,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1048,   289, -1042,     0,  1049, -1042, -1042,     0, -1042,   290,
     291,     0,   292,   293,   294,   295, -1175,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2, -1175, -1175, -1175, -1175, -1175,
   -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175,
   -1175, -1175, -1175, -1175, -1175, -1175, -1175,     0, -1175, -1175,
   -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175,     0,
       0,   273, -1175,     0, -1175,     0,     0,   274,   275,   276,
   -1175, -1175,     0,     0, -1175, -1175, -1175, -1175, -1175, -1175,
     277,   278, -1175, -1175, -1175, -1175, -1175, -1175, -1175, -1175,
   -1175,     0, -1175,     0,   279, -1175, -1175,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1048,
     289,  1504,     0,  1049, -1175, -1175,     0, -1175,   290,   291,
       0,   292,   293,   294,   295, -1133,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1133, -1133, -1133, -1133, -1133, -1133,
   -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133,
   -1133, -1133, -1133, -1133, -1133, -1133,     0, -1133, -1133, -1133,
   -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133,     0,     0,
     273, -1133,     0, -1133,     0,     0,   274,   275,   276, -1133,
   -1133,     0,     0, -1133, -1133, -1133, -1133, -1133, -1133,   277,
     278, -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133, -1133,
       0, -1133,     0,   279, -1133, -1133,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1711,   289,
   -1133,     0,  1049, -1133, -1133,     0, -1133,   290,   291,     0,
     292,   293,   294,   295, -1164,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2, -1164, -1164, -1164, -1164, -1164, -1164, -1164,
   -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164, -1164,
   -1164, -1164, -1164, -1164, -1164,     0,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,     0,     0,   273,
   -1164,     0, -1164,     0,     0,   274,   275,   276, -1164, -1164,
       0,     0, -1164,  1013, -1164, -1164, -1164, -1164,   277,   278,
    1014, -1164,   575,   576,   577, -1164, -1164, -1164, -1164,     0,
   -1164,     0,   279, -1164, -1164,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1048,   289,   578,
       0,  1049, -1164,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295,  -605,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,     0,  -605,  -605,  -605,  -605,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,     0,     0,   273,  -605,
       0,  -605,     0,     0,   274,   275,   276,  -605,  -605,     0,
       0,  -605,  -605,  -605,  -605,  -605,  -605,   277,   278,  -605,
    -605,  -605,  -605,  -605,  -605,  -605,  -605,  -605,     0,  -605,
       0,   279,  -605,  -605,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  -605,   289,  1043,     0,
    1044,  -605,  -605,     0,  -605,   290,   291,     0,   292,   293,
     294,   295, -1156,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2, -1156, -1156, -1156, -1156, -1156, -1156, -1156, -1156, -1156,
   -1156, -1156, -1156, -1156, -1156, -1156, -1156, -1156, -1156, -1156,
   -1156, -1156, -1156,     0, -1156, -1156, -1156, -1156, -1156, -1156,
   -1156, -1156, -1156, -1156, -1156,     0,     0,   273, -1156,     0,
   -1156,     0,     0,   274,   275,   276, -1156, -1156,     0,     0,
   -1156, -1156, -1156, -1156, -1156, -1156,   277,   278, -1156, -1156,
   -1156, -1156, -1156, -1156, -1156, -1156, -1156,     0, -1156,     0,
     279, -1156, -1156,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1934,   289, -1156,     0,  1044,
   -1156, -1156,     0, -1156,   290,   291,     0,   292,   293,   294,
     295, -1157,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
   -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157, -1157,
   -1157, -1157,     0, -1157, -1157, -1157, -1157, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157,     0,     0,   273, -1157,     0, -1157,
       0,     0,   274,   275,   276, -1157, -1157,     0,     0, -1157,
   -1157, -1157, -1157, -1157, -1157,   277,   278, -1157, -1157, -1157,
   -1157, -1157, -1157, -1157, -1157, -1157,     0, -1157,     0,   279,
   -1157, -1157,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1048,   289,  1935,     0,  1049, -1157,
   -1157,     0, -1157,   290,   291,     0,   292,   293,   294,   295,
   -1151,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2, -1151,
   -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151,
   -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151, -1151,
   -1151,     0,   562,   563,   564,   565,   566,   567,   568,   569,
     570,   571,   572,     0,     0,   273, -1151,     0, -1151,     0,
       0,   274,   275,   276, -1151, -1151,     0,     0, -1151,  1013,
   -1151, -1151, -1151, -1151,   277,   278,  1014, -1151,   575,   576,
     577, -1151, -1151, -1151, -1151,     0, -1151,     0,   279, -1151,
   -1151,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1048,   289,   578,     0,  1049, -1151,   220,
       0,   579,   290,   291,     0,   292,   293,   294,   295, -1099,
     553,     0, -1099, -1099, -1099, -1099,     0, -1099, -1099,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0, -1099, -1099, -1099,
   -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099,
   -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099,
       0, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099,
   -1099, -1099,     0,     0, -1099, -1099,     0, -1099,     0,     0,
   -1099, -1099, -1099, -1099, -1099,     0,     0, -1099, -1099, -1099,
   -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099,
   -1099, -1099, -1099, -1099,     0, -1099,     0, -1099, -1099, -1099,
       0, -1099, -1099, -1099, -1099, -1099, -1099, -1099, -1099,     0,
       0, -1099,     0, -1099,   554,     0, -1099, -1099, -1099,     0,
   -1099, -1099, -1099,     0, -1099, -1099, -1099, -1099, -1122,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
     572,     0,     0,   273,   216,     0, -1122,     0,     0,   274,
     275,   276,    28,    29,     0,     0, -1122,   573, -1122, -1122,
   -1122, -1122,   277,   355,   574,   218,   575,   576,   577, -1122,
   -1122, -1122, -1122,     0, -1122,     0,   279, -1122,   219,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   578,     0, -1122, -1122,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295, -1100,   553,     0,
   -1100, -1100, -1100, -1100,     0, -1100, -1100,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,     0, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
       0,     0, -1100, -1100,     0, -1100,     0,     0, -1100, -1100,
   -1100, -1100, -1100,     0,     0, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100, -1100,
   -1100, -1100,     0, -1100,     0, -1100, -1100, -1100,     0, -1100,
   -1100, -1100, -1100, -1100, -1100, -1100, -1100,     0,     0, -1100,
       0, -1100,   554,     0, -1100, -1100, -1100,     0, -1100, -1100,
   -1100,     0, -1100, -1100, -1100, -1100, -1161,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2, -1161, -1161, -1161, -1161, -1161,
   -1161, -1161, -1161, -1161, -1161, -1161, -1161, -1161, -1161, -1161,
   -1161, -1161, -1161, -1161, -1161, -1161, -1161,     0,  1005,  1006,
    1007,   565,  1008,  1009,  1010,  1011,   570,   571,  1012,     0,
       0,   273, -1161,     0, -1161,     0,     0,   274,   275,   276,
   -1161, -1161,     0,     0, -1161,  1013, -1161, -1161, -1161, -1161,
     277,   278,  1014, -1161,   575,   576,   577, -1161, -1161, -1161,
   -1161,     0, -1161,     0,   279, -1161, -1161,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   578,     0, -1161, -1161,   220,     0,   579,   290,   291,
       0,   292,   293,   294,   295, -1177,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2, -1177, -1177, -1177, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177,     0, -1177, -1177, -1177,
   -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,     0,     0,
     273, -1177,     0, -1177,     0,     0,   274,   275,   276, -1177,
   -1177,     0,     0, -1177, -1177, -1177, -1177, -1177, -1177,   277,
     278, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177, -1177,
       0, -1177,     0,   279, -1177, -1177,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1024,     0, -1177, -1177,   672,     0, -1177,   290,   291,     0,
     292,   293,   294,   295, -1112,  1051,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,     0,     0,   273,
     216,     0, -1112,     0,     0,   274,   275,   276,    28,    29,
       0,     0, -1112,   573, -1112, -1112, -1112, -1112,   277,   355,
     574,   218,   575,   576,   577, -1112, -1112, -1112, -1112,     0,
   -1112,     0,   279, -1112,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   578,
       0, -1112, -1112,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295, -1116,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,   562,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,     0,     0,   273,   216,
       0, -1116,     0,     0,   274,   275,   276,    28,    29,     0,
       0, -1116,   573, -1116, -1116, -1116, -1116,   277,   355,   574,
     218,   575,   576,   577, -1116, -1116, -1116, -1116,     0, -1116,
       0,   279, -1116,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
   -1116, -1116,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295, -1111,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,   562,   563,   564,   565,   566,   567,
     568,   569,   570,   571,   572,     0,     0,   273,   216,     0,
   -1111,     0,     0,   274,   275,   276,    28,    29,     0,     0,
   -1111,   573, -1111, -1111, -1111, -1111,   277,   355,   574,   218,
     575,   576,   577, -1111, -1111, -1111, -1111,     0, -1111,     0,
     279, -1111,   219,     0,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,   578,     0, -1111,
   -1111,   220,     0,   579,   290,   291,     0,   292,   293,   294,
     295, -1115,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,     0,     0,   273,   216,     0, -1115,
       0,     0,   274,   275,   276,    28,    29,     0,     0, -1115,
     573, -1115, -1115, -1115, -1115,   277,   355,   574,   218,   575,
     576,   577, -1115, -1115, -1115, -1115,     0, -1115,     0,   279,
   -1115,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   578,     0, -1115, -1115,
     220,     0,   579,   290,   291,     0,   292,   293,   294,   295,
   -1029,  1064,     0, -1029, -1029, -1029, -1029,     0, -1029, -1029,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1029, -1029,
   -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029,
   -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029,
   -1029,     0, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029,
   -1029, -1029, -1029,     0,     0, -1029, -1029,     0, -1029,     0,
       0, -1029, -1029, -1029, -1029, -1029,     0,     0, -1029, -1029,
   -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029,
   -1029, -1029, -1029, -1029, -1029,     0, -1029,     0, -1029, -1029,
   -1029,     0, -1029, -1029, -1029, -1029, -1029, -1029, -1029, -1029,
       0,     0, -1029,     0, -1029, -1029,     0, -1029, -1029, -1029,
       0, -1029, -1029, -1029,     0, -1029, -1029, -1029, -1029, -1031,
    1065,     0, -1031, -1031, -1031, -1031,     0, -1031, -1031,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0, -1031, -1031, -1031,
   -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031,
   -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031,
       0, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031,
   -1031, -1031,     0,     0, -1031, -1031,     0, -1031,     0,     0,
   -1031, -1031, -1031, -1031, -1031,     0,     0, -1031, -1031, -1031,
   -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031,
   -1031, -1031, -1031, -1031,     0, -1031,     0, -1031, -1031, -1031,
       0, -1031, -1031, -1031, -1031, -1031, -1031, -1031, -1031,     0,
       0, -1031,     0, -1031, -1031,     0, -1031, -1031, -1031,     0,
   -1031, -1031, -1031,     0, -1031, -1031, -1031, -1031, -1071,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2, -1071, -1071, -1071,
   -1071, -1071, -1071, -1071, -1071, -1071, -1071, -1071, -1071, -1071,
   -1071, -1071, -1071, -1071, -1071, -1071, -1071, -1071, -1071,     0,
     562,   563,   564,   565,   566,   567,   568,   569,   570,   571,
     572,     0,     0,   273, -1071,     0, -1071,     0,     0,   274,
     275,   276, -1071, -1071,     0,     0, -1071,  1013, -1071, -1071,
   -1071, -1071,   277,   278,  1014, -1071,   575,   576,   577, -1071,
   -1071, -1071, -1071,     0, -1071,     0,   279, -1071, -1071,     0,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,   578,     0, -1071, -1071,   220,     0,   579,
     290,   291,     0,   292,   293,   294,   295, -1073,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1073, -1073, -1073, -1073,
   -1073, -1073, -1073, -1073, -1073, -1073, -1073, -1073, -1073, -1073,
   -1073, -1073, -1073, -1073, -1073, -1073, -1073, -1073,     0,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   571,   572,
       0,     0,   273, -1073,     0, -1073,     0,     0,   274,   275,
     276, -1073, -1073,     0,     0, -1073,  1013, -1073, -1073, -1073,
   -1073,   277,   278,  1014, -1073,   575,   576,   577, -1073, -1073,
   -1073, -1073,     0, -1073,     0,   279, -1073, -1073,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   578,     0, -1073, -1073,   220,     0,   579,   290,
     291,     0,   292,   293,   294,   295, -1113,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,     0,
       0,   273,   216,     0, -1113,     0,     0,   274,   275,   276,
      28,    29,     0,     0, -1113,   573, -1113, -1113, -1113, -1113,
     277,   355,   574,   218,   575,   576,   577, -1113, -1113, -1113,
   -1113,     0, -1113,     0,   279, -1113,   219,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,   578,     0, -1113, -1113,   220,     0,   579,   290,   291,
       0,   292,   293,   294,   295, -1117,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,   562,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,     0,     0,
     273,   216,     0, -1117,     0,     0,   274,   275,   276,    28,
      29,     0,     0, -1117,   573, -1117, -1117, -1117, -1117,   277,
     355,   574,   218,   575,   576,   577, -1117, -1117, -1117, -1117,
       0, -1117,     0,   279, -1117,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
     578,     0, -1117, -1117,   220,     0,   579,   290,   291,     0,
     292,   293,   294,   295, -1114,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,     0,     0,   273,
     216,     0, -1114,     0,     0,   274,   275,   276,    28,    29,
       0,     0, -1114,   573, -1114, -1114, -1114, -1114,   277,   355,
     574,   218,   575,   576,   577, -1114, -1114, -1114, -1114,     0,
   -1114,     0,   279, -1114,   219,     0,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,   578,
       0, -1114, -1114,   220,     0,   579,   290,   291,     0,   292,
     293,   294,   295, -1118,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,   562,   563,   564,   565,   566,
     567,   568,   569,   570,   571,   572,     0,     0,   273,   216,
       0, -1118,     0,     0,   274,   275,   276,    28,    29,     0,
       0, -1118,   573, -1118, -1118, -1118, -1118,   277,   355,   574,
     218,   575,   576,   577, -1118, -1118, -1118, -1118,     0, -1118,
       0,   279, -1118,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   578,     0,
   -1118, -1118,   220,     0,   579,   290,   291,     0,   292,   293,
     294,   295, -1109,   553,     0, -1109, -1109, -1109, -1109,     0,
   -1109, -1109,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109,
   -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109,
   -1109, -1109, -1109,     0, -1109, -1109, -1109, -1109, -1109, -1109,
   -1109, -1109, -1109, -1109, -1109,     0,     0, -1109, -1109,     0,
   -1109,     0,     0, -1109, -1109, -1109, -1109, -1109,     0,     0,
   -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109, -1109,
   -1109, -1109, -1109, -1109, -1109, -1109, -1109,     0, -1109,     0,
   -1109, -1109, -1109,     0, -1109, -1109, -1109, -1109, -1109, -1109,
   -1109, -1109,     0,     0, -1109,     0, -1109,   554,     0, -1109,
   -1109, -1109,     0, -1109, -1109, -1109,     0, -1109, -1109, -1109,
   -1109, -1110,   553,     0, -1110, -1110, -1110, -1110,     0, -1110,
   -1110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110,     0, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110,     0,     0, -1110, -1110,     0, -1110,
       0,     0, -1110, -1110, -1110, -1110, -1110,     0,     0, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110, -1110, -1110, -1110, -1110, -1110,     0, -1110,     0, -1110,
   -1110, -1110,     0, -1110, -1110, -1110, -1110, -1110, -1110, -1110,
   -1110,     0,     0, -1110,     0, -1110,   554,     0, -1110, -1110,
   -1110,     0, -1110, -1110, -1110,     0, -1110, -1110, -1110, -1110,
    -960,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,  -960,
    -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,
    -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,
    -960,     0,  -960,  -960,  -960,  -960,  -960,  -960,  -960,  -960,
    -960,  -960,  -960,     0,     0,   273,  -960,     0,  -960,     0,
       0,   274,   275,   276,  -960,  -960,     0,     0,  -960,  -960,
    -960,  -960,  -960,  -960,   277,   278,  -960,  -960,  -960,  -960,
    -960,  -960,  -960,  -960,  -960,     0,  -960,     0,   279,  -960,
    -960,     0,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  -960,     0,  1690,  1691,   919,
       0,  -960,   290,   291,     0,   292,   293,   294,   295,  -962,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,  -962,  -962,
    -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,
    -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,
       0,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,  -962,
    -962,  -962,     0,     0,   273,  -962,     0,  -962,     0,     0,
     274,   275,   276,  -962,  -962,     0,     0,  -962,  -962,  -962,
    -962,  -962,  -962,   277,   278,  -962,  -962,  -962,  -962,  -962,
    -962,  -962,  -962,  -962,     0,  -962,     0,   279,  -962,  -962,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  -962,     0,  -962,  1853,   919,     0,
    -962,   290,   291,     0,   292,   293,   294,   295,  -956,  1856,
       0,  -956,  -956,  -956,  -956,     0,  -956,  -956,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -956,  -956,  -956,  -956,
    -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,
    -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,     0,
    -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,
    -956,     0,     0,  -956,  -956,     0,  -956,     0,     0,  -956,
    -956,  -956,  -956,  -956,     0,     0,  -956,  -956,  -956,  -956,
    -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,
    -956,  -956,  -956,     0,  -956,     0,  -956,  -956,  -956,     0,
    -956,  -956,  -956,  -956,  -956,  -956,  -956,  -956,     0,     0,
    -956,     0,  -956,  -956,     0,  -956,  -956,  -956,     0,  -956,
    -956,  -956,     0,  -956,  -956,  -956,  -956, -1158,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2, -1158, -1158, -1158, -1158,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158,     0, -1158,
   -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158, -1158,
       0,     0,   273, -1158,     0, -1158,     0,     0,   274,   275,
     276, -1158, -1158,     0,     0, -1158, -1158, -1158, -1158, -1158,
   -1158,   277,   278, -1158, -1158, -1158, -1158, -1158, -1158, -1158,
   -1158, -1158,     0, -1158,     0,   279, -1158, -1158,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289, -1158,     0, -1158, -1158, -1158,     0, -1158,   290,
     291,     0,   292,   293,   294,   295,  -957,  1926,     0,  -957,
    -957,  -957,  -957,     0,  -957,  -957,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,     0,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,     0,
       0,  -957,  -957,     0,  -957,     0,     0,  -957,  -957,  -957,
    -957,  -957,     0,     0,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,  -957,
    -957,     0,  -957,     0,  -957,  -957,  -957,     0,  -957,  -957,
    -957,  -957,  -957,  -957,  -957,  -957,     0,     0,  -957,     0,
    -957,  -957,     0,  -957,  -957,  -957,     0,  -957,  -957,  -957,
       0,  -957,  -957,  -957,  -957,  -886,   522,     0,  -886,  -886,
    -886,  -886,     0,  -886,  -886,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -886,  -886,  -886,  -886,  -886,  -886,  -886,
    -886,  -886,  -886,  -886,  -886,  -886,  -886,  -886,  -886,  -886,
    -886,  -886,  -886,  -886,  -886,  -886,     0,     0,  -886,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    -886,  -886,     0,  -886,     0,     0,  -886,  -886,  -886,  -886,
    -886,     0,     0,  -886,  -886,  -886,  -886,  -886,  -886,  -886,
    -886,  -886,  -886,  -886,     0,     0,  -886,  -886,  -886,  -886,
       0,  -886,     0,  -886,  -886,  -886,     0,  -886,  -886,  -886,
    -886,  -886,  -886,  -886,  -886,     0,     0,  -886,   523,  -886,
    -886,     0,   524,  -886,  -886,     0,     0,  -886,  -886,     0,
    -886,  -886,  -886,  -886,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   894,     0,
     895,   896,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,  1145,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   894,     0,   895,  -109,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
    1152,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,   894,     0,   895,   -97,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,  1156,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,   894,     0,   895,  -101,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,   216,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     355,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1411,     0,   895,   -64,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,  1420,     0,
     895,  1421,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,  1464,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,   894,     0,   895,   -80,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1420,     0,   895,  -106,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,  1420,     0,   895,   -96,   672,     0,     0,   290,
     291,     0,   292,   293,   294,   295,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,   216,     0,     0,     0,     0,   274,   275,   276,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,   277,
     355,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,   219,     0,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1420,     0,   895,  -100,   672,     0,     0,   290,   291,     0,
     292,   293,   294,   295,  1655,     0,     1,   269,    97,   270,
       0,   271,   272,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,   204,   205,   206,
     207,   208,   209,   210,   211,   212,   213,    18,    19,   214,
     215,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,   216,
       0,     0,     0,     0,   274,   275,   276,    28,    29,     0,
       0,     0,    32,     0,     0,     0,     0,   277,   355,    38,
     218,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,   219,     0,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,   894,     0,
     895,   -87,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,   204,   205,   206,   207,   208,
     209,   210,   211,   212,   213,    18,    19,   214,   215,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,   216,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,     0,     0,   277,   355,    38,   218,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,   219,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,  1420,     0,   895,   -77,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,  1420,     0,   895,   -84,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,   216,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,   277,   355,    38,   218,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,   219,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
     268,   289,     1,   269,    97,   270,     0,   271,   272,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   778,   216,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,   277,   355,    38,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,   219,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,   268,   289,     1,   269,    97,   270,     0,   271,
     272,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,     0,
       0,     0,   274,   275,   276,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,   277,   380,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,    40,     0,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,   661,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  1077,    27,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,   277,   380,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,    40,
       0,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   638,   661,   289,     0,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,     0,     0,     0,   274,   275,
     276,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,   277,   380,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,    40,     0,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
     268,   289,     1,   269,    97,   270,   220,   271,   272,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,     0,     0,     0,
     274,   275,   276,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,   277,   380,    38,    39,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   279,     0,    40,
       0,   280,   281,   282,   283,   284,   285,   286,   801,     0,
       0,   802,   661,   289,     2,     0,     0,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,  1048,
     289,     0,     0,  1049,     0,     0,     0,     0,   290,   291,
    1756,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1048,   289,     0,     0,  1049,     0,     0,     0,
       0,   290,   291,  1759,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,  1875,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1048,   289,  1735,     0,  1049,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1048,   289,
    1735,     0,  1049,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1936,   289,  1937,     0,  1044,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,     0,   289,     0,     0,  1965,  1966,
     919,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1048,   289,  1935,
       0,  1049,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,  1043,     0,  1044,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1161,   289,     0,     0,     0,     0,   672,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1228,   289,     0,     0,
       0,     0,   672,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,  1024,     0,     0,     0,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1493,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,  1048,   289,     0,     0,  1049,     0,     0,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1494,   289,  1495,     0,     0,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
    1503,     0,  1044,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1539,   289,     0,     0,     0,     0,   672,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1548,   289,     0,     0,     0,     0,
     672,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1580,   289,     0,
       0,  1044,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,  1044,     0,     0,     0,     0,   290,
     291,  1606,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,  1609,     0,     0,
       0,  1610,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
    1044,     0,     0,     0,     0,   290,   291,  1616,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1609,     0,     0,     0,  1618,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,  1609,     0,     0,     0,
    1630,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,  1609,
       0,     0,     0,  1634,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1710,   289,
       0,     0,  1044,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1712,   289,     0,     0,  1044,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1713,   289,     0,     0,  1049,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1716,   289,     0,
       0,  1044,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1494,   289,  1495,     0,     0,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,  1736,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,  1733,     0,  1044,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  1737,   289,  1495,     0,
       0,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,  1044,     0,     0,     0,     0,   290,   291,
    1755,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,  1044,     0,     0,     0,
       0,   290,   291,  1758,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,  1711,   289,     0,     0,  1049,
       0,     0,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1867,   289,
       0,     0,  1044,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,  1737,   289,  1495,     0,     0,     0,     0,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1940,   289,     0,     0,  1044,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1972,   289,     0,
       0,  1044,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
    1973,   289,     0,     0,  1044,     0,     0,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,  2000,   919,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,  2001,   289,     0,     0,
    1044,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
     268,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,     0,     0,     0,   290,   291,
     493,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,   268,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,   919,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,     0,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,   955,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
     288,     0,   289,     0,     0,     0,     0,     0,     0,   997,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,  1358,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,   661,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,     0,   289,     0,
       0,     0,     0,   672,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,     0,     0,     0,   290,
     291,  1450,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   268,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,  1477,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,  1680,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   288,     0,   289,     0,     0,
       0,     0,     0,     0,  1480,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
    1683,     0,     1,   269,    97,   270,     0,   271,   272,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     2,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   288,     0,
     289,     0,     0,     0,     0,   672,     0,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,     0,     0,     0,     0,     0,
     274,   275,   276,  1687,     0,     1,   269,    97,   270,     0,
     271,   272,     0,   277,   278,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   279,     0,     0,
       2,   280,   281,   282,   283,   284,   285,   286,   287,     0,
       0,   288,     0,   289,     0,     0,     0,     0,   672,     0,
       0,   290,   291,     0,   292,   293,   294,   295,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   273,     0,     0,
       0,     0,     0,   274,   275,   276,   268,     0,     1,   269,
      97,   270,     0,   271,   272,     0,   277,   278,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     279,     0,     0,     2,   280,   281,   282,   283,   284,   285,
     286,   287,     0,     0,   288,     0,   289,     0,     0,     0,
       0,   672,     0,     0,   290,   291,     0,   292,   293,   294,
     295,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,     0,     0,     0,     0,     0,   274,   275,   276,   268,
       0,     1,   269,    97,   270,     0,   271,   272,     0,   277,
     278,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   279,     0,     0,     2,   280,   281,   282,
     283,   284,   285,   286,   287,     0,     0,   288,  1723,   289,
       0,     0,     0,     0,     0,     0,     0,   290,   291,     0,
     292,   293,   294,   295,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   273,     0,     0,     0,     0,     0,   274,
     275,   276,   268,     0,     1,   269,    97,   270,     0,   271,
     272,     0,   277,   278,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   279,     0,     0,     2,
     280,   281,   282,   283,   284,   285,   286,   287,     0,     0,
    1779,     0,   289,     0,     0,     0,     0,  1780,     0,     0,
     290,   291,     0,   292,   293,   294,   295,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,     0,     0,     0,
       0,     0,   274,   275,   276,   268,     0,     1,   269,    97,
     270,     0,   271,   272,     0,   277,   278,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   279,
       0,     0,     2,   280,   281,   282,   283,   284,   285,   286,
     287,     0,     0,   288,  1876,   289,     0,     0,     0,     0,
       0,     0,     0,   290,   291,     0,   292,   293,   294,   295,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
       0,     0,     0,     0,     0,   274,   275,   276,   268,     0,
       1,   269,    97,   270,     0,   271,   272,     0,   277,   278,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   279,     0,     0,     2,   280,   281,   282,   283,
     284,   285,   286,   287,     0,     0,   288,  1931,   289,     0,
       0,     0,     0,     0,     0,     0,   290,   291,     0,   292,
     293,   294,   295,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,     0,     0,     0,     0,     0,   274,   275,
     276,   268,     0,     1,   269,    97,   270,     0,   271,   272,
       0,   277,   278,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   279,     0,     0,     2,   280,
     281,   282,   283,   284,   285,   286,   287,     0,     0,   288,
       0,   289,     0,     0,     0,     0,  1780,     0,     0,   290,
     291,     0,   292,   293,   294,   295,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   273,     0,     0,     0,     0,
       0,   274,   275,   276,   628,     0,     1,   269,    97,   270,
       0,   271,   272,     0,   277,   278,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   279,     0,
       0,     2,   280,   281,   282,   283,   284,   285,   286,   287,
       0,     0,   288,     0,   289,     0,     0,     0,     0,     0,
       0,     0,   290,   291,     0,   292,   293,   294,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,     0,
       0,     0,     0,     0,   274,   275,   276,   268,     0,     1,
     269,    97,   270,     0,   271,   272,     0,   277,   278,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   279,     0,     0,     2,   280,   281,   282,   283,   284,
     285,   286,   287,     0,     0,   629,     0,   289,     0,     0,
       0,     0,     0,     0,     0,   290,   291,     0,   292,   293,
     294,   295,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   273,     0,     0,     0,     0,     0,   274,   275,   276,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   279,     0,     0,     0,   280,   281,
     282,   283,   284,   285,   286,   287,     0,     0,   638,     0,
     289,  -257,   834,     0,     1,   269,    97,     0,   290,   291,
       0,   292,   293,   294,   295,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,  -257,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,  -255,   837,  -257,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
    -255,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,  -258,   834,  -255,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,  -258,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,  -256,
     837,  -258,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,  -256,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   375,  -256,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   443,   392,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   465,   444,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   470,   466,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     474,   471,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   834,   475,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   837,  -755,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   834,  -756,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   837,  -752,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     834,  -753,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   837,  -758,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   940,  -759,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   944,   941,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   834,   945,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     837,  -738,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   834,  -739,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   837,  -741,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   834,  -742,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   837,  -666,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     834,  -667,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   837,  -659,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   834,  -660,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   837,  -655,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   834,  -656,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     837,  -645,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,     0,   834,  -646,     1,   269,
      97,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     273,    27,     0,   376,     0,     0,   274,   275,     0,    28,
      29,     0,     0,   377,    32,   378,   379,    35,    36,     0,
     380,    38,    39,   381,     0,     0,   382,   383,   384,   385,
       0,   386,     0,   387,   388,    40,     0,   280,   281,   282,
     283,   284,   285,   286,    43,     0,     0,   389,     0,   390,
     391,     0,   837,  -640,     1,   269,    97,   290,   291,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   273,    27,     0,   376,
       0,     0,   274,   275,     0,    28,    29,     0,     0,   377,
      32,   378,   379,    35,    36,     0,   380,    38,    39,   381,
       0,     0,   382,   383,   384,   385,     0,   386,     0,   387,
     388,    40,     0,   280,   281,   282,   283,   284,   285,   286,
      43,     0,     0,   389,     0,   390,   391,     0,   834,  -641,
       1,   269,    97,   290,   291,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   273,    27,     0,   376,     0,     0,   274,   275,
       0,    28,    29,     0,     0,   377,    32,   378,   379,    35,
      36,     0,   380,    38,    39,   381,     0,     0,   382,   383,
     384,   385,     0,   386,     0,   387,   388,    40,     0,   280,
     281,   282,   283,   284,   285,   286,    43,     0,     0,   389,
       0,   390,   391,     0,   837,  -657,     1,   269,    97,   290,
     291,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   273,    27,
       0,   376,     0,     0,   274,   275,     0,    28,    29,     0,
       0,   377,    32,   378,   379,    35,    36,     0,   380,    38,
      39,   381,     0,     0,   382,   383,   384,   385,     0,   386,
       0,   387,   388,    40,     0,   280,   281,   282,   283,   284,
     285,   286,    43,     0,     0,   389,     0,   390,   391,     0,
     268,  -658,     1,   269,    97,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
       0,   389,     0,   390,   391,   375,     0,     1,   269,    97,
       0,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   273,
      27,     0,   376,     0,     0,   274,   275,     0,    28,    29,
       0,     0,   377,    32,   378,   379,    35,    36,     0,   380,
      38,    39,   381,     0,     0,   382,   383,   384,   385,     0,
     386,     0,   387,   388,    40,     0,   280,   281,   282,   283,
     284,   285,   286,    43,     0,     0,   389,     0,   390,   391,
     443,     0,     1,   269,    97,     0,   290,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   273,    27,     0,   376,     0,     0,
     274,   275,     0,    28,    29,     0,     0,   377,    32,   378,
     379,    35,    36,     0,   380,    38,    39,   381,     0,     0,
     382,   383,   384,   385,     0,   386,     0,   387,   388,    40,
       0,   280,   281,   282,   283,   284,   285,   286,    43,     0,
     171,   389,     1,   390,   391,     0,     0,     0,     0,     0,
       0,   290,   291,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   171,     0,     1,    40,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,   507,   948,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   508,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     177,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,    40,     0,     0,     0,     0,
       0,     0,     0,     0,    43,     0,     0,   774,   948,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   508,     2,
     172,   173,   174,   175,   176,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1163,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,   507,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   508,     0,   509, -1163, -1163, -1163,
   -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163,
   -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163,     0,
   -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163, -1163,
   -1163,     0,     0,     0, -1163,     0, -1163,     0,     0,     0,
       0,     0, -1163, -1163,     0,     0, -1163, -1163, -1163, -1163,
   -1163, -1163,     0,     0, -1163, -1163, -1163, -1163, -1163, -1163,
   -1163, -1163, -1163, -1148, -1163,     0,     0, -1163, -1163,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1163,     0,     0, -1163, -1163,     0, -1163,
       0,     0, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148,     0, -1148, -1148, -1148, -1148, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148,     0,     0,     0, -1148,
       0, -1148,     0,     0,     0,     0,     0, -1148, -1148,     0,
       0, -1148, -1148, -1148, -1148, -1148, -1148,     0,     0, -1148,
   -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1148, -1150, -1148,
       0,     0, -1148, -1148,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0, -1148,     0,
       0, -1148, -1148,     0, -1148,     0,     0, -1150, -1150, -1150,
   -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,     0,
   -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150,     0,     0,     0, -1150,     0, -1150,     0,     0,     0,
       0,     0, -1150, -1150,     0,     0, -1150, -1150, -1150, -1150,
   -1150, -1150,     0,     0, -1150, -1150, -1150, -1150, -1150, -1150,
   -1150, -1150, -1150, -1147, -1150,     0,     0, -1150, -1150,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0, -1150,     0,     0, -1150, -1150,     0, -1150,
       0,     0, -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1147,
   -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1147,
   -1147, -1147, -1147, -1147,     0, -1147, -1147, -1147, -1147, -1147,
   -1147, -1147, -1147, -1147, -1147, -1147,     0,     0,     0, -1147,
       0, -1147,     0,     0,     0,     0,     0, -1147, -1147,     0,
       0, -1147, -1147, -1147, -1147, -1147, -1147,     0,     0, -1147,
   -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1147, -1149, -1147,
       0,     0, -1147, -1147,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0, -1147, -1147,     0, -1147,     0,     0, -1149, -1149, -1149,
   -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,
   -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,     0,
   -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149, -1149,
   -1149,     0,     0,     0, -1149,     0, -1149,     0,     0,     0,
       0,     0, -1149, -1149,     0,     0, -1149, -1149, -1149, -1149,
   -1149, -1149,     0,     0, -1149, -1149, -1149, -1149, -1149, -1149,
   -1149, -1149, -1149,     0, -1149,     1,     0, -1149, -1149,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0, -1149, -1149,     0, -1149,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,   219,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,   774,     0,     0,     0,     0,     0,
       0,  1324,     0,     0,     0,   508,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,   219,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
     774,     0,     0,     0,     0,     0,     0,  1342,     0,     0,
       0,   508,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,   219,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,  1105,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1106,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
     219,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,  1105,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  1128,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,   219,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,  1105,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1572,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,   219,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,  1105,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,  1587,     2,     3,     4,   239,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,   240,    31,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,    40,     0,
       0,     0,     0,    42,     0,     0,     0,    43,     0,     0,
      44,     0,     0,     0,     0,     0,     0,     0,     0,   241,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,   842,     0,     0,   843,     0,     0,
       0,     0,     0,   844,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,    43,     0,     0,   842,     0,
       0,  1382,     0,     0,     0,     0,     0,   844,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,  1406,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,    44,     0,     0,     0,     0,     0,     0,     0,
       0,   844,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     -65,     0,     0,     0,     0,     0,     0,     0,   -65,   -65,
       0,     0,     0,   -65,     0,     0,     0,     0,     0,   -65,
     -65,   -65,     0,     0,     0,     0,  1597,     0,     0,     0,
       0,     0,     0,     0,   -65,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1407,
       0,  1408,   -65,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,  1601,     0,     0,
       0,     0,     0,     0,     0,   219,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -110,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,  1602,     0,
       0,     0,     0,     0,     0,     0,   219,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   -94,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,     0,     0,     0,  1705,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   -95,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
    1842,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   -79,     2,   172,   173,
     174,   175,   176,   204,   205,   206,   207,   208,   209,   210,
     211,   212,   213,    18,    19,   214,   215,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   216,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,     0,     0,     0,   217,    38,   218,     0,     0,     0,
   -1225,   258,     0,     1,     0,     0,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   -86,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,    30,    31,     0,    32,
      33,    34,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      40,    41,     0,     0,     0,    42,     0,     0,     0,    43,
       0,     0,    44,     0,     0,    45,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,     0,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,   758,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  1296,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,   758,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  1628,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,   147,     0,     1,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,   758,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  1629,     2,
       3,     4,   148,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,     0,     0,    35,    36,     0,    37,    38,    39,     0,
     147,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,    44,     0,     0,   149,     2,     3,     4,
     148,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,   542,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     0,     0,     0,     0,     0,     0,    43,     0,
       0,    44,     0,     0,   149,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     0,  -897,     0,  -897,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       0,     0,   543,  -897,  -897,  -897,  -897,  -897,  -897,  -897,
    -897,  -897,  -897,  -897,  -897,  -897,  -897,  -897,  -897,  -897,
    -897,  -897,  -897,  -897,  -897,  -897,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -897,     0,     0,     0,     0,     0,     0,     0,  -897,
    -897,     0,     0,     0,  -897,     0,     0,     0,     0,     0,
    -897,  -897,  -897,     0,     0,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,  -897,     0,     0,     0,     0,
       0,     0,     0,     0,  -897,     0,     0,  -897,     0,     0,
    -897,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,    30,
      31,     0,    32,    33,    34,    35,    36,     0,    37,    38,
      39, -1226,   250,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,    40,    41,     0,     0,     0,    42,     0,
       0,     0,    43,     0,     0,    44,     0,     0,    45,     2,
       3,     4,   148,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      32,    33,    34,    35,    36,     0,    37,    38,    39,   171,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    40,     0,     0,     0,     0,     0,     0,     0,     0,
      43,     0,     0,    44,     0,     0,     2,   172,   173,   174,
     175,   176,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   177,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
      35,    36,     0,    37,    38,    39,   171,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
    1105,  1559,     0,     2,   172,   173,   174,   175,   176,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     177,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,    35,    36,     0,
      37,    38,    39,   854,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    40,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   178,     0,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   177,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
     171,     0,     1,     0,     0,     0,     0,     0,     0,     0,
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
       0,     0,  1447,     0,     2,   172,   173,   174,   175,   176,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    32,     0,     0,    35,    36,
       0,    37,    38,    39,   147,     0,     1,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    40,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1769,
       0,     2,     3,     4,   148,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,   147,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
       0,     0,    43,     0,     0,    44,     0,     0,     2,     3,
       4,   148,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,   798,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     0,     0,     0,     0,     0,     0,     0,     0,    43,
       0,     0,    44,     0,     0,     2,   172,   173,   174,   175,
     176,   204,   205,   206,   207,   208,   209,   210,   211,   212,
     213,    18,    19,   214,   215,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   216,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,     0,
       0,     0,   217,    38,   218,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   219,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   799,
       2,     3,     4,   148,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,    43,     0,     0,    44,
       2,   172,   173,   174,   175,   176,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,    35,    36,     0,    37,    38,    39,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   653,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  1346,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,   968,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     0,     0,
       0,     0,     0,     0,   758,     0,     0,     0,     0,     0,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   969,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   177,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
     974,     0,     1,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     0,     0,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
     975,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   177,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,   980,     0,     1,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       0,     0,     2,   172,   173,   174,   175,   176,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   981,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   177,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       1,     0,     0,    32,     0,     0,    35,    36,     0,    37,
      38,    39,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    40,     2,   172,   173,   174,   175,
     176,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,   933,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   177,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     1,     0,     0,    32,     0,     0,    35,
      36,     0,    37,    38,    39,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    40,     2,   172,
     173,   174,   175,   176,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,   986,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   177,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     1,     0,     0,    32,
       0,     0,    35,    36,     0,    37,    38,    39,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      40,     2,   172,   173,   174,   175,   176,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   177,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     1,
       0,     0,    32,     0,     0,    35,    36,     0,    37,    38,
      39,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    40,     2,   172,   173,   174,   175,   176,
     204,   205,   206,   207,   208,   209,   210,   211,   212,   213,
      18,    19,   214,   215,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   216,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     1,     0,     0,    32,   432,   433,     0,     0,
       0,   217,    38,   218,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     2,   172,   173,
     174,   175,   176,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     1,     0,     0,    32,     0,
       0,    35,    36,     0,    37,    38,    39,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    40,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   457,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     1,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     2,   172,   173,   174,   175,   176,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,    18,
      19,   214,   215,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   216,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    32,     0,     0,     0,     0,     0,
     217,    38,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   219,     2,   172,   173,   174,
     175,   176,   204,   205,   206,   207,   208,   209,   210,   211,
     212,   213,    18,    19,   214,   215,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    32,     0,     0,
       0,     0,     0,   217,    38,   218,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   219,     0,
       0,     0,     0,     0,     0,     0,     0,    43,     0,     0,
     774,  1556,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   508,     2,   172,   173,   174,   175,   176,   204,   205,
     206,   207,   208,   209,   210,   211,   212,   213,    18,    19,
     214,   215,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     216,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    32,     0,     0,     0,     0,     0,   217,
      38,   218,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   219,     0,     0,     0,     0,     0,
       0,     0,     0,    43,     0,     0,   774,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   508,     2,   172,
     173,   174,   175,   176,   204,   205,   206,   207,   208,   209,
     210,   211,   212,   213,    18,    19,   214,   215,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   216,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    32,
       0,     0,     0,     0,     0,   217,    38,   218,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     219,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   220,
       2,   172,   173,   174,   175,   176,   204,   205,   206,   207,
     208,   209,   210,   211,   212,   213,    18,    19,   214,   215,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   216,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    32,     0,     0,     0,     0,     0,   217,    38,   218,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   219,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
    1417
};

static const yytype_int16 yycheck[] =
{
       0,    83,   841,   763,   117,   136,   507,   652,   767,   139,
     841,   484,   771,   732,   163,   484,   873,   577,   763,   767,
     517,    78,   519,   771,   906,  1113,   908,  1115,   507,   672,
      30,    31,    78,   767,   654,   678,   672,   771,   681,    17,
     370,    41,   678,    75,    44,   681,    91,    84,   161,    51,
    1487,    51,   906,   139,   908,    84,    56,    56,    58,    75,
      76,    91,  1499,    75,   427,   428,    84,     3,    76,   234,
     235,     3,    74,    91,    74,    75,    76,    51,    78,    75,
      80,   163,    82,   119,    84,     1,   127,   236,    75,     3,
     499,    91,    92,   126,   127,    95,    30,    84,   907,   140,
       3,   142,     5,   144,   104,     5,   255,   107,    42,     3,
       5,     5,   377,   306,    28,   524,   116,   117,   527,   119,
     529,   291,   531,   123,   124,   125,     5,   127,     3,   131,
     104,   131,   305,   133,    28,     1,   136,   137,     3,   139,
     140,   141,   142,     1,   144,   893,   319,    75,     1,   686,
     323,   306,   234,   153,   153,   133,    84,     1,   112,   424,
     160,   161,   110,    91,    98,    99,     1,     3,   102,     5,
     170,   119,     3,   121,   110,   191,   119,   507,   121,   115,
     180,   113,   182,     3,     1,   117,     3,   127,   190,   121,
     190,   191,     3,   110,     5,   732,   170,    28,   112,     3,
     140,   201,   142,   203,   144,   121,     0,     3,    73,   254,
     113,   256,   244,     1,     1,   231,     3,     1,   121,   256,
     120,   170,   254,   231,   254,   119,   256,   256,   244,     1,
     266,   231,   244,   793,   113,     3,   236,   350,   256,   275,
     240,     1,     1,   373,   244,   281,     1,  1104,   244,   115,
       3,   117,   118,   118,   254,   254,   256,   311,   254,   112,
     118,     1,   599,   600,   906,  1147,   908,   254,     1,   256,
      74,   115,  1154,   774,   274,    79,  1158,   113,   775,   776,
     280,    75,    86,   118,     1,   121,   372,   373,   288,   109,
      84,  1728,   112,  1147,   906,   774,   908,    91,    92,     3,
    1154,   118,   113,   123,  1158,   311,   240,     3,   112,     1,
     121,     3,   394,   395,   396,   397,     1,   113,   115,   123,
     485,   117,     1,     3,     3,   121,   275,   115,   256,   117,
     118,   118,   281,     3,   118,     1,   372,  1146,     1,   669,
       5,     3,   342,   343,  1153,   112,   118,   115,  1157,   117,
     350,   994,   352,    17,   112,   115,   290,   117,   994,   118,
     113,     1,   797,   118,     1,   123,   499,   480,   425,   500,
      74,     1,   372,   373,  1093,    79,   376,   377,   118,   425,
    1099,    17,    86,   383,   112,   118,   386,   387,   388,   389,
     390,   524,   118,    73,   527,  1956,   529,   191,   531,    77,
     119,   118,    17,   485,    74,   109,   519,     3,   112,    79,
       1,    79,   585,   109,   110,   588,    86,   121,   118,   419,
     420,   421,     3,   119,   424,   425,   118,   427,   428,     5,
     115,   431,   597,   598,   599,   600,   436,   872,   440,   118,
     440,   441,   118,   121,   774,   445,   446,    28,   113,   119,
     244,  2012,   118,   121,   116,   118,   621,   457,   458,   789,
     254,   962,   256,   504,   961,   506,  1323,   467,   468,   133,
     800,   620,   472,   473,   490,   491,   476,   477,   118,  1567,
     480,   118,   482,   962,     0,  1105,   849,   850,   118,     1,
     490,   491,     3,   509,   288,   495,   859,   133,   861,   499,
     500,     1,     3,  1123,   504,  1147,   506,   507,   508,   509,
    1130,   511,  1154,   706,   707,   708,  1158,   517,   133,   519,
       1,   112,   113,   119,   524,   790,   117,   527,  1385,   529,
     700,   531,     1,     3,   508,  1147,   112,   537,   119,  1299,
    1300,     1,  1154,   736,   737,   738,  1158,     5,     3,     3,
     550,   706,   707,   708,  1299,  1300,  1093,   727,   967,   508,
       1,  1320,  1099,   537,   504,   735,   506,   567,     3,   569,
     652,     5,  1320,     3,    28,    74,   985,   577,     5,   624,
      79,   736,   737,   738,  1466,   755,  1320,    86,  1427,   625,
       1,   236,   624,    28,   624,   721,  1427,   597,   598,   599,
     600,   113,   113,     3,  1105,   117,   110,   872,   109,   110,
       3,   115,  1466,   562,   616,   615,   616,   117,   119,   116,
       3,   111,     3,   749,   624,     3,  1105,   117,   624,   629,
     424,   112,   113,    74,     5,   115,   117,  1396,    79,  1398,
     117,     1,   112,   643,   113,    86,   419,   420,   117,   914,
     650,   651,   652,   653,   654,   655,  1465,   117,   113,   117,
     997,   715,   716,  1000,   718,   119,  1400,   117,     1,   669,
       3,     3,   445,   446,   115,   116,   117,   119,   612,   613,
       3,   767,    65,   683,   119,   771,   116,   687,   115,   743,
     744,   745,   746,   118,   467,   468,     7,     8,     9,   472,
     473,  1038,   113,   476,   477,    28,   117,     1,  1565,   715,
     716,     1,   718,   118,  1571,  1052,  1053,  1054,  1055,   119,
     113,  1364,     3,   657,   658,   659,   109,   110,  1364,   729,
     112,   767,   113,   733,   770,   771,   119,   743,   744,   745,
     746,   119,   824,   825,   723,   827,   117,     3,   830,   831,
     880,   881,     3,   113,   722,   886,  1086,   117,   758,   759,
     760,   117,   115,   763,   764,   765,   119,   767,   124,     3,
     770,   771,   751,  1103,   774,  1657,   109,   110,   778,   779,
      74,   112,   750,  1640,   117,    79,   788,   119,   788,   789,
     790,     3,    86,   793,   880,   881,   119,   797,   754,   799,
     800,   112,   802,  1657,   804,   724,   892,   938,   939,   120,
      12,    13,   123,    10,    11,   897,   772,   773,   112,   113,
       3,  1318,    73,   117,  1466,   115,   236,   117,   109,   110,
     624,    11,   725,   752,   967,   629,   721,   873,   119,   855,
     973,     1,   842,     3,   885,   845,   979,  1656,   961,   849,
     850,   722,   985,   109,  1466,   855,   112,     3,   652,   859,
     753,   861,   862,   112,   749,   234,   235,   118,     3,   113,
       3,   871,   872,   873,   123,   669,   110,   111,    11,   750,
     880,   881,    28,   883,   113,   885,   886,  1052,  1053,  1054,
    1055,    74,   892,   893,   828,   844,    79,   109,   110,   118,
       7,     8,     9,    86,  1742,    77,   112,  1072,   110,   111,
       7,     8,     9,    83,   914,   116,   124,   123,     7,   127,
    1777,    10,    11,    12,    13,    14,    15,    16,    17,   112,
      90,   111,   140,   882,   142,   112,   144,   117,   938,   939,
       3,     3,   942,   943,  1589,   885,   946,   947,   112,   949,
    1143,   109,   597,   598,   599,   600,   109,  1517,   112,   112,
    1433,   961,   962,   963,  1433,    28,   760,   967,   709,   710,
     970,   129,   130,   973,   109,   110,   976,   112,   111,   979,
    1150,   110,   982,   116,   117,   985,   119,   987,  1143,   963,
     119,   115,   992,   163,   112,   119,   790,   997,   739,   740,
    1000,  1840,   112,   797,     3,  1368,   724,  1370,   802,  1009,
     804,  1011,    74,   120,   963,  1657,   123,    79,   115,   116,
    1020,   110,   111,   120,    86,     7,     8,     9,   115,     1,
    1071,   120,   119,  1033,   752,     7,     8,     9,  1038,  1039,
     129,   130,   131,   132,   133,  1657,  1884,   109,  1886,   112,
     112,     1,  1052,  1053,  1054,  1055,  1005,   112,     7,     8,
       9,   855,   270,     3,   234,     5,   236,  1568,  1104,   112,
    1070,  1071,     7,     8,     9,    74,    74,  1077,   872,  1079,
      79,    79,    12,    13,   112,   255,  1086,    86,    86,  1568,
    1090,    31,  1851,  1852,  1094,  1029,  1096,    11,    69,    70,
    1100,    11,   111,  1077,  1104,  1105,   119,  1945,   117,  1947,
     109,  1949,  1581,    74,   119,   113,   485,   723,    79,   118,
       7,     8,     9,  1123,    74,    86,  1456,   719,   720,    79,
    1130,  1071,  1469,  1470,  1779,     1,    86,  1137,   120,   109,
     112,   116,  1479,   131,   116,   751,   121,   118,   120,  1987,
    1988,   123,  1990,   132,   110,   747,   748,  1106,   119,   129,
     130,   125,     1,   119,     3,   115,   116,   117,  2006,   942,
     943,   120,   508,   946,   947,     3,     3,     5,     5,  1128,
     110,   111,     3,   118,  2022,   120,  1746,   597,   598,   599,
     600,     3,   111,   111,   906,   907,   908,   111,   117,   117,
     111,   111,   116,   117,    31,   119,   117,   117,    74,   119,
    1144,   419,   420,    79,   116,    16,   111,  1690,   725,   121,
      86,  1690,   117,   431,   394,   112,   562,   397,   597,   598,
     599,   600,   113,   120,  1320,    74,   123,   445,   446,   109,
      79,   125,   112,     1,    65,     3,   753,    86,   111,   115,
     116,   117,   621,   123,   117,   111,     0,   719,   720,   467,
     468,   117,    74,   131,   472,   473,   113,    79,   476,   477,
     109,   711,   712,   112,    86,   132,   115,   111,   117,   118,
      16,   109,   110,   117,  1320,   747,   748,  1323,   109,   110,
    1290,  1291,  1086,   119,  1294,  1295,   504,   109,   506,  1299,
    1300,   741,   742,   709,   710,     3,   118,     3,   754,   119,
    1396,  1397,  1398,  1399,   113,   485,    74,   112,   117,   111,
    1320,    79,   121,  1323,   111,   117,   772,   773,    86,  1329,
     117,    75,  1332,   739,   740,    14,    15,   111,  1338,  1339,
      84,   711,   712,   117,  1344,  1345,   116,    91,    92,  1385,
     111,   109,   997,   119,   112,  1000,   117,   115,   113,   117,
     118,  1295,   117,   113,  1400,   113,  1366,   117,  1368,   117,
    1370,   741,   742,  1373,   115,     1,    74,     3,    74,  1716,
     113,    79,   113,    79,   117,  1385,   117,   119,    86,   121,
      86,  1391,  1392,  1038,    10,    11,  1396,  1397,  1398,  1399,
    1960,   113,   113,   126,   127,   117,   117,  1052,  1053,  1054,
    1055,   109,   115,   109,   113,   117,   112,   113,   117,   113,
     118,   113,  1371,   117,   119,   117,   121,   597,   598,   599,
     600,   115,  1905,   113,  1146,  1147,  1905,   117,  1524,   110,
    1456,  1153,  1154,    44,    45,  1157,  1158,   110,   113,   113,
     620,   621,   117,   117,   137,   110,  1456,   121,   141,   116,
    1630,  1631,  1632,  1633,  1634,  1635,  1636,  1637,   117,  1469,
    1470,    69,    70,    74,    75,    14,    15,  1477,    79,  1479,
    1480,   119,   113,  1483,   124,    86,   117,  1487,    44,    45,
     121,  1491,  1965,    91,  1494,  1964,  1965,    95,   119,    97,
     244,   113,    88,    89,    90,   117,   419,   420,   844,   121,
     254,   112,   256,   119,   119,   121,   121,  1517,    74,    75,
     118,   822,   823,    79,  1524,   115,   115,   117,   117,  1565,
      86,   124,   445,   446,     1,  1571,     3,   124,   115,  1876,
     117,  1878,     1,   119,     3,   121,   882,   119,     1,   121,
       3,   822,   823,   109,   467,   468,  1490,   490,   491,   472,
     473,   119,  1644,   476,   477,  1565,   117,     1,  1568,     3,
     117,  1571,  1506,   117,  1610,  1611,   117,  1613,  1614,   119,
      44,    45,  1618,  1619,  1620,  1621,     1,   997,     3,  1589,
    1000,  1591,  1592,   125,  1630,  1631,  1632,  1633,  1634,  1635,
    1636,  1637,   118,  1940,  1640,   137,   115,   115,   117,   141,
      74,    75,   115,   484,   117,    79,   490,   491,  1391,  1392,
     121,  1570,    86,  1572,   119,  1625,   121,   963,  1038,     1,
    1671,     3,  1673,   377,     1,   112,     3,  1586,  1587,     1,
    1640,     3,  1052,  1053,  1054,  1055,   112,  1647,   112,  1649,
       1,   112,     3,   115,  1695,   117,  1697,   115,   115,  1659,
     117,   115,  1456,   117,   119,  1408,   121,  1410,   115,  1005,
    1840,  1671,  1408,  1673,  1410,   597,   598,   885,    91,    92,
     424,   597,   598,  1052,  1053,  1054,  1055,   764,   765,   112,
     112,   115,   119,   113,   115,  1695,   115,  1697,   115,   231,
     110,   119,   118,  1072,   110,   119,   115,   115,   115,   110,
    1710,  1711,  1712,  1713,   118,   115,  1716,   115,   113,   116,
    1720,  1721,   118,  1723,   118,  1725,   113,   897,   113,    56,
     113,  1671,   124,  1673,   942,   943,   124,  1737,   946,   947,
     124,  1777,   274,   113,   121,   121,  1746,   121,   280,  1749,
     115,   112,   112,  1465,  1466,  1695,   112,  1697,   115,   112,
     115,   110,   110,   115,   123,  1851,  1852,   113,   113,   113,
    1106,  1964,   110,   112,   110,   112,   123,  1777,   113,  1779,
     113,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   113,  1128,   117,   117,  1589,   113,   118,   123,   113,
     113,   121,   121,   121,  1840,   121,  1740,  1848,  1742,  1964,
     121,   121,   121,   121,   113,   686,   113,   115,   113,   124,
     124,   124,    56,   112,  1469,  1470,   113,   997,   121,  1778,
    1000,   121,   112,   112,  1479,   113,   113,   113,   370,  1788,
     113,   113,   113,   113,   376,   110,  1846,  1847,  1848,  1849,
    1850,  1851,  1852,   115,    11,   124,   388,  1857,  1858,  1859,
    1860,   732,  1070,  1071,   124,   123,   123,  1867,  1038,   124,
     124,  1953,  1954,   119,   116,   119,  1876,   115,  1878,   116,
     624,   121,  1052,  1053,  1054,  1055,   121,  1887,  1888,   116,
     116,   112,   115,   113,  1843,  1844,   113,   119,   113,   124,
       0,    64,  1072,    64,   113,   124,   124,   113,  1848,   441,
     124,   124,   124,   124,   124,   113,   115,   113,   113,   124,
     124,   124,  1922,  1923,   124,   115,   115,  1927,  1928,   115,
     115,  1931,   119,  1933,   113,   115,  1936,   115,   115,   115,
    1940,    41,   115,   115,  1656,  1657,   115,   115,   115,   115,
    1884,    51,  1886,   431,  1954,   431,  1956,   431,    58,   431,
    1960,   431,   770,   892,  1995,  1366,   254,   655,   254,   270,
     270,   883,   914,  1973,   270,    75,   388,   853,    78,  1780,
     231,   425,  1944,    83,    84,  1779,   280,    91,    84,   236,
      84,    91,    92,    92,    84,  1995,  1996,  1625,    -1,    -1,
      -1,  2001,    -1,    -1,   104,     0,    -1,   107,    -1,    -1,
    1944,  1945,  2012,  1947,    -1,  1949,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,   124,   125,    -1,   127,    -1,   942,
     943,    -1,    -1,   946,   947,  1371,    -1,   137,    -1,   139,
     140,   141,   142,    -1,   144,    -1,   790,    -1,   919,    -1,
      -1,    -1,    -1,  1987,  1988,    -1,  1990,    -1,    -1,  1469,
    1470,    -1,    -1,   163,    -1,    -1,    -1,    -1,    -1,  1479,
     170,  1716,  2006,  1846,  1847,    -1,  1849,  1850,    -1,    -1,
      75,    -1,   182,    -1,  1857,  1858,  1859,  1860,  2022,    84,
      -1,   191,   124,    -1,    -1,   127,    91,    92,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,   144,    -1,    -1,    -1,    -1,    -1,   650,   651,
      -1,    -1,   654,   655,    -1,    -1,    -1,    -1,   872,    -1,
     125,   231,    -1,    -1,   234,   235,   236,    -1,    -1,    -1,
      -1,    -1,   137,    -1,   244,    -1,   141,    -1,    -1,  1922,
    1923,    -1,    -1,    -1,   254,   255,   256,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1040,
     914,    -1,     0,  1044,   274,    -1,  1047,    -1,  1049,    -1,
     280,    -1,    -1,  1391,  1392,    -1,    -1,    -1,   288,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1093,    -1,    -1,    -1,    -1,    -1,  1099,    -1,
      -1,  1876,    -1,  1878,  1570,    -1,  1572,    -1,    -1,    -1,
      -1,    -1,    -1,   343,    -1,    -1,    -1,    75,  1418,   244,
    1586,  1587,    -1,    -1,    -1,    -1,    84,   789,    -1,   254,
      -1,   256,    -1,    91,    92,    -1,    -1,    -1,   800,    -1,
     370,    -1,   372,   373,    -1,    -1,   376,   377,     0,    -1,
      -1,    -1,    -1,   383,    -1,    -1,    -1,   387,   388,    -1,
     390,    -1,    -1,    -1,    -1,  1940,    -1,    -1,    -1,  1469,
    1470,    -1,    -1,    -1,    -1,    -1,  1716,    -1,    -1,  1479,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   419,
     420,    -1,    -1,    -1,   424,   425,    -1,    -1,    -1,    -1,
      -1,   431,    -1,    -1,    -1,    -1,   436,    -1,    -1,    -1,
      -1,   441,    -1,    -1,    -1,   445,   446,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    84,   191,    -1,    -1,    -1,   467,   468,    91,
      92,    -1,   472,   473,    -1,    -1,   476,   477,   478,    -1,
      -1,   376,   914,    -1,    -1,   485,    44,   419,   420,    -1,
      -1,    -1,    -1,   388,    -1,    -1,    -1,    -1,    -1,   499,
      -1,    -1,    -1,   125,   504,    -1,   506,   507,   508,    -1,
      -1,    -1,    -1,   445,   446,   137,   244,    75,    76,   141,
      -1,    -1,    -1,    -1,   524,    -1,   254,   527,   256,   529,
      -1,   531,    -1,    -1,    -1,   467,   468,   537,    -1,    -1,
     472,   473,  1778,    -1,   476,   477,   441,    -1,    -1,    -1,
      -1,    -1,  1788,    -1,    -1,    -1,    -1,    -1,   116,   117,
      -1,    -1,    -1,  1671,    -1,  1673,  1876,    -1,  1878,    -1,
      -1,    -1,   504,    -1,   506,    -1,    -1,    -1,  1391,  1392,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1695,    -1,  1697,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   597,   598,   599,
     600,    -1,   160,   161,    -1,    -1,    -1,  1843,  1844,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,    -1,    -1,
     620,   621,   244,    -1,   624,    -1,    -1,    -1,    -1,   629,
    1940,    -1,   254,   191,   256,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,   643,    -1,    -1,  1716,    -1,    -1,    -1,
     650,   651,   652,    -1,   654,   655,    -1,    -1,    -1,    -1,
      -1,    -1,  1433,    -1,    -1,    -1,    -1,    -1,    -1,   669,
      -1,  1103,   672,   231,    -1,    -1,    -1,    65,   678,   103,
      -1,   681,    -1,    71,    72,    -1,   244,    -1,    -1,    -1,
      -1,  1123,    -1,    -1,    -1,    -1,   424,    85,  1130,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,   624,
      -1,    -1,    -1,    -1,   122,   123,    -1,    -1,  1846,  1847,
    1848,  1849,  1850,    -1,    -1,    -1,    -1,    -1,    -1,  1857,
    1858,  1859,  1860,    -1,   376,    -1,    -1,    -1,    -1,    -1,
     760,    -1,    -1,   763,   764,   765,   388,   767,    -1,    -1,
     770,   771,    -1,    -1,   774,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   789,
     790,    -1,   350,    -1,   352,    -1,    -1,   797,    -1,    -1,
     800,    -1,   802,    -1,   804,    -1,  1876,    -1,  1878,    -1,
      -1,    -1,   236,    -1,  1922,  1923,    -1,    -1,    -1,   441,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   389,    -1,  1604,    -1,    -1,    -1,    -1,  1609,    -1,
      -1,  1612,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   855,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   424,   291,    -1,    -1,
    1940,    -1,   872,   873,    -1,    -1,    -1,    -1,    -1,    -1,
     880,   881,    -1,    -1,    -1,   885,    -1,    -1,    -1,    -1,
     822,   823,   892,    -1,   789,    -1,   624,    -1,    -1,    -1,
      -1,   629,    -1,    -1,    -1,   800,   906,   907,   908,    -1,
      -1,    -1,    -1,    -1,   914,    -1,    -1,    -1,    -1,  1690,
      -1,    -1,   480,    -1,   482,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   490,   491,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   942,   943,    -1,    -1,   946,   947,    -1,   507,
      -1,   509,    -1,   885,    -1,    -1,    -1,    -1,    -1,   517,
      -1,   519,   962,   963,    -1,    -1,    -1,   967,    -1,    -1,
      -1,    -1,    -1,   973,    -1,    -1,    -1,    -1,    -1,   979,
      -1,    -1,    -1,    -1,    -1,   985,    -1,    -1,    -1,    -1,
      -1,    -1,   550,    -1,   994,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   624,    -1,    -1,    -1,    -1,    -1,    -1,  1780,
     942,   943,    -1,    -1,   946,   947,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     0,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   760,  1846,  1847,    -1,  1849,  1850,    -1,    -1,
      -1,    -1,    -1,    -1,  1857,  1858,  1859,  1860,    -1,    -1,
      -1,    -1,  1052,  1053,  1054,  1055,    -1,    -1,    -1,    -1,
     484,    -1,   790,    -1,    -1,    -1,    -1,    -1,    44,   797,
    1070,  1071,  1072,    -1,    -1,    -1,   804,  1077,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1086,    -1,     0,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,  1103,  1104,  1105,    82,    -1,    84,  1922,
    1923,    -1,   536,    -1,    -1,    91,    92,    -1,    -1,    -1,
      -1,    -1,    -1,  1123,    -1,    -1,    -1,   855,    -1,    -1,
    1130,    -1,    -1,    -1,  1905,    -1,    -1,    -1,  1070,  1071,
      -1,   117,   118,   567,   872,    -1,  1146,  1147,   124,    -1,
      -1,   127,    -1,  1153,  1154,    -1,    -1,  1157,  1158,    -1,
      -1,    -1,    -1,    75,   140,    -1,   142,   789,   144,    -1,
      -1,    -1,    84,   597,   598,   599,   600,    -1,   800,    91,
      92,    -1,    -1,    -1,    -1,   161,   162,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1965,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   125,    -1,   191,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   137,    -1,    -1,    -1,   141,
      -1,    -1,   656,    -1,    -1,    -1,   660,    -1,    -1,   797,
      -1,    -1,    -1,    -1,   802,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   231,    -1,    -1,    -1,    -1,
      -1,    -1,   686,    -1,    -1,    -1,    -1,    -1,   244,    -1,
      -1,    -1,    -1,   291,    -1,    -1,   700,    -1,   254,    -1,
     256,    -1,    -1,    -1,   842,    -1,    -1,    -1,   306,    -1,
      -1,   849,   850,    -1,    -1,    -1,    -1,   855,    -1,  1299,
    1300,    -1,    -1,   727,   862,    -1,    -1,    -1,   732,    -1,
      -1,   735,    -1,    -1,   872,    -1,    -1,    -1,    -1,    -1,
    1320,    -1,    -1,  1323,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   755,   244,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   254,    -1,   256,    -1,    -1,    -1,    -1,  1077,
      -1,    -1,    -1,    78,    -1,    -1,   914,    -1,  1086,    -1,
      -1,    -1,    -1,    -1,  1364,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   350,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1385,    -1,    -1,    -1,     1,
      -1,  1391,  1392,    -1,   370,    -1,  1396,  1397,  1398,  1399,
      -1,   377,    -1,   961,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   389,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,   419,   420,    -1,    -1,    -1,   424,    -1,
      -1,    -1,   428,    -1,    66,   431,  1456,    -1,    -1,  1391,
    1392,    -1,    74,    75,   376,  1465,  1466,    79,    -1,   445,
     446,    -1,    -1,    85,    86,    87,   388,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,   100,    -1,
      -1,   467,   468,    -1,    -1,   919,   472,   473,    -1,    -1,
     476,   477,    -1,    -1,   480,    -1,    -1,   119,    -1,    -1,
      -1,    -1,    -1,    -1,   490,   491,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1524,    -1,    -1,    -1,   504,   441,
     506,   507,    -1,   509,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   519,    -1,   521,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   572,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1565,    -1,    -1,  1568,    -1,
      -1,  1571,    -1,   997,    -1,    -1,  1000,    -1,    -1,    -1,
     110,   111,    -1,    -1,    -1,  1009,    -1,    -1,    -1,  1589,
     120,    -1,    -1,    -1,    -1,   125,   126,   127,    -1,   129,
     130,   131,   132,   133,    -1,    -1,    -1,  1031,  1032,    -1,
      -1,    -1,    -1,    -1,  1038,    -1,  1040,    -1,   343,    -1,
    1044,    -1,    -1,  1047,    -1,  1049,    -1,    -1,  1052,  1053,
    1054,  1055,    -1,    -1,    -1,    83,    -1,    -1,    -1,    -1,
    1640,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   624,    -1,
      -1,    -1,   377,    -1,    -1,    -1,  1656,  1657,    -1,    -1,
      -1,    -1,   387,    -1,    -1,   390,    -1,    -1,   686,  1093,
     306,  1671,    -1,  1673,   650,  1099,    -1,    -1,   654,    -1,
      -1,    -1,   700,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   669,    -1,  1695,    -1,  1697,    -1,    -1,
     425,   719,   720,   721,   722,   723,   431,    -1,   726,   727,
      -1,    -1,   624,    -1,   732,   163,    -1,   735,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1150,    -1,  1456,   747,
     748,   749,   750,   751,    -1,    -1,   754,   755,    -1,  1671,
      -1,  1673,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   772,   773,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1695,    -1,  1697,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   499,    -1,    -1,  1777,    -1,  1779,
    1338,  1339,   507,    -1,    -1,    -1,   234,   235,   236,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   774,   524,
      -1,    -1,   527,    -1,   529,    -1,   531,   255,  1366,    -1,
    1368,    -1,  1370,   789,   790,    -1,    -1,    -1,    -1,    -1,
      -1,   797,    -1,    -1,   800,    -1,   802,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     170,    -1,    -1,    -1,    -1,    -1,  1846,  1847,  1848,  1849,
    1850,  1851,  1852,    -1,    -1,    -1,    -1,  1857,  1858,  1859,
    1860,    -1,    -1,    -1,    -1,   124,   842,    -1,   127,    -1,
      -1,    -1,    -1,    -1,   850,    -1,    -1,   789,    -1,   855,
      -1,   140,    -1,   142,    -1,   144,   862,    -1,   800,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   872,    -1,  1456,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   885,
      -1,    -1,    -1,    -1,  1846,  1847,  1848,  1849,  1850,    -1,
      -1,    -1,  1922,  1923,    -1,  1857,  1858,  1859,  1860,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   572,    -1,   914,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   291,    -1,    -1,    -1,    -1,   942,   943,    -1,    -1,
     946,   947,    -1,    -1,    -1,    -1,    -1,   236,    -1,    -1,
      -1,    -1,    -1,   959,    -1,   961,    -1,    -1,    -1,    -1,
    1922,  1923,    -1,    -1,  1012,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1433,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1040,    -1,    -1,    -1,    -1,    -1,    -1,  1047,
     478,    -1,    -1,    -1,    -1,    -1,    -1,   485,   763,   764,
     765,    -1,    -1,    -1,    -1,  1469,  1470,    -1,    -1,   774,
     686,    -1,    -1,  1477,    -1,  1479,  1480,    -1,    -1,  1483,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1491,    -1,    -1,
    1494,    -1,    -1,    -1,    -1,  1093,    -1,    -1,    -1,    -1,
      -1,  1099,    -1,   719,   720,   721,   722,   723,    -1,  1647,
     726,  1649,    -1,    -1,  1070,  1071,   732,    -1,    -1,    -1,
      -1,  1659,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1086,   747,   748,   749,   750,   751,    -1,    -1,   754,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1103,    -1,  1105,
      -1,    -1,  1150,    -1,    -1,    -1,   772,   773,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1123,   478,   597,
     598,   599,   600,    -1,  1130,    -1,    -1,  1581,    -1,    -1,
     419,   420,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1593,
      -1,    -1,   620,   621,    -1,    -1,   124,    -1,   508,   127,
    1604,    -1,    -1,    -1,    -1,  1609,   445,   446,  1612,    -1,
      -1,    -1,   140,    -1,   142,   643,   144,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   536,    -1,   467,   468,
      -1,    -1,    -1,   472,   473,    -1,    -1,   476,   477,   478,
      -1,    -1,    -1,    -1,   672,    -1,    -1,    -1,    -1,    -1,
     678,    -1,   562,   681,    -1,    -1,    -1,   962,    -1,    -1,
      -1,    -1,   967,    -1,    -1,   504,    -1,   506,   973,    -1,
      -1,    -1,    -1,    -1,   979,    -1,    -1,    -1,    -1,    -1,
     985,    -1,    -1,    -1,    -1,    -1,  1690,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1710,  1711,  1712,  1713,
      -1,   119,  1716,    -1,    -1,    -1,  1720,  1721,    -1,  1723,
      -1,  1725,    -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,
      -1,    -1,    -1,  1737,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1747,  1748,    -1,   656,    -1,    -1,    -1,
     660,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   597,   598,
     599,   600,   672,    -1,    -1,    -1,    -1,    -1,   678,    -1,
      -1,   681,    -1,    -1,    -1,    -1,  1780,    -1,    -1,    -1,
      -1,    -1,    -1,  1339,    -1,    -1,    -1,    -1,    -1,    -1,
     700,    -1,    -1,    -1,    -1,    -1,  1012,    -1,    -1,    -1,
    1105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1366,    -1,    -1,    -1,    -1,    -1,    -1,   727,    -1,    -1,
      -1,    -1,    -1,    -1,  1040,   735,    -1,    -1,    -1,    -1,
      -1,  1047,    -1,   672,    -1,  1391,  1392,    -1,    -1,   678,
      -1,    -1,   681,    -1,    -1,   755,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   266,    -1,
      -1,    -1,    -1,  1867,    -1,    -1,    -1,   275,    -1,    -1,
      -1,    -1,  1876,   281,  1878,    -1,    -1,  1093,   906,   907,
     908,    -1,    -1,  1099,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   419,   420,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1456,  1905,    -1,   431,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   445,   446,    -1,
      -1,    -1,    -1,  1927,  1928,    -1,    -1,  1931,    -1,  1933,
      -1,   841,  1936,    -1,   844,    -1,  1940,    -1,    -1,   467,
     468,    -1,  1946,    -1,   472,   473,    -1,    -1,   476,   477,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1964,  1965,    -1,    -1,   372,    -1,   994,    -1,    -1,  1973,
      -1,    -1,   882,    -1,    -1,    -1,   504,    -1,   506,    -1,
      -1,    -1,    -1,   822,   823,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1299,  1300,   906,  2001,   908,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1604,    -1,    -1,    -1,
      -1,  1609,  1610,  1611,  1612,  1613,  1614,    -1,    -1,    -1,
    1618,  1619,  1620,  1621,  1052,  1053,  1054,  1055,    -1,    -1,
      -1,    -1,  1630,  1631,  1632,  1633,  1634,  1635,  1636,  1637,
      -1,    -1,    -1,    -1,  1072,    -1,   885,    -1,    -1,    -1,
      -1,    -1,    -1,   963,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,    -1,   908,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   994,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1005,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   942,   943,    -1,    -1,   946,   947,    -1,
      -1,    -1,    -1,    -1,    -1,  1671,    -1,  1673,  1146,  1147,
      -1,  1031,  1032,    -1,    -1,  1153,  1154,    -1,    -1,  1157,
    1158,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1695,
      -1,  1697,    -1,    -1,    -1,    -1,    -1,    -1,  1704,    -1,
      -1,    -1,    -1,   103,    -1,   994,    -1,    -1,   997,    -1,
      -1,  1000,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
    1009,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1106,    -1,    -1,  1038,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1052,  1053,  1054,  1055,   625,  1128,    -1,
     170,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1070,  1071,    -1,    -1,    -1,    -1,  1147,    -1,    -1,
    1150,    -1,    -1,    -1,  1154,    -1,    -1,    -1,  1158,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1568,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1846,  1847,  1848,  1849,  1850,    -1,    -1,    -1,    -1,    -1,
      -1,  1857,  1858,  1859,  1860,    -1,    -1,    -1,  1147,    -1,
      -1,    -1,    -1,    -1,    -1,  1154,   266,    -1,    -1,  1158,
      -1,   271,   272,    -1,    -1,   275,    -1,    -1,    -1,    -1,
      -1,   281,    -1,    -1,    -1,    -1,  1364,    -1,    -1,    -1,
      -1,   291,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   306,   885,    -1,   767,
      -1,   311,   770,   771,    -1,    -1,  1922,  1923,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1604,    -1,
      -1,    -1,    -1,  1609,  1610,  1611,  1612,  1613,  1614,    -1,
      -1,    -1,  1618,  1619,  1620,  1621,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   942,   943,    -1,    -1,   946,   947,
      -1,    -1,   372,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1465,  1466,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1364,    -1,    -1,    -1,    -1,    -1,
      -1,  1371,    -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1408,    -1,
    1410,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1427,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1364,    -1,    -1,   478,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,  1070,  1071,    -1,    -1,    71,    72,    73,    74,
      -1,    -1,  1391,  1392,    79,    -1,  1466,    -1,   508,    84,
      85,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1408,
      -1,  1410,   567,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,   536,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,   599,   600,    -1,    -1,    -1,    -1,
      -1,    -1,   562,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1466,  1656,  1657,
    1469,  1470,    -1,    -1,    -1,    -1,    -1,    -1,  1477,    -1,
    1479,  1480,    -1,    -1,  1483,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1491,    -1,    -1,  1494,    -1,    -1,    -1,    -1,
    1570,    -1,  1572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1581,    -1,    -1,    -1,   625,  1586,  1587,    -1,   629,
      -1,    -1,    -1,  1593,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1104,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   656,    -1,    -1,    -1,
     660,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   672,    -1,    -1,    -1,    -1,    -1,   678,    -1,
      -1,   681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1657,    -1,    -1,
     700,    -1,    -1,    -1,    -1,    -1,   706,   707,   708,   709,
     710,   711,   712,    -1,    -1,   715,   716,    -1,   718,   719,
     720,   721,   722,   723,   724,   725,    -1,   727,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   735,   736,   737,   738,   739,
     740,   741,   742,   743,   744,   745,   746,   747,   748,   749,
     750,   751,   752,   753,    -1,   755,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   767,  1657,    -1,
     770,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1671,    -1,  1673,    -1,    -1,  1747,  1748,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1695,    -1,  1697,    -1,
      -1,    -1,    -1,  1391,  1392,    -1,    -1,    -1,  1778,    -1,
      -1,  1710,  1711,  1712,  1713,    -1,    -1,  1716,  1788,    -1,
      -1,  1720,  1721,    -1,  1723,    -1,  1725,    -1,    -1,    -1,
      -1,   841,    -1,    -1,   844,    -1,    -1,    -1,  1737,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1320,    -1,    -1,  1323,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   882,  1843,  1844,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,    -1,    -1,    -1,    -1,   906,    -1,   908,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1385,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1400,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   997,    -1,    -1,  1000,    -1,  1846,  1847,  1848,
    1849,  1850,    -1,   963,  1009,    -1,    -1,   170,  1857,  1858,
    1859,  1860,    -1,    -1,    -1,    -1,    -1,    -1,  1867,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1946,  1876,    -1,  1878,
      -1,    -1,    -1,  1038,   994,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1964,  1005,    -1,  1052,  1053,  1054,
    1055,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1031,  1032,  1922,  1923,    -1,    -1,    -1,  1927,  1928,
      -1,    -1,  1931,    -1,  1933,    -1,    -1,  1936,    -1,    -1,
      -1,  1940,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   266,    -1,    -1,    -1,    -1,   271,   272,
      -1,    -1,   275,    -1,    -1,    -1,    -1,    -1,   281,    -1,
      -1,    -1,    -1,    -1,  1973,    -1,    -1,    -1,   291,    -1,
      -1,    -1,    -1,  1671,    -1,  1673,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   306,  1104,    -1,  1106,  1565,   311,    -1,
      -1,    -1,  2001,  1571,    -1,    -1,    -1,  1695,    -1,  1697,
      -1,    -1,     1,    -1,     3,     4,     5,     6,  1128,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1143,    -1,    -1,    -1,  1147,    -1,    28,
    1150,    -1,  1610,  1611,  1154,  1613,  1614,    -1,  1158,    -1,
    1618,  1619,  1620,  1621,    -1,    -1,    -1,    -1,    -1,   372,
      -1,    -1,  1630,  1631,  1632,  1633,  1634,  1635,  1636,  1637,
      -1,    -1,  1640,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    84,    85,    -1,     0,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,   123,   124,   125,   126,   127,   128,
      -1,    -1,    44,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1846,  1847,
    1848,  1849,  1850,    -1,    -1,   478,    -1,    -1,    -1,  1857,
    1858,  1859,  1860,    75,    76,    -1,    -1,    -1,    80,    -1,
      82,    -1,    84,    -1,    -1,    -1,    -1,    -1,    -1,    91,
      92,    -1,    -1,    -1,    -1,   508,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1777,
    1320,    -1,    -1,  1323,   116,   117,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   536,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1922,  1923,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   562,
      -1,    -1,    -1,    -1,  1364,    -1,    -1,    -1,   160,   161,
      -1,  1371,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1840,    -1,    -1,  1385,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   191,
    1400,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1408,   201,
    1410,   203,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   625,    -1,  1469,  1470,   629,  1427,    -1,    -1,
      -1,    -1,  1477,    -1,  1479,  1480,    -1,    -1,  1483,   231,
      -1,    -1,    -1,    -1,    -1,    -1,  1491,    -1,    -1,  1494,
      -1,    -1,   244,   656,    -1,    -1,    -1,   660,    -1,    -1,
      -1,    -1,   254,    -1,   256,    -1,  1466,    -1,    -1,   672,
      -1,    -1,    -1,    -1,    -1,   678,    -1,    -1,   681,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   700,    -1,    -1,
      -1,    -1,    -1,   706,   707,   708,   709,   710,   711,   712,
      -1,    -1,   715,   716,    -1,   718,   719,   720,   721,   722,
     723,   724,   725,    -1,   727,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   735,   736,   737,   738,   739,   740,   741,   742,
     743,   744,   745,   746,   747,   748,   749,   750,   751,   752,
     753,    -1,   755,    -1,    -1,    -1,    -1,    -1,   350,    -1,
     352,    -1,    -1,    -1,   767,  1565,    -1,   770,   771,    -1,
    1570,  1571,  1572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1581,    -1,    -1,    -1,    -1,  1586,  1587,    -1,    -1,
      -1,    -1,    -1,  1593,    -1,    -1,    -1,   389,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1610,  1611,    -1,  1613,  1614,    -1,    -1,    -1,  1618,  1619,
    1620,  1621,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1630,  1631,  1632,  1633,  1634,  1635,  1636,  1637,   841,    -1,
    1640,   844,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1657,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1710,  1711,  1712,  1713,    -1,
     873,  1716,    -1,    -1,    -1,  1720,  1721,    -1,  1723,   882,
    1725,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   480,    -1,
     482,    -1,  1737,    -1,    -1,    -1,    -1,    -1,   490,   491,
      -1,    -1,    -1,   906,    -1,   908,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   507,    -1,   509,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   517,    -1,   519,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    44,    -1,    -1,    -1,  1747,  1748,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   550,    -1,
     963,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,  1777,  1778,    80,
      -1,    82,    -1,    -1,    -1,    -1,    -1,    -1,  1788,    -1,
      -1,   994,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1005,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   116,   117,    -1,    -1,    -1,
      -1,    -1,  1867,    -1,    -1,    -1,    -1,    -1,  1031,  1032,
      -1,  1876,   624,  1878,    -1,    -1,    -1,    -1,    -1,    -1,
    1840,    -1,    -1,  1843,  1844,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   160,
     161,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     0,    -1,
      -1,    -1,  1927,  1928,    -1,    -1,  1931,    -1,  1933,    -1,
     191,  1936,    -1,    -1,    -1,  1940,    -1,    -1,    -1,    -1,
     201,  1104,   203,  1106,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    43,    -1,    -1,    -1,  1128,    -1,    -1,  1973,    -1,
     231,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1143,    -1,    -1,   244,  1147,    -1,  1946,  1150,    -1,    -1,
      -1,  1154,    -1,    75,    -1,  1158,  2001,    -1,    -1,    -1,
      -1,    83,    84,    -1,  1964,    -1,    -1,    -1,    -1,    91,
      92,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    28,    -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,
     802,    -1,    -1,    -1,    -1,   137,    -1,   139,    -1,   141,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,   163,    -1,    -1,    71,    72,    73,    -1,    -1,   350,
     842,   352,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,
      -1,    -1,    -1,   855,    -1,    -1,    -1,    -1,    -1,   191,
     862,    98,    -1,    -1,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,   389,    -1,
     117,    -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,     3,    -1,    -1,    -1,    -1,   231,
      -1,    -1,   234,   235,   236,    -1,    -1,  1320,    -1,    -1,
    1323,    -1,   244,    -1,    -1,    -1,   427,   428,    -1,    28,
      -1,    -1,   254,   255,   256,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,
      -1,  1364,    -1,    -1,    -1,    -1,   288,    66,  1371,   961,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,   480,
      79,   482,  1385,    82,    83,    -1,    85,    86,    87,   490,
     491,    -1,    -1,    -1,    -1,    -1,    -1,  1400,    -1,    -1,
      -1,   100,    -1,    -1,    -1,  1408,   507,  1410,   509,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   517,    -1,   519,    -1,
      -1,    -1,    -1,    -1,  1427,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   370,   550,
     372,   373,    28,    -1,   376,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1466,    -1,    -1,   388,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,   424,    79,    -1,    -1,    -1,    -1,    84,    85,
      86,    -1,    88,    89,    90,    -1,    -1,    -1,    -1,   441,
      -1,    -1,    98,    -1,    -1,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,    -1,   119,    -1,   121,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,   478,    -1,    -1,    -1,
      -1,    -1,  1565,   485,    -1,    -1,    -1,  1570,  1571,  1572,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1581,    -1,
      -1,    -1,    -1,  1586,  1587,    -1,    -1,    -1,    -1,    -1,
    1593,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1610,  1611,    -1,
    1613,  1614,    -1,    -1,    -1,  1618,  1619,  1620,  1621,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1630,  1631,  1632,
    1633,  1634,  1635,  1636,  1637,    -1,    -1,  1640,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   574,    -1,  1657,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   597,   598,   599,   600,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   620,   621,
      -1,   802,   624,    -1,    -1,    -1,    -1,   629,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   643,    -1,    -1,    -1,    -1,    -1,    -1,   650,   651,
     652,    -1,   654,   655,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   842,    -1,    -1,  1747,  1748,    -1,   669,   849,   850,
     672,    -1,    -1,    -1,   855,    -1,   678,    -1,   859,   681,
     861,   862,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1777,  1778,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1788,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    83,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1840,   760,    -1,
    1843,  1844,    -1,    -1,    -1,   767,    -1,    -1,   770,   771,
      -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,   125,    -1,
     961,    -1,    -1,    -1,  1456,    -1,    -1,   789,   790,    -1,
     137,    -1,   139,    -1,   141,   797,    -1,    -1,   800,   801,
     802,    -1,   804,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   163,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   855,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1946,    -1,    -1,    -1,    -1,    -1,    -1,
     872,   873,    -1,    -1,    -1,    -1,    -1,    -1,   880,   881,
      -1,  1964,    -1,    -1,   231,    -1,    -1,   234,   235,   236,
     892,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,   906,   907,   908,    -1,   255,    -1,
      -1,    -1,   914,    -1,    83,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
     139,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,   994,    -1,   163,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
     117,    -1,  1014,    -1,    -1,   122,   123,   124,   125,   126,
     127,   128,   191,   370,    -1,   372,   373,    -1,    -1,   376,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1052,  1053,  1054,  1055,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   231,    -1,    -1,   234,   235,   236,    -1,    -1,
    1072,    -1,    -1,    -1,    -1,    -1,    -1,   424,    -1,    -1,
      -1,    -1,    -1,    -1,  1086,    -1,   255,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   441,    -1,    -1,    -1,    -1,    -1,
      -1,  1103,  1104,    -1,    -1,   274,    -1,    -1,    -1,    -1,
       1,   280,     3,     4,     5,     6,    -1,     8,     9,   288,
      -1,  1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,    -1,
      -1,   478,    -1,    -1,    -1,    -1,    -1,    28,   485,    -1,
      -1,    -1,    -1,    -1,  1146,  1147,    -1,    -1,    -1,    -1,
      -1,  1153,  1154,    -1,    -1,  1157,  1158,    -1,    -1,    -1,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,  1368,    79,  1370,
      -1,    -1,    -1,    84,    85,    86,    -1,    88,    89,    90,
      -1,   370,    -1,   372,   373,    -1,    -1,    98,    -1,    -1,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,   115,    -1,   117,    -1,   119,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     597,   598,   599,   600,    -1,   424,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   620,   621,  1456,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,
      -1,    -1,    -1,   650,   651,     3,    -1,   654,   655,   478,
      -1,    -1,    -1,    -1,    -1,    -1,   485,    -1,  1320,    -1,
      -1,  1323,    -1,    -1,    -1,   672,    -1,    -1,    -1,    -1,
      28,   678,    -1,    -1,   681,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1364,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,  1385,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,  1396,  1397,  1398,  1399,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   760,   112,    -1,    -1,    -1,    -1,    -1,
     767,    -1,    -1,   770,   771,   123,    -1,    -1,   597,   598,
     599,   600,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   789,   790,    -1,    -1,    -1,    -1,    -1,    -1,
     797,   620,   621,   800,  1456,    -1,    -1,   804,    -1,    -1,
     629,    -1,    -1,  1465,  1466,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   643,    -1,    -1,    -1,    -1,    -1,
      -1,   650,   651,   652,    -1,   654,   655,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     669,    -1,    -1,   672,    -1,    -1,    -1,    -1,   855,   678,
      -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1524,    -1,    -1,   872,   873,    -1,    -1,    -1,
      -1,    -1,    -1,   880,   881,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   892,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,
     907,   908,    -1,  1565,    -1,    -1,    -1,   914,    -1,  1571,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1589,    -1,    -1,
      -1,   760,    -1,    -1,    -1,    -1,    -1,    -1,   767,    -1,
      -1,   770,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   790,    -1,    -1,    -1,    -1,    -1,    -1,   797,    -1,
      -1,    -1,    -1,   802,    -1,   804,    -1,    -1,  1640,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   994,    -1,    -1,
      -1,    -1,    -1,    -1,  1656,  1657,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    83,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   855,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,   872,   873,  1052,  1053,  1054,  1055,    -1,
      -1,   880,   881,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,   892,    -1,  1072,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   906,   907,   908,
      -1,    -1,    -1,    -1,    -1,   914,   163,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1103,  1104,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   191,  1777,  1123,  1779,    -1,    -1,
      -1,    -1,    -1,  1130,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1146,
    1147,    -1,    -1,    -1,    -1,    -1,  1153,  1154,    -1,    -1,
    1157,  1158,    -1,    -1,   231,    -1,    -1,   234,   235,   236,
      -1,    -1,    -1,    -1,    -1,   994,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   255,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1851,
    1852,    -1,    -1,    -1,    -1,    -1,    -1,   274,    -1,    -1,
      -1,    -1,    -1,   280,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   288,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1052,  1053,  1054,  1055,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1072,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1086,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1103,  1104,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   370,  1123,   372,   373,    -1,    -1,    -1,
      -1,  1130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1320,    -1,    -1,  1323,  1146,  1147,    -1,
      -1,    -1,    -1,    -1,  1153,  1154,    -1,    -1,  1157,  1158,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   424,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1364,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1385,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,  1396,
    1397,  1398,  1399,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   478,    -1,    -1,    -1,    -1,    -1,    -1,   485,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    84,    85,    86,    -1,    88,    89,    90,  1456,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,  1465,  1466,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,   119,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,  1320,    -1,    -1,  1323,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1524,    -1,    -1,
     597,   598,   599,   600,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1364,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   620,   621,    -1,    -1,    -1,    -1,    83,
      -1,    -1,   629,    -1,    -1,    -1,  1385,    -1,  1565,    -1,
      -1,    -1,    -1,    -1,  1571,    -1,   643,  1396,  1397,  1398,
    1399,    -1,    -1,   650,   651,   652,    -1,   654,   655,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,
      -1,   125,   669,    -1,    -1,   672,    -1,    -1,    -1,    -1,
      -1,   678,    -1,   137,   681,   139,    -1,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1456,    -1,   163,
      -1,    -1,    -1,  1640,    -1,    -1,  1465,  1466,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1656,
    1657,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   760,    -1,    -1,    -1,    28,    -1,    -1,
     767,    -1,    -1,   770,   771,  1524,    -1,   231,    -1,    -1,
     234,   235,   236,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   790,    -1,    -1,    -1,    -1,    -1,    -1,
     797,   255,    -1,    -1,    65,   802,    -1,   804,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,  1565,    -1,    -1,    -1,
     274,    -1,  1571,    84,    85,    -1,   280,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
    1589,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
    1777,   112,   113,   114,    -1,    -1,   117,    -1,   855,    -1,
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   872,   873,    -1,    -1,    -1,
      -1,    -1,    -1,   880,   881,    -1,    -1,    -1,    -1,    -1,
      -1,  1640,    -1,    -1,    -1,   892,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1656,  1657,   906,
     907,   908,    -1,    -1,    -1,    -1,   370,   914,   372,   373,
      83,    -1,   376,    -1,  1851,  1852,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   388,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
      -1,    -1,   125,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   137,    -1,   139,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   441,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   994,    -1,    -1,
     163,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    84,    85,    -1,   478,    -1,    -1,    -1,  1777,    -1,
    1779,   485,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,   117,  1052,  1053,  1054,  1055,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,   231,    -1,
      -1,   234,   235,   236,    -1,  1072,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1086,
      -1,    -1,   255,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1851,  1852,    -1,    -1,  1103,  1104,    -1,    -1,
      -1,   274,    -1,    -1,    -1,    -1,    -1,   280,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1123,    -1,    -1,    -1,
      -1,    -1,    -1,  1130,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   597,   598,   599,   600,    -1,    -1,  1146,
    1147,    -1,    -1,    -1,    -1,    -1,  1153,  1154,    -1,    -1,
    1157,  1158,    -1,    -1,    -1,    -1,   620,   621,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,   643,
      -1,    -1,    -1,    -1,    -1,    -1,   650,   651,    -1,    -1,
     654,   655,    -1,    -1,    -1,    28,    -1,   370,    -1,   372,
     373,    -1,    -1,   376,    -1,    -1,    -1,    -1,   672,    -1,
      -1,    -1,    -1,    -1,   678,   388,    -1,   681,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    -1,    88,    89,    90,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,   441,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,    -1,    -1,   119,    -1,   121,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
     236,    -1,    -1,   767,    -1,   478,   770,   771,    -1,    -1,
      -1,    -1,   485,  1320,    -1,    -1,  1323,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   789,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   800,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   288,    -1,    -1,    -1,    -1,  1364,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1385,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1396,
    1397,  1398,  1399,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   873,
      -1,    -1,    -1,    -1,    -1,    -1,   880,   881,   170,    -1,
      -1,    -1,    -1,    -1,   597,   598,   599,   600,   892,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   906,   907,   908,    -1,    -1,   620,   621,  1456,
     914,    -1,    -1,   389,    -1,    -1,    -1,    -1,  1465,  1466,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     643,    -1,    -1,    -1,    -1,    -1,    -1,   650,   651,    -1,
      -1,   654,   655,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   672,
      -1,    -1,    -1,    -1,    -1,   678,    -1,    -1,   681,    -1,
      -1,    -1,    -1,    -1,   266,    -1,    -1,  1524,    -1,    -1,
      -1,    -1,    -1,   275,    -1,    -1,    -1,    -1,    -1,   281,
     994,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1565,    -1,
      -1,    -1,    -1,    -1,  1571,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1589,    -1,    -1,    -1,    -1,    -1,  1052,  1053,
    1054,  1055,    -1,    -1,   767,    -1,    -1,   770,   771,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1072,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   789,    -1,    -1,    -1,
     372,    -1,    -1,    -1,    -1,    -1,    -1,   800,    -1,    -1,
      -1,    -1,    -1,  1640,    -1,    -1,   572,    -1,    -1,  1103,
    1104,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1656,
    1657,   587,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1123,
      -1,   597,   598,   599,   600,    -1,  1130,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1146,  1147,    -1,    -1,    -1,    -1,    -1,  1153,
    1154,    -1,    -1,  1157,  1158,    -1,    -1,    -1,    -1,    -1,
     873,    -1,   638,    -1,    -1,    -1,    -1,   880,   881,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   892,
      -1,    -1,    -1,    -1,    -1,    -1,   478,   663,    -1,    -1,
      -1,    -1,    -1,   906,   907,   908,    -1,    -1,    -1,    -1,
      -1,   914,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   688,    -1,    -1,    -1,   508,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1777,    -1,  1779,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     726,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   734,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     562,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   754,    -1,
      -1,   994,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   772,   773,    -1,    -1,
      -1,    -1,    -1,    -1,  1851,  1852,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1320,    -1,    -1,  1323,
      -1,    -1,    -1,    -1,    -1,    -1,   802,    -1,    -1,    -1,
      -1,    -1,    -1,   625,    -1,    -1,    -1,    -1,    -1,  1052,
    1053,  1054,  1055,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1072,
    1364,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     672,  1385,    -1,    -1,    -1,    -1,   678,    -1,    -1,   681,
    1103,  1104,  1396,  1397,  1398,  1399,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1123,    -1,    -1,    -1,    -1,    -1,    -1,  1130,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1146,  1147,    -1,    -1,    -1,    -1,    -1,
    1153,  1154,    -1,    -1,  1157,  1158,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1465,  1466,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   767,    -1,    -1,   770,   771,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   288,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1524,   997,    -1,    -1,  1000,  1001,  1002,    -1,  1004,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1012,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1020,    -1,    -1,    -1,    -1,   841,
      -1,  1027,   844,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1565,  1038,    -1,    -1,    -1,    -1,  1571,    -1,  1045,
      -1,    -1,    -1,    -1,  1050,    -1,  1052,  1053,  1054,  1055,
      -1,   873,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     882,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     389,    -1,    -1,    -1,    -1,    -1,    -1,  1320,    -1,    -1,
    1323,    -1,    -1,    -1,   906,    -1,   908,    -1,    -1,  1095,
      -1,    -1,    -1,    -1,    -1,  1101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,  1640,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1124,    -1,
      -1,  1364,  1656,  1657,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   963,  1385,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1396,  1397,  1398,  1399,    -1,    -1,    -1,
      -1,     1,  1168,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   994,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1005,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,  1220,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1465,  1466,    -1,    -1,    66,  1233,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,  1777,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,   572,    -1,    -1,    -1,    -1,    -1,     1,
     100,     3,     4,     5,     6,    -1,     8,     9,   587,    -1,
      -1,    -1,   591,    -1,    -1,    -1,    -1,    -1,  1284,    -1,
      -1,  1524,  1104,    -1,  1106,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1310,    -1,  1128,    -1,  1314,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1851,  1852,   638,
      -1,    -1,  1565,    65,    -1,  1147,    -1,    -1,  1571,    71,
      72,    73,  1154,   652,    -1,    -1,  1158,    -1,    -1,    -1,
      -1,    -1,    84,    85,   663,   664,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,   688,
     112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,   121,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,  1640,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   726,    -1,    -1,
      -1,    -1,    -1,  1656,  1657,   734,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   772,   773,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1469,  1470,    -1,    -1,  1473,    -1,  1475,
      -1,    -1,  1478,  1479,    -1,    -1,    -1,    -1,  1484,  1485,
      -1,  1487,    -1,   802,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1497,    -1,  1499,    -1,    -1,    -1,    -1,  1320,    -1,
      -1,  1323,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1777,    -1,    -1,    -1,  1544,    -1,
      28,    -1,  1364,    -1,    -1,    -1,    -1,  1553,    -1,  1371,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1385,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,  1400,    -1,
      -1,    -1,    -1,    71,    72,    73,  1408,    -1,  1410,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,    -1,
      88,    89,    90,    -1,    -1,  1427,    -1,    -1,  1851,  1852,
      98,    -1,    -1,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,     3,   112,    -1,   114,   115,    -1,    -1,
      -1,   119,    -1,   121,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,  1466,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1001,  1002,    -1,  1004,    66,    -1,    68,    -1,
      -1,    -1,    -1,  1012,    74,    75,    -1,  1016,    78,    79,
      -1,  1020,    82,    83,    -1,    85,    86,    87,  1027,  1028,
    1716,  1717,    -1,    -1,    -1,    -1,    -1,    -1,  1724,    -1,
     100,    -1,  1728,    -1,  1730,    -1,  1045,  1046,    -1,   109,
      -1,  1050,   112,  1739,   114,    -1,    -1,    -1,    -1,    -1,
      -1,   121,    -1,  1565,    -1,    -1,    -1,    -1,  1570,  1571,
    1572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1586,  1587,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1779,    -1,    -1,  1095,    -1,    -1,    -1,
      -1,    -1,  1101,    -1,    -1,    -1,    -1,    -1,  1610,  1611,
      -1,  1613,  1614,     0,    -1,    -1,  1618,  1619,  1620,  1621,
      -1,    -1,    -1,    -1,    -1,  1124,    -1,    -1,  1630,  1631,
    1632,  1633,  1634,  1635,  1636,  1637,    -1,    -1,  1640,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1657,    43,    44,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1168,
    1169,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,  1868,  1869,    -1,  1871,    -1,  1873,    75,    76,
    1876,  1877,  1878,    80,    -1,    -1,    -1,    84,    -1,    -1,
      -1,    -1,    -1,    -1,    91,    92,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,  1220,   109,  1222,    -1,    -1,    -1,    -1,    -1,   116,
      -1,    -1,    -1,    -1,  1233,  1234,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,  1929,    -1,    -1,  1932,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,  1940,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   160,    -1,  1777,  1778,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,  1284,  1788,  1286,    -1,    -1,
    1976,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   191,    -1,    -1,    -1,    -1,    -1,
      -1,  1310,    -1,  1312,    -1,  1314,    -1,  1316,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1840,    -1,
      -1,  1843,  1844,    -1,   231,     0,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,   244,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   254,    -1,   256,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,   118,   119,   120,   121,   122,   123,    -1,
     125,   126,   127,   128,  1473,  1474,  1475,  1476,    -1,  1478,
    1479,    -1,    -1,   370,    -1,  1484,  1485,    -1,  1487,    -1,
    1489,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1497,  1498,
    1499,    -1,   389,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   424,    -1,    -1,
     427,    -1,    -1,    -1,    -1,  1544,  1545,    -1,    -1,    -1,
       1,    -1,    -1,    -1,  1553,  1554,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,   490,   491,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
     507,    -1,   509,    74,    75,    -1,    -1,    -1,    79,    -1,
     517,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,    -1,   550,   115,   116,   117,   118,    -1,   120,
      -1,    -1,   123,    -1,   125,   126,   127,    -1,   129,   130,
     131,   132,   133,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,  1717,    -1,
      -1,    -1,    -1,  1722,    -1,  1724,  1725,    -1,  1727,  1728,
      -1,  1730,    -1,  1732,    -1,    -1,    -1,   624,    -1,  1738,
    1739,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,   650,    -1,    -1,    -1,   654,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1779,    -1,   669,    98,    -1,    -1,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,   121,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1868,
    1869,    -1,  1871,  1872,  1873,    -1,    -1,    -1,  1877,  1878,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   774,   775,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,   789,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     797,    -1,    -1,   800,   801,   802,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    1929,  1930,    -1,  1932,  1933,    -1,    -1,    -1,  1937,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,   842,    -1,    -1,    -1,    71,
      72,    73,   849,    -1,    -1,    -1,    -1,    -1,   855,    -1,
      -1,    -1,    84,    85,    -1,   862,    -1,  1976,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   872,    98,    -1,    -1,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     0,     1,   914,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,  1086,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,  1103,    -1,  1105,    85,
      86,    87,    -1,    -1,    -1,    -1,  1113,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,  1123,    -1,    -1,    -1,
      -1,     0,     1,  1130,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     0,     1,    -1,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    65,    66,    -1,
      68,  1338,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    -1,    96,  1366,
      98,    99,   100,    -1,   102,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,   132,   133,    -1,    -1,     0,     1,
      -1,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,  1456,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,    -1,    98,    99,   100,    -1,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,  1659,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    65,    66,    -1,    68,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    -1,    96,    -1,    98,    99,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   130,   131,   132,
     133,     0,     1,    -1,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     129,   130,   131,   132,   133,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,   133,     0,
       1,    -1,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    65,    66,    -1,    68,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    -1,    96,    -1,    98,    99,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,   110,
     111,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,     0,     1,    -1,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    65,    66,
      -1,    68,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    -1,    96,
      -1,    98,    99,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   119,   120,   121,   122,   123,    -1,   125,   126,
     127,   128,   129,   130,   131,   132,   133,     0,     1,    -1,
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
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
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
     109,    -1,    -1,   112,   113,   114,   115,    -1,   117,   118,
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
      45,    46,    47,    48,    49,    50,    -1,    -1,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    68,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    -1,    -1,    91,    92,    93,    94,
      -1,    96,    -1,    98,    99,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,   118,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    84,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,   100,    -1,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,   118,   119,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,   100,    -1,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     117,   118,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,   117,   118,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
       1,   114,     3,     4,     5,     6,    -1,     8,     9,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,     1,   114,     3,     4,     5,     6,    -1,     8,
       9,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    84,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    84,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    84,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,   100,    -1,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
       1,   114,     3,     4,     5,     6,   119,     8,     9,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    84,    85,    86,    87,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    98,    -1,   100,
      -1,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    28,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,   113,
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,   113,   114,    -1,    -1,   117,    -1,    -1,    -1,
      -1,   122,   123,   124,   125,   126,   127,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      98,    -1,    -1,    28,   102,   103,   104,   105,   106,   107,
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,   117,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
     115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,   118,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    84,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,   115,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,   115,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,   119,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,
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
     108,   109,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    84,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,   104,
     105,   106,   107,   108,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
     122,   123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    28,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   122,   123,    -1,   125,   126,   127,   128,
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
      -1,   114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,
     123,   124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,    -1,
      -1,   121,   122,   123,    -1,   125,   126,   127,   128,    -1,
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
     121,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
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
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,
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
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,   117,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,   117,    -1,    -1,
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
     114,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
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
     108,   109,    -1,    -1,   112,   113,   114,    -1,    -1,   117,
      -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,   127,
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
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,   118,   119,
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
     114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,
     124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,   124,
     125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,
     102,   103,   104,   105,   106,   107,   108,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,   121,
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
      -1,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,
     123,   124,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
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
      -1,    -1,    -1,    -1,   121,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,
      28,   102,   103,   104,   105,   106,   107,   108,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,    -1,
      -1,   122,   123,    -1,   125,   126,   127,   128,    -1,    -1,
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
     105,   106,   107,   108,   109,    -1,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,
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
     106,   107,   108,   109,    -1,    -1,   112,   113,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,
     126,   127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    98,    -1,    -1,    28,   102,
     103,   104,   105,   106,   107,   108,   109,    -1,    -1,   112,
      -1,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,
     123,    -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    84,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    98,    -1,
      -1,    28,   102,   103,   104,   105,   106,   107,   108,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,   123,    -1,   125,   126,   127,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    84,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    98,    -1,    -1,    28,   102,   103,   104,   105,   106,
     107,   108,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   122,   123,    -1,   125,   126,
     127,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    98,    -1,    -1,    -1,   102,   103,
     104,   105,   106,   107,   108,   109,    -1,    -1,   112,    -1,
     114,     0,     1,    -1,     3,     4,     5,    -1,   122,   123,
      -1,   125,   126,   127,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,    88,
      -1,    -1,    91,    92,    93,    94,    -1,    96,    -1,    98,
      99,   100,    -1,   102,   103,   104,   105,   106,   107,   108,
     109,    -1,    -1,   112,    -1,   114,   115,     0,     1,   118,
       3,     4,     5,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
      -1,   112,    -1,   114,   115,     1,    -1,     3,     4,     5,
      -1,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    80,    81,    82,    83,    -1,    85,
      86,    87,    88,    -1,    -1,    91,    92,    93,    94,    -1,
      96,    -1,    98,    99,   100,    -1,   102,   103,   104,   105,
     106,   107,   108,   109,    -1,    -1,   112,    -1,   114,   115,
       1,    -1,     3,     4,     5,    -1,   122,   123,    -1,    -1,
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
       1,   112,     3,   114,   115,    -1,    -1,    -1,    -1,    -1,
      -1,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   123,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     0,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   123,    -1,   125,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    96,    -1,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   115,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    96,
      -1,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,     0,    96,    -1,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   115,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    78,    79,    80,    81,    82,    83,    -1,    -1,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     0,    96,
      -1,    -1,    99,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    78,    79,    80,    81,
      82,    83,    -1,    -1,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    -1,    96,     3,    -1,    99,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,   119,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,
      -1,   119,    -1,    -1,    -1,   123,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,   123,    28,    29,    30,    31,    32,    33,    34,    35,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   123,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    76,    77,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,   100,    -1,
      -1,    -1,    -1,   105,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    -1,    -1,
      -1,    -1,    -1,   121,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,    -1,    -1,    -1,    -1,    -1,   121,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,     1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,
      -1,   117,   118,    28,    29,    30,    31,    32,    33,    34,
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
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,     1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,     1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
       1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,
       0,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    76,    77,    -1,    79,
      80,    81,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,   101,    -1,    -1,    -1,   105,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,   107,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,
      77,    -1,    79,    80,    81,    82,    83,    -1,    85,    86,
      87,     0,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,   101,    -1,    -1,    -1,   105,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    80,    81,    82,    83,    -1,    85,    86,    87,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    86,    87,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    86,    87,     1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,    -1,
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
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,     1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       1,    -1,     3,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     1,    -1,     3,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
       3,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,     3,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    86,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     3,    -1,    -1,    79,    80,    81,    -1,    -1,
      -1,    85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    86,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   123,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      86,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    86,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    86,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118
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
     164,   201,   202,   203,   204,   205,   206,   260,   263,   264,
     267,   268,   269,   270,   271,   272,   273,   275,   279,   282,
     283,   284,   285,   286,   287,   292,   293,   301,   302,   303,
     306,   307,   310,   314,   341,   344,   345,   363,   364,   366,
     367,   368,   369,   370,   371,    77,   121,     5,    31,   206,
     365,   206,   112,   112,   112,   139,   206,   365,   273,   274,
     306,   310,   206,   301,   303,   305,   306,   310,   313,   110,
     115,   136,   137,   206,   119,   121,   115,   119,   118,   109,
     110,   201,   206,   119,   139,   206,   119,   121,   118,   110,
     119,   121,   119,   118,   119,   137,   206,     1,    31,   115,
     135,   203,   205,   206,   260,   270,   271,   273,   275,   303,
     306,   310,   313,   314,   322,   323,   324,   325,   324,   112,
     123,     1,    29,    30,    31,    32,    33,    65,   113,   135,
     206,   259,   263,   265,   266,   273,   275,   279,   280,   281,
     287,   291,   299,   300,   328,   329,   330,   331,   332,   333,
     303,   310,   303,   306,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    66,    85,    87,   100,
     119,   139,   160,   161,   259,   264,   265,   273,   276,   280,
     282,   290,   343,   346,   347,   348,   353,   354,   355,    31,
      76,   121,   203,   205,   292,   344,   345,   363,   364,   371,
       1,   203,   269,   286,   292,   314,   341,   367,     1,   366,
     367,     0,   206,   365,   365,     5,   116,   365,     1,     4,
       6,     8,     9,    65,    71,    72,    73,    84,    85,    98,
     102,   103,   104,   105,   106,   107,   108,   109,   112,   114,
     122,   123,   125,   126,   127,   128,   139,   165,   166,   206,
     207,   208,   211,   212,   216,   217,   219,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     233,   237,   239,   240,   242,   243,   244,   245,   246,   247,
     248,   249,   250,   251,   252,   253,   365,   377,   378,   379,
     380,   136,   206,   119,   139,   206,   273,   310,   301,   303,
     310,   305,   306,   113,   306,    85,   139,   190,   191,   193,
     195,   199,   200,   206,   217,   231,   232,   240,   252,   257,
     290,   115,   110,   110,   115,     1,    68,    78,    80,    81,
      85,    88,    91,    92,    93,    94,    96,    98,    99,   112,
     114,   115,   118,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   162,   163,   165,   166,   169,   170,   171,   172,
     173,   174,   175,   176,   177,   178,   182,   186,   187,   188,
     189,   206,   212,   237,   291,   302,   304,   306,   310,   314,
     315,   342,    80,    81,   206,   259,   263,   273,   276,   279,
     287,   294,   295,     1,   118,   188,   189,   137,   206,     1,
     206,   261,   262,     1,   118,   262,   295,    65,   190,   192,
     194,   196,   197,   198,   206,     1,   118,   188,   189,   295,
       1,   118,   188,   189,     1,   118,   188,   189,   119,   303,
     310,   303,   306,     1,   116,   347,   354,   355,     1,   115,
     117,   117,   115,   124,   136,   206,   253,   257,   258,   117,
     119,   139,   206,   118,   119,   118,   119,   112,   123,   125,
     135,   206,   259,   265,   273,   275,   280,   306,   308,   310,
     311,   313,     1,   113,   117,     1,   113,   117,     1,   117,
       1,   117,   113,   113,   303,   303,   112,   112,     1,   115,
       1,   118,     1,   115,   206,   259,   265,   273,   276,   280,
     306,   324,   325,     1,   115,     1,   343,   346,   354,   355,
     343,   346,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    79,    86,    88,    89,    90,   115,   121,
     183,   184,   185,   206,   212,   217,   233,   235,   240,   253,
     254,   255,   334,   335,   338,   339,   340,   347,   348,   349,
     350,   351,   352,   354,   355,   357,   358,   359,   360,   361,
     362,   118,    31,   206,   365,   206,   201,   202,   204,   205,
     314,   347,   355,   203,   292,   116,   232,   113,     1,   112,
     166,   208,   213,   216,   218,   238,   239,   241,   112,   217,
     240,   217,   240,   112,   206,   259,   265,   273,   276,   280,
     298,   257,   112,   112,   298,   257,   112,   112,   112,   112,
     112,   113,   233,   235,   255,   265,   273,   275,   280,   288,
     326,   365,   119,   167,   168,   209,   214,   233,   119,     1,
     118,   119,     1,     7,     8,     9,   112,   120,   123,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,   116,
     234,   168,   209,   210,   220,   242,   109,   129,   130,   126,
     127,    10,    11,   223,   245,    12,    13,   110,   111,    14,
      15,   125,   131,   132,    16,    17,   133,   234,   113,     7,
       8,     9,   112,   120,   123,   234,   109,   129,   130,   126,
     127,    10,    11,    12,    13,   110,   111,    14,    15,   125,
     131,   132,    16,    17,   133,   234,   113,   113,   107,   206,
     291,   372,   375,   376,   119,   119,   305,   116,    11,   111,
     117,   116,   133,   133,   112,   306,   310,   311,    65,   190,
     198,   206,   198,     1,   206,   259,   273,   276,   287,   296,
     291,   314,   315,   112,   139,   206,   206,   291,     1,   112,
     296,   109,   112,   206,   291,   115,   354,   355,   354,   355,
     354,   115,   354,   355,   115,   115,     1,   118,   115,     1,
       1,   115,   117,   117,    69,    70,    91,    95,    97,   118,
      69,    70,   118,   115,     1,   186,   187,     1,   186,   187,
       1,   116,   112,   115,   121,   206,   277,   278,   301,   306,
     310,   314,   315,   316,     1,   291,   299,   330,   304,   310,
     304,   306,   112,   121,   146,   147,   162,   163,   165,   166,
     175,   206,   291,   110,   139,   206,   206,   259,   273,   276,
     110,   110,   116,   117,     1,   115,   119,    28,   138,   206,
     206,   111,   117,   116,   115,   117,   118,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   157,   158,   159,   209,
     210,   212,   232,   253,   290,   319,   320,   303,   303,   119,
     233,   254,   317,   318,   354,   355,   322,   323,   322,   323,
     124,   124,   124,    51,   328,   329,     1,   262,   119,   119,
       1,   118,   188,   189,     1,   118,   188,   189,   113,   206,
     299,   300,   311,   332,   333,   124,   136,   257,   258,   313,
     308,   310,   112,   123,   308,     1,     1,   117,     1,    51,
     206,   328,   329,   117,     1,    51,   206,   328,   329,   117,
       1,    51,   206,   328,   329,   117,    51,   206,   328,   329,
     233,   136,   206,   118,   119,   115,   115,   121,   257,   258,
     121,   112,   112,     1,   112,    52,    53,    54,    56,    57,
      58,    59,    62,    79,    86,   206,   255,   334,   357,   361,
     112,   206,   115,   115,   115,   209,   210,   235,   255,   112,
     273,   112,   112,   179,   206,   115,   115,   115,   121,   120,
     234,     1,   120,   115,   117,   235,   255,   234,   113,   117,
     235,     1,   349,   350,   349,   350,   334,   335,   343,   346,
     334,   335,   343,   346,     1,     1,   365,   365,   137,   206,
     119,   119,   347,   355,   355,   232,   115,    65,   135,   206,
     217,   240,   265,   273,   275,   280,   289,   327,     1,     1,
       7,     8,     9,   112,   120,   123,     7,     8,     9,   112,
     120,   123,   206,   290,   110,   112,   123,   206,   259,   265,
     273,   276,   280,   306,   309,   310,   312,   206,   259,   265,
     273,   276,   280,   297,   235,   326,   354,   206,   123,   312,
     297,   233,   365,   365,   365,   233,   113,   206,   265,   273,
     275,   280,   311,   113,   120,     1,   158,   159,     1,   118,
     117,   124,     1,   158,   159,   118,     1,   158,   159,     1,
     206,   113,   210,   214,   215,   254,     1,   206,   235,   255,
     209,   233,     1,   220,   242,   220,   242,   220,   242,   221,
     243,   221,   243,   222,   244,   222,   244,   223,   245,   223,
     245,   223,   245,   209,   210,   225,   246,   209,   210,   225,
     246,   209,   210,   226,   247,   209,   210,   227,   248,   209,
     210,   228,   249,   229,   250,   230,   251,   121,   209,   210,
     235,   236,   255,   256,   209,   233,     1,   206,   113,   214,
     215,     1,   206,   235,   255,   209,   233,   220,   242,   220,
     242,   220,   242,   221,   243,   221,   243,   222,   244,   222,
     244,   223,   245,   223,   245,   223,   245,   223,   245,   209,
     210,   225,   246,   209,   210,   225,   246,   209,   210,   226,
     247,   209,   210,   227,   248,   209,   210,   228,   249,   229,
     250,   230,   251,   121,   235,   236,   255,   256,   209,   233,
     110,   111,   206,   373,   374,   206,   118,   372,   375,   376,
     376,   190,   191,   193,   195,   206,   199,   191,   193,   195,
     235,   236,   255,   256,   235,   236,   255,   256,   310,   111,
     116,   111,   119,   110,   119,   206,   259,   273,   276,   311,
     314,   315,   179,   115,   115,   115,   278,   301,   306,   310,
     119,   206,   119,   206,   311,   206,   112,   118,   169,   170,
     169,   170,   354,   354,   354,   365,   354,   354,     1,   319,
     320,   113,   257,   258,   119,   115,   117,   301,   310,   301,
     306,   121,   307,   206,   112,   304,   304,   206,   115,     1,
     115,     1,   115,   278,   200,   110,   198,   198,   257,   258,
     261,   188,   189,     1,   118,   262,   116,   121,   116,   121,
     116,   197,   193,   206,   354,   355,     1,   115,   117,   115,
     117,   115,   150,   151,   154,   155,   156,   118,   148,   151,
     115,   118,   150,   151,   154,   155,   156,   116,   314,   315,
     316,   317,   318,   321,     1,   118,   262,     1,   118,   262,
     113,   113,   113,   124,   124,   124,   308,   113,   332,   333,
     124,   136,   257,   258,   328,   329,   291,   328,   328,   328,
     329,   113,   113,   113,     1,   158,   159,   334,   335,   121,
     121,   334,   335,   235,   255,   235,   255,   113,   235,   255,
     121,   257,   258,   121,   112,   112,   334,   112,   210,   255,
     112,   121,    56,     1,   113,   115,   206,   235,   255,   356,
     115,   115,   115,   115,   115,   365,   112,   233,   233,   206,
     334,   335,    90,   210,   254,    88,    89,    90,   233,   254,
     210,   254,   233,   254,   110,   355,   115,   135,   136,   113,
     135,   265,   273,   275,   280,   311,   113,     1,   206,   113,
     214,   215,     1,   206,   235,   255,     1,   206,   113,   214,
     215,     1,   206,   235,   255,   113,   113,   311,   200,   113,
     312,   332,   333,   257,   258,   110,   309,   310,   112,   309,
     123,   110,   123,   206,   259,   265,   273,   276,   280,   312,
     113,   113,   113,   113,   257,   258,   123,   123,   312,   117,
     113,   117,   117,   117,   220,   242,   365,     1,   118,   209,
     233,     1,     1,   113,   117,   113,   124,   124,     1,   117,
     121,   121,   117,   121,   121,   113,   124,   124,   121,   121,
     121,   121,   206,   206,   115,   117,   206,   365,   118,   118,
     121,   121,   121,   121,   121,   121,   121,   121,   193,   200,
     110,   119,   119,   206,   113,   115,   301,   310,   301,   306,
     113,   119,   119,   206,   113,     1,   158,   159,   277,   306,
     301,   301,   257,   258,   112,   113,   115,   111,   200,   111,
     111,   115,     1,   115,   191,   206,   190,   191,   190,   195,
       1,   152,   153,     1,   152,   153,   355,     1,   319,   320,
     117,   118,   317,   318,     1,   115,     1,   115,   113,   113,
     124,   124,   124,   311,   313,     1,   334,   335,   334,   335,
     113,   113,   113,   113,     1,   334,   113,   235,   334,   335,
     121,   121,   255,   113,   235,   255,    56,   255,   356,   365,
     112,   334,   121,   115,     1,   115,     1,   113,   255,   356,
       3,   113,   121,   365,   113,   113,   117,   112,   112,   179,
     113,   113,     1,   113,   113,   124,   124,   113,   124,   124,
     113,   111,   113,   113,   113,   124,   124,   200,   309,   113,
     332,   333,   257,   258,   200,   257,   258,   110,   123,   112,
     119,   317,   124,   124,   257,   258,   257,   258,   123,   326,
     206,   206,   233,   210,   254,   209,   210,   209,   210,   232,
     252,   209,   210,   232,   252,   209,   210,   209,   210,   232,
     252,   209,   210,   232,   252,   209,   210,   232,   252,   209,
     210,   232,   252,   209,   210,   232,   252,   209,   210,   232,
     252,   373,   115,   115,   111,   200,   119,   354,   301,   301,
     116,   119,     1,   121,   121,   111,   188,   189,   115,   188,
     189,   116,   116,   118,   317,   318,     1,   188,   189,   188,
     189,   334,   334,   334,   334,   334,   335,   113,   112,   356,
     113,   235,   255,   235,   334,     1,   113,   235,   255,   336,
     337,   365,   115,   337,     3,   113,   121,   119,   179,   233,
     233,     1,     1,   111,   113,   113,   124,   124,   111,   124,
     124,   200,   257,   258,   326,   321,   124,   124,   124,   124,
     257,   258,   113,   113,   113,   113,   111,   319,   257,   258,
     257,   258,   188,   189,   191,   191,     1,    64,    64,   235,
     255,   113,   235,   255,   113,   115,   113,   115,   334,   335,
     113,   334,   335,   113,   117,   121,   112,     3,   113,   121,
     337,   115,   337,    73,   179,   180,   181,   113,   113,   113,
     117,   111,   124,   124,   113,   117,   118,   124,   124,   115,
     334,   334,   113,   113,   115,   334,   235,   334,   335,   115,
     336,   337,   233,   337,   115,   337,   113,   121,     3,   113,
     121,   354,   354,   118,   180,   119,   179,   220,   242,   317,
     118,   113,   113,   113,   113,   113,   121,   115,   337,   337,
     115,   337,   181,   113,   334,   115,   115,   115,   337,   113,
     113,   113,   121,   118,   113,   115,   115,   115,   337,   115,
     113,   115
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
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10116 "grammar.ec"
	break;
      case 136: /* "type" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10125 "grammar.ec"
	break;
      case 137: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10134 "grammar.ec"
	break;
      case 139: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10143 "grammar.ec"
	break;
      case 140: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10152 "grammar.ec"
	break;
      case 141: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10161 "grammar.ec"
	break;
      case 142: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10170 "grammar.ec"
	break;
      case 143: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10179 "grammar.ec"
	break;
      case 144: /* "class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10188 "grammar.ec"
	break;
      case 145: /* "virtual_class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10197 "grammar.ec"
	break;
      case 146: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10206 "grammar.ec"
	break;
      case 147: /* "class_function_definition_error" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10215 "grammar.ec"
	break;
      case 148: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10224 "grammar.ec"
	break;
      case 149: /* "instance_class_function_definition_start_error" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10233 "grammar.ec"
	break;
      case 150: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10242 "grammar.ec"
	break;
      case 151: /* "instance_class_function_definition_error" */

/* Line 1009 of yacc.c  */
#line 226 "grammar.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 10251 "grammar.ec"
	break;
      case 152: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 224 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10260 "grammar.ec"
	break;
      case 153: /* "data_member_initialization_error" */

/* Line 1009 of yacc.c  */
#line 224 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10269 "grammar.ec"
	break;
      case 154: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10278 "grammar.ec"
	break;
      case 155: /* "data_member_initialization_list_error" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10287 "grammar.ec"
	break;
      case 156: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10296 "grammar.ec"
	break;
      case 157: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 250 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10305 "grammar.ec"
	break;
      case 158: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 250 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10314 "grammar.ec"
	break;
      case 159: /* "members_initialization_list_error" */

/* Line 1009 of yacc.c  */
#line 250 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 10323 "grammar.ec"
	break;
      case 160: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 222 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10332 "grammar.ec"
	break;
      case 161: /* "instantiation_named_error" */

/* Line 1009 of yacc.c  */
#line 222 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10341 "grammar.ec"
	break;
      case 165: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 222 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10350 "grammar.ec"
	break;
      case 166: /* "instantiation_unnamed_error" */

/* Line 1009 of yacc.c  */
#line 222 "grammar.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 10359 "grammar.ec"
	break;
      case 169: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 224 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10368 "grammar.ec"
	break;
      case 170: /* "default_property_error" */

/* Line 1009 of yacc.c  */
#line 224 "grammar.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 10377 "grammar.ec"
	break;
      case 171: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10386 "grammar.ec"
	break;
      case 172: /* "default_property_list_error" */

/* Line 1009 of yacc.c  */
#line 249 "grammar.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 10395 "grammar.ec"
	break;
      case 175: /* "property" */

/* Line 1009 of yacc.c  */
#line 235 "grammar.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 10404 "grammar.ec"
	break;
      case 186: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 233 "grammar.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 10413 "grammar.ec"
	break;
      case 187: /* "struct_declaration_error" */

/* Line 1009 of yacc.c  */
#line 233 "grammar.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 10422 "grammar.ec"
	break;
      case 188: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 10431 "grammar.ec"
	break;
      case 189: /* "struct_declaration_list_error" */

/* Line 1009 of yacc.c  */
#line 248 "grammar.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 10440 "grammar.ec"
	break;
      case 190: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 254 "grammar.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 10449 "grammar.ec"
	break;
      case 191: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 253 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10458 "grammar.ec"
	break;
      case 192: /* "template_type_parameter" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10467 "grammar.ec"
	break;
      case 193: /* "template_identifier_argument" */

/* Line 1009 of yacc.c  */
#line 253 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10476 "grammar.ec"
	break;
      case 194: /* "template_identifier_parameter" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10485 "grammar.ec"
	break;
      case 195: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 253 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10494 "grammar.ec"
	break;
      case 196: /* "template_expression_parameter" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10503 "grammar.ec"
	break;
      case 197: /* "template_parameter" */

/* Line 1009 of yacc.c  */
#line 252 "grammar.y"
	{ FreeTemplateParameter((yyvaluep->templateParameter)); };

/* Line 1009 of yacc.c  */
#line 10512 "grammar.ec"
	break;
      case 198: /* "template_parameters_list" */

/* Line 1009 of yacc.c  */
#line 255 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTemplateParameter); };

/* Line 1009 of yacc.c  */
#line 10521 "grammar.ec"
	break;
      case 199: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 253 "grammar.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 10530 "grammar.ec"
	break;
      case 200: /* "template_arguments_list" */

/* Line 1009 of yacc.c  */
#line 256 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTemplateArgument); };

/* Line 1009 of yacc.c  */
#line 10539 "grammar.ec"
	break;
      case 201: /* "class_entry" */

/* Line 1009 of yacc.c  */
#line 230 "grammar.y"
	{ Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; };

/* Line 1009 of yacc.c  */
#line 10548 "grammar.ec"
	break;
      case 202: /* "class_decl" */

/* Line 1009 of yacc.c  */
#line 231 "grammar.y"
	{ Context ctx = curContext; PopContext(ctx); FreeContext(ctx); delete ctx; };

/* Line 1009 of yacc.c  */
#line 10557 "grammar.ec"
	break;
      case 203: /* "class" */

/* Line 1009 of yacc.c  */
#line 232 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10566 "grammar.ec"
	break;
      case 204: /* "class_head" */

/* Line 1009 of yacc.c  */
#line 232 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10575 "grammar.ec"
	break;
      case 205: /* "class_error" */

/* Line 1009 of yacc.c  */
#line 232 "grammar.y"
	{ FreeClass((yyvaluep->_class)); };

/* Line 1009 of yacc.c  */
#line 10584 "grammar.ec"
	break;
      case 206: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 187 "grammar.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 10593 "grammar.ec"
	break;
      case 207: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10602 "grammar.ec"
	break;
      case 211: /* "primary_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10611 "grammar.ec"
	break;
      case 212: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10620 "grammar.ec"
	break;
      case 214: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 237 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10629 "grammar.ec"
	break;
      case 215: /* "argument_expression_list_error" */

/* Line 1009 of yacc.c  */
#line 237 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10638 "grammar.ec"
	break;
      case 217: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10647 "grammar.ec"
	break;
      case 220: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10656 "grammar.ec"
	break;
      case 221: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10665 "grammar.ec"
	break;
      case 222: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10674 "grammar.ec"
	break;
      case 223: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10683 "grammar.ec"
	break;
      case 225: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10692 "grammar.ec"
	break;
      case 226: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10701 "grammar.ec"
	break;
      case 227: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10710 "grammar.ec"
	break;
      case 228: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10719 "grammar.ec"
	break;
      case 229: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10728 "grammar.ec"
	break;
      case 230: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10737 "grammar.ec"
	break;
      case 231: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10746 "grammar.ec"
	break;
      case 232: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10755 "grammar.ec"
	break;
      case 233: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10764 "grammar.ec"
	break;
      case 235: /* "expression" */

/* Line 1009 of yacc.c  */
#line 237 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10773 "grammar.ec"
	break;
      case 237: /* "postfix_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10782 "grammar.ec"
	break;
      case 240: /* "unary_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10791 "grammar.ec"
	break;
      case 242: /* "cast_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10800 "grammar.ec"
	break;
      case 243: /* "multiplicative_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10809 "grammar.ec"
	break;
      case 244: /* "additive_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10818 "grammar.ec"
	break;
      case 245: /* "shift_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10827 "grammar.ec"
	break;
      case 246: /* "relational_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10836 "grammar.ec"
	break;
      case 247: /* "equality_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10845 "grammar.ec"
	break;
      case 248: /* "and_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10854 "grammar.ec"
	break;
      case 249: /* "exclusive_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10863 "grammar.ec"
	break;
      case 250: /* "inclusive_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10872 "grammar.ec"
	break;
      case 251: /* "logical_and_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10881 "grammar.ec"
	break;
      case 252: /* "logical_or_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10890 "grammar.ec"
	break;
      case 253: /* "conditional_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10899 "grammar.ec"
	break;
      case 254: /* "assignment_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10908 "grammar.ec"
	break;
      case 255: /* "expression_error" */

/* Line 1009 of yacc.c  */
#line 237 "grammar.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 10917 "grammar.ec"
	break;
      case 257: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10926 "grammar.ec"
	break;
      case 258: /* "constant_expression_error" */

/* Line 1009 of yacc.c  */
#line 189 "grammar.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 10935 "grammar.ec"
	break;
      case 259: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10944 "grammar.ec"
	break;
      case 260: /* "external_storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10953 "grammar.ec"
	break;
      case 261: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 205 "grammar.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 10962 "grammar.ec"
	break;
      case 262: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 238 "grammar.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 10971 "grammar.ec"
	break;
      case 264: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10980 "grammar.ec"
	break;
      case 265: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10989 "grammar.ec"
	break;
      case 266: /* "enum_specifier_compound_error" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 10998 "grammar.ec"
	break;
      case 268: /* "enum_class" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11007 "grammar.ec"
	break;
      case 269: /* "enum_class_error" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11016 "grammar.ec"
	break;
      case 270: /* "class_specifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11025 "grammar.ec"
	break;
      case 271: /* "class_specifier_error" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11034 "grammar.ec"
	break;
      case 272: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11043 "grammar.ec"
	break;
      case 273: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11052 "grammar.ec"
	break;
      case 274: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11061 "grammar.ec"
	break;
      case 275: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11070 "grammar.ec"
	break;
      case 276: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11079 "grammar.ec"
	break;
      case 277: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11088 "grammar.ec"
	break;
      case 278: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 241 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 11097 "grammar.ec"
	break;
      case 279: /* "struct_entry" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11106 "grammar.ec"
	break;
      case 280: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11115 "grammar.ec"
	break;
      case 281: /* "struct_or_union_specifier_compound_error" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11124 "grammar.ec"
	break;
      case 282: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11133 "grammar.ec"
	break;
      case 283: /* "struct_decl" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11142 "grammar.ec"
	break;
      case 284: /* "struct_head" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11151 "grammar.ec"
	break;
      case 285: /* "struct_class" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11160 "grammar.ec"
	break;
      case 286: /* "struct_class_error" */

/* Line 1009 of yacc.c  */
#line 200 "grammar.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 11169 "grammar.ec"
	break;
      case 288: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11178 "grammar.ec"
	break;
      case 289: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11187 "grammar.ec"
	break;
      case 290: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11196 "grammar.ec"
	break;
      case 291: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11205 "grammar.ec"
	break;
      case 292: /* "external_guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11214 "grammar.ec"
	break;
      case 293: /* "external_guess_declaration_specifiers_error" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11223 "grammar.ec"
	break;
      case 294: /* "_inheritance_specifiers" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11232 "grammar.ec"
	break;
      case 295: /* "inheritance_specifiers" */

/* Line 1009 of yacc.c  */
#line 239 "grammar.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 11241 "grammar.ec"
	break;
      case 299: /* "identifier_list_error" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11250 "grammar.ec"
	break;
      case 300: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11259 "grammar.ec"
	break;
      case 301: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11268 "grammar.ec"
	break;
      case 302: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11277 "grammar.ec"
	break;
      case 303: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11286 "grammar.ec"
	break;
      case 304: /* "direct_declarator_function_error" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11295 "grammar.ec"
	break;
      case 305: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11304 "grammar.ec"
	break;
      case 306: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 234 "grammar.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 11313 "grammar.ec"
	break;
      case 308: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11322 "grammar.ec"
	break;
      case 309: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11331 "grammar.ec"
	break;
      case 310: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 188 "grammar.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 11340 "grammar.ec"
	break;
      case 311: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11349 "grammar.ec"
	break;
      case 312: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11358 "grammar.ec"
	break;
      case 313: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11367 "grammar.ec"
	break;
      case 314: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11376 "grammar.ec"
	break;
      case 315: /* "declarator_function_error" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11385 "grammar.ec"
	break;
      case 316: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 206 "grammar.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 11394 "grammar.ec"
	break;
      case 317: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11403 "grammar.ec"
	break;
      case 318: /* "initializer_error" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11412 "grammar.ec"
	break;
      case 319: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11421 "grammar.ec"
	break;
      case 320: /* "initializer_condition_error" */

/* Line 1009 of yacc.c  */
#line 211 "grammar.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 11430 "grammar.ec"
	break;
      case 321: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 243 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 11439 "grammar.ec"
	break;
      case 322: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 11448 "grammar.ec"
	break;
      case 323: /* "init_declarator_error" */

/* Line 1009 of yacc.c  */
#line 212 "grammar.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 11457 "grammar.ec"
	break;
      case 324: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 11466 "grammar.ec"
	break;
      case 325: /* "init_declarator_list_error" */

/* Line 1009 of yacc.c  */
#line 244 "grammar.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 11475 "grammar.ec"
	break;
      case 326: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11484 "grammar.ec"
	break;
      case 327: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11493 "grammar.ec"
	break;
      case 328: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11502 "grammar.ec"
	break;
      case 329: /* "parameter_declaration_error" */

/* Line 1009 of yacc.c  */
#line 213 "grammar.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 11511 "grammar.ec"
	break;
      case 330: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11520 "grammar.ec"
	break;
      case 331: /* "parameter_list_error" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11529 "grammar.ec"
	break;
      case 332: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11538 "grammar.ec"
	break;
      case 333: /* "parameter_type_list_error" */

/* Line 1009 of yacc.c  */
#line 245 "grammar.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 11547 "grammar.ec"
	break;
      case 334: /* "statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11556 "grammar.ec"
	break;
      case 335: /* "statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11565 "grammar.ec"
	break;
      case 339: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11574 "grammar.ec"
	break;
      case 340: /* "labeled_statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11583 "grammar.ec"
	break;
      case 341: /* "declaration_mode" */

/* Line 1009 of yacc.c  */
#line 257 "grammar.y"
	{ };

/* Line 1009 of yacc.c  */
#line 11592 "grammar.ec"
	break;
      case 343: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 218 "grammar.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 11601 "grammar.ec"
	break;
      case 347: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 242 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 11610 "grammar.ec"
	break;
      case 348: /* "declaration_list_error" */

/* Line 1009 of yacc.c  */
#line 242 "grammar.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 11619 "grammar.ec"
	break;
      case 349: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 246 "grammar.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 11628 "grammar.ec"
	break;
      case 350: /* "statement_list_error" */

/* Line 1009 of yacc.c  */
#line 246 "grammar.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 11637 "grammar.ec"
	break;
      case 351: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11646 "grammar.ec"
	break;
      case 352: /* "compound_inside_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11655 "grammar.ec"
	break;
      case 353: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 251 "grammar.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 11664 "grammar.ec"
	break;
      case 354: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11673 "grammar.ec"
	break;
      case 355: /* "compound_statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11682 "grammar.ec"
	break;
      case 356: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11691 "grammar.ec"
	break;
      case 357: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11700 "grammar.ec"
	break;
      case 358: /* "selection_statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11709 "grammar.ec"
	break;
      case 359: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11718 "grammar.ec"
	break;
      case 360: /* "iteration_statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11727 "grammar.ec"
	break;
      case 361: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11736 "grammar.ec"
	break;
      case 362: /* "jump_statement_error" */

/* Line 1009 of yacc.c  */
#line 214 "grammar.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 11745 "grammar.ec"
	break;
      case 363: /* "function_definition" */

/* Line 1009 of yacc.c  */
#line 219 "grammar.y"
	{ FreeFunction((yyvaluep->function)); };

/* Line 1009 of yacc.c  */
#line 11754 "grammar.ec"
	break;
      case 364: /* "function_definition_error" */

/* Line 1009 of yacc.c  */
#line 219 "grammar.y"
	{ FreeFunction((yyvaluep->function)); };

/* Line 1009 of yacc.c  */
#line 11763 "grammar.ec"
	break;
      case 365: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 234 "grammar.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 11772 "grammar.ec"
	break;
      case 366: /* "external_declaration" */

/* Line 1009 of yacc.c  */
#line 220 "grammar.y"
	{ FreeExternal((yyvaluep->external)); };

/* Line 1009 of yacc.c  */
#line 11781 "grammar.ec"
	break;
      case 367: /* "external_declaration_error" */

/* Line 1009 of yacc.c  */
#line 220 "grammar.y"
	{ FreeExternal((yyvaluep->external)); };

/* Line 1009 of yacc.c  */
#line 11790 "grammar.ec"
	break;
      case 368: /* "translation_unit_error" */

/* Line 1009 of yacc.c  */
#line 247 "grammar.y"
	{ if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };

/* Line 1009 of yacc.c  */
#line 11799 "grammar.ec"
	break;
      case 369: /* "translation_unit" */

/* Line 1009 of yacc.c  */
#line 247 "grammar.y"
	{ if((yyvaluep->list) != ast) FreeList((yyvaluep->list), FreeExternal); };

/* Line 1009 of yacc.c  */
#line 11808 "grammar.ec"
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
#line 265 "grammar.y"
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
#line 294 "grammar.y"
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
#line 352 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 354 "grammar.y"
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
#line 453 "grammar.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 457 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 461 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 463 "grammar.y"
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
#line 512 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 514 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 519 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 524 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList((yyvsp[(2) - (4)].list), FreeSpecifier) ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 529 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 531 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 536 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 538 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 543 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 545 "grammar.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 550 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 552 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 554 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 556 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 558 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 562 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 567 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 569 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 571 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 573 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 575 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 581 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 583 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, MkDeclaratorFunction((yyvsp[(2) - (2)].declarator), null), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 588 "grammar.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 593 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 598 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 600 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 602 "grammar.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (1)].classFunction), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).loc.end.charPos++; (yyval.classFunction).loc.end.pos++;;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 606 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 607 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 611 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 613 "grammar.y"
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
#line 623 "grammar.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 627 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 629 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 631 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 635 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 637 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 639 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 642 "grammar.y"
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
#line 654 "grammar.y"
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
#line 665 "grammar.y"
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
#line 684 "grammar.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 686 "grammar.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 690 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 691 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 692 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members);  members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 693 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 694 "grammar.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 695 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 696 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 698 "grammar.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 703 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 704 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 705 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 709 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 710 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 711 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 712 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 713 "grammar.y"
    { ListAdd((yyval.list), MkMembersInitList((yyvsp[(2) - (2)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 714 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 715 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (2)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 720 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; (yyval.instance) = (yyvsp[(1) - (2)].instance); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 722 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; (yyval.instance) = (yyvsp[(1) - (3)].instance); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 727 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 729 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (5)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 731 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 733 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (3)].list), MkExpIdentifier((yyvsp[(2) - (3)].id)), null); (yyval.instance).exp.loc = (yylsp[(2) - (3)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (3)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 735 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 765 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 767 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 772 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list));(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 774 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (5)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 776 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), (yyvsp[(4) - (4)].list));(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 778 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (3)].list), MkExpIdentifier((yyvsp[(2) - (3)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (3)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (3)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 780 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), null);(yyval.instance).exp.loc = (yylsp[(2) - (4)]);  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 809 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 811 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).exp.loc = (yylsp[(2) - (5)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 813 "grammar.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).exp.loc = (yylsp[(2) - (4)]); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 818 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; (yyval.instance) = (yyvsp[(1) - (2)].instance); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 820 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; (yyval.instance) = (yyvsp[(1) - (3)].instance); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 825 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 827 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 831 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 833 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (2)].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 835 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 837 "grammar.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 842 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, (yyvsp[(3) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 845 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (2)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (2)].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (2)].id)); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 848 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (4)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 851 "grammar.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); 
      yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 916 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 918 "grammar.y"
    { (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).start; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 923 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (2)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 925 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (3)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 927 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(1) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++;  ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 929 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, null);  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (1)]).end; (yyval.instance).insideLoc.end = (yylsp[(1) - (1)]).end;  (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 931 "grammar.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (2)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).end; (yyval.instance).loc.end.charPos++; (yyval.instance).loc.end.pos++; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 961 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 965 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 966 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), MkInitializerAssignment(MkExpDummy())); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; (yyval.memberInit).initializer.loc.end = (yylsp[(2) - (3)]).end; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 967 "grammar.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (2)].exp), null); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 971 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 972 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 973 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 977 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 978 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 979 "grammar.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 985 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, (yyvsp[(3) - (4)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 988 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), (yyvsp[(4) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 991 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (3)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 994 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 997 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 1003 "grammar.y"
    { (yyvsp[(1) - (3)].prop).setStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 1005 "grammar.y"
    { (yyvsp[(1) - (3)].prop).getStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 1007 "grammar.y"
    { (yyvsp[(1) - (3)].prop).issetStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 1009 "grammar.y"
    { (yyvsp[(1) - (2)].prop).isWatchable = true; ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 1011 "grammar.y"
    { (yyvsp[(1) - (3)].prop).category = (yyvsp[(3) - (3)].string); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 1015 "grammar.y"
    { (yyvsp[(1) - (2)].prop).loc.end = (yylsp[(2) - (2)]).end; (yyval.prop) = (yyvsp[(1) - (2)].prop); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 1020 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, (yyvsp[(3) - (4)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 1023 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), (yyvsp[(4) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 1026 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (3)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 1029 "grammar.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 1032 "grammar.y"
    { (yyval.prop) = MkProperty(null, null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 1038 "grammar.y"
    { (yyvsp[(1) - (3)].prop).setStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 1040 "grammar.y"
    { (yyvsp[(1) - (3)].prop).getStmt = (yyvsp[(3) - (3)].stmt); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 1044 "grammar.y"
    { (yyvsp[(1) - (2)].prop).loc.end = (yylsp[(2) - (2)]).end; ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 1049 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].id)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 1051 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].id)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 1056 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 1058 "grammar.y"
    { (yyval.propertyWatch) = MkDeleteWatch((yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 1063 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].propertyWatch)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 1065 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].propertyWatch)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 1070 "grammar.y"
    { (yyval.propertyWatch) = MkPropertyWatch((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 1075 "grammar.y"
    { (yyval.stmt) = MkWatchStmt(null, (yyvsp[(3) - (7)].exp), (yyvsp[(6) - (7)].list)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 1077 "grammar.y"
    { (yyval.stmt) = MkWatchStmt((yyvsp[(1) - (9)].exp), (yyvsp[(5) - (9)].exp), (yyvsp[(8) - (9)].list)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 1082 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].list)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 1084 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[(1) - (8)].exp), (yyvsp[(5) - (8)].exp), (yyvsp[(7) - (8)].list)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 1086 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt(null, (yyvsp[(3) - (4)].exp), null); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 1088 "grammar.y"
    { (yyval.stmt) = MkStopWatchingStmt((yyvsp[(1) - (6)].exp), (yyvsp[(5) - (6)].exp), null); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 1093 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, null); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 1095 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt(null, (yyvsp[(2) - (2)].list)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 1097 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[(1) - (3)].exp), null); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 1099 "grammar.y"
    { (yyval.stmt) = MkFireWatchersStmt((yyvsp[(1) - (4)].exp), (yyvsp[(4) - (4)].list)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 1103 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 1104 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 1105 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 1106 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 1107 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 1108 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 1110 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (4)].declMode); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 1111 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(2) - (3)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 1112 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 1113 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 1114 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(2) - (2)].classFunction)); (yyval.classDef).loc = (yyloc); (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 1115 "grammar.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(2) - (2)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 1117 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 1118 "grammar.y"
    { (yyval.classDef) = MkClassDefClassData(MkStructDeclaration((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 1119 "grammar.y"
    { (yyval.classDef) = MkClassDefClassProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 1120 "grammar.y"
    { (yyval.classDef) = MkClassDefPropertyWatch((yyvsp[(1) - (2)].propertyWatch)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 1121 "grammar.y"
    { (yyval.classDef) = null; deleteWatchable = true; ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 1122 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[(2) - (3)].id).string); FreeIdentifier((yyvsp[(2) - (3)].id)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 1123 "grammar.y"
    { (yyval.classDef) = MkClassDefDesigner((yyvsp[(2) - (3)].specifier).name); FreeSpecifier((yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 1124 "grammar.y"
    { (yyval.classDef) = MkClassDefNoExpansion(); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 1125 "grammar.y"
    { (yyval.classDef) = MkClassDefFixed(); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 1126 "grammar.y"
    { (yyval.classDef) = MkClassDefDesignerDefaultProperty((yyvsp[(2) - (3)].id)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 1127 "grammar.y"
    { (yyval.classDef) = MkClassDefClassPropertyValue((yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].initializer)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 1129 "grammar.y"
    { (yyval.classDef) = null; ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 1130 "grammar.y"
    { memberAccessStack[defaultMemberAccess] = (yyvsp[(1) - (2)].declMode); if(defaultMemberAccess == 0) { (yyval.classDef) = MkClassDefMemberAccess(); (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); (yyval.classDef).loc = (yyloc); } else (yyval.classDef) = null; ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 1132 "grammar.y"
    { (yyval.classDef) = MkClassDefAccessOverride((yyvsp[(1) - (4)].declMode), (yyvsp[(3) - (4)].id)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 1136 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyvsp[(1) - (1)].classFunction).loc;  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 1137 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (2)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 1138 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (2)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 1139 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (1)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (1)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 1140 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (1)].instance))); (yyval.classDef).loc = (yyvsp[(1) - (1)].instance).loc; (yyval.classDef).decl.loc = (yyval.classDef).loc;  (yyval.classDef).memberAccess = memberAccessStack[defaultMemberAccess]; ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 1142 "grammar.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(2) - (2)].classFunction)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 1143 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 1144 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (3)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (3)].declMode); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 1145 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 1146 "grammar.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(2) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyval.classDef).loc; (yyval.classDef).memberAccess = (yyvsp[(1) - (2)].declMode); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 1148 "grammar.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (1)].list)); (yyval.classDef).loc = (yyloc);  (yyval.classDef).loc.end.charPos++; (yyval.classDef).loc.end.pos++; ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 1152 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 1153 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 1154 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 1158 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 1161 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyval.list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 1162 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyval.list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 1166 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 1167 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 1168 "grammar.y"
    { (yyval.templateDatatype) = MkTemplateDatatype(MkListOne(MkSpecifierName((yyvsp[(1) - (1)].id).string)), null); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 1172 "grammar.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[(1) - (1)].templateDatatype)); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 1176 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (2)].id), null, null); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 1177 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (4)].id), null, (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 1178 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (4)].id), (yyvsp[(4) - (4)].templateDatatype), null); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 1179 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].templateDatatype), (yyvsp[(6) - (6)].templateArgument)); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 1180 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (2)].string)), null, null); delete (yyvsp[(2) - (2)].string); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 1181 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (4)].string)), null, (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 1182 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (4)].string)), (yyvsp[(4) - (4)].templateDatatype), null); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 1183 "grammar.y"
    { (yyval.templateParameter) = MkTypeTemplateParameter(MkIdentifier((yyvsp[(2) - (6)].string)), (yyvsp[(4) - (6)].templateDatatype), (yyvsp[(6) - (6)].templateArgument)); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 1187 "grammar.y"
    { (yyval.templateArgument) = MkTemplateIdentifierArgument((yyvsp[(1) - (1)].id)); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 1191 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[(1) - (1)].id), dataMember, null); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 1192 "grammar.y"
    { (yyval.templateParameter) = MkIdentifierTemplateParameter((yyvsp[(1) - (3)].id), dataMember, (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 1196 "grammar.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 1200 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[(2) - (2)].id), (yyvsp[(1) - (2)].templateDatatype), null); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 1201 "grammar.y"
    { (yyval.templateParameter) = MkExpressionTemplateParameter((yyvsp[(2) - (4)].id), (yyvsp[(1) - (4)].templateDatatype), (yyvsp[(4) - (4)].templateArgument)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 1211 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateParameter)); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 1212 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateParameter)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 1219 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 1220 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 1221 "grammar.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 1223 "grammar.y"
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
#line 1235 "grammar.y"
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
#line 1247 "grammar.y"
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
#line 1261 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 1262 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 1267 "grammar.y"
    {
      (yyval.context) = PushContext();
   ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 1272 "grammar.y"
    { (yyvsp[(1) - (2)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (2)].id).string); FreeIdentifier((yyvsp[(2) - (2)].id)); (yyval.symbol).nameLoc = (yylsp[(2) - (2)]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 1274 "grammar.y"
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
#line 1281 "grammar.y"
    { (yyvsp[(2) - (3)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (3)].id).string); FreeIdentifier((yyvsp[(1) - (3)].id)); FreeIdentifier((yyvsp[(3) - (3)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (3)]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 1282 "grammar.y"
    { (yyvsp[(2) - (3)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(3) - (3)].specifier).name); FreeIdentifier((yyvsp[(1) - (3)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (3)]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[(3) - (3)].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 1284 "grammar.y"
    { (yyvsp[(1) - (5)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); (yyval.symbol).templateParams = (yyvsp[(4) - (5)].list); FreeIdentifier((yyvsp[(2) - (5)].id)); (yyval.symbol).nameLoc = (yylsp[(2) - (5)]); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 1286 "grammar.y"
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
#line 1294 "grammar.y"
    { (yyvsp[(2) - (6)].context); (yyval.symbol) = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); (yyval.symbol).templateParams = (yyvsp[(5) - (6)].list); FreeIdentifier((yyvsp[(1) - (6)].id)); FreeIdentifier((yyvsp[(3) - (6)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (6)]); (yyval.symbol).isRemote = true; memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 1295 "grammar.y"
    { (yyvsp[(2) - (6)].context); (yyval.symbol) = DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); (yyval.symbol).templateParams = (yyvsp[(5) - (6)].list); FreeIdentifier((yyvsp[(1) - (6)].id)); (yyval.symbol).nameLoc = (yylsp[(3) - (6)]); (yyval.symbol).isRemote = true; FreeSpecifier((yyvsp[(3) - (6)].specifier)); memberAccessStack[++defaultMemberAccess] = privateAccess; ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 1300 "grammar.y"
    {
         (yyval._class).loc = (yyloc);
         (yyval._class) = (yyvsp[(1) - (2)]._class); 
      ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 1307 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (2)]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[(2) - (2)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 1314 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, MkList()); (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 1320 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = MkList(); (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 1327 "grammar.y"
    {
         (yyvsp[(1) - (3)].context); (yyval._class) = MkClass(DeclClassAddNameSpace(0, (yyvsp[(2) - (3)].id).string), null, null); FreeIdentifier((yyvsp[(2) - (3)].id));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 1333 "grammar.y"
    {
         (yyvsp[(1) - (3)].context); (yyval._class) = MkClass(DeclClass(0, (yyvsp[(2) - (3)].specifier).name), null, null); FreeSpecifier((yyvsp[(2) - (3)].specifier));
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 1342 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].list), null);
      ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 1349 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, (yyvsp[(3) - (3)].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 1355 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = (yyvsp[(3) - (3)].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 1361 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, (yyvsp[(3) - (3)].list)); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]); (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 1367 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = (yyvsp[(3) - (3)].list); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 1373 "grammar.y"
    {
         (yyval._class) = MkClass((yyvsp[(1) - (3)].symbol), null, MkList()); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 1379 "grammar.y"
    {
         (yyval._class) = (yyvsp[(1) - (3)]._class); (yyval._class).definitions = MkList(); (yyval._class).deleteWatchable = deleteWatchable; deleteWatchable = false; (yyval._class).blockStart = (yylsp[(2) - (3)]);  (yyval._class).loc = (yyloc); (yyval._class).loc.end.charPos++; (yyval._class).loc.end.pos++; (yyval._class).endid = globalContext.nextID++;
         POP_DEFAULT_ACCESS
         PopContext(curContext);
      ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 1390 "grammar.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 1396 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 1400 "grammar.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 1401 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 1402 "grammar.y"
    { (yyval.exp) = MkExpExtensionCompound((yyvsp[(3) - (4)].stmt)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 1403 "grammar.y"
    { (yyval.exp) = MkExpExtensionExpression((yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 1404 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[(3) - (5)].typeName), (yyvsp[(5) - (5)].initializer)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 1405 "grammar.y"
    { (yyval.exp) = MkExpExtensionInitializer((yyvsp[(3) - (8)].typeName), MkInitializerAssignment(MkExpExtensionInitializer((yyvsp[(6) - (8)].typeName), (yyvsp[(8) - (8)].initializer)))); (yyval.exp).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 1406 "grammar.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 1407 "grammar.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 1408 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 1409 "grammar.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 1410 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 1411 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 1412 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 1413 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 1414 "grammar.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 1415 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 1416 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 1417 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 1418 "grammar.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 1419 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 1420 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 1421 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 1422 "grammar.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 1423 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 1424 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 1425 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 1426 "grammar.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 1427 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[(3) - (4)].list), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 1428 "grammar.y"
    { (yyval.exp) = MkExpClass((yyvsp[(3) - (5)].list), (yyvsp[(4) - (5)].declarator)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 1429 "grammar.y"
    { (yyval.exp) = MkExpClass(MkListOne(MkSpecifierName((yyvsp[(3) - (4)].id).string)), null); FreeIdentifier((yyvsp[(3) - (4)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 1430 "grammar.y"
    { (yyval.exp) = MkExpVaArg((yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 1432 "grammar.y"
    { (yyval.exp) = MkExpClassData((yyvsp[(3) - (4)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 1438 "grammar.y"
    { (yyval.exp) = MkExpArray((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 1442 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 1446 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1450 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (2)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1451 "grammar.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (2)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1457 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1458 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1459 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1460 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1461 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); if((yyvsp[(3) - (4)].list)->last) ((Expression)(yyvsp[(3) - (4)].list)->last).loc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1462 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1463 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1464 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1465 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1467 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1468 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1469 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1470 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1471 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1472 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1473 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1474 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1480 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1481 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1482 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1483 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1484 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); if((yyvsp[(3) - (4)].list)->last) ((Expression)(yyvsp[(3) - (4)].list)->last).loc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1485 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1486 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1487 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1488 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1490 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1491 "grammar.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1492 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1493 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end;(yyval.exp).loc = (yyloc); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1494 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1495 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1496 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1497 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1501 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1502 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1503 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1504 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1508 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1509 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1510 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1511 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1512 "grammar.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(2) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), exp); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1516 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1517 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1518 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1519 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1520 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1521 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1522 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1523 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (5)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1524 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (5)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1538 "grammar.y"
    { (yyval.i) = '&'; ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1539 "grammar.y"
    { (yyval.i) = '*'; ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1540 "grammar.y"
    { (yyval.i) = '+'; ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1541 "grammar.y"
    { (yyval.i) = '-'; ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1542 "grammar.y"
    { (yyval.i) = '~'; ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1543 "grammar.y"
    { (yyval.i) = '!'; ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1544 "grammar.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1545 "grammar.y"
    { (yyval.i) = _INCREF; ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1550 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1555 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1556 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1557 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1558 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1559 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1560 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1565 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1566 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1567 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1568 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1573 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1574 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1575 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1576 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1581 "grammar.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1589 "grammar.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1590 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1591 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1592 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1593 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1594 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1595 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1596 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1601 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1602 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1603 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1604 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1606 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1607 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1608 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1609 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1614 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1615 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1617 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1618 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1623 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1624 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1626 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1627 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1632 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1633 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1635 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1636 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1641 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1642 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1647 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1648 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1653 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1654 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1655 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1656 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1658 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1659 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1660 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1661 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1663 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1664 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1665 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1666 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1668 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1669 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1670 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1671 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1676 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1677 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1678 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1679 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1681 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1682 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1683 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1684 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1688 "grammar.y"
    { (yyval.i) = '='; ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1689 "grammar.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1690 "grammar.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1691 "grammar.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1692 "grammar.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1693 "grammar.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1694 "grammar.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1695 "grammar.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1696 "grammar.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1697 "grammar.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1698 "grammar.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1702 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1703 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1704 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1709 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1710 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1711 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1716 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); /*printf("Sorry, didn't mean that syntax error\n");*/ ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1718 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1720 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1721 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1723 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1724 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1729 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1731 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1736 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1740 "grammar.y"
    { (yyval.exp) = MkExpDummy(); (yyval.exp).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1742 "grammar.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (2)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1744 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1745 "grammar.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1747 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1748 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1753 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1755 "grammar.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].list)); (yyval.exp).loc = (yyloc); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).call.argLoc.end.charPos++;;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1760 "grammar.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1764 "grammar.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1765 "grammar.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1766 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1767 "grammar.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1768 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1769 "grammar.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1770 "grammar.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (5)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1771 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (6)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1772 "grammar.y"
    { (yyval.exp) = MkExpClassSize((yyvsp[(4) - (6)].specifier)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 509:

/* Line 1464 of yacc.c  */
#line 1788 "grammar.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 511:

/* Line 1464 of yacc.c  */
#line 1793 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 512:

/* Line 1464 of yacc.c  */
#line 1794 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 513:

/* Line 1464 of yacc.c  */
#line 1795 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 514:

/* Line 1464 of yacc.c  */
#line 1796 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 515:

/* Line 1464 of yacc.c  */
#line 1797 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 516:

/* Line 1464 of yacc.c  */
#line 1798 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 518:

/* Line 1464 of yacc.c  */
#line 1803 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 519:

/* Line 1464 of yacc.c  */
#line 1807 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 520:

/* Line 1464 of yacc.c  */
#line 1811 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 521:

/* Line 1464 of yacc.c  */
#line 1815 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 523:

/* Line 1464 of yacc.c  */
#line 1823 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 524:

/* Line 1464 of yacc.c  */
#line 1824 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 525:

/* Line 1464 of yacc.c  */
#line 1825 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 526:

/* Line 1464 of yacc.c  */
#line 1826 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 528:

/* Line 1464 of yacc.c  */
#line 1832 "grammar.y"
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

  case 529:

/* Line 1464 of yacc.c  */
#line 1882 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 530:

/* Line 1464 of yacc.c  */
#line 1883 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 531:

/* Line 1464 of yacc.c  */
#line 1884 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 532:

/* Line 1464 of yacc.c  */
#line 1885 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 533:

/* Line 1464 of yacc.c  */
#line 1886 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 534:

/* Line 1464 of yacc.c  */
#line 1887 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 535:

/* Line 1464 of yacc.c  */
#line 1888 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 537:

/* Line 1464 of yacc.c  */
#line 1893 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 538:

/* Line 1464 of yacc.c  */
#line 1894 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 539:

/* Line 1464 of yacc.c  */
#line 1895 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 540:

/* Line 1464 of yacc.c  */
#line 1896 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 541:

/* Line 1464 of yacc.c  */
#line 1903 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 542:

/* Line 1464 of yacc.c  */
#line 1904 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 543:

/* Line 1464 of yacc.c  */
#line 1905 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 544:

/* Line 1464 of yacc.c  */
#line 1906 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 546:

/* Line 1464 of yacc.c  */
#line 1911 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 547:

/* Line 1464 of yacc.c  */
#line 1912 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 548:

/* Line 1464 of yacc.c  */
#line 1914 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 549:

/* Line 1464 of yacc.c  */
#line 1915 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 551:

/* Line 1464 of yacc.c  */
#line 1920 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 552:

/* Line 1464 of yacc.c  */
#line 1921 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 553:

/* Line 1464 of yacc.c  */
#line 1923 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 554:

/* Line 1464 of yacc.c  */
#line 1924 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 556:

/* Line 1464 of yacc.c  */
#line 1929 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 557:

/* Line 1464 of yacc.c  */
#line 1930 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 558:

/* Line 1464 of yacc.c  */
#line 1932 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 559:

/* Line 1464 of yacc.c  */
#line 1933 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 561:

/* Line 1464 of yacc.c  */
#line 1938 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 562:

/* Line 1464 of yacc.c  */
#line 1939 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 564:

/* Line 1464 of yacc.c  */
#line 1944 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 565:

/* Line 1464 of yacc.c  */
#line 1945 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 567:

/* Line 1464 of yacc.c  */
#line 1950 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 568:

/* Line 1464 of yacc.c  */
#line 1951 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 569:

/* Line 1464 of yacc.c  */
#line 1952 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 570:

/* Line 1464 of yacc.c  */
#line 1953 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 571:

/* Line 1464 of yacc.c  */
#line 1954 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 572:

/* Line 1464 of yacc.c  */
#line 1955 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 573:

/* Line 1464 of yacc.c  */
#line 1956 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 574:

/* Line 1464 of yacc.c  */
#line 1957 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 575:

/* Line 1464 of yacc.c  */
#line 1959 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 576:

/* Line 1464 of yacc.c  */
#line 1960 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 577:

/* Line 1464 of yacc.c  */
#line 1961 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 578:

/* Line 1464 of yacc.c  */
#line 1962 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 579:

/* Line 1464 of yacc.c  */
#line 1963 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 580:

/* Line 1464 of yacc.c  */
#line 1964 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 581:

/* Line 1464 of yacc.c  */
#line 1965 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 582:

/* Line 1464 of yacc.c  */
#line 1966 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list), MkExpDummy()); (yyval.exp).loc = (yyloc); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (4)]); ;}
    break;

  case 583:

/* Line 1464 of yacc.c  */
#line 1968 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 584:

/* Line 1464 of yacc.c  */
#line 1969 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 585:

/* Line 1464 of yacc.c  */
#line 1970 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 586:

/* Line 1464 of yacc.c  */
#line 1971 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 587:

/* Line 1464 of yacc.c  */
#line 1973 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 588:

/* Line 1464 of yacc.c  */
#line 1974 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 589:

/* Line 1464 of yacc.c  */
#line 1975 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 590:

/* Line 1464 of yacc.c  */
#line 1976 "grammar.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 591:

/* Line 1464 of yacc.c  */
#line 1979 "grammar.y"
    { 
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (3)].exp), MkListOne(MkExpDummy()), MkExpDummy()); 
         (yyval.exp).loc = (yyloc); 
         ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (3)]); 
         (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (3)]); 
      ;}
    break;

  case 592:

/* Line 1464 of yacc.c  */
#line 1986 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (3)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (3)]); (yyval.exp).cond.elseExp.loc = (yylsp[(3) - (3)]);
      ;}
    break;

  case 593:

/* Line 1464 of yacc.c  */
#line 1990 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (2)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (2)]); (yyval.exp).cond.elseExp.loc = (yylsp[(2) - (2)]);
      ;}
    break;

  case 594:

/* Line 1464 of yacc.c  */
#line 1994 "grammar.y"
    {
         (yyval.exp) = MkExpCondition((yyvsp[(1) - (2)].exp), MkListOne(MkExpDummy()), MkExpDummy()); (yyval.exp).loc = (yyloc); ((Expression)(yyval.exp).cond.exp->last).loc = (yylsp[(2) - (2)]); (yyval.exp).cond.elseExp.loc = (yylsp[(2) - (2)]);
      ;}
    break;

  case 596:

/* Line 1464 of yacc.c  */
#line 2001 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 597:

/* Line 1464 of yacc.c  */
#line 2005 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 598:

/* Line 1464 of yacc.c  */
#line 2010 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 599:

/* Line 1464 of yacc.c  */
#line 2011 "grammar.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 600:

/* Line 1464 of yacc.c  */
#line 2015 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 601:

/* Line 1464 of yacc.c  */
#line 2016 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].exp)); ;}
    break;

  case 602:

/* Line 1464 of yacc.c  */
#line 2017 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 603:

/* Line 1464 of yacc.c  */
#line 2018 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 604:

/* Line 1464 of yacc.c  */
#line 2024 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 605:

/* Line 1464 of yacc.c  */
#line 2025 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 606:

/* Line 1464 of yacc.c  */
#line 2026 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); FreeList((yyvsp[(2) - (2)].list), FreeExpression); ;}
    break;

  case 607:

/* Line 1464 of yacc.c  */
#line 2030 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 608:

/* Line 1464 of yacc.c  */
#line 2031 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].exp)); ;}
    break;

  case 609:

/* Line 1464 of yacc.c  */
#line 2032 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 610:

/* Line 1464 of yacc.c  */
#line 2033 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 613:

/* Line 1464 of yacc.c  */
#line 2043 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 614:

/* Line 1464 of yacc.c  */
#line 2044 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 615:

/* Line 1464 of yacc.c  */
#line 2045 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 616:

/* Line 1464 of yacc.c  */
#line 2046 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 617:

/* Line 1464 of yacc.c  */
#line 2047 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 618:

/* Line 1464 of yacc.c  */
#line 2051 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); declMode = defaultAccess; ;}
    break;

  case 619:

/* Line 1464 of yacc.c  */
#line 2052 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 620:

/* Line 1464 of yacc.c  */
#line 2053 "grammar.y"
    { (yyval.specifier) = MkSpecifier(STATIC); declMode = staticAccess; ;}
    break;

  case 621:

/* Line 1464 of yacc.c  */
#line 2054 "grammar.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 622:

/* Line 1464 of yacc.c  */
#line 2055 "grammar.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 623:

/* Line 1464 of yacc.c  */
#line 2059 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 624:

/* Line 1464 of yacc.c  */
#line 2060 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 625:

/* Line 1464 of yacc.c  */
#line 2061 "grammar.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 626:

/* Line 1464 of yacc.c  */
#line 2065 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 627:

/* Line 1464 of yacc.c  */
#line 2066 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 629:

/* Line 1464 of yacc.c  */
#line 2071 "grammar.y"
    { memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 630:

/* Line 1464 of yacc.c  */
#line 2075 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 631:

/* Line 1464 of yacc.c  */
#line 2076 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); POP_DEFAULT_ACCESS ;}
    break;

  case 632:

/* Line 1464 of yacc.c  */
#line 2080 "grammar.y"
    { (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS (yyval.specifier) = (yyvsp[(1) - (2)].specifier); ;}
    break;

  case 633:

/* Line 1464 of yacc.c  */
#line 2081 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 634:

/* Line 1464 of yacc.c  */
#line 2082 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), null); FreeSpecifier((yyvsp[(2) - (4)].specifier)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 635:

/* Line 1464 of yacc.c  */
#line 2086 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 636:

/* Line 1464 of yacc.c  */
#line 2087 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 637:

/* Line 1464 of yacc.c  */
#line 2089 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), (yyvsp[(4) - (4)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 638:

/* Line 1464 of yacc.c  */
#line 2090 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list));  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 639:

/* Line 1464 of yacc.c  */
#line 2091 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (4)].id), null);  (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 640:

/* Line 1464 of yacc.c  */
#line 2092 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 641:

/* Line 1464 of yacc.c  */
#line 2093 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (6)].id), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list);  POP_DEFAULT_ACCESS ;}
    break;

  case 642:

/* Line 1464 of yacc.c  */
#line 2095 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), (yyvsp[(4) - (4)].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (4)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 643:

/* Line 1464 of yacc.c  */
#line 2096 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (5)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 644:

/* Line 1464 of yacc.c  */
#line 2097 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (4)].specifier).name), null); (yyval.specifier).loc = (yyloc); FreeSpecifier((yyvsp[(2) - (4)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 645:

/* Line 1464 of yacc.c  */
#line 2098 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (6)].specifier).name), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list); FreeSpecifier((yyvsp[(2) - (6)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 646:

/* Line 1464 of yacc.c  */
#line 2099 "grammar.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (6)].specifier).name), (yyvsp[(4) - (6)].list)); (yyval.specifier).loc = (yyloc); (yyval.specifier).definitions = (yyvsp[(6) - (6)].list); FreeSpecifier((yyvsp[(2) - (6)].specifier)); POP_DEFAULT_ACCESS ;}
    break;

  case 647:

/* Line 1464 of yacc.c  */
#line 2103 "grammar.y"
    { (yyval.id) = (yyvsp[(2) - (2)].id); if(declMode) DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 648:

/* Line 1464 of yacc.c  */
#line 2104 "grammar.y"
    { (yyval.id) = MkIdentifier((yyvsp[(2) - (2)].specifier).name); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 649:

/* Line 1464 of yacc.c  */
#line 2108 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 650:

/* Line 1464 of yacc.c  */
#line 2109 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 651:

/* Line 1464 of yacc.c  */
#line 2110 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), null); POP_DEFAULT_ACCESS ;}
    break;

  case 652:

/* Line 1464 of yacc.c  */
#line 2114 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(5) - (5)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 653:

/* Line 1464 of yacc.c  */
#line 2115 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (6)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 654:

/* Line 1464 of yacc.c  */
#line 2116 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 655:

/* Line 1464 of yacc.c  */
#line 2117 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), (yyvsp[(5) - (7)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 656:

/* Line 1464 of yacc.c  */
#line 2118 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), (yyvsp[(5) - (7)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 657:

/* Line 1464 of yacc.c  */
#line 2119 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (8)].id), (yyvsp[(5) - (8)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (8)].list); (yyval.specifier).definitions = (yyvsp[(8) - (8)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 658:

/* Line 1464 of yacc.c  */
#line 2120 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (8)].id), (yyvsp[(5) - (8)].list)); (yyval.specifier).baseSpecs = (yyvsp[(3) - (8)].list); (yyval.specifier).definitions = (yyvsp[(8) - (8)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 659:

/* Line 1464 of yacc.c  */
#line 2121 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 660:

/* Line 1464 of yacc.c  */
#line 2122 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (7)].id), null); (yyval.specifier).baseSpecs = (yyvsp[(3) - (7)].list); (yyval.specifier).definitions = (yyvsp[(7) - (7)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 661:

/* Line 1464 of yacc.c  */
#line 2124 "grammar.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 662:

/* Line 1464 of yacc.c  */
#line 2125 "grammar.y"
    { (yyval.specifier) = MkEnum(null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 663:

/* Line 1464 of yacc.c  */
#line 2127 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 664:

/* Line 1464 of yacc.c  */
#line 2128 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (4)].id), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 665:

/* Line 1464 of yacc.c  */
#line 2129 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (3)].id), null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 666:

/* Line 1464 of yacc.c  */
#line 2130 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(3) - (5)].list)); (yyval.specifier).definitions = (yyvsp[(5) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 667:

/* Line 1464 of yacc.c  */
#line 2131 "grammar.y"
    { (yyval.specifier) = MkEnum((yyvsp[(1) - (5)].id), (yyvsp[(3) - (5)].list)); (yyval.specifier).definitions = (yyvsp[(5) - (5)].list); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 672:

/* Line 1464 of yacc.c  */
#line 2145 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 673:

/* Line 1464 of yacc.c  */
#line 2146 "grammar.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); ;}
    break;

  case 674:

/* Line 1464 of yacc.c  */
#line 2150 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 675:

/* Line 1464 of yacc.c  */
#line 2151 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 676:

/* Line 1464 of yacc.c  */
#line 2152 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 677:

/* Line 1464 of yacc.c  */
#line 2157 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 678:

/* Line 1464 of yacc.c  */
#line 2158 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 679:

/* Line 1464 of yacc.c  */
#line 2162 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 680:

/* Line 1464 of yacc.c  */
#line 2163 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 681:

/* Line 1464 of yacc.c  */
#line 2164 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 682:

/* Line 1464 of yacc.c  */
#line 2165 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 683:

/* Line 1464 of yacc.c  */
#line 2166 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 684:

/* Line 1464 of yacc.c  */
#line 2167 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 685:

/* Line 1464 of yacc.c  */
#line 2168 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 686:

/* Line 1464 of yacc.c  */
#line 2169 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 687:

/* Line 1464 of yacc.c  */
#line 2170 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 688:

/* Line 1464 of yacc.c  */
#line 2171 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 689:

/* Line 1464 of yacc.c  */
#line 2172 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 690:

/* Line 1464 of yacc.c  */
#line 2173 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 691:

/* Line 1464 of yacc.c  */
#line 2174 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 695:

/* Line 1464 of yacc.c  */
#line 2178 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 696:

/* Line 1464 of yacc.c  */
#line 2179 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 697:

/* Line 1464 of yacc.c  */
#line 2180 "grammar.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 698:

/* Line 1464 of yacc.c  */
#line 2181 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 699:

/* Line 1464 of yacc.c  */
#line 2182 "grammar.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 700:

/* Line 1464 of yacc.c  */
#line 2183 "grammar.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 701:

/* Line 1464 of yacc.c  */
#line 2187 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 702:

/* Line 1464 of yacc.c  */
#line 2188 "grammar.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 703:

/* Line 1464 of yacc.c  */
#line 2189 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 704:

/* Line 1464 of yacc.c  */
#line 2190 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 705:

/* Line 1464 of yacc.c  */
#line 2191 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 706:

/* Line 1464 of yacc.c  */
#line 2192 "grammar.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 707:

/* Line 1464 of yacc.c  */
#line 2193 "grammar.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 708:

/* Line 1464 of yacc.c  */
#line 2194 "grammar.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 709:

/* Line 1464 of yacc.c  */
#line 2195 "grammar.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 710:

/* Line 1464 of yacc.c  */
#line 2196 "grammar.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 711:

/* Line 1464 of yacc.c  */
#line 2197 "grammar.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 712:

/* Line 1464 of yacc.c  */
#line 2198 "grammar.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 713:

/* Line 1464 of yacc.c  */
#line 2199 "grammar.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 717:

/* Line 1464 of yacc.c  */
#line 2203 "grammar.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 718:

/* Line 1464 of yacc.c  */
#line 2204 "grammar.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 719:

/* Line 1464 of yacc.c  */
#line 2205 "grammar.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 720:

/* Line 1464 of yacc.c  */
#line 2206 "grammar.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 721:

/* Line 1464 of yacc.c  */
#line 2213 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 722:

/* Line 1464 of yacc.c  */
#line 2215 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 723:

/* Line 1464 of yacc.c  */
#line 2217 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 724:

/* Line 1464 of yacc.c  */
#line 2219 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 725:

/* Line 1464 of yacc.c  */
#line 2221 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 726:

/* Line 1464 of yacc.c  */
#line 2223 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 727:

/* Line 1464 of yacc.c  */
#line 2225 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 728:

/* Line 1464 of yacc.c  */
#line 2227 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 729:

/* Line 1464 of yacc.c  */
#line 2229 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 730:

/* Line 1464 of yacc.c  */
#line 2231 "grammar.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 731:

/* Line 1464 of yacc.c  */
#line 2235 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 732:

/* Line 1464 of yacc.c  */
#line 2236 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 733:

/* Line 1464 of yacc.c  */
#line 2241 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null);
         (yyval.specifier).addNameSpace = true;
         (yyval.specifier).ctx = PushContext();
      ;}
    break;

  case 734:

/* Line 1464 of yacc.c  */
#line 2247 "grammar.y"
    {
         (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null);
         (yyval.specifier).ctx = PushContext();
         FreeSpecifier((yyvsp[(2) - (2)].specifier));
      ;}
    break;

  case 735:

/* Line 1464 of yacc.c  */
#line 2255 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 736:

/* Line 1464 of yacc.c  */
#line 2256 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 737:

/* Line 1464 of yacc.c  */
#line 2257 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); (yyval.specifier).loc = (yyloc); POP_DEFAULT_ACCESS ;}
    break;

  case 738:

/* Line 1464 of yacc.c  */
#line 2261 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); AddStructDefinitions((yyvsp[(1) - (3)].specifier), (yyvsp[(3) - (3)].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 739:

/* Line 1464 of yacc.c  */
#line 2262 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); AddStructDefinitions((yyvsp[(1) - (3)].specifier), (yyvsp[(3) - (3)].list));  POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 740:

/* Line 1464 of yacc.c  */
#line 2263 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 741:

/* Line 1464 of yacc.c  */
#line 2265 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 742:

/* Line 1464 of yacc.c  */
#line 2266 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 743:

/* Line 1464 of yacc.c  */
#line 2267 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 744:

/* Line 1464 of yacc.c  */
#line 2271 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 745:

/* Line 1464 of yacc.c  */
#line 2276 "grammar.y"
    {
        (yyval.specifier) = (yyvsp[(1) - (1)].specifier);
        if(declMode)
        {
           ((yyvsp[(1) - (1)].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[(1) - (1)].specifier).id.string);
        }
     ;}
    break;

  case 746:

/* Line 1464 of yacc.c  */
#line 2284 "grammar.y"
    {
      Symbol symbol = ((yyvsp[(1) - (4)].specifier).addNameSpace ? DeclClassAddNameSpace : DeclClass)(globalContext.nextID++, (yyvsp[(1) - (4)].specifier).id.string);
      (yyval.specifier) = (yyvsp[(1) - (4)].specifier);
      symbol.templateParams = (yyvsp[(3) - (4)].list);
   ;}
    break;

  case 747:

/* Line 1464 of yacc.c  */
#line 2293 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).baseSpecs = (yyvsp[(3) - (3)].list);
      SetupBaseSpecs(null, (yyvsp[(3) - (3)].list));
   ;}
    break;

  case 748:

/* Line 1464 of yacc.c  */
#line 2301 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (2)].specifier); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 749:

/* Line 1464 of yacc.c  */
#line 2303 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 750:

/* Line 1464 of yacc.c  */
#line 2304 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 751:

/* Line 1464 of yacc.c  */
#line 2305 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 752:

/* Line 1464 of yacc.c  */
#line 2310 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 753:

/* Line 1464 of yacc.c  */
#line 2317 "grammar.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (3)].specifier);
      (yyval.specifier).definitions = (yyvsp[(3) - (3)].list);
      POP_DEFAULT_ACCESS
      PopContext(curContext);
   ;}
    break;

  case 754:

/* Line 1464 of yacc.c  */
#line 2324 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext);;}
    break;

  case 755:

/* Line 1464 of yacc.c  */
#line 2327 "grammar.y"
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

  case 756:

/* Line 1464 of yacc.c  */
#line 2340 "grammar.y"
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
#line 2354 "grammar.y"
    { (yyval.specifier) = (yyvsp[(1) - (3)].specifier); POP_DEFAULT_ACCESS PopContext(curContext); ;}
    break;

  case 758:

/* Line 1464 of yacc.c  */
#line 2357 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS  ;}
    break;

  case 759:

/* Line 1464 of yacc.c  */
#line 2359 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, (yyvsp[(3) - (3)].list)); POP_DEFAULT_ACCESS ;}
    break;

  case 760:

/* Line 1464 of yacc.c  */
#line 2361 "grammar.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); POP_DEFAULT_ACCESS ;}
    break;

  case 761:

/* Line 1464 of yacc.c  */
#line 2365 "grammar.y"
    { (yyval.specifierType) = structSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 762:

/* Line 1464 of yacc.c  */
#line 2366 "grammar.y"
    { (yyval.specifierType) = unionSpecifier; memberAccessStack[++defaultMemberAccess] = publicAccess; ;}
    break;

  case 763:

/* Line 1464 of yacc.c  */
#line 2370 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 764:

/* Line 1464 of yacc.c  */
#line 2371 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 765:

/* Line 1464 of yacc.c  */
#line 2372 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 766:

/* Line 1464 of yacc.c  */
#line 2373 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 767:

/* Line 1464 of yacc.c  */
#line 2374 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 768:

/* Line 1464 of yacc.c  */
#line 2375 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 769:

/* Line 1464 of yacc.c  */
#line 2376 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 770:

/* Line 1464 of yacc.c  */
#line 2377 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 771:

/* Line 1464 of yacc.c  */
#line 2381 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 772:

/* Line 1464 of yacc.c  */
#line 2382 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 773:

/* Line 1464 of yacc.c  */
#line 2383 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 774:

/* Line 1464 of yacc.c  */
#line 2384 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 775:

/* Line 1464 of yacc.c  */
#line 2385 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 776:

/* Line 1464 of yacc.c  */
#line 2386 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 777:

/* Line 1464 of yacc.c  */
#line 2387 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 778:

/* Line 1464 of yacc.c  */
#line 2388 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 779:

/* Line 1464 of yacc.c  */
#line 2389 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 780:

/* Line 1464 of yacc.c  */
#line 2390 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 781:

/* Line 1464 of yacc.c  */
#line 2394 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 782:

/* Line 1464 of yacc.c  */
#line 2395 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 783:

/* Line 1464 of yacc.c  */
#line 2396 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 784:

/* Line 1464 of yacc.c  */
#line 2397 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 785:

/* Line 1464 of yacc.c  */
#line 2398 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 786:

/* Line 1464 of yacc.c  */
#line 2399 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 787:

/* Line 1464 of yacc.c  */
#line 2400 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 788:

/* Line 1464 of yacc.c  */
#line 2401 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 789:

/* Line 1464 of yacc.c  */
#line 2402 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 790:

/* Line 1464 of yacc.c  */
#line 2403 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 791:

/* Line 1464 of yacc.c  */
#line 2407 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 792:

/* Line 1464 of yacc.c  */
#line 2408 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 793:

/* Line 1464 of yacc.c  */
#line 2409 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 794:

/* Line 1464 of yacc.c  */
#line 2410 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 795:

/* Line 1464 of yacc.c  */
#line 2411 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 796:

/* Line 1464 of yacc.c  */
#line 2412 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 797:

/* Line 1464 of yacc.c  */
#line 2413 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 798:

/* Line 1464 of yacc.c  */
#line 2414 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 799:

/* Line 1464 of yacc.c  */
#line 2415 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 800:

/* Line 1464 of yacc.c  */
#line 2416 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 801:

/* Line 1464 of yacc.c  */
#line 2417 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 802:

/* Line 1464 of yacc.c  */
#line 2418 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 803:

/* Line 1464 of yacc.c  */
#line 2422 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 804:

/* Line 1464 of yacc.c  */
#line 2423 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 805:

/* Line 1464 of yacc.c  */
#line 2424 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 806:

/* Line 1464 of yacc.c  */
#line 2425 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 807:

/* Line 1464 of yacc.c  */
#line 2426 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 808:

/* Line 1464 of yacc.c  */
#line 2427 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 809:

/* Line 1464 of yacc.c  */
#line 2428 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 810:

/* Line 1464 of yacc.c  */
#line 2429 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 811:

/* Line 1464 of yacc.c  */
#line 2430 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 812:

/* Line 1464 of yacc.c  */
#line 2431 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 813:

/* Line 1464 of yacc.c  */
#line 2435 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 814:

/* Line 1464 of yacc.c  */
#line 2436 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 815:

/* Line 1464 of yacc.c  */
#line 2440 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PRIVATE)); ;}
    break;

  case 816:

/* Line 1464 of yacc.c  */
#line 2441 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifier(PUBLIC)); ;}
    break;

  case 817:

/* Line 1464 of yacc.c  */
#line 2442 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 818:

/* Line 1464 of yacc.c  */
#line 2443 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 819:

/* Line 1464 of yacc.c  */
#line 2444 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 820:

/* Line 1464 of yacc.c  */
#line 2445 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 821:

/* Line 1464 of yacc.c  */
#line 2446 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 822:

/* Line 1464 of yacc.c  */
#line 2447 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 823:

/* Line 1464 of yacc.c  */
#line 2449 "grammar.y"
    { _DeclClass(0, (yyvsp[(1) - (1)].id).string); (yyval.list) = MkListOne(MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 824:

/* Line 1464 of yacc.c  */
#line 2450 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); _DeclClass(0, (yyvsp[(2) - (2)].id).string); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 825:

/* Line 1464 of yacc.c  */
#line 2453 "grammar.y"
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

  case 826:

/* Line 1464 of yacc.c  */
#line 2471 "grammar.y"
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

  case 828:

/* Line 1464 of yacc.c  */
#line 2489 "grammar.y"
    { (yyval.list) = MkListOne(MkStructOrUnion((yyvsp[(1) - (1)].specifierType), null, null)); POP_DEFAULT_ACCESS ;}
    break;

  case 829:

/* Line 1464 of yacc.c  */
#line 2493 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 830:

/* Line 1464 of yacc.c  */
#line 2494 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 831:

/* Line 1464 of yacc.c  */
#line 2495 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 832:

/* Line 1464 of yacc.c  */
#line 2496 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 833:

/* Line 1464 of yacc.c  */
#line 2497 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 834:

/* Line 1464 of yacc.c  */
#line 2498 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 835:

/* Line 1464 of yacc.c  */
#line 2499 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 836:

/* Line 1464 of yacc.c  */
#line 2500 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 837:

/* Line 1464 of yacc.c  */
#line 2502 "grammar.y"
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

  case 838:

/* Line 1464 of yacc.c  */
#line 2520 "grammar.y"
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

  case 839:

/* Line 1464 of yacc.c  */
#line 2536 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 840:

/* Line 1464 of yacc.c  */
#line 2537 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 841:

/* Line 1464 of yacc.c  */
#line 2538 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 842:

/* Line 1464 of yacc.c  */
#line 2539 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 843:

/* Line 1464 of yacc.c  */
#line 2540 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 844:

/* Line 1464 of yacc.c  */
#line 2541 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 845:

/* Line 1464 of yacc.c  */
#line 2542 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 846:

/* Line 1464 of yacc.c  */
#line 2543 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 847:

/* Line 1464 of yacc.c  */
#line 2544 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 848:

/* Line 1464 of yacc.c  */
#line 2545 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 849:

/* Line 1464 of yacc.c  */
#line 2546 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 850:

/* Line 1464 of yacc.c  */
#line 2547 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 851:

/* Line 1464 of yacc.c  */
#line 2549 "grammar.y"
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

  case 852:

/* Line 1464 of yacc.c  */
#line 2567 "grammar.y"
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

  case 853:

/* Line 1464 of yacc.c  */
#line 2583 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 854:

/* Line 1464 of yacc.c  */
#line 2584 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 855:

/* Line 1464 of yacc.c  */
#line 2585 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 856:

/* Line 1464 of yacc.c  */
#line 2586 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 857:

/* Line 1464 of yacc.c  */
#line 2587 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 858:

/* Line 1464 of yacc.c  */
#line 2588 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 859:

/* Line 1464 of yacc.c  */
#line 2589 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 860:

/* Line 1464 of yacc.c  */
#line 2590 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 861:

/* Line 1464 of yacc.c  */
#line 2591 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 862:

/* Line 1464 of yacc.c  */
#line 2592 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 863:

/* Line 1464 of yacc.c  */
#line 2593 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id));}
    break;

  case 864:

/* Line 1464 of yacc.c  */
#line 2594 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 865:

/* Line 1464 of yacc.c  */
#line 2596 "grammar.y"
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

  case 866:

/* Line 1464 of yacc.c  */
#line 2614 "grammar.y"
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

  case 867:

/* Line 1464 of yacc.c  */
#line 2630 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 868:

/* Line 1464 of yacc.c  */
#line 2631 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 869:

/* Line 1464 of yacc.c  */
#line 2635 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 870:

/* Line 1464 of yacc.c  */
#line 2636 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 871:

/* Line 1464 of yacc.c  */
#line 2637 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 872:

/* Line 1464 of yacc.c  */
#line 2638 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 873:

/* Line 1464 of yacc.c  */
#line 2639 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 874:

/* Line 1464 of yacc.c  */
#line 2643 "grammar.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 875:

/* Line 1464 of yacc.c  */
#line 2644 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 876:

/* Line 1464 of yacc.c  */
#line 2645 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 877:

/* Line 1464 of yacc.c  */
#line 2646 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 878:

/* Line 1464 of yacc.c  */
#line 2647 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 879:

/* Line 1464 of yacc.c  */
#line 2648 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 881:

/* Line 1464 of yacc.c  */
#line 2656 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 882:

/* Line 1464 of yacc.c  */
#line 2657 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 883:

/* Line 1464 of yacc.c  */
#line 2658 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 884:

/* Line 1464 of yacc.c  */
#line 2659 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 885:

/* Line 1464 of yacc.c  */
#line 2660 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 886:

/* Line 1464 of yacc.c  */
#line 2666 "grammar.y"
    {
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), (yyvsp[(2) - (2)].list)); 
         fileInput.Seek((yylsp[(1) - (2)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (2)]).end);
         (yyloc).start = (yylsp[(1) - (2)]).start;
         (yyloc).end = (yylsp[(1) - (2)]).end;
      ;}
    break;

  case 887:

/* Line 1464 of yacc.c  */
#line 2675 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); 
         fileInput.Seek((yylsp[(1) - (2)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (2)]).end);
         (yyloc).start = (yylsp[(1) - (2)]).start;
         (yyloc).end = (yylsp[(1) - (2)]).end;
      ;}
    break;

  case 888:

/* Line 1464 of yacc.c  */
#line 2684 "grammar.y"
    { 
         (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); 
         fileInput.Seek((yylsp[(1) - (3)]).end.pos, start); 
         yyclearin;
         resetScannerPos(&(yylsp[(1) - (3)]).end);
         (yyloc).start = (yylsp[(1) - (3)]).start;
         (yyloc).end = (yylsp[(1) - (3)]).end;
      ;}
    break;

  case 889:

/* Line 1464 of yacc.c  */
#line 2693 "grammar.y"
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

  case 892:

/* Line 1464 of yacc.c  */
#line 2709 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 893:

/* Line 1464 of yacc.c  */
#line 2711 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 894:

/* Line 1464 of yacc.c  */
#line 2755 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 896:

/* Line 1464 of yacc.c  */
#line 2758 "grammar.y"
    {
         char temp[1024];
         strcpy(temp, "__asm__(");
         strcat(temp, (yyvsp[(3) - (4)].string));
         strcat(temp, ")");
         (yyval.string) = CopyString(temp);
         delete (yyvsp[(3) - (4)].string);
      ;}
    break;

  case 897:

/* Line 1464 of yacc.c  */
#line 2769 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 898:

/* Line 1464 of yacc.c  */
#line 2775 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 899:

/* Line 1464 of yacc.c  */
#line 2777 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 900:

/* Line 1464 of yacc.c  */
#line 2779 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 901:

/* Line 1464 of yacc.c  */
#line 2781 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 902:

/* Line 1464 of yacc.c  */
#line 2783 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 903:

/* Line 1464 of yacc.c  */
#line 2785 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 904:

/* Line 1464 of yacc.c  */
#line 2787 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 905:

/* Line 1464 of yacc.c  */
#line 2789 "grammar.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 906:

/* Line 1464 of yacc.c  */
#line 2791 "grammar.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 907:

/* Line 1464 of yacc.c  */
#line 2793 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 908:

/* Line 1464 of yacc.c  */
#line 2795 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 909:

/* Line 1464 of yacc.c  */
#line 2797 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 910:

/* Line 1464 of yacc.c  */
#line 2799 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 911:

/* Line 1464 of yacc.c  */
#line 2801 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 912:

/* Line 1464 of yacc.c  */
#line 2803 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 913:

/* Line 1464 of yacc.c  */
#line 2808 "grammar.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 914:

/* Line 1464 of yacc.c  */
#line 2810 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 915:

/* Line 1464 of yacc.c  */
#line 2812 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 916:

/* Line 1464 of yacc.c  */
#line 2814 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 917:

/* Line 1464 of yacc.c  */
#line 2816 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 918:

/* Line 1464 of yacc.c  */
#line 2818 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 919:

/* Line 1464 of yacc.c  */
#line 2820 "grammar.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 920:

/* Line 1464 of yacc.c  */
#line 2824 "grammar.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 921:

/* Line 1464 of yacc.c  */
#line 2825 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 922:

/* Line 1464 of yacc.c  */
#line 2826 "grammar.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 923:

/* Line 1464 of yacc.c  */
#line 2827 "grammar.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 924:

/* Line 1464 of yacc.c  */
#line 2831 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 926:

/* Line 1464 of yacc.c  */
#line 2833 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 927:

/* Line 1464 of yacc.c  */
#line 2834 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 928:

/* Line 1464 of yacc.c  */
#line 2835 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 929:

/* Line 1464 of yacc.c  */
#line 2836 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 930:

/* Line 1464 of yacc.c  */
#line 2840 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 932:

/* Line 1464 of yacc.c  */
#line 2842 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 933:

/* Line 1464 of yacc.c  */
#line 2843 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 934:

/* Line 1464 of yacc.c  */
#line 2844 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 935:

/* Line 1464 of yacc.c  */
#line 2845 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 937:

/* Line 1464 of yacc.c  */
#line 2851 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 938:

/* Line 1464 of yacc.c  */
#line 2853 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 939:

/* Line 1464 of yacc.c  */
#line 2855 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].string), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 941:

/* Line 1464 of yacc.c  */
#line 2860 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 942:

/* Line 1464 of yacc.c  */
#line 2861 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 943:

/* Line 1464 of yacc.c  */
#line 2862 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 944:

/* Line 1464 of yacc.c  */
#line 2863 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 946:

/* Line 1464 of yacc.c  */
#line 2868 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 947:

/* Line 1464 of yacc.c  */
#line 2869 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 948:

/* Line 1464 of yacc.c  */
#line 2870 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 949:

/* Line 1464 of yacc.c  */
#line 2871 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 951:

/* Line 1464 of yacc.c  */
#line 2876 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 952:

/* Line 1464 of yacc.c  */
#line 2877 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 953:

/* Line 1464 of yacc.c  */
#line 2878 "grammar.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 954:

/* Line 1464 of yacc.c  */
#line 2879 "grammar.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 955:

/* Line 1464 of yacc.c  */
#line 2883 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 956:

/* Line 1464 of yacc.c  */
#line 2884 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 957:

/* Line 1464 of yacc.c  */
#line 2886 "grammar.y"
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

  case 958:

/* Line 1464 of yacc.c  */
#line 2901 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 959:

/* Line 1464 of yacc.c  */
#line 2902 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (4)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 960:

/* Line 1464 of yacc.c  */
#line 2903 "grammar.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (2)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 961:

/* Line 1464 of yacc.c  */
#line 2905 "grammar.y"
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

  case 962:

/* Line 1464 of yacc.c  */
#line 2918 "grammar.y"
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

  case 963:

/* Line 1464 of yacc.c  */
#line 2933 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 964:

/* Line 1464 of yacc.c  */
#line 2935 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 965:

/* Line 1464 of yacc.c  */
#line 2939 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 966:

/* Line 1464 of yacc.c  */
#line 2940 "grammar.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 967:

/* Line 1464 of yacc.c  */
#line 2944 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 968:

/* Line 1464 of yacc.c  */
#line 2945 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 969:

/* Line 1464 of yacc.c  */
#line 2946 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 970:

/* Line 1464 of yacc.c  */
#line 2947 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 971:

/* Line 1464 of yacc.c  */
#line 2950 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].initializer)); ;}
    break;

  case 972:

/* Line 1464 of yacc.c  */
#line 2951 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].initializer)); ;}
    break;

  case 973:

/* Line 1464 of yacc.c  */
#line 2955 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 974:

/* Line 1464 of yacc.c  */
#line 2956 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 975:

/* Line 1464 of yacc.c  */
#line 2960 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 976:

/* Line 1464 of yacc.c  */
#line 2964 "grammar.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 977:

/* Line 1464 of yacc.c  */
#line 2968 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 978:

/* Line 1464 of yacc.c  */
#line 2969 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 979:

/* Line 1464 of yacc.c  */
#line 2970 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 980:

/* Line 1464 of yacc.c  */
#line 2974 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 981:

/* Line 1464 of yacc.c  */
#line 2975 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (2)].initDeclarator)); ;}
    break;

  case 982:

/* Line 1464 of yacc.c  */
#line 2976 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 983:

/* Line 1464 of yacc.c  */
#line 2977 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 984:

/* Line 1464 of yacc.c  */
#line 2981 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 985:

/* Line 1464 of yacc.c  */
#line 2982 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 986:

/* Line 1464 of yacc.c  */
#line 2986 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 987:

/* Line 1464 of yacc.c  */
#line 2987 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 988:

/* Line 1464 of yacc.c  */
#line 2992 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 989:

/* Line 1464 of yacc.c  */
#line 2993 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 990:

/* Line 1464 of yacc.c  */
#line 2994 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 991:

/* Line 1464 of yacc.c  */
#line 2995 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 992:

/* Line 1464 of yacc.c  */
#line 2996 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 993:

/* Line 1464 of yacc.c  */
#line 2998 "grammar.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 994:

/* Line 1464 of yacc.c  */
#line 3016 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 995:

/* Line 1464 of yacc.c  */
#line 3017 "grammar.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 996:

/* Line 1464 of yacc.c  */
#line 3021 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 997:

/* Line 1464 of yacc.c  */
#line 3022 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 998:

/* Line 1464 of yacc.c  */
#line 3023 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 999:

/* Line 1464 of yacc.c  */
#line 3024 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1000:

/* Line 1464 of yacc.c  */
#line 3025 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1001:

/* Line 1464 of yacc.c  */
#line 3026 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1002:

/* Line 1464 of yacc.c  */
#line 3028 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1003:

/* Line 1464 of yacc.c  */
#line 3029 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1004:

/* Line 1464 of yacc.c  */
#line 3030 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1005:

/* Line 1464 of yacc.c  */
#line 3031 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1006:

/* Line 1464 of yacc.c  */
#line 3035 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 1007:

/* Line 1464 of yacc.c  */
#line 3036 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1008:

/* Line 1464 of yacc.c  */
#line 3037 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1009:

/* Line 1464 of yacc.c  */
#line 3038 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1010:

/* Line 1464 of yacc.c  */
#line 3039 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(MkList(), null)); ListAdd((yyval.list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1011:

/* Line 1464 of yacc.c  */
#line 3041 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1012:

/* Line 1464 of yacc.c  */
#line 3042 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 1013:

/* Line 1464 of yacc.c  */
#line 3043 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (4)].list); ListAdd((yyvsp[(1) - (4)].list), (yyvsp[(4) - (4)].typeName)); ;}
    break;

  case 1015:

/* Line 1464 of yacc.c  */
#line 3048 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1016:

/* Line 1464 of yacc.c  */
#line 3049 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1017:

/* Line 1464 of yacc.c  */
#line 3050 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1018:

/* Line 1464 of yacc.c  */
#line 3051 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 1019:

/* Line 1464 of yacc.c  */
#line 3052 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, null)); ;}
    break;

  case 1021:

/* Line 1464 of yacc.c  */
#line 3057 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), null); ;}
    break;

  case 1024:

/* Line 1464 of yacc.c  */
#line 3064 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1026:

/* Line 1464 of yacc.c  */
#line 3066 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1027:

/* Line 1464 of yacc.c  */
#line 3067 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); ;}
    break;

  case 1028:

/* Line 1464 of yacc.c  */
#line 3068 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1036:

/* Line 1464 of yacc.c  */
#line 3079 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1037:

/* Line 1464 of yacc.c  */
#line 3080 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1038:

/* Line 1464 of yacc.c  */
#line 3081 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1039:

/* Line 1464 of yacc.c  */
#line 3082 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1040:

/* Line 1464 of yacc.c  */
#line 3083 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (1)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1041:

/* Line 1464 of yacc.c  */
#line 3084 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (2)].stmt); Compiler_Error("syntax error\n"); ;}
    break;

  case 1042:

/* Line 1464 of yacc.c  */
#line 3085 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (1)].list)); Compiler_Error("syntax error\n"); (yyval.stmt).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 1043:

/* Line 1464 of yacc.c  */
#line 3089 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[(1) - (1)].string), null); (yyval.asmField).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 1044:

/* Line 1464 of yacc.c  */
#line 3090 "grammar.y"
    { (yyval.asmField) = MkAsmField((yyvsp[(1) - (4)].string), (yyvsp[(3) - (4)].exp)); (yyval.asmField).loc = (yyloc); ;}
    break;

  case 1045:

/* Line 1464 of yacc.c  */
#line 3094 "grammar.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].asmField)); ;}
    break;

  case 1046:

/* Line 1464 of yacc.c  */
#line 3095 "grammar.y"
    { ListAdd((yyval.list), (yyvsp[(3) - (3)].asmField)); ;}
    break;

  case 1047:

/* Line 1464 of yacc.c  */
#line 3096 "grammar.y"
    { (yyval.list) = null; ;}
    break;

  case 1048:

/* Line 1464 of yacc.c  */
#line 3100 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (6)].specifier), (yyvsp[(4) - (6)].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1049:

/* Line 1464 of yacc.c  */
#line 3101 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (8)].specifier), (yyvsp[(4) - (8)].string), (yyvsp[(6) - (8)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1050:

/* Line 1464 of yacc.c  */
#line 3102 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), (yyvsp[(6) - (10)].list), (yyvsp[(8) - (10)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1051:

/* Line 1464 of yacc.c  */
#line 3103 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (12)].specifier), (yyvsp[(4) - (12)].string), (yyvsp[(6) - (12)].list), (yyvsp[(8) - (12)].list), (yyvsp[(10) - (12)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1052:

/* Line 1464 of yacc.c  */
#line 3105 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (8)].specifier), (yyvsp[(4) - (8)].string), null, (yyvsp[(6) - (8)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1053:

/* Line 1464 of yacc.c  */
#line 3106 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), null, (yyvsp[(6) - (10)].list), (yyvsp[(8) - (10)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1054:

/* Line 1464 of yacc.c  */
#line 3107 "grammar.y"
    { (yyval.stmt) = MkAsmStmt((yyvsp[(2) - (10)].specifier), (yyvsp[(4) - (10)].string), (yyvsp[(6) - (10)].list), null, (yyvsp[(8) - (10)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1055:

/* Line 1464 of yacc.c  */
#line 3109 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (5)].string), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1056:

/* Line 1464 of yacc.c  */
#line 3110 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (7)].string), (yyvsp[(5) - (7)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1057:

/* Line 1464 of yacc.c  */
#line 3111 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1058:

/* Line 1464 of yacc.c  */
#line 3112 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (11)].string), (yyvsp[(5) - (11)].list), (yyvsp[(7) - (11)].list), (yyvsp[(9) - (11)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1059:

/* Line 1464 of yacc.c  */
#line 3114 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (7)].string), null, (yyvsp[(5) - (7)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1060:

/* Line 1464 of yacc.c  */
#line 3115 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), null, (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1061:

/* Line 1464 of yacc.c  */
#line 3116 "grammar.y"
    { (yyval.stmt) = MkAsmStmt(null, (yyvsp[(3) - (9)].string), (yyvsp[(5) - (9)].list), null, (yyvsp[(7) - (9)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1062:

/* Line 1464 of yacc.c  */
#line 3120 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1063:

/* Line 1464 of yacc.c  */
#line 3121 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1064:

/* Line 1464 of yacc.c  */
#line 3122 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1065:

/* Line 1464 of yacc.c  */
#line 3123 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (3)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (3)]).end; ;}
    break;

  case 1066:

/* Line 1464 of yacc.c  */
#line 3124 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1067:

/* Line 1464 of yacc.c  */
#line 3128 "grammar.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1068:

/* Line 1464 of yacc.c  */
#line 3129 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1069:

/* Line 1464 of yacc.c  */
#line 3130 "grammar.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 1070:

/* Line 1464 of yacc.c  */
#line 3131 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (3)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (3)]).end; ;}
    break;

  case 1071:

/* Line 1464 of yacc.c  */
#line 3132 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(MkExpDummy(), null); (yyval.stmt).caseStmt.exp.loc = (yylsp[(2) - (2)]); (yyval.stmt).loc = (yyloc); (yyval.stmt).caseStmt.exp.loc.start = (yylsp[(1) - (2)]).end; ;}
    break;

  case 1072:

/* Line 1464 of yacc.c  */
#line 3133 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1073:

/* Line 1464 of yacc.c  */
#line 3134 "grammar.y"
    { (yyval.stmt) = MkCaseStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1074:

/* Line 1464 of yacc.c  */
#line 3138 "grammar.y"
    { (yyval.declMode) = declMode = publicAccess; ;}
    break;

  case 1075:

/* Line 1464 of yacc.c  */
#line 3139 "grammar.y"
    { (yyval.declMode) = declMode = privateAccess; ;}
    break;

  case 1076:

/* Line 1464 of yacc.c  */
#line 3140 "grammar.y"
    { (yyval.declMode) = declMode = defaultAccess; ;}
    break;

  case 1077:

/* Line 1464 of yacc.c  */
#line 3144 "grammar.y"
    { (yyval.declMode) = publicAccess; ;}
    break;

  case 1078:

/* Line 1464 of yacc.c  */
#line 3145 "grammar.y"
    { (yyval.declMode) = privateAccess; ;}
    break;

  case 1079:

/* Line 1464 of yacc.c  */
#line 3149 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1080:

/* Line 1464 of yacc.c  */
#line 3150 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1081:

/* Line 1464 of yacc.c  */
#line 3151 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1082:

/* Line 1464 of yacc.c  */
#line 3152 "grammar.y"
    { (yyval.declaration) = (yyvsp[(1) - (2)].declaration); ;}
    break;

  case 1083:

/* Line 1464 of yacc.c  */
#line 3156 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1084:

/* Line 1464 of yacc.c  */
#line 3157 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1085:

/* Line 1464 of yacc.c  */
#line 3158 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1086:

/* Line 1464 of yacc.c  */
#line 3160 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1087:

/* Line 1464 of yacc.c  */
#line 3161 "grammar.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1088:

/* Line 1464 of yacc.c  */
#line 3162 "grammar.y"
    { declMode = staticAccess; (yyval.declaration) = MkDeclarationDefine((yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1089:

/* Line 1464 of yacc.c  */
#line 3166 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); yyerrok; ;}
    break;

  case 1090:

/* Line 1464 of yacc.c  */
#line 3170 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1091:

/* Line 1464 of yacc.c  */
#line 3171 "grammar.y"
    {;}
    break;

  case 1092:

/* Line 1464 of yacc.c  */
#line 3173 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1093:

/* Line 1464 of yacc.c  */
#line 3174 "grammar.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1094:

/* Line 1464 of yacc.c  */
#line 3175 "grammar.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 1095:

/* Line 1464 of yacc.c  */
#line 3179 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1096:

/* Line 1464 of yacc.c  */
#line 3180 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1097:

/* Line 1464 of yacc.c  */
#line 3181 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); /*declMode = defaultDeclMode; */;}
    break;

  case 1098:

/* Line 1464 of yacc.c  */
#line 3182 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 1099:

/* Line 1464 of yacc.c  */
#line 3186 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 1100:

/* Line 1464 of yacc.c  */
#line 3187 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 1101:

/* Line 1464 of yacc.c  */
#line 3191 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 1102:

/* Line 1464 of yacc.c  */
#line 3192 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1103:

/* Line 1464 of yacc.c  */
#line 3193 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1104:

/* Line 1464 of yacc.c  */
#line 3197 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 1105:

/* Line 1464 of yacc.c  */
#line 3198 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1106:

/* Line 1464 of yacc.c  */
#line 3199 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 1107:

/* Line 1464 of yacc.c  */
#line 3200 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1108:

/* Line 1464 of yacc.c  */
#line 3201 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1109:

/* Line 1464 of yacc.c  */
#line 3202 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1110:

/* Line 1464 of yacc.c  */
#line 3203 "grammar.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); yyerror(); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), stmt); /*declMode = defaultDeclMode;*/ ;}
    break;

  case 1111:

/* Line 1464 of yacc.c  */
#line 3207 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 1112:

/* Line 1464 of yacc.c  */
#line 3208 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 1113:

/* Line 1464 of yacc.c  */
#line 3209 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1114:

/* Line 1464 of yacc.c  */
#line 3210 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1115:

/* Line 1464 of yacc.c  */
#line 3214 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 1116:

/* Line 1464 of yacc.c  */
#line 3215 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 1117:

/* Line 1464 of yacc.c  */
#line 3216 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1118:

/* Line 1464 of yacc.c  */
#line 3217 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 1119:

/* Line 1464 of yacc.c  */
#line 3221 "grammar.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 1120:

/* Line 1464 of yacc.c  */
#line 3225 "grammar.y"
    { (yyval.stmt) = (yyvsp[(1) - (2)].stmt); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1121:

/* Line 1464 of yacc.c  */
#line 3230 "grammar.y"
    { (yyval.stmt) = (yyvsp[(2) - (2)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (2)].context); PopContext((yyvsp[(1) - (2)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1122:

/* Line 1464 of yacc.c  */
#line 3232 "grammar.y"
    { (yyval.stmt) = MkCompoundStmt(null, null); (yyval.stmt).compound.context = (yyvsp[(1) - (1)].context); PopContext((yyvsp[(1) - (1)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1123:

/* Line 1464 of yacc.c  */
#line 3235 "grammar.y"
    { (yyval.stmt) = (yyvsp[(2) - (2)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (2)].context); PopContext((yyvsp[(1) - (2)].context)); (yyval.stmt).loc = (yyloc); (yyval.stmt).loc.end.charPos++; (yyval.stmt).loc.end.pos++; ;}
    break;

  case 1124:

/* Line 1464 of yacc.c  */
#line 3240 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1125:

/* Line 1464 of yacc.c  */
#line 3241 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1126:

/* Line 1464 of yacc.c  */
#line 3242 "grammar.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1127:

/* Line 1464 of yacc.c  */
#line 3246 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1128:

/* Line 1464 of yacc.c  */
#line 3247 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1129:

/* Line 1464 of yacc.c  */
#line 3248 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1130:

/* Line 1464 of yacc.c  */
#line 3249 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1131:

/* Line 1464 of yacc.c  */
#line 3250 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1132:

/* Line 1464 of yacc.c  */
#line 3251 "grammar.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1133:

/* Line 1464 of yacc.c  */
#line 3255 "grammar.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (3)].list), null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1135:

/* Line 1464 of yacc.c  */
#line 3260 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1136:

/* Line 1464 of yacc.c  */
#line 3261 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (4)].list), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1137:

/* Line 1464 of yacc.c  */
#line 3262 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1138:

/* Line 1464 of yacc.c  */
#line 3264 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1139:

/* Line 1464 of yacc.c  */
#line 3265 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (6)].stmt), (yyvsp[(5) - (6)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1140:

/* Line 1464 of yacc.c  */
#line 3267 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1141:

/* Line 1464 of yacc.c  */
#line 3268 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1142:

/* Line 1464 of yacc.c  */
#line 3269 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1143:

/* Line 1464 of yacc.c  */
#line 3270 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), (yyvsp[(5) - (6)].list), (yyvsp[(6) - (6)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1144:

/* Line 1464 of yacc.c  */
#line 3271 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1145:

/* Line 1464 of yacc.c  */
#line 3273 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[(3) - (7)].id), (yyvsp[(5) - (7)].list), null, (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1146:

/* Line 1464 of yacc.c  */
#line 3274 "grammar.y"
    { (yyval.stmt) = MkForEachStmt((yyvsp[(3) - (9)].id), (yyvsp[(5) - (9)].list), (yyvsp[(7) - (9)].list), (yyvsp[(9) - (9)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1147:

/* Line 1464 of yacc.c  */
#line 3278 "grammar.y"
    { (yyval.stmt) = MkForStmt(null, null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1148:

/* Line 1464 of yacc.c  */
#line 3279 "grammar.y"
    { (yyval.stmt) = MkForStmt(MkExpressionStmt((yyvsp[(3) - (4)].list)), null, null, null); (yyval.stmt).forStmt.init.loc = (yylsp[(3) - (4)]); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1149:

/* Line 1464 of yacc.c  */
#line 3280 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (4)].stmt), null, null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1150:

/* Line 1464 of yacc.c  */
#line 3281 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), MkExpressionStmt((yyvsp[(4) - (5)].list)), null, null); (yyval.stmt).loc = (yyloc); (yyval.stmt).forStmt.check.loc = (yylsp[(4) - (5)]); ;}
    break;

  case 1151:

/* Line 1464 of yacc.c  */
#line 3285 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), (yyvsp[(4) - (5)].stmt), (yyvsp[(5) - (5)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1152:

/* Line 1464 of yacc.c  */
#line 3286 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1153:

/* Line 1464 of yacc.c  */
#line 3287 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1154:

/* Line 1464 of yacc.c  */
#line 3288 "grammar.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), (yyvsp[(5) - (6)].list), (yyvsp[(6) - (6)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1155:

/* Line 1464 of yacc.c  */
#line 3290 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (6)].stmt), (yyvsp[(5) - (6)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1156:

/* Line 1464 of yacc.c  */
#line 3291 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (5)].stmt), (yyvsp[(5) - (5)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1157:

/* Line 1464 of yacc.c  */
#line 3292 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (5)].stmt), (yyvsp[(5) - (5)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1158:

/* Line 1464 of yacc.c  */
#line 3293 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (4)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1159:

/* Line 1464 of yacc.c  */
#line 3294 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (3)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1160:

/* Line 1464 of yacc.c  */
#line 3295 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (2)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1161:

/* Line 1464 of yacc.c  */
#line 3296 "grammar.y"
    { (yyval.stmt) = MkDoWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1162:

/* Line 1464 of yacc.c  */
#line 3299 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1163:

/* Line 1464 of yacc.c  */
#line 3303 "grammar.y"
    { (yyval.stmt) = MkWhileStmt(null, null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1164:

/* Line 1464 of yacc.c  */
#line 3304 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (3)].list), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1165:

/* Line 1464 of yacc.c  */
#line 3308 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1166:

/* Line 1464 of yacc.c  */
#line 3309 "grammar.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (4)].list), (yyvsp[(4) - (4)].stmt) ); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1167:

/* Line 1464 of yacc.c  */
#line 3313 "grammar.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1168:

/* Line 1464 of yacc.c  */
#line 3314 "grammar.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1169:

/* Line 1464 of yacc.c  */
#line 3315 "grammar.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1170:

/* Line 1464 of yacc.c  */
#line 3316 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 1171:

/* Line 1464 of yacc.c  */
#line 3317 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1172:

/* Line 1464 of yacc.c  */
#line 3318 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1173:

/* Line 1464 of yacc.c  */
#line 3319 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (3)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1174:

/* Line 1464 of yacc.c  */
#line 3320 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (3)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1175:

/* Line 1464 of yacc.c  */
#line 3324 "grammar.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1176:

/* Line 1464 of yacc.c  */
#line 3325 "grammar.y"
    { (yyval.stmt) = MkReturnStmt(MkListOne((yyvsp[(2) - (2)].exp))); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1177:

/* Line 1464 of yacc.c  */
#line 3326 "grammar.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc.start = exp.loc.end = (yylsp[(1) - (1)]).end; ;}
    break;

  case 1178:

/* Line 1464 of yacc.c  */
#line 3327 "grammar.y"
    { (yyval.stmt) = MkGotoStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 1179:

/* Line 1464 of yacc.c  */
#line 3333 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (4)].list), (yyvsp[(2) - (4)].declarator), (yyvsp[(3) - (4)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(4) - (4)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1180:

/* Line 1464 of yacc.c  */
#line 3335 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1181:

/* Line 1464 of yacc.c  */
#line 3337 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); ;}
    break;

  case 1182:

/* Line 1464 of yacc.c  */
#line 3338 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (2)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(2) - (2)].stmt)); (yyval.function).loc = (yyloc);;}
    break;

  case 1183:

/* Line 1464 of yacc.c  */
#line 3341 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (4)].list), (yyvsp[(2) - (4)].declarator), (yyvsp[(3) - (4)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(4) - (4)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(4) - (4)].stmt).loc.end; ;}
    break;

  case 1184:

/* Line 1464 of yacc.c  */
#line 3342 "grammar.y"
    { (yyval.function) = MkFunction((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(3) - (3)].stmt).loc.end; ;}
    break;

  case 1185:

/* Line 1464 of yacc.c  */
#line 3343 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ProcessFunctionBody((yyval.function), (yyvsp[(3) - (3)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(3) - (3)].stmt).loc.end; ;}
    break;

  case 1186:

/* Line 1464 of yacc.c  */
#line 3344 "grammar.y"
    { (yyval.function) = MkFunction(null, (yyvsp[(1) - (2)].declarator), null); ProcessFunctionBody((yyval.function), (yyvsp[(2) - (2)].stmt)); (yyval.function).loc = (yyloc); (yyval.function).loc.end = (yyvsp[(2) - (2)].stmt).loc.end; ;}
    break;

  case 1187:

/* Line 1464 of yacc.c  */
#line 3348 "grammar.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 1188:

/* Line 1464 of yacc.c  */
#line 3350 "grammar.y"
    { 
      int len1 = strlen((yyvsp[(1) - (2)].string));
      int len2 = strlen(yytext);
      (yyval.string) = new byte[len1-1 + len2-1 + 1];
      memcpy((yyval.string), (yyvsp[(1) - (2)].string), len1-1);
      memcpy((yyval.string) + len1-1, yytext+1, len2);
      delete (yyvsp[(1) - (2)].string);
   ;}
    break;

  case 1189:

/* Line 1464 of yacc.c  */
#line 3361 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(1) - (1)].function)); (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1190:

/* Line 1464 of yacc.c  */
#line 3363 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(1) - (1)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1191:

/* Line 1464 of yacc.c  */
#line 3366 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; FreeList((yyvsp[(1) - (2)].list), FreeSpecifier); ;}
    break;

  case 1192:

/* Line 1464 of yacc.c  */
#line 3369 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(1) - (1)].declaration));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1193:

/* Line 1464 of yacc.c  */
#line 3370 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(2) - (2)].string), normalImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1194:

/* Line 1464 of yacc.c  */
#line 3371 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), staticImport, (declMode != defaultAccess) ? declMode : privateAccess);  (yyval.external).loc = (yyloc); ;}
    break;

  case 1195:

/* Line 1464 of yacc.c  */
#line 3373 "grammar.y"
    {
      bool isRemote = !strcmp((yyvsp[(2) - (3)].id).string, "remote");
      (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), isRemote ? remoteImport : normalImport, (declMode != defaultAccess) ? declMode : privateAccess); 
      (yyval.external).loc = (yyloc);
      FreeIdentifier((yyvsp[(2) - (3)].id));
      if(!isRemote)
         yyerror(); 
   ;}
    break;

  case 1196:

/* Line 1464 of yacc.c  */
#line 3382 "grammar.y"
    { (yyval.external) = null; ;}
    break;

  case 1197:

/* Line 1464 of yacc.c  */
#line 3384 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(2) - (2)].function)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].function).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1198:

/* Line 1464 of yacc.c  */
#line 3386 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)]._class).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? (yyvsp[(1) - (2)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1199:

/* Line 1464 of yacc.c  */
#line 3387 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(2) - (2)].declaration)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].declaration).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1200:

/* Line 1464 of yacc.c  */
#line 3388 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(3) - (3)].string), normalImport, ((yyvsp[(1) - (3)].declMode) != defaultAccess) ? (yyvsp[(1) - (3)].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1201:

/* Line 1464 of yacc.c  */
#line 3389 "grammar.y"
    { (yyval.external) = MkExternalImport((yyvsp[(4) - (4)].string), staticImport, ((yyvsp[(1) - (4)].declMode) != defaultAccess) ? (yyvsp[(1) - (4)].declMode) : privateAccess);  (yyval.external).loc = (yyloc); declMode = defaultDeclMode; ;}
    break;

  case 1202:

/* Line 1464 of yacc.c  */
#line 3391 "grammar.y"
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

  case 1203:

/* Line 1464 of yacc.c  */
#line 3400 "grammar.y"
    { defaultDeclMode = (yyvsp[(1) - (2)].declMode); (yyval.external) = null; ;}
    break;

  case 1204:

/* Line 1464 of yacc.c  */
#line 3401 "grammar.y"
    { defaultDeclMode = staticAccess; (yyval.external) = null; ;}
    break;

  case 1205:

/* Line 1464 of yacc.c  */
#line 3402 "grammar.y"
    { (yyval.external) = MkExternalNameSpace((yyvsp[(2) - (2)].id)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1206:

/* Line 1464 of yacc.c  */
#line 3403 "grammar.y"
    { (yyval.external) = MkExternalNameSpace(MkIdentifier((yyvsp[(2) - (2)].specifier).name)); FreeSpecifier((yyvsp[(2) - (2)].specifier)); (yyval.external).loc = (yyloc); ;}
    break;

  case 1207:

/* Line 1464 of yacc.c  */
#line 3404 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[(1) - (1)].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[(1) - (1)].dbtableDef).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1208:

/* Line 1464 of yacc.c  */
#line 3405 "grammar.y"
    { (yyval.external) = MkExternalDBTable((yyvsp[(2) - (2)].dbtableDef)); (yyval.external).loc = (yyloc);  (yyvsp[(2) - (2)].dbtableDef).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1209:

/* Line 1464 of yacc.c  */
#line 3409 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(1) - (1)]._class));  (yyval.external).loc = (yyvsp[(1) - (1)]._class).loc; (yyvsp[(1) - (1)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1210:

/* Line 1464 of yacc.c  */
#line 3411 "grammar.y"
    {
      FreeList((yyvsp[(1) - (2)].list), FreeSpecifier);
      (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));
      (yyval.external).loc = (yyvsp[(2) - (2)]._class).loc;
      (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess;
      declMode = defaultDeclMode;
   ;}
    break;

  case 1211:

/* Line 1464 of yacc.c  */
#line 3418 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(1) - (1)].function)); (yyval.external).loc = (yyvsp[(1) - (1)].function).loc;  (yyvsp[(1) - (1)].function).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1212:

/* Line 1464 of yacc.c  */
#line 3420 "grammar.y"
    { (yyval.external) = MkExternalClass((yyvsp[(2) - (2)]._class));  (yyval.external).loc = (yyvsp[(2) - (2)]._class).loc; (yyvsp[(2) - (2)]._class).declMode = ((yyvsp[(1) - (2)].declMode) != defaultAccess) ? (yyvsp[(1) - (2)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1213:

/* Line 1464 of yacc.c  */
#line 3421 "grammar.y"
    { (yyval.external) = MkExternalFunction((yyvsp[(2) - (2)].function)); (yyval.external).loc = (yyvsp[(2) - (2)].function).loc; (yyvsp[(2) - (2)].function).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1214:

/* Line 1464 of yacc.c  */
#line 3424 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(1) - (1)].declaration));  (yyval.external).loc = (yyloc); (yyvsp[(1) - (1)].declaration).declMode = declMode; declMode = defaultDeclMode; ;}
    break;

  case 1215:

/* Line 1464 of yacc.c  */
#line 3425 "grammar.y"
    { (yyval.external) = MkExternalDeclaration((yyvsp[(2) - (2)].declaration)); (yyval.external).loc = (yyloc); (yyvsp[(2) - (2)].declaration).declMode = (yyvsp[(1) - (2)].declMode); declMode = defaultDeclMode; ;}
    break;

  case 1216:

/* Line 1464 of yacc.c  */
#line 3429 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].external)); ast = (yyval.list); ;}
    break;

  case 1217:

/* Line 1464 of yacc.c  */
#line 3430 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1218:

/* Line 1464 of yacc.c  */
#line 3431 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1221:

/* Line 1464 of yacc.c  */
#line 3437 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].external)); ast = (yyval.list); ;}
    break;

  case 1222:

/* Line 1464 of yacc.c  */
#line 3438 "grammar.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].external)); ;}
    break;

  case 1223:

/* Line 1464 of yacc.c  */
#line 3440 "grammar.y"
    { External _class = MkExternalClass((yyvsp[(2) - (2)]._class)); (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), _class); _class.loc = (yylsp[(2) - (2)]);  (yyvsp[(2) - (2)]._class).declMode = (declMode != defaultAccess) ? declMode : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1224:

/* Line 1464 of yacc.c  */
#line 3442 "grammar.y"
    { External _class = MkExternalClass((yyvsp[(3) - (3)]._class)); (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), _class); _class.loc = (yylsp[(3) - (3)]);  (yyvsp[(3) - (3)]._class).declMode = ((yyvsp[(2) - (3)].declMode) != defaultAccess) ? (yyvsp[(2) - (3)].declMode) : privateAccess; declMode = defaultDeclMode; ;}
    break;

  case 1227:

/* Line 1464 of yacc.c  */
#line 3448 "grammar.y"
    { ast = MkList(); ;}
    break;

  case 1228:

/* Line 1464 of yacc.c  */
#line 3452 "grammar.y"
    { Symbol symbol = DeclClassAddNameSpace(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); FreeIdentifier((yyvsp[(3) - (6)].id)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (6)].string), symbol, (yyvsp[(5) - (6)].list)); ;}
    break;

  case 1229:

/* Line 1464 of yacc.c  */
#line 3453 "grammar.y"
    { Symbol symbol = DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (6)].string), symbol, (yyvsp[(5) - (6)].list)); ;}
    break;

  case 1230:

/* Line 1464 of yacc.c  */
#line 3454 "grammar.y"
    { (yyval.dbtableDef) = MkDBTableDef((yyvsp[(2) - (5)].string), null, (yyvsp[(4) - (5)].list)); ;}
    break;

  case 1231:

/* Line 1464 of yacc.c  */
#line 3458 "grammar.y"
    { (yyval.dbtableEntry) = MkDBFieldEntry(MkTypeName((yyvsp[(1) - (4)].list), null), (yyvsp[(2) - (4)].id), (yyvsp[(3) - (4)].string)); ;}
    break;

  case 1232:

/* Line 1464 of yacc.c  */
#line 3462 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(1) - (1)].id), ascending); ;}
    break;

  case 1233:

/* Line 1464 of yacc.c  */
#line 3463 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(2) - (2)].id), descending); ;}
    break;

  case 1234:

/* Line 1464 of yacc.c  */
#line 3464 "grammar.y"
    { (yyval.dbindexItem) = MkDBIndexItem((yyvsp[(2) - (2)].id), ascending); ;}
    break;

  case 1235:

/* Line 1464 of yacc.c  */
#line 3468 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbindexItem)); ;}
    break;

  case 1236:

/* Line 1464 of yacc.c  */
#line 3469 "grammar.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].dbindexItem)); ;}
    break;

  case 1237:

/* Line 1464 of yacc.c  */
#line 3473 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[(2) - (3)].list), null); ;}
    break;

  case 1238:

/* Line 1464 of yacc.c  */
#line 3474 "grammar.y"
    { (yyval.dbtableEntry) = MkDBIndexEntry((yyvsp[(2) - (4)].list), (yyvsp[(3) - (4)].id)); ;}
    break;

  case 1239:

/* Line 1464 of yacc.c  */
#line 3478 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbtableEntry)); ;}
    break;

  case 1240:

/* Line 1464 of yacc.c  */
#line 3479 "grammar.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].dbtableEntry)); ;}
    break;

  case 1241:

/* Line 1464 of yacc.c  */
#line 3480 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].dbtableEntry)); ;}
    break;

  case 1242:

/* Line 1464 of yacc.c  */
#line 3481 "grammar.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].dbtableEntry)); ;}
    break;

  case 1243:

/* Line 1464 of yacc.c  */
#line 3485 "grammar.y"
    { (yyval.exp) = MkExpDBOpen((yyvsp[(3) - (6)].exp), (yyvsp[(5) - (6)].exp)); ;}
    break;

  case 1244:

/* Line 1464 of yacc.c  */
#line 3489 "grammar.y"
    { (yyval.exp) = MkExpDBField((yyvsp[(3) - (6)].string), (yyvsp[(5) - (6)].id)); ;}
    break;

  case 1245:

/* Line 1464 of yacc.c  */
#line 3493 "grammar.y"
    { (yyval.exp) = MkExpDBIndex((yyvsp[(3) - (6)].string), (yyvsp[(5) - (6)].id)); ;}
    break;

  case 1246:

/* Line 1464 of yacc.c  */
#line 3497 "grammar.y"
    { (yyval.exp) = MkExpDBTable((yyvsp[(3) - (4)].string)); ;}
    break;



/* Line 1464 of yacc.c  */
#line 20721 "grammar.ec"
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
#line 3500 "grammar.y"


