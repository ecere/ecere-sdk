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

#define YYSIZE_T size_t
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
#line 110 "type.ec"

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
     INT128 = 294,
     FLOAT128 = 295,
     LONG = 296,
     SIGNED = 297,
     UNSIGNED = 298,
     FLOAT = 299,
     DOUBLE = 300,
     CONST = 301,
     VOLATILE = 302,
     VOID = 303,
     VALIST = 304,
     STRUCT = 305,
     UNION = 306,
     ENUM = 307,
     ELLIPSIS = 308,
     CASE = 309,
     DEFAULT = 310,
     IF = 311,
     SWITCH = 312,
     WHILE = 313,
     DO = 314,
     FOR = 315,
     GOTO = 316,
     CONTINUE = 317,
     BREAK = 318,
     RETURN = 319,
     IFX = 320,
     ELSE = 321,
     CLASS = 322,
     THISCLASS = 323,
     PROPERTY = 324,
     SETPROP = 325,
     GETPROP = 326,
     NEWOP = 327,
     RENEW = 328,
     DELETE = 329,
     EXT_DECL = 330,
     EXT_STORAGE = 331,
     IMPORT = 332,
     DEFINE = 333,
     VIRTUAL = 334,
     ATTRIB = 335,
     PUBLIC = 336,
     PRIVATE = 337,
     TYPED_OBJECT = 338,
     ANY_OBJECT = 339,
     _INCREF = 340,
     EXTENSION = 341,
     ASM = 342,
     TYPEOF = 343,
     WATCH = 344,
     STOPWATCHING = 345,
     FIREWATCHERS = 346,
     WATCHABLE = 347,
     CLASS_DESIGNER = 348,
     CLASS_NO_EXPANSION = 349,
     CLASS_FIXED = 350,
     ISPROPSET = 351,
     CLASS_DEFAULT_PROPERTY = 352,
     PROPERTY_CATEGORY = 353,
     CLASS_DATA = 354,
     CLASS_PROPERTY = 355,
     SUBCLASS = 356,
     NAMESPACE = 357,
     NEW0OP = 358,
     RENEW0 = 359,
     VAARG = 360,
     DBTABLE = 361,
     DBFIELD = 362,
     DBINDEX = 363,
     DATABASE_OPEN = 364,
     ALIGNOF = 365,
     ATTRIB_DEP = 366,
     __ATTRIB = 367,
     BOOL = 368,
     _BOOL = 369,
     _COMPLEX = 370,
     _IMAGINARY = 371,
     RESTRICT = 372,
     THREAD = 373,
     WIDE_STRING_LITERAL = 374,
     BUILTIN_OFFSETOF = 375
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 40 "type.y"

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
#line 304 "type.ec"
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
#line 329 "type.ec"

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
#define YYFINAL  101
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9267

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  146
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  504
/* YYNRULES -- Number of states.  */
#define YYNSTATES  863

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   375

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   135,     2,     2,   127,   137,   132,     2,
     124,   125,   121,   133,   131,   134,   128,   136,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   141,   143,
     122,   142,   123,   140,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   129,     2,   130,   138,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   144,   139,   145,   126,     2,     2,     2,
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
     115,   116,   117,   118,   119,   120
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    12,    14,    17,    19,    21,
      26,    31,    34,    36,    40,    45,    49,    52,    54,    56,
      60,    62,    64,    66,    68,    70,    73,    78,    81,    88,
      94,   101,   107,   115,   122,   130,   137,   139,   141,   146,
     150,   155,   159,   162,   166,   169,   172,   174,   176,   178,
     182,   186,   189,   192,   195,   198,   203,   206,   211,   213,
     215,   217,   219,   221,   223,   225,   227,   229,   231,   236,
     238,   242,   246,   250,   252,   256,   260,   262,   266,   270,
     273,   275,   278,   282,   286,   290,   292,   296,   300,   302,
     306,   308,   312,   314,   318,   320,   324,   326,   330,   332,
     338,   340,   344,   348,   350,   352,   354,   356,   358,   360,
     362,   364,   366,   368,   370,   372,   376,   378,   381,   385,
     388,   394,   396,   399,   401,   404,   406,   409,   411,   414,
     416,   419,   421,   424,   426,   429,   431,   434,   436,   439,
     441,   444,   446,   449,   451,   454,   456,   459,   461,   464,
     466,   469,   471,   474,   476,   479,   481,   484,   486,   489,
     491,   494,   496,   498,   500,   503,   505,   508,   510,   513,
     515,   518,   523,   529,   531,   534,   536,   539,   541,   544,
     546,   549,   551,   554,   556,   559,   564,   570,   572,   576,
     578,   582,   584,   586,   588,   590,   592,   594,   596,   598,
     600,   602,   604,   606,   608,   610,   612,   614,   616,   618,
     623,   625,   628,   632,   639,   645,   647,   649,   651,   653,
     655,   657,   659,   661,   663,   665,   667,   669,   671,   673,
     675,   677,   679,   681,   683,   685,   687,   689,   691,   693,
     698,   703,   708,   710,   712,   714,   716,   718,   720,   722,
     724,   726,   728,   730,   732,   734,   736,   738,   740,   742,
     744,   746,   748,   750,   752,   754,   759,   764,   769,   771,
     777,   782,   787,   791,   797,   804,   810,   816,   821,   828,
     831,   834,   838,   842,   844,   847,   849,   852,   854,   856,
     858,   862,   866,   870,   874,   876,   880,   882,   884,   886,
     889,   893,   895,   899,   909,   919,   927,   935,   941,   952,
     963,   972,   981,   988,   997,  1006,  1013,  1020,  1025,  1035,
    1045,  1053,  1061,  1067,  1071,  1074,  1077,  1080,  1082,  1085,
    1087,  1089,  1091,  1095,  1097,  1100,  1103,  1107,  1113,  1116,
    1119,  1124,  1130,  1138,  1146,  1152,  1154,  1158,  1160,  1164,
    1168,  1171,  1175,  1179,  1183,  1188,  1193,  1196,  1200,  1204,
    1209,  1213,  1216,  1220,  1224,  1229,  1231,  1233,  1236,  1239,
    1242,  1246,  1248,  1250,  1253,  1256,  1259,  1263,  1265,  1268,
    1272,  1275,  1277,  1281,  1286,  1290,  1295,  1297,  1300,  1303,
    1307,  1311,  1314,  1318,  1322,  1325,  1327,  1329,  1332,  1335,
    1337,  1340,  1343,  1347,  1351,  1353,  1356,  1358,  1361,  1364,
    1368,  1370,  1374,  1376,  1380,  1383,  1386,  1389,  1393,  1395,
    1397,  1399,  1403,  1405,  1408,  1410,  1413,  1415,  1419,  1424,
    1426,  1428,  1430,  1434,  1436,  1438,  1440,  1442,  1444,  1446,
    1450,  1455,  1459,  1461,  1464,  1466,  1469,  1472,  1474,  1476,
    1479,  1481,  1484,  1488,  1490,  1493,  1499,  1507,  1513,  1519,
    1527,  1534,  1542,  1547,  1553,  1558,  1562,  1565,  1568,  1571,
    1575,  1577,  1583,  1588,  1594,  1599,  1604,  1608,  1613,  1617,
    1621,  1624,  1627,  1630,  1633,  1636,  1639,  1642,  1645,  1648,
    1652,  1654,  1656,  1660,  1663,  1665,  1667,  1670,  1673,  1675,
    1678,  1680,  1682,  1685,  1687
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     268,     0,    -1,   156,   121,    -1,   156,   122,    -1,   156,
       1,    -1,   151,    -1,   156,   156,    -1,    28,    -1,   150,
      -1,   150,   122,   209,   123,    -1,   150,   122,   209,    11,
      -1,   186,   228,    -1,   228,    -1,   186,   124,   125,    -1,
     126,   186,   124,   125,    -1,    79,   186,   228,    -1,    79,
     228,    -1,     3,    -1,   158,    -1,   124,   180,   125,    -1,
     156,    -1,   258,    -1,     4,    -1,   119,    -1,   255,    -1,
     127,   255,    -1,   127,   255,   128,   255,    -1,   124,   125,
      -1,    72,   186,   225,   129,   181,   130,    -1,    72,   186,
     129,   181,   130,    -1,   103,   186,   225,   129,   181,   130,
      -1,   103,   186,   129,   181,   130,    -1,    73,   181,   189,
     225,   129,   181,   130,    -1,    73,   181,   189,   129,   181,
     130,    -1,   104,   181,   189,   225,   129,   181,   130,    -1,
     104,   181,   189,   129,   181,   130,    -1,     1,    -1,   157,
      -1,   159,   129,   180,   130,    -1,   159,   124,   125,    -1,
     159,   124,   161,   125,    -1,   159,   128,   156,    -1,   159,
     156,    -1,   159,     7,   156,    -1,   159,     8,    -1,   159,
       9,    -1,   259,    -1,   178,    -1,   160,    -1,   161,   131,
     178,    -1,   161,   131,   160,    -1,     8,   163,    -1,     9,
     163,    -1,   164,   165,    -1,     6,   163,    -1,     6,   124,
     240,   125,    -1,   110,   163,    -1,   110,   124,   240,   125,
      -1,   162,    -1,   159,    -1,   132,    -1,   121,    -1,   133,
      -1,   134,    -1,   126,    -1,   135,    -1,    74,    -1,   163,
      -1,   124,   239,   125,   165,    -1,   165,    -1,   166,   121,
     165,    -1,   166,   136,   165,    -1,   166,   137,   165,    -1,
     166,    -1,   167,   133,   166,    -1,   167,   134,   166,    -1,
     167,    -1,   168,    10,   167,    -1,   168,    11,   167,    -1,
     170,   122,    -1,   168,    -1,   169,   168,    -1,   170,   123,
     168,    -1,   170,    12,   168,    -1,   170,    13,   168,    -1,
     170,    -1,   171,    14,   170,    -1,   171,    15,   170,    -1,
     171,    -1,   172,   132,   171,    -1,   172,    -1,   173,   138,
     172,    -1,   173,    -1,   174,   139,   173,    -1,   174,    -1,
     175,    16,   174,    -1,   175,    -1,   176,    17,   175,    -1,
     176,    -1,   176,   140,   180,   141,   177,    -1,   177,    -1,
     163,   179,   178,    -1,   163,   179,   160,    -1,   142,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     178,    -1,   180,   131,   178,    -1,   177,    -1,   185,   143,
      -1,   185,   190,   143,    -1,   256,   143,    -1,    78,   156,
     142,   181,   143,    -1,   200,    -1,   183,   200,    -1,   201,
      -1,   183,   201,    -1,   219,    -1,   183,   219,    -1,   203,
      -1,   183,   203,    -1,   200,    -1,   184,   200,    -1,   201,
      -1,   184,   201,    -1,   147,    -1,   184,   147,    -1,   219,
      -1,   184,   219,    -1,   203,    -1,   184,   203,    -1,   192,
      -1,   185,   192,    -1,   200,    -1,   185,   200,    -1,   201,
      -1,   185,   201,    -1,   219,    -1,   185,   219,    -1,   203,
      -1,   185,   203,    -1,   192,    -1,   186,   192,    -1,   200,
      -1,   186,   200,    -1,   201,    -1,   186,   201,    -1,   147,
      -1,   186,   147,    -1,   203,    -1,   186,   203,    -1,   219,
      -1,   186,   219,    -1,   186,    -1,   148,    -1,   192,    -1,
     188,   192,    -1,   200,    -1,   188,   200,    -1,   202,    -1,
     188,   202,    -1,   156,    -1,   188,   156,    -1,   156,   122,
     209,   123,    -1,   188,   156,   122,   209,   123,    -1,   192,
      -1,   189,   192,    -1,   200,    -1,   189,   200,    -1,   202,
      -1,   189,   202,    -1,   203,    -1,   189,   203,    -1,   219,
      -1,   189,   219,    -1,   156,    -1,   189,   156,    -1,   156,
     122,   209,   123,    -1,   189,   156,   122,   209,   123,    -1,
     191,    -1,   190,   131,   191,    -1,   226,    -1,   226,   142,
     241,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   118,    -1,    75,    -1,    76,    -1,   198,    -1,
      80,    -1,   111,    -1,   112,    -1,     3,    -1,    28,    -1,
      76,    -1,    75,    -1,    46,    -1,   195,    -1,   195,   124,
     180,   125,    -1,   196,    -1,   197,   196,    -1,   197,   131,
     196,    -1,   194,   124,   124,   197,   125,   125,    -1,   194,
     124,   124,   125,   125,    -1,   193,    -1,    46,    -1,    47,
      -1,   199,    -1,    48,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    39,    -1,    40,    -1,    49,
      -1,    41,    -1,    44,    -1,    45,    -1,    42,    -1,    43,
      -1,    86,    -1,   114,    -1,   113,    -1,   204,    -1,   218,
      -1,   149,    -1,    88,   124,   178,   125,    -1,   101,   124,
     149,   125,    -1,   101,   124,   156,   125,    -1,    68,    -1,
      83,    -1,    84,    -1,    48,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    39,    -1,    40,    -1,
      49,    -1,    41,    -1,    44,    -1,    45,    -1,    42,    -1,
      43,    -1,    86,    -1,   114,    -1,   113,    -1,   204,    -1,
     218,    -1,   151,    -1,    88,   124,   178,   125,    -1,   101,
     124,   149,   125,    -1,   101,   124,   156,   125,    -1,    68,
      -1,   210,   156,   144,   211,   145,    -1,   210,   144,   211,
     145,    -1,   210,   156,   144,   145,    -1,   210,   144,   145,
      -1,   210,   150,   144,   211,   145,    -1,   210,   193,   156,
     144,   211,   145,    -1,   210,   193,   144,   211,   145,    -1,
     210,   193,   156,   144,   145,    -1,   210,   193,   144,   145,
      -1,   210,   193,   151,   144,   211,   145,    -1,   210,   156,
      -1,   210,   151,    -1,   210,   193,   156,    -1,   210,   193,
     151,    -1,   186,    -1,   186,   224,    -1,   186,    -1,   186,
     224,    -1,   168,    -1,   207,    -1,   206,    -1,   156,   142,
     207,    -1,   156,   142,   206,    -1,   205,   142,   207,    -1,
     205,   142,   206,    -1,   208,    -1,   209,   131,   208,    -1,
      50,    -1,    51,    -1,   215,    -1,   211,   215,    -1,   159,
     142,   242,    -1,   212,    -1,   213,   131,   212,    -1,    69,
     188,   156,   144,    70,   250,    71,   250,   145,    -1,    69,
     188,   156,   144,    71,   250,    70,   250,   145,    -1,    69,
     188,   156,   144,    70,   250,   145,    -1,    69,   188,   156,
     144,    71,   250,   145,    -1,    69,   188,   156,   144,   145,
      -1,    69,   188,   224,   156,   144,    70,   250,    71,   250,
     145,    -1,    69,   188,   224,   156,   144,    71,   250,    70,
     250,   145,    -1,    69,   188,   224,   156,   144,    70,   250,
     145,    -1,    69,   188,   224,   156,   144,    71,   250,   145,
      -1,    69,   188,   224,   156,   144,   145,    -1,    69,   188,
     144,    70,   250,    71,   250,   145,    -1,    69,   188,   144,
      71,   250,    70,   250,   145,    -1,    69,   188,   144,    70,
     250,   145,    -1,    69,   188,   144,    71,   250,   145,    -1,
      69,   188,   144,   145,    -1,    69,   188,   224,   144,    70,
     250,    71,   250,   145,    -1,    69,   188,   224,   144,    71,
     250,    70,   250,   145,    -1,    69,   188,   224,   144,    70,
     250,   145,    -1,    69,   188,   224,   144,    71,   250,   145,
      -1,    69,   188,   224,   144,   145,    -1,   186,   216,   143,
      -1,   186,   143,    -1,   258,   143,    -1,   257,   143,    -1,
     260,    -1,   213,   143,    -1,   214,    -1,   143,    -1,   217,
      -1,   216,   131,   217,    -1,   232,    -1,   232,   198,    -1,
     141,   181,    -1,   232,   141,   181,    -1,   232,   141,   181,
     141,   181,    -1,    52,   156,    -1,    52,   151,    -1,    52,
     144,   220,   145,    -1,    52,   156,   144,   220,   145,    -1,
      52,   156,   144,   220,   143,   211,   145,    -1,    52,   151,
     144,   220,   143,   211,   145,    -1,    52,   151,   144,   220,
     145,    -1,   221,    -1,   220,   131,   221,    -1,   156,    -1,
     156,   142,   181,    -1,   124,   224,   125,    -1,   129,   130,
      -1,   129,   181,   130,    -1,   129,   149,   130,    -1,   222,
     129,   130,    -1,   222,   129,   181,   130,    -1,   222,   129,
     149,   130,    -1,   124,   125,    -1,   124,   235,   125,    -1,
     222,   124,   125,    -1,   222,   124,   235,   125,    -1,   124,
     225,   125,    -1,   124,   125,    -1,   124,   235,   125,    -1,
     223,   124,   125,    -1,   223,   124,   235,   125,    -1,   234,
      -1,   222,    -1,   234,   222,    -1,   193,   234,    -1,   193,
     222,    -1,   193,   234,   222,    -1,   234,    -1,   223,    -1,
     234,   223,    -1,   193,   234,    -1,   193,   223,    -1,   193,
     234,   223,    -1,   231,    -1,   234,   231,    -1,   193,   234,
     231,    -1,   226,   193,    -1,   156,    -1,   124,   226,   125,
      -1,   227,   129,   181,   130,    -1,   227,   129,   130,    -1,
     227,   129,   149,   130,    -1,   230,    -1,   234,   230,    -1,
     193,   230,    -1,   193,   234,   230,    -1,   234,   193,   230,
      -1,   227,   124,    -1,   229,   235,   125,    -1,   229,   238,
     125,    -1,   229,   125,    -1,   230,    -1,   227,    -1,   193,
     230,    -1,   193,   227,    -1,   227,    -1,   234,   227,    -1,
     193,   227,    -1,   193,   234,   227,    -1,   234,   193,   227,
      -1,   200,    -1,   233,   200,    -1,   121,    -1,   121,   233,
      -1,   121,   234,    -1,   121,   233,   234,    -1,   236,    -1,
     236,   131,    53,    -1,   237,    -1,   236,   131,   237,    -1,
     186,   226,    -1,   186,   224,    -1,   186,   132,    -1,   186,
     132,   226,    -1,   187,    -1,    67,    -1,   156,    -1,   238,
     131,   156,    -1,   183,    -1,   183,   224,    -1,   184,    -1,
     184,   224,    -1,   178,    -1,   144,   243,   145,    -1,   144,
     243,   131,   145,    -1,   177,    -1,   160,    -1,   241,    -1,
     243,   131,   241,    -1,   245,    -1,   250,    -1,   251,    -1,
     252,    -1,   253,    -1,   254,    -1,   156,   141,   244,    -1,
      54,   181,   141,   244,    -1,    55,   141,   244,    -1,   182,
      -1,   246,   182,    -1,   244,    -1,   247,   244,    -1,   247,
     182,    -1,   247,    -1,   246,    -1,   246,   247,    -1,   144,
      -1,   144,   145,    -1,   249,   248,   145,    -1,   143,    -1,
     180,   143,    -1,    56,   124,   180,   125,   244,    -1,    56,
     124,   180,   125,   244,    66,   244,    -1,    57,   124,   180,
     125,   244,    -1,    58,   124,   180,   125,   244,    -1,    59,
     244,    58,   124,   180,   125,   143,    -1,    60,   124,   251,
     251,   125,   244,    -1,    60,   124,   251,   251,   180,   125,
     244,    -1,    58,   124,   125,   244,    -1,    60,   124,   251,
     125,   244,    -1,    60,   124,   125,   244,    -1,    61,   156,
     143,    -1,    62,   143,    -1,    63,   143,    -1,    64,   143,
      -1,    64,   180,   143,    -1,     5,    -1,   185,   156,   144,
     267,   145,    -1,   185,   156,   144,   145,    -1,   186,   156,
     144,   267,   145,    -1,   186,   156,   144,   145,    -1,   149,
     144,   267,   145,    -1,   149,   144,   145,    -1,   156,   144,
     267,   145,    -1,   156,   144,   145,    -1,   144,   267,   145,
      -1,   144,   145,    -1,   152,   250,    -1,   155,   250,    -1,
     155,   143,    -1,   153,   250,    -1,   154,   250,    -1,   185,
     228,    -1,   185,   232,    -1,   261,   250,    -1,   159,   142,
     242,    -1,   242,    -1,   263,    -1,   264,   131,   263,    -1,
     264,   143,    -1,   265,    -1,   262,    -1,   266,   265,    -1,
     266,   262,    -1,   143,    -1,   266,   143,    -1,   266,    -1,
     264,    -1,   266,   264,    -1,   237,    -1,   237,   141,   181,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   231,   231,   249,   273,   313,   314,   341,   345,   346,
     347,   364,   366,   371,   376,   381,   383,   388,   393,   394,
     399,   401,   403,   405,   406,   408,   409,   410,   413,   414,
     415,   416,   417,   418,   419,   420,   421,   425,   426,   427,
     428,   429,   430,   443,   444,   445,   449,   478,   479,   480,
     481,   485,   486,   487,   489,   490,   492,   493,   497,   498,
     507,   508,   509,   510,   511,   512,   513,   517,   518,   522,
     523,   524,   525,   529,   530,   531,   535,   536,   537,   541,
     549,   550,   551,   552,   553,   557,   558,   559,   563,   564,
     568,   569,   573,   574,   578,   579,   583,   584,   588,   589,
     593,   594,   595,   599,   600,   601,   602,   603,   604,   605,
     606,   607,   608,   609,   613,   614,   618,   622,   623,   624,
     625,   629,   630,   631,   632,   633,   634,   635,   636,   640,
     641,   642,   643,   644,   645,   646,   647,   648,   649,   653,
     654,   655,   656,   657,   658,   659,   660,   661,   662,   666,
     667,   668,   669,   670,   671,   672,   673,   674,   675,   676,
     677,   681,   682,   686,   687,   688,   689,   690,   691,   692,
     693,   694,   702,   711,   712,   713,   714,   715,   716,   717,
     718,   719,   720,   721,   722,   723,   731,   740,   741,   745,
     746,   750,   751,   752,   753,   754,   755,   759,   760,   761,
     765,   766,   767,   772,   773,   774,   775,   776,   780,   781,
     785,   786,   787,   791,   792,   796,   800,   801,   802,   807,
     808,   809,   810,   811,   812,   813,   814,   815,   816,   817,
     818,   819,   820,   821,   822,   823,   824,   825,   826,   827,
     828,   829,   830,   831,   832,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   847,   848,   849,   850,
     851,   852,   853,   854,   855,   856,   857,   858,   859,   864,
     865,   866,   867,   868,   871,   872,   873,   874,   875,   880,
     881,   884,   886,   891,   892,   897,   898,   909,   913,   915,
     916,   918,   919,   945,   962,   963,   967,   968,   972,   973,
     977,   981,   982,   986,   988,   990,   992,   994,   997,   999,
    1001,  1003,  1005,  1008,  1010,  1012,  1014,  1016,  1019,  1021,
    1023,  1025,  1027,  1032,  1033,  1034,  1035,  1036,  1037,  1038,
    1039,  1043,  1045,  1050,  1052,  1054,  1056,  1058,  1063,  1064,
    1068,  1070,  1071,  1072,  1073,  1077,  1079,  1084,  1086,  1092,
    1094,  1096,  1098,  1100,  1102,  1104,  1106,  1108,  1110,  1112,
    1117,  1119,  1121,  1123,  1125,  1130,  1131,  1132,  1133,  1134,
    1135,  1139,  1140,  1141,  1142,  1143,  1144,  1190,  1191,  1193,
    1195,  1200,  1202,  1204,  1206,  1208,  1213,  1214,  1217,  1219,
    1221,  1227,  1231,  1233,  1235,  1240,  1241,  1242,  1244,  1249,
    1250,  1251,  1252,  1253,  1257,  1258,  1262,  1263,  1264,  1265,
    1269,  1270,  1274,  1275,  1279,  1280,  1281,  1282,  1283,  1294,
    1319,  1320,  1324,  1325,  1329,  1330,  1334,  1336,  1338,  1354,
    1356,  1378,  1380,  1385,  1386,  1387,  1388,  1389,  1390,  1394,
    1396,  1398,  1403,  1404,  1408,  1409,  1412,  1416,  1417,  1418,
    1422,  1426,  1434,  1439,  1440,  1444,  1445,  1446,  1450,  1451,
    1452,  1453,  1455,  1456,  1457,  1461,  1462,  1463,  1464,  1465,
    1469,  1473,  1475,  1480,  1482,  1507,  1509,  1511,  1513,  1518,
    1520,  1524,  1526,  1528,  1530,  1532,  1538,  1540,  1545,  1550,
    1551,  1555,  1557,  1562,  1567,  1568,  1569,  1570,  1571,  1572,
    1576,  1577,  1578,  1582,  1583
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
  "SHORT", "INT", "UINT", "INT64", "INT128", "FLOAT128", "LONG", "SIGNED",
  "UNSIGNED", "FLOAT", "DOUBLE", "CONST", "VOLATILE", "VOID", "VALIST",
  "STRUCT", "UNION", "ENUM", "ELLIPSIS", "CASE", "DEFAULT", "IF", "SWITCH",
  "WHILE", "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "IFX",
  "ELSE", "CLASS", "THISCLASS", "PROPERTY", "SETPROP", "GETPROP", "NEWOP",
  "RENEW", "DELETE", "EXT_DECL", "EXT_STORAGE", "IMPORT", "DEFINE",
  "VIRTUAL", "ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT", "ANY_OBJECT",
  "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH", "STOPWATCHING",
  "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER", "CLASS_NO_EXPANSION",
  "CLASS_FIXED", "ISPROPSET", "CLASS_DEFAULT_PROPERTY",
  "PROPERTY_CATEGORY", "CLASS_DATA", "CLASS_PROPERTY", "SUBCLASS",
  "NAMESPACE", "NEW0OP", "RENEW0", "VAARG", "DBTABLE", "DBFIELD",
  "DBINDEX", "DATABASE_OPEN", "ALIGNOF", "ATTRIB_DEP", "__ATTRIB", "BOOL",
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "THREAD",
  "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF", "'*'", "'<'", "'>'", "'('",
  "')'", "'~'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'+'", "'-'",
  "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'",
  "'}'", "$accept", "guess_type", "real_guess_type", "type",
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
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,    42,    60,    62,    40,    41,   126,    36,    46,    91,
      93,    44,    38,    43,    45,    33,    47,    37,    94,   124,
      63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   146,   147,   147,   148,   149,   149,   150,   151,   151,
     151,   152,   152,   153,   154,   155,   155,   156,   157,   157,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   159,   159,   159,
     159,   159,   159,   159,   159,   159,   160,   161,   161,   161,
     161,   162,   162,   162,   162,   162,   162,   162,   163,   163,
     164,   164,   164,   164,   164,   164,   164,   165,   165,   166,
     166,   166,   166,   167,   167,   167,   168,   168,   168,   169,
     170,   170,   170,   170,   170,   171,   171,   171,   172,   172,
     173,   173,   174,   174,   175,   175,   176,   176,   177,   177,
     178,   178,   178,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   180,   180,   181,   182,   182,   182,
     182,   183,   183,   183,   183,   183,   183,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   187,   187,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   189,   190,   190,   191,
     191,   192,   192,   192,   192,   192,   192,   193,   193,   193,
     194,   194,   194,   195,   195,   195,   195,   195,   196,   196,
     197,   197,   197,   198,   198,   199,   200,   200,   200,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   204,
     204,   204,   204,   205,   205,   206,   206,   207,   208,   208,
     208,   208,   208,   208,   209,   209,   210,   210,   211,   211,
     212,   213,   213,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   215,   215,   215,   215,   215,   215,   215,
     215,   216,   216,   217,   217,   217,   217,   217,   218,   218,
     219,   219,   219,   219,   219,   220,   220,   221,   221,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     223,   223,   223,   223,   223,   224,   224,   224,   224,   224,
     224,   225,   225,   225,   225,   225,   225,   226,   226,   226,
     226,   227,   227,   227,   227,   227,   228,   228,   228,   228,
     228,   229,   230,   230,   230,   231,   231,   231,   231,   232,
     232,   232,   232,   232,   233,   233,   234,   234,   234,   234,
     235,   235,   236,   236,   237,   237,   237,   237,   237,   237,
     238,   238,   239,   239,   240,   240,   241,   241,   241,   242,
     242,   243,   243,   244,   244,   244,   244,   244,   244,   245,
     245,   245,   246,   246,   247,   247,   247,   248,   248,   248,
     249,   250,   250,   251,   251,   252,   252,   252,   253,   253,
     253,   253,   253,   253,   253,   254,   254,   254,   254,   254,
     255,   256,   256,   257,   257,   258,   258,   258,   258,   259,
     259,   260,   260,   260,   260,   260,   261,   261,   262,   263,
     263,   264,   264,   265,   266,   266,   266,   266,   266,   266,
     267,   267,   267,   268,   268
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     1,     2,     4,     2,     6,     5,
       6,     5,     7,     6,     7,     6,     1,     1,     4,     3,
       4,     3,     2,     3,     2,     2,     1,     1,     1,     3,
       3,     2,     2,     2,     2,     4,     2,     4,     1,     1,
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
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     2,     3,     6,     5,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     4,     1,     5,
       4,     4,     3,     5,     6,     5,     5,     4,     6,     2,
       2,     3,     3,     1,     2,     1,     2,     1,     1,     1,
       3,     3,     3,     3,     1,     3,     1,     1,     1,     2,
       3,     1,     3,     9,     9,     7,     7,     5,    10,    10,
       8,     8,     6,     8,     8,     6,     6,     4,     9,     9,
       7,     7,     5,     3,     2,     2,     2,     1,     2,     1,
       1,     1,     3,     1,     2,     2,     3,     5,     2,     2,
       4,     5,     7,     7,     5,     1,     3,     1,     3,     3,
       2,     3,     3,     3,     4,     4,     2,     3,     3,     4,
       3,     2,     3,     3,     4,     1,     1,     2,     2,     2,
       3,     1,     1,     2,     2,     2,     3,     1,     2,     3,
       2,     1,     3,     4,     3,     4,     1,     2,     2,     3,
       3,     2,     3,     3,     2,     1,     1,     2,     2,     1,
       2,     2,     3,     3,     1,     2,     1,     2,     2,     3,
       1,     3,     1,     3,     2,     2,     2,     3,     1,     1,
       1,     3,     1,     2,     1,     2,     1,     3,     4,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     3,
       4,     3,     1,     2,     1,     2,     2,     1,     1,     2,
       1,     2,     3,     1,     2,     5,     7,     5,     5,     7,
       6,     7,     4,     5,     4,     3,     2,     2,     2,     3,
       1,     5,     4,     5,     4,     4,     3,     4,     3,     3,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     3,
       1,     1,     3,     2,     1,     1,     2,     2,     1,     2,
       1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   220,   221,
     222,   223,   224,   225,   226,   228,   231,   232,   229,   230,
     216,   217,   219,   227,   296,   297,     0,   419,   242,   197,
     198,   200,   243,   244,   233,     0,     0,   201,   202,   235,
     234,   196,   155,   162,   238,     8,     5,     0,   161,   418,
     149,   215,     0,   199,   218,   151,   153,   157,   236,     0,
     237,   159,   503,     0,     0,   339,   338,     0,     0,     0,
       4,     2,     3,     6,   406,     0,     0,   416,   156,   381,
     150,   215,   152,   154,   158,   160,   366,   415,   414,   396,
       0,   395,   377,   365,     0,     0,     8,   280,   279,     0,
       0,     1,   347,     0,   345,     0,     0,    36,    22,   470,
       0,     0,     0,     0,     0,    66,     0,     0,     0,    23,
      61,     0,    64,     0,    60,    62,    63,    65,     0,    20,
      37,    18,    59,    58,    67,     0,    69,    73,    76,    80,
       0,    85,    88,    90,    92,    94,    96,    98,   100,     0,
      24,    21,     0,     0,   238,    20,    67,   287,   285,     0,
     289,   288,   294,     0,   404,   407,   408,   356,     0,     0,
       0,     0,   410,   412,   350,     0,   116,     0,     0,   381,
       0,   417,     0,   369,   398,   397,   368,     0,     0,   380,
     391,     0,   394,     0,     0,     0,     0,   367,   378,     0,
       0,     0,     0,     0,   330,   272,     0,     0,     0,     0,
      20,     0,     0,   215,     0,   301,     0,   329,   298,     0,
      12,   386,     0,     0,    21,   327,     0,     0,     0,   282,
     281,   504,     0,     0,   340,     0,     0,     0,    54,     0,
      51,    52,     0,     0,     0,     0,     0,     0,    56,    27,
     114,     0,   422,   121,   123,   127,   125,     0,    25,     0,
       0,     0,    44,    45,     0,     0,     0,    42,   104,   105,
     106,   107,   108,   109,   110,   111,   112,   113,   103,     0,
      53,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   239,   240,   241,     0,     0,   215,   286,   365,     0,
      10,     9,     0,   405,   409,   349,   382,   357,     0,   352,
     351,     0,   370,   379,   358,     0,   353,     0,     0,   384,
       0,     0,   392,   393,     0,   203,   204,   207,   206,   205,
       0,   208,   210,     0,   246,   247,   248,   249,   250,   251,
     252,   254,   257,   258,   255,   256,   245,   253,     0,   268,
     259,     0,     0,   261,   260,   264,   169,     0,   163,   165,
     167,   262,     0,   263,     0,    16,    61,     0,    20,     0,
     450,     0,   481,   484,   485,   483,   482,     0,     0,     0,
     324,   381,   215,     0,   331,   399,    11,   333,     0,   388,
       0,   270,   299,     0,   328,     0,   387,   326,   325,     0,
     271,     0,   277,     0,     0,     0,   348,   346,     0,   344,
       0,   341,   133,    20,   424,   129,   131,   137,   135,     0,
       0,     0,   215,   372,     0,   371,   183,     0,   173,   175,
     177,   179,   181,     0,     0,     0,     0,    19,     0,     0,
     122,   124,   128,   126,   423,     0,     0,   498,     0,   476,
      59,   430,   429,     0,   139,   141,   143,   147,   145,   490,
      46,     0,   495,   491,   501,   494,     0,     0,   478,     0,
      43,    39,    48,     0,    47,    41,     0,   102,   101,    70,
      71,    72,    74,    75,    77,    78,    83,    84,    82,    86,
      87,    89,    91,    93,    95,    97,     0,   285,   291,   290,
     368,   293,   292,   295,   411,   413,   359,   355,   354,   385,
     383,   421,   214,     0,     0,     0,   211,   339,   338,     0,
       0,     0,     0,   170,   164,   166,   168,     0,   279,     0,
      15,   215,     0,   451,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   453,    20,     0,   442,
       0,   444,   433,     0,     0,     0,   434,   435,   436,   437,
     438,     0,   300,    13,   335,     0,   401,     0,     0,   323,
       0,   334,     0,   400,   389,   302,   390,   273,   269,   275,
       0,   276,     0,     0,     0,   134,   130,   132,   138,   136,
     425,    55,   361,     0,     0,     0,   375,   374,     0,     0,
     373,     0,     0,   184,   174,   176,   178,   180,   182,     0,
       0,     0,     0,     0,    57,   115,    68,    26,   480,     0,
       0,   381,   140,   142,   144,   148,   146,   486,   487,   488,
       0,   493,   499,   497,   502,   496,   475,   477,    40,     0,
      38,     0,   286,     0,   213,   212,     0,     0,     0,     0,
       0,     0,   317,     0,     0,     0,     0,   282,   281,    14,
       0,     0,     0,     0,     0,     0,     0,     0,   466,   467,
     468,     0,     0,     0,   454,   117,   381,     0,   187,   189,
     443,     0,   446,   445,   452,   119,   474,     0,   402,     0,
     332,   399,     0,   336,   403,   278,   274,   343,   342,   360,
     362,    29,   376,   363,     0,     0,     0,     0,     0,     0,
      31,     0,     0,     0,   479,   489,   492,    50,    49,    99,
     209,   265,   266,   267,   171,     0,     0,     0,     0,     0,
     307,     0,     0,   322,     0,     0,   441,     0,     0,     0,
       0,     0,     0,     0,   465,   469,     0,   439,     0,     0,
     118,     0,   473,   401,     0,     0,   400,     0,   364,    28,
     185,    33,     0,     0,    30,    35,     0,     0,   315,     0,
     316,   172,     0,     0,     0,     0,     0,     0,   312,   440,
       0,     0,   462,     0,     0,   464,     0,     0,     0,   472,
       0,   188,     0,   426,   190,   402,   403,   337,   186,    32,
      34,     0,     0,     0,   305,     0,   306,     0,   320,     0,
     321,     0,     0,   455,   457,   458,     0,   463,     0,     0,
     120,   471,   431,     0,   313,   314,     0,     0,     0,     0,
       0,   310,     0,   311,     0,     0,   460,     0,     0,   427,
     303,   304,   318,   319,     0,     0,   456,   459,   461,   428,
     432,   308,   309
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    42,    43,   128,    45,    46,   206,   207,   208,   209,
     129,   130,   131,   132,   461,   483,   133,   156,   135,   136,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   148,   250,   279,   558,   177,   692,   252,   424,   463,
     212,    49,   367,   437,   687,   688,    50,    51,    52,   341,
     342,   343,    53,    54,    55,    56,   440,    57,    58,   159,
     160,   161,   162,   163,    59,   214,   215,   216,   217,   218,
     393,   394,    60,    61,   103,   104,    86,   433,   169,   434,
     170,   219,   220,    90,   221,    92,   397,   165,   222,   171,
     172,   173,   195,   257,   429,   804,   469,   833,   561,   562,
     563,   564,   565,   381,   566,   567,   568,   569,   570,   150,
     571,   223,   151,   470,   225,   471,   472,   473,   474,   475,
     476,   477,    63
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -753
static const yytype_int16 yypact[] =
{
    8876,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,  -753,    12,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,   -99,   -54,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,     4,  -753,   117,  7279,  -753,
    -753,  -753,    28,  -753,  -753,  -753,  -753,  -753,  -753,    35,
    -753,  -753,   -19,   188,   217,    85,   129,  6989,    57,  6219,
    -753,  -753,  -753,  -753,   827,  7384,  6633,   630,  -753,   109,
    -753,   164,  -753,  -753,  -753,  -753,   -21,  -753,   589,   184,
    8294,  -753,  -753,   381,   138,  3586,   -60,  -753,   167,    33,
    6989,  -753,   209,   -22,  -753,   217,   217,  -753,  -753,  -753,
    7030,  7138,  7138,  8967,  6989,  -753,  8967,  6989,  7171,  -753,
    -753,  6354,  -753,   388,  -753,  -753,  -753,  -753,   259,    53,
    -753,  -753,   642,  -753,  1065,  6989,  -753,   -39,   298,   360,
    6989,   118,   539,   297,   211,   305,   430,    11,  -753,   339,
    -753,  -753,   349,    34,   259,    27,  -753,   360,  6097,   343,
    -753,  -753,  -753,   128,  -753,   827,  -753,  -753,   495,   363,
     847,   376,   375,  -753,  -753,    -2,  -753,   387,   630,  -753,
      68,   589,   486,   -21,   184,  -753,   381,  8393,  6666,  -753,
    -753,  6774,  -753,   344,   399,   152,    52,   -21,  -753,   775,
    9058,  8591,  6577,  8967,  -753,  -753,   382,   382,   382,   460,
      40,   565,  5865,    68,  3713,  -753,   -51,  -753,  -753,   184,
    -753,  -753,   486,   390,   400,  -753,  5466,  3840,  3967,   401,
     423,  -753,  6989,   217,  -753,   186,   210,  6354,  -753,  6807,
    -753,  -753,   109,  7588,  9149,  7690,  9149,  6354,  -753,  -753,
    -753,   291,  8093,  -753,  -753,  -753,  -753,   440,   441,  2726,
    2871,   217,  -753,  -753,  2082,   217,  6989,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  5296,
    -753,  6989,  6989,  6989,  6989,  6989,  6989,  6989,   360,  6989,
    6989,  -753,  6989,  6989,  6989,  6989,  6989,  6989,  6989,  6989,
    6989,  -753,  -753,  -753,  6219,  7486,   373,   434,   283,  6219,
    -753,  -753,  6219,  -753,  -753,  -753,  -753,  -753,  8785,  -753,
    -753,   486,   -21,  -753,  -753,   455,  -753,    13,   453,  -753,
     140,   457,  -753,  -753,   217,  -753,  -753,  -753,  -753,  -753,
     471,   481,  -753,   779,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,    57,  -753,
    -753,   485,   490,  -753,  -753,  -753,   496,  5748,  -753,  -753,
    -753,  -753,   708,  -753,  8591,  -753,   827,  6489,   284,  8688,
     477,  5110,  -753,  -753,  -753,  -753,  -753,  5296,   839,  6989,
    -753,    51,    68,     2,  -753,   184,  -753,   -67,   486,  -753,
      52,  -753,  -753,   794,  -753,    52,  -753,  -753,  -753,  4094,
    -753,  4221,  -753,  4348,  5466,  4475,  -753,  -753,  5466,  -753,
    5466,  -753,  -753,    40,  8093,  -753,  -753,  -753,  -753,   503,
    8195,  6989,   206,   529,   526,   532,   540,  7894,  -753,  -753,
    -753,  -753,  -753,  6989,   543,  7996,   536,  -753,  6989,   217,
    -753,  -753,  -753,  -753,  -753,  6989,   388,  -753,  3016,  -753,
     592,  -753,  -753,  8591,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,   382,  -753,  -753,   223,  -753,  3161,   522,  -753,   523,
    -753,  -753,  -753,   294,  -753,  -753,   482,  -753,  -753,  -753,
    -753,  -753,   -39,   -39,   298,   298,   360,   360,   360,   118,
     118,   539,   297,   211,   305,   430,   -58,  7792,  -753,  -753,
     283,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,  6989,   548,   358,  -753,  -753,  -753,  6989,
      57,  6219,    -4,   -50,  -753,  -753,  -753,    54,  -753,    57,
    -753,    68,   550,  -753,  6989,   535,   553,   554,   555,  5254,
     556,   217,   541,   542,  5631,   217,  -753,    75,   237,  -753,
    5981,  -753,  -753,  2291,  2436,   537,  -753,  -753,  -753,  -753,
    -753,   544,  -753,  -753,  -753,  3306,   184,    52,   379,  -753,
    6989,  -753,    52,   184,  -753,  -753,  -753,  -753,  -753,  -753,
    4602,  -753,  4729,  4856,  4983,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,   567,   571,   551,   529,   532,  8492,  6989,
     529,  6219,  6989,   575,  -753,  -753,  -753,  -753,  -753,   569,
     573,  6989,  6989,   579,  -753,  -753,  -753,  -753,  -753,   559,
    5296,   217,  -753,  -753,  -753,  -753,  -753,  -753,  -753,  -753,
    5296,  -753,  -753,  -753,   223,  -753,  -753,  -753,  -753,  5296,
    -753,  6989,  -753,   322,  -753,  -753,   584,   590,    49,   221,
     382,   382,  -753,  6219,   179,   220,   580,  -753,  -753,  -753,
     578,  5254,  6989,  6989,  6848,   667,  5523,   586,  -753,  -753,
    -753,   254,   588,  5254,  -753,  -753,    62,   256,  -753,   447,
    -753,  2581,  -753,  -753,  -753,  -753,  -753,   594,   184,    68,
    -753,   602,   486,   596,   184,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,   529,  -753,   619,   616,   353,   617,  6219,  6989,
    -753,   618,   620,  6989,  -753,  -753,  -753,  -753,  -753,  -753,
    -753,  -753,  -753,  -753,  -753,   -18,   154,   355,   382,   382,
    -753,   382,   382,  -753,   231,  5254,  -753,   403,   413,  5254,
     417,   632,  5254,  5597,  -753,  -753,  6989,  -753,  3451,   630,
    -753,  5331,  -753,   602,    52,    52,   602,  6989,  -753,  -753,
    -753,  -753,   364,   627,  -753,  -753,   631,   382,  -753,   382,
    -753,  -753,     5,   165,    36,   194,   382,   382,  -753,  -753,
    5254,  5254,  -753,  5254,  6989,  -753,  5254,  6956,   629,  -753,
     615,  -753,  5331,  -753,  -753,   602,   602,  -753,  -753,  -753,
    -753,   624,   635,   382,  -753,   382,  -753,   382,  -753,   382,
    -753,   197,   224,   696,  -753,  -753,   421,  -753,  5254,   425,
    -753,  -753,  -753,   161,  -753,  -753,   636,   640,   641,   644,
     382,  -753,   382,  -753,  5254,   634,  -753,  5254,  2043,  -753,
    -753,  -753,  -753,  -753,   647,   649,  -753,  -753,  -753,  -753,
    -753,  -753,  -753
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -753,   205,  -753,   816,   704,   -10,  -753,  -753,  -753,  -753,
       0,  -753,  -753,   212,  -260,  -753,  -753,   204,  -753,  -118,
     351,   352,   -23,  -753,   348,   480,   504,   515,   525,   514,
    -753,  1551,   -47,  -753,   136,   626,  -372,  -753,  -753,  -359,
     207,  -753,  -753,   591,  -753,    65,  1319,   896,  -753,  -753,
    -331,  -753,   429,  -753,  1216,  1466,  -182,  1292,  -142,  -753,
     158,   282,   520,  -497,  -192,  -140,   433,  -753,  -753,  -113,
    -753,   261,  -109,  1370,   538,   608,   -52,  -408,   -34,  -222,
     -46,   -42,  -191,  -753,  1117,   -61,   380,  -753,  1063,   -87,
    -753,     1,  -753,  -753,   598,  -752,  -382,  -753,   -17,  -753,
    -753,   285,  -753,  -753,  1178,  -634,  -753,  -753,  -753,  -116,
    -753,  -753,   420,  -753,  -753,  -753,   370,   216,   383,   384,
    -753,  -249,  -753
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -501
static const yytype_int16 yytable[] =
{
      47,    62,    88,   194,   482,   572,    89,   258,   372,   559,
     375,   479,   526,    31,    87,     1,    65,   280,   370,   487,
     149,   396,   560,   444,   606,    67,    66,   610,   299,   183,
       1,   181,   198,    89,   659,    89,     1,     1,     1,   184,
       2,   197,   753,     1,    37,    38,   157,    73,    79,    97,
     832,    89,     1,   777,     1,     1,     1,     1,   371,    98,
       1,     2,    69,     2,   102,     1,   660,   661,   153,   155,
      68,     1,   663,   448,   580,   168,   813,   179,     1,    73,
     403,   179,   281,   651,   226,     2,   409,   411,   413,   229,
     193,   373,   404,   179,   664,   210,   860,   282,   283,   230,
     325,   402,   371,   187,   371,   102,   102,   817,   188,   233,
      29,    30,     1,   242,   716,    31,   242,   288,    70,   797,
       1,   198,   100,   234,   307,   323,    69,   778,   319,    73,
     289,   290,   267,   578,   322,   373,    89,   373,   184,   310,
      89,   662,   259,   517,    89,   579,    37,    38,    71,    72,
     814,   300,    94,    73,   184,    73,    64,   259,   242,   303,
      89,    71,    72,   489,   490,   491,   737,     1,    73,   304,
     395,   260,    71,    72,   733,   372,   178,   228,   179,    95,
     179,   818,   179,   540,   260,   536,   179,    47,   101,    74,
     365,   690,   178,    73,   655,   575,   179,   260,   665,   712,
     366,    79,   378,   242,   560,   560,   758,    48,   603,   629,
      73,   267,   391,   179,   210,   619,   683,   484,   454,   260,
       1,   772,   179,   623,   779,   371,   210,   210,   210,   105,
      71,    72,   488,   102,   365,   815,   365,   423,    71,    72,
     291,   292,    73,   242,   436,   242,   436,   423,   725,   738,
     739,   311,   449,    78,   183,   616,   197,   251,   373,   312,
     323,   480,   199,   616,   819,   485,   496,   497,   840,   498,
     519,   134,   637,   106,   590,   592,   158,   333,   593,    89,
     594,   157,    48,   334,   259,    74,   157,     1,    75,   157,
     741,   742,   848,    76,   842,   371,   402,    48,   402,   780,
     402,   786,   787,   371,   423,    47,   849,   211,   190,   423,
     816,   227,   155,   191,   238,   240,   241,   233,    47,   515,
     243,   179,   248,   245,   740,   134,   697,    74,   373,   418,
     430,   419,   560,   537,   521,    89,   373,   626,   251,   820,
     627,   233,   841,   604,   734,    70,    89,     1,   527,   296,
     576,   232,   312,   420,   640,   421,   583,   365,   528,  -381,
    -381,   335,    97,    78,  -381,   743,   641,   533,   448,   843,
     286,   287,   538,   251,    79,   251,   788,   378,    73,   242,
     684,   557,     1,   251,     1,   448,   336,   759,   179,   727,
     600,    73,   179,   109,    48,  -381,  -381,   755,   179,   760,
     179,   625,   486,   259,   337,   179,   134,   305,   374,   210,
     379,   210,    76,   210,   210,   210,   447,    78,   210,   648,
     210,   395,   448,    73,   242,   649,   211,   365,   260,   295,
      47,   284,   285,   338,   339,   365,   506,   613,   211,   211,
     211,   134,   422,   134,   297,   613,   298,   730,    78,    73,
      78,   134,   422,   448,    29,    30,    29,    30,   322,    31,
     267,    31,   508,   631,   301,    71,    72,   511,   134,  -420,
     134,   460,   460,   652,   302,  -420,   770,   402,   781,   402,
     402,   402,   656,   134,   312,   309,   312,   808,   315,     1,
      37,    38,    37,    38,    74,   312,    70,   305,     1,   184,
      74,   317,    76,   178,   134,    75,   318,   242,   157,   800,
      76,   507,    48,   251,   689,   224,   507,   320,    89,   158,
     389,   714,    29,    30,   332,    48,   380,    31,   790,   667,
     658,   155,   675,   407,   448,   698,   701,   666,   791,   668,
     704,   179,   793,   408,   448,   414,   845,   693,   448,   557,
     847,   677,   448,   293,   294,   682,   448,    73,    37,    38,
     686,    29,    30,   557,   557,   455,    31,   415,     1,   456,
    -381,  -381,   261,   262,   263,  -381,  -284,   179,   179,    78,
     516,   134,   179,   518,    78,   134,   509,   520,   157,   761,
     210,   512,   210,   210,   210,     1,   522,    37,    38,   261,
     262,   263,   728,   385,   380,   523,  -381,  -381,    47,   529,
     178,   155,   650,   448,   530,   211,    71,    72,   531,  -381,
    -381,   211,   543,   211,  -381,   211,   211,   211,   601,   595,
     211,    73,   211,     1,   224,   492,   493,    48,   494,   495,
     157,   499,   500,   235,   236,     1,   224,   224,   224,   261,
     262,   263,   134,   608,   746,   609,   430,   763,    73,   653,
     766,   624,   611,   155,    29,    30,   757,   646,   647,    31,
     460,   557,   621,   654,   693,   669,   671,   672,   673,   674,
     676,   711,   694,   557,   678,   679,    73,   695,   460,   264,
     681,   557,   709,   265,   266,   157,   710,   718,   719,   179,
      37,    38,   179,   720,   724,    29,    30,   387,   723,   731,
      31,     1,    78,   689,   803,   732,   264,    89,   155,   745,
     265,   266,   805,   806,   744,   751,   231,   134,   789,   754,
     756,   191,   792,   134,   630,   795,     2,   767,   158,   762,
     244,    37,    38,   246,   768,   557,   769,   771,   774,   557,
     775,    74,   557,   134,   178,   803,   794,   809,   134,   179,
     831,   810,   844,    96,   179,   179,   264,   134,   134,   834,
     265,   266,   830,   823,   824,   501,   825,   857,   335,   827,
     835,   850,   335,    29,    30,   851,   852,   460,    31,   853,
     557,   557,   861,   557,   862,   107,   557,     1,   108,   109,
     502,   803,   211,   336,   211,   211,   211,   336,   747,   748,
     750,   846,   503,   505,   328,    48,    44,   331,   158,    37,
      38,   337,     2,   504,   801,   337,   581,   856,   557,   224,
     858,   224,   513,   224,   224,   224,   585,   445,   224,   700,
     224,   417,     1,   638,   557,   446,   643,   557,   691,     0,
     338,   339,   460,   134,   338,   339,   726,     0,   416,   644,
     645,     0,     0,     0,    44,     0,   113,   114,     0,     0,
     158,     0,     0,    20,    21,   134,   134,   134,   134,     0,
     134,     0,     0,     0,   152,   154,     0,   134,     0,     0,
       0,    44,   175,     0,     0,   134,     0,   116,   117,     0,
     340,     0,    29,    30,   524,     0,    44,    31,     0,     0,
     525,   154,     0,   119,    29,    30,     0,     0,   239,    31,
       0,   123,    29,    30,     0,   158,     0,    31,     0,    44,
     826,     0,    44,   829,     0,     0,     0,   154,    37,    38,
       0,     0,     0,     0,    81,     0,     0,     0,    74,   134,
      37,    38,     0,   134,     0,    99,   134,   134,    37,    38,
      74,     0,     0,   178,   573,   134,     0,     0,     0,     0,
     460,    81,   316,   180,    44,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   189,     0,     0,     0,     0,   196,
       0,   213,     0,     0,   134,   134,     0,   134,   134,     0,
     134,   134,     0,    44,   327,     0,   134,   330,     0,     0,
     224,     0,   224,   224,   224,   574,     0,    44,     0,    44,
       0,     0,     0,     0,     0,     0,     0,     0,    44,     0,
     154,     0,   134,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   154,   154,   154,     0,     0,     0,   134,     0,
       0,   134,   134,   154,   306,     0,     0,   605,     0,    44,
       0,    44,     0,   154,     0,     0,   189,     0,    44,   620,
       0,     0,     0,     0,   180,   154,   154,   189,   196,     0,
       0,     0,   196,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,     0,     0,     0,     0,   213,   180,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   392,     0,
     213,    93,     0,     0,     0,     0,     0,     0,   405,     0,
     154,    44,   213,   213,   213,   154,     0,     0,   154,     0,
       0,     0,     0,     0,    44,     0,     0,   166,    93,   432,
     182,   432,     0,     0,   186,     0,     0,     0,   306,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    91,     0,     0,     0,     0,
     670,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      44,     0,    91,   154,    91,    44,     0,   154,   185,     0,
       0,   306,     0,     0,     0,     0,   703,   278,     0,     0,
      91,     0,     0,     0,     0,     0,     0,   196,     0,     0,
       0,   308,     0,     0,     0,   154,     0,   154,   314,   154,
     154,   154,     0,     0,   154,   715,   154,     0,   717,     0,
      44,   182,     0,   321,     0,     0,    44,   721,   722,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   306,    82,   182,     0,     0,   539,     0,
     213,     0,     0,   541,   154,   398,   400,     0,     0,    44,
       0,     0,     0,     0,   180,     0,     0,     0,     0,     0,
     164,     0,   154,     0,   582,    91,     0,   185,     0,    91,
       0,     0,     0,    91,     0,   213,   435,   213,   435,   213,
     213,   213,     0,   185,   213,   308,   213,     0,     0,    91,
     306,     0,     0,    44,     0,     0,   432,     0,     0,     0,
     399,     0,     0,   432,     0,     0,     0,   253,     0,   406,
      84,   432,     0,     0,     0,   773,   657,   154,     0,   776,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   392,
       0,     0,     0,     0,     0,     0,     0,    80,   308,   510,
       0,     0,     0,     0,    82,     0,    44,     0,     0,   154,
     154,   313,   798,     0,   382,   383,   384,   386,     0,     0,
       0,   154,     0,   807,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   306,     0,     0,   154,     0,   154,   154,
     154,     0,     0,   255,     0,     0,   369,     0,    85,     0,
       0,     0,     0,     0,    44,     0,     0,   154,    82,     0,
     308,     0,     0,     0,     0,     0,     0,     0,    91,   166,
     182,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      84,   182,     0,   425,     0,   577,   541,     0,     0,    82,
     439,    82,   439,   425,     0,     0,     0,     0,   450,     0,
       0,     0,     0,     0,   699,   465,   465,    80,     0,   154,
       0,     0,     0,     0,     0,     0,   213,   308,   213,   213,
     213,   256,     0,   435,    91,   607,     0,     0,     0,     0,
     435,     0,     0,     0,    84,    91,     0,   154,   435,   399,
       0,     0,     0,     0,    83,   406,     0,   584,     0,   368,
       0,     0,   586,     0,     0,     0,   398,     0,    85,   427,
       0,    80,     0,     0,   154,    84,   441,    84,   441,   427,
       0,     0,     0,     0,   452,     0,     0,     0,     0,     0,
       0,   467,   467,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,   438,    80,   438,     0,     0,     0,     0,
     308,     0,     0,     0,   154,     0,     0,     0,   464,   464,
       0,     0,    85,   535,     0,   189,     0,   254,     0,     0,
      82,     0,   164,   253,     0,    82,     0,   465,   765,     0,
       0,     0,     0,     0,   321,     0,     0,   428,     0,     0,
       0,     0,     0,    85,   442,    85,   442,   428,     0,     0,
       0,     0,   453,   182,    83,     0,     0,   176,     0,   468,
     468,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     596,   702,     0,     0,     0,     0,     0,     0,     0,   639,
       0,   176,     0,   615,     0,   180,     0,     0,   185,     0,
       0,   615,     0,     0,     0,   176,    84,     0,   176,   255,
       0,    84,     0,   467,   465,     0,     0,    91,    83,   633,
       0,     0,     0,     0,     0,     0,   534,     0,     0,     0,
       0,     0,   465,    80,   584,     0,     0,     0,    80,   586,
     464,     0,     0,   426,     0,     0,     0,     0,     0,    83,
       0,    83,     0,   426,     0,     0,   598,     0,   451,     0,
       0,     0,     0,    82,     0,   466,   466,     0,     0,   617,
       0,     0,     0,     0,     0,     0,     0,   617,     0,   176,
       0,     0,   176,     0,    85,     0,     0,   256,     0,    85,
     467,   468,     0,     0,     0,   635,   614,     0,     0,     0,
       0,     0,   764,     0,   614,     0,     0,     0,   467,     0,
       0,     0,     0,     0,     0,     0,   633,   464,     0,   465,
     465,     0,   632,   176,     0,     0,     0,     0,     0,     0,
       0,   465,     0,     0,   599,   464,     0,     0,     0,    84,
       0,     0,     0,     0,     0,     0,     0,   618,     0,     0,
     462,   462,     0,     0,     0,   618,     0,     0,     0,     0,
       0,     0,   182,     0,     0,     0,    80,     0,   468,     0,
       0,     0,     0,   636,     0,     0,     0,     0,   735,   736,
      83,     0,     0,   254,     0,    83,   468,   466,     0,     0,
       0,     0,   635,     0,     0,   467,   467,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   467,     0,     0,
       0,     0,     0,     0,     0,     0,    91,    85,     0,   632,
       0,     0,   464,   464,     0,     0,     0,     0,     0,     0,
     597,     0,     0,     0,   464,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   465,     0,     0,
       0,     0,     0,     0,     0,     0,   782,   783,     0,   784,
     785,     0,     0,     0,   466,     0,     0,     0,     0,   634,
     636,     0,     0,   468,   468,     0,     0,     0,   462,     0,
     176,     0,   466,     0,     0,   468,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   811,     0,   812,     0,     0,
       0,     0,     0,     0,   821,   822,     0,     0,     0,     0,
       0,     0,     0,    83,   465,     0,     0,     0,     0,     0,
       0,     0,   176,   467,     0,     0,     0,     0,     0,     0,
       0,   836,     0,   837,   176,   838,     0,   839,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   462,
     464,     0,     0,     0,     0,     0,     0,     0,   854,     0,
     855,     0,     0,     0,     0,     0,   634,   462,     0,   466,
     466,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   466,     0,     0,   107,     0,     1,   108,   109,   110,
     467,   111,   112,     0,     0,     0,     0,     0,     0,     0,
       0,   468,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,   464,     0,     0,
       0,     0,     0,   107,     0,     1,   108,   109,   110,     0,
     111,   112,     0,     0,     0,   176,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,   113,   114,   115,     0,     0,
       0,     0,     0,     0,     0,     0,   462,     0,   468,     0,
       0,   176,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   116,   117,     0,     0,
       0,     0,     0,   118,   113,   114,   115,   466,     0,     0,
     176,     0,   119,   176,   120,     0,     0,   121,     0,   122,
     123,     0,   176,   176,     0,   124,   125,   126,   127,     0,
       0,   462,     0,     0,     0,   116,   117,   802,   859,     0,
       0,   462,   118,     0,     0,     0,     0,     0,     0,     0,
       0,   119,   729,   120,     0,     0,   121,   481,   122,   123,
       0,     0,     0,     0,   124,   125,   126,   127,     0,     0,
       0,     0,     0,     0,   466,     0,   458,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     176,     0,     0,     0,   176,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,   176,     0,   462,
       0,     0,     0,     0,     0,     0,     0,     0,   176,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,   544,   545,   546,   547,   548,
     549,   550,   551,   552,   553,   554,     0,     0,     0,    28,
       0,     0,     0,   113,   114,   115,    29,    30,     0,   555,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,   118,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     0,     0,     0,
       0,     0,     0,     0,   556,   380,  -448,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
     544,   545,   546,   547,   548,   549,   550,   551,   552,   553,
     554,     0,     0,     0,    28,     0,     0,     0,   113,   114,
     115,    29,    30,     0,   555,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,   118,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,     0,     0,     0,     0,     0,     0,     0,   556,
     380,  -447,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,   544,   545,   546,   547,   548,
     549,   550,   551,   552,   553,   554,     0,     0,     0,    28,
       0,     0,     0,   113,   114,   115,    29,    30,     0,   555,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,   118,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     0,     0,     0,
       0,     0,     0,     0,   556,   380,  -449,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   113,   114,
     115,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,   118,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,     0,     0,     0,     0,     0,     0,     0,   457,
     458,   459,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   113,   114,   115,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,   118,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     0,     0,     0,
       0,     0,     0,     0,   457,   458,   478,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   113,   114,
     115,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,   118,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,     0,     0,     0,     0,     0,     0,     0,   457,
     458,   628,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   113,   114,   115,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,   118,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     0,     0,     0,
       0,     0,     0,     0,   642,   458,  -500,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   113,   114,
     115,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,   118,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,     0,     0,     0,     0,     0,     0,     0,   457,
     458,   696,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,   113,   114,   115,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,   118,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,   107,     0,     1,
     108,   109,     0,     0,   457,   458,   799,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,   200,     0,     0,   113,   114,
       0,    29,    30,     0,     0,   201,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,    74,     0,     0,
     202,     0,   203,   123,   107,     0,     1,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   204,
       0,   205,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   200,     0,     0,   113,   114,     0,    29,    30,
       0,     0,   201,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   116,   117,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   119,     0,    74,     0,     0,   202,     0,   203,
     123,   107,     0,     1,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   204,     0,   401,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,   200,
       0,     0,   113,   114,     0,    29,    30,     0,     0,   201,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   116,   117,     0,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,   119,
       0,    74,     0,     0,   202,     0,   203,   123,   107,     0,
       1,   108,   109,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   204,     0,   410,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,   200,     0,     0,   113,
     114,     0,    29,    30,     0,     0,   201,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
     116,   117,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,   119,     0,    74,     0,
       0,   202,     0,   203,   123,   107,     0,     1,   108,   109,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     204,     0,   412,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,   200,     0,     0,   113,   114,     0,    29,
      30,     0,     0,   201,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,   116,   117,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,   119,     0,    74,     0,     0,   202,     0,
     203,   123,   107,     0,     1,   108,   109,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   204,     0,   587,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
     200,     0,     0,   113,   114,     0,    29,    30,     0,     0,
     201,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   116,   117,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
     119,     0,    74,     0,     0,   202,     0,   203,   123,   107,
       0,     1,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   204,     0,   588,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,   200,     0,     0,
     113,   114,     0,    29,    30,     0,     0,   201,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,   116,   117,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,   119,     0,    74,
       0,     0,   202,     0,   203,   123,   107,     0,     1,   108,
     109,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   204,     0,   589,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,   200,     0,     0,   113,   114,     0,
      29,    30,     0,     0,   201,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,   116,   117,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,   119,     0,    74,     0,     0,   202,
       0,   203,   123,   107,     0,     1,   108,   109,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   204,     0,
     591,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,   200,     0,     0,   113,   114,     0,    29,    30,     0,
       0,   201,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,   116,   117,     0,     0,     0,
       0,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,   119,     0,    74,     0,     0,   202,     0,   203,   123,
     107,     0,     1,   108,   109,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   204,     0,   705,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,   200,     0,
       0,   113,   114,     0,    29,    30,     0,     0,   201,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   116,   117,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,   119,     0,
      74,     0,     0,   202,     0,   203,   123,   107,     0,     1,
     108,   109,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   204,     0,   706,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,   200,     0,     0,   113,   114,
       0,    29,    30,     0,     0,   201,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,    74,     0,     0,
     202,     0,   203,   123,   107,     0,     1,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   204,
       0,   707,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   200,     0,     0,   113,   114,     0,    29,    30,
       0,     0,   201,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   116,   117,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   119,     0,    74,     0,     0,   202,     0,   203,
     123,   107,     0,     1,   108,   109,   110,     0,   111,   112,
       0,     0,     0,     0,     0,     0,   204,     0,   708,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,   544,   545,   546,   547,   548,   549,
     550,   551,   552,   553,   554,     0,     0,     0,    28,     0,
       0,     0,   113,   114,   115,    29,    30,     0,   555,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   116,   117,     0,     0,     0,     0,     0,
     118,    37,    38,    39,    40,     0,     0,     0,    41,   119,
       0,   120,     0,     0,   121,     0,   122,   123,     0,     0,
       0,     0,   124,   125,   126,   127,     0,     0,     0,     0,
       0,     0,     0,   556,   380,   107,     0,     1,   108,   109,
     110,     0,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,   544,   545,
     546,   547,   548,   549,   550,   551,   552,   553,   554,     0,
       0,     0,     0,     0,     2,     0,   113,   114,   115,     0,
       0,     0,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   116,   117,     2,
       0,     0,     0,     0,   118,     0,     0,     0,   113,   114,
     115,     0,     0,   119,     0,   120,     0,     0,   121,     0,
     122,   123,     0,     0,     0,     0,   124,   125,   126,   127,
       0,     0,     0,     0,     0,     0,     0,   556,   380,   116,
     117,     0,     0,   113,   114,   115,   118,     0,     0,     0,
       0,     0,     0,     0,     0,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,     0,     0,   116,   117,     0,     0,     0,     0,
     458,   118,     0,     0,     0,     0,     0,     0,     0,     0,
     119,     0,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,   107,     0,     1,
     108,   109,     0,     0,     0,   802,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,   107,     0,     1,   108,   109,   110,
       0,   111,   112,     0,    28,   200,     0,     0,   113,   114,
       0,    29,    30,     0,     0,   201,    31,     0,     0,    32,
      33,     2,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   116,
     117,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   119,     0,    74,     0,     0,
     202,     0,   203,   123,     0,   113,   114,   115,   107,     0,
       1,   108,   109,   110,     0,   111,   112,     0,     0,   204,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   116,   117,     0,     0,
       0,     0,   107,   118,     1,   108,   109,   110,     0,   111,
     112,     0,   119,     0,   120,     0,     0,   121,   752,   122,
     123,     0,     0,     0,     0,   124,   125,   126,   127,     2,
       0,     0,     0,     0,     0,     0,   556,     0,     0,   113,
     114,   115,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     116,   117,     0,   113,   114,   115,     0,   118,     0,     0,
       0,     0,     0,     0,     0,     0,   119,     0,   120,     0,
       0,   121,   796,   122,   123,     0,     0,     0,     0,   124,
     125,   126,   127,     0,   116,   117,     0,     0,     0,     0,
     556,   118,     0,     0,     0,     0,     0,     0,     0,     0,
     119,     1,   120,     0,     0,   121,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     0,     0,     0,
       0,     0,     0,     0,   680,     0,     2,     3,     4,     5,
       6,     7,   344,   345,   346,   347,   348,   349,   350,   351,
     352,   353,   354,   355,    20,    21,   356,   357,    24,    25,
     358,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   359,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,     0,     0,     0,   360,     0,   361,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   362,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,   363,   364,     0,     0,     0,    41,     0,     1,    74,
       0,     0,   305,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   532,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     1,     0,    74,     0,     0,   388,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   389,     0,   390,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
       1,     0,    74,     0,     0,   178,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   685,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     0,     0,    74,     0,
     107,   305,     1,   108,   109,   110,    76,   111,   112,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,  -283,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,   113,   114,   115,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   116,   117,     0,     0,     0,     0,     0,   118,
      37,    38,    39,    40,     0,     0,     0,    41,   119,     0,
     120,     0,     0,   121,     0,   122,   123,     0,     0,     0,
       0,   124,   125,   126,   127,   107,     0,     1,   108,   109,
     110,     0,   111,   112,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,     0,     0,     0,   113,   114,   115,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,   116,   117,     0,
       0,     0,     0,     0,   118,    37,    38,    39,    40,     0,
       0,     0,     0,   119,     0,   120,     0,     0,   121,   249,
     122,   123,     0,     0,     0,     0,   124,   125,   126,   127,
     107,     0,     1,   108,   109,   110,     0,   111,   112,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,   113,   114,   115,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,   107,     0,
       1,   108,   109,   110,     0,   111,   112,     0,     0,     0,
      36,     0,   116,   117,     0,     0,     0,     0,     0,   118,
      37,    38,    39,    40,     0,     2,     0,     0,   119,     0,
     376,     0,     0,   377,   249,   122,   123,     0,     0,     0,
       0,   124,   125,   126,   127,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   107,     0,     1,   108,   109,   110,
       0,   111,   112,     0,     0,     0,     0,     0,     0,   113,
     114,   115,    29,    30,     0,     0,     0,    31,     0,     0,
       0,     2,     0,     0,     0,     0,     0,   107,     0,     1,
     108,   109,   110,     0,   111,   112,     0,     0,     0,     0,
     116,   117,     0,     0,     0,     0,     0,   118,    37,    38,
       0,     0,     0,     0,     2,     0,   119,     0,   376,     0,
       0,   377,   249,   122,   123,   113,   114,   115,     0,   124,
     125,   126,   127,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   116,   117,   113,   114,
     115,     0,     0,   118,     0,     0,     0,     0,     0,     0,
       0,     0,   119,     0,   120,     0,     0,   121,     0,   122,
     123,     0,     0,   174,     0,   124,   125,   126,   127,   116,
     117,     0,     0,     0,     0,   107,   118,     1,   108,   109,
     110,     0,   111,   112,     0,   119,     0,   120,     0,     0,
     121,     0,   122,   123,     0,     0,   326,     0,   124,   125,
     126,   127,     2,     0,     0,     0,     0,     0,   107,     0,
       1,   108,   109,   110,     0,   111,   112,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   113,   114,   115,   107,
       0,     1,   108,   109,   110,     0,   111,   112,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   116,   117,   113,
     114,   115,     0,     0,   118,     0,     0,     0,     0,     0,
       0,     0,     0,   119,     0,   120,     0,     0,   121,     0,
     122,   123,     0,     0,   329,     0,   124,   125,   126,   127,
     116,   117,     0,     0,     0,     0,     0,   118,     0,     0,
     113,   114,   115,     0,     0,     0,   119,     0,   120,     0,
       0,   121,   249,   122,   123,     0,     0,     0,     0,   124,
     125,   126,   127,     0,     0,     0,     0,     0,     0,     0,
       0,   116,   117,     0,     0,     0,     0,   107,   118,     1,
     108,   109,   110,     0,   111,   112,     0,   119,     0,   120,
       0,     0,   121,   749,   122,   123,     0,     0,     0,     0,
     124,   125,   126,   127,     2,     0,     0,     0,     0,     0,
     107,     0,     1,   108,   109,   110,     0,   111,   112,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   113,   114,
     115,   107,     0,     1,   108,   109,   110,     0,   111,   112,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   116,
     117,   113,   114,   115,     0,     0,   118,     0,     0,     0,
       0,     0,     0,     0,     0,   119,     0,   120,     0,     0,
     121,   828,   122,   123,     0,     0,     0,     0,   124,   125,
     126,   127,   116,   117,     0,     0,     0,     0,     0,   118,
       0,     0,   113,   114,   115,     0,     0,     0,   119,     0,
     120,     0,     0,   121,     0,   122,   123,     0,     0,     0,
       0,   124,   125,   126,   127,     0,     0,     0,     0,     0,
       0,     0,     0,   116,   117,     0,     0,     0,     0,   107,
     118,     1,   108,   109,   110,     0,   111,   112,     0,   119,
       0,   120,     0,     0,   237,     0,   122,   123,     0,     0,
       0,     0,   124,   125,   126,   127,     2,     0,     0,     0,
       0,     0,   107,     0,     1,   108,   109,   110,     0,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     113,   114,   115,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   116,   117,   113,   114,   115,     0,     0,   118,     0,
       0,     0,     0,     0,     0,     0,     0,   119,     0,   120,
       0,     0,   239,     0,   122,   123,     0,     0,     0,     0,
     124,   125,   126,   127,   116,   117,     0,     0,     0,     0,
       0,   118,     1,     0,     0,     0,     0,     0,     0,     0,
     119,     0,   120,     0,     0,   247,     0,   122,   123,     0,
       0,     0,     0,   124,   125,   126,   127,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,     0,     0,     0,     0,     0,     1,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,     0,     0,
      74,     0,     0,    75,     0,     0,     0,     0,    76,     0,
       0,    77,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,     0,     0,     1,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,     0,     0,    74,     0,     0,    75,   167,
       0,     0,     0,    76,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,     0,
       0,     1,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,     0,     0,    74,     0,     0,
     305,   167,     0,     0,     0,    76,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     0,     0,     1,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,    74,
       0,     0,   430,     0,     0,     0,     0,   431,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,     0,     0,     0,    29,    30,     0,     0,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,     0,     0,     1,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,     0,
       0,    74,     0,     0,   430,     0,     0,     0,     0,   443,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,     0,     0,     0,     0,     0,     0,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,     0,     0,     1,     0,     0,
       0,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,     0,     0,    74,     0,     0,   305,     0,     0,     0,
       0,    76,     2,     3,     4,     5,     6,     7,   344,   345,
     346,   347,   348,   349,   350,   351,   352,   353,   354,   355,
      20,    21,   356,   357,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   359,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,     0,     0,     0,
     360,     0,   361,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   362,     0,     0,     0,     1,
       0,     0,     0,     0,     0,    37,    38,   363,   364,     0,
       0,     0,    41,     0,     0,    74,     0,     0,   430,     0,
       0,     0,     0,   612,     2,     3,     4,     5,     6,     7,
     344,   345,   346,   347,   348,   349,   350,   351,   352,   353,
     354,   355,    20,    21,   356,   357,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   359,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,     0,
       0,     0,   360,     0,   361,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,   362,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    37,    38,   363,
     364,     0,     0,     0,    41,     0,     0,    74,     0,     0,
     430,     2,     0,     0,     0,   622,     0,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,     0,     0,     1,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,     0,     0,     0,    74,     0,     0,   305,     0,     0,
       0,     0,    76,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     0,     0,    74,     0,     0,   430,
     602,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,     0,     0,     0,     0,     0,     0,   192,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,     0,     0,     0,     0,     0,     0,   324,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,     0,     0,     0,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     1,     0,     0,     0,     0,     0,
       0,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,     0,     0,     0,     0,     0,     0,   713,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
       0,     0,    74,     0,     0,   178,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,     0,   542,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,   514,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       1,     0,     0,     0,     0,     0,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,    36,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     2,     3,     4,     5,
       6,     7,   344,   345,   346,   347,   348,   349,   350,   351,
     352,   353,   354,   355,    20,    21,   356,   357,    24,    25,
     358,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   359,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,     0,     0,     0,   360,     0,   361,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,   362,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,   363,   364,     0,     0,     0,    41,     2,     3,     4,
       5,     6,     7,   344,   345,   346,   347,   348,   349,   350,
     351,   352,   353,   354,   355,    20,    21,   356,   357,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   359,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,     0,     0,     0,   360,     0,   361,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     362,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,    38,   363,   364,     0,     0,     0,    41
};

static const yytype_int16 yycheck[] =
{
       0,     0,    48,    90,   264,   387,    48,   123,   200,   381,
     201,   260,   343,    80,    48,     3,    26,   135,   200,   279,
      67,   212,   381,   245,   432,   124,    26,   435,    17,    81,
       3,    77,    93,    75,   531,    77,     3,     3,     3,    81,
      28,    93,   676,     3,   111,   112,    69,    47,    48,    59,
     802,    93,     3,    71,     3,     3,     3,     3,   200,    59,
       3,    28,   122,    28,    64,     3,    70,    71,    68,    69,
     124,     3,   122,   131,   141,    75,    71,    77,     3,    79,
     131,    81,   121,   141,   144,    28,   226,   227,   228,    99,
      90,   200,   143,    93,   144,    95,   848,   136,   137,    99,
     187,   214,   244,   124,   246,   105,   106,    71,   129,   131,
      75,    76,     3,   113,   611,    80,   116,   140,     1,   753,
       3,   182,   141,   145,   158,   186,   122,   145,   130,   129,
      12,    13,   132,   131,   186,   244,   178,   246,   180,    11,
     182,   145,   144,   130,   186,   143,   111,   112,   121,   122,
     145,   140,   124,   153,   196,   155,   144,   144,   158,   125,
     202,   121,   122,   281,   282,   283,   663,     3,   168,   142,
     212,   144,   121,   122,   125,   367,   124,   144,   178,   144,
     180,   145,   182,   374,   144,   367,   186,   187,     0,   121,
     200,   563,   124,   193,   525,   144,   196,   144,   144,   607,
     200,   201,   202,   203,   563,   564,   144,     0,   430,   458,
     210,   211,   212,   213,   214,   437,   141,   264,   252,   144,
       3,   718,   222,   445,    70,   367,   226,   227,   228,   144,
     121,   122,   279,   233,   244,    70,   246,   237,   121,   122,
     122,   123,   242,   243,   244,   245,   246,   247,   630,    70,
      71,   123,   252,    48,   306,   437,   308,   121,   367,   131,
     321,   261,   124,   445,    70,   265,   289,   290,    71,   292,
     130,    67,   463,   144,   414,   415,    69,   125,   418,   321,
     420,   304,    75,   131,   144,   121,   309,     3,   124,   312,
      70,    71,   131,   129,    70,   437,   409,    90,   411,   145,
     413,    70,    71,   445,   304,   305,   145,    95,   124,   309,
     145,   144,   312,   129,   110,   111,   112,   131,   318,   318,
     113,   321,   118,   116,   145,   121,   575,   121,   437,   143,
     124,   145,   691,   367,   334,   377,   445,   455,   202,   145,
     456,   131,   145,   430,   123,     1,   388,     3,   358,   138,
     392,   142,   131,   143,   131,   145,   398,   367,   358,    75,
      76,     3,   372,   158,    80,   145,   143,   367,   131,   145,
      10,    11,   372,   237,   374,   239,   145,   377,   378,   379,
     143,   381,     3,   247,     3,   131,    28,   131,   388,   649,
     424,   391,   392,     5,   187,   111,   112,   143,   398,   143,
     400,   448,   266,   144,    46,   405,   202,   124,   201,   409,
     203,   411,   129,   413,   414,   415,   125,   212,   418,   125,
     420,   463,   131,   423,   424,   131,   214,   437,   144,   132,
     430,   133,   134,    75,    76,   445,   300,   437,   226,   227,
     228,   237,   237,   239,   139,   445,    16,   125,   243,   449,
     245,   247,   247,   131,    75,    76,    75,    76,   510,    80,
     460,    80,   304,   463,   125,   121,   122,   309,   264,   125,
     266,   259,   260,   507,   125,   131,   123,   590,   123,   592,
     593,   594,   529,   279,   131,   142,   131,   123,   125,     3,
     111,   112,   111,   112,   121,   131,     1,   124,     3,   541,
     121,   125,   129,   124,   300,   124,   131,   507,   531,   758,
     129,   304,   305,   377,   560,    95,   309,   130,   560,   312,
     141,   608,    75,    76,   125,   318,   144,    80,   125,   539,
     530,   531,   549,   143,   131,   577,   578,   537,   125,   539,
     582,   541,   125,   143,   131,   144,   125,   564,   131,   549,
     125,   551,   131,    14,    15,   555,   131,   557,   111,   112,
     560,    75,    76,   563,   564,   125,    80,   144,     3,   128,
      75,    76,     7,     8,     9,    80,   142,   577,   578,   374,
     125,   377,   582,   130,   379,   381,   304,   130,   611,   142,
     590,   309,   592,   593,   594,     3,   125,   111,   112,     7,
       8,     9,   649,   143,   144,   124,   111,   112,   608,   124,
     124,   611,   130,   131,   124,   403,   121,   122,   122,   124,
     125,   409,   145,   411,   129,   413,   414,   415,   125,   424,
     418,   631,   420,     3,   214,   284,   285,   430,   286,   287,
     663,   293,   294,   105,   106,     3,   226,   227,   228,     7,
       8,     9,   448,   124,   671,   129,   124,   699,   658,   523,
     702,   125,   122,   663,    75,    76,   683,   145,   145,    80,
     458,   671,   129,   125,   691,   125,   141,   124,   124,   124,
     124,   130,   145,   683,   143,   143,   686,   143,   476,   124,
     554,   691,   125,   128,   129,   718,   125,   122,   129,   699,
     111,   112,   702,   130,   145,    75,    76,   142,   129,   125,
      80,     3,   507,   759,   761,   125,   124,   759,   718,   141,
     128,   129,   764,   765,   144,    58,   100,   523,   745,   143,
     142,   129,   749,   529,   142,   752,    28,   141,   531,   145,
     114,   111,   112,   117,   125,   745,   130,   130,   130,   749,
     130,   121,   752,   549,   124,   802,   124,   130,   554,   759,
     145,   130,    66,    59,   764,   765,   124,   563,   564,   145,
     128,   129,   143,   790,   791,   295,   793,   143,     3,   796,
     145,   145,     3,    75,    76,   145,   145,   575,    80,   145,
     790,   791,   145,   793,   145,     1,   796,     3,     4,     5,
     296,   848,   590,    28,   592,   593,   594,    28,   672,   673,
     674,   828,   297,   299,   188,   608,     0,   191,   611,   111,
     112,    46,    28,   298,   759,    46,   397,   844,   828,   409,
     847,   411,   312,   413,   414,   415,   403,   246,   418,   578,
     420,   233,     3,   463,   844,   247,   476,   847,   563,    -1,
      75,    76,   640,   649,    75,    76,   640,    -1,   232,   476,
     476,    -1,    -1,    -1,    48,    -1,    72,    73,    -1,    -1,
     663,    -1,    -1,    46,    47,   671,   672,   673,   674,    -1,
     676,    -1,    -1,    -1,    68,    69,    -1,   683,    -1,    -1,
      -1,    75,    76,    -1,    -1,   691,    -1,   103,   104,    -1,
     125,    -1,    75,    76,   125,    -1,    90,    80,    -1,    -1,
     131,    95,    -1,   119,    75,    76,    -1,    -1,   124,    80,
      -1,   127,    75,    76,    -1,   718,    -1,    80,    -1,   113,
     794,    -1,   116,   797,    -1,    -1,    -1,   121,   111,   112,
      -1,    -1,    -1,    -1,    48,    -1,    -1,    -1,   121,   745,
     111,   112,    -1,   749,    -1,    59,   752,   753,   111,   112,
     121,    -1,    -1,   124,   125,   761,    -1,    -1,    -1,    -1,
     758,    75,   125,    77,   158,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    93,
      -1,    95,    -1,    -1,   790,   791,    -1,   793,   794,    -1,
     796,   797,    -1,   187,   188,    -1,   802,   191,    -1,    -1,
     590,    -1,   592,   593,   594,   389,    -1,   201,    -1,   203,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   212,    -1,
     214,    -1,   828,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   226,   227,   228,    -1,    -1,    -1,   844,    -1,
      -1,   847,   848,   237,   158,    -1,    -1,   431,    -1,   243,
      -1,   245,    -1,   247,    -1,    -1,   170,    -1,   252,   443,
      -1,    -1,    -1,    -1,   178,   259,   260,   181,   182,    -1,
      -1,    -1,   186,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    -1,    -1,    -1,    -1,   201,   202,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   212,    -1,
     214,    48,    -1,    -1,    -1,    -1,    -1,    -1,   222,    -1,
     304,   305,   226,   227,   228,   309,    -1,    -1,   312,    -1,
      -1,    -1,    -1,    -1,   318,    -1,    -1,    74,    75,   243,
      77,   245,    -1,    -1,    81,    -1,    -1,    -1,   252,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    48,    -1,    -1,    -1,    -1,
     544,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     374,    -1,    75,   377,    77,   379,    -1,   381,    81,    -1,
      -1,   305,    -1,    -1,    -1,    -1,   580,   142,    -1,    -1,
      93,    -1,    -1,    -1,    -1,    -1,    -1,   321,    -1,    -1,
      -1,   158,    -1,    -1,    -1,   409,    -1,   411,   165,   413,
     414,   415,    -1,    -1,   418,   609,   420,    -1,   612,    -1,
     424,   178,    -1,   180,    -1,    -1,   430,   621,   622,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   367,    48,   202,    -1,    -1,   372,    -1,
     374,    -1,    -1,   377,   458,   212,   213,    -1,    -1,   463,
      -1,    -1,    -1,    -1,   388,    -1,    -1,    -1,    -1,    -1,
      74,    -1,   476,    -1,   398,   178,    -1,   180,    -1,   182,
      -1,    -1,    -1,   186,    -1,   409,   243,   411,   245,   413,
     414,   415,    -1,   196,   418,   252,   420,    -1,    -1,   202,
     424,    -1,    -1,   507,    -1,    -1,   430,    -1,    -1,    -1,
     213,    -1,    -1,   437,    -1,    -1,    -1,   121,    -1,   222,
      48,   445,    -1,    -1,    -1,   719,   530,   531,    -1,   723,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   463,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    48,   305,   306,
      -1,    -1,    -1,    -1,   158,    -1,   560,    -1,    -1,   563,
     564,   165,   756,    -1,   206,   207,   208,   209,    -1,    -1,
      -1,   575,    -1,   767,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   507,    -1,    -1,   590,    -1,   592,   593,
     594,    -1,    -1,   121,    -1,    -1,   200,    -1,    48,    -1,
      -1,    -1,    -1,    -1,   608,    -1,    -1,   611,   212,    -1,
     367,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   321,   376,
     377,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     158,   388,    -1,   237,    -1,   392,   560,    -1,    -1,   243,
     244,   245,   246,   247,    -1,    -1,    -1,    -1,   252,    -1,
      -1,    -1,    -1,    -1,   578,   259,   260,   158,    -1,   663,
      -1,    -1,    -1,    -1,    -1,    -1,   590,   424,   592,   593,
     594,   121,    -1,   430,   377,   432,    -1,    -1,    -1,    -1,
     437,    -1,    -1,    -1,   212,   388,    -1,   691,   445,   392,
      -1,    -1,    -1,    -1,    48,   398,    -1,   400,    -1,   200,
      -1,    -1,   405,    -1,    -1,    -1,   463,    -1,   158,   237,
      -1,   212,    -1,    -1,   718,   243,   244,   245,   246,   247,
      -1,    -1,    -1,    -1,   252,    -1,    -1,    -1,    -1,    -1,
      -1,   259,   260,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   243,   244,   245,   246,    -1,    -1,    -1,    -1,
     507,    -1,    -1,    -1,   758,    -1,    -1,    -1,   259,   260,
      -1,    -1,   212,   367,    -1,   689,    -1,   121,    -1,    -1,
     374,    -1,   376,   377,    -1,   379,    -1,   381,   702,    -1,
      -1,    -1,    -1,    -1,   541,    -1,    -1,   237,    -1,    -1,
      -1,    -1,    -1,   243,   244,   245,   246,   247,    -1,    -1,
      -1,    -1,   252,   560,   158,    -1,    -1,    76,    -1,   259,
     260,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     424,   578,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   471,
      -1,   100,    -1,   437,    -1,   759,    -1,    -1,   541,    -1,
      -1,   445,    -1,    -1,    -1,   114,   374,    -1,   117,   377,
      -1,   379,    -1,   381,   458,    -1,    -1,   560,   212,   463,
      -1,    -1,    -1,    -1,    -1,    -1,   367,    -1,    -1,    -1,
      -1,    -1,   476,   374,   577,    -1,    -1,    -1,   379,   582,
     381,    -1,    -1,   237,    -1,    -1,    -1,    -1,    -1,   243,
      -1,   245,    -1,   247,    -1,    -1,   424,    -1,   252,    -1,
      -1,    -1,    -1,   507,    -1,   259,   260,    -1,    -1,   437,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   445,    -1,   188,
      -1,    -1,   191,    -1,   374,    -1,    -1,   377,    -1,   379,
     458,   381,    -1,    -1,    -1,   463,   437,    -1,    -1,    -1,
      -1,    -1,   699,    -1,   445,    -1,    -1,    -1,   476,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   560,   458,    -1,   563,
     564,    -1,   463,   232,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   575,    -1,    -1,   424,   476,    -1,    -1,    -1,   507,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   437,    -1,    -1,
     259,   260,    -1,    -1,    -1,   445,    -1,    -1,    -1,    -1,
      -1,    -1,   759,    -1,    -1,    -1,   507,    -1,   458,    -1,
      -1,    -1,    -1,   463,    -1,    -1,    -1,    -1,   660,   661,
     374,    -1,    -1,   377,    -1,   379,   476,   381,    -1,    -1,
      -1,    -1,   560,    -1,    -1,   563,   564,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   575,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   759,   507,    -1,   560,
      -1,    -1,   563,   564,    -1,    -1,    -1,    -1,    -1,    -1,
     424,    -1,    -1,    -1,   575,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   691,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   738,   739,    -1,   741,
     742,    -1,    -1,    -1,   458,    -1,    -1,    -1,    -1,   463,
     560,    -1,    -1,   563,   564,    -1,    -1,    -1,   387,    -1,
     389,    -1,   476,    -1,    -1,   575,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   777,    -1,   779,    -1,    -1,
      -1,    -1,    -1,    -1,   786,   787,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   507,   758,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   431,   691,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   813,    -1,   815,   443,   817,    -1,   819,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   458,
     691,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   840,    -1,
     842,    -1,    -1,    -1,    -1,    -1,   560,   476,    -1,   563,
     564,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   575,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     758,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   691,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,   758,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,   544,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   575,    -1,   758,    -1,
      -1,   580,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    72,    73,    74,   691,    -1,    -1,
     609,    -1,   119,   612,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,   621,   622,    -1,   132,   133,   134,   135,    -1,
      -1,   630,    -1,    -1,    -1,   103,   104,   144,   145,    -1,
      -1,   640,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   119,   651,   121,    -1,    -1,   124,   125,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,
      -1,    -1,    -1,    -1,   758,    -1,   144,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     719,    -1,    -1,    -1,   723,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,   756,    -1,   758,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   767,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    78,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   145,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   145,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,     1,    -1,     3,
       4,     5,    -1,    -1,   143,   144,   145,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,
      -1,   124,    -1,   126,   127,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,
      79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,   124,
      -1,   126,   127,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,
     145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    -1,    78,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,   144,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    72,    73,    74,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    28,
      -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,    72,    73,
      74,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,   144,   103,
     104,    -1,    -1,    72,    73,    74,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,
     144,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    28,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    72,    73,    74,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,   143,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   103,   104,    -1,    -1,
      -1,    -1,     1,   110,     3,     4,     5,     6,    -1,     8,
       9,    -1,   119,    -1,   121,    -1,    -1,   124,   125,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,    28,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,    -1,    72,
      73,    74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,   104,    -1,    72,    73,    74,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,
      -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,    -1,   103,   104,    -1,    -1,    -1,    -1,
     143,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,     3,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,     3,   121,
      -1,    -1,   124,    -1,    -1,    -1,    -1,   129,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   144,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,     3,    -1,   121,    -1,    -1,   124,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
       3,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
       1,   124,     3,     4,     5,     6,   129,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    72,    73,    74,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,   114,    -1,
      -1,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,   125,
     126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,   114,    -1,    28,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
      -1,    -1,    -1,    -1,    28,    -1,   119,    -1,   121,    -1,
      -1,   124,   125,   126,   127,    72,    73,    74,    -1,   132,
     133,   134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    72,    73,
      74,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,    -1,   130,    -1,   132,   133,   134,   135,   103,
     104,    -1,    -1,    -1,    -1,     1,   110,     3,     4,     5,
       6,    -1,     8,     9,    -1,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,   130,    -1,   132,   133,
     134,   135,    28,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   103,   104,    72,
      73,    74,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,
     126,   127,    -1,    -1,   130,    -1,   132,   133,   134,   135,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
      72,    73,    74,    -1,    -1,    -1,   119,    -1,   121,    -1,
      -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,   104,    -1,    -1,    -1,    -1,     1,   110,     3,
       4,     5,     6,    -1,     8,     9,    -1,   119,    -1,   121,
      -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
     132,   133,   134,   135,    28,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,
      74,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   103,
     104,    72,    73,    74,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,    72,    73,    74,    -1,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,     1,
     110,     3,     4,     5,     6,    -1,     8,     9,    -1,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    28,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,   104,    72,    73,    74,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,    -1,    -1,    -1,    -1,
     132,   133,   134,   135,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,    -1,   124,    -1,    -1,    -1,    -1,   129,    -1,
      -1,   132,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,   125,
      -1,    -1,    -1,   129,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,
     124,   125,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,   124,    -1,    -1,    -1,    -1,   129,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,   129,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,
      -1,   129,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,    -1,
      -1,    -1,    -1,   129,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,
     124,    28,    -1,    -1,    -1,   129,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,
      -1,    -1,   129,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,
     125,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,    -1,   125,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,    -1,    -1,    -1,    -1,   125,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,    -1,    -1,    -1,    -1,   125,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,    -1,   124,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,    -1,   124,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    67,    68,    75,
      76,    80,    83,    84,    86,    88,   101,   111,   112,   113,
     114,   118,   147,   148,   149,   150,   151,   156,   186,   187,
     192,   193,   194,   198,   199,   200,   201,   203,   204,   210,
     218,   219,   237,   268,   144,   151,   156,   124,   124,   122,
       1,   121,   122,   156,   121,   124,   129,   132,   147,   156,
     192,   193,   200,   201,   203,   219,   222,   224,   226,   227,
     229,   230,   231,   234,   124,   144,   150,   151,   156,   193,
     141,     0,   156,   220,   221,   144,   144,     1,     4,     5,
       6,     8,     9,    72,    73,    74,   103,   104,   110,   119,
     121,   124,   126,   127,   132,   133,   134,   135,   149,   156,
     157,   158,   159,   162,   163,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,   178,
     255,   258,   149,   156,   149,   156,   163,   168,   186,   205,
     206,   207,   208,   209,   200,   233,   234,   125,   156,   224,
     226,   235,   236,   237,   130,   149,   177,   181,   124,   156,
     193,   226,   234,   222,   227,   230,   234,   124,   129,   193,
     124,   129,   125,   156,   235,   238,   193,   222,   231,   124,
      69,    79,   124,   126,   143,   145,   152,   153,   154,   155,
     156,   159,   186,   193,   211,   212,   213,   214,   215,   227,
     228,   230,   234,   257,   258,   260,   144,   144,   144,   151,
     156,   181,   142,   131,   145,   220,   220,   124,   163,   124,
     163,   163,   156,   186,   181,   186,   181,   124,   163,   125,
     178,   180,   183,   200,   201,   203,   219,   239,   255,   144,
     144,     7,     8,     9,   124,   128,   129,   156,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,   142,   179,
     165,   121,   136,   137,   133,   134,    10,    11,   168,    12,
      13,   122,   123,    14,    15,   132,   138,   139,    16,    17,
     140,   125,   125,   125,   142,   124,   193,   224,   234,   142,
      11,   123,   131,   200,   234,   125,   125,   125,   131,   130,
     130,   234,   222,   231,   125,   235,   130,   149,   181,   130,
     149,   181,   125,   125,   131,     3,    28,    46,    75,    76,
     125,   195,   196,   197,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    48,    49,    52,    68,
      86,    88,   101,   113,   114,   151,   156,   188,   192,   200,
     202,   204,   210,   218,   186,   228,   121,   124,   156,   186,
     144,   249,   250,   250,   250,   143,   250,   142,   124,   141,
     143,   156,   193,   216,   217,   227,   228,   232,   234,   230,
     234,   145,   215,   131,   143,   193,   230,   143,   143,   211,
     145,   211,   145,   211,   144,   144,   181,   221,   143,   145,
     143,   145,   147,   156,   184,   200,   201,   203,   219,   240,
     124,   129,   193,   223,   225,   234,   156,   189,   192,   200,
     202,   203,   219,   129,   225,   189,   240,   125,   131,   156,
     200,   201,   203,   219,   224,   125,   128,   143,   144,   145,
     159,   160,   177,   185,   192,   200,   201,   203,   219,   242,
     259,   261,   262,   263,   264,   265,   266,   267,   145,   267,
     156,   125,   160,   161,   178,   156,   180,   160,   178,   165,
     165,   165,   166,   166,   167,   167,   168,   168,   168,   170,
     170,   171,   172,   173,   174,   175,   180,   186,   206,   207,
     234,   206,   207,   208,    53,   237,   125,   130,   130,   130,
     130,   156,   125,   124,   125,   131,   196,   151,   156,   124,
     124,   122,   144,   156,   192,   200,   202,   224,   156,   193,
     228,   193,   124,   145,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    78,   143,   156,   180,   182,
     185,   244,   245,   246,   247,   248,   250,   251,   252,   253,
     254,   256,   242,   125,   181,   144,   227,   234,   131,   143,
     141,   198,   193,   227,   230,   212,   230,   145,   145,   145,
     211,   145,   211,   211,   211,   147,   200,   201,   203,   219,
     224,   125,   125,   225,   235,   181,   223,   234,   124,   129,
     223,   122,   129,   156,   192,   200,   202,   203,   219,   225,
     181,   129,   129,   225,   125,   178,   165,   255,   145,   267,
     142,   156,   192,   200,   201,   203,   219,   228,   232,   250,
     131,   143,   143,   262,   264,   265,   145,   145,   125,   131,
     130,   141,   224,   180,   125,   196,   178,   149,   156,   209,
      70,    71,   145,   122,   144,   144,   156,   151,   156,   125,
     181,   141,   124,   124,   124,   244,   124,   156,   143,   143,
     143,   180,   156,   141,   143,   143,   156,   190,   191,   226,
     182,   247,   182,   244,   145,   143,   145,   267,   227,   193,
     217,   227,   234,   181,   227,   145,   145,   145,   145,   125,
     125,   130,   223,   125,   235,   181,   209,   181,   122,   129,
     130,   181,   181,   129,   145,   242,   263,   160,   178,   177,
     125,   125,   125,   125,   123,   250,   250,   209,    70,    71,
     145,    70,    71,   145,   144,   141,   244,   180,   180,   125,
     180,    58,   125,   251,   143,   143,   142,   244,   144,   131,
     143,   142,   145,   227,   234,   193,   227,   141,   125,   130,
     123,   130,   209,   181,   130,   130,   181,    71,   145,    70,
     145,   123,   250,   250,   250,   250,    70,    71,   145,   244,
     125,   125,   244,   125,   124,   244,   125,   251,   181,   145,
     267,   191,   144,   178,   241,   227,   227,   181,   123,   130,
     130,   250,   250,    71,   145,    70,   145,    71,   145,    70,
     145,   250,   250,   244,   244,   244,   180,   244,   125,   180,
     143,   145,   241,   243,   145,   145,   250,   250,   250,   250,
      71,   145,    70,   145,    66,   125,   244,   125,   131,   145,
     145,   145,   145,   145,   250,   250,   244,   143,   244,   145,
     241,   145,   145
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
      case 147: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3829 "type.ec"
	break;
      case 149: /* "type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3838 "type.ec"
	break;
      case 150: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3847 "type.ec"
	break;
      case 151: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3856 "type.ec"
	break;
      case 152: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3865 "type.ec"
	break;
      case 153: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3874 "type.ec"
	break;
      case 154: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3883 "type.ec"
	break;
      case 155: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3892 "type.ec"
	break;
      case 156: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3901 "type.ec"
	break;
      case 157: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3910 "type.ec"
	break;
      case 159: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3919 "type.ec"
	break;
      case 161: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3928 "type.ec"
	break;
      case 163: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3937 "type.ec"
	break;
      case 165: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3946 "type.ec"
	break;
      case 166: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3955 "type.ec"
	break;
      case 167: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3964 "type.ec"
	break;
      case 168: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3973 "type.ec"
	break;
      case 170: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3982 "type.ec"
	break;
      case 171: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3991 "type.ec"
	break;
      case 172: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4000 "type.ec"
	break;
      case 173: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4009 "type.ec"
	break;
      case 174: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4018 "type.ec"
	break;
      case 175: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4027 "type.ec"
	break;
      case 176: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4036 "type.ec"
	break;
      case 177: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4045 "type.ec"
	break;
      case 178: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4054 "type.ec"
	break;
      case 180: /* "expression" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 4063 "type.ec"
	break;
      case 181: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4072 "type.ec"
	break;
      case 182: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4081 "type.ec"
	break;
      case 183: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4090 "type.ec"
	break;
      case 184: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4099 "type.ec"
	break;
      case 185: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4108 "type.ec"
	break;
      case 186: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4117 "type.ec"
	break;
      case 190: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4126 "type.ec"
	break;
      case 191: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4135 "type.ec"
	break;
      case 192: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4144 "type.ec"
	break;
      case 193: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 222 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4153 "type.ec"
	break;
      case 195: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4162 "type.ec"
	break;
      case 196: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 223 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4171 "type.ec"
	break;
      case 197: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 224 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4180 "type.ec"
	break;
      case 198: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 221 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4189 "type.ec"
	break;
      case 199: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4198 "type.ec"
	break;
      case 200: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4207 "type.ec"
	break;
      case 201: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4216 "type.ec"
	break;
      case 202: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4225 "type.ec"
	break;
      case 203: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4234 "type.ec"
	break;
      case 204: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4243 "type.ec"
	break;
      case 205: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 220 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4252 "type.ec"
	break;
      case 206: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4261 "type.ec"
	break;
      case 207: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4270 "type.ec"
	break;
      case 208: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4279 "type.ec"
	break;
      case 211: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4288 "type.ec"
	break;
      case 212: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4297 "type.ec"
	break;
      case 213: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4306 "type.ec"
	break;
      case 214: /* "property" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4315 "type.ec"
	break;
      case 215: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4324 "type.ec"
	break;
      case 216: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4333 "type.ec"
	break;
      case 217: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4342 "type.ec"
	break;
      case 218: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4351 "type.ec"
	break;
      case 219: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4360 "type.ec"
	break;
      case 220: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4369 "type.ec"
	break;
      case 221: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4378 "type.ec"
	break;
      case 222: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4387 "type.ec"
	break;
      case 223: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4396 "type.ec"
	break;
      case 224: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4405 "type.ec"
	break;
      case 225: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4414 "type.ec"
	break;
      case 226: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4423 "type.ec"
	break;
      case 227: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4432 "type.ec"
	break;
      case 228: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4441 "type.ec"
	break;
      case 229: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4450 "type.ec"
	break;
      case 230: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4459 "type.ec"
	break;
      case 231: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4468 "type.ec"
	break;
      case 232: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4477 "type.ec"
	break;
      case 233: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4486 "type.ec"
	break;
      case 234: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 169 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4495 "type.ec"
	break;
      case 235: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4504 "type.ec"
	break;
      case 236: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4513 "type.ec"
	break;
      case 237: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4522 "type.ec"
	break;
      case 238: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4531 "type.ec"
	break;
      case 239: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4540 "type.ec"
	break;
      case 240: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4549 "type.ec"
	break;
      case 241: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4558 "type.ec"
	break;
      case 242: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4567 "type.ec"
	break;
      case 243: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4576 "type.ec"
	break;
      case 244: /* "statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4585 "type.ec"
	break;
      case 245: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4594 "type.ec"
	break;
      case 246: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4603 "type.ec"
	break;
      case 247: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4612 "type.ec"
	break;
      case 248: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4621 "type.ec"
	break;
      case 249: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4630 "type.ec"
	break;
      case 250: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4639 "type.ec"
	break;
      case 251: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4648 "type.ec"
	break;
      case 252: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4657 "type.ec"
	break;
      case 253: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4666 "type.ec"
	break;
      case 254: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4675 "type.ec"
	break;
      case 255: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4684 "type.ec"
	break;
      case 256: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4693 "type.ec"
	break;
      case 258: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4702 "type.ec"
	break;
      case 260: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4711 "type.ec"
	break;
      case 261: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4720 "type.ec"
	break;
      case 262: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4729 "type.ec"
	break;
      case 263: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4738 "type.ec"
	break;
      case 264: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4747 "type.ec"
	break;
      case 265: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4756 "type.ec"
	break;
      case 266: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4765 "type.ec"
	break;
      case 267: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4774 "type.ec"
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
#line 232 "type.y"
    {
      (yyval.specifier) = null;
      DeclClass((yyvsp[(1) - (2)].id)._class, (yyvsp[(1) - (2)].id).string);
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
#line 250 "type.y"
    {
      (yyval.specifier) = null;
   #ifdef PRECOMPILER
      _DeclClass((yyvsp[(1) - (2)].id)._class, (yyvsp[(1) - (2)].id).string);

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
#line 274 "type.y"
    {
      DeclClass((yyvsp[(1) - (2)].id)._class, (yyvsp[(1) - (2)].id).string);
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
#line 313 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 315 "type.y"
    {
   #ifdef PRECOMPILER
      DeclClass((yyvsp[(1) - (2)].id)._class, (yyvsp[(1) - (2)].id).string);
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
#line 341 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 346 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 348 "type.y"
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
#line 365 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 367 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 372 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 377 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 382 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 384 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 389 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 395 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 400 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 402 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 404 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 405 "type.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 407 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 408 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 409 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 411 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 413 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 414 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 420 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 426 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
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

  case 43:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 449 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 478 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 479 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 480 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 481 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 485 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 486 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 487 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 489 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 490 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 492 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 493 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 507 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 508 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 509 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 510 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 511 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 512 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 513 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 518 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 530 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 531 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 536 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 537 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 542 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 550 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 552 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 553 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 558 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 559 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 564 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 569 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 574 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 579 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 584 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 589 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 594 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 595 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 599 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 600 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 601 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 602 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 603 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 604 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 605 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 606 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 607 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 608 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 609 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 613 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 614 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 624 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 625 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 635 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 636 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 640 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 653 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 666 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 667 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 681 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 682 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 692 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 693 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 695 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 703 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 711 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 712 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 713 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 714 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 715 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 716 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 721 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 722 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 724 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 732 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 740 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 741 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 745 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 746 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 750 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 751 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 752 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 754 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 755 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 759 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 760 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 761 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 765 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 766 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 767 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 772 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 773 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 775 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 776 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 780 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 781 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 785 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 786 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 787 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 791 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 792 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 800 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 801 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 807 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 811 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 873 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 882 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 897 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 898 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 909 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 918 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 920 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 946 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 962 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 967 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 968 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 972 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 973 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 977 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 981 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 982 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 989 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 991 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 993 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 995 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1000 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1002 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1004 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1006 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1011 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1013 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1015 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1017 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1032 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1033 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1034 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1038 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1039 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1044 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1046 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1055 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1057 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1064 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1069 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1071 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1073 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1078 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1109 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1111 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1113 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1118 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1126 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1130 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1139 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1141 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1143 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1192 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1194 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1196 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1201 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1203 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1205 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1207 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1209 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1215 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1218 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1220 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1222 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1232 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1234 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1236 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1250 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1252 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1257 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1258 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1262 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1263 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1270 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1274 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1279 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1280 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1281 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1282 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1283 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1295 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1319 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1320 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1330 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1335 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1337 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1339 "type.y"
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

  case 429:

/* Line 1464 of yacc.c  */
#line 1355 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1357 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1379 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1381 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1395 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1397 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1399 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1403 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1404 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1409 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1412 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1416 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1417 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1418 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1422 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1427 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1435 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1440 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1444 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1446 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1452 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1453 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1462 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1463 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1464 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1465 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1469 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1474 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1476 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1481 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1483 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1508 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1510 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1512 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1514 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1519 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1521 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1527 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1529 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1531 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1533 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1539 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1541 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1546 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1550 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1551 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1558 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1567 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1570 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1572 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1577 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1578 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1582 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1583 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8481 "type.ec"
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
#line 1586 "type.y"


