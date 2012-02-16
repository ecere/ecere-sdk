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
#line 288 "type.ec"
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
#line 313 "type.ec"

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
#define YYFINAL  99
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7435

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  121
/* YYNRULES -- Number of rules.  */
#define YYNRULES  482
/* YYNRULES -- Number of states.  */
#define YYNSTATES  821

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
       2,     2,     2,   123,     2,     2,   115,   125,   120,     2,
     112,   113,   109,   121,   119,   122,   116,   124,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   129,   131,
     110,   130,   111,   128,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   117,     2,   118,   126,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,   127,   133,   114,     2,     2,     2,
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
       0,     0,     3,     6,     9,    12,    14,    17,    19,    21,
      26,    31,    34,    36,    40,    45,    49,    52,    54,    56,
      60,    62,    64,    66,    68,    71,    76,    79,    86,    92,
      99,   105,   113,   120,   128,   135,   137,   139,   144,   148,
     153,   157,   161,   164,   167,   169,   171,   176,   180,   185,
     189,   193,   196,   199,   201,   203,   207,   211,   214,   217,
     220,   225,   228,   233,   235,   237,   239,   241,   243,   245,
     247,   249,   251,   253,   255,   257,   262,   264,   268,   272,
     276,   278,   282,   286,   288,   292,   296,   299,   301,   304,
     308,   312,   316,   318,   322,   326,   328,   332,   334,   338,
     340,   344,   346,   350,   352,   356,   358,   364,   366,   370,
     374,   376,   378,   380,   382,   384,   386,   388,   390,   392,
     394,   396,   398,   402,   404,   407,   411,   414,   420,   422,
     425,   427,   430,   432,   435,   437,   440,   442,   445,   447,
     450,   452,   455,   457,   460,   462,   465,   467,   470,   472,
     475,   477,   480,   482,   485,   487,   490,   492,   495,   497,
     500,   502,   505,   507,   510,   512,   515,   517,   520,   522,
     524,   526,   529,   531,   534,   536,   539,   541,   544,   549,
     555,   557,   560,   562,   565,   567,   570,   572,   575,   577,
     580,   582,   585,   590,   596,   598,   602,   604,   608,   610,
     612,   614,   616,   618,   620,   622,   624,   626,   628,   630,
     632,   634,   636,   638,   640,   642,   644,   646,   648,   650,
     652,   654,   656,   658,   660,   662,   664,   666,   671,   676,
     678,   680,   682,   684,   686,   688,   690,   692,   694,   696,
     698,   700,   702,   704,   706,   708,   713,   718,   720,   726,
     731,   736,   740,   746,   749,   752,   754,   757,   759,   761,
     763,   765,   769,   773,   777,   781,   783,   787,   789,   791,
     793,   796,   800,   802,   806,   816,   826,   834,   842,   848,
     859,   870,   879,   888,   895,   904,   913,   920,   927,   932,
     942,   952,   960,   968,   974,   978,   981,   984,   987,   989,
     992,   994,   996,   998,  1002,  1004,  1007,  1010,  1014,  1020,
    1023,  1026,  1031,  1037,  1045,  1053,  1059,  1061,  1065,  1067,
    1071,  1075,  1078,  1082,  1086,  1090,  1095,  1100,  1103,  1107,
    1111,  1116,  1120,  1123,  1127,  1131,  1136,  1138,  1140,  1143,
    1146,  1149,  1153,  1155,  1157,  1160,  1163,  1166,  1170,  1172,
    1175,  1179,  1182,  1184,  1188,  1193,  1197,  1202,  1204,  1207,
    1210,  1214,  1218,  1221,  1225,  1229,  1232,  1234,  1236,  1239,
    1242,  1244,  1247,  1250,  1254,  1258,  1260,  1263,  1265,  1268,
    1271,  1275,  1277,  1281,  1283,  1287,  1290,  1293,  1295,  1297,
    1299,  1302,  1305,  1309,  1311,  1314,  1316,  1319,  1322,  1324,
    1328,  1330,  1333,  1335,  1338,  1340,  1344,  1349,  1351,  1353,
    1355,  1359,  1361,  1363,  1365,  1367,  1369,  1371,  1375,  1380,
    1384,  1386,  1389,  1391,  1394,  1397,  1399,  1401,  1404,  1406,
    1409,  1413,  1415,  1418,  1424,  1432,  1438,  1444,  1452,  1459,
    1467,  1472,  1478,  1483,  1487,  1490,  1493,  1496,  1500,  1502,
    1508,  1513,  1519,  1524,  1529,  1533,  1538,  1542,  1546,  1549,
    1552,  1555,  1558,  1561,  1564,  1567,  1570,  1573,  1577,  1579,
    1581,  1585,  1588,  1590,  1592,  1595,  1598,  1600,  1603,  1605,
    1607,  1610,  1612
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     254,     0,    -1,   144,   109,    -1,   144,   110,    -1,   144,
       1,    -1,   139,    -1,   144,   144,    -1,    28,    -1,   138,
      -1,   138,   110,   195,   111,    -1,   138,   110,   195,    11,
      -1,   176,   214,    -1,   214,    -1,   176,   112,   113,    -1,
     114,   176,   112,   113,    -1,    78,   176,   214,    -1,    78,
     214,    -1,     3,    -1,   146,    -1,   112,   170,   113,    -1,
     144,    -1,   244,    -1,     4,    -1,   241,    -1,   115,   241,
      -1,   115,   241,   116,   241,    -1,   112,   113,    -1,    71,
     176,   211,   117,   171,   118,    -1,    71,   176,   117,   171,
     118,    -1,   102,   176,   211,   117,   171,   118,    -1,   102,
     176,   117,   171,   118,    -1,    72,   171,   179,   211,   117,
     171,   118,    -1,    72,   171,   179,   117,   171,   118,    -1,
     103,   171,   179,   211,   117,   171,   118,    -1,   103,   171,
     179,   117,   171,   118,    -1,     1,    -1,   145,    -1,   147,
     117,   170,   118,    -1,   147,   112,   113,    -1,   147,   112,
     150,   113,    -1,   147,   116,   144,    -1,   147,     7,   144,
      -1,   147,     8,    -1,   147,     9,    -1,   245,    -1,   146,
      -1,   149,   117,   170,   118,    -1,   149,   112,   113,    -1,
     149,   112,   150,   113,    -1,   149,   116,   144,    -1,   149,
       7,   144,    -1,   149,     8,    -1,   149,     9,    -1,   168,
      -1,   148,    -1,   150,   119,   168,    -1,   150,   119,   148,
      -1,     8,   152,    -1,     9,   152,    -1,   154,   155,    -1,
       6,   112,   152,   113,    -1,     6,   153,    -1,     6,   112,
     226,   113,    -1,   151,    -1,   147,    -1,   151,    -1,   149,
      -1,   120,    -1,   109,    -1,   121,    -1,   122,    -1,   114,
      -1,   123,    -1,    73,    -1,   152,    -1,   112,   225,   113,
     155,    -1,   155,    -1,   156,   109,   155,    -1,   156,   124,
     155,    -1,   156,   125,   155,    -1,   156,    -1,   157,   121,
     156,    -1,   157,   122,   156,    -1,   157,    -1,   158,    10,
     157,    -1,   158,    11,   157,    -1,   160,   110,    -1,   158,
      -1,   159,   158,    -1,   160,   111,   158,    -1,   160,    12,
     158,    -1,   160,    13,   158,    -1,   160,    -1,   161,    14,
     160,    -1,   161,    15,   160,    -1,   161,    -1,   162,   120,
     161,    -1,   162,    -1,   163,   126,   162,    -1,   163,    -1,
     164,   127,   163,    -1,   164,    -1,   165,    16,   164,    -1,
     165,    -1,   166,    17,   165,    -1,   166,    -1,   166,   128,
     170,   129,   167,    -1,   167,    -1,   152,   169,   168,    -1,
     152,   169,   148,    -1,   130,    -1,    18,    -1,    19,    -1,
      20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,
      25,    -1,    26,    -1,    27,    -1,   168,    -1,   170,   119,
     168,    -1,   167,    -1,   175,   131,    -1,   175,   180,   131,
      -1,   242,   131,    -1,    77,   144,   130,   171,   131,    -1,
     186,    -1,   173,   186,    -1,   187,    -1,   173,   187,    -1,
     205,    -1,   173,   205,    -1,   189,    -1,   173,   189,    -1,
     186,    -1,   174,   186,    -1,   187,    -1,   174,   187,    -1,
     135,    -1,   174,   135,    -1,   205,    -1,   174,   205,    -1,
     189,    -1,   174,   189,    -1,   182,    -1,   175,   182,    -1,
     186,    -1,   175,   186,    -1,   187,    -1,   175,   187,    -1,
     205,    -1,   175,   205,    -1,   189,    -1,   175,   189,    -1,
     182,    -1,   176,   182,    -1,   186,    -1,   176,   186,    -1,
     187,    -1,   176,   187,    -1,   135,    -1,   176,   135,    -1,
     189,    -1,   176,   189,    -1,   205,    -1,   176,   205,    -1,
     176,    -1,   136,    -1,   182,    -1,   178,   182,    -1,   186,
      -1,   178,   186,    -1,   188,    -1,   178,   188,    -1,   144,
      -1,   178,   144,    -1,   144,   110,   195,   111,    -1,   178,
     144,   110,   195,   111,    -1,   182,    -1,   179,   182,    -1,
     186,    -1,   179,   186,    -1,   188,    -1,   179,   188,    -1,
     189,    -1,   179,   189,    -1,   205,    -1,   179,   205,    -1,
     144,    -1,   179,   144,    -1,   144,   110,   195,   111,    -1,
     179,   144,   110,   195,   111,    -1,   181,    -1,   180,   119,
     181,    -1,   212,    -1,   212,   130,   227,    -1,    29,    -1,
      30,    -1,    31,    -1,    32,    -1,    33,    -1,    74,    -1,
     184,    -1,    79,    -1,    75,    -1,   183,    -1,    44,    -1,
      45,    -1,   185,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,
     190,    -1,   204,    -1,   137,    -1,   100,   112,   137,   113,
      -1,   100,   112,   144,   113,    -1,    66,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,   190,    -1,   204,    -1,   139,    -1,   100,   112,
     137,   113,    -1,   100,   112,   144,   113,    -1,    66,    -1,
     196,   144,   132,   197,   133,    -1,   196,   132,   197,   133,
      -1,   196,   144,   132,   133,    -1,   196,   132,   133,    -1,
     196,   138,   132,   197,   133,    -1,   196,   144,    -1,   196,
     139,    -1,   175,    -1,   175,   210,    -1,   191,    -1,   158,
      -1,   193,    -1,   192,    -1,   144,   130,   193,    -1,   144,
     130,   192,    -1,   191,   130,   193,    -1,   191,   130,   192,
      -1,   194,    -1,   195,   119,   194,    -1,    48,    -1,    49,
      -1,   201,    -1,   197,   201,    -1,   147,   130,   228,    -1,
     198,    -1,   199,   119,   198,    -1,    68,   178,   144,   132,
      69,   236,    70,   236,   133,    -1,    68,   178,   144,   132,
      70,   236,    69,   236,   133,    -1,    68,   178,   144,   132,
      69,   236,   133,    -1,    68,   178,   144,   132,    70,   236,
     133,    -1,    68,   178,   144,   132,   133,    -1,    68,   178,
     210,   144,   132,    69,   236,    70,   236,   133,    -1,    68,
     178,   210,   144,   132,    70,   236,    69,   236,   133,    -1,
      68,   178,   210,   144,   132,    69,   236,   133,    -1,    68,
     178,   210,   144,   132,    70,   236,   133,    -1,    68,   178,
     210,   144,   132,   133,    -1,    68,   178,   132,    69,   236,
      70,   236,   133,    -1,    68,   178,   132,    70,   236,    69,
     236,   133,    -1,    68,   178,   132,    69,   236,   133,    -1,
      68,   178,   132,    70,   236,   133,    -1,    68,   178,   132,
     133,    -1,    68,   178,   210,   132,    69,   236,    70,   236,
     133,    -1,    68,   178,   210,   132,    70,   236,    69,   236,
     133,    -1,    68,   178,   210,   132,    69,   236,   133,    -1,
      68,   178,   210,   132,    70,   236,   133,    -1,    68,   178,
     210,   132,   133,    -1,   176,   202,   131,    -1,   176,   131,
      -1,   244,   131,    -1,   243,   131,    -1,   246,    -1,   199,
     131,    -1,   200,    -1,   131,    -1,   203,    -1,   202,   119,
     203,    -1,   218,    -1,   218,   184,    -1,   129,   171,    -1,
     218,   129,   171,    -1,   218,   129,   171,   129,   171,    -1,
      50,   144,    -1,    50,   139,    -1,    50,   132,   206,   133,
      -1,    50,   144,   132,   206,   133,    -1,    50,   144,   132,
     206,   131,   197,   133,    -1,    50,   139,   132,   206,   131,
     197,   133,    -1,    50,   139,   132,   206,   133,    -1,   207,
      -1,   206,   119,   207,    -1,   144,    -1,   144,   130,   171,
      -1,   112,   210,   113,    -1,   117,   118,    -1,   117,   171,
     118,    -1,   117,   137,   118,    -1,   208,   117,   118,    -1,
     208,   117,   171,   118,    -1,   208,   117,   137,   118,    -1,
     112,   113,    -1,   112,   221,   113,    -1,   208,   112,   113,
      -1,   208,   112,   221,   113,    -1,   112,   211,   113,    -1,
     112,   113,    -1,   112,   221,   113,    -1,   209,   112,   113,
      -1,   209,   112,   221,   113,    -1,   220,    -1,   208,    -1,
     220,   208,    -1,   183,   220,    -1,   183,   208,    -1,   183,
     220,   208,    -1,   220,    -1,   209,    -1,   220,   209,    -1,
     183,   220,    -1,   183,   209,    -1,   183,   220,   209,    -1,
     217,    -1,   220,   217,    -1,   183,   220,   217,    -1,   212,
     183,    -1,   144,    -1,   112,   212,   113,    -1,   213,   117,
     171,   118,    -1,   213,   117,   118,    -1,   213,   117,   137,
     118,    -1,   216,    -1,   220,   216,    -1,   183,   216,    -1,
     183,   220,   216,    -1,   220,   183,   216,    -1,   213,   112,
      -1,   215,   221,   113,    -1,   215,   224,   113,    -1,   215,
     113,    -1,   216,    -1,   213,    -1,   183,   216,    -1,   183,
     213,    -1,   213,    -1,   220,   213,    -1,   183,   213,    -1,
     183,   220,   213,    -1,   220,   183,   213,    -1,   186,    -1,
     219,   186,    -1,   109,    -1,   109,   219,    -1,   109,   220,
      -1,   109,   219,   220,    -1,   222,    -1,   222,   119,    51,
      -1,   223,    -1,   222,   119,   223,    -1,   176,   212,    -1,
     176,   210,    -1,   177,    -1,    65,    -1,    82,    -1,    82,
     120,    -1,    82,   212,    -1,    82,   120,   212,    -1,    83,
      -1,    83,   212,    -1,     1,    -1,     1,   212,    -1,     1,
     210,    -1,   144,    -1,   224,   119,   144,    -1,   173,    -1,
     173,   210,    -1,   174,    -1,   174,   210,    -1,   168,    -1,
     132,   229,   133,    -1,   132,   229,   119,   133,    -1,   167,
      -1,   148,    -1,   227,    -1,   229,   119,   227,    -1,   231,
      -1,   236,    -1,   237,    -1,   238,    -1,   239,    -1,   240,
      -1,   144,   129,   230,    -1,    52,   171,   129,   230,    -1,
      53,   129,   230,    -1,   172,    -1,   232,   172,    -1,   230,
      -1,   233,   230,    -1,   233,   172,    -1,   233,    -1,   232,
      -1,   232,   233,    -1,   132,    -1,   132,   133,    -1,   235,
     234,   133,    -1,   131,    -1,   170,   131,    -1,    54,   112,
     170,   113,   230,    -1,    54,   112,   170,   113,   230,    64,
     230,    -1,    55,   112,   170,   113,   230,    -1,    56,   112,
     170,   113,   230,    -1,    57,   230,    56,   112,   170,   113,
     131,    -1,    58,   112,   237,   237,   113,   230,    -1,    58,
     112,   237,   237,   170,   113,   230,    -1,    56,   112,   113,
     230,    -1,    58,   112,   237,   113,   230,    -1,    58,   112,
     113,   230,    -1,    59,   144,   131,    -1,    60,   131,    -1,
      61,   131,    -1,    62,   131,    -1,    62,   170,   131,    -1,
       5,    -1,   175,   144,   132,   253,   133,    -1,   175,   144,
     132,   133,    -1,   176,   144,   132,   253,   133,    -1,   176,
     144,   132,   133,    -1,   137,   132,   253,   133,    -1,   137,
     132,   133,    -1,   144,   132,   253,   133,    -1,   144,   132,
     133,    -1,   132,   253,   133,    -1,   132,   133,    -1,   140,
     236,    -1,   143,   236,    -1,   143,   131,    -1,   141,   236,
      -1,   142,   236,    -1,   175,   214,    -1,   175,   218,    -1,
     247,   236,    -1,   147,   130,   228,    -1,   228,    -1,   249,
      -1,   250,   119,   249,    -1,   250,   131,    -1,   251,    -1,
     248,    -1,   252,   251,    -1,   252,   248,    -1,   131,    -1,
     252,   131,    -1,   252,    -1,   250,    -1,   252,   250,    -1,
     223,    -1,   223,   129,   171,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   213,   213,   231,   265,   315,   316,   343,   347,   348,
     349,   366,   368,   373,   378,   383,   385,   390,   395,   396,
     401,   403,   405,   407,   409,   410,   411,   414,   415,   416,
     417,   418,   419,   420,   421,   422,   426,   427,   428,   429,
     430,   431,   432,   433,   437,   442,   443,   444,   445,   446,
     447,   448,   449,   453,   454,   455,   456,   460,   461,   462,
     463,   464,   465,   469,   470,   474,   475,   479,   480,   481,
     482,   483,   484,   485,   489,   490,   494,   495,   496,   497,
     501,   502,   503,   507,   508,   509,   513,   521,   522,   523,
     524,   525,   529,   530,   531,   535,   536,   540,   541,   545,
     546,   550,   551,   555,   556,   560,   561,   565,   566,   567,
     571,   572,   573,   574,   575,   576,   577,   578,   579,   580,
     581,   585,   586,   590,   594,   595,   596,   597,   601,   602,
     603,   604,   605,   606,   607,   608,   612,   613,   614,   615,
     616,   617,   618,   619,   620,   621,   625,   626,   627,   628,
     629,   630,   631,   632,   633,   634,   638,   639,   640,   641,
     642,   643,   644,   645,   646,   647,   648,   649,   653,   654,
     658,   659,   660,   661,   662,   663,   664,   665,   666,   684,
     701,   702,   703,   704,   705,   706,   707,   708,   709,   710,
     711,   712,   713,   731,   748,   749,   753,   754,   758,   759,
     760,   761,   762,   766,   767,   771,   776,   777,   781,   782,
     783,   788,   789,   790,   791,   792,   793,   794,   795,   796,
     797,   798,   799,   800,   801,   802,   803,   804,   805,   806,
     810,   811,   812,   813,   814,   815,   816,   817,   818,   819,
     820,   821,   822,   823,   824,   825,   826,   827,   832,   833,
     834,   835,   836,   841,   842,   847,   848,   853,   863,   867,
     869,   870,   872,   873,   897,   912,   913,   917,   918,   922,
     923,   927,   931,   932,   936,   938,   940,   942,   944,   947,
     949,   951,   953,   955,   958,   960,   962,   964,   966,   969,
     971,   973,   975,   977,   982,   983,   984,   985,   986,   987,
     988,   989,   993,   995,  1000,  1002,  1004,  1006,  1008,  1013,
    1014,  1018,  1020,  1021,  1022,  1023,  1027,  1029,  1034,  1036,
    1042,  1044,  1046,  1048,  1050,  1052,  1054,  1056,  1058,  1060,
    1062,  1067,  1069,  1071,  1073,  1075,  1080,  1081,  1082,  1083,
    1084,  1085,  1089,  1090,  1091,  1092,  1093,  1094,  1140,  1141,
    1143,  1145,  1150,  1152,  1154,  1156,  1158,  1163,  1164,  1167,
    1169,  1171,  1177,  1181,  1183,  1185,  1190,  1191,  1192,  1194,
    1199,  1200,  1201,  1202,  1203,  1207,  1208,  1212,  1213,  1214,
    1215,  1219,  1220,  1224,  1225,  1229,  1230,  1231,  1242,  1244,
    1246,  1248,  1250,  1252,  1254,  1257,  1259,  1261,  1265,  1266,
    1270,  1271,  1275,  1276,  1280,  1282,  1284,  1300,  1302,  1324,
    1326,  1331,  1332,  1333,  1334,  1335,  1336,  1340,  1342,  1344,
    1349,  1350,  1354,  1355,  1358,  1362,  1363,  1364,  1368,  1372,
    1380,  1385,  1386,  1390,  1391,  1392,  1396,  1397,  1398,  1399,
    1401,  1402,  1403,  1407,  1408,  1409,  1410,  1411,  1415,  1419,
    1421,  1426,  1428,  1453,  1455,  1457,  1459,  1464,  1466,  1470,
    1472,  1474,  1476,  1478,  1484,  1486,  1491,  1496,  1497,  1501,
    1503,  1508,  1513,  1514,  1515,  1516,  1517,  1518,  1522,  1523,
    1524,  1528,  1529
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
  "storage_class_specifier", "ext_decl", "ext_attrib", "ext_storage",
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
     355,   356,   357,   358,   359,   360,   361,   362,   363,    42,
      60,    62,    40,    41,   126,    36,    46,    91,    93,    44,
      38,    43,    45,    33,    47,    37,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   134,   135,   135,   136,   137,   137,   138,   139,   139,
     139,   140,   140,   141,   142,   143,   143,   144,   145,   145,
     146,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   146,   146,   147,   147,   147,   147,
     147,   147,   147,   147,   148,   149,   149,   149,   149,   149,
     149,   149,   149,   150,   150,   150,   150,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   154,   154,   154,
     154,   154,   154,   154,   155,   155,   156,   156,   156,   156,
     157,   157,   157,   158,   158,   158,   159,   160,   160,   160,
     160,   160,   161,   161,   161,   162,   162,   163,   163,   164,
     164,   165,   165,   166,   166,   167,   167,   168,   168,   168,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     169,   170,   170,   171,   172,   172,   172,   172,   173,   173,
     173,   173,   173,   173,   173,   173,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   174,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   176,   177,   177,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   181,   182,   182,
     182,   182,   182,   183,   183,   184,   185,   185,   186,   186,
     186,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   189,   189,
     189,   189,   189,   190,   190,   191,   191,   192,   193,   194,
     194,   194,   194,   194,   194,   195,   195,   196,   196,   197,
     197,   198,   199,   199,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   201,   201,   201,   201,   201,   201,
     201,   201,   202,   202,   203,   203,   203,   203,   203,   204,
     204,   205,   205,   205,   205,   205,   206,   206,   207,   207,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   209,   209,   209,   209,   209,   210,   210,   210,   210,
     210,   210,   211,   211,   211,   211,   211,   211,   212,   212,
     212,   212,   213,   213,   213,   213,   213,   214,   214,   214,
     214,   214,   215,   216,   216,   216,   217,   217,   217,   217,
     218,   218,   218,   218,   218,   219,   219,   220,   220,   220,
     220,   221,   221,   222,   222,   223,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   223,   224,   224,
     225,   225,   226,   226,   227,   227,   227,   228,   228,   229,
     229,   230,   230,   230,   230,   230,   230,   231,   231,   231,
     232,   232,   233,   233,   233,   234,   234,   234,   235,   236,
     236,   237,   237,   238,   238,   238,   239,   239,   239,   239,
     239,   239,   239,   240,   240,   240,   240,   240,   241,   242,
     242,   243,   243,   244,   244,   244,   244,   245,   245,   246,
     246,   246,   246,   246,   247,   247,   248,   249,   249,   250,
     250,   251,   252,   252,   252,   252,   252,   252,   253,   253,
     253,   254,   254
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
       4,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     1,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     2,     1,     2,     3,
       3,     3,     1,     3,     3,     1,     3,     1,     3,     1,
       3,     1,     3,     1,     3,     1,     5,     1,     3,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     2,     3,     2,     5,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     1,
       1,     2,     1,     2,     1,     2,     1,     2,     4,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     4,     5,     1,     3,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     1,     5,     4,
       4,     3,     5,     2,     2,     1,     2,     1,     1,     1,
       1,     3,     3,     3,     3,     1,     3,     1,     1,     1,
       2,     3,     1,     3,     9,     9,     7,     7,     5,    10,
      10,     8,     8,     6,     8,     8,     6,     6,     4,     9,
       9,     7,     7,     5,     3,     2,     2,     2,     1,     2,
       1,     1,     1,     3,     1,     2,     2,     3,     5,     2,
       2,     4,     5,     7,     7,     5,     1,     3,     1,     3,
       3,     2,     3,     3,     3,     4,     4,     2,     3,     3,
       4,     3,     2,     3,     3,     4,     1,     1,     2,     2,
       2,     3,     1,     1,     2,     2,     2,     3,     1,     2,
       3,     2,     1,     3,     4,     3,     4,     1,     2,     2,
       3,     3,     2,     3,     3,     2,     1,     1,     2,     2,
       1,     2,     2,     3,     3,     1,     2,     1,     2,     2,
       3,     1,     3,     1,     3,     2,     2,     1,     1,     1,
       2,     2,     3,     1,     2,     1,     2,     2,     1,     3,
       1,     2,     1,     2,     1,     3,     4,     1,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     3,     4,     3,
       1,     2,     1,     2,     2,     1,     1,     2,     1,     2,
       3,     1,     2,     5,     7,     5,     5,     7,     6,     7,
       4,     5,     4,     3,     2,     2,     2,     3,     1,     5,
       4,     5,     4,     4,     3,     4,     3,     3,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     3,     1,     1,
       3,     2,     1,     1,     2,     2,     1,     2,     1,     1,
       2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,   395,    17,     7,   198,   199,   200,   201,   202,   212,
     213,   214,   215,   216,   218,   221,   222,   219,   220,   208,
     209,   211,   217,   267,   268,     0,   388,   229,   203,   206,
     205,   389,   393,   223,     0,   162,   169,   226,     8,     5,
       0,   168,   387,   156,   207,   204,   210,   158,   160,   164,
     224,     0,   225,   166,   481,     0,   377,     0,     0,   352,
       0,   337,   397,   396,   367,     0,   366,   348,   336,     0,
     310,   309,     0,   390,     0,   391,     0,   394,     0,     0,
       4,     2,     3,     6,   163,   352,   157,   207,   159,   161,
     165,   167,   386,   385,     0,     8,   254,   253,     0,     1,
     375,   378,   379,   327,     0,     0,     0,     0,   381,   383,
      35,    22,   448,     0,     0,     0,     0,     0,    73,     0,
       0,    68,     0,    71,     0,   321,    67,    69,    70,    72,
       0,    20,    36,    18,    64,    63,    74,     0,    76,    80,
      83,    87,     0,    92,    95,    97,    99,   101,   103,   105,
     123,     0,    23,    21,   340,   369,   368,   339,     0,     0,
     351,   362,     0,   365,     0,     0,     0,     0,   338,   349,
     318,     0,   316,     0,     0,   392,     0,     0,     0,   226,
      20,   258,   255,   146,   148,   150,   154,   257,   260,   259,
     265,     0,   152,     0,     0,     0,     0,   301,   251,     0,
       0,     0,     0,    20,     0,     0,   207,     0,   272,     0,
     300,   269,     0,    12,   357,     0,     0,    21,   298,     0,
       0,     0,   482,   376,   380,   320,   353,   328,     0,     0,
      45,    66,    65,    61,     0,    57,    58,     0,     0,     0,
       0,     0,    26,    74,   107,   121,     0,   400,   128,   130,
     134,   132,     0,    24,   323,     0,     0,     0,    42,    43,
       0,     0,     0,    59,     0,     0,     0,     0,     0,     0,
       0,    88,     0,     0,    86,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   322,   341,   350,   329,     0,   324,
       0,     0,   355,     0,     0,   363,   364,     0,     0,     0,
     311,     0,     0,   227,   228,     0,     0,     0,   147,   207,
     149,   151,   155,   153,   256,   336,     0,    10,     9,     0,
     231,   232,   233,   234,   235,   237,   240,   241,   238,   239,
     230,   236,     0,   247,     0,   244,   176,     0,   170,   172,
     174,   242,     0,   243,     0,    16,    68,     0,    20,     0,
     428,     0,   459,   462,   463,   461,   460,     0,     0,     0,
     295,   352,   207,     0,   302,   370,    11,   304,     0,   359,
       0,   249,   270,     0,   299,     0,   358,   297,   296,     0,
     250,     0,   382,   384,   140,    20,     0,   402,   136,   138,
     144,   142,     0,     0,    51,    52,     0,     0,     0,     0,
       0,   207,   343,     0,   342,   190,     0,   180,   182,   184,
     186,   188,     0,     0,     0,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120,   110,     0,    19,     0,   129,
     131,   135,   133,   401,     0,     0,   476,     0,   454,    64,
     408,   407,     0,   468,    44,     0,   473,   469,   479,   472,
       0,     0,   456,     0,    41,    38,    54,     0,    53,    40,
       0,    77,    78,    79,    81,    82,    84,    85,    90,    91,
      89,    93,    94,    96,    98,   100,   102,   104,     0,   330,
     326,   325,   356,   354,   399,   319,   317,     0,   315,     0,
     312,   257,   262,   261,   339,   264,   263,   266,   310,   309,
       0,     0,     0,   177,   171,   173,   175,     0,   253,    15,
     207,     0,   429,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   431,    20,     0,   420,     0,
     422,   411,     0,     0,     0,   412,   413,   414,   415,   416,
       0,   271,    13,   306,     0,   372,     0,     0,   294,     0,
     305,     0,   371,   360,   273,   361,   252,   248,    60,   141,
     137,   139,   145,   143,   403,    62,    50,    47,     0,    49,
       0,   332,     0,     0,     0,   346,   345,     0,     0,   344,
       0,     0,   191,   181,   183,   185,   187,   189,     0,     0,
       0,     0,     0,   109,   108,   122,    75,    25,   458,     0,
       0,   352,   464,   465,   466,     0,   471,   477,   475,   480,
     474,   453,   455,    39,     0,    37,     0,     0,     0,     0,
       0,     0,     0,     0,   288,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,   444,   445,
     446,     0,     0,     0,   432,   124,   352,     0,   194,   196,
     421,     0,   424,   423,   430,   126,   452,     0,   373,     0,
     303,   370,     0,   307,   374,    48,    46,   331,   333,    28,
     347,   334,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,   457,   467,   470,    56,    55,   106,   314,   313,
     245,   246,   178,     0,     0,     0,     0,     0,   278,     0,
       0,   293,     0,     0,   419,     0,     0,     0,     0,     0,
       0,     0,   443,   447,     0,   417,     0,     0,   125,     0,
     451,   372,     0,     0,   371,     0,   335,    27,   192,    32,
       0,     0,    29,    34,     0,     0,   286,     0,   287,   179,
       0,     0,     0,     0,     0,     0,   283,   418,     0,     0,
     440,     0,     0,   442,     0,     0,     0,   450,     0,   195,
       0,   404,   197,   373,   374,   308,   193,    31,    33,     0,
       0,     0,   276,     0,   277,     0,   291,     0,   292,     0,
       0,   433,   435,   436,     0,   441,     0,     0,   127,   449,
     409,     0,   284,   285,     0,     0,     0,     0,     0,   281,
       0,   282,     0,     0,   438,     0,     0,   405,   274,   275,
     289,   290,     0,     0,   434,   437,   439,   406,   410,   279,
     280
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    35,    36,   221,    38,    39,   199,   200,   201,   202,
     131,   132,   133,   134,   440,   231,   457,   135,   136,   233,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   149,   244,   245,   426,   527,   151,   652,   247,
     387,   182,   205,    42,   337,   406,   647,   648,    43,    44,
      45,    46,    47,    48,   409,    49,    50,   187,   188,   189,
     190,   191,    51,   207,   208,   209,   210,   211,   363,   364,
      52,    53,   171,   172,    61,   402,   105,   403,   106,    64,
     213,    65,    66,    67,   367,   101,   215,   107,   108,   109,
     166,   252,   392,   762,   443,   791,   530,   531,   532,   533,
     534,   351,   535,   536,   537,   538,   539,   152,   540,   216,
     153,   444,   218,   445,   446,   447,   448,   449,   450,   451,
      55
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -666
static const yytype_int16 yypact[] =
{
    7116,   625,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,  -666,  -666,  -666,    39,  -666,  -666,  -666,  -666,
    -666,   373,   771,  -666,   -54,  -666,  -666,  -666,   -33,  -666,
     123,  5939,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,    43,  -666,  -666,    21,   110,   857,  5758,  4870,  -666,
      35,   354,  -666,   508,   386,  6613,  -666,  -666,   380,   167,
      89,   113,   771,   771,    60,   508,   298,   508,    77,  5208,
    -666,  -666,  -666,  -666,  -666,   205,  -666,    35,  -666,  -666,
    -666,  -666,  -666,   508,  3497,   -40,  -666,   136,  5654,  -666,
    -666,   857,  -666,  -666,   764,   129,   199,   164,   162,  -666,
    -666,  -666,  -666,  5707,  5742,  5742,  7189,  5654,  -666,  7189,
    5654,  -666,  5298,  -666,   285,  -666,  -666,  -666,  -666,  -666,
     168,    45,  -666,  -666,   772,  -666,  -666,  5654,  -666,   163,
     -32,   438,  5654,   452,   480,   183,   192,   206,   319,    -6,
    -666,   266,  -666,  -666,   354,   386,  -666,   380,  6699,  4943,
    -666,  -666,  5079,  -666,   435,   275,   371,    49,   354,  -666,
     261,   197,  -666,   167,   167,   508,   298,   288,    26,   279,
     120,   438,  6029,  -666,  -666,  -666,  -666,   278,  -666,  -666,
    -666,   151,  -666,  7262,  6871,  1981,  7189,  -666,  -666,   307,
     307,   307,   222,    11,   472,  4994,    60,  3612,  -666,   124,
    -666,  -666,   386,  -666,  -666,   298,   341,   360,  -666,  4654,
    3727,   279,  -666,  -666,  -666,  -666,  -666,  -666,  7041,  5388,
    -666,   792,  -666,  -666,  5531,  -666,  -666,   205,  6119,  7335,
    6209,  7335,  -666,   706,  -666,  -666,   392,  6437,  -666,  -666,
    -666,  -666,   400,   399,  -666,  2709,  2842,   167,  -666,  -666,
    2039,   167,  5654,  -666,  5654,  5654,  5654,  5654,  5654,  5654,
    5654,   438,  5654,  5654,  -666,  5654,  5654,  5654,  5654,  5654,
    5654,  5654,  5654,  5654,  -666,   354,  -666,  -666,   428,  -666,
     208,   432,  -666,   248,   465,  -666,  -666,   167,  5654,   167,
    -666,   -19,   177,  -666,  -666,  5208,  5849,   167,  -666,   351,
    -666,  -666,  -666,  -666,  -666,   479,  5208,  -666,  -666,  5208,
    -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,    77,  -666,   458,  -666,   483,  4889,  -666,  -666,
    -666,  -666,    77,  -666,  6871,  -666,   857,  5478,    19,  6956,
     470,  4302,  -666,  -666,  -666,  -666,  -666,  4473,   634,  5654,
    -666,    27,    60,   224,  -666,   386,  -666,   -23,   298,  -666,
      49,  -666,  -666,  1125,  -666,    49,  -666,  -666,  -666,  3842,
    -666,  3957,  -666,  -666,  -666,    11,   485,  6437,  -666,  -666,
    -666,  -666,   495,   167,  -666,  -666,  4458,   167,  5654,  6527,
    5654,   105,   499,   498,   500,   509,  6299,  -666,  -666,  -666,
    -666,  -666,  5654,   505,  6389,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,  -666,  -666,  -666,  -666,  4473,  -666,  5654,  -666,
    -666,  -666,  -666,  -666,  5654,   285,  -666,  2975,  -666,   567,
    -666,  -666,  6871,  -666,  -666,   307,  -666,  -666,   302,  -666,
    3108,   491,  -666,   494,  -666,  -666,  -666,   393,  -666,  -666,
     409,  -666,  -666,  -666,   163,   163,   -32,   -32,   438,   438,
     438,   452,   452,   480,   183,   192,   206,   319,   263,  -666,
    -666,  -666,  -666,  -666,  -666,  -666,  -666,  4654,  -666,  4654,
    -666,  -666,  -666,  -666,   479,  -666,  -666,  -666,  -666,  -666,
      77,  5208,   161,   -14,  -666,  -666,  -666,    52,  -666,  -666,
      60,   516,  -666,  5654,   501,   524,   526,   527,  4385,   529,
     167,   511,   513,  4785,   167,  -666,    81,   306,  -666,  5098,
    -666,  -666,  2301,  2443,   514,  -666,  -666,  -666,  -666,  -666,
     518,  -666,  -666,  -666,  3241,   386,    49,   286,  -666,  5654,
    -666,    49,   386,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,   395,  -666,
     439,  -666,   539,   541,   537,   499,   500,  6785,  5654,   499,
    5208,  5654,   546,  -666,  -666,  -666,  -666,  -666,   540,   542,
    5654,  5654,   549,  -666,  -666,  -666,  -666,  -666,  -666,   530,
    4473,   167,  -666,  -666,  -666,  4473,  -666,  -666,  -666,   302,
    -666,  -666,  -666,  -666,  4473,  -666,  5654,  4072,  4187,   554,
      41,     6,   307,   307,  -666,  5208,   276,   343,   538,  -666,
     544,  4385,  5654,  5654,  5566,   613,  4706,   543,  -666,  -666,
    -666,   309,   550,  4385,  -666,  -666,    59,   324,  -666,   -15,
    -666,  2576,  -666,  -666,  -666,  -666,  -666,   548,   386,    60,
    -666,   565,   298,   557,   386,  -666,  -666,  -666,  -666,  -666,
     499,  -666,   572,   569,   339,   570,  5208,  5654,  -666,   573,
     574,  5654,  -666,  -666,  -666,  -666,  -666,  -666,  -666,  -666,
    -666,  -666,  -666,   -25,   -42,   358,   307,   307,  -666,   307,
     307,  -666,   353,  4385,  -666,   404,   423,  4385,   424,   581,
    4385,  4739,  -666,  -666,  5654,  -666,  3374,   771,  -666,  4531,
    -666,   565,    49,    49,   565,  5654,  -666,  -666,  -666,  -666,
     377,   576,  -666,  -666,   577,   307,  -666,   307,  -666,  -666,
      12,   -22,    16,   -20,   307,   307,  -666,  -666,  4385,  4385,
    -666,  4385,  5654,  -666,  4385,  5619,   571,  -666,   568,  -666,
    4531,  -666,  -666,   565,   565,  -666,  -666,  -666,  -666,   578,
     583,   307,  -666,   307,  -666,   307,  -666,   307,  -666,    57,
      -3,   641,  -666,  -666,   447,  -666,  4385,   459,  -666,  -666,
    -666,   271,  -666,  -666,   587,   602,   606,   607,   307,  -666,
     307,  -666,  4385,   575,  -666,  4385,  1358,  -666,  -666,  -666,
    -666,  -666,   608,   620,  -666,  -666,  -666,  -666,  -666,  -666,
    -666
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -666,   112,  -666,   556,   704,   193,  -666,  -666,  -666,  -666,
       0,  -666,   643,    72,  -240,  -666,   362,   646,   888,  -666,
    -666,  -132,   301,   325,    84,  -666,   329,   486,   487,   488,
     489,   490,  -666,  1601,  -241,  -666,   -94,   506,  -334,  -666,
    -666,  -249,   135,  -666,  -666,   528,  -666,    54,  1448,   776,
     406,  -666,  1210,    20,  -140,  1363,  -158,   -93,     4,   130,
     463,  -477,  -177,  -207,   405,  -666,  -666,  -198,  -666,   236,
     234,  1533,   436,   492,   -50,  -365,    87,  -190,     2,  1747,
    -179,  -666,   211,    70,   345,  -666,   855,   -61,  -666,     8,
    -666,  -666,  -666,  -665,  -336,  -666,   322,  -666,  -666,   257,
    -666,  -666,   122,  -582,  -666,  -666,  -666,  -122,  -666,  -666,
      15,  -666,  -666,  -666,   340,   187,   347,   348,  -666,  -233,
    -666
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -479
static const yytype_int16 yytable[] =
{
      40,    59,   253,    63,   165,   263,   442,   442,    54,   372,
     154,   282,   379,   381,     2,   345,   342,   528,   168,   458,
     456,   541,     2,   453,   621,    71,   366,   737,   246,     2,
       2,    59,    59,    75,    77,   341,   575,   154,     2,   579,
      83,    85,     2,    93,     2,   735,     2,   773,     2,   777,
     413,    97,     2,   340,   711,     2,    30,   104,    78,    28,
      59,    89,     2,     2,    30,   164,   800,     3,    59,   170,
      79,     3,    59,    59,    59,   175,    59,    79,   178,   180,
       2,   341,   771,   341,     2,    83,   775,    59,    62,   267,
     268,   738,   219,  -352,   203,   790,   625,   288,  -352,   185,
     299,   246,   529,   674,    83,     3,   549,   285,   736,   217,
      99,   774,   487,   778,   488,   719,   237,   692,   626,   237,
      81,    82,   283,     2,    80,   319,     2,   798,    92,   755,
     801,    83,   461,   462,   463,    41,    81,    82,   169,   304,
     246,   818,   249,   256,    56,   772,   169,    57,   695,   776,
      98,   256,    58,    84,   691,   458,   456,    59,    40,   544,
     342,    72,   317,   181,    83,   509,   204,    59,   460,    56,
       2,    69,    72,   170,   170,    94,    59,   256,    83,   341,
      83,   372,   307,   372,   627,   594,   593,   595,   442,   478,
     799,   716,    41,   336,    85,   348,   237,   506,   650,   730,
      41,   442,   311,    83,   599,   361,    59,   203,     2,   572,
     643,   670,   491,   256,    56,    59,   588,   399,    70,   203,
     203,   173,   217,   491,   592,    89,   271,   286,    40,   385,
     622,   623,    81,    82,   217,   217,   383,    83,   237,   405,
     237,   405,   225,   373,    96,   174,   286,   307,   341,   389,
     305,   238,   256,   246,   240,   374,   341,   454,    89,   154,
      89,   459,   318,   602,   683,   168,   585,   430,   220,   314,
     319,   156,   264,    28,   585,   185,   185,   227,    30,   204,
     617,   228,   618,   529,   529,   156,   254,   265,   266,     2,
     112,   204,   204,    41,   624,   442,   299,   484,   156,   170,
     255,     2,   596,   278,   570,   214,    40,    83,   489,   492,
     490,   657,   226,   597,    81,    82,   299,    84,   279,   180,
     495,   352,   353,   354,   356,   185,   480,   439,   439,   344,
     300,   349,   499,   280,   433,   281,   185,   503,   573,   185,
     255,   384,   508,   547,    85,   696,   697,   348,    83,   237,
      84,   526,    84,   355,   350,   548,   468,   469,    59,   470,
      28,    83,    59,    41,    89,    30,   482,   249,    59,    89,
      59,   185,    28,   686,   685,    59,     2,    30,   156,   203,
     255,   203,   428,     2,   284,    83,   335,   237,   295,   181,
     806,   298,   616,   566,   217,    56,   217,   569,    72,    40,
     181,   303,   529,   181,   807,   214,   582,   561,   316,   698,
      72,   255,   699,   700,   582,   359,   214,   369,   214,   372,
     372,   605,   744,   745,   507,   428,   376,   343,   428,   641,
     214,   214,   335,   606,   335,   493,    80,   644,     2,   350,
     713,    41,   601,   717,   285,   204,   496,    28,   269,   270,
     728,   204,    30,   204,    28,   718,    84,   185,   319,    30,
      56,    84,   311,   306,   272,   273,   158,   442,    58,   739,
     185,   159,   377,   343,   564,   343,   701,   319,   761,   257,
     258,   259,    56,   758,   296,    72,   746,   203,   766,   203,
     297,   378,    57,    73,   276,   277,   319,    58,   161,   559,
     620,   180,   217,   162,   217,   427,   613,   628,   665,   439,
      59,   428,   614,   434,   614,   435,   672,   748,   526,   761,
     637,   185,   439,   428,   642,   498,    83,   615,   428,   646,
     335,   649,   526,   526,    41,    96,   749,   751,   705,   706,
     708,   479,   428,   428,    81,    82,    59,    59,  -398,   311,
     481,    59,   185,   185,  -398,   214,    37,   666,   428,   204,
     803,   204,   274,   275,   185,   761,   428,   604,   464,   465,
     500,   343,   805,   369,   257,   258,   259,    40,   428,   376,
     180,   553,    28,   483,   260,   181,   555,    30,   261,   262,
     214,   306,   214,   501,   466,   467,    58,    37,   558,   335,
     185,    83,   357,   512,   222,   471,   472,   335,   565,   301,
     302,   577,   399,    37,   130,   578,   439,   203,   203,   580,
      83,    37,   590,   239,   611,   180,   241,   612,     2,   629,
     631,   526,   217,   217,   177,   179,   632,     2,   633,   634,
     343,   636,   638,   526,   639,   185,    83,   654,   343,   655,
     179,   526,   667,   214,   668,   669,   676,   677,   784,    59,
     678,   787,    59,   682,   181,   291,   681,   690,   294,   709,
     702,   185,    37,   703,   712,    37,   180,   439,   179,   260,
     714,   720,   162,   261,   262,   726,   725,   727,   729,   204,
     204,   732,   733,   752,   767,   768,   185,   600,   214,    28,
     214,   789,   788,   526,    30,   802,   815,   526,    28,   181,
     526,   792,    41,    30,    37,   290,   793,    59,   293,   649,
     808,   156,    59,    59,   415,   416,   417,   418,   419,   420,
     421,   422,   423,   424,    56,   809,   185,    57,    37,   810,
     811,   819,    58,    56,   693,   694,    72,   542,   526,   526,
      37,   526,    37,   820,   526,    95,   230,   553,   568,   232,
     181,    37,   555,   179,   473,    80,   474,     2,   475,   414,
     476,   759,   477,   550,     2,   179,   179,    60,   554,   257,
     258,   259,   497,   660,    37,   179,   526,   603,   439,   651,
     608,   486,   684,     0,    37,     0,    37,   609,   610,   393,
     394,   395,   526,    37,   485,   526,     0,    74,    74,     0,
       0,   179,   179,     0,     0,     0,     0,    87,   740,   741,
       0,   742,   743,     0,     0,     0,     0,     0,   214,   214,
       0,     0,     0,    87,     0,     0,   425,     0,  -352,   160,
     635,     0,     0,  -352,   167,    28,     0,     0,    74,    74,
      30,   160,   167,   160,     0,   653,    68,   769,     0,   770,
       0,   179,    37,     0,     0,   543,   779,   780,     0,   160,
     206,     0,   179,    81,    82,   179,  -352,  -352,     0,     0,
      56,  -352,   160,    72,   260,     0,    76,    76,   261,   262,
       0,     0,     0,   794,     0,   795,    68,   796,     0,   797,
      37,    19,    20,   179,   396,    37,   574,   179,   397,   398,
       0,   102,    68,     0,     0,   157,     0,     0,   589,     0,
     812,     0,   813,     0,     0,     0,     0,    76,    76,   176,
       0,    28,    29,   167,     0,   179,    30,   179,     0,     0,
       0,     0,   157,    37,     0,     0,     0,     0,     0,     0,
       0,   160,   167,   704,     0,    37,   224,     0,   309,     0,
       0,     0,     0,     0,     0,   715,    56,     0,     0,     0,
     206,    74,     0,   653,     0,     0,     0,     0,     0,     0,
       0,   362,     0,   206,     0,     0,     0,     0,     0,     0,
       0,   375,     0,   179,     0,   206,   206,     0,    37,     0,
       0,     0,   235,   236,     0,     0,   179,     0,     0,     0,
     243,     0,     0,     0,   401,     0,   401,     0,     0,   630,
       0,     0,     0,   309,     0,   747,     0,     0,     0,   750,
       0,     0,   753,     0,     0,     0,     0,   315,     0,     0,
       0,     0,     0,   179,     0,   179,     0,     0,     0,     0,
      76,     0,     0,     0,     0,   663,   619,   179,     0,     0,
     368,   370,     0,     0,     0,     0,     0,     0,     0,     0,
     781,   782,     0,   783,     0,     0,   785,     0,     0,     0,
       0,     0,   309,   243,   673,    37,     0,   675,   179,   179,
       0,     0,     0,   404,     0,   404,   679,   680,     0,     0,
     179,     0,   315,     0,     0,     0,     0,     0,   804,     0,
       0,     0,     0,   309,     0,     0,     0,   386,     0,     0,
     206,     0,   243,   510,   814,     0,   110,   816,     2,   111,
     112,     0,     0,    37,    74,     0,   179,     0,     0,     0,
       0,     0,     0,     0,   551,     0,     0,     0,   243,     0,
     243,     0,     0,     3,     0,   206,     0,   206,     0,     0,
       0,   315,     0,   309,   494,     0,     0,     0,     0,     0,
       0,   243,     0,   179,   179,   401,     0,     0,     0,     0,
       0,   179,   401,   731,     0,     0,     0,   734,     0,     0,
     401,     0,   315,     0,     0,     0,   116,   117,     0,     0,
       0,   102,    76,     0,     0,     0,     0,   179,     0,     0,
       0,     0,     0,    76,     0,     0,     0,   546,   362,     0,
     756,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       0,   765,   179,     0,     0,   243,     0,   234,     0,   243,
     124,     0,   315,     0,     0,     0,     0,     0,     0,     0,
       0,    88,     0,     0,   404,     0,   576,     0,     0,     0,
       0,   404,     0,   206,     0,   206,   100,     0,     0,   404,
       0,     0,   179,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   243,     0,   243,     0,     0,   184,
       0,     0,     0,     0,     0,     0,     0,   368,     0,     0,
       0,     0,     0,     0,     0,   510,     0,     0,     0,     0,
       0,   223,     0,     0,   243,     0,   243,     0,     0,     0,
       0,     0,     0,   659,     0,     0,     0,     0,     0,     0,
       0,     0,   248,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,   176,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     3,     0,     0,     0,
       0,     0,   310,   206,   206,     0,     0,     0,     0,     0,
       0,     0,   662,   339,    90,     0,   243,     0,     0,     0,
       0,   243,     0,     0,     0,    88,     0,     0,     0,     0,
     243,   243,     0,     0,     0,   160,     0,     0,     0,   116,
     117,   118,     0,     0,     0,     0,     0,     0,   723,   388,
       0,     0,   186,     0,     0,     0,     0,     0,    88,   408,
      88,   408,     0,     0,     0,     0,     0,   429,     0,     0,
     119,   120,     0,     0,     0,   184,   184,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,   250,     0,     0,     0,    86,
     760,   817,     0,    74,     0,     0,     0,     0,     0,     0,
       0,     0,   243,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   722,   184,     0,     0,     0,   243,
     243,   243,   243,     0,   243,     0,   184,   183,     0,   184,
       0,   243,     0,     0,     0,     0,     0,     0,     0,   243,
       0,     0,     0,     0,     0,   312,     0,   505,     0,     0,
       0,     0,     0,     0,    88,     0,   100,   248,     0,    88,
       0,   184,     0,     0,     0,     0,     0,     0,    90,     0,
       0,     0,    76,     0,    91,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   243,   390,     0,     0,   243,     0,   560,   243,   243,
       0,    90,   410,    90,   410,     0,     0,   243,     0,     0,
     431,     0,   192,     0,     0,     0,   584,     0,   186,   186,
       0,     0,     0,     0,   584,     0,     0,     0,     0,     0,
     308,     0,     0,     0,     0,     0,   243,   243,     0,   243,
     243,   338,   243,   243,     0,     0,     0,   184,   243,     0,
       0,     0,   310,    86,     0,   251,     0,     0,     0,   150,
     184,     0,     0,     0,     0,     0,     0,     0,   186,     0,
       0,     0,     0,     0,   243,     0,     0,     0,     0,   186,
       0,     0,   186,     0,     0,     0,    86,   407,    86,   407,
     243,     0,     0,   243,   243,     0,     0,     0,     0,   150,
       0,     0,     0,   183,   183,     0,     0,    90,     0,     0,
     250,   184,    90,     0,   186,   313,     0,     0,   150,     0,
       0,   150,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    91,   310,
       0,     0,   184,   184,     0,     0,     0,     0,     0,     0,
     562,     0,     0,   183,   184,     0,     0,     0,     0,     0,
     150,     0,   391,   150,   183,     0,     0,   183,     0,   586,
       0,    91,   411,    91,   411,     0,     0,   586,     0,     0,
     432,     0,     0,     0,     0,   504,     0,     0,   192,   192,
     184,     0,    86,     0,     0,     0,     0,    86,     0,   183,
     186,     0,     0,     0,     0,   312,     0,   155,     0,     0,
       0,     0,     0,   186,     0,     0,     0,     0,     0,     0,
       0,   155,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   155,   184,     0,     0,   192,     0,
       0,   212,     0,     0,     0,     0,     0,     0,     0,   192,
       0,     0,   192,     0,   583,     0,   441,   441,     0,     0,
       0,   184,   583,     0,   186,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    91,     0,     0,
     251,     0,    91,     0,   192,   183,   184,     0,     0,     0,
     308,     0,   312,     0,     0,   186,   186,     0,   183,   150,
       0,     0,     0,     0,     0,     0,     0,   186,     0,     0,
       0,     0,     0,     0,   155,     0,     0,     0,     0,     0,
     563,     0,     0,     0,     0,     0,   184,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   587,
       0,   212,     0,   186,     0,     0,     0,   587,     0,   183,
       0,     0,   365,   212,   212,     0,     0,     0,   441,     0,
     150,     0,   212,     0,     0,     0,   212,   212,     0,     0,
     192,     0,     0,     0,     0,   313,     0,   308,     0,     0,
     183,   183,   110,   192,     2,   111,   112,   113,   186,   114,
     115,     0,   183,     0,     0,     0,     0,     0,     0,     0,
       0,   150,     0,     0,     0,     0,     0,     0,     0,     3,
       0,     0,     0,   150,   186,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   183,     0,
       0,     0,     0,     0,   192,     0,     0,     0,   441,   186,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,   441,   116,   117,   118,    28,     0,     0,     0,     0,
      30,     0,   313,     0,     0,   192,   192,     3,     0,     0,
       0,     0,     0,   183,     0,     0,     0,   192,     0,   186,
       0,     0,     0,   119,   120,     0,     0,     0,     0,     0,
     346,   212,     0,   347,   242,   123,   124,     0,     0,   183,
       0,   126,   127,   128,   129,     0,     0,     0,     0,   545,
     116,   117,   118,   192,   150,   552,     0,   212,     0,     0,
       0,     0,   212,     0,   183,     0,   212,     0,   212,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   119,   120,     0,     0,   441,     0,     0,   121,     0,
     150,   122,   455,   123,   124,     0,     0,     0,   192,   126,
     127,   128,   129,     0,   183,     0,     0,     0,     0,     0,
       0,   437,     0,     0,     0,     0,     0,     0,     0,   150,
       0,     0,   150,     0,   192,     0,     0,     0,     0,   365,
       0,   150,   150,     0,     0,     0,     0,     0,     0,     0,
       0,   441,     0,     0,     0,     0,   441,     0,     0,   192,
       0,     0,     0,     0,     0,     0,     0,   687,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   212,     0,   212,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   192,
       0,     0,     0,     0,     0,     0,     0,   155,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   150,     0,
       0,     0,   150,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   658,   661,     0,     0,     0,   664,     0,
       0,     0,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,   150,     0,   441,     0,     0,
       0,     0,     0,     0,     0,     0,   150,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,   513,   514,   515,   516,   517,   518,   519,
     520,   521,   522,   523,   212,   212,     0,    27,     0,     0,
       0,     0,   116,   117,   118,    28,    29,     0,   524,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   119,   120,     0,   721,     0,     0,   724,
     121,     0,     0,   122,     0,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,   525,   350,  -426,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   763,
     764,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,   513,   514,   515,   516,   517,
     518,   519,   520,   521,   522,   523,     0,     0,     0,    27,
       0,     0,     0,     0,   116,   117,   118,    28,    29,     0,
     524,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   525,   350,  -425,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,   513,   514,
     515,   516,   517,   518,   519,   520,   521,   522,   523,     0,
       0,     0,    27,     0,     0,     0,     0,   116,   117,   118,
      28,    29,     0,   524,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   122,     0,
     123,   124,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   525,   350,  -427,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     116,   117,   118,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,     0,   123,   124,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     436,   437,   438,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   116,   117,   118,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     0,   122,     0,   123,   124,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   436,   437,   452,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,   116,   117,   118,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   436,   437,   598,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     0,     0,     0,   607,
     437,  -478,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   116,   117,   118,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,   436,   437,   656,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,   116,   117,   118,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,   121,     0,     0,   122,     0,   123,   124,
       0,     0,     0,     0,   126,   127,   128,   129,   110,     0,
       2,   111,   112,     0,     0,   436,   437,   757,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   193,     0,     0,   116,   117,
       0,    28,    29,     0,     0,   194,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,    56,     0,     0,   195,
       0,   196,   124,   110,     0,     2,   111,   112,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   197,     0,
     198,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     193,     0,     0,   116,   117,     0,    28,    29,     0,     0,
     194,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,    56,     0,     0,   195,     0,   196,   124,   110,     0,
       2,   111,   112,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   197,     0,   371,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   193,     0,     0,   116,   117,
       0,    28,    29,     0,     0,   194,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,    56,     0,     0,   195,
       0,   196,   124,   110,     0,     2,   111,   112,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   197,     0,
     380,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     193,     0,     0,   116,   117,     0,    28,    29,     0,     0,
     194,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,    56,     0,     0,   195,     0,   196,   124,   110,     0,
       2,   111,   112,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   197,     0,   556,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   193,     0,     0,   116,   117,
       0,    28,    29,     0,     0,   194,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,    56,     0,     0,   195,
       0,   196,   124,   110,     0,     2,   111,   112,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   197,     0,
     557,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     193,     0,     0,   116,   117,     0,    28,    29,     0,     0,
     194,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,    56,     0,     0,   195,     0,   196,   124,   110,     0,
       2,   111,   112,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   197,     0,   688,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   193,     0,     0,   116,   117,
       0,    28,    29,     0,     0,   194,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   119,
     120,     0,     0,     0,     0,     0,    56,     0,     0,   195,
       0,   196,   124,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,     0,     0,   197,     0,
     689,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,   513,   514,   515,   516,   517,   518,
     519,   520,   521,   522,   523,     0,     0,     0,    27,     0,
       0,     0,     0,   116,   117,   118,    28,    29,     0,   524,
       0,    30,     0,     0,     0,     0,   110,    33,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   119,   120,     0,     0,     0,     0,
       0,   121,     0,     3,   122,     0,   123,   124,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   525,   350,     0,     0,   513,   514,   515,
     516,   517,   518,   519,   520,   521,   522,   523,     0,     0,
       0,     0,     0,     0,     0,     0,   116,   117,   118,   110,
       0,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,     0,     3,   119,   120,     0,
       0,     0,     0,     0,   121,     0,     0,   122,     0,   123,
     124,     3,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   525,   350,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   116,
     117,   118,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,   116,   117,   118,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,   567,   123,   124,     0,   119,   120,     0,   126,   127,
     128,   129,   121,     0,     0,   122,     0,   123,   124,     0,
     437,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,   116,   117,   118,   437,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   119,   120,     0,     0,     0,     0,     0,
     121,     0,     0,   122,     0,   123,   124,     0,     0,     0,
       0,   126,   127,   128,   129,   110,     0,     2,   111,   112,
       0,     0,     0,   760,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,     0,     0,
      27,     0,   193,     0,     0,   116,   117,     0,    28,    29,
       0,     0,   194,    30,     3,     0,     0,     0,     0,    33,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,    34,     0,   119,   120,     0,     0,
       0,     0,     0,    56,     0,     0,   195,     3,   196,   124,
       0,     0,     0,     0,     0,     0,     0,   116,   117,   118,
       0,     0,     0,     0,     0,   197,   110,     0,     2,   111,
     112,   113,     0,   114,   115,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   119,   120,
     116,   117,   118,     3,     0,   121,     0,     0,   122,   710,
     123,   124,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   525,     0,     0,
       0,   119,   120,     0,     0,     0,     0,     0,   121,     0,
       0,   122,   754,   123,   124,     0,   116,   117,   118,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     525,   110,     0,     2,   111,   112,   113,     0,   114,   115,
       0,     0,     0,     0,     0,     0,     0,   119,   120,     0,
       0,     0,     2,     0,   121,     0,     0,   122,     3,   123,
     124,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   640,     3,     4,     5,
       6,     7,     8,   320,   321,   322,   323,   324,   325,   326,
     327,   328,   329,    19,    20,   330,   331,    23,    24,   332,
       0,   116,   117,   118,   110,     0,     2,   111,   112,   113,
       0,   114,   115,     0,     0,   333,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     3,   119,   120,     0,     0,     0,     0,     0,   121,
       0,     0,   122,     0,   123,   124,     0,     0,   125,   334,
     126,   127,   128,   129,     0,     0,     0,     2,    56,     0,
       0,   306,     0,     0,     0,     0,    58,     0,     0,     0,
       0,     0,     0,     0,   116,   117,   118,     0,     0,     0,
       0,   502,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,   119,   120,     0,     0,     0,
       0,     0,   121,     0,     0,   122,     0,   123,   124,     0,
      27,   289,     0,   126,   127,   128,   129,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     2,     0,    56,     0,     0,   358,     3,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   359,     0,   360,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
     116,   117,   118,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,   119,   120,    33,     0,     0,     0,     0,   121,     0,
       0,   122,     0,   123,   124,     0,     0,   292,    34,   126,
     127,   128,   129,     0,     0,     0,     0,    56,     0,   110,
      72,     2,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   645,
       0,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,     0,   123,   124,     0,     0,     3,     0,   126,   127,
     128,   129,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     122,   242,   123,   124,     0,     0,     3,     0,   126,   127,
     128,   129,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,    33,     0,     0,     0,     0,     0,   110,
       0,     2,   111,   112,   113,     0,   114,   115,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   121,     0,     0,
     234,   242,   123,   124,     0,     0,     3,     0,   126,   127,
     128,   129,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,   110,     0,     2,   111,   112,   113,     0,   114,
     115,     0,     0,     0,    27,     0,     0,     0,     0,   116,
     117,   118,    28,    29,     0,     0,     0,    30,     0,     3,
       0,     0,     0,    33,     0,     0,     0,   110,     0,     2,
     111,   112,   113,     0,   114,   115,     0,     0,    34,     0,
     119,   120,     0,     0,     0,     0,     0,   346,     0,     0,
     347,   242,   123,   124,     3,     0,     0,     0,   126,   127,
     128,   129,   116,   117,   118,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     110,     0,     2,   111,   112,   113,     0,   114,   115,     0,
       0,     0,     0,   119,   120,     0,     0,   116,   117,   118,
     121,     0,     0,   122,   242,   123,   124,     3,     0,     0,
       0,   126,   127,   128,   129,   110,     0,     2,   111,   112,
     113,     0,   114,   115,     0,     0,     0,     0,   119,   120,
       0,     0,     0,     0,     0,   121,     0,     0,   122,   707,
     123,   124,     3,     0,     0,     0,   126,   127,   128,   129,
     116,   117,   118,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   110,     0,
       2,   111,   112,   113,     0,   114,   115,     0,     0,     0,
       0,   119,   120,     0,     0,   116,   117,   118,   121,     0,
       0,   122,   786,   123,   124,     3,     0,     0,     0,   126,
     127,   128,   129,   110,     0,     2,   111,   112,   113,     0,
     114,   115,     0,     0,     0,     0,   119,   120,     0,     1,
       0,     2,     0,   121,     0,     0,   122,     0,   123,   124,
       3,     0,     0,     0,   126,   127,   128,   129,   116,   117,
     118,     0,     0,     0,     0,     0,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,   119,
     120,     0,     0,   116,   117,   118,   121,     0,     0,   229,
       0,   123,   124,    26,    27,     0,     0,   126,   127,   128,
     129,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,   119,   120,     0,     0,     0,     0,
       1,   121,     2,     0,   234,     0,   123,   124,    34,     0,
       0,     0,   126,   127,   128,   129,     0,    56,     0,     0,
      57,   103,     0,     0,     0,    58,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   306,   103,     0,     0,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,    57,     0,     0,     0,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   306,     0,     0,     0,     0,    58,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   399,     0,     0,     0,     0,   400,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   399,     0,     0,     0,     0,   412,     3,     4,     5,
       6,     7,     8,   320,   321,   322,   323,   324,   325,   326,
     327,   328,   329,    19,    20,   330,   331,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   333,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,   334,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   399,     0,     0,     0,     0,   581,     3,     4,     5,
       6,     7,     8,   320,   321,   322,   323,   324,   325,   326,
     327,   328,   329,    19,    20,   330,   331,    23,    24,    25,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   333,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     3,     0,     0,    30,     0,
       0,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,   334,
       0,     0,     0,     0,     0,     0,     0,     0,    56,     0,
       0,   399,     0,    27,     0,     0,   591,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     1,     0,
       2,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   306,
       0,     0,     0,     0,    58,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     1,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,    56,     0,     0,   399,
     571,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,    31,    32,     0,    33,     0,
       1,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   163,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     1,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   287,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   671,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     0,    72,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     1,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   511,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,   382,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     1,     0,     2,
      30,     0,     0,    31,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     2,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     2,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       3,     4,     5,     6,     7,     8,   320,   321,   322,   323,
     324,   325,   326,   327,   328,   329,    19,    20,   330,   331,
      23,    24,   332,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   333,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     2,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   334,     3,     4,     5,     6,     7,     8,   320,
     321,   322,   323,   324,   325,   326,   327,   328,   329,    19,
      20,   330,   331,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   333,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   334
};

static const yytype_int16 yycheck[] =
{
       0,     1,   124,     1,    65,   137,   255,   256,     0,   207,
      60,    17,   219,   220,     3,   194,   193,   351,    68,   260,
     260,   357,     3,   256,   501,    25,   205,    69,   122,     3,
       3,    31,    32,    31,    32,   193,   401,    87,     3,   404,
      40,    41,     3,    41,     3,    70,     3,    69,     3,    69,
     240,    51,     3,   193,   636,     3,    79,    57,   112,    74,
      60,    41,     3,     3,    79,    65,    69,    28,    68,    69,
     110,    28,    72,    73,    74,    73,    76,   110,    78,    79,
       3,   239,    70,   241,     3,    85,    70,    87,     1,   121,
     122,   133,   132,    74,    94,   760,   110,   158,    79,    79,
     119,   195,   351,   580,   104,    28,   129,   157,   133,    94,
       0,   133,   131,   133,   133,   130,   116,   111,   132,   119,
     109,   110,   128,     3,     1,   119,     3,    70,    41,   711,
     133,   131,   264,   265,   266,     0,   109,   110,    68,   113,
     234,   806,   122,   132,   109,   133,    76,   112,   625,   133,
     129,   132,   117,    41,   113,   396,   396,   157,   158,   132,
     337,   112,    11,    79,   164,   344,    94,   167,   262,   109,
       3,   132,   112,   173,   174,   132,   176,   132,   178,   337,
     180,   379,   182,   381,   132,   426,   426,   428,   437,   283,
     133,   132,    57,   193,   194,   195,   196,   337,   532,   676,
      65,   450,   182,   203,   437,   205,   206,   207,     3,   399,
     129,   576,   305,   132,   109,   215,   406,   112,    25,   219,
     220,   132,   207,   316,   414,   205,   142,   157,   228,   229,
      69,    70,   109,   110,   219,   220,   228,   237,   238,   239,
     240,   241,   113,   119,    51,   132,   176,   247,   406,   229,
     130,   116,   132,   347,   119,   131,   414,   257,   238,   309,
     240,   261,   111,   442,   600,   315,   406,   247,   132,   182,
     119,    60,   109,    74,   414,   255,   256,   113,    79,   207,
     487,   119,   489,   532,   533,    74,   118,   124,   125,     3,
       5,   219,   220,   158,   133,   544,   119,   297,    87,   299,
     132,     3,   434,   120,   398,    94,   306,   307,   131,   305,
     133,   544,   113,   435,   109,   110,   119,   205,   126,   319,
     316,   199,   200,   201,   202,   305,   118,   255,   256,   194,
     133,   196,   332,   127,   247,    16,   316,   337,   399,   319,
     132,   229,   342,   119,   344,    69,    70,   347,   348,   349,
     238,   351,   240,   131,   132,   131,   272,   273,   358,   275,
      74,   361,   362,   228,   344,    79,   118,   347,   368,   349,
     370,   351,    74,   614,   614,   375,     3,    79,   167,   379,
     132,   381,   119,     3,   118,   385,   193,   387,   113,   305,
     119,   130,   129,   393,   379,   109,   381,   397,   112,   399,
     316,   113,   651,   319,   133,   194,   406,   387,   130,   133,
     112,   132,    69,    70,   414,   129,   205,   206,   207,   617,
     618,   119,    69,    70,   337,   119,   215,   193,   119,   523,
     219,   220,   239,   131,   241,   305,     1,   131,     3,   132,
     131,   306,   442,   119,   494,   373,   316,    74,    10,    11,
     111,   379,    79,   381,    74,   131,   344,   437,   119,    79,
     109,   349,   442,   112,    12,    13,   112,   716,   117,   111,
     450,   117,   131,   239,   387,   241,   133,   119,   719,     7,
       8,     9,   109,   716,   113,   112,   133,   487,   111,   489,
     119,   131,   112,   120,    14,    15,   119,   117,   112,   387,
     500,   501,   487,   117,   489,   113,   113,   507,   113,   437,
     510,   119,   119,   113,   119,   116,   577,   113,   518,   760,
     520,   501,   450,   119,   524,   332,   526,   118,   119,   529,
     337,   529,   532,   533,   399,   342,   113,   113,   632,   633,
     634,   113,   119,   119,   109,   110,   546,   547,   113,   529,
     118,   551,   532,   533,   119,   344,     0,   118,   119,   487,
     113,   489,   110,   111,   544,   806,   119,   445,   267,   268,
     112,   337,   113,   362,     7,     8,     9,   577,   119,   368,
     580,   370,    74,   118,   112,   501,   375,    79,   116,   117,
     379,   112,   381,   110,   269,   270,   117,    41,   113,   406,
     580,   601,   130,   133,    98,   276,   277,   414,   113,   173,
     174,   112,   112,    57,    58,   117,   544,   617,   618,   110,
     620,    65,   117,   117,   133,   625,   120,   133,     3,   113,
     129,   631,   617,   618,    78,    79,   112,     3,   112,   112,
     406,   112,   131,   643,   131,   625,   646,   133,   414,   131,
      94,   651,   113,   442,   113,   118,   110,   117,   752,   659,
     118,   755,   662,   133,   580,   159,   117,   113,   162,    56,
     132,   651,   116,   129,   131,   119,   676,   605,   122,   112,
     130,   133,   117,   116,   117,   113,   129,   118,   118,   617,
     618,   118,   118,   112,   118,   118,   676,   130,   487,    74,
     489,   133,   131,   703,    79,    64,   131,   707,    74,   625,
     710,   133,   577,    79,   158,   159,   133,   717,   162,   717,
     133,   510,   722,   723,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   109,   133,   716,   112,   182,   133,
     133,   133,   117,   109,   622,   623,   112,   113,   748,   749,
     194,   751,   196,   133,   754,    51,   113,   546,   396,   113,
     676,   205,   551,   207,   278,     1,   279,     3,   280,   241,
     281,   717,   282,   367,     3,   219,   220,     1,   373,     7,
       8,     9,   319,   547,   228,   229,   786,   442,   716,   532,
     450,   299,   605,    -1,   238,    -1,   240,   450,   450,     7,
       8,     9,   802,   247,   298,   805,    -1,    31,    32,    -1,
      -1,   255,   256,    -1,    -1,    -1,    -1,    41,   696,   697,
      -1,   699,   700,    -1,    -1,    -1,    -1,    -1,   617,   618,
      -1,    -1,    -1,    57,    -1,    -1,   130,    -1,    74,    63,
     518,    -1,    -1,    79,    68,    74,    -1,    -1,    72,    73,
      79,    75,    76,    77,    -1,   533,     1,   735,    -1,   737,
      -1,   305,   306,    -1,    -1,   359,   744,   745,    -1,    93,
      94,    -1,   316,   109,   110,   319,   112,   113,    -1,    -1,
     109,   117,   106,   112,   112,    -1,    31,    32,   116,   117,
      -1,    -1,    -1,   771,    -1,   773,    41,   775,    -1,   777,
     344,    44,    45,   347,   112,   349,   400,   351,   116,   117,
      -1,    56,    57,    -1,    -1,    60,    -1,    -1,   412,    -1,
     798,    -1,   800,    -1,    -1,    -1,    -1,    72,    73,    74,
      -1,    74,    75,   157,    -1,   379,    79,   381,    -1,    -1,
      -1,    -1,    87,   387,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   175,   176,   631,    -1,   399,   101,    -1,   182,    -1,
      -1,    -1,    -1,    -1,    -1,   643,   109,    -1,    -1,    -1,
     194,   195,    -1,   651,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   205,    -1,   207,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   215,    -1,   437,    -1,   219,   220,    -1,   442,    -1,
      -1,    -1,   114,   115,    -1,    -1,   450,    -1,    -1,    -1,
     122,    -1,    -1,    -1,   238,    -1,   240,    -1,    -1,   513,
      -1,    -1,    -1,   247,    -1,   703,    -1,    -1,    -1,   707,
      -1,    -1,   710,    -1,    -1,    -1,    -1,   182,    -1,    -1,
      -1,    -1,    -1,   487,    -1,   489,    -1,    -1,    -1,    -1,
     195,    -1,    -1,    -1,    -1,   549,   500,   501,    -1,    -1,
     205,   206,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     748,   749,    -1,   751,    -1,    -1,   754,    -1,    -1,    -1,
      -1,    -1,   306,   195,   578,   529,    -1,   581,   532,   533,
      -1,    -1,    -1,   238,    -1,   240,   590,   591,    -1,    -1,
     544,    -1,   247,    -1,    -1,    -1,    -1,    -1,   786,    -1,
      -1,    -1,    -1,   337,    -1,    -1,    -1,   229,    -1,    -1,
     344,    -1,   234,   347,   802,    -1,     1,   805,     3,     4,
       5,    -1,    -1,   577,   358,    -1,   580,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   368,    -1,    -1,    -1,   260,    -1,
     262,    -1,    -1,    28,    -1,   379,    -1,   381,    -1,    -1,
      -1,   306,    -1,   387,   309,    -1,    -1,    -1,    -1,    -1,
      -1,   283,    -1,   617,   618,   399,    -1,    -1,    -1,    -1,
      -1,   625,   406,   677,    -1,    -1,    -1,   681,    -1,    -1,
     414,    -1,   337,    -1,    -1,    -1,    71,    72,    -1,    -1,
      -1,   346,   347,    -1,    -1,    -1,    -1,   651,    -1,    -1,
      -1,    -1,    -1,   358,    -1,    -1,    -1,   362,   442,    -1,
     714,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,   725,   676,    -1,    -1,   347,    -1,   112,    -1,   351,
     115,    -1,   387,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    41,    -1,    -1,   399,    -1,   401,    -1,    -1,    -1,
      -1,   406,    -1,   487,    -1,   489,    56,    -1,    -1,   414,
      -1,    -1,   716,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   396,    -1,   398,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   442,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   529,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,   426,    -1,   428,    -1,    -1,    -1,
      -1,    -1,    -1,   547,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   122,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,   510,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   529,    -1,    28,    -1,    -1,    -1,
      -1,    -1,   182,   617,   618,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   547,   193,    41,    -1,   518,    -1,    -1,    -1,
      -1,   523,    -1,    -1,    -1,   205,    -1,    -1,    -1,    -1,
     532,   533,    -1,    -1,    -1,   649,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,   662,   229,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,   238,   239,
     240,   241,    -1,    -1,    -1,    -1,    -1,   247,    -1,    -1,
     102,   103,    -1,    -1,    -1,   255,   256,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,   121,
     122,   123,    -1,    -1,    -1,   122,    -1,    -1,    -1,    41,
     132,   133,    -1,   717,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   614,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   659,   305,    -1,    -1,    -1,   631,
     632,   633,   634,    -1,   636,    -1,   316,    79,    -1,   319,
      -1,   643,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   651,
      -1,    -1,    -1,    -1,    -1,   182,    -1,   337,    -1,    -1,
      -1,    -1,    -1,    -1,   344,    -1,   346,   347,    -1,   349,
      -1,   351,    -1,    -1,    -1,    -1,    -1,    -1,   205,    -1,
      -1,    -1,   717,    -1,    41,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   703,   229,    -1,    -1,   707,    -1,   387,   710,   711,
      -1,   238,   239,   240,   241,    -1,    -1,   719,    -1,    -1,
     247,    -1,    79,    -1,    -1,    -1,   406,    -1,   255,   256,
      -1,    -1,    -1,    -1,   414,    -1,    -1,    -1,    -1,    -1,
     182,    -1,    -1,    -1,    -1,    -1,   748,   749,    -1,   751,
     752,   193,   754,   755,    -1,    -1,    -1,   437,   760,    -1,
      -1,    -1,   442,   205,    -1,   122,    -1,    -1,    -1,    58,
     450,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   305,    -1,
      -1,    -1,    -1,    -1,   786,    -1,    -1,    -1,    -1,   316,
      -1,    -1,   319,    -1,    -1,    -1,   238,   239,   240,   241,
     802,    -1,    -1,   805,   806,    -1,    -1,    -1,    -1,    98,
      -1,    -1,    -1,   255,   256,    -1,    -1,   344,    -1,    -1,
     347,   501,   349,    -1,   351,   182,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   205,   529,
      -1,    -1,   532,   533,    -1,    -1,    -1,    -1,    -1,    -1,
     387,    -1,    -1,   305,   544,    -1,    -1,    -1,    -1,    -1,
     159,    -1,   229,   162,   316,    -1,    -1,   319,    -1,   406,
      -1,   238,   239,   240,   241,    -1,    -1,   414,    -1,    -1,
     247,    -1,    -1,    -1,    -1,   337,    -1,    -1,   255,   256,
     580,    -1,   344,    -1,    -1,    -1,    -1,   349,    -1,   351,
     437,    -1,    -1,    -1,    -1,   442,    -1,    60,    -1,    -1,
      -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    87,   625,    -1,    -1,   305,    -1,
      -1,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   316,
      -1,    -1,   319,    -1,   406,    -1,   255,   256,    -1,    -1,
      -1,   651,   414,    -1,   501,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   344,    -1,    -1,
     347,    -1,   349,    -1,   351,   437,   676,    -1,    -1,    -1,
     442,    -1,   529,    -1,    -1,   532,   533,    -1,   450,   298,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   544,    -1,    -1,
      -1,    -1,    -1,    -1,   167,    -1,    -1,    -1,    -1,    -1,
     387,    -1,    -1,    -1,    -1,    -1,   716,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   406,
      -1,   194,    -1,   580,    -1,    -1,    -1,   414,    -1,   501,
      -1,    -1,   205,   206,   207,    -1,    -1,    -1,   357,    -1,
     359,    -1,   215,    -1,    -1,    -1,   219,   220,    -1,    -1,
     437,    -1,    -1,    -1,    -1,   442,    -1,   529,    -1,    -1,
     532,   533,     1,   450,     3,     4,     5,     6,   625,     8,
       9,    -1,   544,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   400,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,   412,   651,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   580,    -1,
      -1,    -1,    -1,    -1,   501,    -1,    -1,    -1,   437,   676,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,   450,    71,    72,    73,    74,    -1,    -1,    -1,    -1,
      79,    -1,   529,    -1,    -1,   532,   533,    28,    -1,    -1,
      -1,    -1,    -1,   625,    -1,    -1,    -1,   544,    -1,   716,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   344,    -1,   112,   113,   114,   115,    -1,    -1,   651,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,   362,
      71,    72,    73,   580,   513,   368,    -1,   370,    -1,    -1,
      -1,    -1,   375,    -1,   676,    -1,   379,    -1,   381,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,   544,    -1,    -1,   109,    -1,
     549,   112,   113,   114,   115,    -1,    -1,    -1,   625,   120,
     121,   122,   123,    -1,   716,    -1,    -1,    -1,    -1,    -1,
      -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   578,
      -1,    -1,   581,    -1,   651,    -1,    -1,    -1,    -1,   442,
      -1,   590,   591,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   600,    -1,    -1,    -1,    -1,   605,    -1,    -1,   676,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   616,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   487,    -1,   489,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   716,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   510,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   677,    -1,
      -1,    -1,   681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   546,   547,    -1,    -1,    -1,   551,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,   714,    -1,   716,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   725,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,   617,   618,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    77,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,   659,    -1,    -1,   662,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   722,
     723,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      -1,    -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    77,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
     114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,   132,   133,
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
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,   132,   133,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,   132,   133,     1,    -1,     3,     4,
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
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
     115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,   132,   133,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    -1,    -1,   120,   121,
     122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
     132,   133,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   131,   132,   133,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
      -1,    -1,    -1,    -1,   120,   121,   122,   123,     1,    -1,
       3,     4,     5,    -1,    -1,   131,   132,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,   115,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    -1,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,   114,   115,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    -1,    -1,     1,    85,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    28,   112,    -1,   114,   115,    -1,    -1,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   131,   132,    -1,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
     115,    28,    -1,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    -1,   102,   103,    -1,   120,   121,
     122,   123,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
     132,    -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,   115,    -1,    -1,    -1,
      -1,   120,   121,   122,   123,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    28,    -1,    -1,    -1,    -1,    85,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    28,   114,   115,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,   131,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      71,    72,    73,    28,    -1,   109,    -1,    -1,   112,   113,
     114,   115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,   114,   115,    -1,    71,    72,    73,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,     3,    -1,   109,    -1,    -1,   112,    28,   114,
     115,    -1,    -1,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   131,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,   115,    -1,    -1,   118,   100,
     120,   121,   122,   123,    -1,    -1,    -1,     3,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,   132,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,   114,   115,    -1,
      66,   118,    -1,   120,   121,   122,   123,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,   109,    -1,    -1,   112,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   129,    -1,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,   102,   103,    85,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,   115,    -1,    -1,   118,   100,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,   109,    -1,     1,
     112,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,   115,    -1,    -1,    28,    -1,   120,   121,
     122,   123,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    28,    -1,   120,   121,
     122,   123,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    28,    -1,   120,   121,
     122,   123,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    28,
      -1,    -1,    -1,    85,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,   115,    28,    -1,    -1,    -1,   120,   121,
     122,   123,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    71,    72,    73,
     109,    -1,    -1,   112,   113,   114,   115,    28,    -1,    -1,
      -1,   120,   121,   122,   123,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
     114,   115,    28,    -1,    -1,    -1,   120,   121,   122,   123,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    71,    72,    73,   109,    -1,
      -1,   112,   113,   114,   115,    28,    -1,    -1,    -1,   120,
     121,   122,   123,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,   102,   103,    -1,     1,
      -1,     3,    -1,   109,    -1,    -1,   112,    -1,   114,   115,
      28,    -1,    -1,    -1,   120,   121,   122,   123,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,   102,
     103,    -1,    -1,    71,    72,    73,   109,    -1,    -1,   112,
      -1,   114,   115,    65,    66,    -1,    -1,   120,   121,   122,
     123,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,   102,   103,    -1,    -1,    -1,    -1,
       1,   109,     3,    -1,   112,    -1,   114,   115,   100,    -1,
      -1,    -1,   120,   121,   122,   123,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,    -1,    -1,   117,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    28,    -1,    -1,    79,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    66,    -1,    -1,   117,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,    -1,    -1,   117,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,     1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
       1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,     1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,     1,    -1,     3,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,     3,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,     3,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,     3,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    65,    66,    74,    75,
      79,    82,    83,    85,   100,   135,   136,   137,   138,   139,
     144,   176,   177,   182,   183,   184,   185,   186,   187,   189,
     190,   196,   204,   205,   223,   254,   109,   112,   117,   144,
     183,   208,   210,   212,   213,   215,   216,   217,   220,   132,
     139,   144,   112,   120,   183,   212,   220,   212,   112,   110,
       1,   109,   110,   144,   135,   144,   182,   183,   186,   187,
     189,   205,   210,   212,   132,   138,   139,   144,   129,     0,
     186,   219,   220,   113,   144,   210,   212,   221,   222,   223,
       1,     4,     5,     6,     8,     9,    71,    72,    73,   102,
     103,   109,   112,   114,   115,   118,   120,   121,   122,   123,
     137,   144,   145,   146,   147,   151,   152,   154,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   171,   241,   244,   208,   213,   216,   220,   112,   117,
     183,   112,   117,   113,   144,   221,   224,   183,   208,   217,
     144,   206,   207,   132,   132,   212,   220,   137,   144,   137,
     144,   158,   175,   182,   186,   187,   189,   191,   192,   193,
     194,   195,   205,    68,    78,   112,   114,   131,   133,   140,
     141,   142,   143,   144,   147,   176,   183,   197,   198,   199,
     200,   201,   213,   214,   216,   220,   243,   244,   246,   132,
     132,   137,   171,   186,   220,   113,   113,   113,   119,   112,
     146,   149,   151,   153,   112,   152,   152,   144,   176,   171,
     176,   171,   113,   152,   167,   168,   170,   173,   186,   187,
     189,   205,   225,   241,   118,   132,   132,     7,     8,     9,
     112,   116,   117,   155,   109,   124,   125,   121,   122,    10,
      11,   158,    12,    13,   110,   111,    14,    15,   120,   126,
     127,    16,    17,   128,   118,   208,   217,   113,   221,   118,
     137,   171,   118,   137,   171,   113,   113,   119,   130,   119,
     133,   206,   206,   113,   113,   130,   112,   144,   182,   183,
     186,   187,   189,   205,   210,   220,   130,    11,   111,   119,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      46,    47,    50,    66,   100,   139,   144,   178,   182,   186,
     188,   190,   196,   204,   176,   214,   109,   112,   144,   176,
     132,   235,   236,   236,   236,   131,   236,   130,   112,   129,
     131,   144,   183,   202,   203,   213,   214,   218,   220,   216,
     220,   133,   201,   119,   131,   183,   216,   131,   131,   197,
     133,   197,    51,   223,   135,   144,   152,   174,   186,   187,
     189,   205,   226,     7,     8,     9,   112,   116,   117,   112,
     117,   183,   209,   211,   220,   144,   179,   182,   186,   188,
     189,   205,   117,   211,   179,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   130,   169,   113,   119,   186,
     187,   189,   205,   210,   113,   116,   131,   132,   133,   147,
     148,   167,   175,   228,   245,   247,   248,   249,   250,   251,
     252,   253,   133,   253,   144,   113,   148,   150,   168,   144,
     170,   155,   155,   155,   156,   156,   157,   157,   158,   158,
     158,   160,   160,   161,   162,   163,   164,   165,   170,   113,
     118,   118,   118,   118,   144,   171,   207,   131,   133,   131,
     133,   191,   192,   193,   220,   192,   193,   194,   139,   144,
     112,   110,   132,   144,   182,   186,   188,   210,   144,   214,
     183,   112,   133,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    77,   131,   144,   170,   172,   175,
     230,   231,   232,   233,   234,   236,   237,   238,   239,   240,
     242,   228,   113,   171,   132,   213,   220,   119,   131,   129,
     184,   183,   213,   216,   198,   216,   133,   133,   113,   135,
     186,   187,   189,   205,   210,   113,   144,   113,   150,   144,
     170,   113,   211,   221,   171,   209,   220,   112,   117,   209,
     110,   117,   144,   182,   186,   188,   189,   205,   211,   171,
     117,   117,   211,   148,   168,   168,   155,   241,   133,   253,
     130,   144,   214,   218,   236,   119,   131,   131,   248,   250,
     251,   133,   133,   113,   119,   118,   129,   197,   197,   137,
     144,   195,    69,    70,   133,   110,   132,   132,   144,   113,
     171,   129,   112,   112,   112,   230,   112,   144,   131,   131,
     131,   170,   144,   129,   131,   131,   144,   180,   181,   212,
     172,   233,   172,   230,   133,   131,   133,   253,   213,   183,
     203,   213,   220,   171,   213,   113,   118,   113,   113,   118,
     209,   113,   221,   171,   195,   171,   110,   117,   118,   171,
     171,   117,   133,   228,   249,   148,   168,   167,   133,   133,
     113,   113,   111,   236,   236,   195,    69,    70,   133,    69,
      70,   133,   132,   129,   230,   170,   170,   113,   170,    56,
     113,   237,   131,   131,   130,   230,   132,   119,   131,   130,
     133,   213,   220,   183,   213,   129,   113,   118,   111,   118,
     195,   171,   118,   118,   171,    70,   133,    69,   133,   111,
     236,   236,   236,   236,    69,    70,   133,   230,   113,   113,
     230,   113,   112,   230,   113,   237,   171,   133,   253,   181,
     132,   168,   227,   213,   213,   171,   111,   118,   118,   236,
     236,    70,   133,    69,   133,    70,   133,    69,   133,   236,
     236,   230,   230,   230,   170,   230,   113,   170,   131,   133,
     227,   229,   133,   133,   236,   236,   236,   236,    70,   133,
      69,   133,    64,   113,   230,   113,   119,   133,   133,   133,
     133,   133,   236,   236,   230,   131,   230,   133,   227,   133,
     133
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
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3415 "type.ec"
	break;
      case 137: /* "type" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3424 "type.ec"
	break;
      case 138: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3433 "type.ec"
	break;
      case 139: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3442 "type.ec"
	break;
      case 140: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3451 "type.ec"
	break;
      case 141: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3460 "type.ec"
	break;
      case 142: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3469 "type.ec"
	break;
      case 143: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3478 "type.ec"
	break;
      case 144: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 154 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3487 "type.ec"
	break;
      case 145: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3496 "type.ec"
	break;
      case 147: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3505 "type.ec"
	break;
      case 150: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3514 "type.ec"
	break;
      case 152: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3523 "type.ec"
	break;
      case 155: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3532 "type.ec"
	break;
      case 156: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3541 "type.ec"
	break;
      case 157: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3550 "type.ec"
	break;
      case 158: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3559 "type.ec"
	break;
      case 160: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3568 "type.ec"
	break;
      case 161: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3577 "type.ec"
	break;
      case 162: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3586 "type.ec"
	break;
      case 163: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3595 "type.ec"
	break;
      case 164: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3604 "type.ec"
	break;
      case 165: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3613 "type.ec"
	break;
      case 166: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3622 "type.ec"
	break;
      case 167: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3631 "type.ec"
	break;
      case 168: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3640 "type.ec"
	break;
      case 170: /* "expression" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3649 "type.ec"
	break;
      case 171: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 156 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3658 "type.ec"
	break;
      case 172: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3667 "type.ec"
	break;
      case 173: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3676 "type.ec"
	break;
      case 174: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3685 "type.ec"
	break;
      case 175: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3694 "type.ec"
	break;
      case 176: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3703 "type.ec"
	break;
      case 180: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 198 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3712 "type.ec"
	break;
      case 181: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 172 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3721 "type.ec"
	break;
      case 182: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3730 "type.ec"
	break;
      case 183: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3739 "type.ec"
	break;
      case 185: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3748 "type.ec"
	break;
      case 186: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3757 "type.ec"
	break;
      case 187: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3766 "type.ec"
	break;
      case 188: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3775 "type.ec"
	break;
      case 189: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3784 "type.ec"
	break;
      case 190: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3793 "type.ec"
	break;
      case 191: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 3802 "type.ec"
	break;
      case 192: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 3811 "type.ec"
	break;
      case 193: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 3820 "type.ec"
	break;
      case 194: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 3829 "type.ec"
	break;
      case 197: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3838 "type.ec"
	break;
      case 198: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3847 "type.ec"
	break;
      case 199: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3856 "type.ec"
	break;
      case 200: /* "property" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3865 "type.ec"
	break;
      case 201: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3874 "type.ec"
	break;
      case 202: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3883 "type.ec"
	break;
      case 203: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3892 "type.ec"
	break;
      case 204: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3901 "type.ec"
	break;
      case 205: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3910 "type.ec"
	break;
      case 206: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3919 "type.ec"
	break;
      case 207: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3928 "type.ec"
	break;
      case 208: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3937 "type.ec"
	break;
      case 209: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3946 "type.ec"
	break;
      case 210: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3955 "type.ec"
	break;
      case 211: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3964 "type.ec"
	break;
      case 212: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3973 "type.ec"
	break;
      case 213: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3982 "type.ec"
	break;
      case 214: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3991 "type.ec"
	break;
      case 215: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4000 "type.ec"
	break;
      case 216: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4009 "type.ec"
	break;
      case 217: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4018 "type.ec"
	break;
      case 218: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4027 "type.ec"
	break;
      case 219: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4036 "type.ec"
	break;
      case 220: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 155 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4045 "type.ec"
	break;
      case 221: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4054 "type.ec"
	break;
      case 222: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4063 "type.ec"
	break;
      case 223: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4072 "type.ec"
	break;
      case 224: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4081 "type.ec"
	break;
      case 225: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4090 "type.ec"
	break;
      case 226: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4099 "type.ec"
	break;
      case 227: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4108 "type.ec"
	break;
      case 228: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4117 "type.ec"
	break;
      case 229: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4126 "type.ec"
	break;
      case 230: /* "statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4135 "type.ec"
	break;
      case 231: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4144 "type.ec"
	break;
      case 232: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4153 "type.ec"
	break;
      case 233: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4162 "type.ec"
	break;
      case 234: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4171 "type.ec"
	break;
      case 235: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4180 "type.ec"
	break;
      case 236: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4189 "type.ec"
	break;
      case 237: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4198 "type.ec"
	break;
      case 238: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4207 "type.ec"
	break;
      case 239: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4216 "type.ec"
	break;
      case 240: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4225 "type.ec"
	break;
      case 241: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4234 "type.ec"
	break;
      case 242: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4243 "type.ec"
	break;
      case 244: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4252 "type.ec"
	break;
      case 246: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4261 "type.ec"
	break;
      case 247: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4270 "type.ec"
	break;
      case 248: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4279 "type.ec"
	break;
      case 249: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4288 "type.ec"
	break;
      case 250: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4297 "type.ec"
	break;
      case 251: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4306 "type.ec"
	break;
      case 252: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4315 "type.ec"
	break;
      case 253: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4324 "type.ec"
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
#line 214 "type.y"
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
#line 232 "type.y"
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
#line 266 "type.y"
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
#line 315 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 317 "type.y"
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
      Compiler_Error("Not a type: %s\n", (yyvsp[(1) - (2)].id).string);      
      yylloc = tmpLoc; (yyvsp[(2) - (2)].id).badID = (yyvsp[(1) - (2)].id); // FreeIdentifier($1);
   #endif
   ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 343 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 348 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 350 "type.y"
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
#line 367 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 369 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 374 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 379 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 384 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 386 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 391 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 397 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 402 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 404 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 406 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 408 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 409 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 410 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 412 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 414 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 420 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 433 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 437 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 446 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 447 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 448 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 449 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 453 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 454 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 455 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 456 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 460 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 461 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 462 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 463 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 464 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 465 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 479 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 480 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 481 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 482 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 483 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 484 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 485 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 490 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 496 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 497 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 502 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 503 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 508 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 509 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 514 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 522 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 530 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 531 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 536 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 541 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 546 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 556 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 561 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 566 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 571 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 572 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 573 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 574 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 575 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 576 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 577 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 578 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 579 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 580 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 581 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 585 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 586 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 594 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 595 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 596 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 597 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 601 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 602 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 603 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 604 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 605 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 606 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 607 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 608 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 612 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 613 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 614 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 615 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 616 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 625 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 626 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 627 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 638 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 639 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 640 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 653 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 665 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 667 "type.y"
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

  case 179:

/* Line 1464 of yacc.c  */
#line 685 "type.y"
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

  case 180:

/* Line 1464 of yacc.c  */
#line 701 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 702 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 703 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 704 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 705 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 706 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 707 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 708 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 709 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 710 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 711 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 712 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 714 "type.y"
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

  case 193:

/* Line 1464 of yacc.c  */
#line 732 "type.y"
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

  case 194:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 749 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 754 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 758 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 759 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 760 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 761 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 762 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 766 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 771 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 776 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(yytext); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 777 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 781 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 782 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 783 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 788 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 789 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 790 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 791 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 792 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 793 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 794 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 795 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 797 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 798 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 799 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 800 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 804 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 805 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 806 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 811 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[(1) - (1)].templateDatatype)); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
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

  case 264:

/* Line 1464 of yacc.c  */
#line 898 "type.y"
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

  case 265:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 913 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 917 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 918 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 922 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 923 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 927 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 931 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 932 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 937 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 939 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 941 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 943 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 945 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 948 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 950 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 952 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 954 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 956 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 959 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 961 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 965 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 967 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 970 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 972 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 974 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 976 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 978 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 982 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 984 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 986 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 988 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 989 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].string); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1013 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1019 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1020 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1021 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1055 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1057 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1076 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1082 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1084 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1089 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1091 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1092 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1094 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1146 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].string), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1155 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1157 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1159 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1165 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1168 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1170 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1172 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1182 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1193 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1200 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1201 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1202 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].string), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1203 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].string), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1207 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1208 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1213 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1214 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1215 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1220 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1224 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1225 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1229 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1230 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1231 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1249 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[(2) - (2)].declarator));  ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1258 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1259 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1261 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1266 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1270 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1271 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1276 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1281 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1283 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
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

  case 407:

/* Line 1464 of yacc.c  */
#line 1301 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1303 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1327 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1341 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1343 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1345 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1349 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1350 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1354 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1355 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1358 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1362 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1363 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1364 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1368 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1373 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1381 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1385 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1386 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1390 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1391 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1392 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1396 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1397 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1399 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1401 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1402 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1403 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1407 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1409 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1410 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1411 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1415 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1420 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1422 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1427 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1429 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1458 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1465 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1467 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1471 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1473 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1475 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1477 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1479 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1485 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1487 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1492 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1496 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1497 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1502 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1509 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1514 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1515 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1516 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1517 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1518 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1524 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1528 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1529 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7880 "type.ec"
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
#line 1532 "type.y"


