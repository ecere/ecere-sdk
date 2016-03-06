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
     LONG = 295,
     SIGNED = 296,
     UNSIGNED = 297,
     FLOAT = 298,
     DOUBLE = 299,
     CONST = 300,
     VOLATILE = 301,
     VOID = 302,
     VALIST = 303,
     STRUCT = 304,
     UNION = 305,
     ENUM = 306,
     ELLIPSIS = 307,
     CASE = 308,
     DEFAULT = 309,
     IF = 310,
     SWITCH = 311,
     WHILE = 312,
     DO = 313,
     FOR = 314,
     GOTO = 315,
     CONTINUE = 316,
     BREAK = 317,
     RETURN = 318,
     IFX = 319,
     ELSE = 320,
     CLASS = 321,
     THISCLASS = 322,
     CLASS_NAME = 323,
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
#define YYFINAL  100
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9339

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  146
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  502
/* YYNRULES -- Number of states.  */
#define YYNSTATES  861

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
     675,   677,   679,   681,   683,   685,   687,   689,   691,   696,
     701,   706,   708,   710,   712,   714,   716,   718,   720,   722,
     724,   726,   728,   730,   732,   734,   736,   738,   740,   742,
     744,   746,   748,   750,   755,   760,   765,   767,   773,   778,
     783,   787,   793,   800,   806,   812,   817,   824,   827,   830,
     834,   838,   840,   843,   845,   848,   850,   852,   854,   858,
     862,   866,   870,   872,   876,   878,   880,   882,   885,   889,
     891,   895,   905,   915,   923,   931,   937,   948,   959,   968,
     977,   984,   993,  1002,  1009,  1016,  1021,  1031,  1041,  1049,
    1057,  1063,  1067,  1070,  1073,  1076,  1078,  1081,  1083,  1085,
    1087,  1091,  1093,  1096,  1099,  1103,  1109,  1112,  1115,  1120,
    1126,  1134,  1142,  1148,  1150,  1154,  1156,  1160,  1164,  1167,
    1171,  1175,  1179,  1184,  1189,  1192,  1196,  1200,  1205,  1209,
    1212,  1216,  1220,  1225,  1227,  1229,  1232,  1235,  1238,  1242,
    1244,  1246,  1249,  1252,  1255,  1259,  1261,  1264,  1268,  1271,
    1273,  1277,  1282,  1286,  1291,  1293,  1296,  1299,  1303,  1307,
    1310,  1314,  1318,  1321,  1323,  1325,  1328,  1331,  1333,  1336,
    1339,  1343,  1347,  1349,  1352,  1354,  1357,  1360,  1364,  1366,
    1370,  1372,  1376,  1379,  1382,  1385,  1389,  1391,  1393,  1395,
    1399,  1401,  1404,  1406,  1409,  1411,  1415,  1420,  1422,  1424,
    1426,  1430,  1432,  1434,  1436,  1438,  1440,  1442,  1446,  1451,
    1455,  1457,  1460,  1462,  1465,  1468,  1470,  1472,  1475,  1477,
    1480,  1484,  1486,  1489,  1495,  1503,  1509,  1515,  1523,  1530,
    1538,  1543,  1549,  1554,  1558,  1561,  1564,  1567,  1571,  1573,
    1579,  1584,  1590,  1595,  1600,  1604,  1609,  1613,  1617,  1620,
    1623,  1626,  1629,  1632,  1635,  1638,  1641,  1644,  1648,  1650,
    1652,  1656,  1659,  1661,  1663,  1666,  1669,  1671,  1674,  1676,
    1678,  1681,  1683
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
      76,    -1,    75,    -1,    45,    -1,   195,    -1,   195,   124,
     180,   125,    -1,   196,    -1,   197,   196,    -1,   197,   131,
     196,    -1,   194,   124,   124,   197,   125,   125,    -1,   194,
     124,   124,   125,   125,    -1,   193,    -1,    45,    -1,    46,
      -1,   199,    -1,    47,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    39,    -1,    48,    -1,    40,
      -1,    43,    -1,    44,    -1,    41,    -1,    42,    -1,    86,
      -1,   114,    -1,   113,    -1,   204,    -1,   218,    -1,   149,
      -1,    88,   124,   178,   125,    -1,   101,   124,   149,   125,
      -1,   101,   124,   156,   125,    -1,    67,    -1,    83,    -1,
      84,    -1,    47,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    39,    -1,    48,    -1,    40,    -1,
      43,    -1,    44,    -1,    41,    -1,    42,    -1,    86,    -1,
     114,    -1,   113,    -1,   204,    -1,   218,    -1,   151,    -1,
      88,   124,   178,   125,    -1,   101,   124,   149,   125,    -1,
     101,   124,   156,   125,    -1,    67,    -1,   210,   156,   144,
     211,   145,    -1,   210,   144,   211,   145,    -1,   210,   156,
     144,   145,    -1,   210,   144,   145,    -1,   210,   150,   144,
     211,   145,    -1,   210,   193,   156,   144,   211,   145,    -1,
     210,   193,   144,   211,   145,    -1,   210,   193,   156,   144,
     145,    -1,   210,   193,   144,   145,    -1,   210,   193,   151,
     144,   211,   145,    -1,   210,   156,    -1,   210,   151,    -1,
     210,   193,   156,    -1,   210,   193,   151,    -1,   186,    -1,
     186,   224,    -1,   186,    -1,   186,   224,    -1,   168,    -1,
     207,    -1,   206,    -1,   156,   142,   207,    -1,   156,   142,
     206,    -1,   205,   142,   207,    -1,   205,   142,   206,    -1,
     208,    -1,   209,   131,   208,    -1,    49,    -1,    50,    -1,
     215,    -1,   211,   215,    -1,   159,   142,   242,    -1,   212,
      -1,   213,   131,   212,    -1,    69,   188,   156,   144,    70,
     250,    71,   250,   145,    -1,    69,   188,   156,   144,    71,
     250,    70,   250,   145,    -1,    69,   188,   156,   144,    70,
     250,   145,    -1,    69,   188,   156,   144,    71,   250,   145,
      -1,    69,   188,   156,   144,   145,    -1,    69,   188,   224,
     156,   144,    70,   250,    71,   250,   145,    -1,    69,   188,
     224,   156,   144,    71,   250,    70,   250,   145,    -1,    69,
     188,   224,   156,   144,    70,   250,   145,    -1,    69,   188,
     224,   156,   144,    71,   250,   145,    -1,    69,   188,   224,
     156,   144,   145,    -1,    69,   188,   144,    70,   250,    71,
     250,   145,    -1,    69,   188,   144,    71,   250,    70,   250,
     145,    -1,    69,   188,   144,    70,   250,   145,    -1,    69,
     188,   144,    71,   250,   145,    -1,    69,   188,   144,   145,
      -1,    69,   188,   224,   144,    70,   250,    71,   250,   145,
      -1,    69,   188,   224,   144,    71,   250,    70,   250,   145,
      -1,    69,   188,   224,   144,    70,   250,   145,    -1,    69,
     188,   224,   144,    71,   250,   145,    -1,    69,   188,   224,
     144,   145,    -1,   186,   216,   143,    -1,   186,   143,    -1,
     258,   143,    -1,   257,   143,    -1,   260,    -1,   213,   143,
      -1,   214,    -1,   143,    -1,   217,    -1,   216,   131,   217,
      -1,   232,    -1,   232,   198,    -1,   141,   181,    -1,   232,
     141,   181,    -1,   232,   141,   181,   141,   181,    -1,    51,
     156,    -1,    51,   151,    -1,    51,   144,   220,   145,    -1,
      51,   156,   144,   220,   145,    -1,    51,   156,   144,   220,
     143,   211,   145,    -1,    51,   151,   144,   220,   143,   211,
     145,    -1,    51,   151,   144,   220,   145,    -1,   221,    -1,
     220,   131,   221,    -1,   156,    -1,   156,   142,   181,    -1,
     124,   224,   125,    -1,   129,   130,    -1,   129,   181,   130,
      -1,   129,   149,   130,    -1,   222,   129,   130,    -1,   222,
     129,   181,   130,    -1,   222,   129,   149,   130,    -1,   124,
     125,    -1,   124,   235,   125,    -1,   222,   124,   125,    -1,
     222,   124,   235,   125,    -1,   124,   225,   125,    -1,   124,
     125,    -1,   124,   235,   125,    -1,   223,   124,   125,    -1,
     223,   124,   235,   125,    -1,   234,    -1,   222,    -1,   234,
     222,    -1,   193,   234,    -1,   193,   222,    -1,   193,   234,
     222,    -1,   234,    -1,   223,    -1,   234,   223,    -1,   193,
     234,    -1,   193,   223,    -1,   193,   234,   223,    -1,   231,
      -1,   234,   231,    -1,   193,   234,   231,    -1,   226,   193,
      -1,   156,    -1,   124,   226,   125,    -1,   227,   129,   181,
     130,    -1,   227,   129,   130,    -1,   227,   129,   149,   130,
      -1,   230,    -1,   234,   230,    -1,   193,   230,    -1,   193,
     234,   230,    -1,   234,   193,   230,    -1,   227,   124,    -1,
     229,   235,   125,    -1,   229,   238,   125,    -1,   229,   125,
      -1,   230,    -1,   227,    -1,   193,   230,    -1,   193,   227,
      -1,   227,    -1,   234,   227,    -1,   193,   227,    -1,   193,
     234,   227,    -1,   234,   193,   227,    -1,   200,    -1,   233,
     200,    -1,   121,    -1,   121,   233,    -1,   121,   234,    -1,
     121,   233,   234,    -1,   236,    -1,   236,   131,    52,    -1,
     237,    -1,   236,   131,   237,    -1,   186,   226,    -1,   186,
     224,    -1,   186,   132,    -1,   186,   132,   226,    -1,   187,
      -1,    66,    -1,   156,    -1,   238,   131,   156,    -1,   183,
      -1,   183,   224,    -1,   184,    -1,   184,   224,    -1,   178,
      -1,   144,   243,   145,    -1,   144,   243,   131,   145,    -1,
     177,    -1,   160,    -1,   241,    -1,   243,   131,   241,    -1,
     245,    -1,   250,    -1,   251,    -1,   252,    -1,   253,    -1,
     254,    -1,   156,   141,   244,    -1,    53,   181,   141,   244,
      -1,    54,   141,   244,    -1,   182,    -1,   246,   182,    -1,
     244,    -1,   247,   244,    -1,   247,   182,    -1,   247,    -1,
     246,    -1,   246,   247,    -1,   144,    -1,   144,   145,    -1,
     249,   248,   145,    -1,   143,    -1,   180,   143,    -1,    55,
     124,   180,   125,   244,    -1,    55,   124,   180,   125,   244,
      65,   244,    -1,    56,   124,   180,   125,   244,    -1,    57,
     124,   180,   125,   244,    -1,    58,   244,    57,   124,   180,
     125,   143,    -1,    59,   124,   251,   251,   125,   244,    -1,
      59,   124,   251,   251,   180,   125,   244,    -1,    57,   124,
     125,   244,    -1,    59,   124,   251,   125,   244,    -1,    59,
     124,   125,   244,    -1,    60,   156,   143,    -1,    61,   143,
      -1,    62,   143,    -1,    63,   143,    -1,    63,   180,   143,
      -1,     5,    -1,   185,   156,   144,   267,   145,    -1,   185,
     156,   144,   145,    -1,   186,   156,   144,   267,   145,    -1,
     186,   156,   144,   145,    -1,   149,   144,   267,   145,    -1,
     149,   144,   145,    -1,   156,   144,   267,   145,    -1,   156,
     144,   145,    -1,   144,   267,   145,    -1,   144,   145,    -1,
     152,   250,    -1,   155,   250,    -1,   155,   143,    -1,   153,
     250,    -1,   154,   250,    -1,   185,   228,    -1,   185,   232,
      -1,   261,   250,    -1,   159,   142,   242,    -1,   242,    -1,
     263,    -1,   264,   131,   263,    -1,   264,   143,    -1,   265,
      -1,   262,    -1,   266,   265,    -1,   266,   262,    -1,   143,
      -1,   266,   143,    -1,   266,    -1,   264,    -1,   266,   264,
      -1,   237,    -1,   237,   141,   181,    -1
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
     828,   829,   830,   831,   835,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   847,   848,   849,   850,
     851,   852,   853,   854,   855,   856,   857,   862,   863,   864,
     865,   866,   869,   870,   871,   872,   873,   878,   879,   882,
     884,   889,   890,   895,   896,   907,   911,   913,   914,   916,
     917,   941,   956,   957,   961,   962,   966,   967,   971,   975,
     976,   980,   982,   984,   986,   988,   991,   993,   995,   997,
     999,  1002,  1004,  1006,  1008,  1010,  1013,  1015,  1017,  1019,
    1021,  1026,  1027,  1028,  1029,  1030,  1031,  1032,  1033,  1037,
    1039,  1044,  1046,  1048,  1050,  1052,  1057,  1058,  1062,  1064,
    1065,  1066,  1067,  1071,  1073,  1078,  1080,  1086,  1088,  1090,
    1092,  1094,  1096,  1098,  1100,  1102,  1104,  1106,  1111,  1113,
    1115,  1117,  1119,  1124,  1125,  1126,  1127,  1128,  1129,  1133,
    1134,  1135,  1136,  1137,  1138,  1184,  1185,  1187,  1189,  1194,
    1196,  1198,  1200,  1202,  1207,  1208,  1211,  1213,  1215,  1221,
    1225,  1227,  1229,  1234,  1235,  1236,  1238,  1243,  1244,  1245,
    1246,  1247,  1251,  1252,  1256,  1257,  1258,  1259,  1263,  1264,
    1268,  1269,  1273,  1274,  1275,  1276,  1277,  1288,  1313,  1314,
    1318,  1319,  1323,  1324,  1328,  1330,  1332,  1348,  1350,  1372,
    1374,  1379,  1380,  1381,  1382,  1383,  1384,  1388,  1390,  1392,
    1397,  1398,  1402,  1403,  1406,  1410,  1411,  1412,  1416,  1420,
    1428,  1433,  1434,  1438,  1439,  1440,  1444,  1445,  1446,  1447,
    1449,  1450,  1451,  1455,  1456,  1457,  1458,  1459,  1463,  1467,
    1469,  1474,  1476,  1501,  1503,  1505,  1507,  1512,  1514,  1518,
    1520,  1522,  1524,  1526,  1532,  1534,  1539,  1544,  1545,  1549,
    1551,  1556,  1561,  1562,  1563,  1564,  1565,  1566,  1570,  1571,
    1572,  1576,  1577
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
  "SHORT", "INT", "UINT", "INT64", "INT128", "LONG", "SIGNED", "UNSIGNED",
  "FLOAT", "DOUBLE", "CONST", "VOLATILE", "VOID", "VALIST", "STRUCT",
  "UNION", "ENUM", "ELLIPSIS", "CASE", "DEFAULT", "IF", "SWITCH", "WHILE",
  "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "IFX", "ELSE",
  "CLASS", "THISCLASS", "CLASS_NAME", "PROPERTY", "SETPROP", "GETPROP",
  "NEWOP", "RENEW", "DELETE", "EXT_DECL", "EXT_STORAGE", "IMPORT",
  "DEFINE", "VIRTUAL", "ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT",
  "ANY_OBJECT", "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH",
  "STOPWATCHING", "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER",
  "CLASS_NO_EXPANSION", "CLASS_FIXED", "ISPROPSET",
  "CLASS_DEFAULT_PROPERTY", "PROPERTY_CATEGORY", "CLASS_DATA",
  "CLASS_PROPERTY", "SUBCLASS", "NAMESPACE", "NEW0OP", "RENEW0", "VAARG",
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "ALIGNOF",
  "ATTRIB_DEP", "__ATTRIB", "BOOL", "_BOOL", "_COMPLEX", "_IMAGINARY",
  "RESTRICT", "THREAD", "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF", "'*'",
  "'<'", "'>'", "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','",
  "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "guess_type", "real_guess_type",
  "type", "base_strict_type", "strict_type",
  "class_function_definition_start",
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
     201,   201,   201,   201,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   204,   204,   204,
     204,   205,   205,   206,   206,   207,   208,   208,   208,   208,
     208,   208,   209,   209,   210,   210,   211,   211,   212,   213,
     213,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   215,   215,   215,   215,   215,   215,   215,   215,   216,
     216,   217,   217,   217,   217,   217,   218,   218,   219,   219,
     219,   219,   219,   220,   220,   221,   221,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   223,   223,
     223,   223,   223,   224,   224,   224,   224,   224,   224,   225,
     225,   225,   225,   225,   225,   226,   226,   226,   226,   227,
     227,   227,   227,   227,   228,   228,   228,   228,   228,   229,
     230,   230,   230,   231,   231,   231,   231,   232,   232,   232,
     232,   232,   233,   233,   234,   234,   234,   234,   235,   235,
     236,   236,   237,   237,   237,   237,   237,   237,   238,   238,
     239,   239,   240,   240,   241,   241,   241,   242,   242,   243,
     243,   244,   244,   244,   244,   244,   244,   245,   245,   245,
     246,   246,   247,   247,   247,   248,   248,   248,   249,   250,
     250,   251,   251,   252,   252,   252,   253,   253,   253,   253,
     253,   253,   253,   254,   254,   254,   254,   254,   255,   256,
     256,   257,   257,   258,   258,   258,   258,   259,   259,   260,
     260,   260,   260,   260,   261,   261,   262,   263,   263,   264,
     264,   265,   266,   266,   266,   266,   266,   266,   267,   267,
     267,   268,   268
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
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
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
       0,    17,     7,   191,   192,   193,   194,   195,   220,   221,
     222,   223,   224,   225,   227,   230,   231,   228,   229,   216,
     217,   219,   226,   294,   295,     0,   417,   241,   197,   198,
     200,   242,   243,   232,     0,     0,   201,   202,   234,   233,
     196,   155,   162,   237,     8,     5,     0,   161,   416,   149,
     215,     0,   199,   218,   151,   153,   157,   235,     0,   236,
     159,   501,     0,     0,   337,   336,     0,     0,     0,     4,
       2,     3,     6,   404,     0,     0,   414,   156,   379,   150,
     215,   152,   154,   158,   160,   364,   413,   412,   394,     0,
     393,   375,   363,     0,     0,     8,   278,   277,     0,     0,
       1,   345,     0,   343,     0,     0,    36,    22,   468,     0,
       0,     0,     0,     0,    66,     0,     0,     0,    23,    61,
       0,    64,     0,    60,    62,    63,    65,     0,    20,    37,
      18,    59,    58,    67,     0,    69,    73,    76,    80,     0,
      85,    88,    90,    92,    94,    96,    98,   100,     0,    24,
      21,     0,     0,   237,    20,    67,   285,   283,     0,   287,
     286,   292,     0,   402,   405,   406,   354,     0,     0,     0,
       0,   408,   410,   348,     0,   116,     0,     0,   379,     0,
     415,     0,   367,   396,   395,   366,     0,     0,   378,   389,
       0,   392,     0,     0,     0,     0,   365,   376,     0,     0,
       0,     0,     0,   328,   270,     0,     0,     0,     0,    20,
       0,     0,   215,     0,   299,     0,   327,   296,     0,    12,
     384,     0,     0,    21,   325,     0,     0,     0,   280,   279,
     502,     0,     0,   338,     0,     0,     0,    54,     0,    51,
      52,     0,     0,     0,     0,     0,     0,    56,    27,   114,
       0,   420,   121,   123,   127,   125,     0,    25,     0,     0,
       0,    44,    45,     0,     0,     0,    42,   104,   105,   106,
     107,   108,   109,   110,   111,   112,   113,   103,     0,    53,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     238,   239,   240,     0,     0,   215,   284,   363,     0,    10,
       9,     0,   403,   407,   347,   380,   355,     0,   350,   349,
       0,   368,   377,   356,     0,   351,     0,     0,   382,     0,
       0,   390,   391,     0,   203,   204,   207,   206,   205,     0,
     208,   210,     0,   245,   246,   247,   248,   249,   250,   252,
     255,   256,   253,   254,   244,   251,     0,   266,   257,     0,
       0,   259,   258,   262,   169,     0,   163,   165,   167,   260,
       0,   261,     0,    16,    61,     0,    20,     0,   448,     0,
     479,   482,   483,   481,   480,     0,     0,     0,   322,   379,
     215,     0,   329,   397,    11,   331,     0,   386,     0,   268,
     297,     0,   326,     0,   385,   324,   323,     0,   269,     0,
     275,     0,     0,     0,   346,   344,     0,   342,     0,   339,
     133,    20,   422,   129,   131,   137,   135,     0,     0,     0,
     215,   370,     0,   369,   183,     0,   173,   175,   177,   179,
     181,     0,     0,     0,     0,    19,     0,     0,   122,   124,
     128,   126,   421,     0,     0,   496,     0,   474,    59,   428,
     427,     0,   139,   141,   143,   147,   145,   488,    46,     0,
     493,   489,   499,   492,     0,     0,   476,     0,    43,    39,
      48,     0,    47,    41,     0,   102,   101,    70,    71,    72,
      74,    75,    77,    78,    83,    84,    82,    86,    87,    89,
      91,    93,    95,    97,     0,   283,   289,   288,   366,   291,
     290,   293,   409,   411,   357,   353,   352,   383,   381,   419,
     214,     0,     0,     0,   211,   337,   336,     0,     0,     0,
       0,   170,   164,   166,   168,     0,   277,     0,    15,   215,
       0,   449,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   451,    20,     0,   440,     0,   442,
     431,     0,     0,     0,   432,   433,   434,   435,   436,     0,
     298,    13,   333,     0,   399,     0,     0,   321,     0,   332,
       0,   398,   387,   300,   388,   271,   267,   273,     0,   274,
       0,     0,     0,   134,   130,   132,   138,   136,   423,    55,
     359,     0,     0,     0,   373,   372,     0,     0,   371,     0,
       0,   184,   174,   176,   178,   180,   182,     0,     0,     0,
       0,     0,    57,   115,    68,    26,   478,     0,     0,   379,
     140,   142,   144,   148,   146,   484,   485,   486,     0,   491,
     497,   495,   500,   494,   473,   475,    40,     0,    38,     0,
     284,     0,   213,   212,     0,     0,     0,     0,     0,     0,
     315,     0,     0,     0,     0,   280,   279,    14,     0,     0,
       0,     0,     0,     0,     0,     0,   464,   465,   466,     0,
       0,     0,   452,   117,   379,     0,   187,   189,   441,     0,
     444,   443,   450,   119,   472,     0,   400,     0,   330,   397,
       0,   334,   401,   276,   272,   341,   340,   358,   360,    29,
     374,   361,     0,     0,     0,     0,     0,     0,    31,     0,
       0,     0,   477,   487,   490,    50,    49,    99,   209,   263,
     264,   265,   171,     0,     0,     0,     0,     0,   305,     0,
       0,   320,     0,     0,   439,     0,     0,     0,     0,     0,
       0,     0,   463,   467,     0,   437,     0,     0,   118,     0,
     471,   399,     0,     0,   398,     0,   362,    28,   185,    33,
       0,     0,    30,    35,     0,     0,   313,     0,   314,   172,
       0,     0,     0,     0,     0,     0,   310,   438,     0,     0,
     460,     0,     0,   462,     0,     0,     0,   470,     0,   188,
       0,   424,   190,   400,   401,   335,   186,    32,    34,     0,
       0,     0,   303,     0,   304,     0,   318,     0,   319,     0,
       0,   453,   455,   456,     0,   461,     0,     0,   120,   469,
     429,     0,   311,   312,     0,     0,     0,     0,     0,   308,
       0,   309,     0,     0,   458,     0,     0,   425,   301,   302,
     316,   317,     0,     0,   454,   457,   459,   426,   430,   306,
     307
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    41,    42,   127,    44,    45,   205,   206,   207,   208,
     128,   129,   130,   131,   459,   481,   132,   155,   134,   135,
     136,   137,   138,   139,   140,   141,   142,   143,   144,   145,
     146,   147,   249,   278,   556,   176,   690,   251,   422,   461,
     211,    48,   365,   435,   685,   686,    49,    50,    51,   340,
     341,   342,    52,    53,    54,    55,   438,    56,    57,   158,
     159,   160,   161,   162,    58,   213,   214,   215,   216,   217,
     391,   392,    59,    60,   102,   103,    85,   431,   168,   432,
     169,   218,   219,    89,   220,    91,   395,   164,   221,   170,
     171,   172,   194,   256,   427,   802,   467,   831,   559,   560,
     561,   562,   563,   379,   564,   565,   566,   567,   568,   149,
     569,   222,   150,   468,   224,   469,   470,   471,   472,   473,
     474,   475,    62
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -765
static const yytype_int16 yypact[] =
{
    8948,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,  -765,    53,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,   -84,   -17,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,    11,  -765,    69,  7351,  -765,  -765,
    -765,    24,  -765,  -765,  -765,  -765,  -765,  -765,    15,  -765,
    -765,    -6,   141,   166,    21,    34,  7061,    81,  6291,  -765,
    -765,  -765,  -765,   618,  7456,  6705,   837,  -765,   259,  -765,
     165,  -765,  -765,  -765,  -765,   396,  -765,   399,   427,  8366,
    -765,  -765,   717,   173,  3521,   -69,  -765,   155,    74,  7061,
    -765,   177,   -62,  -765,   166,   166,  -765,  -765,  -765,  7102,
    7210,  7210,  9039,  7061,  -765,  9039,  7061,  7243,  -765,  -765,
    6426,  -765,   323,  -765,  -765,  -765,  -765,   200,    76,  -765,
    -765,   846,  -765,  1068,  7061,  -765,   -15,   383,   490,  7061,
     278,    72,   255,   268,   258,   416,     5,  -765,   309,  -765,
    -765,   332,    26,   200,   117,  -765,   490,  6169,   294,  -765,
    -765,  -765,   126,  -765,   618,  -765,  -765,   566,   341,   419,
     345,   366,  -765,  -765,   -14,  -765,   388,   837,  -765,    98,
     399,   987,   396,   427,  -765,   717,  8465,  6738,  -765,  -765,
    6846,  -765,   365,   425,    -7,    32,   396,  -765,   298,  9130,
    8663,  6649,  9039,  -765,  -765,   410,   410,   410,   443,    61,
     469,  5937,    98,  3648,  -765,   135,  -765,  -765,   427,  -765,
    -765,   987,   420,   423,  -765,  5538,  3775,  3902,   424,   426,
    -765,  7061,   166,  -765,   226,   403,  6426,  -765,  6879,  -765,
    -765,   259,  7660,  9221,  7762,  9221,  6426,  -765,  -765,  -765,
     151,  8165,  -765,  -765,  -765,  -765,   447,   446,  2661,  2806,
     166,  -765,  -765,  5231,   166,  7061,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  5266,  -765,
    7061,  7061,  7061,  7061,  7061,  7061,  7061,   490,  7061,  7061,
    -765,  7061,  7061,  7061,  7061,  7061,  7061,  7061,  7061,  7061,
    -765,  -765,  -765,  6291,  7558,   225,   435,   428,  6291,  -765,
    -765,  6291,  -765,  -765,  -765,  -765,  -765,  8857,  -765,  -765,
     987,   396,  -765,  -765,   457,  -765,   154,   459,  -765,   195,
     466,  -765,  -765,   166,  -765,  -765,  -765,  -765,  -765,   474,
     484,  -765,   277,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,  -765,  -765,  -765,    81,  -765,  -765,   486,
     491,  -765,  -765,  -765,   492,  5820,  -765,  -765,  -765,  -765,
     556,  -765,  8663,  -765,   618,  6561,    63,  8760,   473,  5045,
    -765,  -765,  -765,  -765,  -765,  5266,   634,  7061,  -765,   152,
      98,   207,  -765,   427,  -765,   303,   987,  -765,    32,  -765,
    -765,   819,  -765,    32,  -765,  -765,  -765,  4029,  -765,  4156,
    -765,  4283,  5538,  4410,  -765,  -765,  5538,  -765,  5538,  -765,
    -765,    61,  8165,  -765,  -765,  -765,  -765,   497,  8267,  7061,
     224,   499,   495,   503,   511,  7966,  -765,  -765,  -765,  -765,
    -765,  7061,   509,  8068,   518,  -765,  7061,   166,  -765,  -765,
    -765,  -765,  -765,  7061,   323,  -765,  2951,  -765,   506,  -765,
    -765,  8663,  -765,  -765,  -765,  -765,  -765,  -765,  -765,   410,
    -765,  -765,   251,  -765,  3096,   512,  -765,   513,  -765,  -765,
    -765,   187,  -765,  -765,   412,  -765,  -765,  -765,  -765,  -765,
     -15,   -15,   383,   383,   490,   490,   490,   278,   278,    72,
     255,   268,   258,   416,   106,  7864,  -765,  -765,   428,  -765,
    -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,  7061,   526,   600,  -765,  -765,  -765,  7061,    81,  6291,
     -16,   -12,  -765,  -765,  -765,    85,  -765,    81,  -765,    98,
     535,  -765,  7061,   525,   546,   548,   549,  5189,   550,   166,
     536,   539,  5703,   166,  -765,    17,   286,  -765,  6053,  -765,
    -765,  2226,  2371,   538,  -765,  -765,  -765,  -765,  -765,   542,
    -765,  -765,  -765,  3241,   427,    32,   344,  -765,  7061,  -765,
      32,   427,  -765,  -765,  -765,  -765,  -765,  -765,  4537,  -765,
    4664,  4791,  4918,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,   561,   567,   569,   499,   503,  8564,  7061,   499,  6291,
    7061,   579,  -765,  -765,  -765,  -765,  -765,   577,   578,  7061,
    7061,   584,  -765,  -765,  -765,  -765,  -765,   562,  5266,   166,
    -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  5266,  -765,
    -765,  -765,   251,  -765,  -765,  -765,  -765,  5266,  -765,  7061,
    -765,   253,  -765,  -765,   590,   592,    28,   146,   410,   410,
    -765,  6291,   -11,    -9,   580,  -765,  -765,  -765,   582,  5189,
    7061,  7061,  6920,   664,  5595,   583,  -765,  -765,  -765,   306,
     591,  5189,  -765,  -765,    90,   310,  -765,   662,  -765,  2516,
    -765,  -765,  -765,  -765,  -765,   587,   427,    98,  -765,   611,
     987,   603,   427,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
     499,  -765,   616,   619,   307,   622,  6291,  7061,  -765,   624,
     630,  7061,  -765,  -765,  -765,  -765,  -765,  -765,  -765,  -765,
    -765,  -765,  -765,   -20,   -32,   350,   410,   410,  -765,   410,
     410,  -765,   222,  5189,  -765,   302,   321,  5189,   367,   637,
    5189,  5669,  -765,  -765,  7061,  -765,  3386,   837,  -765,  5403,
    -765,   611,    32,    32,   611,  7061,  -765,  -765,  -765,  -765,
     360,   639,  -765,  -765,   640,   410,  -765,   410,  -765,  -765,
     162,   -28,   185,   -26,   410,   410,  -765,  -765,  5189,  5189,
    -765,  5189,  7061,  -765,  5189,  7028,   605,  -765,   626,  -765,
    5403,  -765,  -765,   611,   611,  -765,  -765,  -765,  -765,   627,
     631,   410,  -765,   410,  -765,   410,  -765,   410,  -765,   197,
      -5,   702,  -765,  -765,   377,  -765,  5189,   402,  -765,  -765,
    -765,   164,  -765,  -765,   632,   633,   638,   641,   410,  -765,
     410,  -765,  5189,   636,  -765,  5189,  2042,  -765,  -765,  -765,
    -765,  -765,   642,   645,  -765,  -765,  -765,  -765,  -765,  -765,
    -765
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -765,   149,  -765,   815,   726,    89,  -765,  -765,  -765,  -765,
       0,  -765,  -765,   555,  -255,  -765,  -765,   204,  -765,  -118,
     311,   316,   -36,  -765,   312,   481,   500,   489,   501,   498,
    -765,  1461,   -47,  -765,    64,   465,  -358,  -765,  -765,  -373,
     336,  -765,  -765,   557,  -765,    43,   460,  1077,  -765,  -765,
    -309,  -765,   413,  -765,  1310,  1539,  -185,  1351,  -195,  -765,
     181,   257,   505,  -512,  -171,   -54,   408,  -765,  -765,  -128,
    -765,   235,  -172,  1559,   508,   585,   -77,  -381,   -34,  -220,
     -46,   -35,  -174,  -765,  1280,   -85,   357,  -765,  1339,   -87,
    -765,    10,  -765,  -765,   573,  -764,  -374,  -765,   288,  -765,
    -765,   260,  -765,  -765,  1318,  -640,  -765,  -765,  -765,  -117,
    -765,  -765,   394,  -765,  -765,  -765,   353,   192,   359,   362,
    -765,  -250,  -765
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -499
static const yytype_int16 yytable[] =
{
      46,    87,   193,   182,   369,   257,   558,   197,   480,   477,
      61,   570,    88,    86,   368,   196,   279,   657,     1,   148,
       1,   557,   298,   485,   442,    65,   373,   371,   370,     1,
     180,     1,   156,   524,   751,     1,   830,   394,   777,    88,
      66,    88,   813,     2,   817,   183,    72,    78,   369,   604,
     369,   775,   608,    68,   658,   659,     1,    88,    97,   736,
     737,   739,   740,   101,     1,   840,     1,   152,   154,   232,
      69,   371,     1,   371,   167,   225,   178,     1,    72,     1,
     178,     2,   858,   233,     1,   400,   292,   293,     1,   192,
      28,    29,   178,     1,   209,    30,   197,   714,   229,   324,
     322,     1,     2,   287,   101,   101,   280,    67,   321,     2,
     661,   795,   241,   778,    64,   241,   318,   814,   332,   818,
       1,   281,   282,   306,   333,   776,    36,    37,    72,   660,
     258,   266,   662,    68,   738,    99,   741,   309,  -379,  -379,
     841,   100,    88,  -379,   183,   299,    88,    96,    93,   735,
      88,   302,    72,   731,    72,     1,   177,   241,   681,    94,
     183,   259,   487,   488,   489,   104,    88,    72,     1,     1,
     369,   407,   409,   411,  -379,  -379,   393,   178,   105,   178,
     534,   178,    70,    71,   250,   178,    46,   228,   558,   558,
      70,    71,    72,   371,   370,   178,    77,    63,   538,   364,
      78,   376,   241,   688,   770,   259,   627,   259,   601,    72,
     266,   389,   178,   209,   653,   617,   482,   452,   227,    73,
     259,   178,   177,   621,   710,   209,   209,   209,   182,   663,
     196,   486,   101,   811,   756,   322,   421,   446,    70,    71,
     369,    72,   241,   434,   241,   434,   421,   649,   369,   310,
     614,   447,   494,   495,   723,   496,   815,   311,   614,   303,
     478,   259,     1,   371,   483,   250,   401,   156,   838,   732,
     133,   371,   156,    70,    71,   156,   445,   311,   402,   400,
     334,   400,   446,   400,   515,    88,    73,   635,   363,    74,
     288,   289,   784,   785,    75,   846,   573,   198,   258,   226,
     250,   334,   250,   421,    46,   335,    77,   812,   421,   847,
     250,   154,   646,   237,   239,   240,   558,    46,   647,   231,
     178,   247,   336,   695,   133,   517,   335,   513,   108,   484,
     816,   535,   363,   519,   363,   624,    47,   625,   576,   258,
      88,   602,   839,   336,   258,    73,    73,     1,   428,   304,
     577,    88,   337,   338,    75,   574,   526,   232,   588,   590,
      77,   581,   591,   504,   592,   531,    69,   786,     1,   416,
     536,   417,    78,   337,   338,   376,    72,   241,   728,   555,
      70,    71,   638,    30,   446,   420,   178,   294,   598,    72,
     178,    77,   725,    77,   639,   420,   178,   296,   178,   623,
     290,   291,   522,   178,   157,   133,   295,   209,   523,   209,
      47,   209,   209,   209,    36,    37,   209,   446,   209,    28,
      29,    72,   241,   339,    30,    47,   393,   788,    46,   682,
     768,   321,   297,   446,   300,   611,   308,   446,   311,   250,
     133,   757,   133,   611,   578,   525,   789,    72,   242,   753,
     133,   244,   446,   758,   363,    36,    37,   301,   266,    96,
     400,   629,   400,   400,   400,    73,   314,   133,   177,   133,
     316,   650,     1,   779,    28,    29,   260,   261,   262,    30,
     654,   311,   133,   806,   506,   387,    70,    71,   223,   509,
    -418,   311,   791,   156,    28,    29,  -418,   317,   446,    30,
     285,   286,   843,   133,   183,   241,   798,    79,   446,     1,
      36,    37,   687,   260,   261,   262,   283,   284,   319,   712,
     186,    77,    47,    88,   363,   187,    77,   845,   656,   154,
      36,    37,   363,   446,   232,   664,   372,   666,   377,   178,
     696,   699,   648,   446,   315,   702,   418,   555,   419,   675,
     331,   189,   304,   680,   378,    72,   190,    75,   684,     1,
     507,   555,   555,   405,   230,   510,   406,    69,   412,     1,
     413,   593,   453,   156,   454,   178,   178,  -282,   243,   133,
     178,   245,   514,   133,     2,   651,   383,   378,   209,   516,
     209,   209,   209,   263,   490,   491,   518,   264,   265,   520,
     726,   492,   493,   334,   497,   498,    46,   223,   521,   154,
     527,   385,   234,   235,   529,   528,   679,    79,   541,   223,
     223,   223,   599,   606,   607,   156,   665,   428,   335,    72,
     263,    28,    29,   609,   264,   265,    30,     1,   619,   505,
      47,  -379,  -379,   622,   505,   336,  -379,   157,   628,   210,
     133,   652,   327,    47,    77,   330,    72,   644,   645,   366,
     667,   154,   761,    19,    20,   764,   669,    36,    37,   555,
     670,    79,   671,   672,   674,   337,   338,  -379,  -379,   676,
     156,   555,   677,   692,    72,   693,   707,    70,    71,   555,
    -379,  -379,   708,    28,    29,  -379,   414,   178,    30,   709,
     178,   716,    79,   436,    79,   436,   717,   722,   718,    28,
      29,   687,   801,   721,    30,   729,   154,   730,   462,   462,
       1,   749,    88,   743,   742,   133,   752,   803,   804,    36,
      37,   133,   760,   754,   745,   746,   748,    28,    29,    73,
     190,   766,    30,   555,   765,    36,    37,   555,   828,   767,
     555,   133,   769,   801,   772,    73,   133,   178,   177,   571,
     773,   792,   178,   178,    47,   133,   133,   842,   210,   807,
     808,   829,   832,    36,    37,   499,   833,   848,   849,   855,
     210,   210,   210,   850,    95,   501,   851,   859,   555,   555,
     860,   555,    28,    29,   555,   500,   503,    30,   502,   801,
     799,   223,   443,   223,   759,   223,   223,   223,   579,   583,
     223,   698,   223,   458,   458,    43,   511,   415,   636,   444,
     106,   689,     1,   107,   108,   532,   555,   641,    36,    37,
     724,     0,    79,   642,     0,   673,   643,    79,     0,   462,
       1,    74,   555,     0,     0,   555,    75,     2,     0,     1,
     691,   133,   572,   260,   261,   262,   824,     0,     0,   827,
       0,     0,    43,     0,     0,   157,     0,     0,     0,     0,
       0,     0,     0,   133,   133,   133,   133,     0,   133,     0,
       0,     0,   151,   153,     0,   133,     0,     0,     0,    43,
     174,   112,   113,   133,   603,   612,     0,     0,     0,     0,
       0,     0,     0,   612,    43,     0,   618,     0,     0,   153,
       0,     0,    28,    29,     0,     0,   462,    30,     0,     0,
       0,   630,   115,   116,     0,     0,     0,    43,     0,     0,
      43,     0,     0,     0,   462,   153,     0,     0,   118,     0,
       0,     0,    47,   238,     0,   157,   122,   133,    36,    37,
       0,   133,     0,     0,   133,   133,   210,   744,    73,     0,
       0,   177,   210,   133,   210,    79,   210,   210,   210,   755,
     263,   210,    43,   210,   264,   265,     0,   691,     0,     0,
       0,     0,   223,     0,   223,   223,   223,     0,     0,     0,
       1,     0,   133,   133,     0,   133,   133,   157,   133,   133,
       0,    43,   326,     0,   133,   329,     0,   668,     0,     0,
       0,   458,     0,     0,     0,    43,     0,    43,   630,     0,
       0,   462,   462,     0,     0,     0,    43,     0,   153,   458,
     133,   787,     0,   462,     0,   790,     0,     0,   793,     0,
     153,   153,   153,   701,     0,     0,   133,     0,     0,   133,
     133,   153,   157,     0,     0,     0,     0,    43,     0,    43,
       0,   153,    28,    29,     0,     0,    43,    30,     0,     0,
       0,     0,   713,   153,   153,   715,   821,   822,     0,   823,
       0,     0,   825,     0,   719,   720,   267,   268,   269,   270,
     271,   272,   273,   274,   275,   276,     0,     0,    36,    37,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,     0,     0,   844,     0,     0,     0,   153,    43,
       0,     0,     0,   153,    80,     0,   153,     0,   458,     0,
     854,     0,    43,   856,     0,    98,     0,     0,     0,     0,
       0,     0,     0,   210,     0,   210,   210,   210,     0,   462,
       0,    80,     0,   179,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   188,     0,     0,     0,     0,   195,
       0,   212,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   771,     0,     0,     0,   774,    43,     0,     0,
     153,     0,    43,   458,   153,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     277,     0,     0,     0,     0,     0,   462,     0,     0,   796,
       0,     0,   153,     0,   153,     0,   153,   153,   153,     0,
     805,   153,     0,   153,   305,     0,     0,    43,     0,     0,
       0,     0,     0,    43,     0,     0,   188,     0,     0,     0,
       0,     0,     0,     0,   179,     0,     0,   188,   195,     0,
       0,     0,   195,     0,     0,     0,     0,     0,     0,     0,
       0,   153,     0,     0,     0,     0,    43,   212,   179,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   390,   153,
     212,     0,     0,     0,     0,     0,     0,     0,   403,     0,
       0,     0,   212,   212,   212,     0,     0,     0,     0,     0,
       0,   458,     0,     0,     0,     0,     0,     0,     0,   430,
      43,   430,     0,     0,     0,     0,     0,    90,   305,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   655,   153,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    90,     0,    90,    81,     0,     0,
     184,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    90,    43,     0,     0,   153,   153,     0,     0,
       0,   305,     0,   163,     0,     0,    92,     0,   153,     0,
       0,     0,     0,     0,     0,     0,     0,   195,    83,     0,
       0,     0,     0,   153,     0,   153,   153,   153,     0,     0,
       0,     0,   165,    92,     0,   181,     0,     0,     0,   185,
       0,    43,     0,     0,   153,     0,     0,     0,     0,     0,
     252,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   305,     0,     0,     0,     0,   537,     0,   212,
       0,     0,   539,     0,     0,     0,     0,    90,     0,   184,
       0,    90,     0,   179,     0,    90,     0,    81,     0,     0,
       0,   254,     0,   580,   312,   184,   153,     0,     0,     0,
       0,    90,     0,     0,   212,     0,   212,     0,   212,   212,
     212,     0,   397,   212,     0,   212,   307,     0,     0,   305,
       0,   404,     0,   313,   153,   430,     0,     0,    83,   367,
       0,     0,   430,     0,     0,     0,   181,     0,   320,     0,
     430,    81,     0,   380,   381,   382,   384,     0,     0,     0,
       0,   153,     0,     0,     0,     0,   175,     0,   390,     0,
     181,     0,     0,     0,     0,     0,   423,     0,     0,     0,
     396,   398,    81,   437,    81,   437,   423,     0,     0,     0,
     175,   448,    83,     0,     0,     0,     0,     0,   463,   463,
       0,   153,     0,     0,   175,     0,     0,   175,     0,     0,
       0,   433,   305,   433,     0,     0,    82,   425,     0,     0,
     307,     0,     0,    83,   439,    83,   439,   425,     0,     0,
      90,     0,   450,     0,     0,     0,    84,     0,     0,   465,
     465,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   539,     0,     0,     0,     0,
       0,     0,     0,   307,   508,     0,     0,     0,   175,     0,
       0,   175,     0,   697,     0,    90,     0,     0,     0,   253,
       0,     0,     0,     0,     0,   212,    90,   212,   212,   212,
     397,     0,     0,     0,     0,   533,   404,     0,   582,   255,
       0,     0,    81,   584,   163,   252,     0,    81,     0,   463,
       0,     0,   175,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,   307,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   181,     0,    84,     0,     0,   460,
     460,     0,     0,    83,     0,   181,   254,     0,    83,   575,
     465,     0,   594,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   613,     0,     0,     0,     0,
      82,     0,     0,   613,     0,     0,     0,     0,     0,     0,
       0,   307,     0,     0,   188,     0,   463,   433,     0,   605,
      84,   631,     0,   596,   433,   424,     0,   763,     0,     0,
       0,    82,   433,    82,   463,   424,   615,   637,     0,     0,
     449,     0,     0,     0,   615,   426,     0,   464,   464,     0,
     396,    84,   440,    84,   440,   426,     0,   465,     0,     0,
     451,     0,   633,     0,     0,    81,     0,   466,   466,   184,
       0,     0,     0,     0,     0,   465,     0,     0,     0,     0,
       0,     0,     0,     0,   179,     0,     0,     0,    90,     0,
       0,     0,     0,     0,   307,     0,   460,     0,   175,     0,
       0,     0,     0,     0,     0,   582,    83,     0,     0,     0,
     584,     0,     0,     0,     0,     0,     0,     0,   631,     0,
       0,   463,   463,     0,     0,     0,     0,     0,   320,     0,
       0,     0,     0,   463,     0,     0,     0,     0,     0,     0,
     175,     0,     0,     0,     0,     0,     0,   181,     0,     0,
       0,     0,   175,     0,     0,     0,     0,     0,     0,   633,
       0,    82,   465,   465,   253,   700,    82,   460,   464,     0,
       0,     0,     0,     0,   465,     0,     0,     0,     0,     0,
       0,    84,     0,     0,   255,   460,    84,     0,   466,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   595,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   733,   734,     0,     0,
       0,   597,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   616,   464,     0,     0,     0,   463,
     632,     0,   616,   175,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   464,     0,   466,     0,     0,     0,     0,
     634,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   466,   460,     0,   762,    90,     0,   175,
     465,     0,     0,   106,    82,     1,   107,   108,   109,     0,
     110,   111,     0,     0,   780,   781,     0,   782,   783,     0,
       0,     0,     0,     0,    84,     0,   463,     0,   175,     0,
       2,   175,     0,     0,     0,     0,     0,     0,     0,     0,
     175,   175,     0,     0,     0,     0,     0,     0,     0,   460,
       0,     0,     0,   809,     0,   810,   181,   632,     0,   460,
     464,   464,   819,   820,     0,     0,     0,   465,     0,     0,
     727,     0,   464,     0,   112,   113,   114,   634,     0,     0,
     466,   466,     0,     0,     0,     0,     0,     0,     0,   834,
       0,   835,   466,   836,     0,   837,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   115,   116,     0,     0,     0,
       0,     0,   117,     0,     0,     0,   852,     0,   853,     0,
       0,   118,     0,   119,     0,     0,   120,     0,   121,   122,
       0,     0,     0,     0,   123,   124,   125,   126,   175,     0,
       0,     0,   175,     0,     0,     0,   800,   857,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   175,     0,   460,     0,     0,
       0,     0,     0,     0,     0,     0,   175,   106,   464,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   466,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,   542,
     543,   544,   545,   546,   547,   548,   549,   550,   551,   552,
       0,     0,     0,    27,     0,   464,     0,     0,   112,   113,
     114,    28,    29,     0,   553,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,   466,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,     0,     0,     0,     0,     0,     0,     0,   554,
     378,  -446,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,   542,   543,   544,   545,   546,   547,
     548,   549,   550,   551,   552,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,   553,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,   554,   378,  -445,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,   542,
     543,   544,   545,   546,   547,   548,   549,   550,   551,   552,
       0,     0,     0,    27,     0,     0,     0,     0,   112,   113,
     114,    28,    29,     0,   553,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,     0,     0,     0,     0,     0,     0,     0,   554,
     378,  -447,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,   455,   456,   457,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   112,   113,
     114,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,     0,     0,     0,     0,     0,     0,     0,   455,
     456,   476,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,   455,   456,   626,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   112,   113,
     114,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,     0,     0,     0,     0,     0,     0,     0,   640,
     456,  -498,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,   455,   456,   694,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   112,   113,
     114,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,   106,     0,     1,   107,   108,     0,     0,   455,
     456,   797,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     199,     0,     0,   112,   113,     0,    28,    29,     0,     0,
     200,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,     0,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,    73,     0,     0,   201,     0,   202,   122,   106,
       0,     1,   107,   108,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   203,     0,   204,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   199,     0,     0,
     112,   113,     0,    28,    29,     0,     0,   200,    30,     0,
       0,    31,    32,     0,    33,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
       0,   115,   116,     0,     0,     0,     0,     0,     0,    36,
      37,    38,    39,     0,     0,     0,    40,   118,     0,    73,
       0,     0,   201,     0,   202,   122,   106,     0,     1,   107,
     108,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   203,     0,   399,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,   199,     0,     0,   112,   113,     0,
      28,    29,     0,     0,   200,    30,     0,     0,    31,    32,
       0,    33,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,     0,   115,   116,
       0,     0,     0,     0,     0,     0,    36,    37,    38,    39,
       0,     0,     0,    40,   118,     0,    73,     0,     0,   201,
       0,   202,   122,   106,     0,     1,   107,   108,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   203,     0,
     408,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,   199,     0,     0,   112,   113,     0,    28,    29,     0,
       0,   200,    30,     0,     0,    31,    32,     0,    33,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,     0,   115,   116,     0,     0,     0,
       0,     0,     0,    36,    37,    38,    39,     0,     0,     0,
      40,   118,     0,    73,     0,     0,   201,     0,   202,   122,
     106,     0,     1,   107,   108,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   203,     0,   410,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,   199,     0,
       0,   112,   113,     0,    28,    29,     0,     0,   200,    30,
       0,     0,    31,    32,     0,    33,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,     0,   115,   116,     0,     0,     0,     0,     0,     0,
      36,    37,    38,    39,     0,     0,     0,    40,   118,     0,
      73,     0,     0,   201,     0,   202,   122,   106,     0,     1,
     107,   108,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   203,     0,   585,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,   199,     0,     0,   112,   113,
       0,    28,    29,     0,     0,   200,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,     0,    36,    37,    38,
      39,     0,     0,     0,    40,   118,     0,    73,     0,     0,
     201,     0,   202,   122,   106,     0,     1,   107,   108,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   203,
       0,   586,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,   199,     0,     0,   112,   113,     0,    28,    29,
       0,     0,   200,    30,     0,     0,    31,    32,     0,    33,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,     0,   115,   116,     0,     0,
       0,     0,     0,     0,    36,    37,    38,    39,     0,     0,
       0,    40,   118,     0,    73,     0,     0,   201,     0,   202,
     122,   106,     0,     1,   107,   108,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   203,     0,   587,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,   199,
       0,     0,   112,   113,     0,    28,    29,     0,     0,   200,
      30,     0,     0,    31,    32,     0,    33,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,     0,   115,   116,     0,     0,     0,     0,     0,
       0,    36,    37,    38,    39,     0,     0,     0,    40,   118,
       0,    73,     0,     0,   201,     0,   202,   122,   106,     0,
       1,   107,   108,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   203,     0,   589,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,   199,     0,     0,   112,
     113,     0,    28,    29,     0,     0,   200,    30,     0,     0,
      31,    32,     0,    33,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,     0,
     115,   116,     0,     0,     0,     0,     0,     0,    36,    37,
      38,    39,     0,     0,     0,    40,   118,     0,    73,     0,
       0,   201,     0,   202,   122,   106,     0,     1,   107,   108,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     203,     0,   703,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,   199,     0,     0,   112,   113,     0,    28,
      29,     0,     0,   200,    30,     0,     0,    31,    32,     0,
      33,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,     0,   115,   116,     0,
       0,     0,     0,     0,     0,    36,    37,    38,    39,     0,
       0,     0,    40,   118,     0,    73,     0,     0,   201,     0,
     202,   122,   106,     0,     1,   107,   108,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   203,     0,   704,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
     199,     0,     0,   112,   113,     0,    28,    29,     0,     0,
     200,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,     0,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,    73,     0,     0,   201,     0,   202,   122,   106,
       0,     1,   107,   108,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   203,     0,   705,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,     0,   199,     0,     0,
     112,   113,     0,    28,    29,     0,     0,   200,    30,     0,
       0,    31,    32,     0,    33,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
       0,   115,   116,     0,     0,     0,     0,     0,     0,    36,
      37,    38,    39,     0,     0,     0,    40,   118,     0,    73,
       0,     0,   201,     0,   202,   122,   106,     0,     1,   107,
     108,   109,     0,   110,   111,     0,     0,     0,     0,     0,
       0,   203,     0,   706,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,   542,   543,
     544,   545,   546,   547,   548,   549,   550,   551,   552,     0,
       0,     0,    27,     0,     0,     0,     0,   112,   113,   114,
      28,    29,     0,   553,     0,    30,     0,     0,    31,    32,
       0,    33,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,     0,   115,   116,
       0,     0,     0,     0,     0,   117,    36,    37,    38,    39,
       0,     0,     0,    40,   118,     0,   119,     0,     0,   120,
       0,   121,   122,     0,     0,     0,     0,   123,   124,   125,
     126,     0,     0,     0,     0,     0,     0,     0,   554,   378,
     106,     0,     1,   107,   108,   109,     0,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,   542,   543,   544,   545,   546,   547,   548,   549,
     550,   551,   552,     0,     0,     0,     0,     0,     0,     2,
       0,   112,   113,   114,     0,     0,     0,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   115,   116,     2,     0,     0,     0,     0,   117,
       0,     0,     0,   112,   113,   114,     0,     0,   118,     0,
     119,     0,     0,   120,     0,   121,   122,     0,     0,     0,
       0,   123,   124,   125,   126,     0,     0,     0,     0,     0,
       0,     0,   554,   378,   115,   116,     0,     0,   112,   113,
     114,   117,     0,     0,     0,     0,     0,     0,     0,     0,
     118,     0,   119,     0,     0,   120,   479,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,   115,
     116,     0,     0,     0,     0,   456,   117,     0,     0,     0,
       0,     0,     0,     0,     0,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,     0,     0,   106,     0,     1,   107,   108,   109,
     456,   110,   111,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   112,   113,   114,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   115,   116,     0,     0,
       0,     0,     0,   117,     0,     0,     0,     0,     0,     0,
       0,     0,   118,     0,   119,     0,     0,   120,     0,   121,
     122,     0,     0,     0,     0,   123,   124,   125,   126,   106,
       0,     1,   107,   108,     0,     0,     0,   800,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,   106,     0,     1,   107,
     108,   109,     0,   110,   111,    27,     0,   199,     0,     0,
     112,   113,     0,    28,    29,     0,     0,   200,    30,     0,
       0,    31,    32,     2,    33,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
       0,   115,   116,     0,     0,     0,     0,     0,     0,    36,
      37,    38,    39,     0,     0,     0,    40,   118,     0,    73,
       0,     0,   201,     0,   202,   122,     0,   112,   113,   114,
     106,     0,     1,   107,   108,   109,     0,   110,   111,     0,
       0,   203,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   115,   116,
       0,     0,     0,     0,   106,   117,     1,   107,   108,   109,
       0,   110,   111,     0,   118,     0,   119,     0,     0,   120,
     750,   121,   122,     0,     0,     0,     0,   123,   124,   125,
     126,     2,     0,     0,     0,     0,     0,     0,   554,     0,
       0,   112,   113,   114,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   115,   116,     0,   112,   113,   114,     0,   117,
       0,     0,     0,     0,     0,     0,     0,     0,   118,     0,
     119,     0,     0,   120,   794,   121,   122,     0,     0,     0,
       0,   123,   124,   125,   126,     0,   115,   116,     0,     0,
       0,     0,   554,   117,     0,     0,     0,     0,     0,     0,
       0,     0,   118,     1,   119,     0,     0,   120,     0,   121,
     122,     0,     0,     0,     0,   123,   124,   125,   126,     0,
       0,     0,     0,     0,     0,     0,   678,     0,     2,     3,
       4,     5,     6,     7,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,   353,    19,    20,   354,   355,    23,
      24,   356,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   357,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,   358,     0,   359,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   360,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,    37,   361,   362,     0,     0,     0,    40,     0,
       1,    73,     0,     0,   304,     0,     0,     0,     0,    75,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   530,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,    37,
      38,    39,     0,     0,     0,    40,     1,     0,    73,     0,
       0,   386,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   387,     0,
     388,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,    31,    32,     0,    33,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,    37,    38,    39,     0,     0,
       0,    40,     1,     0,    73,     0,     0,   177,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   683,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,    31,    32,     0,    33,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,    37,    38,    39,     0,     0,     0,    40,     0,     0,
      73,     0,   106,   304,     1,   107,   108,   109,    75,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,  -281,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     0,     0,    40,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,   106,     0,     1,
     107,   108,   109,     0,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,     0,     0,     0,     0,   112,   113,
     114,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,   115,
     116,     0,     0,     0,     0,     0,   117,    36,    37,    38,
      39,     0,     0,     0,     0,   118,     0,   119,     0,     0,
     120,   248,   121,   122,     0,     0,     0,     0,   123,   124,
     125,   126,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,   112,   113,   114,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
     106,     0,     1,   107,   108,   109,     0,   110,   111,     0,
       0,     0,    35,     0,   115,   116,     0,     0,     0,     0,
       0,   117,    36,    37,    38,    39,     0,     2,     0,     0,
     118,     0,   374,     0,     0,   375,   248,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   106,     0,     1,   107,
     108,   109,     0,   110,   111,     0,     0,     0,     0,     0,
       0,   112,   113,   114,    28,    29,     0,     0,     0,    30,
       0,     0,     0,     2,     0,     0,     0,     0,     0,   106,
       0,     1,   107,   108,   109,     0,   110,   111,     0,     0,
       0,     0,   115,   116,     0,     0,     0,     0,     0,   117,
      36,    37,     0,     0,     0,     0,     2,     0,   118,     0,
     374,     0,     0,   375,   248,   121,   122,   112,   113,   114,
       0,   123,   124,   125,   126,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   115,   116,
     112,   113,   114,     0,     0,   117,     0,     0,     0,     0,
       0,     0,     0,     0,   118,     0,   119,     0,     0,   120,
       0,   121,   122,     0,     0,   173,     0,   123,   124,   125,
     126,   115,   116,     0,     0,     0,     0,   106,   117,     1,
     107,   108,   109,     0,   110,   111,     0,   118,     0,   119,
       0,     0,   120,     0,   121,   122,     0,     0,   325,     0,
     123,   124,   125,   126,     2,     0,     0,     0,     0,     0,
     106,     0,     1,   107,   108,   109,     0,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   112,   113,
     114,   106,     0,     1,   107,   108,   109,     0,   110,   111,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,   115,
     116,   112,   113,   114,     0,     0,   117,     0,     0,     0,
       0,     0,     0,     0,     0,   118,     0,   119,     0,     0,
     120,     0,   121,   122,     0,     0,   328,     0,   123,   124,
     125,   126,   115,   116,     0,     0,     0,     0,     0,   117,
       0,     0,   112,   113,   114,     0,     0,     0,   118,     0,
     119,     0,     0,   120,   248,   121,   122,     0,     0,     0,
       0,   123,   124,   125,   126,     0,     0,     0,     0,     0,
       0,     0,     0,   115,   116,     0,     0,     0,     0,   106,
     117,     1,   107,   108,   109,     0,   110,   111,     0,   118,
       0,   119,     0,     0,   120,   747,   121,   122,     0,     0,
       0,     0,   123,   124,   125,   126,     2,     0,     0,     0,
       0,     0,   106,     0,     1,   107,   108,   109,     0,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     112,   113,   114,   106,     0,     1,   107,   108,   109,     0,
     110,   111,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   115,   116,   112,   113,   114,     0,     0,   117,     0,
       0,     0,     0,     0,     0,     0,     0,   118,     0,   119,
       0,     0,   120,   826,   121,   122,     0,     0,     0,     0,
     123,   124,   125,   126,   115,   116,     0,     0,     0,     0,
       0,   117,     0,     0,   112,   113,   114,     0,     0,     0,
     118,     0,   119,     0,     0,   120,     0,   121,   122,     0,
       0,     0,     0,   123,   124,   125,   126,     0,     0,     0,
       0,     0,     0,     0,     0,   115,   116,     0,     0,     0,
       0,   106,   117,     1,   107,   108,   109,     0,   110,   111,
       0,   118,     0,   119,     0,     0,   236,     0,   121,   122,
       0,     0,     0,     0,   123,   124,   125,   126,     2,     0,
       0,     0,     0,     0,   106,     0,     1,   107,   108,   109,
       0,   110,   111,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   112,   113,   114,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   115,   116,   112,   113,   114,     0,     0,
     117,     0,     0,     0,     0,     0,     0,     0,     0,   118,
       0,   119,     0,     0,   238,     0,   121,   122,     0,     0,
       0,     0,   123,   124,   125,   126,   115,   116,     0,     0,
       0,     0,     0,   117,     1,     0,     0,     0,     0,     0,
       0,     0,   118,     0,   119,     0,     0,   246,     0,   121,
     122,     0,     0,     0,     0,   123,   124,   125,   126,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    27,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    30,     0,     0,    31,    32,     0,    33,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,     0,     0,     0,     0,     0,     0,     1,
       0,     0,    36,    37,    38,    39,     0,     0,     0,    40,
       0,     0,    73,     0,     0,    74,     0,     0,     0,     0,
      75,     0,     0,    76,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     0,     0,
       0,     1,     0,     0,     0,     0,     0,    36,    37,    38,
      39,     0,     0,     0,    40,     0,     0,    73,     0,     0,
      74,   166,     0,     0,     0,    75,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
       0,     0,     0,     1,     0,     0,     0,     0,     0,    36,
      37,    38,    39,     0,     0,     0,    40,     0,     0,    73,
       0,     0,   304,   166,     0,     0,     0,    75,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,     0,     0,     0,     1,     0,     0,     0,     0,
       0,    36,    37,    38,    39,     0,     0,     0,    40,     0,
       0,    73,     0,     0,   428,     0,     0,     0,     0,   429,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    27,
       0,     0,     0,     0,     0,     0,     0,    28,    29,     0,
       0,     0,    30,     0,     0,    31,    32,     0,    33,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,     0,     0,     0,     1,     0,     0,
       0,     0,     0,    36,    37,    38,    39,     0,     0,     0,
      40,     0,     0,    73,     0,     0,   428,     0,     0,     0,
       0,   441,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,     0,     0,     0,     1,
       0,     0,     0,     0,     0,    36,    37,    38,    39,     0,
       0,     0,    40,     0,     0,    73,     0,     0,   304,     0,
       0,     0,     0,    75,     2,     3,     4,     5,     6,     7,
     343,   344,   345,   346,   347,   348,   349,   350,   351,   352,
     353,    19,    20,   354,   355,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   357,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,     0,
       0,     0,   358,     0,   359,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   360,     0,     0,
       0,     1,     0,     0,     0,     0,     0,    36,    37,   361,
     362,     0,     0,     0,    40,     0,     0,    73,     0,     0,
     428,     0,     0,     0,     0,   610,     2,     3,     4,     5,
       6,     7,   343,   344,   345,   346,   347,   348,   349,   350,
     351,   352,   353,    19,    20,   354,   355,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   357,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,     0,     0,     0,   358,     0,   359,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,   360,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
      37,   361,   362,     0,     0,     0,    40,     0,     0,    73,
       0,     0,   428,     2,     0,     0,     0,   620,     0,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,     0,     0,     0,
       1,     0,     0,     0,     0,     0,    36,    37,    38,    39,
       0,     0,     0,     0,     0,     0,    73,     0,     0,   304,
       0,     0,     0,     0,    75,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    36,    37,
      38,    39,     0,     0,     0,    40,     0,     0,    73,     0,
       0,   428,   600,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,    27,     0,     0,     0,     0,     0,     0,
       0,    28,    29,     0,     0,     0,    30,     0,     0,    31,
      32,     0,    33,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,     1,     0,
       0,     0,     0,     0,     0,     0,     0,    36,    37,    38,
      39,     0,     0,     0,    40,     0,     0,     0,     0,     0,
       0,   191,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,    29,     0,     0,     0,    30,     0,     0,    31,    32,
       0,    33,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    36,    37,    38,    39,
       0,     0,     0,    40,     0,     0,     0,     0,     0,     0,
     323,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
      29,     0,     0,     0,    30,     0,     0,    31,    32,     0,
      33,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    36,    37,    38,    39,     0,
       0,     0,    40,     0,     0,     0,     0,     0,     0,   711,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      27,     0,     0,     0,     0,     0,     0,     0,    28,    29,
       0,     0,     0,    30,     0,     0,    31,    32,     0,    33,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,    37,    38,    39,     0,     0,
       0,    40,     0,     0,    73,     0,     0,   177,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    27,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,    31,    32,     0,    33,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,    37,    38,    39,     0,     0,     0,    40,     0,
       0,     0,     0,     0,   540,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,   512,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,    27,     0,     0,     0,     0,     0,
       0,     0,    28,    29,     0,     0,     0,    30,     0,     0,
      31,    32,     0,    33,     0,    34,     0,     0,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,    37,
      38,    39,     0,     0,     0,    40,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,    29,     0,     0,     0,    30,     0,
       0,    31,    32,     0,    33,     0,    34,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
      37,    38,    39,     0,     0,     0,    40,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,     0,     0,
       0,     0,     0,     0,    28,    29,     0,     0,     0,    30,
       0,     0,    31,    32,     0,    33,     0,    34,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,    37,    38,    39,     0,     0,     0,    40,     2,     3,
       4,     5,     6,     7,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,   353,    19,    20,   354,   355,    23,
      24,   356,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   357,     0,     0,
       0,     0,     0,     0,     0,    28,    29,     0,     0,     0,
      30,     0,     0,     0,     0,     0,   358,     0,   359,     0,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,   360,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,    37,   361,   362,     0,     0,     0,    40,     2,
       3,     4,     5,     6,     7,   343,   344,   345,   346,   347,
     348,   349,   350,   351,   352,   353,    19,    20,   354,   355,
      23,    24,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   357,     0,
       0,     0,     0,     0,     0,     0,    28,    29,     0,     0,
       0,    30,     0,     0,     0,     0,     0,   358,     0,   359,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   360,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,    37,   361,   362,     0,     0,     0,    40
};

static const yytype_int16 yycheck[] =
{
       0,    47,    89,    80,   199,   122,   379,    92,   263,   259,
       0,   385,    47,    47,   199,    92,   134,   529,     3,    66,
       3,   379,    17,   278,   244,    25,   200,   199,   199,     3,
      76,     3,    68,   342,   674,     3,   800,   211,    70,    74,
     124,    76,    70,    28,    70,    80,    46,    47,   243,   430,
     245,    71,   433,   122,    70,    71,     3,    92,    58,    70,
      71,    70,    71,    63,     3,    70,     3,    67,    68,   131,
       1,   243,     3,   245,    74,   144,    76,     3,    78,     3,
      80,    28,   846,   145,     3,   213,    14,    15,     3,    89,
      75,    76,    92,     3,    94,    80,   181,   609,    98,   186,
     185,     3,    28,   139,   104,   105,   121,   124,   185,    28,
     122,   751,   112,   145,    25,   115,   130,   145,   125,   145,
       3,   136,   137,   157,   131,   145,   111,   112,   128,   145,
     144,   131,   144,   122,   145,   141,   145,    11,    75,    76,
     145,     0,   177,    80,   179,   140,   181,    58,   124,   661,
     185,   125,   152,   125,   154,     3,   124,   157,   141,   144,
     195,   144,   280,   281,   282,   144,   201,   167,     3,     3,
     365,   225,   226,   227,   111,   112,   211,   177,   144,   179,
     365,   181,   121,   122,   120,   185,   186,    98,   561,   562,
     121,   122,   192,   365,   365,   195,    47,   144,   372,   199,
     200,   201,   202,   561,   716,   144,   456,   144,   428,   209,
     210,   211,   212,   213,   523,   435,   263,   251,   144,   121,
     144,   221,   124,   443,   605,   225,   226,   227,   305,   144,
     307,   278,   232,    71,   144,   320,   236,   131,   121,   122,
     435,   241,   242,   243,   244,   245,   246,   141,   443,   123,
     435,   251,   288,   289,   628,   291,    71,   131,   443,   142,
     260,   144,     3,   435,   264,   201,   131,   303,    71,   123,
      66,   443,   308,   121,   122,   311,   125,   131,   143,   407,
       3,   409,   131,   411,   130,   320,   121,   461,   199,   124,
      12,    13,    70,    71,   129,   131,   144,   124,   144,   144,
     236,     3,   238,   303,   304,    28,   157,   145,   308,   145,
     246,   311,   125,   109,   110,   111,   689,   317,   131,   142,
     320,   117,    45,   573,   120,   130,    28,   317,     5,   265,
     145,   365,   243,   333,   245,   453,     0,   454,   131,   144,
     375,   428,   145,    45,   144,   121,   121,     3,   124,   124,
     143,   386,    75,    76,   129,   390,   356,   131,   412,   413,
     211,   396,   416,   299,   418,   365,     1,   145,     3,   143,
     370,   145,   372,    75,    76,   375,   376,   377,   125,   379,
     121,   122,   131,    80,   131,   236,   386,   132,   422,   389,
     390,   242,   647,   244,   143,   246,   396,   139,   398,   446,
     122,   123,   125,   403,    68,   201,   138,   407,   131,   409,
      74,   411,   412,   413,   111,   112,   416,   131,   418,    75,
      76,   421,   422,   125,    80,    89,   461,   125,   428,   143,
     123,   508,    16,   131,   125,   435,   142,   131,   131,   375,
     236,   131,   238,   443,   141,   356,   125,   447,   112,   143,
     246,   115,   131,   143,   365,   111,   112,   125,   458,   370,
     588,   461,   590,   591,   592,   121,   125,   263,   124,   265,
     125,   505,     3,   123,    75,    76,     7,     8,     9,    80,
     527,   131,   278,   123,   303,   141,   121,   122,    94,   308,
     125,   131,   125,   529,    75,    76,   131,   131,   131,    80,
      10,    11,   125,   299,   539,   505,   756,    47,   131,     3,
     111,   112,   558,     7,     8,     9,   133,   134,   130,   606,
     124,   372,   186,   558,   435,   129,   377,   125,   528,   529,
     111,   112,   443,   131,   131,   535,   200,   537,   202,   539,
     575,   576,   130,   131,   125,   580,   143,   547,   145,   549,
     125,   124,   124,   553,   144,   555,   129,   129,   558,     3,
     303,   561,   562,   143,    99,   308,   143,     1,   144,     3,
     144,   422,   125,   609,   128,   575,   576,   142,   113,   375,
     580,   116,   125,   379,    28,   521,   143,   144,   588,   130,
     590,   591,   592,   124,   283,   284,   130,   128,   129,   125,
     647,   285,   286,     3,   292,   293,   606,   213,   124,   609,
     124,   142,   104,   105,   122,   124,   552,   157,   145,   225,
     226,   227,   125,   124,   129,   661,   537,   124,    28,   629,
     124,    75,    76,   122,   128,   129,    80,     3,   129,   303,
     304,    75,    76,   125,   308,    45,    80,   311,   142,    94,
     446,   125,   187,   317,   505,   190,   656,   145,   145,   199,
     125,   661,   697,    45,    46,   700,   141,   111,   112,   669,
     124,   211,   124,   124,   124,    75,    76,   111,   112,   143,
     716,   681,   143,   145,   684,   143,   125,   121,   122,   689,
     124,   125,   125,    75,    76,   129,   231,   697,    80,   130,
     700,   122,   242,   243,   244,   245,   129,   145,   130,    75,
      76,   757,   759,   129,    80,   125,   716,   125,   258,   259,
       3,    57,   757,   141,   144,   521,   143,   762,   763,   111,
     112,   527,   145,   142,   670,   671,   672,    75,    76,   121,
     129,   125,    80,   743,   141,   111,   112,   747,   143,   130,
     750,   547,   130,   800,   130,   121,   552,   757,   124,   125,
     130,   124,   762,   763,   428,   561,   562,    65,   213,   130,
     130,   145,   145,   111,   112,   294,   145,   145,   145,   143,
     225,   226,   227,   145,    58,   296,   145,   145,   788,   789,
     145,   791,    75,    76,   794,   295,   298,    80,   297,   846,
     757,   407,   245,   409,   142,   411,   412,   413,   395,   401,
     416,   576,   418,   258,   259,     0,   311,   232,   461,   246,
       1,   561,     3,     4,     5,   365,   826,   474,   111,   112,
     638,    -1,   372,   474,    -1,   547,   474,   377,    -1,   379,
       3,   124,   842,    -1,    -1,   845,   129,    28,    -1,     3,
     562,   647,   387,     7,     8,     9,   792,    -1,    -1,   795,
      -1,    -1,    47,    -1,    -1,   529,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   669,   670,   671,   672,    -1,   674,    -1,
      -1,    -1,    67,    68,    -1,   681,    -1,    -1,    -1,    74,
      75,    72,    73,   689,   429,   435,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   443,    89,    -1,   441,    -1,    -1,    94,
      -1,    -1,    75,    76,    -1,    -1,   456,    80,    -1,    -1,
      -1,   461,   103,   104,    -1,    -1,    -1,   112,    -1,    -1,
     115,    -1,    -1,    -1,   474,   120,    -1,    -1,   119,    -1,
      -1,    -1,   606,   124,    -1,   609,   127,   743,   111,   112,
      -1,   747,    -1,    -1,   750,   751,   401,   669,   121,    -1,
      -1,   124,   407,   759,   409,   505,   411,   412,   413,   681,
     124,   416,   157,   418,   128,   129,    -1,   689,    -1,    -1,
      -1,    -1,   588,    -1,   590,   591,   592,    -1,    -1,    -1,
       3,    -1,   788,   789,    -1,   791,   792,   661,   794,   795,
      -1,   186,   187,    -1,   800,   190,    -1,   542,    -1,    -1,
      -1,   456,    -1,    -1,    -1,   200,    -1,   202,   558,    -1,
      -1,   561,   562,    -1,    -1,    -1,   211,    -1,   213,   474,
     826,   743,    -1,   573,    -1,   747,    -1,    -1,   750,    -1,
     225,   226,   227,   578,    -1,    -1,   842,    -1,    -1,   845,
     846,   236,   716,    -1,    -1,    -1,    -1,   242,    -1,   244,
      -1,   246,    75,    76,    -1,    -1,   251,    80,    -1,    -1,
      -1,    -1,   607,   258,   259,   610,   788,   789,    -1,   791,
      -1,    -1,   794,    -1,   619,   620,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,    -1,    -1,   111,   112,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   124,    -1,    -1,   826,    -1,    -1,    -1,   303,   304,
      -1,    -1,    -1,   308,    47,    -1,   311,    -1,   573,    -1,
     842,    -1,   317,   845,    -1,    58,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   588,    -1,   590,   591,   592,    -1,   689,
      -1,    74,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    92,
      -1,    94,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   717,    -1,    -1,    -1,   721,   372,    -1,    -1,
     375,    -1,   377,   638,   379,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     142,    -1,    -1,    -1,    -1,    -1,   756,    -1,    -1,   754,
      -1,    -1,   407,    -1,   409,    -1,   411,   412,   413,    -1,
     765,   416,    -1,   418,   157,    -1,    -1,   422,    -1,    -1,
      -1,    -1,    -1,   428,    -1,    -1,   169,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   177,    -1,    -1,   180,   181,    -1,
      -1,    -1,   185,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   456,    -1,    -1,    -1,    -1,   461,   200,   201,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   211,   474,
     213,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   221,    -1,
      -1,    -1,   225,   226,   227,    -1,    -1,    -1,    -1,    -1,
      -1,   756,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   242,
     505,   244,    -1,    -1,    -1,    -1,    -1,    47,   251,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   528,   529,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    -1,    76,    47,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    92,   558,    -1,    -1,   561,   562,    -1,    -1,
      -1,   304,    -1,    73,    -1,    -1,    47,    -1,   573,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   320,    47,    -1,
      -1,    -1,    -1,   588,    -1,   590,   591,   592,    -1,    -1,
      -1,    -1,    73,    74,    -1,    76,    -1,    -1,    -1,    80,
      -1,   606,    -1,    -1,   609,    -1,    -1,    -1,    -1,    -1,
     120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   365,    -1,    -1,    -1,    -1,   370,    -1,   372,
      -1,    -1,   375,    -1,    -1,    -1,    -1,   177,    -1,   179,
      -1,   181,    -1,   386,    -1,   185,    -1,   157,    -1,    -1,
      -1,   120,    -1,   396,   164,   195,   661,    -1,    -1,    -1,
      -1,   201,    -1,    -1,   407,    -1,   409,    -1,   411,   412,
     413,    -1,   212,   416,    -1,   418,   157,    -1,    -1,   422,
      -1,   221,    -1,   164,   689,   428,    -1,    -1,   157,   199,
      -1,    -1,   435,    -1,    -1,    -1,   177,    -1,   179,    -1,
     443,   211,    -1,   205,   206,   207,   208,    -1,    -1,    -1,
      -1,   716,    -1,    -1,    -1,    -1,    75,    -1,   461,    -1,
     201,    -1,    -1,    -1,    -1,    -1,   236,    -1,    -1,    -1,
     211,   212,   242,   243,   244,   245,   246,    -1,    -1,    -1,
      99,   251,   211,    -1,    -1,    -1,    -1,    -1,   258,   259,
      -1,   756,    -1,    -1,   113,    -1,    -1,   116,    -1,    -1,
      -1,   242,   505,   244,    -1,    -1,    47,   236,    -1,    -1,
     251,    -1,    -1,   242,   243,   244,   245,   246,    -1,    -1,
     320,    -1,   251,    -1,    -1,    -1,    47,    -1,    -1,   258,
     259,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   558,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   304,   305,    -1,    -1,    -1,   187,    -1,
      -1,   190,    -1,   576,    -1,   375,    -1,    -1,    -1,   120,
      -1,    -1,    -1,    -1,    -1,   588,   386,   590,   591,   592,
     390,    -1,    -1,    -1,    -1,   365,   396,    -1,   398,   120,
      -1,    -1,   372,   403,   374,   375,    -1,   377,    -1,   379,
      -1,    -1,   231,    -1,    -1,    -1,   157,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   365,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   374,   375,    -1,   157,    -1,    -1,   258,
     259,    -1,    -1,   372,    -1,   386,   375,    -1,   377,   390,
     379,    -1,   422,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   435,    -1,    -1,    -1,    -1,
     211,    -1,    -1,   443,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   422,    -1,    -1,   687,    -1,   456,   428,    -1,   430,
     211,   461,    -1,   422,   435,   236,    -1,   700,    -1,    -1,
      -1,   242,   443,   244,   474,   246,   435,   469,    -1,    -1,
     251,    -1,    -1,    -1,   443,   236,    -1,   258,   259,    -1,
     461,   242,   243,   244,   245,   246,    -1,   456,    -1,    -1,
     251,    -1,   461,    -1,    -1,   505,    -1,   258,   259,   539,
      -1,    -1,    -1,    -1,    -1,   474,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   757,    -1,    -1,    -1,   558,    -1,
      -1,    -1,    -1,    -1,   505,    -1,   385,    -1,   387,    -1,
      -1,    -1,    -1,    -1,    -1,   575,   505,    -1,    -1,    -1,
     580,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   558,    -1,
      -1,   561,   562,    -1,    -1,    -1,    -1,    -1,   539,    -1,
      -1,    -1,    -1,   573,    -1,    -1,    -1,    -1,    -1,    -1,
     429,    -1,    -1,    -1,    -1,    -1,    -1,   558,    -1,    -1,
      -1,    -1,   441,    -1,    -1,    -1,    -1,    -1,    -1,   558,
      -1,   372,   561,   562,   375,   576,   377,   456,   379,    -1,
      -1,    -1,    -1,    -1,   573,    -1,    -1,    -1,    -1,    -1,
      -1,   372,    -1,    -1,   375,   474,   377,    -1,   379,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   422,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   658,   659,    -1,    -1,
      -1,   422,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   435,   456,    -1,    -1,    -1,   689,
     461,    -1,   443,   542,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   474,    -1,   456,    -1,    -1,    -1,    -1,
     461,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   474,   573,    -1,   697,   757,    -1,   578,
     689,    -1,    -1,     1,   505,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,   736,   737,    -1,   739,   740,    -1,
      -1,    -1,    -1,    -1,   505,    -1,   756,    -1,   607,    -1,
      28,   610,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     619,   620,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   628,
      -1,    -1,    -1,   775,    -1,   777,   757,   558,    -1,   638,
     561,   562,   784,   785,    -1,    -1,    -1,   756,    -1,    -1,
     649,    -1,   573,    -1,    72,    73,    74,   558,    -1,    -1,
     561,   562,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   811,
      -1,   813,   573,   815,    -1,   817,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,    -1,   838,    -1,   840,    -1,
      -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,   717,    -1,
      -1,    -1,   721,    -1,    -1,    -1,   144,   145,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   754,    -1,   756,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   765,     1,   689,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   689,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      -1,    -1,    -1,    67,    -1,   756,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    78,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,   756,    -1,    -1,    -1,    -1,
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
      49,    50,    51,    -1,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    -1,    -1,    -1,    67,    -1,
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
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
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
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
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
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
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
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
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
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
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
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
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
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,     1,    -1,     3,     4,     5,    -1,    -1,   143,
     144,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,
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
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    69,    -1,    -1,    72,    73,    -1,
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
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
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
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,
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
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    69,    -1,    -1,    72,    73,
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
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    69,    -1,    -1,    72,    73,    -1,    75,    76,
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
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    69,
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
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,    72,
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
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    69,    -1,    -1,    72,    73,    -1,    75,
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
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,   143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    -1,
      -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,    74,
      75,    76,    -1,    78,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,    -1,    -1,   124,
      -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,
     135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,   144,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    72,    73,    74,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    28,    -1,    -1,    -1,    -1,   110,
      -1,    -1,    -1,    72,    73,    74,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,   144,   103,   104,    -1,    -1,    72,    73,
      74,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,   103,
     104,    -1,    -1,    -1,    -1,   144,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,
     124,    -1,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,    -1,    -1,     1,    -1,     3,     4,     5,     6,
     144,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    67,    -1,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    83,    84,    28,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,    -1,    72,    73,    74,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   103,   104,
      -1,    -1,    -1,    -1,     1,   110,     3,     4,     5,     6,
      -1,     8,     9,    -1,   119,    -1,   121,    -1,    -1,   124,
     125,   126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,
     135,    28,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    -1,    72,    73,    74,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,   103,   104,    -1,    -1,
      -1,    -1,   143,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,     3,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
       3,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   144,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,     3,    -1,   121,    -1,
      -1,   124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,
     143,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,     3,    -1,   121,    -1,    -1,   124,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,    -1,     1,   124,     3,     4,     5,     6,   129,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,
     124,   125,   126,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    28,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,    -1,    -1,    28,    -1,   119,    -1,
     121,    -1,    -1,   124,   125,   126,   127,    72,    73,    74,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,
      72,    73,    74,    -1,    -1,   110,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    -1,   121,    -1,    -1,   124,
      -1,   126,   127,    -1,    -1,   130,    -1,   132,   133,   134,
     135,   103,   104,    -1,    -1,    -1,    -1,     1,   110,     3,
       4,     5,     6,    -1,     8,     9,    -1,   119,    -1,   121,
      -1,    -1,   124,    -1,   126,   127,    -1,    -1,   130,    -1,
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
     124,    -1,   126,   127,    -1,    -1,   130,    -1,   132,   133,
     134,   135,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,    72,    73,    74,    -1,    -1,    -1,   119,    -1,
     121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,     1,
     110,     3,     4,     5,     6,    -1,     8,     9,    -1,   119,
      -1,   121,    -1,    -1,   124,   125,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,    28,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      72,    73,    74,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   103,   104,    72,    73,    74,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,
      -1,    -1,   124,   125,   126,   127,    -1,    -1,    -1,    -1,
     132,   133,   134,   135,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,    -1,    -1,    72,    73,    74,    -1,    -1,    -1,
     119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,    -1,
      -1,     1,   110,     3,     4,     5,     6,    -1,     8,     9,
      -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,    28,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    72,    73,    74,    -1,    -1,
     110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,   121,    -1,    -1,   124,    -1,   126,   127,    -1,    -1,
      -1,    -1,   132,   133,   134,   135,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,
     129,    -1,    -1,   132,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,
     124,   125,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,   124,   125,    -1,    -1,    -1,   129,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,    -1,    -1,   124,    -1,    -1,    -1,    -1,   129,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,    -1,   124,    -1,    -1,    -1,
      -1,   129,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,   124,    -1,
      -1,    -1,    -1,   129,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,    -1,
     124,    -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,   124,    28,    -1,    -1,    -1,   129,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,   124,
      -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    67,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,    -1,
      -1,   124,   125,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,
      -1,   125,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,    -1,
     125,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,    -1,    -1,    -1,    -1,   125,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,    -1,   124,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,    -1,    -1,    -1,   124,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    67,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    66,    67,    75,    76,
      80,    83,    84,    86,    88,   101,   111,   112,   113,   114,
     118,   147,   148,   149,   150,   151,   156,   186,   187,   192,
     193,   194,   198,   199,   200,   201,   203,   204,   210,   218,
     219,   237,   268,   144,   151,   156,   124,   124,   122,     1,
     121,   122,   156,   121,   124,   129,   132,   147,   156,   192,
     193,   200,   201,   203,   219,   222,   224,   226,   227,   229,
     230,   231,   234,   124,   144,   150,   151,   156,   193,   141,
       0,   156,   220,   221,   144,   144,     1,     4,     5,     6,
       8,     9,    72,    73,    74,   103,   104,   110,   119,   121,
     124,   126,   127,   132,   133,   134,   135,   149,   156,   157,
     158,   159,   162,   163,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,   178,   255,
     258,   149,   156,   149,   156,   163,   168,   186,   205,   206,
     207,   208,   209,   200,   233,   234,   125,   156,   224,   226,
     235,   236,   237,   130,   149,   177,   181,   124,   156,   193,
     226,   234,   222,   227,   230,   234,   124,   129,   193,   124,
     129,   125,   156,   235,   238,   193,   222,   231,   124,    69,
      79,   124,   126,   143,   145,   152,   153,   154,   155,   156,
     159,   186,   193,   211,   212,   213,   214,   215,   227,   228,
     230,   234,   257,   258,   260,   144,   144,   144,   151,   156,
     181,   142,   131,   145,   220,   220,   124,   163,   124,   163,
     163,   156,   186,   181,   186,   181,   124,   163,   125,   178,
     180,   183,   200,   201,   203,   219,   239,   255,   144,   144,
       7,     8,     9,   124,   128,   129,   156,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   142,   179,   165,
     121,   136,   137,   133,   134,    10,    11,   168,    12,    13,
     122,   123,    14,    15,   132,   138,   139,    16,    17,   140,
     125,   125,   125,   142,   124,   193,   224,   234,   142,    11,
     123,   131,   200,   234,   125,   125,   125,   131,   130,   130,
     234,   222,   231,   125,   235,   130,   149,   181,   130,   149,
     181,   125,   125,   131,     3,    28,    45,    75,    76,   125,
     195,   196,   197,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    47,    48,    51,    67,    86,    88,
     101,   113,   114,   151,   156,   188,   192,   200,   202,   204,
     210,   218,   186,   228,   121,   124,   156,   186,   144,   249,
     250,   250,   250,   143,   250,   142,   124,   141,   143,   156,
     193,   216,   217,   227,   228,   232,   234,   230,   234,   145,
     215,   131,   143,   193,   230,   143,   143,   211,   145,   211,
     145,   211,   144,   144,   181,   221,   143,   145,   143,   145,
     147,   156,   184,   200,   201,   203,   219,   240,   124,   129,
     193,   223,   225,   234,   156,   189,   192,   200,   202,   203,
     219,   129,   225,   189,   240,   125,   131,   156,   200,   201,
     203,   219,   224,   125,   128,   143,   144,   145,   159,   160,
     177,   185,   192,   200,   201,   203,   219,   242,   259,   261,
     262,   263,   264,   265,   266,   267,   145,   267,   156,   125,
     160,   161,   178,   156,   180,   160,   178,   165,   165,   165,
     166,   166,   167,   167,   168,   168,   168,   170,   170,   171,
     172,   173,   174,   175,   180,   186,   206,   207,   234,   206,
     207,   208,    52,   237,   125,   130,   130,   130,   130,   156,
     125,   124,   125,   131,   196,   151,   156,   124,   124,   122,
     144,   156,   192,   200,   202,   224,   156,   193,   228,   193,
     124,   145,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    78,   143,   156,   180,   182,   185,   244,
     245,   246,   247,   248,   250,   251,   252,   253,   254,   256,
     242,   125,   181,   144,   227,   234,   131,   143,   141,   198,
     193,   227,   230,   212,   230,   145,   145,   145,   211,   145,
     211,   211,   211,   147,   200,   201,   203,   219,   224,   125,
     125,   225,   235,   181,   223,   234,   124,   129,   223,   122,
     129,   156,   192,   200,   202,   203,   219,   225,   181,   129,
     129,   225,   125,   178,   165,   255,   145,   267,   142,   156,
     192,   200,   201,   203,   219,   228,   232,   250,   131,   143,
     143,   262,   264,   265,   145,   145,   125,   131,   130,   141,
     224,   180,   125,   196,   178,   149,   156,   209,    70,    71,
     145,   122,   144,   144,   156,   151,   156,   125,   181,   141,
     124,   124,   124,   244,   124,   156,   143,   143,   143,   180,
     156,   141,   143,   143,   156,   190,   191,   226,   182,   247,
     182,   244,   145,   143,   145,   267,   227,   193,   217,   227,
     234,   181,   227,   145,   145,   145,   145,   125,   125,   130,
     223,   125,   235,   181,   209,   181,   122,   129,   130,   181,
     181,   129,   145,   242,   263,   160,   178,   177,   125,   125,
     125,   125,   123,   250,   250,   209,    70,    71,   145,    70,
      71,   145,   144,   141,   244,   180,   180,   125,   180,    57,
     125,   251,   143,   143,   142,   244,   144,   131,   143,   142,
     145,   227,   234,   193,   227,   141,   125,   130,   123,   130,
     209,   181,   130,   130,   181,    71,   145,    70,   145,   123,
     250,   250,   250,   250,    70,    71,   145,   244,   125,   125,
     244,   125,   124,   244,   125,   251,   181,   145,   267,   191,
     144,   178,   241,   227,   227,   181,   123,   130,   130,   250,
     250,    71,   145,    70,   145,    71,   145,    70,   145,   250,
     250,   244,   244,   244,   180,   244,   125,   180,   143,   145,
     241,   243,   145,   145,   250,   250,   250,   250,    71,   145,
      70,   145,    65,   125,   244,   125,   131,   145,   145,   145,
     145,   145,   250,   250,   244,   143,   244,   145,   241,   145,
     145
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
#line 3843 "type.ec"
	break;
      case 149: /* "type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3852 "type.ec"
	break;
      case 150: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3861 "type.ec"
	break;
      case 151: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3870 "type.ec"
	break;
      case 152: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3879 "type.ec"
	break;
      case 153: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3888 "type.ec"
	break;
      case 154: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3897 "type.ec"
	break;
      case 155: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3906 "type.ec"
	break;
      case 156: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3915 "type.ec"
	break;
      case 157: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3924 "type.ec"
	break;
      case 159: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3933 "type.ec"
	break;
      case 161: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3942 "type.ec"
	break;
      case 163: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3951 "type.ec"
	break;
      case 165: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3960 "type.ec"
	break;
      case 166: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3969 "type.ec"
	break;
      case 167: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3978 "type.ec"
	break;
      case 168: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3987 "type.ec"
	break;
      case 170: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3996 "type.ec"
	break;
      case 171: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4005 "type.ec"
	break;
      case 172: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4014 "type.ec"
	break;
      case 173: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4023 "type.ec"
	break;
      case 174: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4032 "type.ec"
	break;
      case 175: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4041 "type.ec"
	break;
      case 176: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4050 "type.ec"
	break;
      case 177: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4059 "type.ec"
	break;
      case 178: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4068 "type.ec"
	break;
      case 180: /* "expression" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 4077 "type.ec"
	break;
      case 181: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4086 "type.ec"
	break;
      case 182: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4095 "type.ec"
	break;
      case 183: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4104 "type.ec"
	break;
      case 184: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4113 "type.ec"
	break;
      case 185: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4122 "type.ec"
	break;
      case 186: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4131 "type.ec"
	break;
      case 190: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4140 "type.ec"
	break;
      case 191: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4149 "type.ec"
	break;
      case 192: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4158 "type.ec"
	break;
      case 193: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 222 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4167 "type.ec"
	break;
      case 195: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4176 "type.ec"
	break;
      case 196: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 223 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4185 "type.ec"
	break;
      case 197: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 224 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4194 "type.ec"
	break;
      case 198: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 221 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4203 "type.ec"
	break;
      case 199: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4212 "type.ec"
	break;
      case 200: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4221 "type.ec"
	break;
      case 201: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4230 "type.ec"
	break;
      case 202: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4239 "type.ec"
	break;
      case 203: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4248 "type.ec"
	break;
      case 204: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4257 "type.ec"
	break;
      case 205: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 220 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4266 "type.ec"
	break;
      case 206: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4275 "type.ec"
	break;
      case 207: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4284 "type.ec"
	break;
      case 208: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4293 "type.ec"
	break;
      case 211: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4302 "type.ec"
	break;
      case 212: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4311 "type.ec"
	break;
      case 213: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4320 "type.ec"
	break;
      case 214: /* "property" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4329 "type.ec"
	break;
      case 215: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4338 "type.ec"
	break;
      case 216: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4347 "type.ec"
	break;
      case 217: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4356 "type.ec"
	break;
      case 218: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4365 "type.ec"
	break;
      case 219: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4374 "type.ec"
	break;
      case 220: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4383 "type.ec"
	break;
      case 221: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4392 "type.ec"
	break;
      case 222: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4401 "type.ec"
	break;
      case 223: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4410 "type.ec"
	break;
      case 224: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4419 "type.ec"
	break;
      case 225: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4428 "type.ec"
	break;
      case 226: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4437 "type.ec"
	break;
      case 227: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4446 "type.ec"
	break;
      case 228: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4455 "type.ec"
	break;
      case 229: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4464 "type.ec"
	break;
      case 230: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4473 "type.ec"
	break;
      case 231: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4482 "type.ec"
	break;
      case 232: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4491 "type.ec"
	break;
      case 233: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4500 "type.ec"
	break;
      case 234: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 169 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4509 "type.ec"
	break;
      case 235: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4518 "type.ec"
	break;
      case 236: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4527 "type.ec"
	break;
      case 237: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4536 "type.ec"
	break;
      case 238: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4545 "type.ec"
	break;
      case 239: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4554 "type.ec"
	break;
      case 240: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4563 "type.ec"
	break;
      case 241: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4572 "type.ec"
	break;
      case 242: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4581 "type.ec"
	break;
      case 243: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4590 "type.ec"
	break;
      case 244: /* "statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4599 "type.ec"
	break;
      case 245: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4608 "type.ec"
	break;
      case 246: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4617 "type.ec"
	break;
      case 247: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4626 "type.ec"
	break;
      case 248: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4635 "type.ec"
	break;
      case 249: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4644 "type.ec"
	break;
      case 250: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4653 "type.ec"
	break;
      case 251: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4662 "type.ec"
	break;
      case 252: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4671 "type.ec"
	break;
      case 253: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4680 "type.ec"
	break;
      case 254: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4689 "type.ec"
	break;
      case 255: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4698 "type.ec"
	break;
      case 256: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4707 "type.ec"
	break;
      case 258: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4716 "type.ec"
	break;
      case 260: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4725 "type.ec"
	break;
      case 261: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4734 "type.ec"
	break;
      case 262: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4743 "type.ec"
	break;
      case 263: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4752 "type.ec"
	break;
      case 264: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4761 "type.ec"
	break;
      case 265: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4770 "type.ec"
	break;
      case 266: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4779 "type.ec"
	break;
      case 267: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4788 "type.ec"
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
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 880 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 889 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 895 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 907 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 918 "type.y"
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

  case 291:

/* Line 1464 of yacc.c  */
#line 942 "type.y"
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

  case 292:

/* Line 1464 of yacc.c  */
#line 956 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 957 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 961 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 962 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 966 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 967 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 971 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 975 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 976 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 981 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 989 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1000 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1011 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1031 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1032 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1033 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1038 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1040 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1057 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1058 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1064 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1065 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1066 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1067 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1081 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1089 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1091 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1107 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1118 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1126 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1127 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1128 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1137 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1138 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1188 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1190 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1197 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1199 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1201 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1203 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1209 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1214 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1216 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1226 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1228 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1230 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1237 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1239 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1252 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1256 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1257 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1258 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1259 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1268 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1269 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1274 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1276 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1277 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1289 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1313 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1314 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1318 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1319 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1331 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1333 "type.y"
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

  case 427:

/* Line 1464 of yacc.c  */
#line 1349 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1351 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1373 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1375 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1389 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1391 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1393 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1397 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1402 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1403 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1406 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1410 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1411 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1412 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1416 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1421 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1429 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1433 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1434 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1438 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1439 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1440 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1444 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1446 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1447 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1458 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1459 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1463 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1468 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1470 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1475 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1477 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1502 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1506 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1508 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1515 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1519 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1521 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1527 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1533 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1535 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1540 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1544 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1545 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1550 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1552 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1557 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1562 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1564 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1565 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1566 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1572 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1576 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1577 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8477 "type.ec"
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
#line 1580 "type.y"


