/* Code generated from Bison source file: type.y */
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
#define YYFINAL  96
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8658

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  505
/* YYNRULES -- Number of states.  */
#define YYNSTATES  872

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
     639,   641,   643,   645,   647,   649,   651,   653,   655,   660,
     662,   665,   669,   676,   682,   684,   686,   688,   690,   692,
     694,   696,   698,   700,   702,   704,   706,   708,   710,   712,
     714,   716,   718,   720,   722,   727,   732,   737,   739,   741,
     743,   745,   747,   749,   751,   753,   755,   757,   759,   761,
     763,   765,   767,   769,   771,   773,   775,   780,   785,   790,
     792,   798,   803,   808,   812,   818,   825,   831,   837,   842,
     849,   852,   855,   859,   863,   865,   868,   870,   873,   875,
     877,   879,   883,   887,   891,   895,   897,   901,   903,   905,
     907,   910,   914,   916,   920,   930,   940,   948,   956,   962,
     973,   984,   993,  1002,  1009,  1018,  1027,  1034,  1041,  1046,
    1056,  1066,  1074,  1082,  1088,  1092,  1095,  1098,  1101,  1103,
    1106,  1108,  1110,  1112,  1116,  1118,  1121,  1124,  1128,  1134,
    1137,  1140,  1145,  1151,  1159,  1167,  1173,  1175,  1179,  1181,
    1185,  1189,  1192,  1196,  1200,  1204,  1209,  1214,  1217,  1221,
    1225,  1230,  1234,  1237,  1241,  1245,  1250,  1252,  1254,  1257,
    1260,  1263,  1267,  1269,  1271,  1274,  1277,  1280,  1284,  1286,
    1289,  1293,  1296,  1298,  1302,  1307,  1311,  1316,  1318,  1321,
    1324,  1328,  1332,  1335,  1339,  1343,  1346,  1348,  1350,  1353,
    1356,  1358,  1361,  1364,  1368,  1372,  1374,  1377,  1379,  1382,
    1385,  1389,  1391,  1395,  1397,  1401,  1404,  1407,  1410,  1414,
    1416,  1418,  1420,  1424,  1426,  1429,  1431,  1434,  1436,  1440,
    1445,  1447,  1449,  1451,  1455,  1457,  1459,  1461,  1463,  1465,
    1467,  1471,  1476,  1480,  1482,  1485,  1487,  1490,  1493,  1495,
    1497,  1500,  1502,  1505,  1509,  1511,  1514,  1520,  1528,  1534,
    1540,  1548,  1555,  1563,  1568,  1574,  1579,  1583,  1586,  1589,
    1592,  1596,  1598,  1604,  1609,  1615,  1620,  1625,  1629,  1634,
    1638,  1642,  1645,  1648,  1651,  1654,  1657,  1660,  1663,  1666,
    1669,  1673,  1675,  1677,  1681,  1684,  1686,  1688,  1691,  1694,
    1696,  1699,  1701,  1703,  1706,  1708
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
      -1,    74,    -1,    75,    -1,   191,    -1,    79,    -1,   110,
      -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,    74,
      -1,    44,    -1,   188,    -1,   188,   115,   173,   116,    -1,
     189,    -1,   190,   189,    -1,   190,   122,   189,    -1,   187,
     115,   115,   190,   116,   116,    -1,   187,   115,   115,   116,
     116,    -1,   186,    -1,    44,    -1,    45,    -1,   192,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   197,    -1,   211,    -1,
     140,    -1,    87,   115,   171,   116,    -1,   100,   115,   140,
     116,    -1,   100,   115,   147,   116,    -1,    66,    -1,    82,
      -1,    83,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   197,
      -1,   211,    -1,   142,    -1,    87,   115,   171,   116,    -1,
     100,   115,   140,   116,    -1,   100,   115,   147,   116,    -1,
      66,    -1,   203,   147,   135,   204,   136,    -1,   203,   135,
     204,   136,    -1,   203,   147,   135,   136,    -1,   203,   135,
     136,    -1,   203,   141,   135,   204,   136,    -1,   203,   186,
     147,   135,   204,   136,    -1,   203,   186,   135,   204,   136,
      -1,   203,   186,   147,   135,   136,    -1,   203,   186,   135,
     136,    -1,   203,   186,   142,   135,   204,   136,    -1,   203,
     147,    -1,   203,   142,    -1,   203,   186,   147,    -1,   203,
     186,   142,    -1,   179,    -1,   179,   217,    -1,   179,    -1,
     179,   217,    -1,   161,    -1,   200,    -1,   199,    -1,   147,
     133,   200,    -1,   147,   133,   199,    -1,   198,   133,   200,
      -1,   198,   133,   199,    -1,   201,    -1,   202,   122,   201,
      -1,    48,    -1,    49,    -1,   208,    -1,   204,   208,    -1,
     150,   133,   235,    -1,   205,    -1,   206,   122,   205,    -1,
      68,   181,   147,   135,    69,   243,    70,   243,   136,    -1,
      68,   181,   147,   135,    70,   243,    69,   243,   136,    -1,
      68,   181,   147,   135,    69,   243,   136,    -1,    68,   181,
     147,   135,    70,   243,   136,    -1,    68,   181,   147,   135,
     136,    -1,    68,   181,   217,   147,   135,    69,   243,    70,
     243,   136,    -1,    68,   181,   217,   147,   135,    70,   243,
      69,   243,   136,    -1,    68,   181,   217,   147,   135,    69,
     243,   136,    -1,    68,   181,   217,   147,   135,    70,   243,
     136,    -1,    68,   181,   217,   147,   135,   136,    -1,    68,
     181,   135,    69,   243,    70,   243,   136,    -1,    68,   181,
     135,    70,   243,    69,   243,   136,    -1,    68,   181,   135,
      69,   243,   136,    -1,    68,   181,   135,    70,   243,   136,
      -1,    68,   181,   135,   136,    -1,    68,   181,   217,   135,
      69,   243,    70,   243,   136,    -1,    68,   181,   217,   135,
      70,   243,    69,   243,   136,    -1,    68,   181,   217,   135,
      69,   243,   136,    -1,    68,   181,   217,   135,    70,   243,
     136,    -1,    68,   181,   217,   135,   136,    -1,   179,   209,
     134,    -1,   179,   134,    -1,   251,   134,    -1,   250,   134,
      -1,   253,    -1,   206,   134,    -1,   207,    -1,   134,    -1,
     210,    -1,   209,   122,   210,    -1,   225,    -1,   225,   191,
      -1,   132,   174,    -1,   225,   132,   174,    -1,   225,   132,
     174,   132,   174,    -1,    50,   147,    -1,    50,   142,    -1,
      50,   135,   213,   136,    -1,    50,   147,   135,   213,   136,
      -1,    50,   147,   135,   213,   134,   204,   136,    -1,    50,
     142,   135,   213,   134,   204,   136,    -1,    50,   142,   135,
     213,   136,    -1,   214,    -1,   213,   122,   214,    -1,   147,
      -1,   147,   133,   174,    -1,   115,   217,   116,    -1,   120,
     121,    -1,   120,   174,   121,    -1,   120,   140,   121,    -1,
     215,   120,   121,    -1,   215,   120,   174,   121,    -1,   215,
     120,   140,   121,    -1,   115,   116,    -1,   115,   228,   116,
      -1,   215,   115,   116,    -1,   215,   115,   228,   116,    -1,
     115,   218,   116,    -1,   115,   116,    -1,   115,   228,   116,
      -1,   216,   115,   116,    -1,   216,   115,   228,   116,    -1,
     227,    -1,   215,    -1,   227,   215,    -1,   186,   227,    -1,
     186,   215,    -1,   186,   227,   215,    -1,   227,    -1,   216,
      -1,   227,   216,    -1,   186,   227,    -1,   186,   216,    -1,
     186,   227,   216,    -1,   224,    -1,   227,   224,    -1,   186,
     227,   224,    -1,   219,   186,    -1,   147,    -1,   115,   219,
     116,    -1,   220,   120,   174,   121,    -1,   220,   120,   121,
      -1,   220,   120,   140,   121,    -1,   223,    -1,   227,   223,
      -1,   186,   223,    -1,   186,   227,   223,    -1,   227,   186,
     223,    -1,   220,   115,    -1,   222,   228,   116,    -1,   222,
     231,   116,    -1,   222,   116,    -1,   223,    -1,   220,    -1,
     186,   223,    -1,   186,   220,    -1,   220,    -1,   227,   220,
      -1,   186,   220,    -1,   186,   227,   220,    -1,   227,   186,
     220,    -1,   193,    -1,   226,   193,    -1,   112,    -1,   112,
     226,    -1,   112,   227,    -1,   112,   226,   227,    -1,   229,
      -1,   229,   122,    51,    -1,   230,    -1,   229,   122,   230,
      -1,   179,   219,    -1,   179,   217,    -1,   179,   123,    -1,
     179,   123,   219,    -1,   180,    -1,    65,    -1,   147,    -1,
     231,   122,   147,    -1,   176,    -1,   176,   217,    -1,   177,
      -1,   177,   217,    -1,   171,    -1,   135,   236,   136,    -1,
     135,   236,   122,   136,    -1,   170,    -1,   151,    -1,   234,
      -1,   236,   122,   234,    -1,   238,    -1,   243,    -1,   244,
      -1,   245,    -1,   246,    -1,   247,    -1,   147,   132,   237,
      -1,    52,   174,   132,   237,    -1,    53,   132,   237,    -1,
     175,    -1,   239,   175,    -1,   237,    -1,   240,   237,    -1,
     240,   175,    -1,   240,    -1,   239,    -1,   239,   240,    -1,
     135,    -1,   135,   136,    -1,   242,   241,   136,    -1,   134,
      -1,   173,   134,    -1,    54,   115,   173,   116,   237,    -1,
      54,   115,   173,   116,   237,    64,   237,    -1,    55,   115,
     173,   116,   237,    -1,    56,   115,   173,   116,   237,    -1,
      57,   237,    56,   115,   173,   116,   134,    -1,    58,   115,
     244,   244,   116,   237,    -1,    58,   115,   244,   244,   173,
     116,   237,    -1,    56,   115,   116,   237,    -1,    58,   115,
     244,   116,   237,    -1,    58,   115,   116,   237,    -1,    59,
     147,   134,    -1,    60,   134,    -1,    61,   134,    -1,    62,
     134,    -1,    62,   173,   134,    -1,     5,    -1,   178,   147,
     135,   260,   136,    -1,   178,   147,   135,   136,    -1,   179,
     147,   135,   260,   136,    -1,   179,   147,   135,   136,    -1,
     140,   135,   260,   136,    -1,   140,   135,   136,    -1,   147,
     135,   260,   136,    -1,   147,   135,   136,    -1,   135,   260,
     136,    -1,   135,   136,    -1,   143,   243,    -1,   146,   243,
      -1,   146,   134,    -1,   144,   243,    -1,   145,   243,    -1,
     178,   221,    -1,   178,   225,    -1,   254,   243,    -1,   150,
     133,   235,    -1,   235,    -1,   256,    -1,   257,   122,   256,
      -1,   257,   134,    -1,   258,    -1,   255,    -1,   259,   258,
      -1,   259,   255,    -1,   134,    -1,   259,   134,    -1,   259,
      -1,   257,    -1,   259,   257,    -1,   230,    -1,   230,   132,
     174,    -1
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
     769,   773,   774,   775,   776,   777,   781,   782,   783,   787,
     788,   789,   794,   795,   796,   797,   798,   802,   803,   807,
     808,   809,   813,   814,   818,   822,   823,   824,   829,   830,
     831,   832,   833,   834,   835,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   847,   848,   849,   850,
     854,   855,   856,   857,   858,   859,   860,   861,   862,   863,
     864,   865,   866,   867,   868,   869,   870,   871,   872,   873,
     878,   879,   880,   881,   882,   885,   886,   887,   888,   889,
     894,   895,   898,   900,   905,   906,   911,   912,   923,   927,
     929,   930,   932,   933,   957,   972,   973,   977,   978,   982,
     983,   987,   991,   992,   996,   998,  1000,  1002,  1004,  1007,
    1009,  1011,  1013,  1015,  1018,  1020,  1022,  1024,  1026,  1029,
    1031,  1033,  1035,  1037,  1042,  1043,  1044,  1045,  1046,  1047,
    1048,  1049,  1053,  1055,  1060,  1062,  1064,  1066,  1068,  1073,
    1074,  1078,  1080,  1081,  1082,  1083,  1087,  1089,  1094,  1096,
    1102,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,  1120,
    1122,  1127,  1129,  1131,  1133,  1135,  1140,  1141,  1142,  1143,
    1144,  1145,  1149,  1150,  1151,  1152,  1153,  1154,  1200,  1201,
    1203,  1205,  1210,  1212,  1214,  1216,  1218,  1223,  1224,  1227,
    1229,  1231,  1237,  1241,  1243,  1245,  1250,  1251,  1252,  1254,
    1259,  1260,  1261,  1262,  1263,  1267,  1268,  1272,  1273,  1274,
    1275,  1279,  1280,  1284,  1285,  1289,  1290,  1291,  1292,  1293,
    1304,  1329,  1330,  1334,  1335,  1339,  1340,  1344,  1346,  1348,
    1364,  1366,  1388,  1390,  1395,  1396,  1397,  1398,  1399,  1400,
    1404,  1406,  1408,  1413,  1414,  1418,  1419,  1422,  1426,  1427,
    1428,  1432,  1436,  1444,  1449,  1450,  1454,  1455,  1456,  1460,
    1461,  1462,  1463,  1465,  1466,  1467,  1471,  1472,  1473,  1474,
    1475,  1479,  1483,  1485,  1490,  1492,  1517,  1519,  1521,  1523,
    1528,  1530,  1534,  1536,  1538,  1540,  1542,  1548,  1550,  1555,
    1560,  1561,  1565,  1567,  1572,  1577,  1578,  1579,  1580,  1581,
    1582,  1586,  1587,  1588,  1592,  1593
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
     184,   185,   185,   185,   185,   185,   186,   186,   186,   187,
     187,   187,   188,   188,   188,   188,   188,   189,   189,   190,
     190,   190,   191,   191,   192,   193,   193,   193,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     196,   196,   196,   196,   196,   196,   196,   196,   196,   196,
     197,   197,   197,   197,   198,   198,   199,   199,   200,   201,
     201,   201,   201,   201,   201,   202,   202,   203,   203,   204,
     204,   205,   206,   206,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   208,   208,   208,   208,   208,   208,
     208,   208,   209,   209,   210,   210,   210,   210,   210,   211,
     211,   212,   212,   212,   212,   212,   213,   213,   214,   214,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   216,   216,   216,   216,   216,   217,   217,   217,   217,
     217,   217,   218,   218,   218,   218,   218,   218,   219,   219,
     219,   219,   220,   220,   220,   220,   220,   221,   221,   221,
     221,   221,   222,   223,   223,   223,   224,   224,   224,   224,
     225,   225,   225,   225,   225,   226,   226,   227,   227,   227,
     227,   228,   228,   229,   229,   230,   230,   230,   230,   230,
     230,   231,   231,   232,   232,   233,   233,   234,   234,   234,
     235,   235,   236,   236,   237,   237,   237,   237,   237,   237,
     238,   238,   238,   239,   239,   240,   240,   240,   241,   241,
     241,   242,   243,   243,   244,   244,   245,   245,   245,   246,
     246,   246,   246,   246,   246,   246,   247,   247,   247,   247,
     247,   248,   249,   249,   250,   250,   251,   251,   251,   251,
     252,   252,   253,   253,   253,   253,   253,   254,   254,   255,
     256,   256,   257,   257,   258,   259,   259,   259,   259,   259,
     259,   260,   260,   260,   261,   261
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
       1,     1,     1,     1,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     4,     1,
       5,     4,     4,     3,     5,     6,     5,     5,     4,     6,
       2,     2,     3,     3,     1,     2,     1,     2,     1,     1,
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
       3,     1,     3,     1,     3,     2,     2,     2,     3,     1,
       1,     1,     3,     1,     2,     1,     2,     1,     3,     4,
       1,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       3,     4,     3,     1,     2,     1,     2,     2,     1,     1,
       2,     1,     2,     3,     1,     2,     5,     7,     5,     5,
       7,     6,     7,     4,     5,     4,     3,     2,     2,     2,
       3,     1,     5,     4,     5,     4,     4,     3,     4,     3,
       3,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       3,     1,     1,     3,     2,     1,     1,     2,     2,     1,
       2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   201,   202,   203,   204,   205,   229,   230,
     231,   232,   233,   235,   238,   239,   236,   237,   225,   226,
     228,   234,   297,   298,     0,   420,   247,   206,   207,   209,
     248,   249,   240,     0,     0,   210,   211,   165,   172,   243,
       8,     5,     0,   171,   419,   159,   224,     0,   208,   227,
     161,   163,   167,   241,     0,   242,   169,   504,     0,     0,
     340,   339,     0,     0,     0,     4,     2,     3,     6,   407,
       0,     0,   417,   166,   382,   160,   224,   162,   164,   168,
     170,   367,   416,   415,   397,     0,   396,   378,   366,     0,
       0,     8,   281,   280,     0,     0,     1,   348,     0,   346,
       0,     0,    35,    22,   471,     0,     0,     0,     0,     0,
      76,     0,     0,     0,    71,     0,    74,     0,    70,    72,
      73,    75,     0,    20,    36,    18,    67,    66,    77,     0,
      79,    83,    86,    90,     0,    95,    98,   100,   102,   104,
     106,   108,   110,     0,    23,    21,     0,     0,   243,    20,
      77,   288,   286,     0,   290,   289,   295,     0,   405,   408,
     409,   357,     0,     0,     0,     0,   411,   413,   351,     0,
     126,     0,     0,   382,     0,   418,     0,   370,   399,   398,
     369,     0,     0,   381,   392,     0,   395,     0,     0,     0,
       0,   368,   379,     0,     0,     0,     0,     0,   331,   273,
       0,     0,     0,     0,    20,     0,     0,   224,     0,   302,
       0,   330,   299,     0,    12,   387,     0,     0,    21,   328,
       0,     0,     0,   283,   282,   505,     0,     0,   341,     0,
       0,     0,    45,    69,    68,    61,     0,    57,    58,     0,
       0,     0,     0,     0,     0,    64,    26,   124,     0,   423,
     131,   133,   137,   135,     0,    24,     0,     0,     0,    42,
      43,     0,     0,     0,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   113,     0,    59,     0,     0,     0,
       0,     0,     0,     0,    91,     0,     0,    89,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   244,   245,   246,
       0,     0,   224,   287,   366,     0,    10,     9,     0,   406,
     410,   350,   383,   358,     0,   353,   352,     0,   371,   380,
     359,     0,   354,     0,     0,   385,     0,     0,   393,   394,
       0,   212,   213,   216,   215,   214,     0,   217,   219,     0,
     251,   252,   253,   254,   255,   257,   260,   261,   258,   259,
     250,   256,     0,   269,   262,     0,     0,   265,   179,     0,
     173,   175,   177,   263,     0,   264,     0,    16,    71,     0,
      20,     0,   451,     0,   482,   485,   486,   484,   483,     0,
       0,     0,   325,   382,   224,     0,   332,   400,    11,   334,
       0,   389,     0,   271,   300,     0,   329,     0,   388,   327,
     326,     0,   272,     0,   278,     0,     0,     0,   349,   347,
       0,   345,     0,   342,   143,    20,     0,   425,   139,   141,
     147,   145,     0,     0,    51,    52,     0,     0,     0,     0,
       0,   224,   373,     0,   372,   193,     0,   183,   185,   187,
     189,   191,     0,     0,     0,     0,     0,    19,     0,     0,
     132,   134,   138,   136,   424,     0,     0,   499,     0,   477,
      67,   431,   430,     0,   149,   151,   153,   157,   155,   491,
      44,     0,   496,   492,   502,   495,     0,     0,   479,     0,
      41,    38,    54,     0,    53,    40,     0,   112,   111,    80,
      81,    82,    84,    85,    87,    88,    93,    94,    92,    96,
      97,    99,   101,   103,   105,   107,     0,   286,   292,   291,
     369,   294,   293,   296,   412,   414,   360,   356,   355,   386,
     384,   422,   223,     0,     0,     0,   220,   340,   339,     0,
       0,     0,     0,   180,   174,   176,   178,     0,   280,     0,
      15,   224,     0,   452,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   454,    20,     0,   443,
       0,   445,   434,     0,     0,     0,   435,   436,   437,   438,
     439,     0,   301,    13,   336,     0,   402,     0,     0,   324,
       0,   335,     0,   401,   390,   303,   391,   274,   270,   276,
       0,   277,     0,     0,     0,    60,   144,   140,   142,   148,
     146,   426,    62,    50,    47,     0,    49,     0,   362,     0,
       0,     0,   376,   375,     0,     0,   374,     0,     0,   194,
     184,   186,   188,   190,   192,     0,     0,     0,     0,     0,
      63,    65,   125,    78,    25,   481,     0,     0,   382,   150,
     152,   154,   158,   156,   487,   488,   489,     0,   494,   500,
     498,   503,   497,   476,   478,    39,     0,    37,     0,   287,
       0,   222,   221,     0,     0,     0,     0,     0,     0,   318,
       0,     0,     0,     0,   283,   282,    14,     0,     0,     0,
       0,     0,     0,     0,     0,   467,   468,   469,     0,     0,
       0,   455,   127,   382,     0,   197,   199,   444,     0,   447,
     446,   453,   129,   475,     0,   403,     0,   333,   400,     0,
     337,   404,   279,   275,   344,   343,    48,    46,   361,   363,
      28,   377,   364,     0,     0,     0,     0,     0,     0,    30,
       0,     0,     0,   480,   490,   493,    56,    55,   109,   218,
     266,   267,   268,   181,     0,     0,     0,     0,     0,   308,
       0,     0,   323,     0,     0,   442,     0,     0,     0,     0,
       0,     0,     0,   466,   470,     0,   440,     0,     0,   128,
       0,   474,   402,     0,     0,   401,     0,   365,    27,   195,
      32,     0,     0,    29,    34,     0,     0,   316,     0,   317,
     182,     0,     0,     0,     0,     0,     0,   313,   441,     0,
       0,   463,     0,     0,   465,     0,     0,     0,   473,     0,
     198,     0,   427,   200,   403,   404,   338,   196,    31,    33,
       0,     0,     0,   306,     0,   307,     0,   321,     0,   322,
       0,     0,   456,   458,   459,     0,   464,     0,     0,   130,
     472,   432,     0,   314,   315,     0,     0,     0,     0,     0,
     311,     0,   312,     0,     0,   461,     0,     0,   428,   304,
     305,   319,   320,     0,     0,   457,   460,   462,   429,   433,
     309,   310
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    37,    38,   122,    40,    41,   200,   201,   202,   203,
     123,   124,   125,   126,   461,   233,   483,   127,   150,   235,
     129,   130,   131,   132,   133,   134,   135,   136,   137,   138,
     139,   140,   141,   142,   247,   275,   558,   171,   699,   249,
     417,   463,   206,    44,   359,   436,   694,   695,    45,    46,
      47,   337,   338,   339,    48,    49,    50,    51,   439,    52,
      53,   153,   154,   155,   156,   157,    54,   208,   209,   210,
     211,   212,   385,   386,    55,    56,    98,    99,    81,   432,
     163,   433,   164,   213,   214,    85,   215,    87,   389,   159,
     216,   165,   166,   167,   189,   254,   422,   813,   469,   842,
     561,   562,   563,   564,   565,   373,   566,   567,   568,   569,
     570,   144,   571,   217,   145,   470,   219,   471,   472,   473,
     474,   475,   476,   477,    58
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -778
static const yytype_int16 yypact[] =
{
    8292,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,    50,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,   -69,   -40,  -778,  -778,  -778,  -778,  -778,
     -18,  -778,   227,  6840,  -778,  -778,  -778,     3,  -778,  -778,
    -778,  -778,  -778,  -778,    28,  -778,  -778,   -34,   136,   179,
      25,    57,  6590,    55,  5854,  -778,  -778,  -778,  -778,   822,
    6936,  6288,   551,  -778,   112,  -778,   183,  -778,  -778,  -778,
    -778,   114,  -778,   761,   211,  7764,  -778,  -778,   856,   104,
    2082,   -46,  -778,   140,    54,  6590,  -778,   144,  -100,  -778,
     179,   179,  -778,  -778,  -778,  6648,  6721,  6721,  8377,  6590,
    -778,  8377,  6590,  6739,  -778,  5980,  -778,   323,  -778,  -778,
    -778,  -778,   220,    36,  -778,  -778,   514,  -778,   959,  6590,
    -778,   -31,    85,   518,  6590,   272,   544,   258,   262,   281,
     397,    -3,  -778,   300,  -778,  -778,   310,    34,   220,    13,
    -778,   518,  5741,   297,  -778,  -778,  -778,   224,  -778,   822,
    -778,  -778,   714,   317,   578,   330,   313,  -778,  -778,     9,
    -778,   327,   551,  -778,   103,   761,   364,   114,   211,  -778,
     856,  7853,  6361,  -778,  -778,  6417,  -778,   457,   341,   235,
      26,   114,  -778,   334,  8462,  8031,  5392,  8377,  -778,  -778,
     326,   326,   326,   450,    22,   433,  5521,   103,  3522,  -778,
     -30,  -778,  -778,   211,  -778,  -778,   364,   338,   347,  -778,
    5170,  3640,  3758,   351,   358,  -778,  6590,   179,  -778,   123,
     156,  6106,  -778,   526,  -778,  -778,  6443,  -778,  -778,   112,
    7122,  8547,  7215,  8547,  6106,  -778,  -778,  -778,   282,  7582,
    -778,  -778,  -778,  -778,   388,   387,  2716,  2852,   179,  -778,
    -778,  4905,   179,  6590,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  4996,  -778,  6590,  6590,  6590,
    6590,  6590,  6590,  6590,   518,  6590,  6590,  -778,  6590,  6590,
    6590,  6590,  6590,  6590,  6590,  6590,  6590,  -778,  -778,  -778,
    5854,  7029,   230,   378,   257,  5854,  -778,  -778,  5854,  -778,
    -778,  -778,  -778,  -778,  8207,  -778,  -778,   364,   114,  -778,
    -778,   400,  -778,    67,   398,  -778,   181,   415,  -778,  -778,
     179,  -778,  -778,  -778,  -778,  -778,   424,   427,  -778,   674,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,    55,  -778,  -778,   429,   435,  -778,   443,  5411,
    -778,  -778,  -778,  -778,   645,  -778,  8031,  -778,   822,  6232,
     321,  8119,   425,  4820,  -778,  -778,  -778,  -778,  -778,  4996,
     938,  6590,  -778,    30,   103,    11,  -778,   211,  -778,   157,
     364,  -778,    26,  -778,  -778,   841,  -778,    26,  -778,  -778,
    -778,  3876,  -778,  3994,  -778,  4112,  5170,  4230,  -778,  -778,
    5170,  -778,  5170,  -778,  -778,    22,   456,  7582,  -778,  -778,
    -778,  -778,   458,   179,  -778,  -778,  4961,   179,  6590,  7675,
    6590,   135,   474,   476,   483,   489,  7401,  -778,  -778,  -778,
    -778,  -778,  6590,   487,  7494,   493,   505,  -778,  6590,   179,
    -778,  -778,  -778,  -778,  -778,  6590,   323,  -778,  2988,  -778,
     480,  -778,  -778,  8031,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,   326,  -778,  -778,   148,  -778,  3124,   501,  -778,   504,
    -778,  -778,  -778,   312,  -778,  -778,   490,  -778,  -778,  -778,
    -778,  -778,   -31,   -31,    85,    85,   518,   518,   518,   272,
     272,   544,   258,   262,   281,   397,   -10,  7308,  -778,  -778,
     257,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  6590,   515,   636,  -778,  -778,  -778,  6590,
      55,  5854,    17,   -44,  -778,  -778,  -778,    42,  -778,    55,
    -778,   103,   531,  -778,  6590,   496,   543,   545,   553,  1924,
     557,   179,   525,   540,  5304,   179,  -778,    38,   184,  -778,
    5631,  -778,  -778,  2308,  2444,   548,  -778,  -778,  -778,  -778,
    -778,   542,  -778,  -778,  -778,  3260,   211,    26,   512,  -778,
    6590,  -778,    26,   211,  -778,  -778,  -778,  -778,  -778,  -778,
    4348,  -778,  4466,  4584,  4702,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,   348,  -778,   497,  -778,   570,
     571,   574,   474,   483,  7942,  6590,   474,  5854,  6590,   579,
    -778,  -778,  -778,  -778,  -778,   577,   582,  6590,  6590,   580,
    -778,  -778,  -778,  -778,  -778,  -778,   568,  4996,   179,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  4996,  -778,  -778,
    -778,   148,  -778,  -778,  -778,  -778,  4996,  -778,  6590,  -778,
     349,  -778,  -778,   589,   591,    48,   159,   326,   326,  -778,
    5854,   319,   440,   581,  -778,  -778,  -778,   590,  1924,  6590,
    6590,  6499,   656,  5222,   587,  -778,  -778,  -778,   185,   592,
    1924,  -778,  -778,    58,   207,  -778,   840,  -778,  2580,  -778,
    -778,  -778,  -778,  -778,   593,   211,   103,  -778,   594,   364,
     596,   211,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,   474,  -778,   618,   615,   221,   616,  5854,  6590,  -778,
     617,   619,  6590,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,   -26,   -20,   239,   326,   326,  -778,
     326,   326,  -778,   444,  1924,  -778,   361,   369,  1924,   381,
     626,  1924,  5255,  -778,  -778,  6590,  -778,  3396,   551,  -778,
    5044,  -778,   594,    26,    26,   594,  6590,  -778,  -778,  -778,
    -778,   254,   622,  -778,  -778,   623,   326,  -778,   326,  -778,
    -778,   -15,   -17,    -5,     4,   326,   326,  -778,  -778,  1924,
    1924,  -778,  1924,  6590,  -778,  1924,  6572,   611,  -778,   621,
    -778,  5044,  -778,  -778,   594,   594,  -778,  -778,  -778,  -778,
     627,   628,   326,  -778,   326,  -778,   326,  -778,   326,  -778,
       1,    15,   683,  -778,  -778,   386,  -778,  1924,   404,  -778,
    -778,  -778,   -43,  -778,  -778,   629,   633,   634,   635,   326,
    -778,   326,  -778,  1924,   641,  -778,  1924,  1655,  -778,  -778,
    -778,  -778,  -778,   643,   644,  -778,  -778,  -778,  -778,  -778,
    -778,  -778
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -778,    81,  -778,   696,   697,    23,  -778,  -778,  -778,  -778,
       0,  -778,   309,  1119,  -257,  -778,   336,   340,    52,   639,
    -778,  -123,   355,   360,   -14,  -778,   365,   462,   491,   498,
     500,   502,  -778,  1559,   -24,  -778,    97,   342,  -352,  -778,
    -778,  -364,   168,  -778,  -778,   552,  -778,    24,  1446,   957,
    -778,  -778,  -324,  -778,   409,  -778,  1238,  1493,  -184,  1199,
    -181,  -778,    -1,    74,   507,  -504,  -168,   198,   406,  -778,
    -778,   -47,  -778,   225,  -175,  1382,   549,   601,   -48,  -399,
     -23,  -231,   -42,   495,  -183,  -778,   818,   -71,   345,  -778,
    1069,   -82,  -778,     8,  -778,  -778,   565,  -777,  -372,  -778,
     492,  -778,  -778,   253,  -778,  -778,  1478,  -635,  -778,  -778,
    -778,  -112,  -778,  -778,    89,  -778,  -778,  -778,   343,   170,
     344,   356,  -778,  -255,  -778
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -502
static const yytype_int16 yytable[] =
{
      42,    83,   479,   188,   482,   255,   276,   572,    57,   560,
     362,   443,   367,   363,   295,   526,     1,   192,   487,   365,
      82,   559,   227,   388,    61,     1,   364,   666,   177,     1,
     175,     1,   612,     1,   841,   616,   228,     1,   143,     1,
     191,     1,    68,    74,   786,     1,    62,    60,   762,   788,
     151,     1,   824,     1,    93,   822,     2,     1,     1,    97,
     363,     1,   363,   147,   149,   826,   365,    64,   365,   670,
     162,   849,   173,   828,    68,    63,   173,    92,     2,   857,
     869,   277,     2,     2,   851,   187,   667,   668,   173,   220,
     204,   671,   395,   858,   224,    64,   278,   279,    95,   321,
      97,    97,    27,    28,   396,   192,     1,    29,   239,   319,
     787,   239,   448,   725,   128,     1,   789,   223,    89,   825,
     284,   823,   658,    68,    73,    66,    67,   806,   296,   303,
     315,   827,   318,   578,    66,    67,    96,   850,    35,    36,
     829,   172,    66,    67,   256,   579,   300,    68,   257,    68,
     299,   852,   239,   669,   489,   490,   491,   257,   237,   238,
     100,   394,    68,    90,   742,   575,   746,   128,    43,   482,
     690,   257,   173,   257,   173,   536,   173,   672,   363,   218,
     173,    42,     1,   540,   365,    59,     1,    68,   517,   222,
     173,   364,   101,   767,   358,    74,   370,   239,   609,   560,
     560,   662,   256,   636,    68,   625,   383,   173,   204,   280,
     281,   697,   248,   629,   721,    69,   173,   357,   172,   193,
     204,   204,   204,   781,    66,    67,   454,    97,    65,   181,
       1,   415,   152,    73,   182,   306,    29,   484,    43,    68,
     239,   435,   239,   435,   415,   227,   319,    69,   128,   449,
     429,   488,   622,    43,   177,   363,   191,   410,   480,   411,
     622,   365,   485,   363,   357,   734,   357,    35,    36,   365,
     647,   496,   497,   743,   498,   221,   240,   226,   227,   242,
     644,   308,   648,   416,   285,   286,   151,    73,   128,   580,
     412,   151,   413,   248,   151,    69,   445,   218,    70,   508,
     415,    42,   519,    71,   511,   415,   448,   448,   149,   218,
     218,   218,   414,   128,    42,   128,   256,   173,   691,   764,
     704,    73,   515,    73,     1,   414,   184,   128,   104,   768,
     521,   185,   633,   248,   560,   779,   537,   331,   307,    66,
      67,   769,    69,   308,   634,   301,   308,   610,   128,    43,
      71,   329,   528,   790,   394,   256,   394,   330,   394,   533,
     486,   308,   332,   366,   538,   371,    74,     1,   817,   370,
      68,   239,   301,   557,   509,   527,   308,    71,   333,   512,
     173,   291,   357,    68,   173,   287,   288,    92,   747,   748,
     173,   292,   173,   506,   601,  -382,  -382,   173,   447,   736,
    -382,   204,   484,   204,   448,   204,   204,   204,   334,   335,
     204,   293,   204,   294,   232,    68,   297,   239,   401,   403,
     405,   128,   232,   603,   632,   128,   298,   606,   655,    42,
     305,  -382,  -382,   311,   656,   314,   619,   225,    27,    28,
     258,   259,   260,    29,   619,   234,   313,    73,   316,    68,
     336,   241,    73,   234,   243,   749,   257,   328,    65,   357,
       1,   372,   318,   638,   716,   739,   248,   357,   507,    43,
     656,   448,   399,   507,    35,    36,   152,   799,   128,   172,
     128,   400,    43,   448,   659,   800,   406,   258,   259,   260,
     218,   448,   218,   407,   218,   218,   218,   802,   596,   218,
     128,   218,   854,   448,   455,   663,   456,   239,   448,   750,
     751,  -285,   809,   795,   796,     1,   516,   151,   696,   518,
     856,   258,   259,   260,   324,   607,   448,   327,   282,   283,
     665,   149,   723,   423,   424,   425,   520,   673,    84,   675,
     522,   173,   523,   394,   529,   394,   394,   394,   261,   557,
     530,   684,   262,   263,     1,   689,   531,    68,   289,   290,
     693,   543,   674,   557,   557,    84,   379,    84,   408,    66,
      67,   178,   595,  -421,   602,   128,   752,   173,   173,  -421,
     797,   128,   173,    84,   377,   372,    27,    28,    73,   614,
     204,    29,   204,   204,   204,   261,   615,    43,   429,   262,
     263,   128,   617,   151,   590,   592,   128,   627,   593,   630,
     594,   657,   448,   637,    42,   128,   128,   149,   717,   448,
     660,   631,    35,    36,    69,    27,    28,   172,   678,   261,
      29,   661,   737,   262,   263,   492,   493,   653,    68,   331,
     654,   426,   494,   495,   381,   427,   428,   676,     1,   229,
     230,   688,    27,    28,   499,   500,   151,    29,   679,   685,
     680,    35,    36,    69,   332,    68,   172,    84,   681,   178,
     149,    84,   683,     2,   686,    84,   702,   331,   557,   218,
     333,   218,   218,   218,   701,   178,   718,   719,    35,    36,
     557,    84,   727,    68,   312,   720,    39,   728,   557,   152,
     732,   387,   332,   729,   733,   740,   173,   741,   128,   173,
     334,   335,   760,   151,   185,    65,   753,     1,   333,    27,
      28,   763,   754,   574,    29,   765,   696,   149,   776,   771,
     128,   128,   128,   128,   777,   128,   778,   780,   783,    39,
     784,   803,   128,   818,   819,   839,   812,   853,   334,   335,
     128,    91,   245,   501,   557,    35,    36,   840,   557,   146,
     148,   557,   605,   843,   844,   859,    39,   169,   173,   860,
     861,   862,   611,   173,   173,   866,   756,   757,   759,   870,
     871,    39,    43,   502,   626,   152,   148,   812,  -382,  -382,
     524,   503,   810,  -382,   504,   444,   525,   505,   581,   557,
     557,   585,   557,   707,    39,   557,   128,    39,   645,   446,
     128,   148,    84,   128,   128,   513,   698,   735,     0,   650,
     651,     0,   128,     0,  -382,  -382,    66,    67,   409,  -382,
    -382,     0,   652,   812,  -382,    27,    28,   557,   152,     0,
      29,     0,   102,     0,     1,   103,   104,     0,    39,     0,
       0,   128,   128,   557,   128,   128,   557,   128,   128,     1,
       0,    86,     0,   128,    84,     0,    18,    19,     0,     2,
       0,    35,    36,     0,     0,    84,     0,    39,   323,   576,
       0,   326,     0,     0,     0,   583,   677,     0,    86,   128,
      86,    39,     0,    39,   179,   152,    27,    28,     0,     0,
     835,    29,    39,   838,   148,   128,    86,     0,   128,   128,
       0,     0,   108,   109,    27,    28,   148,   148,   148,    29,
       0,     0,   710,     0,     0,     0,     0,   148,     0,     0,
      27,    28,    35,    36,    69,    29,    39,     0,    39,     0,
     148,     1,     0,   111,   112,    39,     0,     0,     0,     0,
      35,    36,   148,   148,     0,     0,   236,   724,   387,   117,
     726,     0,     0,     0,     0,     0,    35,    36,     0,   730,
     731,    70,     0,   770,     0,     0,    71,   264,   265,   266,
     267,   268,   269,   270,   271,   272,   273,     0,     0,     0,
      86,     0,   179,     0,    86,     0,   148,    39,    86,     0,
      76,   148,     0,     0,   148,     0,     0,     0,   179,     0,
      39,    94,    27,    28,    86,     0,     0,    29,     0,     0,
       0,     0,     0,     0,     0,   391,     0,    76,     0,   174,
       0,     0,     0,     0,   398,     0,   178,     0,     0,     0,
     183,   682,     0,     0,     0,   190,     0,   207,    35,    36,
      69,     0,     0,   172,   573,    84,   700,     0,     0,     0,
       0,     0,    39,     0,     0,   148,     0,    39,     0,   148,
     782,     0,   705,   708,   785,     0,     0,   711,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   274,     0,     0,     0,     0,   148,     0,   148,
       0,   148,   148,   148,     0,     0,   148,   807,   148,   302,
       0,     0,    88,    39,     0,     0,     0,     0,   816,     0,
       0,   183,     0,     0,     0,    39,     0,     0,     0,   174,
       0,     0,   183,   190,     0,    86,     0,   190,   160,    88,
       0,   176,     0,     0,     0,   180,     0,     0,     0,     0,
       0,     0,   207,   174,   148,     0,     0,     0,     0,    39,
       0,     0,     0,   384,     0,   207,     0,     0,     0,     0,
     755,     0,   148,   397,     0,     0,     0,   207,   207,   207,
       0,     0,   766,     0,     0,     0,     0,    86,     0,     0,
     700,     0,     0,     0,     0,     0,     0,   431,    86,   431,
       0,   772,   391,    39,   775,     0,   302,     0,   398,   205,
     584,     0,     0,     0,     0,   586,     0,     0,     0,     0,
       0,   304,     0,     0,     0,     0,   664,   148,   310,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   176,    79,   317,     0,     0,   798,     0,     0,     0,
     801,     0,     0,   804,     0,     0,    39,     0,   302,   148,
     148,     0,     0,    84,     0,   176,     0,     0,   814,   815,
       0,   148,     0,     0,   190,   390,   392,     0,     0,     0,
       0,    77,     0,     0,     0,     0,   148,     0,   148,   148,
     148,   832,   833,     0,   834,     0,     0,   836,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   158,     0,   434,
      39,   434,     0,   148,   252,     0,   302,     0,   304,     0,
       0,   539,     0,   207,     0,     0,   541,   205,     0,   855,
       0,     0,     0,     0,     0,     0,     0,   174,     0,   205,
     205,   205,     0,     0,     0,   865,     0,   582,   867,     0,
       0,    79,     0,   250,     0,     0,     0,     0,   207,   179,
     207,     0,   207,   207,   207,     0,   148,   207,     0,   207,
     304,   510,     0,     0,   302,   460,   460,     0,    86,     0,
       0,     0,     0,     0,     0,     0,   431,     0,     0,     0,
      77,     0,     0,   431,   148,   584,     0,   309,     0,     0,
     586,   431,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     384,     0,     0,   148,     0,    80,     0,     0,   304,     0,
     420,     0,   361,     0,     0,     0,     0,   160,   176,    79,
     440,    79,   440,   420,    77,     0,     0,     0,   452,   176,
       0,     0,     0,   577,     0,   467,   467,     0,     0,     0,
       0,     0,     0,   148,   302,     0,     0,     0,     0,   418,
       0,     0,     0,     0,     0,     0,     0,     0,    77,   438,
      77,   438,   418,     0,     0,     0,   304,   450,     0,    75,
       0,     0,     0,     0,   465,   465,     0,   253,   434,     0,
     613,     0,     0,     0,     0,   434,     0,     0,     0,     0,
       0,     0,     0,   434,   205,     0,     0,   541,     0,     0,
     205,     0,   205,     0,   205,   205,   205,     0,     0,   205,
       0,   205,   390,     0,    80,   706,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   207,     0,   207,
     207,   207,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,   252,     0,
      79,     0,   467,     0,     0,     0,   304,   460,     0,     0,
       0,     0,     0,     0,     0,     0,    86,     0,    80,     0,
       0,     0,     0,     0,     0,   460,     0,   535,    75,     0,
       0,     0,     0,     0,    77,     0,   158,   250,   251,    77,
     317,   465,     0,   421,     0,     0,   599,     0,     0,     0,
       0,     0,    80,   441,    80,   441,   421,     0,     0,   176,
     170,   453,     0,     0,     0,   623,     0,     0,   468,   468,
     360,     0,     0,   623,     0,    78,     0,   709,     0,     0,
       0,     0,    75,   183,   170,   597,   102,   467,     1,   103,
     104,   105,   642,   106,   107,     0,   774,     0,   170,     0,
       0,   170,     0,     0,   621,   467,     0,     0,   374,   375,
     376,   378,   621,     2,     0,     0,    75,   437,    75,   437,
       0,     0,     0,     0,   460,     0,   465,     0,     0,    78,
       0,   640,   464,   464,     0,     0,    79,     0,     0,   205,
       0,   205,   205,   205,   465,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   419,   174,   108,   109,   110,     0,
       0,     0,     0,    78,     0,    78,     0,   419,     0,     0,
       0,   170,   451,     0,   170,    77,     0,     0,    80,   466,
     466,   253,     0,    80,     0,   468,     0,   111,   112,   642,
       0,     0,   467,   467,   113,     0,   460,   114,     0,     0,
     115,     0,   116,   117,   467,   773,     0,     0,   118,   119,
     120,   121,     0,     0,     0,   170,     0,     0,     0,     0,
     811,   868,     0,     0,     0,     0,     0,     0,   640,   600,
       0,   465,   465,     0,     0,   534,     0,     0,     0,     0,
       0,     0,    75,   465,     0,   462,   462,    75,   624,   464,
       0,     0,     0,     0,     0,     0,   624,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   176,     0,     0,
     468,     0,     0,     0,     0,   643,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   468,    78,
       0,     0,   251,     0,    78,     0,   466,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   620,     0,     0,     0,   460,     0,     0,    80,
     620,     0,     0,     0,     0,     0,     0,   467,     0,     0,
       0,     0,     0,     0,   464,     0,     0,     0,     0,   639,
     598,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   464,     0,     0,   102,     0,     1,   103,   104,
     105,     0,   106,   107,     0,     0,   465,     0,   462,     0,
     170,     0,   643,     0,     0,   468,   468,     0,     0,   646,
       0,   466,     2,    75,     0,     0,   641,   468,     0,     0,
       0,     0,     0,     0,     0,     0,   467,     0,     0,   466,
       0,     0,     0,     0,     0,     0,   544,   545,   546,   547,
     548,   549,   550,   551,   552,   553,   554,     0,     0,   170,
       0,     0,     0,     0,     0,   108,   109,   110,     0,     0,
      78,   170,     0,     0,     0,   465,   639,     0,     0,   464,
     464,     0,     0,     0,     0,     0,     0,   462,     0,     0,
       0,   464,     0,     0,     0,     0,   111,   112,     0,     0,
       0,     0,     0,   113,     0,   462,   114,     0,     0,   115,
       0,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,     0,     0,   641,     0,     0,   466,   466,   556,   372,
       0,     0,     0,     0,     0,     0,     0,     0,   466,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     468,     0,     0,   102,     0,     1,   103,   104,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   170,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   462,     0,     0,     0,     0,   170,
       0,     0,     0,     0,   464,   744,   745,     0,    26,   468,
     194,     0,     0,   108,   109,     0,    27,    28,     0,     0,
     195,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,   170,     0,     0,   170,     0,     0,
       0,     0,    34,     0,   111,   112,   170,   170,     0,     0,
       0,   466,    35,    36,    69,     0,   462,   196,     0,   197,
     117,     0,     0,     0,     0,     0,   462,     0,     0,     0,
       0,     0,     0,   464,     0,     0,   198,   738,   199,     0,
       0,     0,     0,     0,     0,   791,   792,     0,   793,   794,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     466,     0,     0,     0,   820,     0,   821,     0,     0,     0,
       0,     0,     0,   830,   831,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   170,     0,     0,
       0,   170,     0,     0,     0,     0,     0,     0,     0,     0,
     845,     0,   846,     0,   847,     0,   848,     0,     0,   102,
       0,     1,   103,   104,   105,     0,   106,   107,     0,     0,
       0,     0,     0,     0,   170,     0,   462,   863,     0,   864,
       0,     0,     0,     0,     0,   170,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
     544,   545,   546,   547,   548,   549,   550,   551,   552,   553,
     554,     0,     0,     0,    26,     0,     0,     0,     0,   108,
     109,   110,    27,    28,     0,   555,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     111,   112,     0,     0,     0,     0,     0,   113,    35,    36,
     114,     0,     0,   115,     0,   116,   117,     0,     0,     0,
       0,   118,   119,   120,   121,     0,     0,     0,     0,     0,
       0,     0,   556,   372,  -449,   102,     0,     1,   103,   104,
     105,     0,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,   544,   545,   546,   547,
     548,   549,   550,   551,   552,   553,   554,     0,     0,     0,
      26,     0,     0,     0,     0,   108,   109,   110,    27,    28,
       0,   555,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   111,   112,     0,     0,
       0,     0,     0,   113,    35,    36,   114,     0,     0,   115,
       0,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,     0,     0,     0,     0,     0,     0,     0,   556,   372,
    -448,   102,     0,     1,   103,   104,   105,     0,   106,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,   544,   545,   546,   547,   548,   549,   550,   551,
     552,   553,   554,     0,     0,     0,    26,     0,     0,     0,
       0,   108,   109,   110,    27,    28,     0,   555,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,   113,
      35,    36,   114,     0,     0,   115,     0,   116,   117,     0,
       0,     0,     0,   118,   119,   120,   121,     0,     0,     0,
       0,     0,     0,     0,   556,   372,  -450,   102,     0,     1,
     103,   104,   105,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   108,   109,   110,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   111,   112,
       0,     0,     0,     0,     0,   113,    35,    36,   114,     0,
       0,   115,     0,   116,   117,     0,     0,     0,     0,   118,
     119,   120,   121,     0,     0,     0,     0,     0,     0,     0,
     457,   458,   459,   102,     0,     1,   103,   104,   105,     0,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,   108,   109,   110,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   111,   112,     0,     0,     0,     0,
       0,   113,    35,    36,   114,     0,     0,   115,     0,   116,
     117,     0,     0,     0,     0,   118,   119,   120,   121,     0,
       0,     0,     0,     0,     0,     0,   457,   458,   478,   102,
       0,     1,   103,   104,   105,     0,   106,   107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   108,
     109,   110,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     111,   112,     0,     0,     0,     0,     0,   113,    35,    36,
     114,     0,     0,   115,     0,   116,   117,     0,     0,     0,
       0,   118,   119,   120,   121,     0,     0,     0,     0,     0,
       0,     0,   457,   458,   635,   102,     0,     1,   103,   104,
     105,     0,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   108,   109,   110,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   111,   112,     0,     0,
       0,     0,     0,   113,    35,    36,   114,     0,     0,   115,
       0,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,     0,     0,     0,     0,     0,     0,     0,   649,   458,
    -501,   102,     0,     1,   103,   104,   105,     0,   106,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   108,   109,   110,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,   113,
      35,    36,   114,     0,     0,   115,     0,   116,   117,     0,
       0,     0,     0,   118,   119,   120,   121,     0,     0,     0,
       0,     0,     0,     0,   457,   458,   703,   102,     0,     1,
     103,   104,   105,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   108,   109,   110,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   111,   112,
       0,     0,     0,     0,     0,   113,    35,    36,   114,     0,
       0,   115,     0,   116,   117,     0,     0,     0,     0,   118,
     119,   120,   121,   102,     0,     1,   103,   104,     0,     0,
     457,   458,   808,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     194,     0,     0,   108,   109,     0,    27,    28,     0,     0,
     195,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   111,   112,     0,     0,     0,     0,
       0,     0,    35,    36,    69,     0,     0,   196,     0,   197,
     117,   102,     0,     1,   103,   104,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   198,     0,   393,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   194,     0,
       0,   108,   109,     0,    27,    28,     0,     0,   195,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,     0,
      35,    36,    69,     0,     0,   196,     0,   197,   117,   102,
       0,     1,   103,   104,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   198,     0,   402,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   194,     0,     0,   108,
     109,     0,    27,    28,     0,     0,   195,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     111,   112,     0,     0,     0,     0,     0,     0,    35,    36,
      69,     0,     0,   196,     0,   197,   117,   102,     0,     1,
     103,   104,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   198,     0,   404,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   194,     0,     0,   108,   109,     0,
      27,    28,     0,     0,   195,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   111,   112,
       0,     0,     0,     0,     0,     0,    35,    36,    69,     0,
       0,   196,     0,   197,   117,   102,     0,     1,   103,   104,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     198,     0,   587,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   194,     0,     0,   108,   109,     0,    27,    28,
       0,     0,   195,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   111,   112,     0,     0,
       0,     0,     0,     0,    35,    36,    69,     0,     0,   196,
       0,   197,   117,   102,     0,     1,   103,   104,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   198,     0,
     588,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     194,     0,     0,   108,   109,     0,    27,    28,     0,     0,
     195,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   111,   112,     0,     0,     0,     0,
       0,     0,    35,    36,    69,     0,     0,   196,     0,   197,
     117,   102,     0,     1,   103,   104,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   198,     0,   589,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   194,     0,
       0,   108,   109,     0,    27,    28,     0,     0,   195,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,     0,
      35,    36,    69,     0,     0,   196,     0,   197,   117,   102,
       0,     1,   103,   104,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   198,     0,   591,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   194,     0,     0,   108,
     109,     0,    27,    28,     0,     0,   195,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     111,   112,     0,     0,     0,     0,     0,     0,    35,    36,
      69,     0,     0,   196,     0,   197,   117,   102,     0,     1,
     103,   104,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   198,     0,   712,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   194,     0,     0,   108,   109,     0,
      27,    28,     0,     0,   195,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   111,   112,
       0,     0,     0,     0,     0,     0,    35,    36,    69,     0,
       0,   196,     0,   197,   117,   102,     0,     1,   103,   104,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     198,     0,   713,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   194,     0,     0,   108,   109,     0,    27,    28,
       0,     0,   195,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   111,   112,     0,     0,
       0,     0,     0,     0,    35,    36,    69,     0,     0,   196,
       0,   197,   117,   102,     0,     1,   103,   104,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   198,     0,
     714,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     194,     0,     0,   108,   109,     0,    27,    28,     0,     0,
     195,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   111,   112,     0,     0,     0,     0,
       0,     0,    35,    36,    69,     0,     0,   196,     0,   197,
     117,   102,     0,     1,   103,   104,   105,     0,   106,   107,
       0,     0,     0,     0,     0,     0,   198,     0,   715,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,   544,   545,   546,   547,   548,   549,   550,   551,
     552,   553,   554,     0,     0,     0,    26,     0,     0,     0,
       0,   108,   109,   110,    27,    28,     0,   555,     0,    29,
       0,     0,    30,    31,     0,    32,   102,    33,     1,   103,
     104,   105,     0,   106,   107,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,   113,
      35,    36,   114,     2,     0,   115,     0,   116,   117,     0,
       0,     0,     0,   118,   119,   120,   121,     0,     0,     0,
       0,     0,     0,     0,   556,   372,     0,     0,     0,     0,
       0,     0,   102,     0,     1,   103,   104,   105,     0,   106,
     107,     0,     0,     0,     0,     0,   108,   109,   110,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,   102,     0,     1,
     103,   104,   105,     0,   106,   107,     0,   111,   112,     0,
       0,     0,     0,     0,   113,     0,     0,   114,     0,     0,
     115,   481,   116,   117,     2,     0,     0,     0,   118,   119,
     120,   121,   108,   109,   110,     0,     0,     0,     0,     0,
     458,     0,     0,     0,     0,   102,     0,     1,   103,   104,
     105,     0,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,   112,     0,     0,   108,   109,   110,
     113,     0,     2,   114,     0,     0,   115,   604,   116,   117,
       0,     0,     0,     0,   118,   119,   120,   121,     0,     0,
       0,     0,     0,     0,     0,     0,   458,     0,   111,   112,
       0,     0,     0,     0,     0,   113,     0,     0,   114,     0,
       0,   115,     0,   116,   117,   108,   109,   110,     0,   118,
     119,   120,   121,     0,     0,     0,     0,     0,     0,     0,
       0,   458,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   111,   112,     0,     0,
       0,     0,     0,   113,     0,     0,   114,     0,     0,   115,
       0,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,   102,     0,     1,   103,   104,     0,     0,     0,   811,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,   102,     0,     1,   103,   104,   105,     0,
     106,   107,     0,     0,     0,     0,    26,     0,   194,     0,
       0,   108,   109,     0,    27,    28,     0,     0,   195,    29,
       2,     0,    30,    31,     0,    32,   102,    33,     1,   103,
     104,   105,     0,   106,   107,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,     0,
      35,    36,    69,     2,     0,   196,     0,   197,   117,     0,
       0,     0,     0,   108,   109,   110,     0,     0,     0,     0,
       0,     0,     0,     0,   198,   102,     0,     1,   103,   104,
     105,     0,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   111,   112,   108,   109,   110,     0,
       0,   113,     2,     0,   114,     0,     0,   115,   761,   116,
     117,     0,     0,     0,     0,   118,   119,   120,   121,     0,
       0,     0,     0,     0,     0,     0,   556,   111,   112,     0,
       0,     0,     0,     0,   113,     0,     0,   114,     0,     0,
     115,   805,   116,   117,     0,   108,   109,   110,   118,   119,
     120,   121,     0,     0,     0,     0,     0,     0,     0,   556,
       0,     0,     0,   102,     0,     1,   103,   104,   105,     0,
     106,   107,     0,     0,     0,     0,   111,   112,     0,     0,
       0,     0,     0,   113,     1,     0,   114,     0,     0,   115,
       2,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,     0,     0,     0,     0,     0,     0,     0,   687,     2,
       3,     4,     5,     6,     7,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,    18,    19,   350,   351,    22,
      23,   352,     0,   108,   109,   110,    27,    28,     0,     0,
       0,    29,     0,     0,     0,     0,     0,   353,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,   111,   112,   354,     0,   355,     0,
       0,   113,    35,    36,   368,     0,     0,   369,   246,   116,
     117,   356,     0,     0,     0,   118,   119,   120,   121,     0,
       0,    35,    36,    69,     1,     0,   301,     0,     0,     0,
       0,    71,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   532,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    69,     1,     0,   380,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   381,     0,   382,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    69,     1,     0,   172,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   692,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    69,     0,   102,   301,     1,   103,   104,
     105,    71,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -284,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   108,   109,   110,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   111,   112,     0,     0,
       0,     0,     0,   113,    35,    36,   114,     0,     0,   115,
       0,   116,   117,     0,     0,     0,     0,   118,   119,   120,
     121,   102,     0,     1,   103,   104,   105,     0,   106,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   108,   109,   110,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   111,   112,     0,     0,     0,     0,     0,   113,
      35,    36,   114,     0,     0,   115,   246,   116,   117,     0,
       0,     0,     0,   118,   119,   120,   121,   102,     0,     1,
     103,   104,   105,     0,   106,   107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   108,   109,   110,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   111,   112,
       0,     0,     0,     0,     0,   113,    35,    36,   114,     0,
       0,   236,   246,   116,   117,     0,     0,     0,     0,   118,
     119,   120,   121,   102,     0,     1,   103,   104,   105,     0,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,   102,
       0,     1,   103,   104,   105,     0,   106,   107,    26,     0,
       0,     0,     0,   108,   109,   110,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     2,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   111,   112,     0,     0,     0,     0,
       0,   113,    35,    36,   368,     0,     0,   369,   246,   116,
     117,     0,     0,     0,     0,   118,   119,   120,   121,   108,
     109,   110,   102,     0,     1,   103,   104,   105,     0,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     111,   112,     0,     0,     0,     0,     0,   113,     0,     0,
     114,     0,     0,   115,     0,   116,   117,     0,     0,   168,
       0,   118,   119,   120,   121,     0,     0,     0,   102,     0,
       1,   103,   104,   105,     0,   106,   107,     0,     0,     0,
       0,     0,   108,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   102,     2,     1,   103,   104,   105,
       0,   106,   107,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,   112,     0,     0,     0,     0,     0,
     113,     2,     0,   114,     0,     0,   115,     0,   116,   117,
       0,     0,   322,     0,   118,   119,   120,   121,   108,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     102,     0,     1,   103,   104,   105,     0,   106,   107,     0,
       0,     0,     0,     0,   108,   109,   110,     0,     0,   111,
     112,     0,     0,     0,     0,     0,   113,     2,     0,   114,
       0,     0,   115,     0,   116,   117,     0,     0,   325,     0,
     118,   119,   120,   121,     0,   111,   112,     0,     0,     0,
       0,     0,   113,     0,     0,   114,     0,     0,   115,   246,
     116,   117,     0,     0,     0,     0,   118,   119,   120,   121,
     108,   109,   110,   102,     0,     1,   103,   104,   105,     0,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   102,     0,     1,   103,   104,   105,     0,   106,   107,
       2,   111,   112,     0,     0,     0,     0,     0,   113,     0,
       0,   114,     0,     0,   115,   758,   116,   117,     2,     0,
       0,     0,   118,   119,   120,   121,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   108,   109,   110,     0,     0,     0,   102,
       0,     1,   103,   104,   105,     0,   106,   107,     0,     0,
       0,   108,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   111,   112,     2,     0,     0,     0,
       0,   113,     0,     0,   114,     0,     0,   115,   837,   116,
     117,     0,   111,   112,     0,   118,   119,   120,   121,   113,
       0,     0,   114,     0,     0,   115,     0,   116,   117,     0,
       0,     0,     0,   118,   119,   120,   121,     0,     0,   108,
     109,   110,   102,     0,     1,   103,   104,   105,     0,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     102,     0,     1,   103,   104,   105,     0,   106,   107,     2,
     111,   112,     0,     0,     0,     0,     0,   113,     0,     0,
     114,     0,     0,   231,     0,   116,   117,     2,     0,     0,
       0,   118,   119,   120,   121,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   108,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     108,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,   112,     0,     0,     0,     0,     0,
     113,     0,     0,   114,     0,     0,   236,     0,   116,   117,
       0,   111,   112,     1,   118,   119,   120,   121,   113,     0,
       0,   114,     0,     0,   244,     0,   116,   117,     0,     0,
       0,     0,   118,   119,   120,   121,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    69,     0,     0,    70,     0,     0,     0,     0,
      71,     0,     0,    72,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    69,     0,
       0,    70,   161,     0,     0,     0,    71,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    69,     0,     0,   301,   161,     0,     0,     0,    71,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    69,     0,     0,   429,     0,     0,
       0,     0,   430,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    69,     0,     0,
     429,     0,     0,     0,     0,   442,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      69,     0,     0,   301,     0,     0,     0,     0,    71,     2,
       3,     4,     5,     6,     7,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,    18,    19,   350,   351,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   353,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   354,     0,   355,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
       0,   356,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    69,     0,     0,   429,     0,     0,     0,
       0,   618,     2,     3,     4,     5,     6,     7,   340,   341,
     342,   343,   344,   345,   346,   347,   348,   349,    18,    19,
     350,   351,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     353,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   354,
       0,   355,     0,     0,     0,     1,     0,     0,     0,     0,
       0,     0,     0,     0,   356,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    69,     0,     0,   429,
       2,     0,     0,     0,   628,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    69,     0,     0,   301,     0,     0,
       0,     0,    71,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      25,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    69,     0,     0,
     429,   608,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     1,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,     0,     0,     0,     0,
     186,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    25,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     1,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,     0,     0,     0,     0,   320,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,     0,     0,     0,     0,   722,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    69,     0,     0,   172,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,     0,     0,     0,   542,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,   514,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    25,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     1,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,     0,
       2,     3,     4,     5,     6,     7,   340,   341,   342,   343,
     344,   345,   346,   347,   348,   349,    18,    19,   350,   351,
      22,    23,   352,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   353,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,     0,     0,     0,   354,     0,   355,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   356,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,     0,     2,     3,     4,     5,     6,
       7,   340,   341,   342,   343,   344,   345,   346,   347,   348,
     349,    18,    19,   350,   351,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   353,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,     0,
       0,     0,   354,     0,   355,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   356,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36
};

static const yytype_int16 yycheck[] =
{
       0,    43,   257,    85,   261,   117,   129,   379,     0,   373,
     194,   242,   195,   194,    17,   339,     3,    88,   275,   194,
      43,   373,   122,   206,    24,     3,   194,   531,    76,     3,
      72,     3,   431,     3,   811,   434,   136,     3,    62,     3,
      88,     3,    42,    43,    70,     3,   115,    24,   683,    69,
      64,     3,    69,     3,    54,    70,    28,     3,     3,    59,
     241,     3,   243,    63,    64,    70,   241,   113,   243,   113,
      70,    70,    72,    69,    74,   115,    76,    54,    28,   122,
     857,   112,    28,    28,    69,    85,    69,    70,    88,   135,
      90,   135,   122,   136,    94,   113,   127,   128,   132,   181,
     100,   101,    74,    75,   134,   176,     3,    79,   108,   180,
     136,   111,   122,   617,    62,     3,   136,    94,   115,   136,
     134,   136,   132,   123,    43,   112,   113,   762,   131,   152,
     121,   136,   180,   122,   112,   113,     0,   136,   110,   111,
     136,   115,   112,   113,   135,   134,   133,   147,   135,   149,
     116,   136,   152,   136,   277,   278,   279,   135,   106,   107,
     135,   208,   162,   135,   116,   135,   670,   115,     0,   426,
     132,   135,   172,   135,   174,   359,   176,   135,   359,    90,
     180,   181,     3,   366,   359,   135,     3,   187,   121,   135,
     190,   359,   135,   135,   194,   195,   196,   197,   429,   563,
     564,   525,   135,   458,   204,   436,   206,   207,   208,   124,
     125,   563,   115,   444,   613,   112,   216,   194,   115,   115,
     220,   221,   222,   727,   112,   113,   249,   227,     1,   115,
       3,   231,    64,   152,   120,    11,    79,   261,    70,   239,
     240,   241,   242,   243,   244,   122,   317,   112,   196,   249,
     115,   275,   436,    85,   302,   436,   304,   134,   258,   136,
     444,   436,   262,   444,   241,   637,   243,   110,   111,   444,
     122,   285,   286,   114,   288,   135,   108,   133,   122,   111,
     463,   122,   134,   231,    12,    13,   300,   206,   236,   132,
     134,   305,   136,   196,   308,   112,   244,   208,   115,   300,
     300,   301,   121,   120,   305,   305,   122,   122,   308,   220,
     221,   222,   231,   261,   314,   263,   135,   317,   134,   134,
     575,   240,   314,   242,     3,   244,   115,   275,     5,   122,
     330,   120,   455,   236,   698,   114,   359,     3,   114,   112,
     113,   134,   112,   122,   456,   115,   122,   429,   296,   181,
     120,   116,   352,   114,   401,   135,   403,   122,   405,   359,
     263,   122,    28,   195,   364,   197,   366,     3,   114,   369,
     370,   371,   115,   373,   300,   352,   122,   120,    44,   305,
     380,   123,   359,   383,   384,   113,   114,   364,    69,    70,
     390,   129,   392,   296,   417,    74,    75,   397,   116,   656,
      79,   401,   426,   403,   122,   405,   406,   407,    74,    75,
     410,   130,   412,    16,   105,   415,   116,   417,   220,   221,
     222,   369,   113,   423,   448,   373,   116,   427,   116,   429,
     133,   110,   111,   116,   122,   122,   436,    95,    74,    75,
       7,     8,     9,    79,   444,   105,   116,   366,   121,   449,
     116,   109,   371,   113,   112,   136,   135,   116,     1,   436,
       3,   135,   510,   463,   116,   116,   369,   444,   300,   301,
     122,   122,   134,   305,   110,   111,   308,   116,   426,   115,
     428,   134,   314,   122,   507,   116,   135,     7,     8,     9,
     401,   122,   403,   135,   405,   406,   407,   116,   417,   410,
     448,   412,   116,   122,   116,   529,   119,   507,   122,    69,
      70,   133,   767,    69,    70,     3,   116,   531,   560,   121,
     116,     7,     8,     9,   182,   428,   122,   185,    10,    11,
     530,   531,   614,     7,     8,     9,   121,   537,    43,   539,
     116,   541,   115,   590,   115,   592,   593,   594,   115,   549,
     115,   551,   119,   120,     3,   555,   113,   557,    14,    15,
     560,   136,   539,   563,   564,    70,   133,    72,   226,   112,
     113,    76,   116,   116,   116,   523,   136,   577,   578,   122,
     136,   529,   582,    88,   134,   135,    74,    75,   507,   115,
     590,    79,   592,   593,   594,   115,   120,   429,   115,   119,
     120,   549,   113,   617,   406,   407,   554,   120,   410,   116,
     412,   121,   122,   133,   614,   563,   564,   617,   121,   122,
     523,   116,   110,   111,   112,    74,    75,   115,   132,   115,
      79,   116,   656,   119,   120,   280,   281,   136,   638,     3,
     136,   115,   282,   283,   132,   119,   120,   116,     3,   100,
     101,   554,    74,    75,   289,   290,   670,    79,   115,   134,
     115,   110,   111,   112,    28,   665,   115,   172,   115,   174,
     670,   176,   115,    28,   134,   180,   134,     3,   678,   590,
      44,   592,   593,   594,   136,   190,   116,   116,   110,   111,
     690,   196,   113,   693,   116,   121,     0,   120,   698,   531,
     120,   206,    28,   121,   136,   116,   706,   116,   656,   709,
      74,    75,    56,   727,   120,     1,   135,     3,    44,    74,
      75,   134,   132,   381,    79,   133,   768,   727,   132,   136,
     678,   679,   680,   681,   116,   683,   121,   121,   121,    43,
     121,   115,   690,   121,   121,   134,   770,    64,    74,    75,
     698,    54,   113,   291,   754,   110,   111,   136,   758,    63,
      64,   761,   426,   136,   136,   136,    70,    71,   768,   136,
     136,   136,   430,   773,   774,   134,   679,   680,   681,   136,
     136,    85,   614,   292,   442,   617,    90,   811,    74,    75,
     116,   293,   768,    79,   294,   243,   122,   295,   389,   799,
     800,   395,   802,   578,   108,   805,   754,   111,   463,   244,
     758,   115,   317,   761,   762,   308,   563,   647,    -1,   476,
     476,    -1,   770,    -1,   110,   111,   112,   113,   227,   115,
     116,    -1,   476,   857,   120,    74,    75,   837,   670,    -1,
      79,    -1,     1,    -1,     3,     4,     5,    -1,   152,    -1,
      -1,   799,   800,   853,   802,   803,   856,   805,   806,     3,
      -1,    43,    -1,   811,   369,    -1,    44,    45,    -1,    28,
      -1,   110,   111,    -1,    -1,   380,    -1,   181,   182,   384,
      -1,   185,    -1,    -1,    -1,   390,   544,    -1,    70,   837,
      72,   195,    -1,   197,    76,   727,    74,    75,    -1,    -1,
     803,    79,   206,   806,   208,   853,    88,    -1,   856,   857,
      -1,    -1,    71,    72,    74,    75,   220,   221,   222,    79,
      -1,    -1,   580,    -1,    -1,    -1,    -1,   231,    -1,    -1,
      74,    75,   110,   111,   112,    79,   240,    -1,   242,    -1,
     244,     3,    -1,   102,   103,   249,    -1,    -1,    -1,    -1,
     110,   111,   256,   257,    -1,    -1,   115,   615,   463,   118,
     618,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,   627,
     628,   115,    -1,   133,    -1,    -1,   120,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
     172,    -1,   174,    -1,   176,    -1,   300,   301,   180,    -1,
      43,   305,    -1,    -1,   308,    -1,    -1,    -1,   190,    -1,
     314,    54,    74,    75,   196,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   207,    -1,    70,    -1,    72,
      -1,    -1,    -1,    -1,   216,    -1,   541,    -1,    -1,    -1,
      83,   549,    -1,    -1,    -1,    88,    -1,    90,   110,   111,
     112,    -1,    -1,   115,   116,   560,   564,    -1,    -1,    -1,
      -1,    -1,   366,    -1,    -1,   369,    -1,   371,    -1,   373,
     728,    -1,   577,   578,   732,    -1,    -1,   582,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   133,    -1,    -1,    -1,    -1,   401,    -1,   403,
      -1,   405,   406,   407,    -1,    -1,   410,   765,   412,   152,
      -1,    -1,    43,   417,    -1,    -1,    -1,    -1,   776,    -1,
      -1,   164,    -1,    -1,    -1,   429,    -1,    -1,    -1,   172,
      -1,    -1,   175,   176,    -1,   317,    -1,   180,    69,    70,
      -1,    72,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    -1,   195,   196,   458,    -1,    -1,    -1,    -1,   463,
      -1,    -1,    -1,   206,    -1,   208,    -1,    -1,    -1,    -1,
     678,    -1,   476,   216,    -1,    -1,    -1,   220,   221,   222,
      -1,    -1,   690,    -1,    -1,    -1,    -1,   369,    -1,    -1,
     698,    -1,    -1,    -1,    -1,    -1,    -1,   240,   380,   242,
      -1,   706,   384,   507,   709,    -1,   249,    -1,   390,    90,
     392,    -1,    -1,    -1,    -1,   397,    -1,    -1,    -1,    -1,
      -1,   152,    -1,    -1,    -1,    -1,   530,   531,   159,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   172,    43,   174,    -1,    -1,   754,    -1,    -1,    -1,
     758,    -1,    -1,   761,    -1,    -1,   560,    -1,   301,   563,
     564,    -1,    -1,   768,    -1,   196,    -1,    -1,   773,   774,
      -1,   575,    -1,    -1,   317,   206,   207,    -1,    -1,    -1,
      -1,    43,    -1,    -1,    -1,    -1,   590,    -1,   592,   593,
     594,   799,   800,    -1,   802,    -1,    -1,   805,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,   240,
     614,   242,    -1,   617,   115,    -1,   359,    -1,   249,    -1,
      -1,   364,    -1,   366,    -1,    -1,   369,   208,    -1,   837,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   380,    -1,   220,
     221,   222,    -1,    -1,    -1,   853,    -1,   390,   856,    -1,
      -1,   152,    -1,   115,    -1,    -1,    -1,    -1,   401,   541,
     403,    -1,   405,   406,   407,    -1,   670,   410,    -1,   412,
     301,   302,    -1,    -1,   417,   256,   257,    -1,   560,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   429,    -1,    -1,    -1,
     152,    -1,    -1,   436,   698,   577,    -1,   159,    -1,    -1,
     582,   444,    -1,    -1,    -1,   206,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     463,    -1,    -1,   727,    -1,    43,    -1,    -1,   359,    -1,
     231,    -1,   194,    -1,    -1,    -1,    -1,   368,   369,   240,
     241,   242,   243,   244,   206,    -1,    -1,    -1,   249,   380,
      -1,    -1,    -1,   384,    -1,   256,   257,    -1,    -1,    -1,
      -1,    -1,    -1,   767,   507,    -1,    -1,    -1,    -1,   231,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   240,   241,
     242,   243,   244,    -1,    -1,    -1,   417,   249,    -1,    43,
      -1,    -1,    -1,    -1,   256,   257,    -1,   115,   429,    -1,
     431,    -1,    -1,    -1,    -1,   436,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   444,   395,    -1,    -1,   560,    -1,    -1,
     401,    -1,   403,    -1,   405,   406,   407,    -1,    -1,   410,
      -1,   412,   463,    -1,   152,   578,    43,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   590,    -1,   592,
     593,   594,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   366,    -1,    -1,   369,    -1,
     371,    -1,   373,    -1,    -1,    -1,   507,   458,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   768,    -1,   206,    -1,
      -1,    -1,    -1,    -1,    -1,   476,    -1,   359,   152,    -1,
      -1,    -1,    -1,    -1,   366,    -1,   368,   369,   115,   371,
     541,   373,    -1,   231,    -1,    -1,   417,    -1,    -1,    -1,
      -1,    -1,   240,   241,   242,   243,   244,    -1,    -1,   560,
      71,   249,    -1,    -1,    -1,   436,    -1,    -1,   256,   257,
     194,    -1,    -1,   444,    -1,   152,    -1,   578,    -1,    -1,
      -1,    -1,   206,   696,    95,   417,     1,   458,     3,     4,
       5,     6,   463,     8,     9,    -1,   709,    -1,   109,    -1,
      -1,   112,    -1,    -1,   436,   476,    -1,    -1,   200,   201,
     202,   203,   444,    28,    -1,    -1,   240,   241,   242,   243,
      -1,    -1,    -1,    -1,   575,    -1,   458,    -1,    -1,   206,
      -1,   463,   256,   257,    -1,    -1,   507,    -1,    -1,   590,
      -1,   592,   593,   594,   476,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   231,   768,    71,    72,    73,    -1,
      -1,    -1,    -1,   240,    -1,   242,    -1,   244,    -1,    -1,
      -1,   182,   249,    -1,   185,   507,    -1,    -1,   366,   256,
     257,   369,    -1,   371,    -1,   373,    -1,   102,   103,   560,
      -1,    -1,   563,   564,   109,    -1,   647,   112,    -1,    -1,
     115,    -1,   117,   118,   575,   706,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,   226,    -1,    -1,    -1,    -1,
     135,   136,    -1,    -1,    -1,    -1,    -1,    -1,   560,   417,
      -1,   563,   564,    -1,    -1,   359,    -1,    -1,    -1,    -1,
      -1,    -1,   366,   575,    -1,   256,   257,   371,   436,   373,
      -1,    -1,    -1,    -1,    -1,    -1,   444,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   768,    -1,    -1,
     458,    -1,    -1,    -1,    -1,   463,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   476,   366,
      -1,    -1,   369,    -1,   371,    -1,   373,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   436,    -1,    -1,    -1,   767,    -1,    -1,   507,
     444,    -1,    -1,    -1,    -1,    -1,    -1,   698,    -1,    -1,
      -1,    -1,    -1,    -1,   458,    -1,    -1,    -1,    -1,   463,
     417,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   476,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,   698,    -1,   379,    -1,
     381,    -1,   560,    -1,    -1,   563,   564,    -1,    -1,   471,
      -1,   458,    28,   507,    -1,    -1,   463,   575,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   767,    -1,    -1,   476,
      -1,    -1,    -1,    -1,    -1,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,   430,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
     507,   442,    -1,    -1,    -1,   767,   560,    -1,    -1,   563,
     564,    -1,    -1,    -1,    -1,    -1,    -1,   458,    -1,    -1,
      -1,   575,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,   476,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,   560,    -1,    -1,   563,   564,   134,   135,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   575,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     698,    -1,    -1,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   544,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,   575,    -1,    -1,    -1,    -1,   580,
      -1,    -1,    -1,    -1,   698,   667,   668,    -1,    66,   767,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,   615,    -1,    -1,   618,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,   627,   628,    -1,    -1,
      -1,   698,   110,   111,   112,    -1,   637,   115,    -1,   117,
     118,    -1,    -1,    -1,    -1,    -1,   647,    -1,    -1,    -1,
      -1,    -1,    -1,   767,    -1,    -1,   134,   658,   136,    -1,
      -1,    -1,    -1,    -1,    -1,   747,   748,    -1,   750,   751,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     767,    -1,    -1,    -1,   786,    -1,   788,    -1,    -1,    -1,
      -1,    -1,    -1,   795,   796,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   728,    -1,    -1,
      -1,   732,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     822,    -1,   824,    -1,   826,    -1,   828,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,   765,    -1,   767,   849,    -1,   851,
      -1,    -1,    -1,    -1,    -1,   776,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,   135,   136,     1,    -1,     3,     4,     5,
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
      -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,
     136,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,    -1,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,   135,   136,     1,    -1,     3,
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
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,
      -1,   115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     134,   135,   136,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,    -1,    -1,   115,    -1,   117,
     118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,   135,   136,     1,
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
     112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,   135,   136,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,
     136,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
     110,   111,   112,    -1,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,   135,   136,     1,    -1,     3,
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
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,
      -1,   115,    -1,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,     1,    -1,     3,     4,     5,    -1,    -1,
     134,   135,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,   117,
     118,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,   115,    -1,   117,   118,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    -1,   115,    -1,   117,   118,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      -1,   115,    -1,   117,   118,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     134,    -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,
      -1,   117,   118,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,   117,
     118,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,   115,    -1,   117,   118,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    -1,   115,    -1,   117,   118,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      -1,   115,    -1,   117,   118,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     134,    -1,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,
      -1,   117,   118,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,   117,
     118,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,     1,    87,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,    28,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,   135,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,   116,   117,   118,    28,    -1,    -1,    -1,   123,   124,
     125,   126,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
     135,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    71,    72,    73,
     109,    -1,    28,   112,    -1,    -1,   115,   116,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   135,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,    -1,   117,   118,    71,    72,    73,    -1,   123,
     124,   125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,     1,    -1,     3,     4,     5,    -1,    -1,    -1,   135,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      28,    -1,    82,    83,    -1,    85,     1,    87,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    28,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    71,    72,    73,    -1,
      -1,   109,    28,    -1,   112,    -1,    -1,   115,   116,   117,
     118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,   116,   117,   118,    -1,    71,    72,    73,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,     3,    -1,   112,    -1,    -1,   115,
      28,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,   102,   103,    85,    -1,    87,    -1,
      -1,   109,   110,   111,   112,    -1,    -1,   115,   116,   117,
     118,   100,    -1,    -1,    -1,   123,   124,   125,   126,    -1,
      -1,   110,   111,   112,     3,    -1,   115,    -1,    -1,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   135,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,     3,    -1,   115,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   132,    -1,   134,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,     3,    -1,   115,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   134,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,     1,   115,     3,     4,     5,
       6,   120,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,    -1,    -1,   115,   116,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,
      -1,   115,   116,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    28,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,    -1,    -1,   115,   116,   117,
     118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,   121,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    28,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    28,    -1,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,   125,   126,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    28,    -1,   112,
      -1,    -1,   115,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,   125,   126,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,   116,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,   116,   117,   118,    28,    -1,
      -1,    -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    28,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,   116,   117,
     118,    -1,   102,   103,    -1,   123,   124,   125,   126,   109,
      -1,    -1,   112,    -1,    -1,   115,    -1,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,    -1,   117,   118,    28,    -1,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,   102,   103,     3,   123,   124,   125,   126,   109,    -1,
      -1,   112,    -1,    -1,   115,    -1,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,   115,    -1,    -1,    -1,    -1,
     120,    -1,    -1,   123,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      -1,   115,   116,    -1,    -1,    -1,   120,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,   115,   116,    -1,    -1,    -1,   120,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,    -1,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    -1,    -1,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    -1,   115,    -1,    -1,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,    -1,   115,    -1,    -1,    -1,
      -1,   120,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    87,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,
      28,    -1,    -1,    -1,   120,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,    -1,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,   116,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,    -1,    -1,    -1,    -1,
     116,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,    -1,    -1,    -1,    -1,   116,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,    -1,    -1,    -1,    -1,   116,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,    -1,    -1,   115,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,    -1,    -1,    -1,   115,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   138,   139,   140,
     141,   142,   147,   179,   180,   185,   186,   187,   191,   192,
     193,   194,   196,   197,   203,   211,   212,   230,   261,   135,
     142,   147,   115,   115,   113,     1,   112,   113,   147,   112,
     115,   120,   123,   138,   147,   185,   186,   193,   194,   196,
     212,   215,   217,   219,   220,   222,   223,   224,   227,   115,
     135,   141,   142,   147,   186,   132,     0,   147,   213,   214,
     135,   135,     1,     4,     5,     6,     8,     9,    71,    72,
      73,   102,   103,   109,   112,   115,   117,   118,   123,   124,
     125,   126,   140,   147,   148,   149,   150,   154,   155,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,   171,   248,   251,   140,   147,   140,   147,
     155,   161,   179,   198,   199,   200,   201,   202,   193,   226,
     227,   116,   147,   217,   219,   228,   229,   230,   121,   140,
     170,   174,   115,   147,   186,   219,   227,   215,   220,   223,
     227,   115,   120,   186,   115,   120,   116,   147,   228,   231,
     186,   215,   224,   115,    68,    78,   115,   117,   134,   136,
     143,   144,   145,   146,   147,   150,   179,   186,   204,   205,
     206,   207,   208,   220,   221,   223,   227,   250,   251,   253,
     135,   135,   135,   142,   147,   174,   133,   122,   136,   213,
     213,   115,   149,   152,   154,   156,   115,   155,   155,   147,
     179,   174,   179,   174,   115,   156,   116,   171,   173,   176,
     193,   194,   196,   212,   232,   248,   135,   135,     7,     8,
       9,   115,   119,   120,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   133,   172,   158,   112,   127,   128,
     124,   125,    10,    11,   161,    12,    13,   113,   114,    14,
      15,   123,   129,   130,    16,    17,   131,   116,   116,   116,
     133,   115,   186,   217,   227,   133,    11,   114,   122,   193,
     227,   116,   116,   116,   122,   121,   121,   227,   215,   224,
     116,   228,   121,   140,   174,   121,   140,   174,   116,   116,
     122,     3,    28,    44,    74,    75,   116,   188,   189,   190,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      46,    47,    50,    66,    85,    87,   100,   142,   147,   181,
     185,   193,   195,   197,   203,   211,   179,   221,   112,   115,
     147,   179,   135,   242,   243,   243,   243,   134,   243,   133,
     115,   132,   134,   147,   186,   209,   210,   220,   221,   225,
     227,   223,   227,   136,   208,   122,   134,   186,   223,   134,
     134,   204,   136,   204,   136,   204,   135,   135,   174,   214,
     134,   136,   134,   136,   138,   147,   155,   177,   193,   194,
     196,   212,   233,     7,     8,     9,   115,   119,   120,   115,
     120,   186,   216,   218,   227,   147,   182,   185,   193,   195,
     196,   212,   120,   218,   182,   155,   233,   116,   122,   147,
     193,   194,   196,   212,   217,   116,   119,   134,   135,   136,
     150,   151,   170,   178,   185,   193,   194,   196,   212,   235,
     252,   254,   255,   256,   257,   258,   259,   260,   136,   260,
     147,   116,   151,   153,   171,   147,   173,   151,   171,   158,
     158,   158,   159,   159,   160,   160,   161,   161,   161,   163,
     163,   164,   165,   166,   167,   168,   173,   179,   199,   200,
     227,   199,   200,   201,    51,   230,   116,   121,   121,   121,
     121,   147,   116,   115,   116,   122,   189,   142,   147,   115,
     115,   113,   135,   147,   185,   193,   195,   217,   147,   186,
     221,   186,   115,   136,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    77,   134,   147,   173,   175,
     178,   237,   238,   239,   240,   241,   243,   244,   245,   246,
     247,   249,   235,   116,   174,   135,   220,   227,   122,   134,
     132,   191,   186,   220,   223,   205,   223,   136,   136,   136,
     204,   136,   204,   204,   204,   116,   138,   193,   194,   196,
     212,   217,   116,   147,   116,   153,   147,   173,   116,   218,
     228,   174,   216,   227,   115,   120,   216,   113,   120,   147,
     185,   193,   195,   196,   212,   218,   174,   120,   120,   218,
     116,   116,   171,   158,   248,   136,   260,   133,   147,   185,
     193,   194,   196,   212,   221,   225,   243,   122,   134,   134,
     255,   257,   258,   136,   136,   116,   122,   121,   132,   217,
     173,   116,   189,   171,   140,   147,   202,    69,    70,   136,
     113,   135,   135,   147,   142,   147,   116,   174,   132,   115,
     115,   115,   237,   115,   147,   134,   134,   134,   173,   147,
     132,   134,   134,   147,   183,   184,   219,   175,   240,   175,
     237,   136,   134,   136,   260,   220,   186,   210,   220,   227,
     174,   220,   136,   136,   136,   136,   116,   121,   116,   116,
     121,   216,   116,   228,   174,   202,   174,   113,   120,   121,
     174,   174,   120,   136,   235,   256,   151,   171,   170,   116,
     116,   116,   116,   114,   243,   243,   202,    69,    70,   136,
      69,    70,   136,   135,   132,   237,   173,   173,   116,   173,
      56,   116,   244,   134,   134,   133,   237,   135,   122,   134,
     133,   136,   220,   227,   186,   220,   132,   116,   121,   114,
     121,   202,   174,   121,   121,   174,    70,   136,    69,   136,
     114,   243,   243,   243,   243,    69,    70,   136,   237,   116,
     116,   237,   116,   115,   237,   116,   244,   174,   136,   260,
     184,   135,   171,   234,   220,   220,   174,   114,   121,   121,
     243,   243,    70,   136,    69,   136,    70,   136,    69,   136,
     243,   243,   237,   237,   237,   173,   237,   116,   173,   134,
     136,   234,   236,   136,   136,   243,   243,   243,   243,    70,
     136,    69,   136,    64,   116,   237,   116,   122,   136,   136,
     136,   136,   136,   243,   243,   237,   134,   237,   136,   234,
     136,   136
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
#line 3700 "type.ec"
	break;
      case 140: /* "type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3709 "type.ec"
	break;
      case 141: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3718 "type.ec"
	break;
      case 142: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3727 "type.ec"
	break;
      case 143: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3736 "type.ec"
	break;
      case 144: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3745 "type.ec"
	break;
      case 145: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3754 "type.ec"
	break;
      case 146: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3763 "type.ec"
	break;
      case 147: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3772 "type.ec"
	break;
      case 148: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3781 "type.ec"
	break;
      case 150: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3790 "type.ec"
	break;
      case 153: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3799 "type.ec"
	break;
      case 155: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3808 "type.ec"
	break;
      case 158: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3817 "type.ec"
	break;
      case 159: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3826 "type.ec"
	break;
      case 160: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3835 "type.ec"
	break;
      case 161: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3844 "type.ec"
	break;
      case 163: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3853 "type.ec"
	break;
      case 164: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3862 "type.ec"
	break;
      case 165: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3871 "type.ec"
	break;
      case 166: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3880 "type.ec"
	break;
      case 167: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3889 "type.ec"
	break;
      case 168: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3898 "type.ec"
	break;
      case 169: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3907 "type.ec"
	break;
      case 170: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3916 "type.ec"
	break;
      case 171: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3925 "type.ec"
	break;
      case 173: /* "expression" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3934 "type.ec"
	break;
      case 174: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3943 "type.ec"
	break;
      case 175: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3952 "type.ec"
	break;
      case 176: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3961 "type.ec"
	break;
      case 177: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3970 "type.ec"
	break;
      case 178: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3979 "type.ec"
	break;
      case 179: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3988 "type.ec"
	break;
      case 183: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3997 "type.ec"
	break;
      case 184: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4006 "type.ec"
	break;
      case 185: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4015 "type.ec"
	break;
      case 186: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4024 "type.ec"
	break;
      case 188: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4033 "type.ec"
	break;
      case 189: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4042 "type.ec"
	break;
      case 190: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4051 "type.ec"
	break;
      case 191: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4060 "type.ec"
	break;
      case 192: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4069 "type.ec"
	break;
      case 193: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4078 "type.ec"
	break;
      case 194: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4087 "type.ec"
	break;
      case 195: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4096 "type.ec"
	break;
      case 196: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4105 "type.ec"
	break;
      case 197: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4114 "type.ec"
	break;
      case 198: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4123 "type.ec"
	break;
      case 199: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4132 "type.ec"
	break;
      case 200: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4141 "type.ec"
	break;
      case 201: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4150 "type.ec"
	break;
      case 204: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4159 "type.ec"
	break;
      case 205: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4168 "type.ec"
	break;
      case 206: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4177 "type.ec"
	break;
      case 207: /* "property" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4186 "type.ec"
	break;
      case 208: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4195 "type.ec"
	break;
      case 209: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4204 "type.ec"
	break;
      case 210: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4213 "type.ec"
	break;
      case 211: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4222 "type.ec"
	break;
      case 212: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4231 "type.ec"
	break;
      case 213: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4240 "type.ec"
	break;
      case 214: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4249 "type.ec"
	break;
      case 215: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4258 "type.ec"
	break;
      case 216: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4267 "type.ec"
	break;
      case 217: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4276 "type.ec"
	break;
      case 218: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4285 "type.ec"
	break;
      case 219: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4294 "type.ec"
	break;
      case 220: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4303 "type.ec"
	break;
      case 221: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4312 "type.ec"
	break;
      case 222: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4321 "type.ec"
	break;
      case 223: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4330 "type.ec"
	break;
      case 224: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4339 "type.ec"
	break;
      case 225: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4348 "type.ec"
	break;
      case 226: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4357 "type.ec"
	break;
      case 227: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4366 "type.ec"
	break;
      case 228: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4375 "type.ec"
	break;
      case 229: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4384 "type.ec"
	break;
      case 230: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4393 "type.ec"
	break;
      case 231: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4402 "type.ec"
	break;
      case 232: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4411 "type.ec"
	break;
      case 233: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4420 "type.ec"
	break;
      case 234: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4429 "type.ec"
	break;
      case 235: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4438 "type.ec"
	break;
      case 236: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4447 "type.ec"
	break;
      case 237: /* "statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4456 "type.ec"
	break;
      case 238: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4465 "type.ec"
	break;
      case 239: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4474 "type.ec"
	break;
      case 240: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4483 "type.ec"
	break;
      case 241: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4492 "type.ec"
	break;
      case 242: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4501 "type.ec"
	break;
      case 243: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4510 "type.ec"
	break;
      case 244: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4519 "type.ec"
	break;
      case 245: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4528 "type.ec"
	break;
      case 246: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4537 "type.ec"
	break;
      case 247: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4546 "type.ec"
	break;
      case 248: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4555 "type.ec"
	break;
      case 249: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4564 "type.ec"
	break;
      case 251: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4573 "type.ec"
	break;
      case 253: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4582 "type.ec"
	break;
      case 254: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4591 "type.ec"
	break;
      case 255: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4600 "type.ec"
	break;
      case 256: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4609 "type.ec"
	break;
      case 257: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4618 "type.ec"
	break;
      case 258: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4627 "type.ec"
	break;
      case 259: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4636 "type.ec"
	break;
      case 260: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4645 "type.ec"
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
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 783 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 787 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 788 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 789 "type.y"
    { (yyval.i) = __ATTRIB; ;}
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
#line 798 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 803 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 807 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
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
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 879 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 899 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 901 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 905 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 906 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 911 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 923 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 930 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 932 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 934 "type.y"
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

  case 294:

/* Line 1464 of yacc.c  */
#line 958 "type.y"
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

  case 295:

/* Line 1464 of yacc.c  */
#line 972 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 973 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 977 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 978 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 982 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 991 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 997 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 999 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1008 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1010 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1019 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1021 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1032 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1034 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1038 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1042 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1044 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1046 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1048 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1056 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1065 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1067 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1069 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1073 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1081 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1082 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1088 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1090 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1109 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1111 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1113 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1115 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1117 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1119 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1121 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1128 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1130 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1140 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1143 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1152 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1154 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1202 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1204 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1206 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1211 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1213 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1215 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1217 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1219 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1225 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1228 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1230 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1232 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1261 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1262 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1263 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1267 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1268 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1272 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1274 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1280 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1284 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1289 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1290 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1291 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1292 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1293 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1305 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1330 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1334 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1335 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1339 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1340 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1345 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1347 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1349 "type.y"
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

  case 430:

/* Line 1464 of yacc.c  */
#line 1365 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1367 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1389 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1391 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1405 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1407 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1409 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1413 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1414 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1418 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1419 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1422 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1426 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1427 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1428 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1432 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1437 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1463 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1465 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1466 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1467 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1471 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1472 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1473 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1474 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1475 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1479 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1484 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1486 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1491 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1493 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1518 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1520 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1522 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1524 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1529 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1531 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1535 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1537 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1539 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1541 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1543 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1549 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1551 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1560 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1566 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1573 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1577 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1578 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1579 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1580 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1581 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1582 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1587 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1588 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1592 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 505:

/* Line 1464 of yacc.c  */
#line 1593 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8369 "type.ec"
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
#line 1596 "type.y"


