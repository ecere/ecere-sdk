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
#define YYLAST   9121

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  143
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  512
/* YYNRULES -- Number of states.  */
#define YYNSTATES  879

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
     153,   157,   160,   164,   167,   170,   172,   174,   179,   183,
     188,   192,   195,   199,   202,   205,   207,   209,   213,   217,
     220,   223,   226,   231,   234,   239,   244,   247,   252,   254,
     256,   258,   260,   262,   264,   266,   268,   270,   272,   274,
     276,   281,   283,   287,   291,   295,   297,   301,   305,   307,
     311,   315,   318,   320,   323,   327,   331,   335,   337,   341,
     345,   347,   351,   353,   357,   359,   363,   365,   369,   371,
     375,   377,   383,   385,   389,   393,   395,   397,   399,   401,
     403,   405,   407,   409,   411,   413,   415,   417,   421,   423,
     426,   430,   433,   439,   441,   444,   446,   449,   451,   454,
     456,   459,   461,   464,   466,   469,   471,   474,   476,   479,
     481,   484,   486,   489,   491,   494,   496,   499,   501,   504,
     506,   509,   511,   514,   516,   519,   521,   524,   526,   529,
     531,   534,   536,   539,   541,   543,   545,   548,   550,   553,
     555,   558,   560,   563,   568,   574,   576,   579,   581,   584,
     586,   589,   591,   594,   596,   599,   601,   604,   609,   615,
     617,   621,   623,   627,   629,   631,   633,   635,   637,   639,
     641,   643,   645,   647,   649,   651,   653,   655,   657,   659,
     661,   663,   668,   670,   673,   677,   684,   690,   692,   694,
     696,   698,   700,   702,   704,   706,   708,   710,   712,   714,
     716,   718,   720,   722,   724,   726,   728,   730,   732,   734,
     739,   744,   749,   751,   753,   755,   757,   759,   761,   763,
     765,   767,   769,   771,   773,   775,   777,   779,   781,   783,
     785,   787,   789,   791,   796,   801,   806,   808,   814,   819,
     824,   828,   834,   841,   847,   853,   858,   865,   868,   871,
     875,   879,   881,   884,   886,   889,   891,   893,   895,   899,
     903,   907,   911,   913,   917,   919,   921,   923,   926,   930,
     932,   936,   946,   956,   964,   972,   978,   989,  1000,  1009,
    1018,  1025,  1034,  1043,  1050,  1057,  1062,  1072,  1082,  1090,
    1098,  1104,  1108,  1111,  1114,  1117,  1119,  1122,  1124,  1126,
    1128,  1132,  1134,  1137,  1140,  1144,  1150,  1153,  1156,  1161,
    1167,  1175,  1183,  1189,  1191,  1195,  1197,  1201,  1205,  1208,
    1212,  1216,  1220,  1225,  1230,  1233,  1237,  1241,  1246,  1250,
    1253,  1257,  1261,  1266,  1268,  1270,  1273,  1276,  1279,  1283,
    1285,  1287,  1290,  1293,  1296,  1300,  1302,  1305,  1309,  1312,
    1314,  1318,  1323,  1327,  1332,  1334,  1337,  1340,  1344,  1348,
    1351,  1355,  1359,  1362,  1364,  1366,  1369,  1372,  1374,  1377,
    1380,  1384,  1388,  1390,  1393,  1395,  1398,  1401,  1405,  1407,
    1411,  1413,  1417,  1420,  1423,  1426,  1430,  1432,  1434,  1436,
    1440,  1442,  1445,  1447,  1450,  1452,  1456,  1461,  1463,  1465,
    1467,  1471,  1473,  1475,  1477,  1479,  1481,  1483,  1487,  1492,
    1496,  1498,  1501,  1503,  1506,  1509,  1511,  1513,  1516,  1518,
    1521,  1525,  1527,  1530,  1536,  1544,  1550,  1556,  1564,  1571,
    1579,  1584,  1590,  1595,  1599,  1602,  1605,  1608,  1612,  1614,
    1620,  1625,  1631,  1636,  1641,  1645,  1650,  1654,  1658,  1661,
    1664,  1667,  1670,  1673,  1676,  1679,  1682,  1685,  1689,  1691,
    1693,  1697,  1700,  1702,  1704,  1707,  1710,  1712,  1715,  1717,
    1719,  1722,  1724
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     267,     0,    -1,   153,   118,    -1,   153,   119,    -1,   153,
       1,    -1,   148,    -1,   153,   153,    -1,    28,    -1,   147,
      -1,   147,   119,   208,   120,    -1,   147,   119,   208,    11,
      -1,   185,   227,    -1,   227,    -1,   185,   121,   122,    -1,
     123,   185,   121,   122,    -1,    78,   185,   227,    -1,    78,
     227,    -1,     3,    -1,   155,    -1,   121,   179,   122,    -1,
     153,    -1,   257,    -1,     4,    -1,   254,    -1,   124,   254,
      -1,   124,   254,   125,   254,    -1,   121,   122,    -1,    71,
     185,   224,   126,   180,   127,    -1,    71,   185,   126,   180,
     127,    -1,   102,   185,   224,   126,   180,   127,    -1,   102,
     185,   126,   180,   127,    -1,    72,   180,   188,   224,   126,
     180,   127,    -1,    72,   180,   188,   126,   180,   127,    -1,
     103,   180,   188,   224,   126,   180,   127,    -1,   103,   180,
     188,   126,   180,   127,    -1,     1,    -1,   154,    -1,   156,
     126,   179,   127,    -1,   156,   121,   122,    -1,   156,   121,
     159,   122,    -1,   156,   125,   153,    -1,   156,   153,    -1,
     156,     7,   153,    -1,   156,     8,    -1,   156,     9,    -1,
     258,    -1,   155,    -1,   158,   126,   179,   127,    -1,   158,
     121,   122,    -1,   158,   121,   159,   122,    -1,   158,   125,
     153,    -1,   158,   153,    -1,   158,     7,   153,    -1,   158,
       8,    -1,   158,     9,    -1,   177,    -1,   157,    -1,   159,
     128,   177,    -1,   159,   128,   157,    -1,     8,   161,    -1,
       9,   161,    -1,   163,   164,    -1,     6,   121,   161,   122,
      -1,     6,   162,    -1,     6,   121,   239,   122,    -1,   109,
     121,   161,   122,    -1,   109,   162,    -1,   109,   121,   239,
     122,    -1,   160,    -1,   156,    -1,   160,    -1,   158,    -1,
     129,    -1,   118,    -1,   130,    -1,   131,    -1,   123,    -1,
     132,    -1,    73,    -1,   161,    -1,   121,   238,   122,   164,
      -1,   164,    -1,   165,   118,   164,    -1,   165,   133,   164,
      -1,   165,   134,   164,    -1,   165,    -1,   166,   130,   165,
      -1,   166,   131,   165,    -1,   166,    -1,   167,    10,   166,
      -1,   167,    11,   166,    -1,   169,   119,    -1,   167,    -1,
     168,   167,    -1,   169,   120,   167,    -1,   169,    12,   167,
      -1,   169,    13,   167,    -1,   169,    -1,   170,    14,   169,
      -1,   170,    15,   169,    -1,   170,    -1,   171,   129,   170,
      -1,   171,    -1,   172,   135,   171,    -1,   172,    -1,   173,
     136,   172,    -1,   173,    -1,   174,    16,   173,    -1,   174,
      -1,   175,    17,   174,    -1,   175,    -1,   175,   137,   179,
     138,   176,    -1,   176,    -1,   161,   178,   177,    -1,   161,
     178,   157,    -1,   139,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,
      -1,    26,    -1,    27,    -1,   177,    -1,   179,   128,   177,
      -1,   176,    -1,   184,   140,    -1,   184,   189,   140,    -1,
     255,   140,    -1,    77,   153,   139,   180,   140,    -1,   199,
      -1,   182,   199,    -1,   200,    -1,   182,   200,    -1,   218,
      -1,   182,   218,    -1,   202,    -1,   182,   202,    -1,   199,
      -1,   183,   199,    -1,   200,    -1,   183,   200,    -1,   144,
      -1,   183,   144,    -1,   218,    -1,   183,   218,    -1,   202,
      -1,   183,   202,    -1,   191,    -1,   184,   191,    -1,   199,
      -1,   184,   199,    -1,   200,    -1,   184,   200,    -1,   218,
      -1,   184,   218,    -1,   202,    -1,   184,   202,    -1,   191,
      -1,   185,   191,    -1,   199,    -1,   185,   199,    -1,   200,
      -1,   185,   200,    -1,   144,    -1,   185,   144,    -1,   202,
      -1,   185,   202,    -1,   218,    -1,   185,   218,    -1,   185,
      -1,   145,    -1,   191,    -1,   187,   191,    -1,   199,    -1,
     187,   199,    -1,   201,    -1,   187,   201,    -1,   153,    -1,
     187,   153,    -1,   153,   119,   208,   120,    -1,   187,   153,
     119,   208,   120,    -1,   191,    -1,   188,   191,    -1,   199,
      -1,   188,   199,    -1,   201,    -1,   188,   201,    -1,   202,
      -1,   188,   202,    -1,   218,    -1,   188,   218,    -1,   153,
      -1,   188,   153,    -1,   153,   119,   208,   120,    -1,   188,
     153,   119,   208,   120,    -1,   190,    -1,   189,   128,   190,
      -1,   225,    -1,   225,   139,   240,    -1,    29,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,   117,    -1,    74,
      -1,    75,    -1,   197,    -1,    79,    -1,   110,    -1,   111,
      -1,     3,    -1,    28,    -1,    75,    -1,    74,    -1,    44,
      -1,   194,    -1,   194,   121,   179,   122,    -1,   195,    -1,
     196,   195,    -1,   196,   128,   195,    -1,   193,   121,   121,
     196,   122,   122,    -1,   193,   121,   121,   122,   122,    -1,
     192,    -1,    44,    -1,    45,    -1,   198,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,    85,    -1,   113,    -1,   112,    -1,   203,    -1,
     217,    -1,   146,    -1,    87,   121,   177,   122,    -1,   100,
     121,   146,   122,    -1,   100,   121,   153,   122,    -1,    66,
      -1,    82,    -1,    83,    -1,    46,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,
      -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,
      -1,   113,    -1,   112,    -1,   203,    -1,   217,    -1,   148,
      -1,    87,   121,   177,   122,    -1,   100,   121,   146,   122,
      -1,   100,   121,   153,   122,    -1,    66,    -1,   209,   153,
     141,   210,   142,    -1,   209,   141,   210,   142,    -1,   209,
     153,   141,   142,    -1,   209,   141,   142,    -1,   209,   147,
     141,   210,   142,    -1,   209,   192,   153,   141,   210,   142,
      -1,   209,   192,   141,   210,   142,    -1,   209,   192,   153,
     141,   142,    -1,   209,   192,   141,   142,    -1,   209,   192,
     148,   141,   210,   142,    -1,   209,   153,    -1,   209,   148,
      -1,   209,   192,   153,    -1,   209,   192,   148,    -1,   185,
      -1,   185,   223,    -1,   185,    -1,   185,   223,    -1,   167,
      -1,   206,    -1,   205,    -1,   153,   139,   206,    -1,   153,
     139,   205,    -1,   204,   139,   206,    -1,   204,   139,   205,
      -1,   207,    -1,   208,   128,   207,    -1,    48,    -1,    49,
      -1,   214,    -1,   210,   214,    -1,   156,   139,   241,    -1,
     211,    -1,   212,   128,   211,    -1,    68,   187,   153,   141,
      69,   249,    70,   249,   142,    -1,    68,   187,   153,   141,
      70,   249,    69,   249,   142,    -1,    68,   187,   153,   141,
      69,   249,   142,    -1,    68,   187,   153,   141,    70,   249,
     142,    -1,    68,   187,   153,   141,   142,    -1,    68,   187,
     223,   153,   141,    69,   249,    70,   249,   142,    -1,    68,
     187,   223,   153,   141,    70,   249,    69,   249,   142,    -1,
      68,   187,   223,   153,   141,    69,   249,   142,    -1,    68,
     187,   223,   153,   141,    70,   249,   142,    -1,    68,   187,
     223,   153,   141,   142,    -1,    68,   187,   141,    69,   249,
      70,   249,   142,    -1,    68,   187,   141,    70,   249,    69,
     249,   142,    -1,    68,   187,   141,    69,   249,   142,    -1,
      68,   187,   141,    70,   249,   142,    -1,    68,   187,   141,
     142,    -1,    68,   187,   223,   141,    69,   249,    70,   249,
     142,    -1,    68,   187,   223,   141,    70,   249,    69,   249,
     142,    -1,    68,   187,   223,   141,    69,   249,   142,    -1,
      68,   187,   223,   141,    70,   249,   142,    -1,    68,   187,
     223,   141,   142,    -1,   185,   215,   140,    -1,   185,   140,
      -1,   257,   140,    -1,   256,   140,    -1,   259,    -1,   212,
     140,    -1,   213,    -1,   140,    -1,   216,    -1,   215,   128,
     216,    -1,   231,    -1,   231,   197,    -1,   138,   180,    -1,
     231,   138,   180,    -1,   231,   138,   180,   138,   180,    -1,
      50,   153,    -1,    50,   148,    -1,    50,   141,   219,   142,
      -1,    50,   153,   141,   219,   142,    -1,    50,   153,   141,
     219,   140,   210,   142,    -1,    50,   148,   141,   219,   140,
     210,   142,    -1,    50,   148,   141,   219,   142,    -1,   220,
      -1,   219,   128,   220,    -1,   153,    -1,   153,   139,   180,
      -1,   121,   223,   122,    -1,   126,   127,    -1,   126,   180,
     127,    -1,   126,   146,   127,    -1,   221,   126,   127,    -1,
     221,   126,   180,   127,    -1,   221,   126,   146,   127,    -1,
     121,   122,    -1,   121,   234,   122,    -1,   221,   121,   122,
      -1,   221,   121,   234,   122,    -1,   121,   224,   122,    -1,
     121,   122,    -1,   121,   234,   122,    -1,   222,   121,   122,
      -1,   222,   121,   234,   122,    -1,   233,    -1,   221,    -1,
     233,   221,    -1,   192,   233,    -1,   192,   221,    -1,   192,
     233,   221,    -1,   233,    -1,   222,    -1,   233,   222,    -1,
     192,   233,    -1,   192,   222,    -1,   192,   233,   222,    -1,
     230,    -1,   233,   230,    -1,   192,   233,   230,    -1,   225,
     192,    -1,   153,    -1,   121,   225,   122,    -1,   226,   126,
     180,   127,    -1,   226,   126,   127,    -1,   226,   126,   146,
     127,    -1,   229,    -1,   233,   229,    -1,   192,   229,    -1,
     192,   233,   229,    -1,   233,   192,   229,    -1,   226,   121,
      -1,   228,   234,   122,    -1,   228,   237,   122,    -1,   228,
     122,    -1,   229,    -1,   226,    -1,   192,   229,    -1,   192,
     226,    -1,   226,    -1,   233,   226,    -1,   192,   226,    -1,
     192,   233,   226,    -1,   233,   192,   226,    -1,   199,    -1,
     232,   199,    -1,   118,    -1,   118,   232,    -1,   118,   233,
      -1,   118,   232,   233,    -1,   235,    -1,   235,   128,    51,
      -1,   236,    -1,   235,   128,   236,    -1,   185,   225,    -1,
     185,   223,    -1,   185,   129,    -1,   185,   129,   225,    -1,
     186,    -1,    65,    -1,   153,    -1,   237,   128,   153,    -1,
     182,    -1,   182,   223,    -1,   183,    -1,   183,   223,    -1,
     177,    -1,   141,   242,   142,    -1,   141,   242,   128,   142,
      -1,   176,    -1,   157,    -1,   240,    -1,   242,   128,   240,
      -1,   244,    -1,   249,    -1,   250,    -1,   251,    -1,   252,
      -1,   253,    -1,   153,   138,   243,    -1,    52,   180,   138,
     243,    -1,    53,   138,   243,    -1,   181,    -1,   245,   181,
      -1,   243,    -1,   246,   243,    -1,   246,   181,    -1,   246,
      -1,   245,    -1,   245,   246,    -1,   141,    -1,   141,   142,
      -1,   248,   247,   142,    -1,   140,    -1,   179,   140,    -1,
      54,   121,   179,   122,   243,    -1,    54,   121,   179,   122,
     243,    64,   243,    -1,    55,   121,   179,   122,   243,    -1,
      56,   121,   179,   122,   243,    -1,    57,   243,    56,   121,
     179,   122,   140,    -1,    58,   121,   250,   250,   122,   243,
      -1,    58,   121,   250,   250,   179,   122,   243,    -1,    56,
     121,   122,   243,    -1,    58,   121,   250,   122,   243,    -1,
      58,   121,   122,   243,    -1,    59,   153,   140,    -1,    60,
     140,    -1,    61,   140,    -1,    62,   140,    -1,    62,   179,
     140,    -1,     5,    -1,   184,   153,   141,   266,   142,    -1,
     184,   153,   141,   142,    -1,   185,   153,   141,   266,   142,
      -1,   185,   153,   141,   142,    -1,   146,   141,   266,   142,
      -1,   146,   141,   142,    -1,   153,   141,   266,   142,    -1,
     153,   141,   142,    -1,   141,   266,   142,    -1,   141,   142,
      -1,   149,   249,    -1,   152,   249,    -1,   152,   140,    -1,
     150,   249,    -1,   151,   249,    -1,   184,   227,    -1,   184,
     231,    -1,   260,   249,    -1,   156,   139,   241,    -1,   241,
      -1,   262,    -1,   263,   128,   262,    -1,   263,   140,    -1,
     264,    -1,   261,    -1,   265,   264,    -1,   265,   261,    -1,
     140,    -1,   265,   140,    -1,   265,    -1,   263,    -1,   265,
     263,    -1,   236,    -1,   236,   138,   180,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   226,   226,   244,   278,   328,   329,   356,   360,   361,
     362,   379,   381,   386,   391,   396,   398,   403,   408,   409,
     414,   416,   418,   420,   422,   423,   424,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   439,   440,   441,   442,
     443,   444,   457,   458,   459,   463,   468,   469,   470,   471,
     472,   473,   486,   487,   488,   492,   493,   494,   495,   499,
     500,   501,   502,   503,   504,   505,   506,   507,   511,   512,
     516,   517,   521,   522,   523,   524,   525,   526,   527,   531,
     532,   536,   537,   538,   539,   543,   544,   545,   549,   550,
     551,   555,   563,   564,   565,   566,   567,   571,   572,   573,
     577,   578,   582,   583,   587,   588,   592,   593,   597,   598,
     602,   603,   607,   608,   609,   613,   614,   615,   616,   617,
     618,   619,   620,   621,   622,   623,   627,   628,   632,   636,
     637,   638,   639,   643,   644,   645,   646,   647,   648,   649,
     650,   654,   655,   656,   657,   658,   659,   660,   661,   662,
     663,   667,   668,   669,   670,   671,   672,   673,   674,   675,
     676,   680,   681,   682,   683,   684,   685,   686,   687,   688,
     689,   690,   691,   695,   696,   700,   701,   702,   703,   704,
     705,   706,   707,   708,   726,   743,   744,   745,   746,   747,
     748,   749,   750,   751,   752,   753,   754,   755,   773,   790,
     791,   795,   796,   800,   801,   802,   803,   804,   805,   809,
     810,   811,   815,   816,   817,   822,   823,   824,   825,   826,
     830,   831,   835,   836,   837,   841,   842,   846,   850,   851,
     852,   857,   858,   859,   860,   861,   862,   863,   864,   865,
     866,   867,   868,   869,   870,   871,   872,   873,   874,   875,
     876,   877,   878,   879,   880,   884,   885,   886,   887,   888,
     889,   890,   891,   892,   893,   894,   895,   896,   897,   898,
     899,   900,   901,   902,   903,   904,   905,   910,   911,   912,
     913,   914,   917,   918,   919,   920,   921,   926,   927,   930,
     932,   937,   938,   943,   944,   955,   959,   961,   962,   964,
     965,   989,  1004,  1005,  1009,  1010,  1014,  1015,  1019,  1023,
    1024,  1028,  1030,  1032,  1034,  1036,  1039,  1041,  1043,  1045,
    1047,  1050,  1052,  1054,  1056,  1058,  1061,  1063,  1065,  1067,
    1069,  1074,  1075,  1076,  1077,  1078,  1079,  1080,  1081,  1085,
    1087,  1092,  1094,  1096,  1098,  1100,  1105,  1106,  1110,  1112,
    1113,  1114,  1115,  1119,  1121,  1126,  1128,  1134,  1136,  1138,
    1140,  1142,  1144,  1146,  1148,  1150,  1152,  1154,  1159,  1161,
    1163,  1165,  1167,  1172,  1173,  1174,  1175,  1176,  1177,  1181,
    1182,  1183,  1184,  1185,  1186,  1232,  1233,  1235,  1237,  1242,
    1244,  1246,  1248,  1250,  1255,  1256,  1259,  1261,  1263,  1269,
    1273,  1275,  1277,  1282,  1283,  1284,  1286,  1291,  1292,  1293,
    1294,  1295,  1299,  1300,  1304,  1305,  1306,  1307,  1311,  1312,
    1316,  1317,  1321,  1322,  1323,  1324,  1325,  1336,  1361,  1362,
    1366,  1367,  1371,  1372,  1376,  1378,  1380,  1396,  1398,  1420,
    1422,  1427,  1428,  1429,  1430,  1431,  1432,  1436,  1438,  1440,
    1445,  1446,  1450,  1451,  1454,  1458,  1459,  1460,  1464,  1468,
    1476,  1481,  1482,  1486,  1487,  1488,  1492,  1493,  1494,  1495,
    1497,  1498,  1499,  1503,  1504,  1505,  1506,  1507,  1511,  1515,
    1517,  1522,  1524,  1549,  1551,  1553,  1555,  1560,  1562,  1566,
    1568,  1570,  1572,  1574,  1580,  1582,  1587,  1592,  1593,  1597,
    1599,  1604,  1609,  1610,  1611,  1612,  1613,  1614,  1618,  1619,
    1620,  1624,  1625
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
     158,   158,   158,   158,   158,   159,   159,   159,   159,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   161,   161,
     162,   162,   163,   163,   163,   163,   163,   163,   163,   164,
     164,   165,   165,   165,   165,   166,   166,   166,   167,   167,
     167,   168,   169,   169,   169,   169,   169,   170,   170,   170,
     171,   171,   172,   172,   173,   173,   174,   174,   175,   175,
     176,   176,   177,   177,   177,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   179,   179,   180,   181,
     181,   181,   181,   182,   182,   182,   182,   182,   182,   182,
     182,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   185,   185,   185,   185,   185,   185,   185,   185,   185,
     185,   185,   185,   186,   186,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   189,
     189,   190,   190,   191,   191,   191,   191,   191,   191,   192,
     192,   192,   193,   193,   193,   194,   194,   194,   194,   194,
     195,   195,   196,   196,   196,   197,   197,   198,   199,   199,
     199,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   203,   203,   203,
     203,   204,   204,   205,   205,   206,   207,   207,   207,   207,
     207,   207,   208,   208,   209,   209,   210,   210,   211,   212,
     212,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   214,   214,   214,   214,   214,   214,   214,   214,   215,
     215,   216,   216,   216,   216,   216,   217,   217,   218,   218,
     218,   218,   218,   219,   219,   220,   220,   221,   221,   221,
     221,   221,   221,   221,   221,   221,   221,   221,   222,   222,
     222,   222,   222,   223,   223,   223,   223,   223,   223,   224,
     224,   224,   224,   224,   224,   225,   225,   225,   225,   226,
     226,   226,   226,   226,   227,   227,   227,   227,   227,   228,
     229,   229,   229,   230,   230,   230,   230,   231,   231,   231,
     231,   231,   232,   232,   233,   233,   233,   233,   234,   234,
     235,   235,   236,   236,   236,   236,   236,   236,   237,   237,
     238,   238,   239,   239,   240,   240,   240,   241,   241,   242,
     242,   243,   243,   243,   243,   243,   243,   244,   244,   244,
     245,   245,   246,   246,   246,   247,   247,   247,   248,   249,
     249,   250,   250,   251,   251,   251,   252,   252,   252,   252,
     252,   252,   252,   253,   253,   253,   253,   253,   254,   255,
     255,   256,   256,   257,   257,   257,   257,   258,   258,   259,
     259,   259,   259,   259,   260,   260,   261,   262,   262,   263,
     263,   264,   265,   265,   265,   265,   265,   265,   266,   266,
     266,   267,   267
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     4,     2,     6,     5,     6,
       5,     7,     6,     7,     6,     1,     1,     4,     3,     4,
       3,     2,     3,     2,     2,     1,     1,     4,     3,     4,
       3,     2,     3,     2,     2,     1,     1,     3,     3,     2,
       2,     2,     4,     2,     4,     4,     2,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     2,     1,     2,     3,     3,     3,     1,     3,     3,
       1,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     5,     1,     3,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     1,     2,
       3,     2,     5,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     1,     1,     2,     1,     2,     1,
       2,     1,     2,     4,     5,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     4,     5,     1,
       3,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     2,     3,     6,     5,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     4,     4,     1,     5,     4,     4,
       3,     5,     6,     5,     5,     4,     6,     2,     2,     3,
       3,     1,     2,     1,     2,     1,     1,     1,     3,     3,
       3,     3,     1,     3,     1,     1,     1,     2,     3,     1,
       3,     9,     9,     7,     7,     5,    10,    10,     8,     8,
       6,     8,     8,     6,     6,     4,     9,     9,     7,     7,
       5,     3,     2,     2,     2,     1,     2,     1,     1,     1,
       3,     1,     2,     2,     3,     5,     2,     2,     4,     5,
       7,     7,     5,     1,     3,     1,     3,     3,     2,     3,
       3,     3,     4,     4,     2,     3,     3,     4,     3,     2,
       3,     3,     4,     1,     1,     2,     2,     2,     3,     1,
       1,     2,     2,     2,     3,     1,     2,     3,     2,     1,
       3,     4,     3,     4,     1,     2,     2,     3,     3,     2,
       3,     3,     2,     1,     1,     2,     2,     1,     2,     2,
       3,     3,     1,     2,     1,     2,     2,     3,     1,     3,
       1,     3,     2,     2,     2,     3,     1,     1,     1,     3,
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
       0,    17,     7,   203,   204,   205,   206,   207,   232,   233,
     234,   235,   236,   238,   241,   242,   239,   240,   228,   229,
     231,   237,   304,   305,     0,   427,   252,   209,   210,   212,
     253,   254,   243,     0,     0,   213,   214,   245,   244,   208,
     167,   174,   248,     8,     5,     0,   173,   426,   161,   227,
       0,   211,   230,   163,   165,   169,   246,     0,   247,   171,
     511,     0,     0,   347,   346,     0,     0,     0,     4,     2,
       3,     6,   414,     0,     0,   424,   168,   389,   162,   227,
     164,   166,   170,   172,   374,   423,   422,   404,     0,   403,
     385,   373,     0,     0,     8,   288,   287,     0,     0,     1,
     355,     0,   353,     0,     0,    35,    22,   478,     0,     0,
       0,     0,     0,    78,     0,     0,     0,    73,     0,    76,
       0,    72,    74,    75,    77,     0,    20,    36,    18,    69,
      68,    79,     0,    81,    85,    88,    92,     0,    97,   100,
     102,   104,   106,   108,   110,   112,     0,    23,    21,     0,
       0,   248,    20,    79,   295,   293,     0,   297,   296,   302,
       0,   412,   415,   416,   364,     0,     0,     0,     0,   418,
     420,   358,     0,   128,     0,     0,   389,     0,   425,     0,
     377,   406,   405,   376,     0,     0,   388,   399,     0,   402,
       0,     0,     0,     0,   375,   386,     0,     0,     0,     0,
       0,   338,   280,     0,     0,     0,     0,    20,     0,     0,
     227,     0,   309,     0,   337,   306,     0,    12,   394,     0,
       0,    21,   335,     0,     0,     0,   290,   289,   512,     0,
       0,   348,     0,     0,     0,    46,    71,    70,    63,     0,
      59,    60,     0,     0,     0,     0,     0,     0,    66,    26,
     126,     0,   430,   133,   135,   139,   137,     0,    24,     0,
       0,     0,    43,    44,     0,     0,     0,    41,   116,   117,
     118,   119,   120,   121,   122,   123,   124,   125,   115,     0,
      61,     0,     0,     0,     0,     0,     0,     0,    93,     0,
       0,    91,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   249,   250,   251,     0,     0,   227,   294,   373,     0,
      10,     9,     0,   413,   417,   357,   390,   365,     0,   360,
     359,     0,   378,   387,   366,     0,   361,     0,     0,   392,
       0,     0,   400,   401,     0,   215,   216,   219,   218,   217,
       0,   220,   222,     0,   256,   257,   258,   259,   260,   262,
     265,   266,   263,   264,   255,   261,     0,   276,   267,     0,
       0,   269,   268,   272,   181,     0,   175,   177,   179,   270,
       0,   271,     0,    16,    73,     0,    20,     0,   458,     0,
     489,   492,   493,   491,   490,     0,     0,     0,   332,   389,
     227,     0,   339,   407,    11,   341,     0,   396,     0,   278,
     307,     0,   336,     0,   395,   334,   333,     0,   279,     0,
     285,     0,     0,     0,   356,   354,     0,   352,     0,   349,
     145,    20,     0,   432,   141,   143,   149,   147,     0,     0,
      53,    54,     0,     0,     0,    51,     0,     0,   227,   380,
       0,   379,   195,     0,   185,   187,   189,   191,   193,     0,
       0,     0,     0,     0,    19,     0,     0,   134,   136,   140,
     138,   431,     0,     0,   506,     0,   484,    69,   438,   437,
       0,   151,   153,   155,   159,   157,   498,    45,     0,   503,
     499,   509,   502,     0,     0,   486,     0,    42,    38,    56,
       0,    55,    40,     0,   114,   113,    82,    83,    84,    86,
      87,    89,    90,    95,    96,    94,    98,    99,   101,   103,
     105,   107,   109,     0,   293,   299,   298,   376,   301,   300,
     303,   419,   421,   367,   363,   362,   393,   391,   429,   226,
       0,     0,     0,   223,   347,   346,     0,     0,     0,     0,
     182,   176,   178,   180,     0,   287,     0,    15,   227,     0,
     459,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   461,    20,     0,   450,     0,   452,   441,
       0,     0,     0,   442,   443,   444,   445,   446,     0,   308,
      13,   343,     0,   409,     0,     0,   331,     0,   342,     0,
     408,   397,   310,   398,   281,   277,   283,     0,   284,     0,
       0,     0,    62,   146,   142,   144,   150,   148,   433,    64,
      52,    48,     0,    50,     0,   369,     0,     0,     0,   383,
     382,     0,     0,   381,     0,     0,   196,   186,   188,   190,
     192,   194,     0,     0,     0,     0,     0,    65,    67,   127,
      80,    25,   488,     0,     0,   389,   152,   154,   156,   160,
     158,   494,   495,   496,     0,   501,   507,   505,   510,   504,
     483,   485,    39,     0,    37,     0,   294,     0,   225,   224,
       0,     0,     0,     0,     0,     0,   325,     0,     0,     0,
       0,   290,   289,    14,     0,     0,     0,     0,     0,     0,
       0,     0,   474,   475,   476,     0,     0,     0,   462,   129,
     389,     0,   199,   201,   451,     0,   454,   453,   460,   131,
     482,     0,   410,     0,   340,   407,     0,   344,   411,   286,
     282,   351,   350,    49,    47,   368,   370,    28,   384,   371,
       0,     0,     0,     0,     0,     0,    30,     0,     0,     0,
     487,   497,   500,    58,    57,   111,   221,   273,   274,   275,
     183,     0,     0,     0,     0,     0,   315,     0,     0,   330,
       0,     0,   449,     0,     0,     0,     0,     0,     0,     0,
     473,   477,     0,   447,     0,     0,   130,     0,   481,   409,
       0,     0,   408,     0,   372,    27,   197,    32,     0,     0,
      29,    34,     0,     0,   323,     0,   324,   184,     0,     0,
       0,     0,     0,     0,   320,   448,     0,     0,   470,     0,
       0,   472,     0,     0,     0,   480,     0,   200,     0,   434,
     202,   410,   411,   345,   198,    31,    33,     0,     0,     0,
     313,     0,   314,     0,   328,     0,   329,     0,     0,   463,
     465,   466,     0,   471,     0,     0,   132,   479,   439,     0,
     321,   322,     0,     0,     0,     0,     0,   318,     0,   319,
       0,     0,   468,     0,     0,   435,   311,   312,   326,   327,
       0,     0,   464,   467,   469,   436,   440,   316,   317
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    40,    41,   125,    43,    44,   203,   204,   205,   206,
     126,   127,   128,   129,   468,   236,   490,   130,   153,   238,
     132,   133,   134,   135,   136,   137,   138,   139,   140,   141,
     142,   143,   144,   145,   250,   279,   565,   174,   706,   252,
     423,   470,   209,    47,   365,   443,   701,   702,    48,    49,
      50,   341,   342,   343,    51,    52,    53,    54,   446,    55,
      56,   156,   157,   158,   159,   160,    57,   211,   212,   213,
     214,   215,   391,   392,    58,    59,   101,   102,    84,   439,
     166,   440,   167,   216,   217,    88,   218,    90,   395,   162,
     219,   168,   169,   170,   192,   257,   428,   820,   476,   849,
     568,   569,   570,   571,   572,   379,   573,   574,   575,   576,
     577,   147,   578,   220,   148,   477,   222,   478,   479,   480,
     481,   482,   483,   484,    61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -778
static const yytype_int16 yypact[] =
{
    8734,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,    53,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,   -79,   -26,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,   -17,  -778,   120,  7187,  -778,  -778,  -778,
     -15,  -778,  -778,  -778,  -778,  -778,  -778,   601,  -778,  -778,
      38,   124,   189,    86,   109,  6931,    79,  6118,  -778,  -778,
    -778,  -778,  1015,  7289,  1820,  1128,  -778,   113,  -778,    13,
    -778,  -778,  -778,  -778,   377,  -778,   876,   410,  8171,  -778,
    -778,   536,   136,  3359,   -76,  -778,   143,    61,  6931,  -778,
     154,   -59,  -778,   189,   189,  -778,  -778,  -778,  6971,  7004,
    7004,  8824,  6931,  -778,  8824,  6931,  7082,  -778,  6250,  -778,
     305,  -778,  -778,  -778,  -778,   173,    47,  -778,  -778,   625,
    -778,  1274,  6931,  -778,   219,   208,   471,  6931,   311,   561,
     188,   205,   222,   344,    67,  -778,   247,  -778,  -778,   266,
      50,   173,    29,  -778,   471,  5999,   262,  -778,  -778,  -778,
     158,  -778,  1015,  -778,  -778,   666,   304,   853,   313,   321,
    -778,  -778,   -55,  -778,   333,  1128,  -778,   146,   876,  1088,
     377,   410,  -778,   536,  8266,  6655,  -778,  -778,  6688,  -778,
     319,   356,   131,    32,   377,  -778,   288,  8914,  8456,  6601,
    8824,  -778,  -778,   376,   376,   376,   446,    55,   481,  5773,
     146,  3483,  -778,   -60,  -778,  -778,   410,  -778,  -778,  1088,
     370,   387,  -778,  5381,  3607,  3731,   388,   400,  -778,  6931,
     189,  -778,   238,   324,  6382,  -778,   695,  -778,  -778,  6766,
    -778,  -778,   113,  7487,  9004,  7586,  9004,  6382,  -778,  -778,
    -778,   152,  7977,  -778,  -778,  -778,  -778,   431,   432,  2517,
    2659,   189,  -778,  -778,  5097,   189,  6931,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  5173,
    -778,  6931,  6931,  6931,  6931,  6931,  6931,  6931,   471,  6931,
    6931,  -778,  6931,  6931,  6931,  6931,  6931,  6931,  6931,  6931,
    6931,  -778,  -778,  -778,  6118,  7388,   279,   420,   428,  6118,
    -778,  -778,  6118,  -778,  -778,  -778,  -778,  -778,  8644,  -778,
    -778,  1088,   377,  -778,  -778,   439,  -778,   129,   436,  -778,
     149,   442,  -778,  -778,   189,  -778,  -778,  -778,  -778,  -778,
     444,   456,  -778,   340,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,    79,  -778,  -778,   460,
     467,  -778,  -778,  -778,   479,  5657,  -778,  -778,  -778,  -778,
     441,  -778,  8456,  -778,  1015,  6514,   783,  8550,   448,  4921,
    -778,  -778,  -778,  -778,  -778,  5173,   899,  6931,  -778,   178,
     146,     2,  -778,   410,  -778,   369,  1088,  -778,    32,  -778,
    -778,   864,  -778,    32,  -778,  -778,  -778,  3855,  -778,  3979,
    -778,  4103,  5381,  4227,  -778,  -778,  5381,  -778,  5381,  -778,
    -778,    55,   491,  7977,  -778,  -778,  -778,  -778,   495,   189,
    -778,  -778,  5138,   189,  6931,  -778,  8076,  6931,     4,   482,
     493,   516,   531,  7784,  -778,  -778,  -778,  -778,  -778,  6931,
     525,  7883,   532,   533,  -778,  6931,   189,  -778,  -778,  -778,
    -778,  -778,  6931,   305,  -778,  2801,  -778,   711,  -778,  -778,
    8456,  -778,  -778,  -778,  -778,  -778,  -778,  -778,   376,  -778,
    -778,   221,  -778,  2943,   514,  -778,   524,  -778,  -778,  -778,
     213,  -778,  -778,   465,  -778,  -778,  -778,  -778,  -778,   219,
     219,   208,   208,   471,   471,   471,   311,   311,   561,   188,
     205,   222,   344,   296,  7685,  -778,  -778,   428,  -778,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    6931,   551,   458,  -778,  -778,  -778,  6931,    79,  6118,    76,
     -56,  -778,  -778,  -778,    48,  -778,    79,  -778,   146,   556,
    -778,  6931,   520,   558,   560,   563,  5062,   566,   189,   542,
     548,  5544,   189,  -778,    18,   280,  -778,  5886,  -778,  -778,
    2072,  2233,   547,  -778,  -778,  -778,  -778,  -778,   550,  -778,
    -778,  -778,  3085,   410,    32,  1151,  -778,  6931,  -778,    32,
     410,  -778,  -778,  -778,  -778,  -778,  -778,  4351,  -778,  4475,
    4599,  4723,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,  -778,   245,  -778,   468,  -778,   572,   573,   574,   482,
     516,  8361,  6931,   482,  6118,  6931,   580,  -778,  -778,  -778,
    -778,  -778,   581,   579,  6931,  6931,   582,  -778,  -778,  -778,
    -778,  -778,  -778,   567,  5173,   189,  -778,  -778,  -778,  -778,
    -778,  -778,  -778,  -778,  5173,  -778,  -778,  -778,   221,  -778,
    -778,  -778,  -778,  5173,  -778,  6931,  -778,   297,  -778,  -778,
     588,   593,    56,    -1,   376,   376,  -778,  6118,   171,   257,
     583,  -778,  -778,  -778,   584,  5062,  6931,  6931,  6799,   665,
    5437,   591,  -778,  -778,  -778,   314,   598,  5062,  -778,  -778,
      75,   343,  -778,   617,  -778,  2375,  -778,  -778,  -778,  -778,
    -778,   602,   410,   146,  -778,   621,  1088,   619,   410,  -778,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,   482,  -778,
     640,   639,   167,   642,  6118,  6931,  -778,   643,   644,  6931,
    -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,  -778,
    -778,   -22,   -52,   254,   376,   376,  -778,   376,   376,  -778,
     260,  5062,  -778,   317,   372,  5062,   391,   651,  5062,  5510,
    -778,  -778,  6931,  -778,  3227,  1128,  -778,  5249,  -778,   621,
      32,    32,   621,  6931,  -778,  -778,  -778,  -778,   330,   646,
    -778,  -778,   655,   376,  -778,   376,  -778,  -778,   -10,   -14,
      22,     1,   376,   376,  -778,  -778,  5062,  5062,  -778,  5062,
    6931,  -778,  5062,  6839,   638,  -778,   641,  -778,  5249,  -778,
    -778,   621,   621,  -778,  -778,  -778,  -778,   647,   648,   376,
    -778,   376,  -778,   376,  -778,   376,  -778,    24,    40,   727,
    -778,  -778,   402,  -778,  5062,   412,  -778,  -778,  -778,   157,
    -778,  -778,   653,   654,   656,   657,   376,  -778,   376,  -778,
    5062,   661,  -778,  5062,  4779,  -778,  -778,  -778,  -778,  -778,
     660,   663,  -778,  -778,  -778,  -778,  -778,  -778,  -778
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -778,   371,  -778,   686,   746,   209,  -778,  -778,  -778,  -778,
       0,  -778,   357,   252,  -241,  -778,   378,   379,   193,   698,
    -778,  -120,   346,   322,   -41,  -778,   348,   523,   519,   522,
     527,   530,  -778,  1586,   -51,  -778,   383,   406,  -364,  -778,
    -778,  -350,   187,  -778,  -778,   577,  -778,    60,  1308,   961,
    -778,  -778,  -315,  -778,   443,  -778,  1162,  1225,  -143,  1235,
    -170,  -778,   251,   269,   528,  -519,  -179,  -124,   438,  -778,
    -778,  -206,  -778,   261,  -136,  1390,   540,   612,   -71,  -394,
     -40,  -174,   -45,   -42,  -187,  -778,   -39,   -66,   384,  -778,
     868,   -86,  -778,    10,  -778,  -778,   600,  -777,  -372,  -778,
     274,  -778,  -778,   278,  -778,  -778,  1161,  -651,  -778,  -778,
    -778,  -117,  -778,  -778,   415,  -778,  -778,  -778,   389,   207,
     390,   392,  -778,  -251,  -778
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -509
static const yytype_int16 yytable[] =
{
      45,    86,   191,   258,    87,   400,    85,    89,   180,   486,
      60,   373,   280,   579,   146,   566,     1,   795,   370,   673,
     194,     1,   394,   489,    64,   195,   154,   369,   533,   567,
     178,    87,     1,    87,    89,     1,    89,   181,   494,   769,
     182,   848,    65,    67,   619,    71,    77,   623,   793,    87,
       1,     1,    89,     1,   368,   831,     1,    96,     1,     1,
     829,   371,   100,   677,     1,   223,   150,   152,   401,   230,
     835,   450,   319,   165,   369,   176,   369,    71,     1,   176,
     402,     2,     1,   231,   299,   678,   259,   876,   190,     2,
     796,   176,   833,   207,   856,    66,   288,   227,   325,   407,
     409,   411,    67,   100,   100,   732,    92,     2,   371,   858,
     371,   242,   322,   195,   242,   307,     1,   323,   813,   750,
     794,    68,    72,     1,    99,   436,    71,   312,   832,   267,
     585,    72,   830,    87,    73,   181,    89,    87,   182,    74,
      89,    87,   586,   836,    89,   674,   675,    69,    70,     1,
      71,   181,    71,   175,   182,   242,   697,    87,   753,   260,
      89,   496,   497,   498,   834,    71,   857,   393,   304,   310,
     260,   397,   303,    69,    70,   176,    98,   176,   749,   176,
     404,     1,   859,   176,    45,   547,   370,    46,   260,   679,
      71,   489,     1,   176,    62,   369,   260,   364,    77,   376,
     242,   400,   225,   400,   300,   400,   704,    71,   267,   389,
     176,   207,   461,   491,   643,   788,   774,   669,   676,   176,
     567,   567,   543,   207,   207,   207,   728,   103,   495,   371,
     100,    69,    70,    63,   421,   180,   435,   194,    69,    70,
     754,   755,    71,   242,   442,   242,   442,   421,   503,   504,
     104,   505,   456,   333,   155,   323,   524,   196,   131,   334,
      46,   487,   616,   154,    72,   492,    95,   175,   154,   632,
     259,   154,   741,   369,   454,    46,   526,   636,   311,    87,
     455,   369,    89,   651,   224,   864,   312,   786,   597,   599,
     259,   335,   600,   229,   601,   312,    69,    70,   243,   865,
     629,   245,   240,   241,   421,    45,   226,   371,   629,   421,
     107,   131,   152,   756,   259,   371,   336,   295,    45,   582,
      68,   176,     1,   289,   290,   544,   757,   758,   522,   802,
     803,   711,   337,    87,   528,   662,    89,   281,   284,   285,
     296,   663,   640,   335,    87,   208,   641,    89,   583,   654,
     617,   397,   282,   283,   590,   567,   535,   404,   297,   591,
     298,   655,   338,   339,   593,   540,   230,   723,   336,   301,
     545,    46,    77,   663,   797,   376,    71,   242,   416,   564,
     417,   491,   312,   608,   337,   372,   176,   377,   302,    71,
     176,   400,   131,   400,   400,   400,   176,    72,   176,   759,
     305,   309,   804,   176,   639,    74,   363,   207,   455,   207,
     340,   207,   207,   207,   338,   339,   207,    76,   207,   746,
     698,    71,   743,   242,   455,   455,   315,   422,   393,   610,
     291,   292,   131,   613,   665,   317,    45,    69,    70,   806,
     452,  -428,   455,   626,     1,   455,   322,  -428,    29,   318,
     824,   626,   230,   363,   771,   363,    71,   131,   312,   131,
     320,   335,   531,   208,   418,   235,   419,   267,   532,     2,
     645,   775,   131,   235,   666,   208,   208,   208,   332,    35,
      36,   286,   287,   776,     1,   670,   336,   237,   261,   262,
     263,   514,    46,   131,   807,   237,   514,   154,   184,   155,
     455,   251,   337,   185,   228,    46,   181,   587,   221,   182,
     405,   467,   467,   809,   242,    27,    28,   378,   244,   455,
      29,   246,   703,   816,   861,    87,    76,   406,    89,   412,
     455,   187,   338,   339,   863,   730,   188,   672,   152,     1,
     455,   413,   712,   715,   680,   591,   682,   718,   176,   305,
     593,    35,    36,   462,    74,   515,   564,   463,   691,  -292,
     518,   523,   696,   525,    71,   534,   529,   700,   131,   527,
     564,   564,   131,   516,   363,   293,   294,   530,   519,    95,
      76,   536,   251,   154,   176,   176,   383,   378,   537,   176,
     550,   328,   664,   455,   331,   724,   455,   207,   538,   207,
     207,   207,   264,   621,     1,   420,   265,   266,   501,   502,
      27,    28,   744,   602,    76,    29,    76,   609,   420,   622,
     385,    45,   251,    46,   152,   131,   221,   131,     1,     2,
     499,   500,   261,   262,   263,   414,   154,   436,   221,   221,
     221,   506,   507,   232,   233,    71,    35,    36,   131,   493,
     624,   634,   363,   208,   637,   638,   660,    73,   685,   208,
     363,   208,    74,   208,   208,   208,   661,    68,   208,     1,
     208,   779,    71,   668,   782,    27,    28,   152,   683,   686,
      29,   687,   692,   513,   688,   564,    42,   690,   693,   708,
     709,    27,    28,   154,   725,   726,    29,   564,     1,   734,
      71,   727,   429,   430,   431,   564,   736,   735,   739,   740,
     747,    35,    36,   176,     1,   748,   176,   467,   261,   262,
     263,   767,   761,   131,   760,   155,   819,    35,    36,   131,
     703,   770,    42,    87,   152,   467,    89,   772,   821,   822,
    -389,  -389,    93,    76,   778,  -389,   264,   188,    76,   131,
     265,   266,   149,   151,   131,   681,   777,   783,   251,    42,
     172,   564,   784,   131,   131,   564,   785,   819,   564,   787,
     790,   791,   810,   825,    42,   176,  -389,  -389,   846,   151,
     176,   176,   826,   847,    69,    70,     1,  -389,  -389,   850,
     851,   860,  -389,   581,   603,   866,   867,    42,   868,   869,
      42,   873,   877,    94,   151,   878,   564,   564,    46,   564,
     612,   155,   564,   819,   248,   509,   432,   614,   508,   510,
     433,   434,   221,   451,   221,   511,   221,   221,   221,   512,
     689,   221,   264,   221,   467,   817,   265,   266,   588,   592,
     520,    42,   415,   618,   564,   707,   714,   453,   705,   208,
     644,   208,   208,   208,   652,   633,   131,  -389,  -389,     0,
     564,   742,  -389,   564,   155,   105,     0,     1,   106,   107,
      42,   327,   657,   658,   330,   659,     0,     0,   131,   131,
     131,   131,     0,   131,    42,    76,    42,     0,     0,     0,
     131,     0,     2,  -389,  -389,    42,     0,   151,   131,     0,
       0,     0,     1,     0,     0,     0,   467,     0,     0,   151,
     151,   151,     0,   667,    91,     0,     0,     0,     0,     0,
     151,   155,     0,     0,   260,     0,     0,    27,    28,    42,
       0,    42,    29,   151,     0,   111,   112,     0,    42,     0,
     163,    91,     0,   179,   695,   151,   151,   183,     0,     0,
      27,    28,     0,     0,   131,    29,     0,   684,   131,   762,
       0,   131,   131,    35,    36,     0,   114,   115,     0,     0,
     131,   773,     0,    27,    28,   316,     0,     0,    29,   707,
       0,     0,     0,     0,     0,   239,    35,    36,   120,     0,
     151,    42,     0,   717,     0,   151,     0,     0,   151,   131,
     131,     0,   131,   131,    42,   131,   131,    79,     0,    35,
      36,   131,   221,     0,   221,   221,   221,    72,    97,     0,
     175,   580,     0,   308,     0,     0,   467,     0,   731,     0,
     314,   733,     0,     0,    79,   805,   177,   131,     0,   808,
     737,   738,   811,   179,     0,   321,     0,   186,     0,     0,
       0,     0,   193,   131,   210,     0,   131,   131,    42,    18,
      19,   151,     0,    42,     0,   151,     0,   179,     0,   763,
     764,   766,     0,     0,     0,     0,     0,   396,   398,     0,
     839,   840,     0,   841,     0,     0,   843,     0,     0,    27,
      28,     1,     0,   151,    29,   151,     0,   151,   151,   151,
       0,     0,   151,     0,   151,     0,     0,     0,     0,    42,
       0,   441,     0,   441,     0,     0,   306,     0,   862,     0,
     308,     0,    42,     0,     0,    35,    36,     0,   186,     0,
       0,     1,     0,    72,   872,     0,   177,   874,     0,   186,
     193,   789,     0,     0,   193,   792,     0,     0,     0,     0,
       0,   151,     0,     0,     1,     0,    42,     0,     0,   210,
     177,     0,    27,    28,     0,     0,     0,    29,     0,   151,
     390,     0,   210,   308,   517,     0,     0,     0,   814,     0,
     403,     0,     0,     0,   210,   210,   210,     0,     0,   823,
       0,     0,     0,   842,     0,     0,   845,     0,    35,    36,
      42,     0,    27,    28,   438,     0,   438,    29,    80,   175,
       0,     0,     0,   306,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   671,   151,    27,    28,     0,     0,     0,
      29,     0,     0,   308,   161,     0,     0,     0,    35,    36,
       0,     0,   163,   179,     0,     0,    72,     0,     0,   175,
       0,     0,     0,    42,   179,     0,   151,   151,   584,     0,
       0,    35,    36,     0,     0,     0,   306,     0,   151,    72,
       0,    81,   175,     0,     0,     0,     0,     0,     0,     0,
     253,    82,   193,   151,     0,   151,   151,   151,     0,   387,
       0,   308,   268,   269,   270,   271,   272,   273,   274,   275,
     276,   277,     0,     0,   441,     0,   620,    42,     0,     0,
     151,   441,     0,     0,     0,     0,     0,    80,     0,   441,
       0,     0,     0,     0,   313,     0,   306,     0,     0,     0,
       0,   546,     0,   210,     0,     0,   548,     0,   396,     0,
       0,     0,     0,   254,     0,     0,     0,   177,     0,     0,
       0,     0,     0,   255,    78,     0,     0,   589,     0,   367,
       0,     0,     0,   151,   380,   381,   382,   384,   210,     0,
     210,    80,   210,   210,   210,     0,     0,   210,     0,   210,
      81,     0,   308,     0,   306,     0,     0,     0,     0,     0,
      82,   151,     0,     0,     0,     0,   424,   438,     0,     0,
       0,     0,     0,     0,   438,    80,   445,    80,   445,   424,
       0,     0,   438,   278,   457,     0,   321,     0,     0,     0,
     151,   472,   472,     0,     0,     0,     0,     0,     0,     0,
       0,   390,     0,     0,    81,   179,    83,     0,     0,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,   716,     0,     0,     0,     0,     0,   425,
     151,     0,     0,    78,     0,     0,     0,     0,    81,   426,
      81,     0,   425,     0,     0,   306,     0,   458,    82,   447,
      82,   447,   426,     0,   473,   473,     0,   459,     0,     0,
       0,     0,     0,     0,   474,   474,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   366,     0,     0,   256,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   542,   548,     0,
       0,     0,     0,     0,    80,     0,   161,   253,     0,    80,
       0,   472,     0,     0,     0,    83,   713,     0,     0,     0,
       0,    78,   444,    78,   444,     0,     0,     0,   210,     0,
     210,   210,   210,     0,     0,     0,     0,   471,   471,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   780,     0,     0,     0,   604,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    83,
     254,     0,    81,     0,   473,   628,     0,    82,     0,     0,
     255,     0,    82,   628,   474,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   427,     0,     0,   472,     0,     0,
       0,     0,   647,    83,   448,    83,   448,   427,     0,   653,
       0,     0,   460,   179,     0,   472,     0,     0,   605,   475,
     475,     0,     0,     0,     0,     0,     0,     0,   606,     0,
     173,     0,     0,     0,   186,     0,     0,     0,     0,     0,
       0,     0,     0,   541,     0,     0,    80,   781,   630,     0,
      78,     0,     0,     0,   173,    78,   630,   471,     0,     0,
     473,     0,     0,     0,     0,   648,     0,     0,   173,     0,
     474,   173,     0,     0,     0,   649,     0,     0,   473,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   474,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   647,
       0,     0,   472,   472,     0,     0,   177,     0,     0,    81,
       0,     0,     0,     0,   472,     0,     0,     0,     0,    82,
       0,   627,     0,     0,     0,     0,     0,     0,     0,   627,
       0,     0,    83,     0,     0,   256,     0,    83,     0,   475,
       0,   173,     0,   471,   173,     0,     0,     0,   646,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   471,   648,     0,     0,   473,   473,     0,     0,     0,
       0,     0,   649,     0,     0,   474,   474,   473,     0,     0,
       0,     0,     0,   607,     0,   173,     0,   474,     0,     0,
       0,   105,    78,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,   631,     0,   751,   752,     0,     0,     0,
       0,   631,     0,     0,     0,   469,   469,     0,     2,     0,
       0,     0,     0,     0,     0,   475,     0,     0,     0,     0,
     650,     0,     0,     0,     0,     0,     0,   472,     0,     0,
       0,     0,     0,   475,     0,   646,     0,     0,   471,   471,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     471,   111,   112,   113,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   798,   799,     0,   800,   801,
       0,     0,   114,   115,     0,     0,     0,     0,     0,   116,
     473,     0,     0,     0,     0,     0,   472,     0,   117,     0,
     474,   118,     0,   119,   120,     0,     0,   171,     0,   121,
     122,   123,   124,     0,   827,     0,   828,   650,     0,     0,
     475,   475,     0,   837,   838,     0,     0,     0,     0,     0,
       0,   469,   475,   173,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     852,     0,   853,     0,   854,     0,   855,     0,     0,   473,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   474,
       0,     0,     0,   471,     0,     0,     0,   870,     0,   871,
       0,     0,     0,   173,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   173,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   469,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   469,
       0,     0,     0,   105,     0,     1,   106,   107,   108,     0,
     109,   110,   471,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   475,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   551,   552,   553,   554,   555,   556,
     557,   558,   559,   560,   561,     0,     0,   173,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,   562,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,   475,     0,     0,     0,   469,     0,
       0,     0,    34,   173,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     0,     0,    39,
     117,     0,     0,   118,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,     0,     0,     0,   173,     0,
       0,   173,   563,   378,  -456,     0,     0,     0,     0,     0,
     173,   173,     0,     0,     0,     0,     0,     0,     0,     0,
     469,     0,     0,     0,   105,     0,     1,   106,   107,   108,
     469,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,   745,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,   551,   552,   553,   554,   555,
     556,   557,   558,   559,   560,   561,     0,     0,     0,    26,
       0,     0,     0,     0,   111,   112,   113,    27,    28,     0,
     562,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,   173,     0,     0,     0,   173,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,   116,    35,    36,    37,    38,     0,     0,     0,
      39,   117,     0,     0,   118,     0,   119,   120,   173,     0,
     469,     0,   121,   122,   123,   124,     0,     0,     0,   173,
       0,     0,     0,   563,   378,  -455,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,   551,   552,   553,
     554,   555,   556,   557,   558,   559,   560,   561,     0,     0,
       0,    26,     0,     0,     0,     0,   111,   112,   113,    27,
      28,     0,   562,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,   116,    35,    36,    37,    38,     0,
       0,     0,    39,   117,     0,     0,   118,     0,   119,   120,
       0,     0,     0,     0,   121,   122,   123,   124,     0,     0,
       0,     0,     0,     0,     0,   563,   378,  -457,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
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
       0,     0,     0,     0,     0,     0,     0,   464,   465,   466,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,    37,    38,     0,     0,     0,    39,   117,     0,     0,
     118,     0,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,     0,     0,     0,     0,     0,     0,     0,   464,
     465,   485,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,   111,   112,   113,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
     116,    35,    36,    37,    38,     0,     0,     0,    39,   117,
       0,     0,   118,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       0,   464,   465,   642,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,   111,   112,   113,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,   116,    35,    36,    37,    38,     0,     0,     0,
      39,   117,     0,     0,   118,     0,   119,   120,     0,     0,
       0,     0,   121,   122,   123,   124,     0,     0,     0,     0,
       0,     0,     0,   656,   465,  -508,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,   111,   112,   113,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,   116,    35,    36,    37,    38,     0,
       0,     0,    39,   117,     0,     0,   118,     0,   119,   120,
       0,     0,     0,     0,   121,   122,   123,   124,     0,     0,
       0,     0,     0,     0,     0,   464,   465,   710,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
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
     105,     0,     1,   106,   107,     0,     0,   464,   465,   815,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   197,     0,     0,
     111,   112,     0,    27,    28,     0,     0,   198,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,    72,     0,     0,
     199,     0,   200,   120,   105,     0,     1,   106,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   201,
       0,   202,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   197,     0,     0,   111,   112,     0,    27,    28,     0,
       0,   198,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,    72,     0,     0,   199,     0,   200,   120,   105,     0,
       1,   106,   107,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   201,     0,   399,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   197,     0,     0,   111,   112,
       0,    27,    28,     0,     0,   198,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,    72,     0,     0,   199,     0,
     200,   120,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   201,     0,   408,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   197,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   198,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,    72,
       0,     0,   199,     0,   200,   120,   105,     0,     1,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   201,     0,   410,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   197,     0,     0,   111,   112,     0,    27,
      28,     0,     0,   198,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,    72,     0,     0,   199,     0,   200,   120,
     105,     0,     1,   106,   107,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   201,     0,   594,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   197,     0,     0,
     111,   112,     0,    27,    28,     0,     0,   198,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,    72,     0,     0,
     199,     0,   200,   120,   105,     0,     1,   106,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   201,
       0,   595,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   197,     0,     0,   111,   112,     0,    27,    28,     0,
       0,   198,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,    72,     0,     0,   199,     0,   200,   120,   105,     0,
       1,   106,   107,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   201,     0,   596,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   197,     0,     0,   111,   112,
       0,    27,    28,     0,     0,   198,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,    72,     0,     0,   199,     0,
     200,   120,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   201,     0,   598,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   197,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   198,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,    72,
       0,     0,   199,     0,   200,   120,   105,     0,     1,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   201,     0,   719,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   197,     0,     0,   111,   112,     0,    27,
      28,     0,     0,   198,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,    72,     0,     0,   199,     0,   200,   120,
     105,     0,     1,   106,   107,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   201,     0,   720,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   197,     0,     0,
     111,   112,     0,    27,    28,     0,     0,   198,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,    72,     0,     0,
     199,     0,   200,   120,   105,     0,     1,   106,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   201,
       0,   721,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
     105,     0,     1,   106,   107,   108,     0,   109,   110,    26,
       0,   197,     0,     0,   111,   112,     0,    27,    28,     0,
       0,   198,    29,     0,     0,    30,    31,     2,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,    72,     0,     0,   199,     0,   200,   120,     0,     0,
     111,   112,   113,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   201,     0,   722,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,     0,
       0,     0,     0,     0,     0,     0,     0,   117,     0,     0,
     118,     0,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,     0,     0,     0,     0,     0,     0,     0,     0,
     818,   875,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,   551,   552,   553,   554,   555,   556,   557,
     558,   559,   560,   561,     0,     0,     0,    26,     0,     0,
       0,     0,   111,   112,   113,    27,    28,     0,   562,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
     116,    35,    36,    37,    38,     0,     0,     0,    39,   117,
       0,     0,   118,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       0,   563,   378,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,   551,   552,   553,   554,   555,   556,
     557,   558,   559,   560,   561,     2,     0,     0,     0,     0,
       0,     0,     0,   111,   112,   113,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,   115,     2,     0,   111,   112,
     113,   116,     0,     0,   105,     0,     1,   106,   107,   108,
     117,   109,   110,   118,     0,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,     0,     0,     0,     0,   114,
     115,     2,   563,   378,     0,     0,   116,     0,     0,   111,
     112,   113,     0,     0,     0,   117,     0,     0,   118,   488,
     119,   120,     0,     0,     0,     0,   121,   122,   123,   124,
       0,     0,     0,     0,     0,     0,     0,     0,   465,     0,
     114,   115,     0,     0,   111,   112,   113,   116,     0,     0,
     105,     0,     1,   106,   107,   108,   117,   109,   110,   118,
     611,   119,   120,     0,     0,     0,     0,   121,   122,   123,
     124,     0,     0,     0,     0,   114,   115,     2,     0,   465,
       0,     0,   116,     0,     0,     0,     0,     0,     0,     0,
       0,   117,     0,     0,   118,     0,   119,   120,     0,     0,
       0,     0,   121,   122,   123,   124,     0,     0,     0,     0,
       0,     0,     0,     0,   465,     0,     0,     0,     0,     0,
     111,   112,   113,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,     0,
       0,     0,     0,     0,     0,     0,     0,   117,     0,     0,
     118,     0,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,   105,     0,     1,   106,   107,     0,     0,     0,
     818,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,   105,     0,
       1,   106,   107,   108,     0,   109,   110,    26,     0,   197,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   198,
      29,     0,     0,    30,    31,     2,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,    72,
       0,     0,   199,     0,   200,   120,     0,     0,   111,   112,
     113,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,   201,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   114,
     115,     0,     0,     0,     0,   105,   116,     1,   106,   107,
     108,     0,   109,   110,     0,   117,     0,     0,   118,   768,
     119,   120,     0,     0,     0,     0,   121,   122,   123,   124,
       0,     0,     2,     0,     0,     0,     0,   563,     0,     0,
       0,   111,   112,   113,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   114,   115,     0,   111,   112,   113,     0,   116,
       0,     0,     0,     0,     0,     0,     0,     0,   117,     0,
       0,   118,   812,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,     0,     0,   114,   115,     0,     0,
     563,     0,     0,   116,     0,     0,     0,     0,     0,     0,
       1,     0,   117,     0,     0,   118,     0,   119,   120,     0,
       0,     0,     0,   121,   122,   123,   124,     0,     0,     0,
       0,     0,     0,     0,   694,     2,     3,     4,     5,     6,
       7,   344,   345,   346,   347,   348,   349,   350,   351,   352,
     353,    18,    19,   354,   355,    22,    23,   356,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   357,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,     0,
       0,     0,   358,     0,   359,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   360,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,   361,
     362,     0,     0,     0,    39,    72,     1,     0,   305,     0,
       0,     0,     0,    74,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   539,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     1,
      39,    72,     0,     0,   386,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   387,     0,   388,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     1,    39,    72,     0,     0,   175,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   699,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,    72,     0,   105,
     305,     1,   106,   107,   108,    74,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,  -291,     0,
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
     124,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   111,   112,   113,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,   116,
      35,    36,    37,    38,     0,     0,     0,     0,   117,     0,
       0,   118,   249,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     0,     0,     0,
     117,     0,     0,   239,   249,   119,   120,     0,     0,     0,
       0,   121,   122,   123,   124,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   111,   112,   113,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,   116,    35,    36,    37,    38,     0,     2,
       0,     0,   374,     0,     0,   375,   249,   119,   120,     0,
       0,     0,     0,   121,   122,   123,   124,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,   111,   112,   113,    27,    28,     0,     0,     0,
      29,     0,     0,     2,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,   114,   115,     0,     0,     0,     0,     0,
     116,    35,    36,     0,     0,     0,     2,     0,     0,   374,
       0,     0,   375,   249,   119,   120,   111,   112,   113,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   114,   115,   111,
     112,   113,     0,     0,   116,     0,     0,   105,     0,     1,
     106,   107,   108,   117,   109,   110,   118,     0,   119,   120,
       0,     0,   326,     0,   121,   122,   123,   124,     0,     0,
     114,   115,     0,     0,     2,     0,     0,   116,     0,     0,
     105,     0,     1,   106,   107,   108,   117,   109,   110,   118,
       0,   119,   120,     0,     0,   329,     0,   121,   122,   123,
     124,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   111,   112,   113,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   114,   115,
     111,   112,   113,     0,     0,   116,     0,     0,     0,     0,
       0,     0,     0,     0,   117,     0,     0,   118,   249,   119,
     120,     0,     0,     0,     0,   121,   122,   123,   124,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,     0,
     111,   112,   113,     0,     0,     0,     0,   117,     0,     0,
     118,   765,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,   105,     0,     1,   106,   107,   108,     0,   109,
     110,   114,   115,     0,     0,     0,     0,     0,   116,     0,
       0,     0,     0,     0,     0,     0,     0,   117,     0,     2,
     118,   844,   119,   120,     0,     0,     0,     0,   121,   122,
     123,   124,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,   111,   112,   113,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   114,   115,     0,     0,     0,     0,     0,
     116,     0,   111,   112,   113,     0,     0,     0,     0,   117,
       0,     0,   118,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,   115,   111,   112,   113,     0,     0,
     116,     0,     0,   105,     0,     1,   106,   107,   108,   117,
     109,   110,   234,     0,   119,   120,     0,     0,     0,     0,
     121,   122,   123,   124,     0,     0,   114,   115,     0,     0,
       2,     0,     0,   116,     0,     0,     0,     0,     0,     0,
       0,     0,   117,     0,     0,   239,     0,   119,   120,     0,
       0,     0,     0,   121,   122,   123,   124,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   111,   112,   113,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   114,   115,     0,     0,     0,     0,
       1,   116,     0,     0,     0,     0,     0,     0,     0,     0,
     117,     0,     0,   247,     0,   119,   120,     0,     0,     0,
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
      37,    38,     0,     0,     0,    39,    72,     0,     0,   305,
     164,     0,     0,     0,    74,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     1,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,    72,     0,     0,   436,     0,
       0,     0,     0,   437,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     1,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   436,     0,     0,
       0,     0,   449,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     1,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,    72,     0,     0,   305,     0,     0,     0,
       0,    74,     2,     3,     4,     5,     6,     7,   344,   345,
     346,   347,   348,   349,   350,   351,   352,   353,    18,    19,
     354,   355,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     357,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   358,
       0,   359,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   360,     0,     1,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   361,   362,     0,     0,
       0,    39,    72,     0,     0,   436,     0,     0,     0,     0,
     625,     2,     3,     4,     5,     6,     7,   344,   345,   346,
     347,   348,   349,   350,   351,   352,   353,    18,    19,   354,
     355,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   357,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,     0,     0,     0,   358,     0,
     359,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     0,   360,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,   361,   362,     0,     0,     0,
      39,    72,     0,     0,   436,     2,     0,     0,     0,   635,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,     1,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,     0,    72,     0,     0,   305,     0,
       0,     0,     0,    74,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,    72,     0,     0,   436,   615,     2,
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
       0,     0,     0,    39,     0,     0,     0,     0,   324,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
       0,     0,     0,   729,     2,     3,     4,     5,     6,     7,
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
       0,   549,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,   521,     0,     0,     0,     0,
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
       0,    39,     2,     3,     4,     5,     6,     7,   344,   345,
     346,   347,   348,   349,   350,   351,   352,   353,    18,    19,
     354,   355,    22,    23,   356,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     357,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   358,
       0,   359,     0,     0,     0,     0,     0,     1,     0,     0,
       0,     0,     0,     0,   360,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   361,   362,     0,     0,
       0,    39,     2,     3,     4,     5,     6,     7,   344,   345,
     346,   347,   348,   349,   350,   351,   352,   353,    18,    19,
     354,   355,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     357,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   358,
       0,   359,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   360,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,   361,   362,     0,     0,
       0,    39
};

static const yytype_int16 yycheck[] =
{
       0,    46,    88,   120,    46,   211,    46,    46,    79,   260,
       0,   198,   132,   385,    65,   379,     3,    69,   197,   538,
      91,     3,   209,   264,    24,    91,    67,   197,   343,   379,
      75,    73,     3,    75,    73,     3,    75,    79,   279,   690,
      79,   818,   121,   119,   438,    45,    46,   441,    70,    91,
       3,     3,    91,     3,   197,    69,     3,    57,     3,     3,
      70,   197,    62,   119,     3,   141,    66,    67,   128,   128,
      69,   245,   127,    73,   244,    75,   246,    77,     3,    79,
     140,    28,     3,   142,    17,   141,   141,   864,    88,    28,
     142,    91,    70,    93,    70,   121,   137,    97,   184,   223,
     224,   225,   119,   103,   104,   624,   121,    28,   244,    69,
     246,   111,   183,   179,   114,   155,     3,   183,   769,   120,
     142,     1,   118,     3,     0,   121,   126,   128,   142,   129,
     128,   118,   142,   175,   121,   177,   175,   179,   177,   126,
     179,   183,   140,   142,   183,    69,    70,   118,   119,     3,
     150,   193,   152,   121,   193,   155,   138,   199,   677,   141,
     199,   281,   282,   283,   142,   165,   142,   209,   139,    11,
     141,   210,   122,   118,   119,   175,   138,   177,   122,   179,
     219,     3,   142,   183,   184,   372,   365,     0,   141,   141,
     190,   432,     3,   193,   141,   365,   141,   197,   198,   199,
     200,   407,   141,   409,   137,   411,   570,   207,   208,   209,
     210,   211,   252,   264,   465,   734,   141,   532,   142,   219,
     570,   571,   365,   223,   224,   225,   620,   141,   279,   365,
     230,   118,   119,    24,   234,   306,   236,   308,   118,   119,
      69,    70,   242,   243,   244,   245,   246,   247,   289,   290,
     141,   292,   252,   122,    67,   321,   127,   121,    65,   128,
      73,   261,   436,   304,   118,   265,    57,   121,   309,   443,
     141,   312,   644,   443,   122,    88,   127,   451,   120,   321,
     128,   451,   321,   470,   141,   128,   128,   120,   412,   413,
     141,     3,   416,   139,   418,   128,   118,   119,   111,   142,
     443,   114,   109,   110,   304,   305,    97,   443,   451,   309,
       5,   118,   312,   142,   141,   451,    28,   129,   318,   141,
       1,   321,     3,    12,    13,   365,    69,    70,   318,    69,
      70,   582,    44,   375,   334,   122,   375,   118,   130,   131,
     135,   128,   462,     3,   386,    93,   463,   386,   390,   128,
     436,   390,   133,   134,   396,   705,   356,   396,   136,   398,
      16,   140,    74,    75,   403,   365,   128,   122,    28,   122,
     370,   184,   372,   128,   120,   375,   376,   377,   140,   379,
     142,   432,   128,   423,    44,   198,   386,   200,   122,   389,
     390,   597,   199,   599,   600,   601,   396,   118,   398,   142,
     121,   139,   142,   403,   455,   126,   197,   407,   128,   409,
     122,   411,   412,   413,    74,    75,   416,    46,   418,   122,
     140,   421,   663,   423,   128,   128,   122,   234,   470,   429,
     119,   120,   239,   433,   138,   122,   436,   118,   119,   122,
     247,   122,   128,   443,     3,   128,   517,   128,    79,   128,
     120,   451,   128,   244,   140,   246,   456,   264,   128,   266,
     127,     3,   122,   211,   140,   108,   142,   467,   128,    28,
     470,   128,   279,   116,   514,   223,   224,   225,   122,   110,
     111,    10,    11,   140,     3,   536,    28,   108,     7,     8,
       9,   304,   305,   300,   122,   116,   309,   538,   121,   312,
     128,   118,    44,   126,    98,   318,   548,   138,    93,   548,
     140,   259,   260,   122,   514,    74,    75,   141,   112,   128,
      79,   115,   567,   774,   122,   567,   155,   140,   567,   141,
     128,   121,    74,    75,   122,   621,   126,   537,   538,     3,
     128,   141,   584,   585,   544,   584,   546,   589,   548,   121,
     589,   110,   111,   122,   126,   304,   556,   125,   558,   139,
     309,   122,   562,   127,   564,   356,   122,   567,   375,   127,
     570,   571,   379,   304,   365,    14,    15,   121,   309,   370,
     209,   121,   199,   624,   584,   585,   140,   141,   121,   589,
     142,   185,   127,   128,   188,   127,   128,   597,   119,   599,
     600,   601,   121,   121,     3,   234,   125,   126,   286,   287,
      74,    75,   663,   122,   243,    79,   245,   122,   247,   126,
     139,   621,   239,   436,   624,   432,   211,   434,     3,    28,
     284,   285,     7,     8,     9,   229,   677,   121,   223,   224,
     225,   293,   294,   103,   104,   645,   110,   111,   455,   266,
     119,   126,   443,   401,   122,   122,   142,   121,   138,   407,
     451,   409,   126,   411,   412,   413,   142,     1,   416,     3,
     418,   713,   672,   122,   716,    74,    75,   677,   122,   121,
      79,   121,   140,   300,   121,   685,     0,   121,   140,   142,
     140,    74,    75,   734,   122,   122,    79,   697,     3,   119,
     700,   127,     7,     8,     9,   705,   127,   126,   126,   142,
     122,   110,   111,   713,     3,   122,   716,   465,     7,     8,
       9,    56,   138,   530,   141,   538,   777,   110,   111,   536,
     775,   140,    46,   775,   734,   483,   775,   139,   780,   781,
      74,    75,   141,   372,   142,    79,   121,   126,   377,   556,
     125,   126,    66,    67,   561,   546,   139,   138,   375,    73,
      74,   761,   122,   570,   571,   765,   127,   818,   768,   127,
     127,   127,   121,   127,    88,   775,   110,   111,   140,    93,
     780,   781,   127,   142,   118,   119,     3,   121,   122,   142,
     142,    64,   126,   387,   423,   142,   142,   111,   142,   142,
     114,   140,   142,    57,   118,   142,   806,   807,   621,   809,
     432,   624,   812,   864,   116,   296,   121,   434,   295,   297,
     125,   126,   407,   246,   409,   298,   411,   412,   413,   299,
     556,   416,   121,   418,   582,   775,   125,   126,   395,   401,
     312,   155,   230,   437,   844,   571,   585,   247,   570,   597,
     139,   599,   600,   601,   470,   449,   663,    74,    75,    -1,
     860,   654,    79,   863,   677,     1,    -1,     3,     4,     5,
     184,   185,   483,   483,   188,   483,    -1,    -1,   685,   686,
     687,   688,    -1,   690,   198,   514,   200,    -1,    -1,    -1,
     697,    -1,    28,   110,   111,   209,    -1,   211,   705,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   654,    -1,    -1,   223,
     224,   225,    -1,   530,    46,    -1,    -1,    -1,    -1,    -1,
     234,   734,    -1,    -1,   141,    -1,    -1,    74,    75,   243,
      -1,   245,    79,   247,    -1,    71,    72,    -1,   252,    -1,
      72,    73,    -1,    75,   561,   259,   260,    79,    -1,    -1,
      74,    75,    -1,    -1,   761,    79,    -1,   551,   765,   685,
      -1,   768,   769,   110,   111,    -1,   102,   103,    -1,    -1,
     777,   697,    -1,    74,    75,   122,    -1,    -1,    79,   705,
      -1,    -1,    -1,    -1,    -1,   121,   110,   111,   124,    -1,
     304,   305,    -1,   587,    -1,   309,    -1,    -1,   312,   806,
     807,    -1,   809,   810,   318,   812,   813,    46,    -1,   110,
     111,   818,   597,    -1,   599,   600,   601,   118,    57,    -1,
     121,   122,    -1,   155,    -1,    -1,   774,    -1,   622,    -1,
     162,   625,    -1,    -1,    73,   761,    75,   844,    -1,   765,
     634,   635,   768,   175,    -1,   177,    -1,    86,    -1,    -1,
      -1,    -1,    91,   860,    93,    -1,   863,   864,   372,    44,
      45,   375,    -1,   377,    -1,   379,    -1,   199,    -1,   686,
     687,   688,    -1,    -1,    -1,    -1,    -1,   209,   210,    -1,
     806,   807,    -1,   809,    -1,    -1,   812,    -1,    -1,    74,
      75,     3,    -1,   407,    79,   409,    -1,   411,   412,   413,
      -1,    -1,   416,    -1,   418,    -1,    -1,    -1,    -1,   423,
      -1,   243,    -1,   245,    -1,    -1,   155,    -1,   844,    -1,
     252,    -1,   436,    -1,    -1,   110,   111,    -1,   167,    -1,
      -1,     3,    -1,   118,   860,    -1,   175,   863,    -1,   178,
     179,   735,    -1,    -1,   183,   739,    -1,    -1,    -1,    -1,
      -1,   465,    -1,    -1,     3,    -1,   470,    -1,    -1,   198,
     199,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,   483,
     209,    -1,   211,   305,   306,    -1,    -1,    -1,   772,    -1,
     219,    -1,    -1,    -1,   223,   224,   225,    -1,    -1,   783,
      -1,    -1,    -1,   810,    -1,    -1,   813,    -1,   110,   111,
     514,    -1,    74,    75,   243,    -1,   245,    79,    46,   121,
      -1,    -1,    -1,   252,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   537,   538,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,   365,    72,    -1,    -1,    -1,   110,   111,
      -1,    -1,   374,   375,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,    -1,   567,   386,    -1,   570,   571,   390,    -1,
      -1,   110,   111,    -1,    -1,    -1,   305,    -1,   582,   118,
      -1,    46,   121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,    46,   321,   597,    -1,   599,   600,   601,    -1,   138,
      -1,   423,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    -1,    -1,   436,    -1,   438,   621,    -1,    -1,
     624,   443,    -1,    -1,    -1,    -1,    -1,   155,    -1,   451,
      -1,    -1,    -1,    -1,   162,    -1,   365,    -1,    -1,    -1,
      -1,   370,    -1,   372,    -1,    -1,   375,    -1,   470,    -1,
      -1,    -1,    -1,   118,    -1,    -1,    -1,   386,    -1,    -1,
      -1,    -1,    -1,   118,    46,    -1,    -1,   396,    -1,   197,
      -1,    -1,    -1,   677,   203,   204,   205,   206,   407,    -1,
     409,   209,   411,   412,   413,    -1,    -1,   416,    -1,   418,
     155,    -1,   514,    -1,   423,    -1,    -1,    -1,    -1,    -1,
     155,   705,    -1,    -1,    -1,    -1,   234,   436,    -1,    -1,
      -1,    -1,    -1,    -1,   443,   243,   244,   245,   246,   247,
      -1,    -1,   451,   139,   252,    -1,   548,    -1,    -1,    -1,
     734,   259,   260,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   470,    -1,    -1,   209,   567,    46,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   209,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   585,    -1,    -1,    -1,    -1,    -1,   234,
     774,    -1,    -1,   155,    -1,    -1,    -1,    -1,   243,   234,
     245,    -1,   247,    -1,    -1,   514,    -1,   252,   243,   244,
     245,   246,   247,    -1,   259,   260,    -1,   252,    -1,    -1,
      -1,    -1,    -1,    -1,   259,   260,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   197,    -1,    -1,   118,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   209,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   365,   567,    -1,
      -1,    -1,    -1,    -1,   372,    -1,   374,   375,    -1,   377,
      -1,   379,    -1,    -1,    -1,   155,   585,    -1,    -1,    -1,
      -1,   243,   244,   245,   246,    -1,    -1,    -1,   597,    -1,
     599,   600,   601,    -1,    -1,    -1,    -1,   259,   260,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   713,    -1,    -1,    -1,   423,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   372,    -1,   209,
     375,    -1,   377,    -1,   379,   443,    -1,   372,    -1,    -1,
     375,    -1,   377,   451,   379,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   234,    -1,    -1,   465,    -1,    -1,
      -1,    -1,   470,   243,   244,   245,   246,   247,    -1,   478,
      -1,    -1,   252,   775,    -1,   483,    -1,    -1,   423,   259,
     260,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   423,    -1,
      74,    -1,    -1,    -1,   703,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   365,    -1,    -1,   514,   716,   443,    -1,
     372,    -1,    -1,    -1,    98,   377,   451,   379,    -1,    -1,
     465,    -1,    -1,    -1,    -1,   470,    -1,    -1,   112,    -1,
     465,   115,    -1,    -1,    -1,   470,    -1,    -1,   483,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   483,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   567,
      -1,    -1,   570,   571,    -1,    -1,   775,    -1,    -1,   514,
      -1,    -1,    -1,    -1,   582,    -1,    -1,    -1,    -1,   514,
      -1,   443,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   451,
      -1,    -1,   372,    -1,    -1,   375,    -1,   377,    -1,   379,
      -1,   185,    -1,   465,   188,    -1,    -1,    -1,   470,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   483,   567,    -1,    -1,   570,   571,    -1,    -1,    -1,
      -1,    -1,   567,    -1,    -1,   570,   571,   582,    -1,    -1,
      -1,    -1,    -1,   423,    -1,   229,    -1,   582,    -1,    -1,
      -1,     1,   514,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,   443,    -1,   674,   675,    -1,    -1,    -1,
      -1,   451,    -1,    -1,    -1,   259,   260,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,   465,    -1,    -1,    -1,    -1,
     470,    -1,    -1,    -1,    -1,    -1,    -1,   705,    -1,    -1,
      -1,    -1,    -1,   483,    -1,   567,    -1,    -1,   570,   571,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     582,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   514,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   754,   755,    -1,   757,   758,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     705,    -1,    -1,    -1,    -1,    -1,   774,    -1,   118,    -1,
     705,   121,    -1,   123,   124,    -1,    -1,   127,    -1,   129,
     130,   131,   132,    -1,   793,    -1,   795,   567,    -1,    -1,
     570,   571,    -1,   802,   803,    -1,    -1,    -1,    -1,    -1,
      -1,   385,   582,   387,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     829,    -1,   831,    -1,   833,    -1,   835,    -1,    -1,   774,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   774,
      -1,    -1,    -1,   705,    -1,    -1,    -1,   856,    -1,   858,
      -1,    -1,    -1,   437,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   449,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   465,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   483,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   774,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   705,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,   551,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,   774,    -1,    -1,    -1,   582,    -1,
      -1,    -1,   100,   587,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,    -1,    -1,    -1,   622,    -1,
      -1,   625,   140,   141,   142,    -1,    -1,    -1,    -1,    -1,
     634,   635,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     644,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     654,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   665,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,   735,    -1,    -1,    -1,   739,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,   772,    -1,
     774,    -1,   129,   130,   131,   132,    -1,    -1,    -1,   783,
      -1,    -1,    -1,   140,   141,   142,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    77,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,
      -1,    -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,   141,   142,     1,    -1,
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
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,   141,   142,
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
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
     141,   142,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,   141,   142,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,
      -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,   141,   142,     1,    -1,     3,     4,
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
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,
      -1,    -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,   141,   142,     1,    -1,
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
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
       1,    -1,     3,     4,     5,    -1,    -1,   140,   141,   142,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,    -1,   123,   124,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,    -1,   123,   124,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,    -1,   121,    -1,
     123,   124,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,   123,   124,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,    -1,   123,   124,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    28,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     141,   142,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    77,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,   141,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    28,    -1,    71,    72,
      73,   109,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     118,     8,     9,   121,    -1,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,   102,
     103,    28,   140,   141,    -1,    -1,   109,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,
     102,   103,    -1,    -1,    71,    72,    73,   109,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   118,     8,     9,   121,
     122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,   102,   103,    28,    -1,   141,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,   123,   124,    -1,    -1,
      -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
     141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    28,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
      -1,    -1,   121,    -1,   123,   124,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,   140,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,
     103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,
       6,    -1,     8,     9,    -1,   118,    -1,    -1,   121,   122,
     123,   124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,
      -1,    -1,    28,    -1,    -1,    -1,    -1,   140,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    71,    72,    73,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,
      -1,   121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,    -1,    -1,    -1,   102,   103,    -1,    -1,
     140,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,   118,    -1,    -1,   121,    -1,   123,   124,    -1,
      -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,     3,    -1,   121,    -1,
      -1,    -1,    -1,   126,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,     3,
     117,   118,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   138,    -1,   140,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,     3,   117,   118,    -1,    -1,   121,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,     1,
     121,     3,     4,     5,     6,   126,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
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
     132,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
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
     110,   111,   112,   113,    -1,    -1,    -1,    -1,   118,    -1,
      -1,   121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,
     130,   131,   132,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,    -1,
     118,    -1,    -1,   121,   122,   123,   124,    -1,    -1,    -1,
      -1,   129,   130,   131,   132,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    28,
      -1,    -1,   118,    -1,    -1,   121,   122,   123,   124,    -1,
      -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,    -1,    -1,    -1,    28,    -1,    -1,   118,
      -1,    -1,   121,   122,   123,   124,    71,    72,    73,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    -1,    -1,   109,    -1,    -1,     1,    -1,     3,
       4,     5,     6,   118,     8,     9,   121,    -1,   123,   124,
      -1,    -1,   127,    -1,   129,   130,   131,   132,    -1,    -1,
     102,   103,    -1,    -1,    28,    -1,    -1,   109,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   118,     8,     9,   121,
      -1,   123,   124,    -1,    -1,   127,    -1,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,
      71,    72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,   123,
     124,    -1,    -1,    -1,    -1,   129,   130,   131,   132,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,   118,    -1,    -1,
     121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,    28,
     121,   122,   123,   124,    -1,    -1,    -1,    -1,   129,   130,
     131,   132,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    71,    72,    73,    -1,    -1,
     109,    -1,    -1,     1,    -1,     3,     4,     5,     6,   118,
       8,     9,   121,    -1,   123,   124,    -1,    -1,    -1,    -1,
     129,   130,   131,   132,    -1,    -1,   102,   103,    -1,    -1,
      28,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,   123,   124,    -1,
      -1,    -1,    -1,   129,   130,   131,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
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
     144,   145,   146,   147,   148,   153,   185,   186,   191,   192,
     193,   197,   198,   199,   200,   202,   203,   209,   217,   218,
     236,   267,   141,   148,   153,   121,   121,   119,     1,   118,
     119,   153,   118,   121,   126,   129,   144,   153,   191,   192,
     199,   200,   202,   218,   221,   223,   225,   226,   228,   229,
     230,   233,   121,   141,   147,   148,   153,   192,   138,     0,
     153,   219,   220,   141,   141,     1,     4,     5,     6,     8,
       9,    71,    72,    73,   102,   103,   109,   118,   121,   123,
     124,   129,   130,   131,   132,   146,   153,   154,   155,   156,
     160,   161,   163,   164,   165,   166,   167,   168,   169,   170,
     171,   172,   173,   174,   175,   176,   177,   254,   257,   146,
     153,   146,   153,   161,   167,   185,   204,   205,   206,   207,
     208,   199,   232,   233,   122,   153,   223,   225,   234,   235,
     236,   127,   146,   176,   180,   121,   153,   192,   225,   233,
     221,   226,   229,   233,   121,   126,   192,   121,   126,   122,
     153,   234,   237,   192,   221,   230,   121,    68,    78,   121,
     123,   140,   142,   149,   150,   151,   152,   153,   156,   185,
     192,   210,   211,   212,   213,   214,   226,   227,   229,   233,
     256,   257,   259,   141,   141,   141,   148,   153,   180,   139,
     128,   142,   219,   219,   121,   155,   158,   160,   162,   121,
     161,   161,   153,   185,   180,   185,   180,   121,   162,   122,
     177,   179,   182,   199,   200,   202,   218,   238,   254,   141,
     141,     7,     8,     9,   121,   125,   126,   153,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,   139,   178,
     164,   118,   133,   134,   130,   131,    10,    11,   167,    12,
      13,   119,   120,    14,    15,   129,   135,   136,    16,    17,
     137,   122,   122,   122,   139,   121,   192,   223,   233,   139,
      11,   120,   128,   199,   233,   122,   122,   122,   128,   127,
     127,   233,   221,   230,   122,   234,   127,   146,   180,   127,
     146,   180,   122,   122,   128,     3,    28,    44,    74,    75,
     122,   194,   195,   196,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    50,    66,    85,    87,
     100,   112,   113,   148,   153,   187,   191,   199,   201,   203,
     209,   217,   185,   227,   118,   121,   153,   185,   141,   248,
     249,   249,   249,   140,   249,   139,   121,   138,   140,   153,
     192,   215,   216,   226,   227,   231,   233,   229,   233,   142,
     214,   128,   140,   192,   229,   140,   140,   210,   142,   210,
     142,   210,   141,   141,   180,   220,   140,   142,   140,   142,
     144,   153,   161,   183,   199,   200,   202,   218,   239,     7,
       8,     9,   121,   125,   126,   153,   121,   126,   192,   222,
     224,   233,   153,   188,   191,   199,   201,   202,   218,   126,
     224,   188,   161,   239,   122,   128,   153,   199,   200,   202,
     218,   223,   122,   125,   140,   141,   142,   156,   157,   176,
     184,   191,   199,   200,   202,   218,   241,   258,   260,   261,
     262,   263,   264,   265,   266,   142,   266,   153,   122,   157,
     159,   177,   153,   179,   157,   177,   164,   164,   164,   165,
     165,   166,   166,   167,   167,   167,   169,   169,   170,   171,
     172,   173,   174,   179,   185,   205,   206,   233,   205,   206,
     207,    51,   236,   122,   127,   127,   127,   127,   153,   122,
     121,   122,   128,   195,   148,   153,   121,   121,   119,   141,
     153,   191,   199,   201,   223,   153,   192,   227,   192,   121,
     142,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    77,   140,   153,   179,   181,   184,   243,   244,
     245,   246,   247,   249,   250,   251,   252,   253,   255,   241,
     122,   180,   141,   226,   233,   128,   140,   138,   197,   192,
     226,   229,   211,   229,   142,   142,   142,   210,   142,   210,
     210,   210,   122,   144,   199,   200,   202,   218,   223,   122,
     153,   122,   159,   153,   179,   122,   224,   234,   180,   222,
     233,   121,   126,   222,   119,   126,   153,   191,   199,   201,
     202,   218,   224,   180,   126,   126,   224,   122,   122,   177,
     164,   254,   142,   266,   139,   153,   191,   199,   200,   202,
     218,   227,   231,   249,   128,   140,   140,   261,   263,   264,
     142,   142,   122,   128,   127,   138,   223,   179,   122,   195,
     177,   146,   153,   208,    69,    70,   142,   119,   141,   141,
     153,   148,   153,   122,   180,   138,   121,   121,   121,   243,
     121,   153,   140,   140,   140,   179,   153,   138,   140,   140,
     153,   189,   190,   225,   181,   246,   181,   243,   142,   140,
     142,   266,   226,   192,   216,   226,   233,   180,   226,   142,
     142,   142,   142,   122,   127,   122,   122,   127,   222,   122,
     234,   180,   208,   180,   119,   126,   127,   180,   180,   126,
     142,   241,   262,   157,   177,   176,   122,   122,   122,   122,
     120,   249,   249,   208,    69,    70,   142,    69,    70,   142,
     141,   138,   243,   179,   179,   122,   179,    56,   122,   250,
     140,   140,   139,   243,   141,   128,   140,   139,   142,   226,
     233,   192,   226,   138,   122,   127,   120,   127,   208,   180,
     127,   127,   180,    70,   142,    69,   142,   120,   249,   249,
     249,   249,    69,    70,   142,   243,   122,   122,   243,   122,
     121,   243,   122,   250,   180,   142,   266,   190,   141,   177,
     240,   226,   226,   180,   120,   127,   127,   249,   249,    70,
     142,    69,   142,    70,   142,    69,   142,   249,   249,   243,
     243,   243,   179,   243,   122,   179,   140,   142,   240,   242,
     142,   142,   249,   249,   249,   249,    70,   142,    69,   142,
      64,   122,   243,   122,   128,   142,   142,   142,   142,   142,
     249,   249,   243,   140,   243,   142,   240,   142,   142
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
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3807 "type.ec"
	break;
      case 146: /* "type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3816 "type.ec"
	break;
      case 147: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3825 "type.ec"
	break;
      case 148: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3834 "type.ec"
	break;
      case 149: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3843 "type.ec"
	break;
      case 150: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3852 "type.ec"
	break;
      case 151: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3861 "type.ec"
	break;
      case 152: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3870 "type.ec"
	break;
      case 153: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3879 "type.ec"
	break;
      case 154: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3888 "type.ec"
	break;
      case 156: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3897 "type.ec"
	break;
      case 159: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3906 "type.ec"
	break;
      case 161: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3915 "type.ec"
	break;
      case 164: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3924 "type.ec"
	break;
      case 165: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3933 "type.ec"
	break;
      case 166: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3942 "type.ec"
	break;
      case 167: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3951 "type.ec"
	break;
      case 169: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3960 "type.ec"
	break;
      case 170: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3969 "type.ec"
	break;
      case 171: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3978 "type.ec"
	break;
      case 172: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3987 "type.ec"
	break;
      case 173: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3996 "type.ec"
	break;
      case 174: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4005 "type.ec"
	break;
      case 175: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4014 "type.ec"
	break;
      case 176: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4023 "type.ec"
	break;
      case 177: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4032 "type.ec"
	break;
      case 179: /* "expression" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 4041 "type.ec"
	break;
      case 180: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4050 "type.ec"
	break;
      case 181: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4059 "type.ec"
	break;
      case 182: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4068 "type.ec"
	break;
      case 183: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4077 "type.ec"
	break;
      case 184: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4086 "type.ec"
	break;
      case 185: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4095 "type.ec"
	break;
      case 189: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4104 "type.ec"
	break;
      case 190: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4113 "type.ec"
	break;
      case 191: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4122 "type.ec"
	break;
      case 192: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4131 "type.ec"
	break;
      case 194: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4140 "type.ec"
	break;
      case 195: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4149 "type.ec"
	break;
      case 196: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4158 "type.ec"
	break;
      case 197: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4167 "type.ec"
	break;
      case 198: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4176 "type.ec"
	break;
      case 199: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4185 "type.ec"
	break;
      case 200: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4194 "type.ec"
	break;
      case 201: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4203 "type.ec"
	break;
      case 202: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4212 "type.ec"
	break;
      case 203: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4221 "type.ec"
	break;
      case 204: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4230 "type.ec"
	break;
      case 205: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4239 "type.ec"
	break;
      case 206: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4248 "type.ec"
	break;
      case 207: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4257 "type.ec"
	break;
      case 210: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4266 "type.ec"
	break;
      case 211: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4275 "type.ec"
	break;
      case 212: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4284 "type.ec"
	break;
      case 213: /* "property" */

/* Line 1009 of yacc.c  */
#line 198 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4293 "type.ec"
	break;
      case 214: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4302 "type.ec"
	break;
      case 215: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4311 "type.ec"
	break;
      case 216: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4320 "type.ec"
	break;
      case 217: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4329 "type.ec"
	break;
      case 218: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4338 "type.ec"
	break;
      case 219: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4347 "type.ec"
	break;
      case 220: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4356 "type.ec"
	break;
      case 221: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4365 "type.ec"
	break;
      case 222: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4374 "type.ec"
	break;
      case 223: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4383 "type.ec"
	break;
      case 224: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4392 "type.ec"
	break;
      case 225: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4401 "type.ec"
	break;
      case 226: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4410 "type.ec"
	break;
      case 227: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4419 "type.ec"
	break;
      case 228: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4428 "type.ec"
	break;
      case 229: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4437 "type.ec"
	break;
      case 230: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4446 "type.ec"
	break;
      case 231: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4455 "type.ec"
	break;
      case 232: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4464 "type.ec"
	break;
      case 233: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4473 "type.ec"
	break;
      case 234: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4482 "type.ec"
	break;
      case 235: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4491 "type.ec"
	break;
      case 236: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4500 "type.ec"
	break;
      case 237: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4509 "type.ec"
	break;
      case 238: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4518 "type.ec"
	break;
      case 239: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4527 "type.ec"
	break;
      case 240: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4536 "type.ec"
	break;
      case 241: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4545 "type.ec"
	break;
      case 242: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4554 "type.ec"
	break;
      case 243: /* "statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4563 "type.ec"
	break;
      case 244: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4572 "type.ec"
	break;
      case 245: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4581 "type.ec"
	break;
      case 246: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4590 "type.ec"
	break;
      case 247: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4599 "type.ec"
	break;
      case 248: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4608 "type.ec"
	break;
      case 249: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4617 "type.ec"
	break;
      case 250: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4626 "type.ec"
	break;
      case 251: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4635 "type.ec"
	break;
      case 252: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4644 "type.ec"
	break;
      case 253: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4653 "type.ec"
	break;
      case 254: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4662 "type.ec"
	break;
      case 255: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4671 "type.ec"
	break;
      case 257: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4680 "type.ec"
	break;
      case 259: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4689 "type.ec"
	break;
      case 260: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4698 "type.ec"
	break;
      case 261: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4707 "type.ec"
	break;
      case 262: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4716 "type.ec"
	break;
      case 263: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4725 "type.ec"
	break;
      case 264: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4734 "type.ec"
	break;
      case 265: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4743 "type.ec"
	break;
      case 266: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4752 "type.ec"
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
#line 445 "type.y"
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
#line 457 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 458 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 459 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 463 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 469 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 470 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 471 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 472 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 474 "type.y"
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

  case 52:

/* Line 1464 of yacc.c  */
#line 486 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 487 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 488 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 492 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 493 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 494 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 499 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 500 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 501 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 502 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 503 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 504 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 505 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 506 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 507 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 521 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 522 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 526 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 527 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 532 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 537 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 538 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 544 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 545 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 550 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 556 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 564 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 565 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 566 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 572 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 573 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 578 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 583 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 588 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 593 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 598 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 603 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 608 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 609 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 613 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 614 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 615 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 616 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 627 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 636 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 637 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 638 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 639 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 667 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 680 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 681 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 682 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 683 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 684 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 685 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 695 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 696 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 700 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 701 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 702 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 703 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 704 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 705 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 706 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 707 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 709 "type.y"
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

  case 184:

/* Line 1464 of yacc.c  */
#line 727 "type.y"
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

  case 185:

/* Line 1464 of yacc.c  */
#line 743 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 744 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 745 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 746 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 747 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 749 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 750 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 751 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 752 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 754 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 756 "type.y"
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

  case 198:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
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

  case 199:

/* Line 1464 of yacc.c  */
#line 790 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 791 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 795 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 800 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 801 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 803 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 804 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 805 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 811 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 877 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 879 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 884 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 889 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 898 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 902 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 903 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 904 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 905 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 910 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 911 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 913 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 915 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 917 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 918 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 919 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 920 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 922 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 926 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 928 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 931 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 933 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 937 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 938 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 943 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 944 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 955 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 962 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 964 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 966 "type.y"
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

  case 301:

/* Line 1464 of yacc.c  */
#line 990 "type.y"
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

  case 302:

/* Line 1464 of yacc.c  */
#line 1004 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1010 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1015 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1019 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1031 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1033 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1040 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1042 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1044 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1046 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1048 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1055 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1057 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1062 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1064 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1066 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1075 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1076 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1078 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1081 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1086 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1088 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1106 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1111 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1113 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1115 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1127 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1137 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1139 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1141 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1143 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1151 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1153 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1155 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1160 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1162 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1164 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1166 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1168 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1172 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1174 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1175 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1176 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1177 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1181 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1183 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1185 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1234 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1236 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1238 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1249 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1257 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1262 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1274 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1276 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1278 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1287 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1292 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1293 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1294 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1295 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1299 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1300 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1304 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1305 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1306 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1307 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1312 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1316 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1317 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1321 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1322 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1337 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1361 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1362 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1366 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1367 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1371 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1372 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1377 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1379 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1381 "type.y"
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

  case 437:

/* Line 1464 of yacc.c  */
#line 1397 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1399 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1421 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1423 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1437 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1441 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1446 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1458 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1459 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1464 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1469 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1477 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1481 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1482 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1486 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1487 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1488 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1492 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1493 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1494 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1495 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1497 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1498 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1499 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1503 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1505 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1506 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1507 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1511 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1516 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1518 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1550 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1552 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1554 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1567 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1573 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1575 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1581 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1583 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1588 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1592 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1593 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1598 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1600 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1605 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1609 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1610 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1611 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 505:

/* Line 1464 of yacc.c  */
#line 1612 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 506:

/* Line 1464 of yacc.c  */
#line 1613 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 507:

/* Line 1464 of yacc.c  */
#line 1614 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 509:

/* Line 1464 of yacc.c  */
#line 1619 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 510:

/* Line 1464 of yacc.c  */
#line 1620 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 511:

/* Line 1464 of yacc.c  */
#line 1624 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 512:

/* Line 1464 of yacc.c  */
#line 1625 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8547 "type.ec"
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
#line 1628 "type.y"


