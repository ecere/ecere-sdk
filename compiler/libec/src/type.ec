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
#define YYFINAL  103
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8189

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  498
/* YYNRULES -- Number of states.  */
#define YYNSTATES  849

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
     663,   670,   676,   678,   680,   682,   684,   686,   688,   690,
     692,   694,   696,   698,   700,   702,   704,   706,   708,   710,
     712,   714,   716,   718,   723,   728,   730,   732,   734,   736,
     738,   740,   742,   744,   746,   748,   750,   752,   754,   756,
     758,   760,   765,   770,   772,   778,   783,   788,   792,   798,
     801,   804,   806,   809,   811,   813,   815,   817,   821,   825,
     829,   833,   835,   839,   841,   843,   845,   848,   852,   854,
     858,   868,   878,   886,   894,   900,   911,   922,   931,   940,
     947,   956,   965,   972,   979,   984,   994,  1004,  1012,  1020,
    1026,  1030,  1033,  1036,  1039,  1041,  1044,  1046,  1048,  1050,
    1054,  1056,  1059,  1062,  1066,  1072,  1075,  1078,  1083,  1089,
    1097,  1105,  1111,  1113,  1117,  1119,  1123,  1127,  1130,  1134,
    1138,  1142,  1147,  1152,  1155,  1159,  1163,  1168,  1172,  1175,
    1179,  1183,  1188,  1190,  1192,  1195,  1198,  1201,  1205,  1207,
    1209,  1212,  1215,  1218,  1222,  1224,  1227,  1231,  1234,  1236,
    1240,  1245,  1249,  1254,  1256,  1259,  1262,  1266,  1270,  1273,
    1277,  1281,  1284,  1286,  1288,  1291,  1294,  1296,  1299,  1302,
    1306,  1310,  1312,  1315,  1317,  1320,  1323,  1327,  1329,  1333,
    1335,  1339,  1342,  1345,  1347,  1349,  1351,  1354,  1357,  1361,
    1363,  1366,  1368,  1371,  1374,  1376,  1380,  1382,  1385,  1387,
    1390,  1392,  1396,  1401,  1403,  1405,  1407,  1411,  1413,  1415,
    1417,  1419,  1421,  1423,  1427,  1432,  1436,  1438,  1441,  1443,
    1446,  1449,  1451,  1453,  1456,  1458,  1461,  1465,  1467,  1470,
    1476,  1484,  1490,  1496,  1504,  1511,  1519,  1524,  1530,  1535,
    1539,  1542,  1545,  1548,  1552,  1554,  1560,  1565,  1571,  1576,
    1581,  1585,  1590,  1594,  1598,  1601,  1604,  1607,  1610,  1613,
    1616,  1619,  1622,  1625,  1629,  1631,  1633,  1637,  1640,  1642,
    1644,  1647,  1650,  1652,  1655,  1657,  1659,  1662,  1664
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
     190,   189,    -1,   187,   115,   115,   190,   116,   116,    -1,
     187,   115,   115,   116,   116,    -1,    75,    -1,   186,    -1,
      44,    -1,    45,    -1,   192,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
      85,    -1,   197,    -1,   211,    -1,   140,    -1,   100,   115,
     140,   116,    -1,   100,   115,   147,   116,    -1,    66,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,   197,    -1,   211,    -1,   142,    -1,
     100,   115,   140,   116,    -1,   100,   115,   147,   116,    -1,
      66,    -1,   203,   147,   135,   204,   136,    -1,   203,   135,
     204,   136,    -1,   203,   147,   135,   136,    -1,   203,   135,
     136,    -1,   203,   141,   135,   204,   136,    -1,   203,   147,
      -1,   203,   142,    -1,   178,    -1,   178,   217,    -1,   198,
      -1,   161,    -1,   200,    -1,   199,    -1,   147,   133,   200,
      -1,   147,   133,   199,    -1,   198,   133,   200,    -1,   198,
     133,   199,    -1,   201,    -1,   202,   122,   201,    -1,    48,
      -1,    49,    -1,   208,    -1,   204,   208,    -1,   150,   133,
     235,    -1,   205,    -1,   206,   122,   205,    -1,    68,   181,
     147,   135,    69,   243,    70,   243,   136,    -1,    68,   181,
     147,   135,    70,   243,    69,   243,   136,    -1,    68,   181,
     147,   135,    69,   243,   136,    -1,    68,   181,   147,   135,
      70,   243,   136,    -1,    68,   181,   147,   135,   136,    -1,
      68,   181,   217,   147,   135,    69,   243,    70,   243,   136,
      -1,    68,   181,   217,   147,   135,    70,   243,    69,   243,
     136,    -1,    68,   181,   217,   147,   135,    69,   243,   136,
      -1,    68,   181,   217,   147,   135,    70,   243,   136,    -1,
      68,   181,   217,   147,   135,   136,    -1,    68,   181,   135,
      69,   243,    70,   243,   136,    -1,    68,   181,   135,    70,
     243,    69,   243,   136,    -1,    68,   181,   135,    69,   243,
     136,    -1,    68,   181,   135,    70,   243,   136,    -1,    68,
     181,   135,   136,    -1,    68,   181,   217,   135,    69,   243,
      70,   243,   136,    -1,    68,   181,   217,   135,    70,   243,
      69,   243,   136,    -1,    68,   181,   217,   135,    69,   243,
     136,    -1,    68,   181,   217,   135,    70,   243,   136,    -1,
      68,   181,   217,   135,   136,    -1,   179,   209,   134,    -1,
     179,   134,    -1,   251,   134,    -1,   250,   134,    -1,   253,
      -1,   206,   134,    -1,   207,    -1,   134,    -1,   210,    -1,
     209,   122,   210,    -1,   225,    -1,   225,   191,    -1,   132,
     174,    -1,   225,   132,   174,    -1,   225,   132,   174,   132,
     174,    -1,    50,   147,    -1,    50,   142,    -1,    50,   135,
     213,   136,    -1,    50,   147,   135,   213,   136,    -1,    50,
     147,   135,   213,   134,   204,   136,    -1,    50,   142,   135,
     213,   134,   204,   136,    -1,    50,   142,   135,   213,   136,
      -1,   214,    -1,   213,   122,   214,    -1,   147,    -1,   147,
     133,   174,    -1,   115,   217,   116,    -1,   120,   121,    -1,
     120,   174,   121,    -1,   120,   140,   121,    -1,   215,   120,
     121,    -1,   215,   120,   174,   121,    -1,   215,   120,   140,
     121,    -1,   115,   116,    -1,   115,   228,   116,    -1,   215,
     115,   116,    -1,   215,   115,   228,   116,    -1,   115,   218,
     116,    -1,   115,   116,    -1,   115,   228,   116,    -1,   216,
     115,   116,    -1,   216,   115,   228,   116,    -1,   227,    -1,
     215,    -1,   227,   215,    -1,   186,   227,    -1,   186,   215,
      -1,   186,   227,   215,    -1,   227,    -1,   216,    -1,   227,
     216,    -1,   186,   227,    -1,   186,   216,    -1,   186,   227,
     216,    -1,   224,    -1,   227,   224,    -1,   186,   227,   224,
      -1,   219,   186,    -1,   147,    -1,   115,   219,   116,    -1,
     220,   120,   174,   121,    -1,   220,   120,   121,    -1,   220,
     120,   140,   121,    -1,   223,    -1,   227,   223,    -1,   186,
     223,    -1,   186,   227,   223,    -1,   227,   186,   223,    -1,
     220,   115,    -1,   222,   228,   116,    -1,   222,   231,   116,
      -1,   222,   116,    -1,   223,    -1,   220,    -1,   186,   223,
      -1,   186,   220,    -1,   220,    -1,   227,   220,    -1,   186,
     220,    -1,   186,   227,   220,    -1,   227,   186,   220,    -1,
     193,    -1,   226,   193,    -1,   112,    -1,   112,   226,    -1,
     112,   227,    -1,   112,   226,   227,    -1,   229,    -1,   229,
     122,    51,    -1,   230,    -1,   229,   122,   230,    -1,   179,
     219,    -1,   179,   217,    -1,   180,    -1,    65,    -1,    82,
      -1,    82,   123,    -1,    82,   219,    -1,    82,   123,   219,
      -1,    83,    -1,    83,   219,    -1,     1,    -1,     1,   219,
      -1,     1,   217,    -1,   147,    -1,   231,   122,   147,    -1,
     176,    -1,   176,   217,    -1,   177,    -1,   177,   217,    -1,
     171,    -1,   135,   236,   136,    -1,   135,   236,   122,   136,
      -1,   170,    -1,   151,    -1,   234,    -1,   236,   122,   234,
      -1,   238,    -1,   243,    -1,   244,    -1,   245,    -1,   246,
      -1,   247,    -1,   147,   132,   237,    -1,    52,   174,   132,
     237,    -1,    53,   132,   237,    -1,   175,    -1,   239,   175,
      -1,   237,    -1,   240,   237,    -1,   240,   175,    -1,   240,
      -1,   239,    -1,   239,   240,    -1,   135,    -1,   135,   136,
      -1,   242,   241,   136,    -1,   134,    -1,   173,   134,    -1,
      54,   115,   173,   116,   237,    -1,    54,   115,   173,   116,
     237,    64,   237,    -1,    55,   115,   173,   116,   237,    -1,
      56,   115,   173,   116,   237,    -1,    57,   237,    56,   115,
     173,   116,   134,    -1,    58,   115,   244,   244,   116,   237,
      -1,    58,   115,   244,   244,   173,   116,   237,    -1,    56,
     115,   116,   237,    -1,    58,   115,   244,   116,   237,    -1,
      58,   115,   116,   237,    -1,    59,   147,   134,    -1,    60,
     134,    -1,    61,   134,    -1,    62,   134,    -1,    62,   173,
     134,    -1,     5,    -1,   178,   147,   135,   260,   136,    -1,
     178,   147,   135,   136,    -1,   179,   147,   135,   260,   136,
      -1,   179,   147,   135,   136,    -1,   140,   135,   260,   136,
      -1,   140,   135,   136,    -1,   147,   135,   260,   136,    -1,
     147,   135,   136,    -1,   135,   260,   136,    -1,   135,   136,
      -1,   143,   243,    -1,   146,   243,    -1,   146,   134,    -1,
     144,   243,    -1,   145,   243,    -1,   178,   221,    -1,   178,
     225,    -1,   254,   243,    -1,   150,   133,   235,    -1,   235,
      -1,   256,    -1,   257,   122,   256,    -1,   257,   134,    -1,
     258,    -1,   255,    -1,   259,   258,    -1,   259,   255,    -1,
     134,    -1,   259,   134,    -1,   259,    -1,   257,    -1,   259,
     257,    -1,   230,    -1,   230,   132,   174,    -1
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
     811,   812,   816,   817,   821,   822,   823,   828,   829,   830,
     831,   832,   833,   834,   835,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   850,   851,   852,   853,
     854,   855,   856,   857,   858,   859,   860,   861,   862,   863,
     864,   865,   866,   867,   872,   873,   874,   875,   876,   881,
     882,   887,   888,   893,   903,   907,   909,   910,   912,   913,
     937,   952,   953,   957,   958,   962,   963,   967,   971,   972,
     976,   978,   980,   982,   984,   987,   989,   991,   993,   995,
     998,  1000,  1002,  1004,  1006,  1009,  1011,  1013,  1015,  1017,
    1022,  1023,  1024,  1025,  1026,  1027,  1028,  1029,  1033,  1035,
    1040,  1042,  1044,  1046,  1048,  1053,  1054,  1058,  1060,  1061,
    1062,  1063,  1067,  1069,  1074,  1076,  1082,  1084,  1086,  1088,
    1090,  1092,  1094,  1096,  1098,  1100,  1102,  1107,  1109,  1111,
    1113,  1115,  1120,  1121,  1122,  1123,  1124,  1125,  1129,  1130,
    1131,  1132,  1133,  1134,  1180,  1181,  1183,  1185,  1190,  1192,
    1194,  1196,  1198,  1203,  1204,  1207,  1209,  1211,  1217,  1221,
    1223,  1225,  1230,  1231,  1232,  1234,  1239,  1240,  1241,  1242,
    1243,  1247,  1248,  1252,  1253,  1254,  1255,  1259,  1260,  1264,
    1265,  1269,  1270,  1271,  1282,  1284,  1286,  1288,  1290,  1292,
    1294,  1297,  1299,  1301,  1305,  1306,  1310,  1311,  1315,  1316,
    1320,  1322,  1324,  1340,  1342,  1364,  1366,  1371,  1372,  1373,
    1374,  1375,  1376,  1380,  1382,  1384,  1389,  1390,  1394,  1395,
    1398,  1402,  1403,  1404,  1408,  1412,  1420,  1425,  1426,  1430,
    1431,  1432,  1436,  1437,  1438,  1439,  1441,  1442,  1443,  1447,
    1448,  1449,  1450,  1451,  1455,  1459,  1461,  1466,  1468,  1493,
    1495,  1497,  1499,  1504,  1506,  1510,  1512,  1514,  1516,  1518,
    1524,  1526,  1531,  1536,  1537,  1541,  1543,  1548,  1553,  1554,
    1555,  1556,  1557,  1558,  1562,  1563,  1564,  1568,  1569
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
     191,   191,   192,   192,   193,   193,   193,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   196,   196,   196,   196,   196,   197,
     197,   198,   198,   199,   200,   201,   201,   201,   201,   201,
     201,   202,   202,   203,   203,   204,   204,   205,   206,   206,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   207,   207,   207,   207,   207,   207,
     208,   208,   208,   208,   208,   208,   208,   208,   209,   209,
     210,   210,   210,   210,   210,   211,   211,   212,   212,   212,
     212,   212,   213,   213,   214,   214,   215,   215,   215,   215,
     215,   215,   215,   215,   215,   215,   215,   216,   216,   216,
     216,   216,   217,   217,   217,   217,   217,   217,   218,   218,
     218,   218,   218,   218,   219,   219,   219,   219,   220,   220,
     220,   220,   220,   221,   221,   221,   221,   221,   222,   223,
     223,   223,   224,   224,   224,   224,   225,   225,   225,   225,
     225,   226,   226,   227,   227,   227,   227,   228,   228,   229,
     229,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230,   230,   231,   231,   232,   232,   233,   233,
     234,   234,   234,   235,   235,   236,   236,   237,   237,   237,
     237,   237,   237,   238,   238,   238,   239,   239,   240,   240,
     240,   241,   241,   241,   242,   243,   243,   244,   244,   245,
     245,   245,   246,   246,   246,   246,   246,   246,   246,   247,
     247,   247,   247,   247,   248,   249,   249,   250,   250,   251,
     251,   251,   251,   252,   252,   253,   253,   253,   253,   253,
     254,   254,   255,   256,   256,   257,   257,   258,   259,   259,
     259,   259,   259,   259,   260,   260,   260,   261,   261
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
       6,     5,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     4,     1,     5,     4,     4,     3,     5,     2,
       2,     1,     2,     1,     1,     1,     1,     3,     3,     3,
       3,     1,     3,     1,     1,     1,     2,     3,     1,     3,
       9,     9,     7,     7,     5,    10,    10,     8,     8,     6,
       8,     8,     6,     6,     4,     9,     9,     7,     7,     5,
       3,     2,     2,     2,     1,     2,     1,     1,     1,     3,
       1,     2,     2,     3,     5,     2,     2,     4,     5,     7,
       7,     5,     1,     3,     1,     3,     3,     2,     3,     3,
       3,     4,     4,     2,     3,     3,     4,     3,     2,     3,
       3,     4,     1,     1,     2,     2,     2,     3,     1,     1,
       2,     2,     2,     3,     1,     2,     3,     2,     1,     3,
       4,     3,     4,     1,     2,     2,     3,     3,     2,     3,
       3,     2,     1,     1,     2,     2,     1,     2,     2,     3,
       3,     1,     2,     1,     2,     2,     3,     1,     3,     1,
       3,     2,     2,     1,     1,     1,     2,     2,     3,     1,
       2,     1,     2,     2,     1,     3,     1,     2,     1,     2,
       1,     3,     4,     1,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     3,     4,     3,     1,     2,     1,     2,
       2,     1,     1,     2,     1,     2,     3,     1,     2,     5,
       7,     5,     5,     7,     6,     7,     4,     5,     4,     3,
       2,     2,     2,     3,     1,     5,     4,     5,     4,     4,
       3,     4,     3,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     3,     1,     1,     3,     2,     1,     1,
       2,     2,     1,     2,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,   411,    17,     7,   201,   202,   203,   204,   205,   228,
     229,   230,   231,   232,   234,   237,   238,   235,   236,   224,
     225,   227,   233,   283,   284,     0,   404,   245,   206,   222,
     208,   405,   409,   239,     0,   209,   210,   165,   172,   242,
       8,     5,     0,   171,   403,   159,   223,     0,   207,   226,
     161,   163,   167,   240,     0,   241,   169,   497,     0,   393,
       0,     0,   368,     0,   353,   413,   412,   383,     0,   382,
     364,   352,     0,   326,   325,     0,   406,     0,   407,     0,
     410,     0,     0,     4,     2,     3,     6,   166,   368,   160,
     223,   162,   164,   168,   170,   402,   401,     0,     0,     8,
     270,   269,     0,     1,   391,   394,   395,   343,     0,     0,
       0,     0,   397,   399,    35,    22,   464,     0,     0,     0,
       0,     0,    76,     0,     0,     0,    71,     0,    74,     0,
     337,    70,    72,    73,    75,     0,    20,    36,    18,    67,
      66,    77,     0,    79,    83,    86,    90,     0,    95,    98,
     100,   102,   104,   106,   108,   126,     0,    23,    21,   356,
     385,   384,   355,     0,     0,   367,   378,     0,   381,     0,
       0,     0,     0,   354,   365,   334,     0,   332,     0,     0,
     408,     0,     0,     0,   242,    20,   274,   271,   149,   151,
     153,   157,   273,   276,   275,   281,     0,   155,     0,     0,
       0,     0,     0,   317,   267,     0,     0,     0,     0,    20,
       0,     0,   223,     0,   288,     0,   316,   285,     0,    12,
     373,     0,     0,    21,   314,     0,     0,     0,   498,   392,
     396,   336,   369,   344,     0,     0,    45,    69,    68,    61,
       0,    57,    58,     0,     0,     0,     0,     0,     0,    64,
      26,    77,   110,   124,     0,   416,   131,   133,   137,   135,
       0,    24,   339,     0,     0,     0,    42,    43,     0,     0,
       0,    59,     0,     0,     0,     0,     0,     0,     0,    91,
       0,     0,    89,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   338,   357,   366,   345,     0,   340,     0,     0,
     371,     0,     0,   379,   380,     0,     0,     0,   327,     0,
       0,   243,   244,     0,     0,     0,   150,   223,   152,   154,
     158,   156,   272,   352,     0,    10,     9,     0,   211,   212,
     215,   214,   213,     0,   216,   218,     0,   247,   248,   249,
     250,   251,   253,   256,   257,   254,   255,   246,   252,     0,
     263,     0,   260,   179,     0,   173,   175,   177,   258,     0,
     259,     0,    16,    71,     0,    20,     0,   444,     0,   475,
     478,   479,   477,   476,     0,     0,     0,   311,   368,   223,
       0,   318,   386,    11,   320,     0,   375,     0,   265,   286,
       0,   315,     0,   374,   313,   312,     0,   266,     0,   398,
     400,   143,    20,     0,   418,   139,   141,   147,   145,     0,
       0,    51,    52,     0,     0,     0,     0,     0,   223,   359,
       0,   358,   193,     0,   183,   185,   187,   189,   191,     0,
       0,     0,     0,     0,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   113,     0,    19,     0,   132,   134,
     138,   136,   417,     0,     0,   492,     0,   470,    67,   424,
     423,     0,   484,    44,     0,   489,   485,   495,   488,     0,
       0,   472,     0,    41,    38,    54,     0,    53,    40,     0,
      80,    81,    82,    84,    85,    87,    88,    93,    94,    92,
      96,    97,    99,   101,   103,   105,   107,     0,   346,   342,
     341,   372,   370,   415,   335,   333,     0,   331,     0,   328,
     273,   278,   277,   355,   280,   279,   282,   221,     0,     0,
     219,   326,   325,     0,     0,     0,   180,   174,   176,   178,
       0,   269,    15,   223,     0,   445,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   447,    20,
       0,   436,     0,   438,   427,     0,     0,     0,   428,   429,
     430,   431,   432,     0,   287,    13,   322,     0,   388,     0,
       0,   310,     0,   321,     0,   387,   376,   289,   377,   268,
     264,    60,   144,   140,   142,   148,   146,   419,    62,    50,
      47,     0,    49,     0,   348,     0,     0,     0,   362,   361,
       0,     0,   360,     0,     0,   194,   184,   186,   188,   190,
     192,     0,     0,     0,     0,     0,    63,    65,   112,   111,
     125,    78,    25,   474,     0,     0,   368,   480,   481,   482,
       0,   487,   493,   491,   496,   490,   469,   471,    39,     0,
      37,     0,     0,     0,     0,   220,     0,     0,     0,     0,
       0,   304,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,   460,   461,   462,     0,     0,
       0,   448,   127,   368,     0,   197,   199,   437,     0,   440,
     439,   446,   129,   468,     0,   389,     0,   319,   386,     0,
     323,   390,    48,    46,   347,   349,    28,   363,   350,     0,
       0,     0,     0,     0,     0,    30,     0,     0,     0,   473,
     483,   486,    56,    55,   109,   330,   329,   217,   261,   262,
     181,     0,     0,     0,     0,     0,   294,     0,     0,   309,
       0,     0,   435,     0,     0,     0,     0,     0,     0,     0,
     459,   463,     0,   433,     0,     0,   128,     0,   467,   388,
       0,     0,   387,     0,   351,    27,   195,    32,     0,     0,
      29,    34,     0,     0,   302,     0,   303,   182,     0,     0,
       0,     0,     0,     0,   299,   434,     0,     0,   456,     0,
       0,   458,     0,     0,     0,   466,     0,   198,     0,   420,
     200,   389,   390,   324,   196,    31,    33,     0,     0,     0,
     292,     0,   293,     0,   307,     0,   308,     0,     0,   449,
     451,   452,     0,   457,     0,     0,   130,   465,   425,     0,
     300,   301,     0,     0,     0,     0,     0,   297,     0,   298,
       0,     0,   454,     0,     0,   421,   290,   291,   305,   306,
       0,     0,   450,   453,   455,   422,   426,   295,   296
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    37,    38,   227,    40,    41,   205,   206,   207,   208,
     136,   137,   138,   139,   459,   237,   476,   140,   141,   239,
     142,   143,   144,   145,   146,   147,   148,   149,   150,   151,
     152,   153,   154,   252,   253,   445,   550,   156,   679,   255,
     404,   187,   211,    44,   354,   423,   674,   675,    45,    46,
      47,   334,   335,   336,    48,    49,    50,    51,   426,    52,
      53,   192,   193,   194,   195,   196,    54,   213,   214,   215,
     216,   217,   380,   381,    55,    56,   176,   177,    64,   419,
     109,   420,   110,    67,   219,    68,    69,    70,   384,   105,
     221,   111,   112,   113,   171,   260,   409,   790,   462,   819,
     553,   554,   555,   556,   557,   368,   558,   559,   560,   561,
     562,   157,   563,   222,   158,   463,   224,   464,   465,   466,
     467,   468,   469,   470,    58
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -742
static const yytype_int16 yypact[] =
{
    7826,   310,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,    24,  -742,  -742,  -742,  -742,
    -742,   404,   692,  -742,   -94,  -742,  -742,  -742,  -742,  -742,
     -76,  -742,   104,  6603,  -742,  -742,  -742,   -59,  -742,  -742,
    -742,  -742,  -742,  -742,    36,  -742,  -742,   -14,   151,   680,
    6417,  5314,  -742,    15,   498,  -742,   485,   505,  7298,  -742,
    -742,   457,   172,    42,    62,   692,   692,   108,   485,   284,
     485,    82,  5447,  -742,  -742,  -742,  -742,  -742,   177,  -742,
      15,  -742,  -742,  -742,  -742,  -742,   485,   118,  3697,   -40,
    -742,   114,  6165,  -742,  -742,   680,  -742,  -742,   606,   163,
     683,   186,   184,  -742,  -742,  -742,  -742,  6183,  6241,  6241,
    7910,  6165,  -742,  7910,  6165,  6314,  -742,  5573,  -742,   323,
    -742,  -742,  -742,  -742,  -742,   -35,    41,  -742,  -742,   482,
    -742,  -742,  6165,  -742,   182,   128,   465,  6165,    28,   458,
     209,   206,   223,   344,    18,  -742,   218,  -742,  -742,   498,
     505,  -742,   457,  7387,  5881,  -742,  -742,  5954,  -742,   235,
     265,   376,    33,   498,  -742,   244,   -30,  -742,   172,   172,
     485,   284,   292,    27,   248,    25,   465,  6696,  -742,  -742,
    -742,  -742,   299,  -742,  -742,  -742,   117,  -742,   383,  7994,
    7565,  5095,  7910,  -742,  -742,   313,   313,   313,   386,     9,
     442,  5224,   108,  3815,  -742,   -10,  -742,  -742,   505,  -742,
    -742,   284,   311,   318,  -742,  4873,  3933,   248,  -742,  -742,
    -742,  -742,  -742,  -742,  7741,  5699,  -742,   496,  -742,  -742,
    6010,  -742,  -742,   177,  6789,  8078,  6882,  8078,  5699,  -742,
    -742,   975,  -742,  -742,   406,  7116,  -742,  -742,  -742,  -742,
     381,   390,  -742,  2891,  3027,   172,  -742,  -742,  4608,   172,
    6165,  -742,  6165,  6165,  6165,  6165,  6165,  6165,  6165,   465,
    6165,  6165,  -742,  6165,  6165,  6165,  6165,  6165,  6165,  6165,
    6165,  6165,  -742,   498,  -742,  -742,   421,  -742,   121,   427,
    -742,   183,   452,  -742,  -742,   172,  6165,   172,  -742,   307,
     476,  -742,  -742,  5447,  6510,   172,  -742,   420,  -742,  -742,
    -742,  -742,  -742,   514,  5447,  -742,  -742,  5447,  -742,  -742,
    -742,  -742,  -742,   463,   443,  -742,   437,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,    82,
    -742,   521,  -742,   538,  5114,  -742,  -742,  -742,  -742,    82,
    -742,  7565,  -742,   680,  5825,    35,  7653,   519,  4523,  -742,
    -742,  -742,  -742,  -742,  4699,   582,  6165,  -742,    19,   108,
      84,  -742,   505,  -742,   356,   284,  -742,    33,  -742,  -742,
     634,  -742,    33,  -742,  -742,  -742,  4051,  -742,  4169,  -742,
    -742,  -742,     9,   541,  7116,  -742,  -742,  -742,  -742,   548,
     172,  -742,  -742,  4664,   172,  6165,  7209,  6165,     4,   556,
     552,   560,   563,  6975,  -742,  -742,  -742,  -742,  -742,  6165,
     557,  7068,   565,   568,  -742,  -742,  -742,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,  4699,  -742,  6165,  -742,  -742,
    -742,  -742,  -742,  6165,   323,  -742,  3163,  -742,   461,  -742,
    -742,  7565,  -742,  -742,   313,  -742,  -742,   174,  -742,  3299,
     543,  -742,   554,  -742,  -742,  -742,   422,  -742,  -742,   471,
    -742,  -742,  -742,   182,   182,   128,   128,   465,   465,   465,
      28,    28,   458,   209,   206,   223,   344,   283,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,  -742,  4873,  -742,  4873,  -742,
    -742,  -742,  -742,   514,  -742,  -742,  -742,  -742,  6165,   572,
    -742,  -742,  -742,    82,  5447,   189,   -39,  -742,  -742,  -742,
      58,  -742,  -742,   108,   580,  -742,  6165,   569,   587,   592,
     594,  2312,   597,   172,   570,   581,  5007,   172,  -742,    56,
     200,  -742,  5334,  -742,  -742,  2483,  2619,   578,  -742,  -742,
    -742,  -742,  -742,   586,  -742,  -742,  -742,  3435,   505,    33,
     259,  -742,  6165,  -742,    33,   505,  -742,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,
    -742,   429,  -742,   483,  -742,   607,   611,   608,   556,   560,
    7476,  6165,   556,  5447,  6165,   615,  -742,  -742,  -742,  -742,
    -742,   610,   613,  6165,  6165,   619,  -742,  -742,  -742,  -742,
    -742,  -742,  -742,  -742,   604,  4699,   172,  -742,  -742,  -742,
    4699,  -742,  -742,  -742,   174,  -742,  -742,  -742,  -742,  4699,
    -742,  6165,  4287,  4405,   444,  -742,   625,    99,   159,   313,
     313,  -742,  5447,   261,   267,   609,  -742,   626,  2312,  6165,
    6165,  6036,   686,  4925,   627,  -742,  -742,  -742,   233,   630,
    2312,  -742,  -742,    59,   266,  -742,   385,  -742,  2755,  -742,
    -742,  -742,  -742,  -742,   628,   505,   108,  -742,   645,   284,
     637,   505,  -742,  -742,  -742,  -742,  -742,   556,  -742,   654,
     651,   295,   652,  5447,  6165,  -742,   653,   657,  6165,  -742,
    -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,  -742,
    -742,    21,   -19,   304,   313,   313,  -742,   313,   313,  -742,
     303,  2312,  -742,   462,   492,  2312,   501,   660,  2312,  4958,
    -742,  -742,  6165,  -742,  3571,   692,  -742,  4747,  -742,   645,
      33,    33,   645,  6165,  -742,  -742,  -742,  -742,   320,   663,
    -742,  -742,   665,   313,  -742,   313,  -742,  -742,   140,   -11,
     144,     1,   313,   313,  -742,  -742,  2312,  2312,  -742,  2312,
    6165,  -742,  2312,  6092,   647,  -742,   659,  -742,  4747,  -742,
    -742,   645,   645,  -742,  -742,  -742,  -742,   664,   669,   313,
    -742,   313,  -742,   313,  -742,   313,  -742,   167,    11,   724,
    -742,  -742,   506,  -742,  2312,   511,  -742,  -742,  -742,   176,
    -742,  -742,   670,   672,   674,   675,   313,  -742,   313,  -742,
    2312,   655,  -742,  2312,  1031,  -742,  -742,  -742,  -742,  -742,
     676,   677,  -742,  -742,  -742,  -742,  -742,  -742,  -742
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -742,    40,  -742,   419,   742,    79,  -742,  -742,  -742,  -742,
       0,  -742,   360,    57,  -249,  -742,   403,   369,   830,   693,
    -742,  -134,   365,   371,   -53,  -742,   375,   533,   535,   532,
     540,   534,  -742,  1698,  -263,  -742,   -72,   589,  -348,  -742,
    -742,  -215,    66,  -742,  -742,   584,  -742,    89,  1583,   766,
    -742,  -742,   491,  -742,   454,  -742,  1158,  1729,  -130,  1212,
    -146,    32,    69,   100,   509,  -500,  -188,  -211,   449,  -742,
    -742,  -206,  -742,   270,  -132,  1474,   490,   536,    -6,  -395,
       8,  -159,     2,  1420,  -194,  -742,  2001,   161,   387,  -742,
     855,   -66,  -742,    16,  -742,  -742,   599,  -741,  -364,  -742,
      90,  -742,  -742,   294,  -742,  -742,  1416,  -574,  -742,  -742,
    -742,  -125,  -742,  -742,   -52,  -742,  -742,  -742,   382,   220,
     384,   388,  -742,  -251,  -742
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -495
static const yytype_int16 yytable[] =
{
      42,    62,   170,    66,   261,   477,   362,   389,   271,    65,
     564,   359,     2,   472,   396,   398,    57,   383,     2,   475,
     551,    81,     2,   598,   648,    74,   602,     2,     2,   186,
       2,    62,    62,    78,    80,   290,     2,    82,     2,     2,
     280,   281,    86,    88,     2,    96,   223,   818,   461,   461,
     765,    95,     3,   358,   101,   254,    97,   159,   801,     2,
     108,     2,     2,    62,     3,   173,    43,   360,   169,   357,
     805,    62,   175,    82,   652,    62,    62,    62,   180,    62,
     828,   183,   185,    87,   159,     2,   262,   430,    86,   739,
      62,   763,   307,   846,   279,   225,   653,   296,   209,   358,
     263,   358,     2,   701,    73,    83,   308,     2,    86,  -368,
       3,     2,   390,   360,  -368,   360,    59,   766,   102,   416,
     243,    84,    85,   243,   391,   802,    43,    59,   325,   254,
      60,    84,    85,   100,    43,    61,    86,   806,   480,   481,
     482,   282,   283,   312,   264,  -368,  -368,   829,    75,   291,
     477,   103,   723,   552,   567,   210,   293,   764,   313,    72,
     264,   223,    62,    42,   475,   783,   359,   532,   254,    86,
     264,    98,    62,   223,   223,     2,   264,   178,   175,   175,
       2,    62,   619,    86,   620,    86,   244,   315,   670,   246,
     389,   264,   389,   654,   744,   322,   618,   179,   479,   353,
      88,   365,   243,   758,   697,   624,   570,   677,   358,    86,
     799,   378,    62,   209,   803,   719,    84,    85,   571,   497,
      59,    62,   360,    75,   529,   209,   209,   487,   488,    43,
     489,   326,   174,   198,    42,   402,    83,   826,     2,   327,
     174,   461,   499,    86,   243,   422,   243,   422,   402,   226,
     400,    87,   275,   276,   461,   315,   263,   595,   649,   650,
     186,   710,     2,   452,   611,   473,   361,   627,   366,   478,
     210,   186,   615,   720,   186,   401,   800,   358,   352,   231,
     804,   327,   210,   210,    87,   358,    87,     2,   401,    84,
      85,   360,   254,   608,   272,   642,   630,   643,   834,   360,
      43,   608,   233,   827,   501,   503,   234,   175,   631,   273,
     274,   159,   835,     2,    42,    86,   684,   173,   263,   621,
     458,   458,   447,   294,   352,   651,   352,   185,   116,   622,
     724,   725,   286,    28,   671,   287,   727,   728,    30,   292,
     552,   552,   294,   593,   223,   510,   223,    84,    85,   522,
     596,  -414,   461,   288,   526,   447,   510,  -414,    28,   531,
     289,    88,   530,    30,   365,    86,   243,   741,   549,    35,
      36,    59,   772,   773,    75,    62,   713,   306,    86,    62,
      43,   303,   511,   263,    28,    62,   328,    62,   745,    30,
     712,   376,    62,   514,    35,    36,   209,   726,   209,    75,
     746,    87,    86,   729,   243,   447,    87,     2,   311,   756,
     589,   329,   587,   512,   592,   641,    42,   327,   767,    39,
      35,    36,    59,   605,   515,    60,   327,   330,   521,   307,
      61,   605,   324,   352,   794,    30,   389,   389,   100,   774,
     328,   506,   327,   507,   582,   394,   644,   210,   367,   265,
     266,   267,   395,   210,   223,   210,   223,   331,   332,    28,
       2,   626,    39,   552,    30,   329,    35,    36,   265,   266,
     267,   186,   284,   285,   668,   277,   278,   236,    28,    39,
     135,   330,    43,    30,   789,   236,   238,    39,   572,   265,
     266,   267,   304,   786,   238,    35,    36,   453,   305,   333,
     182,   184,   352,   410,   411,   412,   209,   293,   209,   454,
     352,   331,   332,   458,    35,    36,    59,   184,   747,    75,
     372,   367,   446,   647,   185,   789,   458,    76,   447,   461,
     655,    28,    59,    62,   699,   314,    30,   498,   638,    39,
      61,   549,    39,   664,   639,   692,   184,   669,   500,    86,
     186,   639,   673,   519,   676,   549,   549,   268,   518,    28,
     717,   269,   270,   210,    30,   210,   447,    35,    36,    62,
      62,   789,    60,   502,    62,   374,   268,    61,   776,   517,
     269,   270,    39,   298,   447,     2,   301,   733,   734,   736,
     223,   223,   640,   447,   625,    35,    36,   268,   307,   186,
      42,   269,   270,   185,   693,   447,    39,    83,   777,     2,
     508,   413,   509,   163,   447,   414,   415,   779,   164,    39,
     166,    39,   831,   447,   458,   167,    86,   833,   447,   314,
      39,   662,   184,   447,    61,   114,   523,     2,   115,   116,
     483,   484,   209,   209,   184,   184,   680,    86,   485,   486,
     186,   524,   185,    39,   184,   535,    28,   581,   549,   490,
     491,    30,     3,    39,   588,    39,    43,   184,   309,   310,
     549,   600,   601,    86,    39,   416,   603,   613,   549,   636,
    -368,   616,   184,   184,   617,  -368,    62,   458,   645,    62,
     637,   228,    35,    36,    59,     2,   656,    75,   565,   210,
     210,   658,   659,   185,   665,   120,   121,   660,   812,   661,
     245,   815,   663,   247,   681,   666,  -368,  -368,    84,    85,
     682,  -368,  -368,   694,    19,    20,  -368,   695,   703,   696,
     704,   549,   184,    39,   705,   549,   123,   124,   549,   708,
     709,   718,   737,   184,   730,    62,   184,   676,   732,   240,
      62,    62,   129,   299,    28,    29,   302,    28,   731,    30,
     743,   740,    30,   742,   748,   167,    28,    63,   680,   753,
     754,    30,   755,   757,   760,   780,   549,   549,   761,   549,
      39,   816,   549,   184,   795,    39,   796,   184,   830,   843,
      35,    36,    59,    35,    36,   817,    99,    77,    77,   232,
     820,   458,    35,    36,    59,   821,   836,    75,   837,    90,
     838,   839,   847,   848,   549,   184,   591,   184,   249,   492,
     494,   775,   493,    39,   496,   778,    90,   520,   781,   495,
     549,   431,   165,   549,   787,    39,   516,   172,   573,   577,
     687,    77,    77,   505,   165,   172,   165,   433,   628,   678,
     711,   633,     0,   634,     0,     0,    71,   635,     0,     0,
       0,     0,   165,     0,   212,     0,   809,   810,     0,   811,
       0,     0,   813,     0,     0,   184,   165,     0,     0,     0,
      39,     0,     0,     0,     0,     0,    79,    79,   184,     0,
       0,     0,     0,     0,     0,   504,     0,     0,    71,     0,
       0,     0,     0,     0,   832,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   106,    71,     0,     0,   162,     0,
     842,     0,     0,   844,     0,   184,     0,   184,   172,     0,
      79,    79,   181,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   646,   184,     0,   162,   165,   172,   241,   242,
       0,     0,     0,   317,     0,     0,     0,   251,     0,     0,
     230,     0,     0,     0,     0,   566,   212,    77,     0,     0,
       0,    39,     0,     0,   184,   184,     0,   379,     0,   212,
       0,     0,     0,     0,     0,     0,   184,   392,     0,     0,
       0,   212,   212,   434,   435,   436,   437,   438,   439,   440,
     441,   442,   443,     0,     0,     0,   597,     0,     0,     0,
     418,     0,   418,     0,     0,     0,     0,     0,   612,    39,
       0,   317,   184,     0,     0,     0,     0,     0,     0,     0,
       0,   251,   114,     0,     2,   115,   116,   117,     0,   118,
     119,     0,   323,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     3,
       0,   184,   184,     0,     0,   403,   385,   387,     0,     0,
     251,   184,     0,     0,     0,     0,     0,     0,   432,     0,
     317,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   184,   251,   421,
     251,   421,   120,   121,   122,     0,     0,     0,   444,     0,
     323,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     317,   251,   184,     0,     0,   657,     0,   212,     0,     0,
     533,     0,     0,   123,   124,     0,     0,     0,     0,     0,
     125,    77,     0,   126,     0,     0,   127,     0,   128,   129,
       0,   574,     0,     0,   131,   132,   133,   134,     0,     0,
       0,   690,   212,   184,   212,     0,   788,   845,     0,   323,
     317,     0,   513,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   418,     0,     0,     0,     0,     0,     0,   418,
     700,     0,     0,   702,   251,     0,     0,   418,   251,     0,
       0,    91,   706,   707,     0,     0,     0,     0,     0,   323,
       0,     0,     0,     0,     0,     0,     0,   104,   106,    79,
       0,     0,     0,     0,     0,     0,     0,   379,     0,     0,
      79,     0,     0,     0,   569,     0,     0,     0,     0,     0,
     189,     0,     0,   251,     0,   251,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    93,     0,     0,     0,   323,
       0,     0,     0,   229,     0,     0,     0,     0,     0,     0,
       0,   421,   212,   599,   212,   251,     0,   251,   421,     0,
       0,     0,     0,     0,     0,   256,   421,     0,     0,     0,
       0,     0,     0,   759,   191,     0,     0,   762,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   385,     0,   533,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   784,     0,     0,     0,     0,   686,     0,     0,   258,
       0,     0,   793,     0,     0,   318,     0,     0,   251,     0,
       0,     0,     0,     0,     0,     0,     0,   356,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    91,
       0,   251,     0,     0,     0,     0,   251,     0,     0,     0,
       0,     0,     0,     0,     0,   251,   251,     0,   181,     0,
       0,     0,     0,   405,     0,     0,     0,     0,     0,   320,
       0,     0,    91,   425,    91,   425,   405,    79,   212,   212,
       0,     0,     0,   448,     0,     0,     0,     0,     0,     0,
       0,   189,   189,    93,     0,   689,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   165,     0,     0,     0,     0,   407,     0,     0,
       0,     0,     0,     0,     0,   751,    93,   427,    93,   427,
     407,     0,     0,     0,     0,     0,     0,   450,     0,   251,
       0,   189,     0,     0,     0,   191,   191,     0,     0,     0,
       0,     0,   189,   160,     0,   189,     0,     0,   251,   251,
     251,   251,     0,   251,     0,     0,     0,   160,     0,     0,
     251,     0,     0,     0,     0,     0,     0,     0,   251,     0,
     160,    77,   528,     0,     0,     0,     0,    94,   218,    91,
       0,   104,   256,     0,    91,   191,   189,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   191,     0,     0,   191,
       0,   750,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   197,     0,     0,     0,
       0,   251,   583,     0,     0,   251,     0,     0,   251,   251,
       0,     0,     0,    93,     0,     0,   258,   251,    93,     0,
     191,   607,     0,     0,     0,     0,     0,     0,     0,   607,
       0,     0,   160,     0,     0,     0,     0,     0,     0,     0,
      79,   259,     0,     0,     0,     0,   251,   251,     0,   251,
     251,     0,   251,   251,   189,     0,   585,     0,   251,   318,
     218,   369,   370,   371,   373,     0,    89,   189,     0,     0,
       0,   382,   218,   218,     0,   609,     0,     0,     0,     0,
       0,   218,     0,   609,   251,   218,   218,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     251,   321,     0,   251,   251,   188,     0,     0,   191,     0,
       0,     0,     0,   320,     0,     0,     0,     0,     0,     0,
       0,   191,   189,     0,     0,    94,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   408,
     318,     0,     0,   189,   189,     0,     0,     0,    94,   428,
      94,   428,   408,     0,     0,   189,     0,     0,     0,   451,
       0,     0,     0,     0,     0,     0,   191,   197,   197,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   155,
       0,   189,     0,     0,   320,     0,     0,   191,   191,     0,
     316,     0,    92,     0,     0,     0,     0,     0,     0,   191,
       0,   218,   355,     0,     0,     0,     0,   197,     0,     0,
       0,     0,     0,     0,    89,     0,     0,     0,   197,   568,
     155,   197,     0,     0,     0,   575,     0,   218,     0,     0,
     189,   190,   218,     0,     0,   191,   218,     0,   218,   155,
       0,     0,   155,     0,     0,     0,     0,    89,   424,    89,
     424,     0,     0,     0,     0,    94,   189,     0,   259,     0,
      94,     0,   197,     0,     0,     0,   188,   188,     0,     0,
       0,     0,     0,     0,     0,     0,   257,     0,     0,     0,
       0,   189,   155,     0,   191,   155,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   586,     0,
     629,   382,     0,     0,     0,     0,     0,     0,     0,     0,
     191,     0,     0,     0,     0,     0,   188,   610,     0,     0,
       0,     0,   189,     0,     0,   610,     0,   188,     0,     0,
     188,     0,     0,     0,     0,   191,   319,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   218,     0,   218,     0,
     197,     0,     0,     0,     0,   321,     0,   527,     0,     0,
      92,     0,     0,   197,    89,     0,     0,     0,     0,    89,
       0,   188,     0,   160,     0,     0,   191,     0,     0,     0,
       0,   460,   460,     0,   406,     0,     0,     0,     0,     0,
       0,     0,     0,    92,     0,    92,     0,   406,     0,     0,
       0,     0,     0,     0,   449,     0,     0,     0,     0,   685,
     688,     0,   190,   190,   691,     0,     0,     0,   197,     0,
       0,     0,     0,     0,   155,     0,   606,     0,     0,     0,
       0,     0,     0,     0,   606,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   321,     0,     0,   197,
     197,     0,     0,     0,     0,     0,     0,     0,     0,   188,
       0,   197,   190,     0,   316,     0,     0,     0,     0,     0,
       0,     0,   188,   190,     0,     0,   190,     0,     0,     0,
       0,     0,   218,   218,   161,   721,   722,     0,     0,     0,
       0,     0,   460,     0,   155,     0,     0,   197,   161,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      92,   161,     0,   257,     0,    92,     0,   190,     0,   220,
       0,     0,     0,     0,     0,     0,   749,   188,     0,   752,
       0,     0,     0,     0,     0,   155,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   197,   155,     0,     0,
       0,     0,     0,   584,     0,   316,     0,     0,   188,   188,
     768,   769,     0,   770,   771,     0,     0,     0,     0,     0,
     188,     0,   197,     0,   460,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   460,     0,     0,
     791,   792,     0,   161,     0,     0,     0,   197,     0,   797,
       0,   798,     0,     0,     0,   190,   188,     0,   807,   808,
     319,     0,     0,     0,     0,     0,     0,     0,   190,     0,
       0,   220,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   220,   386,   220,   822,     0,   823,   197,   824,
       0,   825,   393,     0,     0,     0,   220,   220,     0,     0,
       0,     0,     0,     0,   155,   188,     0,     0,     0,     0,
       0,     0,   840,     0,   841,     0,     0,     0,     0,     0,
       0,     0,     0,   190,     0,     0,     0,     0,     0,     0,
       0,   188,     0,     0,     0,   460,     0,     0,     0,     0,
     155,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   319,     0,     0,   190,   190,   188,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   190,     0,     0,   155,
       0,     0,   155,     0,     0,     0,     0,     0,     0,     0,
       0,   155,   155,   114,     0,     2,   115,   116,   117,     0,
     118,   119,     0,   460,     0,     0,     0,   188,   460,     0,
       0,     0,   190,     0,     0,     0,     0,     0,     0,   714,
       3,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   220,     0,   536,   537,   538,   539,   540,   541,
     542,   543,   544,   545,   546,     0,     0,     0,     0,     0,
     386,   190,     0,   120,   121,   122,   393,     0,   576,     0,
       0,     0,     0,   578,     0,     0,     0,   220,     0,   220,
       0,     0,   155,     0,     0,     0,   155,   190,     0,     0,
       0,     0,     0,     0,   123,   124,     0,     0,     0,     0,
       0,   125,     0,     0,   126,     0,     0,   127,     0,   128,
     129,     0,   190,     0,     0,   131,   132,   133,   134,     0,
     155,     0,   460,     0,     0,     0,   548,   367,     0,     0,
       0,   155,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   220,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   190,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,     0,     2,   115,   116,   117,
       0,   118,   119,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   220,     0,   220,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,   161,   536,   537,   538,   539,   540,
     541,   542,   543,   544,   545,   546,     0,     0,     0,    27,
       0,     0,     0,     0,   120,   121,   122,    28,    29,     0,
     547,     0,    30,     0,     0,     0,     0,     0,    33,     0,
     576,     0,     0,     0,     0,   578,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,   125,    35,    36,   126,     0,     0,   127,     0,
     128,   129,     0,     0,     0,     0,   131,   132,   133,   134,
       0,     0,     0,     0,     0,     0,     0,   548,   367,  -442,
     114,     0,     2,   115,   116,   117,     0,   118,   119,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   220,   220,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,   536,   537,   538,   539,   540,   541,   542,   543,   544,
     545,   546,     0,     0,     0,    27,     0,     0,     0,     0,
     120,   121,   122,    28,    29,     0,   547,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   123,   124,     0,     0,     0,     0,     0,   125,    35,
      36,   126,     0,     0,   127,     0,   128,   129,     0,     0,
       0,     0,   131,   132,   133,   134,     0,     0,     0,     0,
       0,     0,     0,   548,   367,  -441,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,   536,   537,   538,
     539,   540,   541,   542,   543,   544,   545,   546,     0,     0,
       0,    27,     0,     0,     0,     0,   120,   121,   122,    28,
      29,     0,   547,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   123,   124,     0,
       0,     0,     0,     0,   125,    35,    36,   126,     0,     0,
     127,     0,   128,   129,     0,     0,     0,     0,   131,   132,
     133,   134,     0,     0,     0,     0,     0,     0,     0,   548,
     367,  -443,   114,     0,     2,   115,   116,   117,     0,   118,
     119,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   120,   121,   122,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   123,   124,     0,     0,     0,     0,     0,
     125,    35,    36,   126,     0,     0,   127,     0,   128,   129,
       0,     0,     0,     0,   131,   132,   133,   134,     0,     0,
       0,     0,     0,     0,     0,   455,   456,   457,   114,     0,
       2,   115,   116,   117,     0,   118,   119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   120,   121,
     122,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   123,
     124,     0,     0,     0,     0,     0,   125,    35,    36,   126,
       0,     0,   127,     0,   128,   129,     0,     0,     0,     0,
     131,   132,   133,   134,     0,     0,     0,     0,     0,     0,
       0,   455,   456,   471,   114,     0,     2,   115,   116,   117,
       0,   118,   119,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   120,   121,   122,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,   125,    35,    36,   126,     0,     0,   127,     0,
     128,   129,     0,     0,     0,     0,   131,   132,   133,   134,
       0,     0,     0,     0,     0,     0,     0,   455,   456,   623,
     114,     0,     2,   115,   116,   117,     0,   118,   119,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     120,   121,   122,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   123,   124,     0,     0,     0,     0,     0,   125,    35,
      36,   126,     0,     0,   127,     0,   128,   129,     0,     0,
       0,     0,   131,   132,   133,   134,     0,     0,     0,     0,
       0,     0,     0,   632,   456,  -494,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,   120,   121,   122,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   123,   124,     0,
       0,     0,     0,     0,   125,    35,    36,   126,     0,     0,
     127,     0,   128,   129,     0,     0,     0,     0,   131,   132,
     133,   134,     0,     0,     0,     0,     0,     0,     0,   455,
     456,   683,   114,     0,     2,   115,   116,   117,     0,   118,
     119,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,   120,   121,   122,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   123,   124,     0,     0,     0,     0,     0,
     125,    35,    36,   126,     0,     0,   127,     0,   128,   129,
       0,     0,     0,     0,   131,   132,   133,   134,   114,     0,
       2,   115,   116,     0,     0,   455,   456,   785,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   199,     0,     0,   120,   121,
       0,    28,    29,     0,     0,   200,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   123,
     124,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   201,     0,   202,   129,   114,     0,     2,   115,
     116,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   203,     0,   204,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   199,     0,     0,   120,   121,     0,    28,
      29,     0,     0,   200,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   123,   124,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     201,     0,   202,   129,   114,     0,     2,   115,   116,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   203,
       0,   388,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,   199,     0,     0,   120,   121,     0,    28,    29,     0,
       0,   200,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,   201,     0,
     202,   129,   114,     0,     2,   115,   116,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   203,     0,   397,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,   199,
       0,     0,   120,   121,     0,    28,    29,     0,     0,   200,
      30,     0,     0,     0,     0,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   123,   124,     0,     0,     0,     0,     0,
       0,    35,    36,    59,     0,     0,   201,     0,   202,   129,
     114,     0,     2,   115,   116,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   203,     0,   579,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   199,     0,     0,
     120,   121,     0,    28,    29,     0,     0,   200,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   123,   124,     0,     0,     0,     0,     0,     0,    35,
      36,    59,     0,     0,   201,     0,   202,   129,   114,     0,
       2,   115,   116,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   203,     0,   580,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   199,     0,     0,   120,   121,
       0,    28,    29,     0,     0,   200,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   123,
     124,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,   201,     0,   202,   129,   114,     0,     2,   115,
     116,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   203,     0,   715,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   199,     0,     0,   120,   121,     0,    28,
      29,     0,     0,   200,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   123,   124,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     201,     0,   202,   129,   114,     0,     2,   115,   116,   117,
       0,   118,   119,     0,     0,     0,     0,     0,     0,   203,
       0,   716,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,   536,   537,   538,   539,   540,
     541,   542,   543,   544,   545,   546,     0,     0,     0,    27,
       0,     0,     0,     0,   120,   121,   122,    28,    29,     0,
     547,     0,    30,     0,     0,     0,     0,     0,    33,   114,
       0,     2,   115,   116,   117,     0,   118,   119,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,   125,    35,    36,   126,     3,     0,   127,     0,
     128,   129,     0,     0,     0,     0,   131,   132,   133,   134,
       0,     0,     0,     0,     0,     0,     0,   548,   367,     0,
       0,     0,     0,     0,     0,   114,     0,     2,   115,   116,
     117,     0,   118,   119,     0,     0,     0,     0,     0,   120,
     121,   122,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,     0,     0,     0,     0,     0,     0,     0,
     114,     0,     2,   115,   116,   117,     0,   118,   119,     0,
     123,   124,     0,     0,     0,     0,     0,   125,     0,     0,
     126,     0,     0,   127,   474,   128,   129,     3,     0,     0,
       0,   131,   132,   133,   134,   120,   121,   122,     0,     0,
       0,     0,     0,   456,     0,     0,     0,     0,   114,     0,
       2,   115,   116,   117,     0,   118,   119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   123,   124,     0,     0,
     120,   121,   122,   125,     0,     3,   126,     0,     0,   127,
     590,   128,   129,     0,     0,     0,     0,   131,   132,   133,
     134,     0,     0,     0,     0,     0,     0,     0,     0,   456,
       0,   123,   124,     0,     0,     0,     0,     0,   125,     0,
       0,   126,     0,     0,   127,     0,   128,   129,   120,   121,
     122,     0,   131,   132,   133,   134,     0,     0,     0,     0,
       0,     0,     0,     0,   456,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   123,
     124,     0,     0,     0,     0,     0,   125,     0,     0,   126,
       0,     0,   127,     0,   128,   129,     0,     0,     0,     0,
     131,   132,   133,   134,   114,     0,     2,   115,   116,     0,
       0,     0,   788,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,    27,
       0,   199,     0,     0,   120,   121,     0,    28,    29,     0,
       0,   200,    30,     3,     0,     0,     0,     0,    33,   114,
       0,     2,   115,   116,   117,     0,   118,   119,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     3,     0,   201,     0,
     202,   129,     0,     0,     0,     0,   120,   121,   122,     0,
       0,     0,     0,     0,     0,     0,     0,   203,   114,     0,
       2,   115,   116,   117,     0,   118,   119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   123,   124,   120,
     121,   122,     0,     0,   125,     3,     0,   126,     0,     0,
     127,   738,   128,   129,     0,     0,     0,     0,   131,   132,
     133,   134,     0,     0,     0,     0,     0,     0,     0,   548,
     123,   124,     0,     0,     0,     0,     0,   125,     0,     0,
     126,     0,     0,   127,   782,   128,   129,     0,   120,   121,
     122,   131,   132,   133,   134,     0,     0,     0,     0,     0,
       0,     0,   548,     0,     0,     0,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,   123,
     124,     0,     0,     0,     0,     0,   125,     2,     0,   126,
       0,     0,   127,     3,   128,   129,     0,     0,     0,     0,
     131,   132,   133,   134,     0,     0,     0,     0,     0,     0,
       0,   667,     3,     4,     5,     6,     7,     8,   337,   338,
     339,   340,   341,   342,   343,   344,   345,   346,    19,    20,
     347,   348,    23,    24,   349,     0,   120,   121,   122,    28,
       0,     0,     0,     0,    30,     0,     0,     0,     0,     0,
     350,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,   123,   124,     0,
       0,     0,     0,     0,   125,    35,    36,   363,     0,     0,
     364,   250,   128,   129,   351,     0,     0,     0,   131,   132,
     133,   134,     0,     0,    35,    36,    59,     2,     0,   314,
       0,     0,     0,     0,    61,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   525,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,    33,
       0,     0,     0,     0,     0,   114,     0,     2,   115,   116,
     117,     0,   118,   119,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    59,     2,     0,   375,
       0,     0,     3,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   376,     0,   377,     0,
       0,     0,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,   120,   121,   122,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,   123,   124,     0,    33,
       0,     0,     0,   125,     0,     0,   126,     0,     0,   127,
       0,   128,   129,     0,    34,   130,     0,   131,   132,   133,
     134,     0,     0,     0,    35,    36,    59,     0,   114,    75,
       2,   115,   116,   117,     0,   118,   119,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   672,     0,
       0,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   120,   121,
     122,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   123,
     124,     0,     0,     0,     0,     0,   125,    35,    36,   126,
       0,     0,   127,     0,   128,   129,     0,     0,     0,     0,
     131,   132,   133,   134,   114,     0,     2,   115,   116,   117,
       0,   118,   119,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     3,     0,     0,     0,     0,     0,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,   120,   121,   122,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   123,   124,     0,     0,     0,
       0,     0,   125,    35,    36,   126,     0,     0,   127,   250,
     128,   129,     0,     0,     0,     0,   131,   132,   133,   134,
     114,     0,     2,   115,   116,   117,     0,   118,   119,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     0,     0,
       0,     0,     0,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
     120,   121,   122,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   123,   124,     0,     0,     0,     0,     0,   125,    35,
      36,   126,     0,     0,   240,   250,   128,   129,     0,     0,
       0,     0,   131,   132,   133,   134,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     3,     0,     0,     0,     0,     0,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,   114,     0,     2,   115,   116,   117,     0,   118,
     119,    27,     0,     0,     0,     0,   120,   121,   122,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     3,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   123,   124,     0,
       0,     0,     0,     0,   125,    35,    36,   363,     0,     0,
     364,   250,   128,   129,     0,     0,     0,     0,   131,   132,
     133,   134,   120,   121,   122,   114,     0,     2,   115,   116,
     117,     0,   118,   119,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,   123,   124,     0,     0,     0,     0,     0,
     125,     0,     0,   126,     0,     0,   127,     0,   128,   129,
       0,     0,   297,     0,   131,   132,   133,   134,     0,     0,
       0,   114,     0,     2,   115,   116,   117,     0,   118,   119,
       0,     0,     0,     0,     0,   120,   121,   122,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   114,     3,     2,
     115,   116,   117,     0,   118,   119,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   123,   124,     0,     0,
       0,     0,     0,   125,     3,     0,   126,     0,     0,   127,
       0,   128,   129,     0,     0,   300,     0,   131,   132,   133,
     134,   120,   121,   122,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,     0,     2,   115,   116,   117,     0,
     118,   119,     0,     0,     0,     0,     0,   120,   121,   122,
       0,     0,   123,   124,     0,     0,     0,     0,     0,   125,
       3,     0,   126,     0,     0,   127,   250,   128,   129,     0,
       0,     0,     0,   131,   132,   133,   134,     0,   123,   124,
       0,     0,     0,     0,     0,   125,     0,     0,   126,     0,
       0,   127,   735,   128,   129,     0,     0,     0,     0,   131,
     132,   133,   134,   120,   121,   122,   114,     0,     2,   115,
     116,   117,     0,   118,   119,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,     0,     2,   115,   116,   117,
       0,   118,   119,     3,   123,   124,     0,     0,     0,     0,
       0,   125,     0,     0,   126,     0,     0,   127,   814,   128,
     129,     3,     0,     0,     0,   131,   132,   133,   134,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   120,   121,   122,     0,
       0,     0,   114,     0,     2,   115,   116,   117,     0,   118,
     119,     0,     0,     0,   120,   121,   122,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   123,   124,     3,
       0,     0,     0,     0,   125,     0,     0,   126,     0,     0,
     127,     0,   128,   129,     0,   123,   124,     0,   131,   132,
     133,   134,   125,     0,     0,   126,     0,     0,   235,     0,
     128,   129,     0,     0,     0,     0,   131,   132,   133,   134,
       0,     0,   120,   121,   122,   114,     0,     2,   115,   116,
     117,     0,   118,   119,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     3,   123,   124,     0,     0,     0,     0,     0,
     125,     0,     0,   126,     0,     0,   240,     0,   128,   129,
       0,     0,     0,     0,   131,   132,   133,   134,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   120,   121,   122,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   123,   124,     1,     0,
       2,     0,     0,   125,     0,     0,   126,     0,     0,   248,
       0,   128,   129,     0,     0,     0,     0,   131,   132,   133,
     134,     0,     0,     0,     0,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     2,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    59,
       0,     0,    60,   107,     0,     0,     0,    61,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,    31,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    59,     0,     0,   314,   107,     0,     0,     0,
      61,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    59,     0,     0,    60,     0,
       0,     0,     0,    61,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    59,     0,
       0,   314,     0,     0,     0,     0,    61,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    59,     0,     0,   416,     0,     0,     0,     0,   417,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    59,     0,     0,   416,     0,     0,
       0,     0,   429,     3,     4,     5,     6,     7,     8,   337,
     338,   339,   340,   341,   342,   343,   344,   345,   346,    19,
      20,   347,   348,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   350,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,   351,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
     416,     0,     0,     0,     0,   604,     3,     4,     5,     6,
       7,     8,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,    19,    20,   347,   348,    23,    24,    25,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   350,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     3,     0,     0,    30,     0,     0,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,   351,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      59,     0,    27,   416,     0,     0,     0,     0,   614,     0,
      28,    29,     0,     0,     0,    30,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     2,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    59,     0,
       0,   314,     0,     0,     0,     0,    61,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,     0,     0,     0,     1,
       0,     2,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    59,     0,     0,   416,   594,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,     0,     0,     0,     1,     0,
       2,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
       0,     0,     0,     0,   168,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,     0,     0,     0,     1,     0,     2,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,     0,
       0,     0,     0,   295,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,     0,     0,
       0,     0,   698,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,     0,     0,     0,
      33,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    59,     0,     0,
      75,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,     0,     0,     0,    33,     0,
       0,     0,     1,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,     0,     0,     0,   534,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,   399,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     1,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,     0,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,     2,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     0,     0,    33,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,     3,     4,     5,     6,     7,     8,   337,   338,
     339,   340,   341,   342,   343,   344,   345,   346,    19,    20,
     347,   348,    23,    24,   349,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     350,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   351,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,     3,     4,     5,     6,
       7,     8,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,    19,    20,   347,   348,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   350,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   351,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36
};

static const yytype_int16 yycheck[] =
{
       0,     1,    68,     1,   129,   268,   200,   213,   142,     1,
     374,   199,     3,   264,   225,   226,     0,   211,     3,   268,
     368,   115,     3,   418,   524,    25,   421,     3,     3,    82,
       3,    31,    32,    31,    32,    17,     3,   113,     3,     3,
      12,    13,    42,    43,     3,    43,    98,   788,   263,   264,
      69,    43,    28,   199,    54,   127,   115,    63,    69,     3,
      60,     3,     3,    63,    28,    71,     0,   199,    68,   199,
      69,    71,    72,   113,   113,    75,    76,    77,    76,    79,
      69,    81,    82,    43,    90,     3,   121,   246,    88,   663,
      90,    70,   122,   834,   147,   135,   135,   163,    98,   245,
     135,   247,     3,   603,    25,     1,   136,     3,   108,    74,
      28,     3,   122,   245,    79,   247,   112,   136,   132,   115,
     120,   112,   113,   123,   134,   136,    60,   112,    11,   201,
     115,   112,   113,    54,    68,   120,   136,   136,   272,   273,
     274,   113,   114,   116,   135,   110,   111,   136,   115,   131,
     413,     0,   652,   368,   135,    98,   162,   136,   133,   135,
     135,   213,   162,   163,   413,   739,   354,   361,   240,   169,
     135,   135,   172,   225,   226,     3,   135,   135,   178,   179,
       3,   181,   445,   183,   447,   185,   120,   187,   132,   123,
     396,   135,   398,   135,   135,   187,   445,   135,   270,   199,
     200,   201,   202,   703,   599,   456,   122,   555,   354,   209,
      70,   211,   212,   213,    70,   116,   112,   113,   134,   291,
     112,   221,   354,   115,   354,   225,   226,   280,   281,   163,
     283,   114,    71,   115,   234,   235,     1,    70,     3,   122,
      79,   456,   121,   243,   244,   245,   246,   247,   248,   135,
     234,   211,   124,   125,   469,   255,   135,   416,    69,    70,
     313,   625,     3,   255,   423,   265,   200,   461,   202,   269,
     213,   324,   431,   114,   327,   235,   136,   423,   199,   116,
     136,   122,   225,   226,   244,   431,   246,     3,   248,   112,
     113,   423,   364,   423,   112,   506,   122,   508,   122,   431,
     234,   431,   116,   136,   121,   305,   122,   307,   134,   127,
     128,   317,   136,     3,   314,   315,   567,   323,   135,   453,
     263,   264,   122,   162,   245,   136,   247,   327,     5,   454,
      69,    70,   123,    74,   134,   129,    69,    70,    79,   121,
     555,   556,   181,   415,   396,   313,   398,   112,   113,   349,
     416,   116,   567,   130,   354,   122,   324,   122,    74,   359,
      16,   361,   354,    79,   364,   365,   366,   134,   368,   110,
     111,   112,    69,    70,   115,   375,   639,   133,   378,   379,
     314,   116,   313,   135,    74,   385,     3,   387,   122,    79,
     639,   132,   392,   324,   110,   111,   396,   136,   398,   115,
     134,   361,   402,   136,   404,   122,   366,     3,   116,   114,
     410,    28,   404,   313,   414,   132,   416,   122,   114,     0,
     110,   111,   112,   423,   324,   115,   122,    44,   349,   122,
     120,   431,   133,   354,   114,    79,   642,   643,   359,   136,
       3,   134,   122,   136,   404,   134,   518,   390,   135,     7,
       8,     9,   134,   396,   506,   398,   508,    74,    75,    74,
       3,   461,    43,   678,    79,    28,   110,   111,     7,     8,
       9,   524,    14,    15,   546,    10,    11,   117,    74,    60,
      61,    44,   416,    79,   747,   125,   117,    68,   132,     7,
       8,     9,   116,   744,   125,   110,   111,   116,   122,   116,
      81,    82,   423,     7,     8,     9,   506,   513,   508,   119,
     431,    74,    75,   456,   110,   111,   112,    98,   133,   115,
     134,   135,   116,   523,   524,   788,   469,   123,   122,   744,
     530,    74,   112,   533,   600,   115,    79,   116,   116,   120,
     120,   541,   123,   543,   122,   116,   127,   547,   121,   549,
     603,   122,   552,   116,   552,   555,   556,   115,   115,    74,
     116,   119,   120,   506,    79,   508,   122,   110,   111,   569,
     570,   834,   115,   121,   574,   133,   115,   120,   116,   116,
     119,   120,   163,   164,   122,     3,   167,   659,   660,   661,
     642,   643,   121,   122,   133,   110,   111,   115,   122,   652,
     600,   119,   120,   603,   121,   122,   187,     1,   116,     3,
     134,   115,   136,   115,   122,   119,   120,   116,   120,   200,
     115,   202,   116,   122,   567,   120,   626,   116,   122,   115,
     211,   541,   213,   122,   120,     1,   115,     3,     4,     5,
     275,   276,   642,   643,   225,   226,   556,   647,   277,   278,
     703,   113,   652,   234,   235,   136,    74,   116,   658,   284,
     285,    79,    28,   244,   116,   246,   600,   248,   178,   179,
     670,   115,   120,   673,   255,   115,   113,   120,   678,   136,
      74,   116,   263,   264,   116,    79,   686,   630,   116,   689,
     136,   102,   110,   111,   112,     3,   116,   115,   116,   642,
     643,   132,   115,   703,   134,    71,    72,   115,   780,   115,
     121,   783,   115,   124,   136,   134,   110,   111,   112,   113,
     134,   115,   116,   116,    44,    45,   120,   116,   113,   121,
     120,   731,   313,   314,   121,   735,   102,   103,   738,   120,
     136,   116,    56,   324,   135,   745,   327,   745,   658,   115,
     750,   751,   118,   164,    74,    75,   167,    74,   132,    79,
     670,   134,    79,   133,   136,   120,    74,     1,   678,   132,
     116,    79,   121,   121,   121,   115,   776,   777,   121,   779,
     361,   134,   782,   364,   121,   366,   121,   368,    64,   134,
     110,   111,   112,   110,   111,   136,    54,    31,    32,   116,
     136,   744,   110,   111,   112,   136,   136,   115,   136,    43,
     136,   136,   136,   136,   814,   396,   413,   398,   125,   286,
     288,   731,   287,   404,   290,   735,    60,   336,   738,   289,
     830,   247,    66,   833,   745,   416,   327,    71,   384,   390,
     570,    75,    76,   307,    78,    79,    80,   248,   461,   555,
     630,   469,    -1,   469,    -1,    -1,     1,   469,    -1,    -1,
      -1,    -1,    96,    -1,    98,    -1,   776,   777,    -1,   779,
      -1,    -1,   782,    -1,    -1,   456,   110,    -1,    -1,    -1,
     461,    -1,    -1,    -1,    -1,    -1,    31,    32,   469,    -1,
      -1,    -1,    -1,    -1,    -1,   306,    -1,    -1,    43,    -1,
      -1,    -1,    -1,    -1,   814,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    59,    60,    -1,    -1,    63,    -1,
     830,    -1,    -1,   833,    -1,   506,    -1,   508,   162,    -1,
      75,    76,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   523,   524,    -1,    90,   180,   181,   118,   119,
      -1,    -1,    -1,   187,    -1,    -1,    -1,   127,    -1,    -1,
     105,    -1,    -1,    -1,    -1,   376,   200,   201,    -1,    -1,
      -1,   552,    -1,    -1,   555,   556,    -1,   211,    -1,   213,
      -1,    -1,    -1,    -1,    -1,    -1,   567,   221,    -1,    -1,
      -1,   225,   226,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    -1,    -1,    -1,   417,    -1,    -1,    -1,
     244,    -1,   246,    -1,    -1,    -1,    -1,    -1,   429,   600,
      -1,   255,   603,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   201,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,   187,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   201,    -1,    -1,    28,
      -1,   642,   643,    -1,    -1,   235,   211,   212,    -1,    -1,
     240,   652,    -1,    -1,    -1,    -1,    -1,    -1,   248,    -1,
     314,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   678,   268,   244,
     270,   246,    71,    72,    73,    -1,    -1,    -1,   133,    -1,
     255,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     354,   291,   703,    -1,    -1,   536,    -1,   361,    -1,    -1,
     364,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   375,    -1,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,   385,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,   572,   396,   744,   398,    -1,   135,   136,    -1,   314,
     404,    -1,   317,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   416,    -1,    -1,    -1,    -1,    -1,    -1,   423,
     601,    -1,    -1,   604,   364,    -1,    -1,   431,   368,    -1,
      -1,    43,   613,   614,    -1,    -1,    -1,    -1,    -1,   354,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    59,   363,   364,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   461,    -1,    -1,
     375,    -1,    -1,    -1,   379,    -1,    -1,    -1,    -1,    -1,
      82,    -1,    -1,   413,    -1,   415,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    43,    -1,    -1,    -1,   404,
      -1,    -1,    -1,   105,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   416,   506,   418,   508,   445,    -1,   447,   423,    -1,
      -1,    -1,    -1,    -1,    -1,   127,   431,    -1,    -1,    -1,
      -1,    -1,    -1,   704,    82,    -1,    -1,   708,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   461,    -1,   552,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   742,    -1,    -1,    -1,    -1,   570,    -1,    -1,   127,
      -1,    -1,   753,    -1,    -1,   187,    -1,    -1,   518,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   199,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,
      -1,   541,    -1,    -1,    -1,    -1,   546,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   555,   556,    -1,   533,    -1,
      -1,    -1,    -1,   235,    -1,    -1,    -1,    -1,    -1,   187,
      -1,    -1,   244,   245,   246,   247,   248,   552,   642,   643,
      -1,    -1,    -1,   255,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   263,   264,   211,    -1,   570,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   676,    -1,    -1,    -1,    -1,   235,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   689,   244,   245,   246,   247,
     248,    -1,    -1,    -1,    -1,    -1,    -1,   255,    -1,   639,
      -1,   313,    -1,    -1,    -1,   263,   264,    -1,    -1,    -1,
      -1,    -1,   324,    63,    -1,   327,    -1,    -1,   658,   659,
     660,   661,    -1,   663,    -1,    -1,    -1,    77,    -1,    -1,
     670,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   678,    -1,
      90,   745,   354,    -1,    -1,    -1,    -1,    43,    98,   361,
      -1,   363,   364,    -1,   366,   313,   368,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   324,    -1,    -1,   327,
      -1,   686,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    82,    -1,    -1,    -1,
      -1,   731,   404,    -1,    -1,   735,    -1,    -1,   738,   739,
      -1,    -1,    -1,   361,    -1,    -1,   364,   747,   366,    -1,
     368,   423,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   431,
      -1,    -1,   172,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     745,   127,    -1,    -1,    -1,    -1,   776,   777,    -1,   779,
     780,    -1,   782,   783,   456,    -1,   404,    -1,   788,   461,
     200,   205,   206,   207,   208,    -1,    43,   469,    -1,    -1,
      -1,   211,   212,   213,    -1,   423,    -1,    -1,    -1,    -1,
      -1,   221,    -1,   431,   814,   225,   226,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     830,   187,    -1,   833,   834,    82,    -1,    -1,   456,    -1,
      -1,    -1,    -1,   461,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   469,   524,    -1,    -1,   211,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   235,
     552,    -1,    -1,   555,   556,    -1,    -1,    -1,   244,   245,
     246,   247,   248,    -1,    -1,   567,    -1,    -1,    -1,   255,
      -1,    -1,    -1,    -1,    -1,    -1,   524,   263,   264,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    61,
      -1,   603,    -1,    -1,   552,    -1,    -1,   555,   556,    -1,
     187,    -1,    43,    -1,    -1,    -1,    -1,    -1,    -1,   567,
      -1,   361,   199,    -1,    -1,    -1,    -1,   313,    -1,    -1,
      -1,    -1,    -1,    -1,   211,    -1,    -1,    -1,   324,   379,
     102,   327,    -1,    -1,    -1,   385,    -1,   387,    -1,    -1,
     652,    82,   392,    -1,    -1,   603,   396,    -1,   398,   121,
      -1,    -1,   124,    -1,    -1,    -1,    -1,   244,   245,   246,
     247,    -1,    -1,    -1,    -1,   361,   678,    -1,   364,    -1,
     366,    -1,   368,    -1,    -1,    -1,   263,   264,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   127,    -1,    -1,    -1,
      -1,   703,   164,    -1,   652,   167,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   404,    -1,
     464,   461,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     678,    -1,    -1,    -1,    -1,    -1,   313,   423,    -1,    -1,
      -1,    -1,   744,    -1,    -1,   431,    -1,   324,    -1,    -1,
     327,    -1,    -1,    -1,    -1,   703,   187,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   506,    -1,   508,    -1,
     456,    -1,    -1,    -1,    -1,   461,    -1,   354,    -1,    -1,
     211,    -1,    -1,   469,   361,    -1,    -1,    -1,    -1,   366,
      -1,   368,    -1,   533,    -1,    -1,   744,    -1,    -1,    -1,
      -1,   263,   264,    -1,   235,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   244,    -1,   246,    -1,   248,    -1,    -1,
      -1,    -1,    -1,    -1,   255,    -1,    -1,    -1,    -1,   569,
     570,    -1,   263,   264,   574,    -1,    -1,    -1,   524,    -1,
      -1,    -1,    -1,    -1,   306,    -1,   423,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   431,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   552,    -1,    -1,   555,
     556,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   456,
      -1,   567,   313,    -1,   461,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   469,   324,    -1,    -1,   327,    -1,    -1,    -1,
      -1,    -1,   642,   643,    63,   649,   650,    -1,    -1,    -1,
      -1,    -1,   374,    -1,   376,    -1,    -1,   603,    77,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     361,    90,    -1,   364,    -1,   366,    -1,   368,    -1,    98,
      -1,    -1,    -1,    -1,    -1,    -1,   686,   524,    -1,   689,
      -1,    -1,    -1,    -1,    -1,   417,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   652,   429,    -1,    -1,
      -1,    -1,    -1,   404,    -1,   552,    -1,    -1,   555,   556,
     724,   725,    -1,   727,   728,    -1,    -1,    -1,    -1,    -1,
     567,    -1,   678,    -1,   456,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   469,    -1,    -1,
     750,   751,    -1,   172,    -1,    -1,    -1,   703,    -1,   763,
      -1,   765,    -1,    -1,    -1,   456,   603,    -1,   772,   773,
     461,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   469,    -1,
      -1,   200,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   211,   212,   213,   799,    -1,   801,   744,   803,
      -1,   805,   221,    -1,    -1,    -1,   225,   226,    -1,    -1,
      -1,    -1,    -1,    -1,   536,   652,    -1,    -1,    -1,    -1,
      -1,    -1,   826,    -1,   828,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   524,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   678,    -1,    -1,    -1,   567,    -1,    -1,    -1,    -1,
     572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   552,    -1,    -1,   555,   556,   703,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   567,    -1,    -1,   601,
      -1,    -1,   604,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   613,   614,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,   625,    -1,    -1,    -1,   744,   630,    -1,
      -1,    -1,   603,    -1,    -1,    -1,    -1,    -1,    -1,   641,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   361,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    -1,    -1,
     379,   652,    -1,    71,    72,    73,   385,    -1,   387,    -1,
      -1,    -1,    -1,   392,    -1,    -1,    -1,   396,    -1,   398,
      -1,    -1,   704,    -1,    -1,    -1,   708,   678,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,    -1,   117,
     118,    -1,   703,    -1,    -1,   123,   124,   125,   126,    -1,
     742,    -1,   744,    -1,    -1,    -1,   134,   135,    -1,    -1,
      -1,   753,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   461,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   744,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   506,    -1,   508,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   533,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
     569,    -1,    -1,    -1,    -1,   574,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,    -1,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,   136,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   642,   643,    -1,    -1,    28,    29,    30,
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
      -1,    -1,    -1,   135,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      71,    72,    73,   109,    -1,    28,   112,    -1,    -1,   115,
     116,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   135,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,    -1,   115,    -1,   117,   118,    71,    72,
      73,    -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
      -1,    -1,   115,    -1,   117,   118,    -1,    -1,    -1,    -1,
     123,   124,   125,   126,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    28,    -1,    -1,    -1,    -1,    85,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    28,    -1,   115,    -1,
     117,   118,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    -1,    -1,   109,    28,    -1,   112,    -1,    -1,
     115,   116,   117,   118,    -1,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,    -1,   115,   116,   117,   118,    -1,    71,    72,
      73,   123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,     3,    -1,   112,
      -1,    -1,   115,    28,   117,   118,    -1,    -1,    -1,    -1,
     123,   124,   125,   126,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   134,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    71,    72,    73,    74,
      -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,
     115,   116,   117,   118,   100,    -1,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,   110,   111,   112,     3,    -1,   115,
      -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   135,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,     3,    -1,   115,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   132,    -1,   134,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,   102,   103,    -1,    85,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,   100,   121,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,   110,   111,   112,    -1,     1,   115,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,
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
     123,   124,   125,   126,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,    -1,    -1,   115,   116,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,    -1,    -1,   115,   116,   117,   118,    -1,    -1,
      -1,    -1,   123,   124,   125,   126,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    28,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,    -1,    -1,
     115,   116,   117,   118,    -1,    -1,    -1,    -1,   123,   124,
     125,   126,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    28,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    28,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,   125,
     126,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      28,    -1,   112,    -1,    -1,   115,   116,   117,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
      -1,   115,   116,   117,   118,    -1,    -1,    -1,    -1,   123,
     124,   125,   126,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,    -1,   115,   116,   117,
     118,    28,    -1,    -1,    -1,   123,   124,   125,   126,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    28,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,
     115,    -1,   117,   118,    -1,   102,   103,    -1,   123,   124,
     125,   126,   109,    -1,    -1,   112,    -1,    -1,   115,    -1,
     117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,   126,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,    -1,   115,    -1,   117,   118,
      -1,    -1,    -1,    -1,   123,   124,   125,   126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,     1,    -1,
       3,    -1,    -1,   109,    -1,    -1,   112,    -1,    -1,   115,
      -1,   117,   118,    -1,    -1,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,   115,   116,    -1,    -1,    -1,   120,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,   115,   116,    -1,    -1,    -1,
     120,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,
      -1,    -1,    -1,   120,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      -1,   115,    -1,    -1,    -1,    -1,   120,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,   115,    -1,    -1,    -1,    -1,   120,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    -1,   115,    -1,    -1,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    -1,    -1,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    28,    -1,    -1,    79,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    66,   115,    -1,    -1,    -1,    -1,   120,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,
      -1,   115,    -1,    -1,    -1,    -1,   120,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    -1,    -1,    -1,     1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,   115,   116,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    -1,    -1,    -1,     1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
      -1,    -1,    -1,    -1,   116,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    -1,    -1,    -1,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,
      -1,    -1,    -1,   116,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    -1,    -1,
      -1,    -1,   116,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
     115,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,    -1,    -1,    -1,   115,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,     1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111
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
     142,   147,   132,     0,   193,   226,   227,   116,   147,   217,
     219,   228,   229,   230,     1,     4,     5,     6,     8,     9,
      71,    72,    73,   102,   103,   109,   112,   115,   117,   118,
     121,   123,   124,   125,   126,   140,   147,   148,   149,   150,
     154,   155,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   169,   170,   174,   248,   251,   215,
     220,   223,   227,   115,   120,   186,   115,   120,   116,   147,
     228,   231,   186,   215,   224,   147,   213,   214,   135,   135,
     219,   227,   140,   147,   140,   147,   161,   178,   185,   193,
     194,   196,   198,   199,   200,   201,   202,   212,   115,    68,
      78,   115,   117,   134,   136,   143,   144,   145,   146,   147,
     150,   179,   186,   204,   205,   206,   207,   208,   220,   221,
     223,   227,   250,   251,   253,   135,   135,   140,   174,   193,
     227,   116,   116,   116,   122,   115,   149,   152,   154,   156,
     115,   155,   155,   147,   179,   174,   179,   174,   115,   156,
     116,   155,   170,   171,   173,   176,   193,   194,   196,   212,
     232,   248,   121,   135,   135,     7,     8,     9,   115,   119,
     120,   158,   112,   127,   128,   124,   125,    10,    11,   161,
      12,    13,   113,   114,    14,    15,   123,   129,   130,    16,
      17,   131,   121,   215,   224,   116,   228,   121,   140,   174,
     121,   140,   174,   116,   116,   122,   133,   122,   136,   213,
     213,   116,   116,   133,   115,   147,   185,   186,   193,   194,
     196,   212,   217,   227,   133,    11,   114,   122,     3,    28,
      44,    74,    75,   116,   188,   189,   190,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    46,    47,    50,
      66,   100,   142,   147,   181,   185,   193,   195,   197,   203,
     211,   179,   221,   112,   115,   147,   179,   135,   242,   243,
     243,   243,   134,   243,   133,   115,   132,   134,   147,   186,
     209,   210,   220,   221,   225,   227,   223,   227,   136,   208,
     122,   134,   186,   223,   134,   134,   204,   136,   204,    51,
     230,   138,   147,   155,   177,   193,   194,   196,   212,   233,
       7,     8,     9,   115,   119,   120,   115,   120,   186,   216,
     218,   227,   147,   182,   185,   193,   195,   196,   212,   120,
     218,   182,   155,   233,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   133,   172,   116,   122,   193,   194,
     196,   212,   217,   116,   119,   134,   135,   136,   150,   151,
     170,   178,   235,   252,   254,   255,   256,   257,   258,   259,
     260,   136,   260,   147,   116,   151,   153,   171,   147,   173,
     158,   158,   158,   159,   159,   160,   160,   161,   161,   161,
     163,   163,   164,   165,   166,   167,   168,   173,   116,   121,
     121,   121,   121,   147,   174,   214,   134,   136,   134,   136,
     198,   199,   200,   227,   199,   200,   201,   116,   115,   116,
     189,   142,   147,   115,   113,   135,   147,   185,   193,   195,
     217,   147,   221,   186,   115,   136,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    77,   134,   147,
     173,   175,   178,   237,   238,   239,   240,   241,   243,   244,
     245,   246,   247,   249,   235,   116,   174,   135,   220,   227,
     122,   134,   132,   191,   186,   220,   223,   205,   223,   136,
     136,   116,   138,   193,   194,   196,   212,   217,   116,   147,
     116,   153,   147,   173,   116,   218,   228,   174,   216,   227,
     115,   120,   216,   113,   120,   147,   185,   193,   195,   196,
     212,   218,   174,   120,   120,   218,   116,   116,   151,   171,
     171,   158,   248,   136,   260,   133,   147,   221,   225,   243,
     122,   134,   134,   255,   257,   258,   136,   136,   116,   122,
     121,   132,   204,   204,   173,   116,   140,   147,   202,    69,
      70,   136,   113,   135,   135,   147,   116,   174,   132,   115,
     115,   115,   237,   115,   147,   134,   134,   134,   173,   147,
     132,   134,   134,   147,   183,   184,   219,   175,   240,   175,
     237,   136,   134,   136,   260,   220,   186,   210,   220,   227,
     174,   220,   116,   121,   116,   116,   121,   216,   116,   228,
     174,   202,   174,   113,   120,   121,   174,   174,   120,   136,
     235,   256,   151,   171,   170,   136,   136,   116,   116,   116,
     114,   243,   243,   202,    69,    70,   136,    69,    70,   136,
     135,   132,   237,   173,   173,   116,   173,    56,   116,   244,
     134,   134,   133,   237,   135,   122,   134,   133,   136,   220,
     227,   186,   220,   132,   116,   121,   114,   121,   202,   174,
     121,   121,   174,    70,   136,    69,   136,   114,   243,   243,
     243,   243,    69,    70,   136,   237,   116,   116,   237,   116,
     115,   237,   116,   244,   174,   136,   260,   184,   135,   171,
     234,   220,   220,   174,   114,   121,   121,   243,   243,    70,
     136,    69,   136,    70,   136,    69,   136,   243,   243,   237,
     237,   237,   173,   237,   116,   173,   134,   136,   234,   236,
     136,   136,   243,   243,   243,   243,    70,   136,    69,   136,
      64,   116,   237,   116,   122,   136,   136,   136,   136,   136,
     243,   243,   237,   134,   237,   136,   234,   136,   136
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
#line 3588 "type.ec"
	break;
      case 140: /* "type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3597 "type.ec"
	break;
      case 141: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3606 "type.ec"
	break;
      case 142: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3615 "type.ec"
	break;
      case 143: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3624 "type.ec"
	break;
      case 144: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3633 "type.ec"
	break;
      case 145: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3642 "type.ec"
	break;
      case 146: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3651 "type.ec"
	break;
      case 147: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 162 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3660 "type.ec"
	break;
      case 148: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3669 "type.ec"
	break;
      case 150: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3678 "type.ec"
	break;
      case 153: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3687 "type.ec"
	break;
      case 155: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3696 "type.ec"
	break;
      case 158: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3705 "type.ec"
	break;
      case 159: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3714 "type.ec"
	break;
      case 160: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3723 "type.ec"
	break;
      case 161: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3732 "type.ec"
	break;
      case 163: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3741 "type.ec"
	break;
      case 164: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3750 "type.ec"
	break;
      case 165: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3759 "type.ec"
	break;
      case 166: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3768 "type.ec"
	break;
      case 167: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3777 "type.ec"
	break;
      case 168: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3786 "type.ec"
	break;
      case 169: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3795 "type.ec"
	break;
      case 170: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3804 "type.ec"
	break;
      case 171: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3813 "type.ec"
	break;
      case 173: /* "expression" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3822 "type.ec"
	break;
      case 174: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3831 "type.ec"
	break;
      case 175: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3840 "type.ec"
	break;
      case 176: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3849 "type.ec"
	break;
      case 177: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3858 "type.ec"
	break;
      case 178: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3867 "type.ec"
	break;
      case 179: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3876 "type.ec"
	break;
      case 183: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3885 "type.ec"
	break;
      case 184: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3894 "type.ec"
	break;
      case 185: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3903 "type.ec"
	break;
      case 186: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3912 "type.ec"
	break;
      case 188: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3921 "type.ec"
	break;
      case 189: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3930 "type.ec"
	break;
      case 190: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3939 "type.ec"
	break;
      case 191: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3948 "type.ec"
	break;
      case 192: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3957 "type.ec"
	break;
      case 193: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3966 "type.ec"
	break;
      case 194: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3975 "type.ec"
	break;
      case 195: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3984 "type.ec"
	break;
      case 196: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3993 "type.ec"
	break;
      case 197: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4002 "type.ec"
	break;
      case 198: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4011 "type.ec"
	break;
      case 199: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4020 "type.ec"
	break;
      case 200: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4029 "type.ec"
	break;
      case 201: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4038 "type.ec"
	break;
      case 204: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4047 "type.ec"
	break;
      case 205: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4056 "type.ec"
	break;
      case 206: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4065 "type.ec"
	break;
      case 207: /* "property" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4074 "type.ec"
	break;
      case 208: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4083 "type.ec"
	break;
      case 209: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4092 "type.ec"
	break;
      case 210: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4101 "type.ec"
	break;
      case 211: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4110 "type.ec"
	break;
      case 212: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4119 "type.ec"
	break;
      case 213: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4128 "type.ec"
	break;
      case 214: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4137 "type.ec"
	break;
      case 215: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4146 "type.ec"
	break;
      case 216: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4155 "type.ec"
	break;
      case 217: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4164 "type.ec"
	break;
      case 218: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4173 "type.ec"
	break;
      case 219: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4182 "type.ec"
	break;
      case 220: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4191 "type.ec"
	break;
      case 221: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4200 "type.ec"
	break;
      case 222: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4209 "type.ec"
	break;
      case 223: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4218 "type.ec"
	break;
      case 224: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4227 "type.ec"
	break;
      case 225: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4236 "type.ec"
	break;
      case 226: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4245 "type.ec"
	break;
      case 227: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4254 "type.ec"
	break;
      case 228: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4263 "type.ec"
	break;
      case 229: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4272 "type.ec"
	break;
      case 230: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4281 "type.ec"
	break;
      case 231: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4290 "type.ec"
	break;
      case 232: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4299 "type.ec"
	break;
      case 233: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4308 "type.ec"
	break;
      case 234: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4317 "type.ec"
	break;
      case 235: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4326 "type.ec"
	break;
      case 236: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4335 "type.ec"
	break;
      case 237: /* "statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4344 "type.ec"
	break;
      case 238: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4353 "type.ec"
	break;
      case 239: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4362 "type.ec"
	break;
      case 240: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4371 "type.ec"
	break;
      case 241: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4380 "type.ec"
	break;
      case 242: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4389 "type.ec"
	break;
      case 243: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4398 "type.ec"
	break;
      case 244: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4407 "type.ec"
	break;
      case 245: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4416 "type.ec"
	break;
      case 246: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4425 "type.ec"
	break;
      case 247: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4434 "type.ec"
	break;
      case 248: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4443 "type.ec"
	break;
      case 249: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4452 "type.ec"
	break;
      case 251: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4461 "type.ec"
	break;
      case 253: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4470 "type.ec"
	break;
      case 254: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4479 "type.ec"
	break;
      case 255: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4488 "type.ec"
	break;
      case 256: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4497 "type.ec"
	break;
      case 257: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4506 "type.ec"
	break;
      case 258: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4515 "type.ec"
	break;
      case 259: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4524 "type.ec"
	break;
      case 260: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4533 "type.ec"
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
#line 811 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 877 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument((yyvsp[(1) - (1)].templateDatatype)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 903 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 910 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
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

  case 280:

/* Line 1464 of yacc.c  */
#line 938 "type.y"
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

  case 281:

/* Line 1464 of yacc.c  */
#line 952 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 953 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 957 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 958 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 962 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 967 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 971 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 972 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 977 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 979 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 981 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 988 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 990 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 999 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1010 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1034 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1041 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1060 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1062 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1075 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1089 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1091 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1108 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1125 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1131 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1182 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1191 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1193 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1197 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1199 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1205 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1208 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1210 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1222 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1224 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1226 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1233 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1240 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1241 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1248 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1252 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1254 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1269 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1270 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1271 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1283 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), null); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1287 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1289 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), (yyvsp[(2) - (2)].declarator));  ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1291 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(TYPED_OBJECT)), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1293 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), null); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1295 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(ANY_OBJECT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1298 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), null); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1299 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1301 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(INT)), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1305 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1306 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1310 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1311 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1315 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1316 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1321 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
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

  case 423:

/* Line 1464 of yacc.c  */
#line 1341 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1343 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1365 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1367 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1381 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1383 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1385 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1389 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1390 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1394 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1395 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1402 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1403 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1404 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1413 "type.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1421 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1425 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1426 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1430 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1431 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1432 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1436 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1437 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1438 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1441 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1442 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1443 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1447 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1448 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1462 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1467 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1469 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1494 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1496 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1498 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1500 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1505 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1507 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1511 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1515 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1517 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1519 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1527 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1532 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1536 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1537 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1542 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1544 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1549 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1553 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1554 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1555 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1557 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1558 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1564 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8208 "type.ec"
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
#line 1572 "type.y"


