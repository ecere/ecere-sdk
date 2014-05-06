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
     RESTRICT = 371,
     THREAD = 372
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
#line 300 "type.ec"
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
#line 325 "type.ec"

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
#define YYLAST   8981

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  143
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  499
/* YYNRULES -- Number of states.  */
#define YYNSTATES  858

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   372

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,     2,     2,   124,   134,   129,     2,
     121,   122,   118,   130,   128,   131,   125,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   138,   140,
     119,   139,   120,   137,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   126,     2,   127,   135,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   141,   136,   142,   123,     2,     2,     2,
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
     115,   116,   117
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
     153,   157,   160,   164,   167,   170,   172,   174,   176,   180,
     184,   187,   190,   193,   196,   201,   204,   209,   211,   213,
     215,   217,   219,   221,   223,   225,   227,   229,   234,   236,
     240,   244,   248,   250,   254,   258,   260,   264,   268,   271,
     273,   276,   280,   284,   288,   290,   294,   298,   300,   304,
     306,   310,   312,   316,   318,   322,   324,   328,   330,   336,
     338,   342,   346,   348,   350,   352,   354,   356,   358,   360,
     362,   364,   366,   368,   370,   374,   376,   379,   383,   386,
     392,   394,   397,   399,   402,   404,   407,   409,   412,   414,
     417,   419,   422,   424,   427,   429,   432,   434,   437,   439,
     442,   444,   447,   449,   452,   454,   457,   459,   462,   464,
     467,   469,   472,   474,   477,   479,   482,   484,   487,   489,
     492,   494,   496,   498,   501,   503,   506,   508,   511,   513,
     516,   521,   527,   529,   532,   534,   537,   539,   542,   544,
     547,   549,   552,   554,   557,   562,   568,   570,   574,   576,
     580,   582,   584,   586,   588,   590,   592,   594,   596,   598,
     600,   602,   604,   606,   608,   610,   612,   614,   616,   621,
     623,   626,   630,   637,   643,   645,   647,   649,   651,   653,
     655,   657,   659,   661,   663,   665,   667,   669,   671,   673,
     675,   677,   679,   681,   683,   685,   687,   692,   697,   702,
     704,   706,   708,   710,   712,   714,   716,   718,   720,   722,
     724,   726,   728,   730,   732,   734,   736,   738,   740,   742,
     744,   749,   754,   759,   761,   767,   772,   777,   781,   787,
     794,   800,   806,   811,   818,   821,   824,   828,   832,   834,
     837,   839,   842,   844,   846,   848,   852,   856,   860,   864,
     866,   870,   872,   874,   876,   879,   883,   885,   889,   899,
     909,   917,   925,   931,   942,   953,   962,   971,   978,   987,
     996,  1003,  1010,  1015,  1025,  1035,  1043,  1051,  1057,  1061,
    1064,  1067,  1070,  1072,  1075,  1077,  1079,  1081,  1085,  1087,
    1090,  1093,  1097,  1103,  1106,  1109,  1114,  1120,  1128,  1136,
    1142,  1144,  1148,  1150,  1154,  1158,  1161,  1165,  1169,  1173,
    1178,  1183,  1186,  1190,  1194,  1199,  1203,  1206,  1210,  1214,
    1219,  1221,  1223,  1226,  1229,  1232,  1236,  1238,  1240,  1243,
    1246,  1249,  1253,  1255,  1258,  1262,  1265,  1267,  1271,  1276,
    1280,  1285,  1287,  1290,  1293,  1297,  1301,  1304,  1308,  1312,
    1315,  1317,  1319,  1322,  1325,  1327,  1330,  1333,  1337,  1341,
    1343,  1346,  1348,  1351,  1354,  1358,  1360,  1364,  1366,  1370,
    1373,  1376,  1379,  1383,  1385,  1387,  1389,  1393,  1395,  1398,
    1400,  1403,  1405,  1409,  1414,  1416,  1418,  1420,  1424,  1426,
    1428,  1430,  1432,  1434,  1436,  1440,  1445,  1449,  1451,  1454,
    1456,  1459,  1462,  1464,  1466,  1469,  1471,  1474,  1478,  1480,
    1483,  1489,  1497,  1503,  1509,  1517,  1524,  1532,  1537,  1543,
    1548,  1552,  1555,  1558,  1561,  1565,  1567,  1573,  1578,  1584,
    1589,  1594,  1598,  1603,  1607,  1611,  1614,  1617,  1620,  1623,
    1626,  1629,  1632,  1635,  1638,  1642,  1644,  1646,  1650,  1653,
    1655,  1657,  1660,  1663,  1665,  1668,  1670,  1672,  1675,  1677
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     265,     0,    -1,   153,   118,    -1,   153,   119,    -1,   153,
       1,    -1,   148,    -1,   153,   153,    -1,    28,    -1,   147,
      -1,   147,   119,   206,   120,    -1,   147,   119,   206,    11,
      -1,   183,   225,    -1,   225,    -1,   183,   121,   122,    -1,
     123,   183,   121,   122,    -1,    78,   183,   225,    -1,    78,
     225,    -1,     3,    -1,   155,    -1,   121,   177,   122,    -1,
     153,    -1,   255,    -1,     4,    -1,   252,    -1,   124,   252,
      -1,   124,   252,   125,   252,    -1,   121,   122,    -1,    71,
     183,   222,   126,   178,   127,    -1,    71,   183,   126,   178,
     127,    -1,   102,   183,   222,   126,   178,   127,    -1,   102,
     183,   126,   178,   127,    -1,    72,   178,   186,   222,   126,
     178,   127,    -1,    72,   178,   186,   126,   178,   127,    -1,
     103,   178,   186,   222,   126,   178,   127,    -1,   103,   178,
     186,   126,   178,   127,    -1,     1,    -1,   154,    -1,   156,
     126,   177,   127,    -1,   156,   121,   122,    -1,   156,   121,
     158,   122,    -1,   156,   125,   153,    -1,   156,   153,    -1,
     156,     7,   153,    -1,   156,     8,    -1,   156,     9,    -1,
     256,    -1,   175,    -1,   157,    -1,   158,   128,   175,    -1,
     158,   128,   157,    -1,     8,   160,    -1,     9,   160,    -1,
     161,   162,    -1,     6,   160,    -1,     6,   121,   237,   122,
      -1,   109,   160,    -1,   109,   121,   237,   122,    -1,   159,
      -1,   156,    -1,   129,    -1,   118,    -1,   130,    -1,   131,
      -1,   123,    -1,   132,    -1,    73,    -1,   160,    -1,   121,
     236,   122,   162,    -1,   162,    -1,   163,   118,   162,    -1,
     163,   133,   162,    -1,   163,   134,   162,    -1,   163,    -1,
     164,   130,   163,    -1,   164,   131,   163,    -1,   164,    -1,
     165,    10,   164,    -1,   165,    11,   164,    -1,   167,   119,
      -1,   165,    -1,   166,   165,    -1,   167,   120,   165,    -1,
     167,    12,   165,    -1,   167,    13,   165,    -1,   167,    -1,
     168,    14,   167,    -1,   168,    15,   167,    -1,   168,    -1,
     169,   129,   168,    -1,   169,    -1,   170,   135,   169,    -1,
     170,    -1,   171,   136,   170,    -1,   171,    -1,   172,    16,
     171,    -1,   172,    -1,   173,    17,   172,    -1,   173,    -1,
     173,   137,   177,   138,   174,    -1,   174,    -1,   160,   176,
     175,    -1,   160,   176,   157,    -1,   139,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   175,    -1,
     177,   128,   175,    -1,   174,    -1,   182,   140,    -1,   182,
     187,   140,    -1,   253,   140,    -1,    77,   153,   139,   178,
     140,    -1,   197,    -1,   180,   197,    -1,   198,    -1,   180,
     198,    -1,   216,    -1,   180,   216,    -1,   200,    -1,   180,
     200,    -1,   197,    -1,   181,   197,    -1,   198,    -1,   181,
     198,    -1,   144,    -1,   181,   144,    -1,   216,    -1,   181,
     216,    -1,   200,    -1,   181,   200,    -1,   189,    -1,   182,
     189,    -1,   197,    -1,   182,   197,    -1,   198,    -1,   182,
     198,    -1,   216,    -1,   182,   216,    -1,   200,    -1,   182,
     200,    -1,   189,    -1,   183,   189,    -1,   197,    -1,   183,
     197,    -1,   198,    -1,   183,   198,    -1,   144,    -1,   183,
     144,    -1,   200,    -1,   183,   200,    -1,   216,    -1,   183,
     216,    -1,   183,    -1,   145,    -1,   189,    -1,   185,   189,
      -1,   197,    -1,   185,   197,    -1,   199,    -1,   185,   199,
      -1,   153,    -1,   185,   153,    -1,   153,   119,   206,   120,
      -1,   185,   153,   119,   206,   120,    -1,   189,    -1,   186,
     189,    -1,   197,    -1,   186,   197,    -1,   199,    -1,   186,
     199,    -1,   200,    -1,   186,   200,    -1,   216,    -1,   186,
     216,    -1,   153,    -1,   186,   153,    -1,   153,   119,   206,
     120,    -1,   186,   153,   119,   206,   120,    -1,   188,    -1,
     187,   128,   188,    -1,   223,    -1,   223,   139,   238,    -1,
      29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,    -1,
     117,    -1,    74,    -1,    75,    -1,   195,    -1,    79,    -1,
     110,    -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,
      74,    -1,    44,    -1,   192,    -1,   192,   121,   177,   122,
      -1,   193,    -1,   194,   193,    -1,   194,   128,   193,    -1,
     191,   121,   121,   194,   122,   122,    -1,   191,   121,   121,
     122,   122,    -1,   190,    -1,    44,    -1,    45,    -1,   196,
      -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,
      -1,    40,    -1,    41,    -1,    85,    -1,   113,    -1,   112,
      -1,   201,    -1,   215,    -1,   146,    -1,    87,   121,   175,
     122,    -1,   100,   121,   146,   122,    -1,   100,   121,   153,
     122,    -1,    66,    -1,    82,    -1,    83,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,    85,    -1,   113,    -1,   112,    -1,   201,    -1,
     215,    -1,   148,    -1,    87,   121,   175,   122,    -1,   100,
     121,   146,   122,    -1,   100,   121,   153,   122,    -1,    66,
      -1,   207,   153,   141,   208,   142,    -1,   207,   141,   208,
     142,    -1,   207,   153,   141,   142,    -1,   207,   141,   142,
      -1,   207,   147,   141,   208,   142,    -1,   207,   190,   153,
     141,   208,   142,    -1,   207,   190,   141,   208,   142,    -1,
     207,   190,   153,   141,   142,    -1,   207,   190,   141,   142,
      -1,   207,   190,   148,   141,   208,   142,    -1,   207,   153,
      -1,   207,   148,    -1,   207,   190,   153,    -1,   207,   190,
     148,    -1,   183,    -1,   183,   221,    -1,   183,    -1,   183,
     221,    -1,   165,    -1,   204,    -1,   203,    -1,   153,   139,
     204,    -1,   153,   139,   203,    -1,   202,   139,   204,    -1,
     202,   139,   203,    -1,   205,    -1,   206,   128,   205,    -1,
      48,    -1,    49,    -1,   212,    -1,   208,   212,    -1,   156,
     139,   239,    -1,   209,    -1,   210,   128,   209,    -1,    68,
     185,   153,   141,    69,   247,    70,   247,   142,    -1,    68,
     185,   153,   141,    70,   247,    69,   247,   142,    -1,    68,
     185,   153,   141,    69,   247,   142,    -1,    68,   185,   153,
     141,    70,   247,   142,    -1,    68,   185,   153,   141,   142,
      -1,    68,   185,   221,   153,   141,    69,   247,    70,   247,
     142,    -1,    68,   185,   221,   153,   141,    70,   247,    69,
     247,   142,    -1,    68,   185,   221,   153,   141,    69,   247,
     142,    -1,    68,   185,   221,   153,   141,    70,   247,   142,
      -1,    68,   185,   221,   153,   141,   142,    -1,    68,   185,
     141,    69,   247,    70,   247,   142,    -1,    68,   185,   141,
      70,   247,    69,   247,   142,    -1,    68,   185,   141,    69,
     247,   142,    -1,    68,   185,   141,    70,   247,   142,    -1,
      68,   185,   141,   142,    -1,    68,   185,   221,   141,    69,
     247,    70,   247,   142,    -1,    68,   185,   221,   141,    70,
     247,    69,   247,   142,    -1,    68,   185,   221,   141,    69,
     247,   142,    -1,    68,   185,   221,   141,    70,   247,   142,
      -1,    68,   185,   221,   141,   142,    -1,   183,   213,   140,
      -1,   183,   140,    -1,   255,   140,    -1,   254,   140,    -1,
     257,    -1,   210,   140,    -1,   211,    -1,   140,    -1,   214,
      -1,   213,   128,   214,    -1,   229,    -1,   229,   195,    -1,
     138,   178,    -1,   229,   138,   178,    -1,   229,   138,   178,
     138,   178,    -1,    50,   153,    -1,    50,   148,    -1,    50,
     141,   217,   142,    -1,    50,   153,   141,   217,   142,    -1,
      50,   153,   141,   217,   140,   208,   142,    -1,    50,   148,
     141,   217,   140,   208,   142,    -1,    50,   148,   141,   217,
     142,    -1,   218,    -1,   217,   128,   218,    -1,   153,    -1,
     153,   139,   178,    -1,   121,   221,   122,    -1,   126,   127,
      -1,   126,   178,   127,    -1,   126,   146,   127,    -1,   219,
     126,   127,    -1,   219,   126,   178,   127,    -1,   219,   126,
     146,   127,    -1,   121,   122,    -1,   121,   232,   122,    -1,
     219,   121,   122,    -1,   219,   121,   232,   122,    -1,   121,
     222,   122,    -1,   121,   122,    -1,   121,   232,   122,    -1,
     220,   121,   122,    -1,   220,   121,   232,   122,    -1,   231,
      -1,   219,    -1,   231,   219,    -1,   190,   231,    -1,   190,
     219,    -1,   190,   231,   219,    -1,   231,    -1,   220,    -1,
     231,   220,    -1,   190,   231,    -1,   190,   220,    -1,   190,
     231,   220,    -1,   228,    -1,   231,   228,    -1,   190,   231,
     228,    -1,   223,   190,    -1,   153,    -1,   121,   223,   122,
      -1,   224,   126,   178,   127,    -1,   224,   126,   127,    -1,
     224,   126,   146,   127,    -1,   227,    -1,   231,   227,    -1,
     190,   227,    -1,   190,   231,   227,    -1,   231,   190,   227,
      -1,   224,   121,    -1,   226,   232,   122,    -1,   226,   235,
     122,    -1,   226,   122,    -1,   227,    -1,   224,    -1,   190,
     227,    -1,   190,   224,    -1,   224,    -1,   231,   224,    -1,
     190,   224,    -1,   190,   231,   224,    -1,   231,   190,   224,
      -1,   197,    -1,   230,   197,    -1,   118,    -1,   118,   230,
      -1,   118,   231,    -1,   118,   230,   231,    -1,   233,    -1,
     233,   128,    51,    -1,   234,    -1,   233,   128,   234,    -1,
     183,   223,    -1,   183,   221,    -1,   183,   129,    -1,   183,
     129,   223,    -1,   184,    -1,    65,    -1,   153,    -1,   235,
     128,   153,    -1,   180,    -1,   180,   221,    -1,   181,    -1,
     181,   221,    -1,   175,    -1,   141,   240,   142,    -1,   141,
     240,   128,   142,    -1,   174,    -1,   157,    -1,   238,    -1,
     240,   128,   238,    -1,   242,    -1,   247,    -1,   248,    -1,
     249,    -1,   250,    -1,   251,    -1,   153,   138,   241,    -1,
      52,   178,   138,   241,    -1,    53,   138,   241,    -1,   179,
      -1,   243,   179,    -1,   241,    -1,   244,   241,    -1,   244,
     179,    -1,   244,    -1,   243,    -1,   243,   244,    -1,   141,
      -1,   141,   142,    -1,   246,   245,   142,    -1,   140,    -1,
     177,   140,    -1,    54,   121,   177,   122,   241,    -1,    54,
     121,   177,   122,   241,    64,   241,    -1,    55,   121,   177,
     122,   241,    -1,    56,   121,   177,   122,   241,    -1,    57,
     241,    56,   121,   177,   122,   140,    -1,    58,   121,   248,
     248,   122,   241,    -1,    58,   121,   248,   248,   177,   122,
     241,    -1,    56,   121,   122,   241,    -1,    58,   121,   248,
     122,   241,    -1,    58,   121,   122,   241,    -1,    59,   153,
     140,    -1,    60,   140,    -1,    61,   140,    -1,    62,   140,
      -1,    62,   177,   140,    -1,     5,    -1,   182,   153,   141,
     264,   142,    -1,   182,   153,   141,   142,    -1,   183,   153,
     141,   264,   142,    -1,   183,   153,   141,   142,    -1,   146,
     141,   264,   142,    -1,   146,   141,   142,    -1,   153,   141,
     264,   142,    -1,   153,   141,   142,    -1,   141,   264,   142,
      -1,   141,   142,    -1,   149,   247,    -1,   152,   247,    -1,
     152,   140,    -1,   150,   247,    -1,   151,   247,    -1,   182,
     225,    -1,   182,   229,    -1,   258,   247,    -1,   156,   139,
     239,    -1,   239,    -1,   260,    -1,   261,   128,   260,    -1,
     261,   140,    -1,   262,    -1,   259,    -1,   263,   262,    -1,
     263,   259,    -1,   140,    -1,   263,   140,    -1,   263,    -1,
     261,    -1,   263,   261,    -1,   234,    -1,   234,   138,   178,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   228,   228,   246,   280,   330,   331,   358,   362,   363,
     364,   381,   383,   388,   393,   398,   400,   405,   410,   411,
     416,   418,   420,   422,   424,   425,   426,   429,   430,   431,
     432,   433,   434,   435,   436,   437,   441,   442,   443,   444,
     445,   446,   459,   460,   461,   465,   494,   495,   496,   497,
     501,   502,   503,   505,   506,   508,   509,   513,   514,   523,
     524,   525,   526,   527,   528,   529,   533,   534,   538,   539,
     540,   541,   545,   546,   547,   551,   552,   553,   557,   565,
     566,   567,   568,   569,   573,   574,   575,   579,   580,   584,
     585,   589,   590,   594,   595,   599,   600,   604,   605,   609,
     610,   611,   615,   616,   617,   618,   619,   620,   621,   622,
     623,   624,   625,   629,   630,   634,   638,   639,   640,   641,
     645,   646,   647,   648,   649,   650,   651,   652,   656,   657,
     658,   659,   660,   661,   662,   663,   664,   665,   669,   670,
     671,   672,   673,   674,   675,   676,   677,   678,   682,   683,
     684,   685,   686,   687,   688,   689,   690,   691,   692,   693,
     697,   698,   702,   703,   704,   705,   706,   707,   708,   709,
     710,   728,   745,   746,   747,   748,   749,   750,   751,   752,
     753,   754,   755,   756,   757,   775,   792,   793,   797,   798,
     802,   803,   804,   805,   806,   807,   811,   812,   813,   817,
     818,   819,   824,   825,   826,   827,   828,   832,   833,   837,
     838,   839,   843,   844,   848,   852,   853,   854,   859,   860,
     861,   862,   863,   864,   865,   866,   867,   868,   869,   870,
     871,   872,   873,   874,   875,   876,   877,   878,   879,   880,
     881,   882,   886,   887,   888,   889,   890,   891,   892,   893,
     894,   895,   896,   897,   898,   899,   900,   901,   902,   903,
     904,   905,   906,   907,   912,   913,   914,   915,   916,   919,
     920,   921,   922,   923,   928,   929,   932,   934,   939,   940,
     945,   946,   957,   961,   963,   964,   966,   967,   991,  1006,
    1007,  1011,  1012,  1016,  1017,  1021,  1025,  1026,  1030,  1032,
    1034,  1036,  1038,  1041,  1043,  1045,  1047,  1049,  1052,  1054,
    1056,  1058,  1060,  1063,  1065,  1067,  1069,  1071,  1076,  1077,
    1078,  1079,  1080,  1081,  1082,  1083,  1087,  1089,  1094,  1096,
    1098,  1100,  1102,  1107,  1108,  1112,  1114,  1115,  1116,  1117,
    1121,  1123,  1128,  1130,  1136,  1138,  1140,  1142,  1144,  1146,
    1148,  1150,  1152,  1154,  1156,  1161,  1163,  1165,  1167,  1169,
    1174,  1175,  1176,  1177,  1178,  1179,  1183,  1184,  1185,  1186,
    1187,  1188,  1234,  1235,  1237,  1239,  1244,  1246,  1248,  1250,
    1252,  1257,  1258,  1261,  1263,  1265,  1271,  1275,  1277,  1279,
    1284,  1285,  1286,  1288,  1293,  1294,  1295,  1296,  1297,  1301,
    1302,  1306,  1307,  1308,  1309,  1313,  1314,  1318,  1319,  1323,
    1324,  1325,  1326,  1327,  1338,  1363,  1364,  1368,  1369,  1373,
    1374,  1378,  1380,  1382,  1398,  1400,  1422,  1424,  1429,  1430,
    1431,  1432,  1433,  1434,  1438,  1440,  1442,  1447,  1448,  1452,
    1453,  1456,  1460,  1461,  1462,  1466,  1470,  1478,  1483,  1484,
    1488,  1489,  1490,  1494,  1495,  1496,  1497,  1499,  1500,  1501,
    1505,  1506,  1507,  1508,  1509,  1513,  1517,  1519,  1524,  1526,
    1551,  1553,  1555,  1557,  1562,  1564,  1568,  1570,  1572,  1574,
    1576,  1582,  1584,  1589,  1594,  1595,  1599,  1601,  1606,  1611,
    1612,  1613,  1614,  1615,  1616,  1620,  1621,  1622,  1626,  1627
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
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "THREAD", "'*'", "'<'",
  "'>'", "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','", "'&'",
  "'+'", "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'", "'='",
  "';'", "'{'", "'}'", "$accept", "guess_type", "real_guess_type", "type",
  "base_strict_type", "strict_type", "class_function_definition_start",
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
     365,   366,   367,   368,   369,   370,   371,   372,    42,    60,
      62,    40,    41,   126,    36,    46,    91,    93,    44,    38,
      43,    45,    33,    47,    37,    94,   124,    63,    58,    61,
      59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   143,   144,   144,   145,   146,   146,   147,   148,   148,
     148,   149,   149,   150,   151,   152,   152,   153,   154,   154,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   155,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   157,   158,   158,   158,   158,
     159,   159,   159,   159,   159,   159,   159,   160,   160,   161,
     161,   161,   161,   161,   161,   161,   162,   162,   163,   163,
     163,   163,   164,   164,   164,   165,   165,   165,   166,   167,
     167,   167,   167,   167,   168,   168,   168,   169,   169,   170,
     170,   171,   171,   172,   172,   173,   173,   174,   174,   175,
     175,   175,   176,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   177,   177,   178,   179,   179,   179,   179,
     180,   180,   180,   180,   180,   180,   180,   180,   181,   181,
     181,   181,   181,   181,   181,   181,   181,   181,   182,   182,
     182,   182,   182,   182,   182,   182,   182,   182,   183,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     184,   184,   185,   185,   185,   185,   185,   185,   185,   185,
     185,   185,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   187,   187,   188,   188,
     189,   189,   189,   189,   189,   189,   190,   190,   190,   191,
     191,   191,   192,   192,   192,   192,   192,   193,   193,   194,
     194,   194,   195,   195,   196,   197,   197,   197,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   201,   201,   201,   201,   202,   202,
     203,   203,   204,   205,   205,   205,   205,   205,   205,   206,
     206,   207,   207,   208,   208,   209,   210,   210,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   212,   212,
     212,   212,   212,   212,   212,   212,   213,   213,   214,   214,
     214,   214,   214,   215,   215,   216,   216,   216,   216,   216,
     217,   217,   218,   218,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   220,   220,   220,   220,   220,
     221,   221,   221,   221,   221,   221,   222,   222,   222,   222,
     222,   222,   223,   223,   223,   223,   224,   224,   224,   224,
     224,   225,   225,   225,   225,   225,   226,   227,   227,   227,
     228,   228,   228,   228,   229,   229,   229,   229,   229,   230,
     230,   231,   231,   231,   231,   232,   232,   233,   233,   234,
     234,   234,   234,   234,   234,   235,   235,   236,   236,   237,
     237,   238,   238,   238,   239,   239,   240,   240,   241,   241,
     241,   241,   241,   241,   242,   242,   242,   243,   243,   244,
     244,   244,   245,   245,   245,   246,   247,   247,   248,   248,
     249,   249,   249,   250,   250,   250,   250,   250,   250,   250,
     251,   251,   251,   251,   251,   252,   253,   253,   254,   254,
     255,   255,   255,   255,   256,   256,   257,   257,   257,   257,
     257,   258,   258,   259,   260,   260,   261,   261,   262,   263,
     263,   263,   263,   263,   263,   264,   264,   264,   265,   265
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     4,     2,     6,     5,     6,
       5,     7,     6,     7,     6,     1,     1,     4,     3,     4,
       3,     2,     3,     2,     2,     1,     1,     1,     3,     3,
       2,     2,     2,     2,     4,     2,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     1,     3,
       3,     3,     1,     3,     3,     1,     3,     3,     2,     1,
       2,     3,     3,     3,     1,     3,     3,     1,     3,     1,
       3,     1,     3,     1,     3,     1,     3,     1,     5,     1,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     1,     2,     3,     2,     5,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     1,     1,     2,     1,     2,     1,     2,     1,     2,
       4,     5,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     4,     5,     1,     3,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
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
       0,    17,     7,   190,   191,   192,   193,   194,   219,   220,
     221,   222,   223,   225,   228,   229,   226,   227,   215,   216,
     218,   224,   291,   292,     0,   414,   239,   196,   197,   199,
     240,   241,   230,     0,     0,   200,   201,   232,   231,   195,
     154,   161,   235,     8,     5,     0,   160,   413,   148,   214,
       0,   198,   217,   150,   152,   156,   233,     0,   234,   158,
     498,     0,     0,   334,   333,     0,     0,     0,     4,     2,
       3,     6,   401,     0,     0,   411,   155,   376,   149,   214,
     151,   153,   157,   159,   361,   410,   409,   391,     0,   390,
     372,   360,     0,     0,     8,   275,   274,     0,     0,     1,
     342,     0,   340,     0,     0,    35,    22,   465,     0,     0,
       0,     0,     0,    65,     0,     0,     0,    60,     0,    63,
       0,    59,    61,    62,    64,     0,    20,    36,    18,    58,
      57,    66,     0,    68,    72,    75,    79,     0,    84,    87,
      89,    91,    93,    95,    97,    99,     0,    23,    21,     0,
       0,   235,    20,    66,   282,   280,     0,   284,   283,   289,
       0,   399,   402,   403,   351,     0,     0,     0,     0,   405,
     407,   345,     0,   115,     0,     0,   376,     0,   412,     0,
     364,   393,   392,   363,     0,     0,   375,   386,     0,   389,
       0,     0,     0,     0,   362,   373,     0,     0,     0,     0,
       0,   325,   267,     0,     0,     0,     0,    20,     0,     0,
     214,     0,   296,     0,   324,   293,     0,    12,   381,     0,
       0,    21,   322,     0,     0,     0,   277,   276,   499,     0,
       0,   335,     0,     0,     0,    53,     0,    50,    51,     0,
       0,     0,     0,     0,     0,    55,    26,   113,     0,   417,
     120,   122,   126,   124,     0,    24,     0,     0,     0,    43,
      44,     0,     0,     0,    41,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   102,     0,    52,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   236,   237,
     238,     0,     0,   214,   281,   360,     0,    10,     9,     0,
     400,   404,   344,   377,   352,     0,   347,   346,     0,   365,
     374,   353,     0,   348,     0,     0,   379,     0,     0,   387,
     388,     0,   202,   203,   206,   205,   204,     0,   207,   209,
       0,   243,   244,   245,   246,   247,   249,   252,   253,   250,
     251,   242,   248,     0,   263,   254,     0,     0,   256,   255,
     259,   168,     0,   162,   164,   166,   257,     0,   258,     0,
      16,    60,     0,    20,     0,   445,     0,   476,   479,   480,
     478,   477,     0,     0,     0,   319,   376,   214,     0,   326,
     394,    11,   328,     0,   383,     0,   265,   294,     0,   323,
       0,   382,   321,   320,     0,   266,     0,   272,     0,     0,
       0,   343,   341,     0,   339,     0,   336,   132,    20,   419,
     128,   130,   136,   134,     0,     0,     0,   214,   367,     0,
     366,   182,     0,   172,   174,   176,   178,   180,     0,     0,
       0,     0,    19,     0,     0,   121,   123,   127,   125,   418,
       0,     0,   493,     0,   471,    58,   425,   424,     0,   138,
     140,   142,   146,   144,   485,    45,     0,   490,   486,   496,
     489,     0,     0,   473,     0,    42,    38,    47,     0,    46,
      40,     0,   101,   100,    69,    70,    71,    73,    74,    76,
      77,    82,    83,    81,    85,    86,    88,    90,    92,    94,
      96,     0,   280,   286,   285,   363,   288,   287,   290,   406,
     408,   354,   350,   349,   380,   378,   416,   213,     0,     0,
       0,   210,   334,   333,     0,     0,     0,     0,   169,   163,
     165,   167,     0,   274,     0,    15,   214,     0,   446,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   448,    20,     0,   437,     0,   439,   428,     0,     0,
       0,   429,   430,   431,   432,   433,     0,   295,    13,   330,
       0,   396,     0,     0,   318,     0,   329,     0,   395,   384,
     297,   385,   268,   264,   270,     0,   271,     0,     0,     0,
     133,   129,   131,   137,   135,   420,    54,   356,     0,     0,
       0,   370,   369,     0,     0,   368,     0,     0,   183,   173,
     175,   177,   179,   181,     0,     0,     0,     0,     0,    56,
     114,    67,    25,   475,     0,     0,   376,   139,   141,   143,
     147,   145,   481,   482,   483,     0,   488,   494,   492,   497,
     491,   470,   472,    39,     0,    37,     0,   281,     0,   212,
     211,     0,     0,     0,     0,     0,     0,   312,     0,     0,
       0,     0,   277,   276,    14,     0,     0,     0,     0,     0,
       0,     0,     0,   461,   462,   463,     0,     0,     0,   449,
     116,   376,     0,   186,   188,   438,     0,   441,   440,   447,
     118,   469,     0,   397,     0,   327,   394,     0,   331,   398,
     273,   269,   338,   337,   355,   357,    28,   371,   358,     0,
       0,     0,     0,     0,     0,    30,     0,     0,     0,   474,
     484,   487,    49,    48,    98,   208,   260,   261,   262,   170,
       0,     0,     0,     0,     0,   302,     0,     0,   317,     0,
       0,   436,     0,     0,     0,     0,     0,     0,     0,   460,
     464,     0,   434,     0,     0,   117,     0,   468,   396,     0,
       0,   395,     0,   359,    27,   184,    32,     0,     0,    29,
      34,     0,     0,   310,     0,   311,   171,     0,     0,     0,
       0,     0,     0,   307,   435,     0,     0,   457,     0,     0,
     459,     0,     0,     0,   467,     0,   187,     0,   421,   189,
     397,   398,   332,   185,    31,    33,     0,     0,     0,   300,
       0,   301,     0,   315,     0,   316,     0,     0,   450,   452,
     453,     0,   458,     0,     0,   119,   466,   426,     0,   308,
     309,     0,     0,     0,     0,     0,   305,     0,   306,     0,
       0,   455,     0,     0,   422,   298,   299,   313,   314,     0,
       0,   451,   454,   456,   423,   427,   303,   304
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    40,    41,   125,    43,    44,   203,   204,   205,   206,
     126,   127,   128,   129,   456,   478,   130,   153,   132,   133,
     134,   135,   136,   137,   138,   139,   140,   141,   142,   143,
     144,   145,   247,   276,   553,   174,   687,   249,   419,   458,
     209,    47,   362,   432,   682,   683,    48,    49,    50,   338,
     339,   340,    51,    52,    53,    54,   435,    55,    56,   156,
     157,   158,   159,   160,    57,   211,   212,   213,   214,   215,
     388,   389,    58,    59,   101,   102,    84,   428,   166,   429,
     167,   216,   217,    88,   218,    90,   392,   162,   219,   168,
     169,   170,   192,   254,   424,   799,   464,   828,   556,   557,
     558,   559,   560,   376,   561,   562,   563,   564,   565,   147,
     566,   220,   148,   465,   222,   466,   467,   468,   469,   470,
     471,   472,    61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -750
static const yytype_int16 yypact[] =
{
    8594,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,  -750,    31,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,   -90,   -58,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,   -39,  -750,   134,  7047,  -750,  -750,  -750,
       9,  -750,  -750,  -750,  -750,  -750,  -750,   565,  -750,  -750,
      -4,   123,    79,    35,    60,  6798,    57,  6077,  -750,  -750,
    -750,  -750,   917,  7149,  6482,   784,  -750,   160,  -750,    15,
    -750,  -750,  -750,  -750,   182,  -750,   907,   191,  8031,  -750,
    -750,   402,   149,  3428,   -55,  -750,   169,    37,  6798,  -750,
     151,   -50,  -750,    79,    79,  -750,  -750,  -750,  6831,  6909,
    6909,  8684,  6798,  -750,  8684,  6798,  6942,  -750,  6209,  -750,
     316,  -750,  -750,  -750,  -750,   204,    47,  -750,  -750,   486,
    -750,  1024,  6798,  -750,   -16,    86,   411,  6798,   251,   515,
     228,    39,   225,   348,     2,  -750,   266,  -750,  -750,   270,
      32,   204,    25,  -750,   411,  5958,   268,  -750,  -750,  -750,
      33,  -750,   917,  -750,  -750,   817,   323,   695,   326,   368,
    -750,  -750,   -28,  -750,   373,   784,  -750,   215,   907,   705,
     182,   191,  -750,   402,  8126,  6515,  -750,  -750,  6593,  -750,
     341,   385,   -33,    24,   182,  -750,   324,  8774,  8316,  6428,
    8684,  -750,  -750,   379,   379,   379,   413,    30,   340,  5732,
     215,  3552,  -750,   -56,  -750,  -750,   191,  -750,  -750,   705,
     369,   398,  -750,  5374,  3676,  3800,   404,   410,  -750,  6798,
      79,  -750,   237,   274,  6209,  -750,  6626,  -750,  -750,   160,
    7347,  8864,  7446,  8864,  6209,  -750,  -750,  -750,   210,  7837,
    -750,  -750,  -750,  -750,   442,   446,  2586,  2728,    79,  -750,
    -750,  5166,    79,  6798,  -750,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,  -750,  -750,  -750,  5207,  -750,  6798,  6798,
    6798,  6798,  6798,  6798,  6798,   411,  6798,  6798,  -750,  6798,
    6798,  6798,  6798,  6798,  6798,  6798,  6798,  6798,  -750,  -750,
    -750,  6077,  7248,   321,   437,   365,  6077,  -750,  -750,  6077,
    -750,  -750,  -750,  -750,  -750,  8504,  -750,  -750,   705,   182,
    -750,  -750,   456,  -750,   109,   459,  -750,   170,   467,  -750,
    -750,    79,  -750,  -750,  -750,  -750,  -750,   461,   477,  -750,
     487,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,    57,  -750,  -750,   483,   484,  -750,  -750,
    -750,   480,  5616,  -750,  -750,  -750,  -750,   858,  -750,  8316,
    -750,   917,  6341,   219,  8410,   466,  4990,  -750,  -750,  -750,
    -750,  -750,  5207,   867,  6798,  -750,   148,   215,   197,  -750,
     191,  -750,   203,   705,  -750,    24,  -750,  -750,   700,  -750,
      24,  -750,  -750,  -750,  3924,  -750,  4048,  -750,  4172,  5374,
    4296,  -750,  -750,  5374,  -750,  5374,  -750,  -750,    30,  7837,
    -750,  -750,  -750,  -750,   491,  7936,  6798,   136,   493,   498,
     507,   500,  7644,  -750,  -750,  -750,  -750,  -750,  6798,   503,
    7743,   508,  -750,  6798,    79,  -750,  -750,  -750,  -750,  -750,
    6798,   316,  -750,  2870,  -750,   593,  -750,  -750,  8316,  -750,
    -750,  -750,  -750,  -750,  -750,  -750,   379,  -750,  -750,   289,
    -750,  3012,   489,  -750,   490,  -750,  -750,  -750,   253,  -750,
    -750,   429,  -750,  -750,  -750,  -750,  -750,   -16,   -16,    86,
      86,   411,   411,   411,   251,   251,   515,   228,    39,   225,
     348,   -22,  7545,  -750,  -750,   365,  -750,  -750,  -750,  -750,
    -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  6798,   516,
     505,  -750,  -750,  -750,  6798,    57,  6077,   -17,   -51,  -750,
    -750,  -750,    48,  -750,    57,  -750,   215,   520,  -750,  6798,
     510,   524,   525,   529,  5131,   530,    79,   512,   514,  5503,
      79,  -750,    97,   298,  -750,  5845,  -750,  -750,  2160,  2302,
     513,  -750,  -750,  -750,  -750,  -750,   517,  -750,  -750,  -750,
    3154,   191,    24,   733,  -750,  6798,  -750,    24,   191,  -750,
    -750,  -750,  -750,  -750,  -750,  4420,  -750,  4544,  4668,  4792,
    -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,   534,   537,
     533,   493,   507,  8221,  6798,   493,  6077,  6798,   542,  -750,
    -750,  -750,  -750,  -750,   536,   538,  6798,  6798,   541,  -750,
    -750,  -750,  -750,  -750,   521,  5207,    79,  -750,  -750,  -750,
    -750,  -750,  -750,  -750,  -750,  5207,  -750,  -750,  -750,   289,
    -750,  -750,  -750,  -750,  5207,  -750,  6798,  -750,   269,  -750,
    -750,   546,   547,    36,   179,   379,   379,  -750,  6077,   217,
     285,   532,  -750,  -750,  -750,   544,  5131,  6798,  6798,  6666,
     614,  2022,   531,  -750,  -750,  -750,   334,   535,  5131,  -750,
    -750,    53,   343,  -750,   806,  -750,  2444,  -750,  -750,  -750,
    -750,  -750,   545,   191,   215,  -750,   553,   705,   551,   191,
    -750,  -750,  -750,  -750,  -750,  -750,  -750,   493,  -750,   558,
     556,   262,   557,  6077,  6798,  -750,   563,   566,  6798,  -750,
    -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,  -750,
     -23,   -11,   292,   379,   379,  -750,   379,   379,  -750,   364,
    5131,  -750,   345,   383,  5131,   399,   574,  5131,  5430,  -750,
    -750,  6798,  -750,  3296,   784,  -750,  5242,  -750,   553,    24,
      24,   553,  6798,  -750,  -750,  -750,  -750,   350,   569,  -750,
    -750,   572,   379,  -750,   379,  -750,  -750,   -15,     5,    45,
      18,   379,   379,  -750,  -750,  5131,  5131,  -750,  5131,  6798,
    -750,  5131,  6758,   560,  -750,   578,  -750,  5242,  -750,  -750,
     553,   553,  -750,  -750,  -750,  -750,   579,   580,   379,  -750,
     379,  -750,   379,  -750,   379,  -750,   158,    63,   638,  -750,
    -750,   419,  -750,  5131,   420,  -750,  -750,  -750,   -18,  -750,
    -750,   581,   582,   585,   587,   379,  -750,   379,  -750,  5131,
     594,  -750,  5131,  4848,  -750,  -750,  -750,  -750,  -750,   591,
     597,  -750,  -750,  -750,  -750,  -750,  -750,  -750
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -750,    82,  -750,   664,   678,   400,  -750,  -750,  -750,  -750,
       0,  -750,  -750,  1498,  -255,  -750,  -750,   167,  -750,  -110,
     288,   283,   -41,  -750,   284,   450,   448,   451,   454,   447,
    -750,  1349,   -49,  -750,   -77,  1396,  -366,  -750,  -750,  -363,
     449,  -750,  -750,   518,  -750,    -8,  1389,   930,  -750,  -750,
    -329,  -750,   374,  -750,  1038,  1434,  -148,  1286,  -160,  -750,
     186,   218,   464,  -425,  -182,  -154,   358,  -750,  -750,  -135,
    -750,   192,  -136,  1313,   478,   559,   -74,  -398,   -34,  -219,
     -45,   305,  -184,  -750,   -37,   -71,   310,  -750,  1065,   -86,
    -750,     4,  -750,  -750,   539,  -749,  -374,  -750,   760,  -750,
    -750,   223,  -750,  -750,   431,  -628,  -750,  -750,  -750,  -117,
    -750,  -750,   212,  -750,  -750,  -750,   306,   141,   319,   322,
    -750,  -250,  -750
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -496
static const yytype_int16 yytable[] =
{
      45,    86,   191,   255,    60,   180,   477,   474,   567,    89,
     554,   521,    85,   555,   370,   367,   146,   194,     1,   296,
     195,   482,   277,   439,    64,   391,   154,     1,     1,   601,
     178,    65,   605,     1,     1,     1,    89,   366,    89,     1,
       1,   248,   182,   748,   307,    71,    77,   772,   827,   365,
       1,     1,   655,   656,    89,   808,     1,    96,   774,     2,
       1,   368,   100,    66,    67,     2,   150,   152,   658,   404,
     406,   408,   398,   165,   810,   176,   397,    71,   230,   176,
      67,   366,     1,   366,   399,     2,   223,   814,   190,   330,
     659,   176,   231,   207,   855,   331,   285,   227,   322,   316,
       1,   654,   278,   100,   100,   368,   443,   368,   195,   319,
     843,   239,   320,   256,   239,   812,   646,   279,   280,   773,
     792,   304,   248,    99,   844,   657,    71,   809,    76,   264,
      92,   775,   837,    72,    98,    68,    73,     1,    89,   297,
     182,    74,    89,    69,    70,   175,    89,   811,    69,    70,
      71,     1,    71,   308,   300,   239,   182,   248,   728,   248,
     815,   309,    89,     1,   301,    71,   257,   248,   484,   485,
     486,   257,    62,   394,   293,   176,   103,   176,   225,   176,
     367,   711,   401,   176,    45,   535,   481,   813,   257,   660,
      71,   650,   685,   176,   753,   555,   555,   361,    77,   373,
     239,   104,   366,   624,   707,   838,   598,    71,   264,   386,
     176,   207,   479,   614,   531,   449,   281,   282,     1,   176,
     501,   618,     1,   207,   207,   207,   368,   483,   835,   180,
     100,   194,   131,   732,   418,   678,   512,    76,   257,    71,
     239,   431,   239,   431,   418,   491,   492,   320,   493,   444,
     256,   720,    69,    70,    72,   585,   587,   425,   475,   588,
     154,   589,   480,   286,   287,   154,    69,    70,   154,   397,
     196,   397,   366,   397,   632,   235,   237,   238,    69,    70,
     366,    89,    29,   245,   611,   131,   733,   734,   767,   570,
     229,    76,   611,  -376,  -376,   248,   368,   514,  -376,   729,
     836,   418,    45,   184,   368,   221,   418,   309,   185,   152,
     224,   256,   187,    35,    36,    45,   417,   188,   176,   510,
     692,   107,    76,   555,    76,   573,   417,   332,   532,  -376,
    -376,   516,   442,    72,   622,    89,   175,   574,   443,   599,
     621,   575,    68,     1,     1,   256,    89,   258,   259,   260,
     394,    87,   333,   523,   736,   737,   401,   292,   579,   735,
     257,   294,   528,   581,   295,   230,   131,   533,   334,    77,
     288,   289,   373,    71,   239,   643,   552,   413,    87,   414,
      87,   644,   765,   176,   181,   595,    71,   176,   298,   722,
     309,   725,   299,   176,   620,   176,    87,   443,   335,   336,
     176,   131,   230,   131,   207,     1,   207,   306,   207,   207,
     207,   131,   776,   207,   415,   207,   416,   635,    71,   239,
     309,   283,   284,   221,    63,    45,   443,   738,   131,   636,
     131,   319,   608,   781,   782,   221,   221,   221,   679,    72,
     608,   648,   302,   131,    71,   312,   337,    74,   314,    46,
     397,    76,   397,   397,   397,   264,    76,    95,   626,    69,
      70,   261,   443,  -415,   131,   262,   263,   785,   647,  -415,
     803,   754,   676,   443,   750,   651,    27,    28,   309,   382,
      87,    29,   181,   755,    87,   154,   302,   503,    87,     1,
     332,    74,   506,   258,   259,   260,   315,   226,   181,   182,
     317,   590,   239,   795,    87,   786,   783,   329,   332,   402,
     684,   443,    35,    36,   390,   333,   155,   709,    89,   504,
     375,   788,    46,    73,   507,   653,   152,   443,    74,   290,
     291,   334,   661,   333,   663,   579,   176,    46,   403,   131,
     581,   840,   842,   131,   552,   409,   672,   443,   443,   334,
     677,   410,    71,   380,   375,   681,   645,   443,   552,   552,
     240,   335,   336,   242,   450,   154,   489,   490,     1,   487,
     488,   451,   176,   176,   494,   495,  -279,   176,   511,   335,
     336,   232,   233,   517,    76,   207,   513,   207,   207,   207,
     742,   743,   745,     2,   515,   723,     1,   360,   518,   526,
     258,   259,   260,    45,   524,   525,   152,   261,   538,   519,
     131,   262,   263,   596,   603,   520,   221,   154,   221,   606,
     221,   221,   221,    87,   604,   221,    71,   221,   425,   616,
     619,   641,   642,    46,   377,   378,   379,   381,   649,    27,
      28,   360,   664,   360,    29,   667,   668,   369,   666,   374,
     669,   671,   673,    71,   674,   689,   704,   690,   152,   705,
     706,   713,   714,   719,    42,   715,   552,   718,   726,   727,
     746,   749,   154,   739,   751,    35,    36,    87,   552,   188,
     763,    71,   740,   764,   766,   131,   552,   757,    87,   762,
     769,   131,   571,   770,   176,   789,   804,   176,   578,   805,
     825,   105,   839,     1,   106,   107,    93,   798,     1,   684,
      42,   131,   821,   152,   261,   824,   131,    89,   262,   263,
     826,   829,   830,   845,   846,   131,   131,   847,     2,   848,
     149,   151,   625,   856,   852,    94,     1,    42,   172,   857,
     552,   497,   496,   500,   552,   498,   796,   552,   798,   499,
     502,    46,    42,   522,   176,   502,   580,   151,   155,   176,
     176,   440,   360,   390,    46,   695,   576,    95,   633,    27,
      28,   111,   112,   508,    29,    42,   721,   638,    42,    27,
      28,   686,   151,   441,    29,   552,   552,     1,   552,   412,
     639,   552,     0,   640,   798,     0,     0,   221,     0,   221,
     221,   221,   114,   115,     0,    35,    36,    27,    28,     0,
       0,   131,    29,     0,     0,    35,    36,   313,    68,    42,
       1,   236,     0,   552,   120,     0,   175,     0,     0,     0,
       0,     0,   360,   131,   131,   131,   131,     0,   131,   552,
     360,   181,   552,    35,    36,   131,     0,     0,    42,   324,
       0,    72,   327,   131,   175,     0,     0,     0,    27,    28,
      87,     1,    42,    29,    42,     0,     0,     0,     0,     0,
       1,   384,     0,    42,    46,   151,     0,   693,   696,     0,
      27,    28,   699,     0,     0,    29,     2,   151,   151,   151,
       0,  -376,  -376,     0,    35,    36,  -376,   634,   151,     0,
       0,     0,    72,     0,    42,   175,    42,   131,   151,     0,
       0,   131,     0,    42,   131,   131,    35,    36,     0,     0,
     151,   151,     0,   131,     0,     0,     0,  -376,  -376,     0,
       0,     0,    27,    28,   662,    69,    70,    29,  -376,  -376,
       0,    27,    28,  -376,     0,   756,    29,     0,     0,     0,
       0,     0,   131,   131,     0,   131,   131,     0,   131,   131,
       0,    18,    19,     0,   131,   151,    42,     0,    35,    36,
     151,     0,     0,   151,     0,   155,    79,    35,    36,    42,
       0,    27,    28,     0,     0,    72,    29,    97,   175,   568,
     131,    27,    28,     0,     0,     0,    29,     0,     0,   758,
       0,     0,   761,    79,     0,   177,   131,     0,     0,   131,
     131,     0,     0,     0,     0,     0,   186,    35,    36,     0,
       0,   193,     0,   210,     0,     0,     0,    35,    36,     0,
       0,     0,     0,    42,     0,    72,   151,     0,    42,     0,
     151,     0,   265,   266,   267,   268,   269,   270,   271,   272,
     273,   274,    46,     0,     0,   155,     0,     0,     0,    87,
       0,     0,     0,     0,   800,   801,     0,     0,   151,     0,
     151,     0,   151,   151,   151,     0,     0,   151,     0,   151,
       0,     0,     0,    42,    80,   303,   730,   731,     0,    42,
       0,     0,     0,     0,     0,     0,     0,   186,     0,     0,
       0,     0,     0,     0,     0,   177,     0,   155,   186,   193,
     161,    91,     0,   193,     0,     0,     0,   151,     0,     0,
       0,     0,    42,     0,     0,     0,     0,     0,   210,   177,
       0,     0,     0,     0,     0,   151,     0,   163,    91,   387,
     179,   210,     0,     0,   183,     0,     0,     0,     0,   400,
       0,     0,     0,   210,   210,   210,   250,     0,     0,     0,
       0,     0,   155,   275,   777,   778,    42,   779,   780,     0,
     427,     0,   427,     0,     0,     0,     0,     0,     0,   303,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   652,
     151,     0,     0,    80,     0,     0,     0,     0,     0,     0,
     310,     0,     0,   806,     0,   807,     0,     0,     0,     0,
       0,     0,   816,   817,     0,     0,     0,     0,     0,    42,
     305,     0,   151,   151,     0,     0,     0,   311,     0,     0,
       0,     0,   303,     0,   151,   364,     0,     0,     0,   831,
     179,   832,   318,   833,     0,   834,     0,    80,   193,   151,
       0,   151,   151,   151,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   179,     0,   849,    42,   850,     0,
     151,     0,   420,     0,   393,   395,     0,     0,    80,   434,
      80,   434,   420,     0,     0,     0,     0,   445,     0,     0,
       0,     0,   303,     0,   460,   460,     0,   534,     0,   210,
       0,     0,   536,     0,   670,   430,     0,   430,     0,     0,
       0,     0,     0,   177,   305,     0,     0,     0,     0,   688,
       0,     0,   151,   577,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,   210,     0,   210,     0,   210,   210,
     210,     0,     0,   210,     0,   210,     0,     0,     0,   303,
     151,     0,     0,     0,     0,   427,     0,     0,     0,    83,
       0,     0,   427,     0,     0,     0,     0,   305,   505,     0,
     427,     0,     0,     0,     0,     0,     0,   151,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   387,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     530,     0,     0,     0,   252,     0,     0,    80,     0,   161,
     250,     0,    80,     0,   460,     0,     0,   151,     0,     0,
       0,     0,     0,   173,     0,     0,   741,   305,     0,     0,
       0,   253,   303,     0,     0,    78,   163,   179,   752,     0,
       0,    82,     0,     0,     0,     0,   688,   173,   179,     0,
       0,     0,   572,     0,     0,     0,     0,   591,     0,     0,
       0,   173,     0,     0,   173,     0,     0,     0,    83,     0,
     610,     0,     0,     0,     0,     0,     0,     0,   610,     0,
      81,     0,     0,     0,   305,   536,     0,     0,     0,     0,
     430,   460,   602,     0,   228,    82,   628,   430,     0,     0,
     784,     0,     0,   694,   787,   430,     0,   790,   241,   460,
       0,   243,     0,     0,     0,   210,     0,   210,   210,   210,
     422,     0,    83,   393,     0,     0,    82,   436,    82,   436,
     422,     0,     0,     0,   173,   447,     0,   173,     0,     0,
      80,     0,   462,   462,    78,   818,   819,   423,   820,     0,
       0,   822,   251,    83,   437,    83,   437,   423,     0,     0,
       0,     0,   448,     0,     0,     0,     0,   305,     0,   463,
     463,     0,     0,     0,     0,     0,     0,     0,   173,     0,
       0,   325,     0,   841,   328,     0,   363,     0,     0,    81,
       0,   208,     0,   628,     0,     0,   460,   460,    78,   851,
       0,   318,   853,     0,     0,   457,   457,     0,   460,     0,
       0,     0,     0,     0,   186,     0,     0,     0,     0,     0,
     179,     0,     0,     0,     0,   411,     0,   760,     0,    78,
     433,    78,   433,     0,     0,     0,     0,     0,   697,     0,
       0,     0,     0,    81,     0,   459,   459,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,   252,     0,
      82,     0,   462,     0,     0,     0,     0,     0,   421,     0,
       0,     0,     0,     0,    81,     0,    81,     0,   421,     0,
       0,     0,    83,   446,   177,   253,     0,    83,     0,   463,
     461,   461,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   593,     0,     0,     0,   208,
       0,     0,     0,     0,     0,     0,     0,     0,   612,     0,
       0,   208,   208,   208,   460,     0,   612,     0,     0,     0,
       0,   457,   594,   173,     0,     0,     0,     0,     0,   462,
       0,     0,     0,     0,   630,   613,     0,     0,     0,     0,
       0,   529,     0,   613,   455,   455,     0,   462,    78,   759,
       0,     0,     0,    78,     0,   459,   463,     0,     0,     0,
       0,   631,     0,     0,     0,   173,     0,     0,     0,     0,
     569,     0,     0,     0,   463,     0,     0,   173,    82,     0,
       0,   460,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   457,    81,     0,     0,   251,     0,    81,     0,
     461,     0,     0,     0,     0,    83,     0,     0,     0,   179,
     457,   609,   600,     0,     0,     0,     0,     0,     0,   609,
       0,     0,     0,     0,   615,     0,     0,     0,     0,     0,
       0,   630,   459,     0,   462,   462,     0,   627,     0,     0,
       0,     0,     0,   592,     0,     0,   462,     0,     0,     0,
     459,     0,     0,     0,     0,     0,     0,     0,   631,     0,
       0,   463,   463,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   463,     0,     0,     0,   461,   173,     0,
       0,    78,   629,     0,     0,     0,   208,     0,     0,     0,
       0,     0,   208,     0,   208,   461,   208,   208,   208,     0,
       0,   208,     0,   208,     0,     0,     0,     0,     0,   457,
       0,     0,     0,     0,   173,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   665,    81,     0,     0,     0,
       0,     0,     0,     0,   627,     0,     0,   459,   459,     0,
       0,   455,     0,   173,     0,     0,   173,     0,     0,   459,
       0,     0,     0,     0,     0,   173,   173,     0,     0,   455,
       0,   698,   462,     0,   457,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   457,     0,     0,     0,     0,   629,
       0,     0,   461,   461,     0,   724,     0,     0,     0,   463,
     710,     0,     0,   712,   461,     0,     0,     0,     0,     0,
       0,     0,   716,   717,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,   462,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   173,     0,     0,   463,   173,   455,     0,
       0,     0,     0,     0,     0,   459,     0,     0,     0,     0,
       0,     0,     0,   208,     0,   208,   208,   208,     0,     0,
       0,     0,     0,   111,   112,   113,     0,     0,     0,     0,
     173,     0,   457,     0,     0,     0,     0,     0,     0,     0,
     768,   173,     0,     0,   771,     0,     0,     0,     0,     0,
     461,     0,     0,     0,   114,   115,     0,     0,     0,     0,
       0,   116,     0,   455,     0,     0,     0,     0,     0,     0,
     117,     0,   459,   118,   747,   119,   120,   793,     0,     0,
       0,   121,   122,   123,   124,     0,     0,     0,   802,     0,
       0,   105,   551,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   461,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,   539,   540,   541,   542,   543,   544,   545,   546,
     547,   548,   549,     0,     0,     0,    26,     0,     0,     0,
       0,   111,   112,   113,    27,    28,     0,   550,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,   455,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,   116,
      35,    36,    37,    38,     0,     0,     0,    39,   117,     0,
       0,   118,     0,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,     0,     0,     0,     0,     0,     0,
     551,   375,  -443,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   539,   540,   541,   542,   543,   544,
     545,   546,   547,   548,   549,     0,     0,     0,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,   550,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     0,     0,    39,
     117,     0,     0,   118,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,     0,     0,     0,     0,     0,
       0,     0,   551,   375,  -442,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,   539,   540,   541,   542,
     543,   544,   545,   546,   547,   548,   549,     0,     0,     0,
      26,     0,     0,     0,     0,   111,   112,   113,    27,    28,
       0,   550,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,   116,    35,    36,    37,    38,     0,     0,
       0,    39,   117,     0,     0,   118,     0,   119,   120,     0,
       0,     0,     0,   121,   122,   123,   124,     0,     0,     0,
       0,     0,     0,     0,   551,   375,  -444,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   111,   112,   113,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,   116,    35,    36,    37,    38,
       0,     0,     0,    39,   117,     0,     0,   118,     0,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,     0,
       0,     0,     0,     0,     0,     0,   452,   453,   454,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   111,
     112,   113,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,   116,    35,    36,
      37,    38,     0,     0,     0,    39,   117,     0,     0,   118,
       0,   119,   120,     0,     0,     0,     0,   121,   122,   123,
     124,     0,     0,     0,     0,     0,     0,     0,   452,   453,
     473,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   111,   112,   113,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,   116,
      35,    36,    37,    38,     0,     0,     0,    39,   117,     0,
       0,   118,     0,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,     0,     0,     0,     0,     0,     0,
     452,   453,   623,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     0,     0,    39,
     117,     0,     0,   118,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,     0,     0,     0,     0,     0,
       0,     0,   637,   453,  -495,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   111,   112,   113,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,   116,    35,    36,    37,    38,     0,     0,
       0,    39,   117,     0,     0,   118,     0,   119,   120,     0,
       0,     0,     0,   121,   122,   123,   124,     0,     0,     0,
       0,     0,     0,     0,   452,   453,   691,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   111,   112,   113,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,   116,    35,    36,    37,    38,
       0,     0,     0,    39,   117,     0,     0,   118,     0,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,   105,
       0,     1,   106,   107,     0,     0,   452,   453,   794,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   197,     0,     0,   111,
     112,     0,    27,    28,     0,     0,   198,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,    72,     0,     0,   199,
       0,   200,   120,   105,     0,     1,   106,   107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   201,     0,
     202,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     197,     0,     0,   111,   112,     0,    27,    28,     0,     0,
     198,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
      72,     0,     0,   199,     0,   200,   120,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   201,     0,   396,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   197,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   198,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   199,     0,   200,
     120,   105,     0,     1,   106,   107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   201,     0,   405,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   197,     0,
       0,   111,   112,     0,    27,    28,     0,     0,   198,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,    72,     0,
       0,   199,     0,   200,   120,   105,     0,     1,   106,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     201,     0,   407,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   197,     0,     0,   111,   112,     0,    27,    28,
       0,     0,   198,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,    72,     0,     0,   199,     0,   200,   120,   105,
       0,     1,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   201,     0,   582,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   197,     0,     0,   111,
     112,     0,    27,    28,     0,     0,   198,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,    72,     0,     0,   199,
       0,   200,   120,   105,     0,     1,   106,   107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   201,     0,
     583,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     197,     0,     0,   111,   112,     0,    27,    28,     0,     0,
     198,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
      72,     0,     0,   199,     0,   200,   120,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   201,     0,   584,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   197,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   198,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   199,     0,   200,
     120,   105,     0,     1,   106,   107,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   201,     0,   586,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   197,     0,
       0,   111,   112,     0,    27,    28,     0,     0,   198,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,    72,     0,
       0,   199,     0,   200,   120,   105,     0,     1,   106,   107,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     201,     0,   700,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   197,     0,     0,   111,   112,     0,    27,    28,
       0,     0,   198,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,    72,     0,     0,   199,     0,   200,   120,   105,
       0,     1,   106,   107,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   201,     0,   701,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   197,     0,     0,   111,
     112,     0,    27,    28,     0,     0,   198,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,    72,     0,     0,   199,
       0,   200,   120,   105,     0,     1,   106,   107,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   201,     0,
     702,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,    26,     0,
     197,     0,     0,   111,   112,     0,    27,    28,     0,     0,
     198,    29,     0,     0,    30,    31,     2,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
      72,     0,     0,   199,     0,   200,   120,     0,     0,   111,
     112,   113,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   201,     0,   703,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     114,   115,     0,     0,     0,     0,     0,   116,     0,     0,
       0,     0,     0,     0,     0,     0,   117,     0,     0,   118,
       0,   119,   120,     0,     0,     0,     0,   121,   122,   123,
     124,     0,     0,     0,     0,     0,     0,     0,     0,   797,
     854,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,   539,   540,   541,   542,   543,   544,   545,   546,
     547,   548,   549,     0,     0,     0,    26,     0,     0,     0,
       0,   111,   112,   113,    27,    28,     0,   550,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,   116,
      35,    36,    37,    38,     0,     0,     0,    39,   117,     0,
       0,   118,     0,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,     0,     0,     0,     0,     0,     0,
     551,   375,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,     0,     0,   539,   540,   541,   542,   543,   544,   545,
     546,   547,   548,   549,     2,     0,     0,     0,     0,     0,
       0,     0,   111,   112,   113,     0,     0,     0,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,   115,     2,     0,   111,   112,   113,
     116,     0,     0,   105,     0,     1,   106,   107,   108,   117,
     109,   110,   118,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,   114,   115,
       2,   551,   375,     0,     0,   116,     0,     0,   111,   112,
     113,     0,     0,     0,   117,     0,     0,   118,   476,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,     0,
       0,     0,     0,     0,     0,     0,     0,   453,     0,   114,
     115,     0,     0,   111,   112,   113,   116,     0,     0,     0,
       0,     0,     0,     0,     0,   117,     0,     0,   118,     0,
     119,   120,     0,     0,     0,     0,   121,   122,   123,   124,
       0,     0,     0,     0,   114,   115,     0,     0,   453,     0,
       0,   116,     0,     0,     0,     0,     0,     0,     0,     0,
     117,     0,     0,   118,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,   105,     0,     1,   106,   107,
       0,     0,     0,   797,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,   105,     0,     1,   106,   107,   108,     0,   109,   110,
      26,     0,   197,     0,     0,   111,   112,     0,    27,    28,
       0,     0,   198,    29,     0,     0,    30,    31,     2,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,    72,     0,     0,   199,     0,   200,   120,     0,
       0,   111,   112,   113,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,   201,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   114,   115,     0,     0,     0,     0,     0,   116,
       0,     0,     0,     0,     0,     0,     0,     0,   117,     0,
       0,   118,   791,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,     0,     0,     0,     0,     0,     0,
     551,     0,     0,     0,   111,   112,   113,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   114,   115,     0,     0,     0,
       0,     0,   116,     0,     0,     0,     0,     0,     0,     1,
       0,   117,     0,     0,   118,     0,   119,   120,     0,     0,
       0,     0,   121,   122,   123,   124,     0,     0,     0,     0,
       0,     0,     0,   675,     2,     3,     4,     5,     6,     7,
     341,   342,   343,   344,   345,   346,   347,   348,   349,   350,
      18,    19,   351,   352,    22,    23,   353,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   354,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,     0,     0,
       0,   355,     0,   356,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   357,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,   358,   359,
       0,     0,     0,    39,    72,     1,     0,   302,     0,     0,
       0,     0,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   527,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     1,    39,
      72,     0,     0,   383,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     384,     0,   385,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     1,    39,    72,     0,     0,   175,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   680,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,    72,     0,   105,   302,
       1,   106,   107,   108,    74,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,  -278,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,   111,   112,
     113,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,   116,    35,    36,    37,
      38,     0,     0,     0,    39,   117,     0,     0,   118,     0,
     119,   120,     0,     0,     0,     0,   121,   122,   123,   124,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,    37,    38,     0,     0,     0,     0,   117,     0,     0,
     118,   246,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,   111,   112,   113,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
     116,    35,    36,    37,    38,     0,     2,     0,     0,   371,
       0,     0,   372,   246,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,   111,
     112,   113,    27,    28,     0,     0,     0,    29,     0,     0,
       2,     0,     0,     0,     0,     0,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
     114,   115,     0,     0,     0,     0,     0,   116,    35,    36,
       0,     0,     0,     2,     0,     0,   371,     0,     0,   372,
     246,   119,   120,   111,   112,   113,     0,   121,   122,   123,
     124,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,   115,   111,   112,   113,     0,
       0,   116,     0,     0,   105,     0,     1,   106,   107,   108,
     117,   109,   110,   118,     0,   119,   120,     0,     0,   171,
       0,   121,   122,   123,   124,     0,     0,   114,   115,     0,
       0,     2,     0,     0,   116,     0,     0,   105,     0,     1,
     106,   107,   108,   117,   109,   110,   118,     0,   119,   120,
       0,     0,   323,     0,   121,   122,   123,   124,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   111,   112,   113,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   114,   115,   111,   112,   113,
       0,     0,   116,     0,     0,     0,     0,     0,     0,     0,
       0,   117,     0,     0,   118,     0,   119,   120,     0,     0,
     326,     0,   121,   122,   123,   124,     0,     0,   114,   115,
       0,     0,     0,     0,     0,   116,     0,   111,   112,   113,
       0,     0,     0,     0,   117,     0,     0,   118,   246,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,   105,
       0,     1,   106,   107,   108,     0,   109,   110,   114,   115,
       0,     0,     0,     0,     0,   116,     0,     0,     0,     0,
       0,     0,     0,     0,   117,     0,     2,   118,   744,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,   111,
     112,   113,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     114,   115,     0,     0,     0,     0,     0,   116,     0,   111,
     112,   113,     0,     0,     0,     0,   117,     0,     0,   118,
     823,   119,   120,     0,     0,     0,     0,   121,   122,   123,
     124,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     114,   115,   111,   112,   113,     0,     0,   116,     0,     0,
     105,     0,     1,   106,   107,   108,   117,   109,   110,   118,
       0,   119,   120,     0,     0,     0,     0,   121,   122,   123,
     124,     0,     0,   114,   115,     0,     0,     2,     0,     0,
     116,     0,     0,   105,     0,     1,   106,   107,   108,   117,
     109,   110,   234,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     111,   112,   113,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   114,   115,   111,   112,   113,     0,     0,   116,     0,
       0,     0,     0,     0,     0,     0,     0,   117,     0,     0,
     236,     0,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,     0,     0,   114,   115,     0,     0,     0,     0,
       1,   116,     0,     0,     0,     0,     0,     0,     0,     0,
     117,     0,     0,   244,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     0,
       0,     0,     1,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,    72,     0,     0,    73,     0,
       0,     0,     0,    74,     0,     0,    75,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     1,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,    72,     0,     0,
      73,   164,     0,     0,     0,    74,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    25,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       1,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,    72,     0,     0,   302,
     164,     0,     0,     0,    74,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     1,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,    72,     0,     0,   425,     0,
       0,     0,     0,   426,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     1,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   425,     0,     0,
       0,     0,   438,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     1,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,    72,     0,     0,   302,     0,     0,     0,
       0,    74,     2,     3,     4,     5,     6,     7,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,    18,    19,
     351,   352,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     354,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   355,
       0,   356,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   357,     0,     1,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   358,   359,     0,     0,
       0,    39,    72,     0,     0,   425,     0,     0,     0,     0,
     607,     2,     3,     4,     5,     6,     7,   341,   342,   343,
     344,   345,   346,   347,   348,   349,   350,    18,    19,   351,
     352,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   354,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,     0,     0,     0,   355,     0,
     356,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     0,   357,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,   358,   359,     0,     0,     0,
      39,    72,     0,     0,   425,     2,     0,     0,     0,   617,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     1,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,     0,    72,     0,     0,   302,     0,
       0,     0,     0,    74,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   425,   597,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
       0,     0,     0,   189,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     0,     0,     0,     0,   321,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
       0,     0,     0,   708,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   175,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     0,     0,
       0,   537,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   509,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,     2,     3,     4,     5,     6,     7,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,    18,    19,
     351,   352,    22,    23,   353,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     354,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   355,
       0,   356,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,   357,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   358,   359,     0,     0,
       0,    39,     2,     3,     4,     5,     6,     7,   341,   342,
     343,   344,   345,   346,   347,   348,   349,   350,    18,    19,
     351,   352,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     354,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   355,
       0,   356,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   357,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   358,   359,     0,     0,
       0,    39
};

static const yytype_int16 yycheck[] =
{
       0,    46,    88,   120,     0,    79,   261,   257,   382,    46,
     376,   340,    46,   376,   198,   197,    65,    91,     3,    17,
      91,   276,   132,   242,    24,   209,    67,     3,     3,   427,
      75,   121,   430,     3,     3,     3,    73,   197,    75,     3,
       3,   118,    79,   671,    11,    45,    46,    70,   797,   197,
       3,     3,    69,    70,    91,    70,     3,    57,    69,    28,
       3,   197,    62,   121,   119,    28,    66,    67,   119,   223,
     224,   225,   128,    73,    69,    75,   211,    77,   128,    79,
     119,   241,     3,   243,   140,    28,   141,    69,    88,   122,
     141,    91,   142,    93,   843,   128,   137,    97,   184,   127,
       3,   526,   118,   103,   104,   241,   128,   243,   179,   183,
     128,   111,   183,   141,   114,    70,   138,   133,   134,   142,
     748,   155,   199,     0,   142,   142,   126,   142,    46,   129,
     121,   142,    69,   118,   138,     1,   121,     3,   175,   137,
     177,   126,   179,   118,   119,   121,   183,   142,   118,   119,
     150,     3,   152,   120,   122,   155,   193,   234,   122,   236,
     142,   128,   199,     3,   139,   165,   141,   244,   278,   279,
     280,   141,   141,   210,   135,   175,   141,   177,   141,   179,
     362,   606,   219,   183,   184,   369,   263,   142,   141,   141,
     190,   520,   558,   193,   141,   558,   559,   197,   198,   199,
     200,   141,   362,   453,   602,   142,   425,   207,   208,   209,
     210,   211,   261,   432,   362,   249,   130,   131,     3,   219,
     297,   440,     3,   223,   224,   225,   362,   276,    70,   303,
     230,   305,    65,   658,   234,   138,   127,   155,   141,   239,
     240,   241,   242,   243,   244,   286,   287,   318,   289,   249,
     141,   625,   118,   119,   118,   409,   410,   121,   258,   413,
     301,   415,   262,    12,    13,   306,   118,   119,   309,   404,
     121,   406,   432,   408,   458,   108,   109,   110,   118,   119,
     440,   318,    79,   116,   432,   118,    69,    70,   713,   141,
     139,   209,   440,    74,    75,   372,   432,   127,    79,   120,
     142,   301,   302,   121,   440,    93,   306,   128,   126,   309,
     141,   141,   121,   110,   111,   315,   234,   126,   318,   315,
     570,     5,   240,   686,   242,   128,   244,     3,   362,   110,
     111,   331,   122,   118,   451,   372,   121,   140,   128,   425,
     450,   138,     1,     3,     3,   141,   383,     7,     8,     9,
     387,    46,    28,   353,    69,    70,   393,   129,   395,   142,
     141,   136,   362,   400,    16,   128,   199,   367,    44,   369,
     119,   120,   372,   373,   374,   122,   376,   140,    73,   142,
      75,   128,   120,   383,    79,   419,   386,   387,   122,   644,
     128,   122,   122,   393,   443,   395,    91,   128,    74,    75,
     400,   234,   128,   236,   404,     3,   406,   139,   408,   409,
     410,   244,   120,   413,   140,   415,   142,   128,   418,   419,
     128,    10,    11,   211,    24,   425,   128,   142,   261,   140,
     263,   505,   432,    69,    70,   223,   224,   225,   140,   118,
     440,   518,   121,   276,   444,   122,   122,   126,   122,     0,
     585,   369,   587,   588,   589,   455,   374,    57,   458,   118,
     119,   121,   128,   122,   297,   125,   126,   122,   502,   128,
     120,   128,   549,   128,   140,   524,    74,    75,   128,   139,
     175,    79,   177,   140,   179,   526,   121,   301,   183,     3,
       3,   126,   306,     7,     8,     9,   128,    97,   193,   536,
     127,   419,   502,   753,   199,   122,   142,   122,     3,   140,
     555,   128,   110,   111,   209,    28,    67,   603,   555,   301,
     141,   122,    73,   121,   306,   525,   526,   128,   126,    14,
      15,    44,   532,    28,   534,   572,   536,    88,   140,   372,
     577,   122,   122,   376,   544,   141,   546,   128,   128,    44,
     550,   141,   552,   140,   141,   555,   127,   128,   558,   559,
     111,    74,    75,   114,   122,   606,   283,   284,     3,   281,
     282,   125,   572,   573,   290,   291,   139,   577,   122,    74,
      75,   103,   104,   122,   502,   585,   127,   587,   588,   589,
     667,   668,   669,    28,   127,   644,     3,   197,   121,   119,
       7,     8,     9,   603,   121,   121,   606,   121,   142,   122,
     443,   125,   126,   122,   121,   128,   404,   658,   406,   119,
     408,   409,   410,   318,   126,   413,   626,   415,   121,   126,
     122,   142,   142,   184,   203,   204,   205,   206,   122,    74,
      75,   241,   122,   243,    79,   121,   121,   198,   138,   200,
     121,   121,   140,   653,   140,   142,   122,   140,   658,   122,
     127,   119,   126,   142,     0,   127,   666,   126,   122,   122,
      56,   140,   713,   141,   139,   110,   111,   372,   678,   126,
     122,   681,   138,   127,   127,   518,   686,   142,   383,   138,
     127,   524,   387,   127,   694,   121,   127,   697,   393,   127,
     140,     1,    64,     3,     4,     5,   141,   756,     3,   754,
      46,   544,   789,   713,   121,   792,   549,   754,   125,   126,
     142,   142,   142,   142,   142,   558,   559,   142,    28,   142,
      66,    67,   139,   142,   140,    57,     3,    73,    74,   142,
     740,   293,   292,   296,   744,   294,   754,   747,   797,   295,
     301,   302,    88,   353,   754,   306,   398,    93,   309,   759,
     760,   243,   362,   458,   315,   573,   392,   367,   458,    74,
      75,    71,    72,   309,    79,   111,   635,   471,   114,    74,
      75,   558,   118,   244,    79,   785,   786,     3,   788,   230,
     471,   791,    -1,   471,   843,    -1,    -1,   585,    -1,   587,
     588,   589,   102,   103,    -1,   110,   111,    74,    75,    -1,
      -1,   644,    79,    -1,    -1,   110,   111,   122,     1,   155,
       3,   121,    -1,   823,   124,    -1,   121,    -1,    -1,    -1,
      -1,    -1,   432,   666,   667,   668,   669,    -1,   671,   839,
     440,   536,   842,   110,   111,   678,    -1,    -1,   184,   185,
      -1,   118,   188,   686,   121,    -1,    -1,    -1,    74,    75,
     555,     3,   198,    79,   200,    -1,    -1,    -1,    -1,    -1,
       3,   138,    -1,   209,   425,   211,    -1,   572,   573,    -1,
      74,    75,   577,    -1,    -1,    79,    28,   223,   224,   225,
      -1,    74,    75,    -1,   110,   111,    79,   466,   234,    -1,
      -1,    -1,   118,    -1,   240,   121,   242,   740,   244,    -1,
      -1,   744,    -1,   249,   747,   748,   110,   111,    -1,    -1,
     256,   257,    -1,   756,    -1,    -1,    -1,   110,   111,    -1,
      -1,    -1,    74,    75,   534,   118,   119,    79,   121,   122,
      -1,    74,    75,   126,    -1,   139,    79,    -1,    -1,    -1,
      -1,    -1,   785,   786,    -1,   788,   789,    -1,   791,   792,
      -1,    44,    45,    -1,   797,   301,   302,    -1,   110,   111,
     306,    -1,    -1,   309,    -1,   526,    46,   110,   111,   315,
      -1,    74,    75,    -1,    -1,   118,    79,    57,   121,   122,
     823,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,   694,
      -1,    -1,   697,    73,    -1,    75,   839,    -1,    -1,   842,
     843,    -1,    -1,    -1,    -1,    -1,    86,   110,   111,    -1,
      -1,    91,    -1,    93,    -1,    -1,    -1,   110,   111,    -1,
      -1,    -1,    -1,   369,    -1,   118,   372,    -1,   374,    -1,
     376,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,   603,    -1,    -1,   606,    -1,    -1,    -1,   754,
      -1,    -1,    -1,    -1,   759,   760,    -1,    -1,   404,    -1,
     406,    -1,   408,   409,   410,    -1,    -1,   413,    -1,   415,
      -1,    -1,    -1,   419,    46,   155,   655,   656,    -1,   425,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   167,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   175,    -1,   658,   178,   179,
      72,    46,    -1,   183,    -1,    -1,    -1,   453,    -1,    -1,
      -1,    -1,   458,    -1,    -1,    -1,    -1,    -1,   198,   199,
      -1,    -1,    -1,    -1,    -1,   471,    -1,    72,    73,   209,
      75,   211,    -1,    -1,    79,    -1,    -1,    -1,    -1,   219,
      -1,    -1,    -1,   223,   224,   225,   118,    -1,    -1,    -1,
      -1,    -1,   713,   139,   733,   734,   502,   736,   737,    -1,
     240,    -1,   242,    -1,    -1,    -1,    -1,    -1,    -1,   249,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   525,
     526,    -1,    -1,   155,    -1,    -1,    -1,    -1,    -1,    -1,
     162,    -1,    -1,   772,    -1,   774,    -1,    -1,    -1,    -1,
      -1,    -1,   781,   782,    -1,    -1,    -1,    -1,    -1,   555,
     155,    -1,   558,   559,    -1,    -1,    -1,   162,    -1,    -1,
      -1,    -1,   302,    -1,   570,   197,    -1,    -1,    -1,   808,
     175,   810,   177,   812,    -1,   814,    -1,   209,   318,   585,
      -1,   587,   588,   589,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   199,    -1,   835,   603,   837,    -1,
     606,    -1,   234,    -1,   209,   210,    -1,    -1,   240,   241,
     242,   243,   244,    -1,    -1,    -1,    -1,   249,    -1,    -1,
      -1,    -1,   362,    -1,   256,   257,    -1,   367,    -1,   369,
      -1,    -1,   372,    -1,   544,   240,    -1,   242,    -1,    -1,
      -1,    -1,    -1,   383,   249,    -1,    -1,    -1,    -1,   559,
      -1,    -1,   658,   393,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    46,    -1,   404,    -1,   406,    -1,   408,   409,
     410,    -1,    -1,   413,    -1,   415,    -1,    -1,    -1,   419,
     686,    -1,    -1,    -1,    -1,   425,    -1,    -1,    -1,    46,
      -1,    -1,   432,    -1,    -1,    -1,    -1,   302,   303,    -1,
     440,    -1,    -1,    -1,    -1,    -1,    -1,   713,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   458,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     362,    -1,    -1,    -1,   118,    -1,    -1,   369,    -1,   371,
     372,    -1,   374,    -1,   376,    -1,    -1,   753,    -1,    -1,
      -1,    -1,    -1,    74,    -1,    -1,   666,   362,    -1,    -1,
      -1,   118,   502,    -1,    -1,    46,   371,   372,   678,    -1,
      -1,   155,    -1,    -1,    -1,    -1,   686,    98,   383,    -1,
      -1,    -1,   387,    -1,    -1,    -1,    -1,   419,    -1,    -1,
      -1,   112,    -1,    -1,   115,    -1,    -1,    -1,   155,    -1,
     432,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   440,    -1,
      46,    -1,    -1,    -1,   419,   555,    -1,    -1,    -1,    -1,
     425,   453,   427,    -1,    98,   209,   458,   432,    -1,    -1,
     740,    -1,    -1,   573,   744,   440,    -1,   747,   112,   471,
      -1,   115,    -1,    -1,    -1,   585,    -1,   587,   588,   589,
     234,    -1,   209,   458,    -1,    -1,   240,   241,   242,   243,
     244,    -1,    -1,    -1,   185,   249,    -1,   188,    -1,    -1,
     502,    -1,   256,   257,   155,   785,   786,   234,   788,    -1,
      -1,   791,   118,   240,   241,   242,   243,   244,    -1,    -1,
      -1,    -1,   249,    -1,    -1,    -1,    -1,   502,    -1,   256,
     257,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   229,    -1,
      -1,   185,    -1,   823,   188,    -1,   197,    -1,    -1,   155,
      -1,    93,    -1,   555,    -1,    -1,   558,   559,   209,   839,
      -1,   536,   842,    -1,    -1,   256,   257,    -1,   570,    -1,
      -1,    -1,    -1,    -1,   684,    -1,    -1,    -1,    -1,    -1,
     555,    -1,    -1,    -1,    -1,   229,    -1,   697,    -1,   240,
     241,   242,   243,    -1,    -1,    -1,    -1,    -1,   573,    -1,
      -1,    -1,    -1,   209,    -1,   256,   257,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   369,    -1,    -1,   372,    -1,
     374,    -1,   376,    -1,    -1,    -1,    -1,    -1,   234,    -1,
      -1,    -1,    -1,    -1,   240,    -1,   242,    -1,   244,    -1,
      -1,    -1,   369,   249,   754,   372,    -1,   374,    -1,   376,
     256,   257,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   419,    -1,    -1,    -1,   211,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   432,    -1,
      -1,   223,   224,   225,   686,    -1,   440,    -1,    -1,    -1,
      -1,   382,   419,   384,    -1,    -1,    -1,    -1,    -1,   453,
      -1,    -1,    -1,    -1,   458,   432,    -1,    -1,    -1,    -1,
      -1,   362,    -1,   440,   256,   257,    -1,   471,   369,   694,
      -1,    -1,    -1,   374,    -1,   376,   453,    -1,    -1,    -1,
      -1,   458,    -1,    -1,    -1,   426,    -1,    -1,    -1,    -1,
     384,    -1,    -1,    -1,   471,    -1,    -1,   438,   502,    -1,
      -1,   753,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   453,   369,    -1,    -1,   372,    -1,   374,    -1,
     376,    -1,    -1,    -1,    -1,   502,    -1,    -1,    -1,   754,
     471,   432,   426,    -1,    -1,    -1,    -1,    -1,    -1,   440,
      -1,    -1,    -1,    -1,   438,    -1,    -1,    -1,    -1,    -1,
      -1,   555,   453,    -1,   558,   559,    -1,   458,    -1,    -1,
      -1,    -1,    -1,   419,    -1,    -1,   570,    -1,    -1,    -1,
     471,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   555,    -1,
      -1,   558,   559,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   570,    -1,    -1,    -1,   453,   539,    -1,
      -1,   502,   458,    -1,    -1,    -1,   398,    -1,    -1,    -1,
      -1,    -1,   404,    -1,   406,   471,   408,   409,   410,    -1,
      -1,   413,    -1,   415,    -1,    -1,    -1,    -1,    -1,   570,
      -1,    -1,    -1,    -1,   575,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   539,   502,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   555,    -1,    -1,   558,   559,    -1,
      -1,   453,    -1,   604,    -1,    -1,   607,    -1,    -1,   570,
      -1,    -1,    -1,    -1,    -1,   616,   617,    -1,    -1,   471,
      -1,   575,   686,    -1,   625,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   635,    -1,    -1,    -1,    -1,   555,
      -1,    -1,   558,   559,    -1,   646,    -1,    -1,    -1,   686,
     604,    -1,    -1,   607,   570,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   616,   617,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   753,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   714,    -1,    -1,   753,   718,   570,    -1,
      -1,    -1,    -1,    -1,    -1,   686,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   585,    -1,   587,   588,   589,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
     751,    -1,   753,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     714,   762,    -1,    -1,   718,    -1,    -1,    -1,    -1,    -1,
     686,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,   635,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    -1,   753,   121,   122,   123,   124,   751,    -1,    -1,
      -1,   129,   130,   131,   132,    -1,    -1,    -1,   762,    -1,
      -1,     1,   140,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   753,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    77,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,   753,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,   141,   142,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,   141,   142,     1,    -1,     3,     4,     5,
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
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,    -1,
      -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,   141,   142,     1,    -1,     3,
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
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,   141,   142,     1,
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
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,
      -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,   141,
     142,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,   141,   142,     1,    -1,     3,     4,     5,     6,    -1,
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
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,   141,   142,     1,    -1,     3,     4,     5,
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
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,    -1,
      -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,   141,   142,     1,    -1,     3,
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
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,    -1,    -1,   140,   141,   142,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,
      -1,   123,   124,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,
     124,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,   123,   124,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,
      -1,   123,   124,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,
     124,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,   123,   124,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,
      -1,   123,   124,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    28,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,
     142,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,   141,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    28,    -1,    71,    72,    73,
     109,    -1,    -1,     1,    -1,     3,     4,     5,     6,   118,
       8,     9,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,   102,   103,
      28,   140,   141,    -1,    -1,   109,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   102,
     103,    -1,    -1,    71,    72,    73,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,   141,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    28,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,   140,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,
      -1,   121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,   118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,
      -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,     3,    -1,   121,    -1,    -1,
      -1,    -1,   126,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,     3,   117,
     118,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     138,    -1,   140,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,     3,   117,   118,    -1,    -1,   121,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,     1,   121,
       3,     4,     5,     6,   126,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    -1,    -1,    -1,   118,    -1,    -1,
     121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,   113,    -1,    28,    -1,    -1,   118,
      -1,    -1,   121,   122,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
      -1,    -1,    -1,    28,    -1,    -1,   118,    -1,    -1,   121,
     122,   123,   124,    71,    72,    73,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    71,    72,    73,    -1,
      -1,   109,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     118,     8,     9,   121,    -1,   123,   124,    -1,    -1,   127,
      -1,   129,   130,   131,   132,    -1,    -1,   102,   103,    -1,
      -1,    28,    -1,    -1,   109,    -1,    -1,     1,    -1,     3,
       4,     5,     6,   118,     8,     9,   121,    -1,   123,   124,
      -1,    -1,   127,    -1,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    71,    72,    73,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,
     127,    -1,   129,   130,   131,   132,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,    28,   121,   122,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,   118,    -1,    -1,   121,
     122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    71,    72,    73,    -1,    -1,   109,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   118,     8,     9,   121,
      -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,
     132,    -1,    -1,   102,   103,    -1,    -1,    28,    -1,    -1,
     109,    -1,    -1,     1,    -1,     3,     4,     5,     6,   118,
       8,     9,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    71,    72,    73,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
       3,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
      -1,    -1,    -1,   126,    -1,    -1,   129,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,   122,    -1,    -1,    -1,   126,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,
     122,    -1,    -1,    -1,   126,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
      -1,    -1,    -1,   126,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,    -1,
      -1,    -1,   126,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,    -1,    -1,
      -1,   126,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,    -1,    -1,    -1,
     126,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    28,    -1,    -1,    -1,   126,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
      -1,    -1,    -1,   126,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,   122,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,   122,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,    -1,    -1,   122,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,   121,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
      -1,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   112,   113,   117,
     144,   145,   146,   147,   148,   153,   183,   184,   189,   190,
     191,   195,   196,   197,   198,   200,   201,   207,   215,   216,
     234,   265,   141,   148,   153,   121,   121,   119,     1,   118,
     119,   153,   118,   121,   126,   129,   144,   153,   189,   190,
     197,   198,   200,   216,   219,   221,   223,   224,   226,   227,
     228,   231,   121,   141,   147,   148,   153,   190,   138,     0,
     153,   217,   218,   141,   141,     1,     4,     5,     6,     8,
       9,    71,    72,    73,   102,   103,   109,   118,   121,   123,
     124,   129,   130,   131,   132,   146,   153,   154,   155,   156,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   252,   255,   146,
     153,   146,   153,   160,   165,   183,   202,   203,   204,   205,
     206,   197,   230,   231,   122,   153,   221,   223,   232,   233,
     234,   127,   146,   174,   178,   121,   153,   190,   223,   231,
     219,   224,   227,   231,   121,   126,   190,   121,   126,   122,
     153,   232,   235,   190,   219,   228,   121,    68,    78,   121,
     123,   140,   142,   149,   150,   151,   152,   153,   156,   183,
     190,   208,   209,   210,   211,   212,   224,   225,   227,   231,
     254,   255,   257,   141,   141,   141,   148,   153,   178,   139,
     128,   142,   217,   217,   121,   160,   121,   160,   160,   153,
     183,   178,   183,   178,   121,   160,   122,   175,   177,   180,
     197,   198,   200,   216,   236,   252,   141,   141,     7,     8,
       9,   121,   125,   126,   153,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   139,   176,   162,   118,   133,
     134,   130,   131,    10,    11,   165,    12,    13,   119,   120,
      14,    15,   129,   135,   136,    16,    17,   137,   122,   122,
     122,   139,   121,   190,   221,   231,   139,    11,   120,   128,
     197,   231,   122,   122,   122,   128,   127,   127,   231,   219,
     228,   122,   232,   127,   146,   178,   127,   146,   178,   122,
     122,   128,     3,    28,    44,    74,    75,   122,   192,   193,
     194,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    46,    47,    50,    66,    85,    87,   100,   112,   113,
     148,   153,   185,   189,   197,   199,   201,   207,   215,   183,
     225,   118,   121,   153,   183,   141,   246,   247,   247,   247,
     140,   247,   139,   121,   138,   140,   153,   190,   213,   214,
     224,   225,   229,   231,   227,   231,   142,   212,   128,   140,
     190,   227,   140,   140,   208,   142,   208,   142,   208,   141,
     141,   178,   218,   140,   142,   140,   142,   144,   153,   181,
     197,   198,   200,   216,   237,   121,   126,   190,   220,   222,
     231,   153,   186,   189,   197,   199,   200,   216,   126,   222,
     186,   237,   122,   128,   153,   197,   198,   200,   216,   221,
     122,   125,   140,   141,   142,   156,   157,   174,   182,   189,
     197,   198,   200,   216,   239,   256,   258,   259,   260,   261,
     262,   263,   264,   142,   264,   153,   122,   157,   158,   175,
     153,   177,   157,   175,   162,   162,   162,   163,   163,   164,
     164,   165,   165,   165,   167,   167,   168,   169,   170,   171,
     172,   177,   183,   203,   204,   231,   203,   204,   205,    51,
     234,   122,   127,   127,   127,   127,   153,   122,   121,   122,
     128,   193,   148,   153,   121,   121,   119,   141,   153,   189,
     197,   199,   221,   153,   190,   225,   190,   121,   142,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      77,   140,   153,   177,   179,   182,   241,   242,   243,   244,
     245,   247,   248,   249,   250,   251,   253,   239,   122,   178,
     141,   224,   231,   128,   140,   138,   195,   190,   224,   227,
     209,   227,   142,   142,   142,   208,   142,   208,   208,   208,
     144,   197,   198,   200,   216,   221,   122,   122,   222,   232,
     178,   220,   231,   121,   126,   220,   119,   126,   153,   189,
     197,   199,   200,   216,   222,   178,   126,   126,   222,   122,
     175,   162,   252,   142,   264,   139,   153,   189,   197,   198,
     200,   216,   225,   229,   247,   128,   140,   140,   259,   261,
     262,   142,   142,   122,   128,   127,   138,   221,   177,   122,
     193,   175,   146,   153,   206,    69,    70,   142,   119,   141,
     141,   153,   148,   153,   122,   178,   138,   121,   121,   121,
     241,   121,   153,   140,   140,   140,   177,   153,   138,   140,
     140,   153,   187,   188,   223,   179,   244,   179,   241,   142,
     140,   142,   264,   224,   190,   214,   224,   231,   178,   224,
     142,   142,   142,   142,   122,   122,   127,   220,   122,   232,
     178,   206,   178,   119,   126,   127,   178,   178,   126,   142,
     239,   260,   157,   175,   174,   122,   122,   122,   122,   120,
     247,   247,   206,    69,    70,   142,    69,    70,   142,   141,
     138,   241,   177,   177,   122,   177,    56,   122,   248,   140,
     140,   139,   241,   141,   128,   140,   139,   142,   224,   231,
     190,   224,   138,   122,   127,   120,   127,   206,   178,   127,
     127,   178,    70,   142,    69,   142,   120,   247,   247,   247,
     247,    69,    70,   142,   241,   122,   122,   241,   122,   121,
     241,   122,   248,   178,   142,   264,   188,   141,   175,   238,
     224,   224,   178,   120,   127,   127,   247,   247,    70,   142,
      69,   142,    70,   142,    69,   142,   247,   247,   241,   241,
     241,   177,   241,   122,   177,   140,   142,   238,   240,   142,
     142,   247,   247,   247,   247,    70,   142,    69,   142,    64,
     122,   241,   122,   128,   142,   142,   142,   142,   142,   247,
     247,   241,   140,   241,   142,   238,   142,   142
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
      case 144: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3760 "type.ec"
	break;
      case 146: /* "type" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3769 "type.ec"
	break;
      case 147: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3778 "type.ec"
	break;
      case 148: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3787 "type.ec"
	break;
      case 149: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3796 "type.ec"
	break;
      case 150: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3805 "type.ec"
	break;
      case 151: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3814 "type.ec"
	break;
      case 152: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3823 "type.ec"
	break;
      case 153: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3832 "type.ec"
	break;
      case 154: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3841 "type.ec"
	break;
      case 156: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3850 "type.ec"
	break;
      case 158: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3859 "type.ec"
	break;
      case 160: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3868 "type.ec"
	break;
      case 162: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3877 "type.ec"
	break;
      case 163: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3886 "type.ec"
	break;
      case 164: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3895 "type.ec"
	break;
      case 165: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3904 "type.ec"
	break;
      case 167: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3913 "type.ec"
	break;
      case 168: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3922 "type.ec"
	break;
      case 169: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3931 "type.ec"
	break;
      case 170: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3940 "type.ec"
	break;
      case 171: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3949 "type.ec"
	break;
      case 172: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3958 "type.ec"
	break;
      case 173: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3967 "type.ec"
	break;
      case 174: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3976 "type.ec"
	break;
      case 175: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3985 "type.ec"
	break;
      case 177: /* "expression" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3994 "type.ec"
	break;
      case 178: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4003 "type.ec"
	break;
      case 179: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4012 "type.ec"
	break;
      case 180: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4021 "type.ec"
	break;
      case 181: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4030 "type.ec"
	break;
      case 182: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4039 "type.ec"
	break;
      case 183: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4048 "type.ec"
	break;
      case 187: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4057 "type.ec"
	break;
      case 188: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4066 "type.ec"
	break;
      case 189: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4075 "type.ec"
	break;
      case 190: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4084 "type.ec"
	break;
      case 192: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4093 "type.ec"
	break;
      case 193: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 220 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4102 "type.ec"
	break;
      case 194: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 221 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4111 "type.ec"
	break;
      case 195: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4120 "type.ec"
	break;
      case 196: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4129 "type.ec"
	break;
      case 197: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4138 "type.ec"
	break;
      case 198: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4147 "type.ec"
	break;
      case 199: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4156 "type.ec"
	break;
      case 200: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4165 "type.ec"
	break;
      case 201: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4174 "type.ec"
	break;
      case 202: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4183 "type.ec"
	break;
      case 203: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4192 "type.ec"
	break;
      case 204: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4201 "type.ec"
	break;
      case 205: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4210 "type.ec"
	break;
      case 208: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4219 "type.ec"
	break;
      case 209: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4228 "type.ec"
	break;
      case 210: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4237 "type.ec"
	break;
      case 211: /* "property" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4246 "type.ec"
	break;
      case 212: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 198 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4255 "type.ec"
	break;
      case 213: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4264 "type.ec"
	break;
      case 214: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4273 "type.ec"
	break;
      case 215: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4282 "type.ec"
	break;
      case 216: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 173 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4291 "type.ec"
	break;
      case 217: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4300 "type.ec"
	break;
      case 218: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4309 "type.ec"
	break;
      case 219: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4318 "type.ec"
	break;
      case 220: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4327 "type.ec"
	break;
      case 221: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4336 "type.ec"
	break;
      case 222: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4345 "type.ec"
	break;
      case 223: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4354 "type.ec"
	break;
      case 224: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4363 "type.ec"
	break;
      case 225: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4372 "type.ec"
	break;
      case 226: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4381 "type.ec"
	break;
      case 227: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4390 "type.ec"
	break;
      case 228: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4399 "type.ec"
	break;
      case 229: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4408 "type.ec"
	break;
      case 230: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4417 "type.ec"
	break;
      case 231: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4426 "type.ec"
	break;
      case 232: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4435 "type.ec"
	break;
      case 233: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4444 "type.ec"
	break;
      case 234: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 184 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4453 "type.ec"
	break;
      case 235: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4462 "type.ec"
	break;
      case 236: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 184 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4471 "type.ec"
	break;
      case 237: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 184 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4480 "type.ec"
	break;
      case 238: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4489 "type.ec"
	break;
      case 239: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4498 "type.ec"
	break;
      case 240: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4507 "type.ec"
	break;
      case 241: /* "statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4516 "type.ec"
	break;
      case 242: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4525 "type.ec"
	break;
      case 243: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4534 "type.ec"
	break;
      case 244: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4543 "type.ec"
	break;
      case 245: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4552 "type.ec"
	break;
      case 246: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4561 "type.ec"
	break;
      case 247: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4570 "type.ec"
	break;
      case 248: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4579 "type.ec"
	break;
      case 249: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4588 "type.ec"
	break;
      case 250: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4597 "type.ec"
	break;
      case 251: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4606 "type.ec"
	break;
      case 252: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4615 "type.ec"
	break;
      case 253: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4624 "type.ec"
	break;
      case 255: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4633 "type.ec"
	break;
      case 257: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4642 "type.ec"
	break;
      case 258: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4651 "type.ec"
	break;
      case 259: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 194 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4660 "type.ec"
	break;
      case 260: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4669 "type.ec"
	break;
      case 261: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4678 "type.ec"
	break;
      case 262: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4687 "type.ec"
	break;
      case 263: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4696 "type.ec"
	break;
      case 264: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4705 "type.ec"
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
#line 229 "type.y"
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
#line 247 "type.y"
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
#line 281 "type.y"
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
#line 330 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 332 "type.y"
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
#line 358 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 363 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 365 "type.y"
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
#line 382 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 384 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 389 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 394 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 399 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 401 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 406 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 412 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 423 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 424 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 425 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 433 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 434 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 435 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 436 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 437 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 442 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 447 "type.y"
    {
      char * constant = (yyvsp[(1) - (2)].exp).type == constantExp ? (yyvsp[(1) - (2)].exp).constant : null;
      int len = constant ? strlen(constant) : 0;
      if(constant && constant[len-1] == '.')
      {
         constant[len-1] = 0;
         (yyval.exp) = MkExpMember((yyvsp[(1) - (2)].exp), (yyvsp[(2) - (2)].id));
         (yyval.exp).loc = (yyloc);
      }
      else
         yyerror();
   ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 459 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 460 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 461 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 465 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 494 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 496 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 497 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 501 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 502 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 503 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 505 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 506 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 508 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 509 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 526 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 527 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 528 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 529 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 534 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 540 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 541 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 546 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 547 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 552 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 553 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 558 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 566 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 568 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 569 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 574 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 575 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 580 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 585 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 590 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 595 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 600 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 605 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 610 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 611 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 615 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 616 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 624 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 625 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 638 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 639 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 640 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 651 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 652 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 665 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 678 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 682 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 683 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 684 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 685 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 692 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 693 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 697 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 698 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 702 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 703 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 704 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 705 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 706 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 707 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 708 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 709 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 711 "type.y"
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

  case 171:

/* Line 1464 of yacc.c  */
#line 729 "type.y"
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

  case 172:

/* Line 1464 of yacc.c  */
#line 745 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 746 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 747 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 749 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 750 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 751 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 752 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 754 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 755 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 756 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 758 "type.y"
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

  case 185:

/* Line 1464 of yacc.c  */
#line 776 "type.y"
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

  case 186:

/* Line 1464 of yacc.c  */
#line 792 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 793 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 797 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 798 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 803 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 804 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 805 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 806 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 807 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 811 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 877 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 879 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 882 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 889 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 898 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 899 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 900 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 904 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 905 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 906 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 907 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 913 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 915 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 917 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 919 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 920 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 921 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 922 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 924 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 928 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 930 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 933 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 935 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 939 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 940 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 945 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 946 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 957 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 964 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 966 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 968 "type.y"
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
#line 992 "type.y"
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
#line 1006 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 1011 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 1017 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 1021 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 1033 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 1039 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1042 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1044 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1046 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1048 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1050 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1055 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1057 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1064 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1066 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1076 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1078 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1081 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1082 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1088 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1090 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1107 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1108 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1113 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1115 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1117 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1131 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1137 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1139 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1141 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1143 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1155 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1157 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1162 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1164 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1166 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1168 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1170 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1174 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1176 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1177 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1178 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1179 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1183 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1185 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1187 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1188 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1236 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1238 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1240 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1249 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1259 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1262 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1266 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1276 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1278 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1280 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1287 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1289 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1294 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1295 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1296 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1297 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1301 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1302 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1306 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1307 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1308 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1309 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1314 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1318 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1319 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1326 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1327 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1339 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1363 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1364 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1368 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1369 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1373 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1374 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1379 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1381 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1383 "type.y"
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

  case 424:

/* Line 1464 of yacc.c  */
#line 1399 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1401 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1423 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1425 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1441 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1443 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1447 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1448 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1452 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1453 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1466 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1471 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1479 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1483 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1484 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1488 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1489 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1490 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1494 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1495 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1496 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1497 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1499 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1500 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1501 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1505 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1506 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1507 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1508 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1509 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1518 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1520 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1527 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1552 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1554 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1558 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1565 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1573 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1575 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1577 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1583 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1585 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1590 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1594 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1595 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1600 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1602 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1607 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1611 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1612 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1613 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1614 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1615 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1616 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1621 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1622 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1626 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1627 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8419 "type.ec"
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
#line 1630 "type.y"


