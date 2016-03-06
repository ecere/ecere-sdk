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
#line 1 "expression.y"


import "ecdefs"

#define YYSIZE_T size_t
#define YYLTYPE Location
#include "grammar.h"

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  (Current).start = (Rhs)[1].start;      \
  (Current).end = (Rhs)[N].end;
#endif

Expression parsedExpression;

#define yyparse expression_yyparse
#define yylval  expression_yylval
#define yychar  expression_yychar
#define yydebug expression_yydebug
#define yynerrs expression_yynerrs
#define yylloc expression_yylloc

// #define PRECOMPILER
extern File fileInput;
extern char * yytext;

int yylex();
int yyerror();

#define uint _uint
default:



/* Line 189 of yacc.c  */
#line 108 "expression.ec"

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
#line 38 "expression.y"

   int i;
   AccessMode declMode;
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



/* Line 214 of yacc.c  */
#line 300 "expression.ec"
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
#line 325 "expression.ec"

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
#define YYFINAL  154
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7763

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  146
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  429
/* YYNRULES -- Number of states.  */
#define YYNSTATES  750

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
       2,     2,     2,   133,     2,     2,   123,   135,   128,     2,
     121,   122,   129,   130,   127,   131,   124,   134,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   141,   143,
     136,   142,   137,   140,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   125,     2,   126,   138,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   144,   139,   145,   132,     2,     2,     2,
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
       0,     0,     3,     5,     7,    11,    13,    15,    17,    19,
      21,    24,    29,    32,    39,    45,    52,    58,    66,    73,
      81,    88,    90,    92,    94,    99,   103,   108,   112,   115,
     119,   122,   125,   127,   129,   133,   137,   140,   143,   146,
     149,   154,   157,   162,   164,   166,   168,   170,   172,   174,
     176,   178,   180,   182,   187,   189,   193,   197,   201,   203,
     207,   211,   213,   217,   221,   223,   227,   231,   235,   239,
     241,   245,   249,   251,   255,   257,   261,   263,   267,   269,
     273,   275,   279,   281,   287,   289,   293,   297,   301,   305,
     307,   309,   311,   313,   315,   317,   319,   321,   323,   325,
     327,   329,   333,   335,   338,   342,   345,   351,   353,   356,
     358,   361,   363,   366,   368,   371,   373,   376,   378,   381,
     383,   386,   388,   391,   393,   396,   398,   401,   403,   406,
     408,   411,   413,   416,   418,   421,   423,   426,   428,   431,
     433,   436,   438,   441,   443,   447,   449,   453,   455,   457,
     459,   461,   463,   465,   467,   469,   471,   473,   475,   477,
     479,   481,   483,   485,   487,   492,   494,   497,   501,   508,
     514,   516,   518,   520,   522,   524,   526,   528,   530,   532,
     534,   536,   538,   540,   542,   544,   546,   548,   550,   552,
     554,   556,   558,   560,   562,   567,   569,   571,   573,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   601,   603,   605,   610,   612,   618,   623,   628,
     632,   638,   645,   651,   657,   662,   669,   672,   675,   679,
     683,   685,   687,   689,   692,   696,   698,   702,   712,   722,
     730,   738,   744,   755,   766,   775,   784,   791,   800,   809,
     816,   823,   828,   838,   848,   856,   864,   870,   874,   877,
     880,   883,   885,   888,   890,   892,   894,   898,   900,   903,
     906,   910,   916,   919,   922,   927,   933,   941,   949,   955,
     957,   961,   963,   967,   971,   974,   978,   982,   986,   991,
     996,   999,  1003,  1007,  1012,  1016,  1019,  1023,  1027,  1032,
    1034,  1036,  1039,  1042,  1045,  1049,  1051,  1053,  1056,  1059,
    1062,  1066,  1068,  1071,  1075,  1077,  1081,  1086,  1090,  1095,
    1097,  1100,  1103,  1107,  1111,  1113,  1115,  1118,  1121,  1124,
    1128,  1132,  1135,  1137,  1140,  1142,  1145,  1148,  1152,  1154,
    1158,  1160,  1164,  1167,  1170,  1172,  1174,  1178,  1180,  1183,
    1185,  1189,  1194,  1196,  1198,  1200,  1204,  1206,  1208,  1210,
    1212,  1214,  1216,  1220,  1225,  1229,  1231,  1234,  1236,  1239,
    1242,  1244,  1246,  1249,  1251,  1254,  1258,  1260,  1263,  1269,
    1277,  1283,  1289,  1297,  1304,  1312,  1317,  1323,  1328,  1332,
    1335,  1338,  1341,  1345,  1347,  1353,  1358,  1363,  1367,  1372,
    1376,  1380,  1383,  1386,  1388,  1392,  1397,  1401,  1404,  1407,
    1410,  1413,  1416,  1419,  1422,  1425,  1429,  1431,  1433,  1437,
    1440,  1442,  1444,  1447,  1450,  1452,  1455,  1457,  1459,  1462
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     252,     0,    -1,     3,    -1,   149,    -1,   121,   170,   122,
      -1,   147,    -1,   238,    -1,     4,    -1,   119,    -1,   236,
      -1,   123,   236,    -1,   123,   236,   124,   236,    -1,   121,
     122,    -1,    72,   174,   208,   125,   171,   126,    -1,    72,
     174,   125,   171,   126,    -1,   103,   174,   208,   125,   171,
     126,    -1,   103,   174,   125,   171,   126,    -1,    73,   171,
     176,   208,   125,   171,   126,    -1,    73,   171,   176,   125,
     171,   126,    -1,   104,   171,   176,   208,   125,   171,   126,
      -1,   104,   171,   176,   125,   171,   126,    -1,     1,    -1,
     239,    -1,   148,    -1,   151,   125,   170,   126,    -1,   151,
     121,   122,    -1,   151,   121,   152,   122,    -1,   151,   124,
     147,    -1,   151,   147,    -1,   151,     7,   147,    -1,   151,
       8,    -1,   151,     9,    -1,   168,    -1,   150,    -1,   152,
     127,   168,    -1,   152,   127,   150,    -1,     8,   154,    -1,
       9,   154,    -1,   155,   156,    -1,     6,   154,    -1,     6,
     121,   221,   122,    -1,   110,   154,    -1,   110,   121,   221,
     122,    -1,   153,    -1,   151,    -1,   128,    -1,   129,    -1,
     130,    -1,   131,    -1,   132,    -1,   133,    -1,    74,    -1,
     154,    -1,   121,   221,   122,   156,    -1,   156,    -1,   157,
     129,   156,    -1,   157,   134,   156,    -1,   157,   135,   156,
      -1,   157,    -1,   158,   130,   157,    -1,   158,   131,   157,
      -1,   158,    -1,   159,    10,   158,    -1,   159,    11,   158,
      -1,   159,    -1,   160,   136,   159,    -1,   160,   137,   159,
      -1,   160,    12,   159,    -1,   160,    13,   159,    -1,   160,
      -1,   161,    14,   160,    -1,   161,    15,   160,    -1,   161,
      -1,   162,   128,   161,    -1,   162,    -1,   163,   138,   162,
      -1,   163,    -1,   164,   139,   163,    -1,   164,    -1,   165,
      16,   164,    -1,   165,    -1,   166,    17,   165,    -1,   166,
      -1,   166,   140,   170,   141,   167,    -1,   167,    -1,   154,
     169,   168,    -1,   167,   169,   168,    -1,   154,   169,   150,
      -1,   167,   169,   150,    -1,   142,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   168,    -1,   170,
     127,   168,    -1,   167,    -1,   174,   143,    -1,   174,   177,
     143,    -1,   237,   143,    -1,    78,   147,   142,   171,   143,
      -1,   186,    -1,   173,   186,    -1,   189,    -1,   173,   189,
      -1,   202,    -1,   173,   202,    -1,   191,    -1,   173,   191,
      -1,   179,    -1,   174,   179,    -1,   186,    -1,   174,   186,
      -1,   189,    -1,   174,   189,    -1,   202,    -1,   174,   202,
      -1,   191,    -1,   174,   191,    -1,   179,    -1,   175,   179,
      -1,   186,    -1,   175,   186,    -1,   189,    -1,   175,   189,
      -1,   187,    -1,   175,   187,    -1,   179,    -1,   176,   179,
      -1,   186,    -1,   176,   186,    -1,   190,    -1,   176,   190,
      -1,   191,    -1,   176,   191,    -1,   202,    -1,   176,   202,
      -1,   178,    -1,   177,   127,   178,    -1,   209,    -1,   209,
     142,   222,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   118,    -1,    75,    -1,   185,    -1,    80,
      -1,   111,    -1,   112,    -1,     3,    -1,    28,    -1,    76,
      -1,    75,    -1,    45,    -1,   182,    -1,   182,   121,   170,
     122,    -1,   183,    -1,   184,   183,    -1,   184,   127,   183,
      -1,   181,   121,   121,   184,   122,   122,    -1,   181,   121,
     121,   122,   122,    -1,    45,    -1,    46,    -1,    76,    -1,
     188,    -1,    28,    -1,    47,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    39,    -1,    48,    -1,
      40,    -1,    43,    -1,    44,    -1,    41,    -1,    42,    -1,
      86,    -1,   114,    -1,   113,    -1,   192,    -1,   201,    -1,
     187,    -1,   101,   121,   187,   122,    -1,    67,    -1,    47,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    39,    -1,    48,    -1,    40,    -1,    43,    -1,    44,
      -1,    41,    -1,    42,    -1,   114,    -1,   113,    -1,   192,
      -1,   201,    -1,   188,    -1,   101,   121,   187,   122,    -1,
      67,    -1,   193,   147,   144,   194,   145,    -1,   193,   144,
     194,   145,    -1,   193,   147,   144,   145,    -1,   193,   144,
     145,    -1,   193,   188,   144,   194,   145,    -1,   193,   180,
     147,   144,   194,   145,    -1,   193,   180,   144,   194,   145,
      -1,   193,   180,   147,   144,   145,    -1,   193,   180,   144,
     145,    -1,   193,   180,   188,   144,   194,   145,    -1,   193,
     147,    -1,   193,   188,    -1,   193,   180,   147,    -1,   193,
     180,   188,    -1,    49,    -1,    50,    -1,   198,    -1,   194,
     198,    -1,   151,   142,   223,    -1,   195,    -1,   196,   127,
     195,    -1,    69,   175,   147,   144,    70,   231,    71,   231,
     145,    -1,    69,   175,   147,   144,    71,   231,    70,   231,
     145,    -1,    69,   175,   147,   144,    70,   231,   145,    -1,
      69,   175,   147,   144,    71,   231,   145,    -1,    69,   175,
     147,   144,   145,    -1,    69,   175,   207,   147,   144,    70,
     231,    71,   231,   145,    -1,    69,   175,   207,   147,   144,
      71,   231,    70,   231,   145,    -1,    69,   175,   207,   147,
     144,    70,   231,   145,    -1,    69,   175,   207,   147,   144,
      71,   231,   145,    -1,    69,   175,   207,   147,   144,   145,
      -1,    69,   175,   144,    70,   231,    71,   231,   145,    -1,
      69,   175,   144,    71,   231,    70,   231,   145,    -1,    69,
     175,   144,    70,   231,   145,    -1,    69,   175,   144,    71,
     231,   145,    -1,    69,   175,   144,   145,    -1,    69,   175,
     207,   144,    70,   231,    71,   231,   145,    -1,    69,   175,
     207,   144,    71,   231,    70,   231,   145,    -1,    69,   175,
     207,   144,    70,   231,   145,    -1,    69,   175,   207,   144,
      71,   231,   145,    -1,    69,   175,   207,   144,   145,    -1,
     174,   199,   143,    -1,   174,   143,    -1,   238,   143,    -1,
     237,   143,    -1,   244,    -1,   196,   143,    -1,   197,    -1,
     143,    -1,   200,    -1,   199,   127,   200,    -1,   209,    -1,
     209,   185,    -1,   141,   171,    -1,   209,   141,   171,    -1,
     209,   141,   171,   141,   171,    -1,    51,   147,    -1,    51,
     188,    -1,    51,   144,   203,   145,    -1,    51,   147,   144,
     203,   145,    -1,    51,   147,   144,   203,   143,   194,   145,
      -1,    51,   188,   144,   203,   143,   194,   145,    -1,    51,
     188,   144,   203,   145,    -1,   204,    -1,   203,   127,   204,
      -1,   147,    -1,   147,   142,   171,    -1,   121,   207,   122,
      -1,   125,   126,    -1,   125,   171,   126,    -1,   125,   187,
     126,    -1,   205,   125,   126,    -1,   205,   125,   171,   126,
      -1,   205,   125,   187,   126,    -1,   121,   122,    -1,   121,
     217,   122,    -1,   205,   121,   122,    -1,   205,   121,   217,
     122,    -1,   121,   208,   122,    -1,   121,   122,    -1,   121,
     217,   122,    -1,   206,   121,   122,    -1,   206,   121,   217,
     122,    -1,   216,    -1,   205,    -1,   216,   205,    -1,   180,
     216,    -1,   180,   205,    -1,   180,   216,   205,    -1,   216,
      -1,   206,    -1,   216,   206,    -1,   180,   216,    -1,   180,
     206,    -1,   180,   216,   206,    -1,   212,    -1,   216,   212,
      -1,   180,   216,   212,    -1,   147,    -1,   121,   209,   122,
      -1,   210,   125,   171,   126,    -1,   210,   125,   126,    -1,
     210,   125,   187,   126,    -1,   214,    -1,   216,   214,    -1,
     180,   214,    -1,   180,   216,   214,    -1,   216,   180,   214,
      -1,   214,    -1,   210,    -1,   180,   214,    -1,   180,   210,
      -1,   210,   121,    -1,   213,   217,   122,    -1,   213,   220,
     122,    -1,   213,   122,    -1,   186,    -1,   215,   186,    -1,
     129,    -1,   129,   215,    -1,   129,   216,    -1,   129,   215,
     216,    -1,   218,    -1,   218,   127,    52,    -1,   219,    -1,
     218,   127,   219,    -1,   174,   209,    -1,   174,   207,    -1,
     174,    -1,   147,    -1,   220,   127,   147,    -1,   173,    -1,
     173,   207,    -1,   168,    -1,   144,   224,   145,    -1,   144,
     224,   127,   145,    -1,   167,    -1,   150,    -1,   222,    -1,
     224,   127,   222,    -1,   226,    -1,   231,    -1,   232,    -1,
     233,    -1,   234,    -1,   235,    -1,   147,   141,   225,    -1,
      53,   171,   141,   225,    -1,    54,   141,   225,    -1,   172,
      -1,   227,   172,    -1,   225,    -1,   228,   225,    -1,   228,
     172,    -1,   228,    -1,   227,    -1,   227,   228,    -1,   144,
      -1,   144,   145,    -1,   230,   229,   145,    -1,   143,    -1,
     170,   143,    -1,    55,   121,   170,   122,   225,    -1,    55,
     121,   170,   122,   225,    65,   225,    -1,    56,   121,   170,
     122,   225,    -1,    57,   121,   170,   122,   225,    -1,    58,
     225,    57,   121,   170,   122,   143,    -1,    59,   121,   232,
     232,   122,   225,    -1,    59,   121,   232,   232,   170,   122,
     225,    -1,    57,   121,   122,   225,    -1,    59,   121,   232,
     122,   225,    -1,    59,   121,   122,   225,    -1,    60,   147,
     143,    -1,    61,   143,    -1,    62,   143,    -1,    63,   143,
      -1,    63,   170,   143,    -1,     5,    -1,   174,   147,   144,
     251,   145,    -1,   174,   147,   144,   145,    -1,   187,   144,
     251,   145,    -1,   187,   144,   145,    -1,   147,   144,   251,
     145,    -1,   147,   144,   145,    -1,   144,   251,   145,    -1,
     144,   145,    -1,   174,   211,    -1,   211,    -1,   174,   121,
     122,    -1,   132,   174,   121,   122,    -1,    79,   174,   211,
      -1,    79,   211,    -1,   240,   231,    -1,   243,   231,    -1,
     243,   143,    -1,   241,   231,    -1,   242,   231,    -1,   174,
     211,    -1,   245,   231,    -1,   151,   142,   223,    -1,   223,
      -1,   247,    -1,   248,   127,   247,    -1,   248,   143,    -1,
     249,    -1,   246,    -1,   250,   249,    -1,   250,   246,    -1,
     143,    -1,   250,   143,    -1,   250,    -1,   248,    -1,   250,
     248,    -1,   168,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   216,   216,   221,   222,   227,   229,   231,   233,   234,
     236,   237,   238,   241,   242,   243,   244,   245,   246,   247,
     248,   249,   253,   257,   258,   259,   260,   261,   262,   275,
     276,   277,   307,   308,   309,   310,   314,   315,   316,   319,
     320,   323,   324,   328,   329,   338,   339,   340,   341,   342,
     343,   344,   348,   349,   353,   354,   355,   356,   360,   361,
     362,   366,   367,   368,   372,   373,   374,   375,   376,   380,
     381,   382,   386,   387,   391,   392,   396,   397,   401,   402,
     406,   407,   411,   412,   416,   417,   418,   420,   421,   425,
     426,   427,   428,   429,   430,   431,   432,   433,   434,   435,
     439,   440,   444,   448,   449,   450,   451,   455,   456,   457,
     458,   459,   460,   461,   462,   466,   467,   468,   469,   470,
     471,   472,   473,   474,   475,   480,   481,   482,   483,   484,
     485,   486,   487,   491,   492,   493,   494,   495,   496,   497,
     498,   499,   500,   504,   505,   509,   510,   514,   515,   516,
     517,   518,   519,   523,   524,   528,   529,   530,   535,   536,
     537,   538,   539,   543,   544,   548,   549,   550,   554,   555,
     559,   560,   561,   565,   590,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   604,   605,   606,   607,   608,
     609,   610,   611,   612,   613,   614,   618,   619,   620,   621,
     622,   623,   624,   625,   626,   627,   628,   629,   630,   631,
     632,   633,   634,   635,   636,   637,   642,   643,   644,   645,
     646,   649,   650,   651,   652,   653,   658,   659,   662,   664,
     669,   670,   674,   675,   679,   683,   684,   688,   690,   692,
     694,   696,   699,   701,   703,   705,   707,   710,   712,   714,
     716,   718,   721,   723,   725,   727,   729,   734,   735,   736,
     737,   738,   739,   740,   741,   745,   747,   752,   754,   756,
     758,   760,   765,   766,   770,   772,   773,   774,   775,   779,
     781,   786,   788,   794,   796,   798,   800,   802,   804,   806,
     808,   810,   812,   814,   819,   821,   823,   825,   827,   832,
     833,   834,   835,   836,   837,   841,   842,   843,   844,   845,
     846,   892,   893,   895,   901,   903,   905,   907,   909,   914,
     915,   918,   920,   922,   928,   929,   930,   932,   937,   941,
     943,   945,   950,   951,   955,   956,   957,   958,   962,   963,
     967,   968,   972,   973,   974,   978,   979,   983,   984,   993,
     995,   997,  1013,  1014,  1035,  1037,  1042,  1043,  1044,  1045,
    1046,  1047,  1051,  1053,  1055,  1060,  1061,  1065,  1066,  1069,
    1073,  1074,  1075,  1079,  1083,  1091,  1096,  1097,  1101,  1102,
    1103,  1107,  1108,  1109,  1110,  1112,  1113,  1114,  1118,  1119,
    1120,  1121,  1122,  1126,  1130,  1132,  1137,  1139,  1141,  1143,
    1148,  1150,  1155,  1157,  1162,  1167,  1172,  1174,  1179,  1181,
    1183,  1185,  1187,  1193,  1198,  1203,  1204,  1208,  1210,  1215,
    1220,  1221,  1222,  1223,  1224,  1225,  1229,  1230,  1231,  1235
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
  "RESTRICT", "THREAD", "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF", "'('",
  "')'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'",
  "'~'", "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "identifier",
  "primary_expression", "simple_primary_expression",
  "anon_instantiation_expression", "postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "unary_operator", "cast_expression",
  "multiplicative_expression", "additive_expression", "shift_expression",
  "relational_expression", "equality_expression", "and_expression",
  "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "constant_expression", "declaration",
  "specifier_qualifier_list", "declaration_specifiers",
  "property_specifiers", "renew_specifiers", "init_declarator_list",
  "init_declarator", "storage_class_specifier", "ext_decl", "_attrib",
  "attribute_word", "attribute", "attribs_list", "attrib",
  "type_qualifier", "type", "strict_type", "type_specifier",
  "strict_type_specifier", "struct_or_union_specifier_compound",
  "struct_or_union_specifier_nocompound", "struct_or_union",
  "struct_declaration_list", "default_property", "default_property_list",
  "property", "struct_declaration", "struct_declarator_list",
  "struct_declarator", "enum_specifier_nocompound",
  "enum_specifier_compound", "enumerator_list", "enumerator",
  "direct_abstract_declarator", "direct_abstract_declarator_noarray",
  "abstract_declarator", "abstract_declarator_noarray", "declarator",
  "direct_declarator_nofunction", "declarator_function",
  "direct_declarator", "direct_declarator_function_start",
  "direct_declarator_function", "type_qualifier_list", "pointer",
  "parameter_type_list", "parameter_list", "parameter_declaration",
  "identifier_list", "type_name", "initializer", "initializer_condition",
  "initializer_list", "statement", "labeled_statement", "declaration_list",
  "statement_list", "compound_inside", "compound_start",
  "compound_statement", "expression_statement", "selection_statement",
  "iteration_statement", "jump_statement", "string_literal",
  "instantiation_named", "instantiation_unnamed", "instantiation_anon",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "class_function_definition",
  "instance_class_function_definition_start",
  "instance_class_function_definition", "data_member_initialization",
  "data_member_initialization_list",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "expression_unit", 0
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
     375,    40,    41,    36,    46,    91,    93,    44,    38,    42,
      43,    45,   126,    33,    47,    37,    60,    62,    94,   124,
      63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   146,   147,   148,   148,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   150,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   152,   152,   152,   152,   153,   153,   153,   153,
     153,   153,   153,   154,   154,   155,   155,   155,   155,   155,
     155,   155,   156,   156,   157,   157,   157,   157,   158,   158,
     158,   159,   159,   159,   160,   160,   160,   160,   160,   161,
     161,   161,   162,   162,   163,   163,   164,   164,   165,   165,
     166,   166,   167,   167,   168,   168,   168,   168,   168,   169,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     170,   170,   171,   172,   172,   172,   172,   173,   173,   173,
     173,   173,   173,   173,   173,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   175,   175,   175,   175,   175,
     175,   175,   175,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   177,   177,   178,   178,   179,   179,   179,
     179,   179,   179,   180,   180,   181,   181,   181,   182,   182,
     182,   182,   182,   183,   183,   184,   184,   184,   185,   185,
     186,   186,   186,   187,   188,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   191,   191,   191,   191,
     191,   191,   191,   191,   191,   191,   192,   192,   192,   192,
     193,   193,   194,   194,   195,   196,   196,   197,   197,   197,
     197,   197,   197,   197,   197,   197,   197,   197,   197,   197,
     197,   197,   197,   197,   197,   197,   197,   198,   198,   198,
     198,   198,   198,   198,   198,   199,   199,   200,   200,   200,
     200,   200,   201,   201,   202,   202,   202,   202,   202,   203,
     203,   204,   204,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   206,   206,   206,   206,   206,   207,
     207,   207,   207,   207,   207,   208,   208,   208,   208,   208,
     208,   209,   209,   209,   210,   210,   210,   210,   210,   211,
     211,   211,   211,   211,   212,   212,   212,   212,   213,   214,
     214,   214,   215,   215,   216,   216,   216,   216,   217,   217,
     218,   218,   219,   219,   219,   220,   220,   221,   221,   222,
     222,   222,   223,   223,   224,   224,   225,   225,   225,   225,
     225,   225,   226,   226,   226,   227,   227,   228,   228,   228,
     229,   229,   229,   230,   231,   231,   232,   232,   233,   233,
     233,   234,   234,   234,   234,   234,   234,   234,   235,   235,
     235,   235,   235,   236,   237,   237,   238,   238,   238,   238,
     239,   239,   240,   240,   241,   242,   243,   243,   244,   244,
     244,   244,   244,   245,   246,   247,   247,   248,   248,   249,
     250,   250,   250,   250,   250,   250,   251,   251,   251,   252
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     1,
       2,     4,     2,     6,     5,     6,     5,     7,     6,     7,
       6,     1,     1,     1,     4,     3,     4,     3,     2,     3,
       2,     2,     1,     1,     3,     3,     2,     2,     2,     2,
       4,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     5,     1,     3,     3,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     3,     2,     5,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     3,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     1,     2,     3,     6,     5,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     1,     5,     4,     4,     3,
       5,     6,     5,     5,     4,     6,     2,     2,     3,     3,
       1,     1,     1,     2,     3,     1,     3,     9,     9,     7,
       7,     5,    10,    10,     8,     8,     6,     8,     8,     6,
       6,     4,     9,     9,     7,     7,     5,     3,     2,     2,
       2,     1,     2,     1,     1,     1,     3,     1,     2,     2,
       3,     5,     2,     2,     4,     5,     7,     7,     5,     1,
       3,     1,     3,     3,     2,     3,     3,     3,     4,     4,
       2,     3,     3,     4,     3,     2,     3,     3,     4,     1,
       1,     2,     2,     2,     3,     1,     1,     2,     2,     2,
       3,     1,     2,     3,     1,     3,     4,     3,     4,     1,
       2,     2,     3,     3,     1,     1,     2,     2,     2,     3,
       3,     2,     1,     2,     1,     2,     2,     3,     1,     3,
       1,     3,     2,     2,     1,     1,     3,     1,     2,     1,
       3,     4,     1,     1,     1,     3,     1,     1,     1,     1,
       1,     1,     3,     4,     3,     1,     2,     1,     2,     2,
       1,     1,     2,     1,     2,     3,     1,     2,     5,     7,
       5,     5,     7,     6,     7,     4,     5,     4,     3,     2,
       2,     2,     3,     1,     5,     4,     4,     3,     4,     3,
       3,     2,     2,     1,     3,     4,     3,     2,     2,     2,
       2,     2,     2,     2,     2,     3,     1,     1,     3,     2,
       1,     1,     2,     2,     1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    21,     2,     7,   393,     0,     0,     0,   174,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   429,     0,   173,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   176,
     177,   178,   179,   180,   181,   183,   186,   187,   184,   185,
     170,   171,   175,   182,   230,   231,     0,   195,   172,   188,
       0,   190,   189,   152,     0,   115,   117,   193,   119,   123,
     191,     0,   192,   121,    52,   102,     0,     0,     0,     0,
      41,    12,   100,     0,   347,   107,   193,   109,   113,   111,
       0,    10,     0,     0,    30,    31,     0,     0,     0,    28,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
      89,     0,    38,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,     0,   272,   273,     0,
     153,   155,   156,   157,     0,     0,   334,   116,     0,     0,
     154,   118,   120,   124,   122,   306,     0,   305,     0,   226,
       0,   227,   197,   198,   199,   200,   201,   202,   204,   207,
     208,   205,   206,   196,   203,   215,     0,   210,   209,     0,
     133,   135,   213,   137,   139,   211,   212,   141,     0,     0,
       0,     0,     4,     0,     0,     0,     0,   108,   110,   114,
     112,   300,   348,   299,     0,     0,   424,     0,   399,   353,
      44,   352,     0,   416,    22,     0,   421,   417,   427,   420,
       0,     0,    29,    25,    33,     0,    32,    27,     0,    87,
      85,    55,    56,    57,    59,    60,    62,    63,    67,    68,
      65,    66,    70,    71,    73,    75,    77,    79,    81,     0,
      88,    86,   397,     0,    40,   281,     0,   279,     0,     0,
       0,   295,   344,     0,     0,   338,   340,     0,   332,   335,
     336,   309,   308,     0,     0,     0,   307,     0,     0,     0,
       0,   264,   219,     5,     0,     0,     0,     0,   235,     0,
     263,   232,     0,   403,     0,   319,     0,     0,     6,     0,
       0,     0,     0,   261,     0,     0,   228,   229,     0,     0,
       0,   134,   136,   138,   140,   142,     0,     0,     0,     0,
       0,    42,   101,   290,     0,     0,   284,     0,     0,   303,
     302,     0,     0,   301,    53,    11,   401,     0,     0,     0,
     314,   413,   373,     0,   414,     0,   419,   425,   423,   428,
     422,   398,    26,     0,    24,     0,   396,     0,     0,   274,
       0,     0,   194,     0,     0,   343,   342,   325,   311,   324,
     299,   294,   296,     0,    14,   333,   337,   310,     0,   297,
       0,     0,     0,     0,   125,   127,   131,   129,     0,     0,
     407,     0,    46,     0,     0,     0,     0,     0,     0,     0,
     258,   314,     0,     0,   265,   267,   402,   324,     0,   321,
       0,   217,   233,     0,   262,   328,     0,   331,   345,     0,
       0,     0,   320,   260,   259,   408,   411,   412,   410,   409,
     218,     0,   224,     0,     0,     0,     0,     0,     0,     0,
      16,     0,     0,     0,   283,   291,   285,   286,   304,   292,
       0,   287,     0,     0,   400,   415,   374,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   376,
       5,     0,   365,     0,   367,   356,     0,     0,     0,   357,
     358,   359,   360,   361,     0,   418,    35,    34,    83,   282,
     280,     0,   275,     0,   278,   327,   326,   302,     0,   312,
     339,   341,   158,   159,   162,   161,   160,     0,   163,   165,
       0,   298,    13,   272,   273,     0,     0,   126,   128,   132,
     130,     0,   226,     0,   227,   406,     0,   315,     0,   234,
     404,   269,     0,   326,     0,     0,   257,     0,   268,     0,
     324,   322,   236,   317,     0,     0,   329,   330,     0,   323,
     216,   222,   223,     0,     0,   220,   214,    18,     0,    15,
      20,     0,   293,   288,   289,     0,     0,     0,     0,     0,
       0,     0,     0,   389,   390,   391,     0,     0,     0,   377,
     103,     0,   143,   145,   366,     0,   369,   368,   375,   105,
       0,     0,   313,   169,     0,     0,     0,   166,     0,     0,
     251,     0,     0,     0,   228,   229,   405,   395,     0,   324,
     266,   270,   326,   316,   318,   346,   221,   225,    17,    19,
       0,   364,     0,     0,     0,     0,     0,     0,     0,   388,
     392,     0,   362,     0,   104,     0,   276,   277,     0,   168,
     167,     0,     0,     0,     0,   241,     0,     0,   256,     0,
     394,     0,   363,     0,     0,   385,     0,     0,   387,     0,
       0,     0,   144,     0,   349,   146,   164,     0,   249,     0,
     250,     0,     0,     0,     0,     0,     0,   246,   271,   378,
     380,   381,     0,   386,     0,     0,   106,   354,     0,     0,
       0,     0,   239,     0,   240,     0,   254,     0,   255,     0,
       0,     0,     0,   383,     0,     0,   350,   247,   248,     0,
       0,     0,     0,     0,   244,     0,   245,   379,   382,   384,
     351,   355,   237,   238,   252,   253,     0,     0,   242,   243
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   229,    27,   245,    28,    94,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   102,   131,   491,    96,   606,   104,   305,   403,
     199,   601,   602,    85,   306,   169,   528,   529,   530,   170,
      86,    44,    45,    88,   203,    89,    90,    91,   307,   308,
     309,   310,   311,   423,   424,    92,    93,   276,   277,   221,
     175,   344,   176,   414,   312,   313,   388,   314,   315,   289,
     316,   345,   285,   286,   440,   110,   685,   233,   708,   494,
     495,   496,   497,   498,   363,   499,   500,   501,   502,   503,
      46,   317,    47,   234,   319,   320,   321,   322,   323,   235,
     236,   237,   238,   239,   240,   241,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -629
static const yytype_int16 yypact[] =
{
    5725,  -629,  -629,  -629,  -629,  5765,  5799,  5799,  -629,  7463,
    5725,  -629,  7463,  5725,  5873,  -629,  5299,    69,  -629,  -629,
    -629,  -629,  -629,  -629,   -51,  -629,  -629,   335,  -629,   558,
    5725,  -629,   278,   160,   293,    60,   308,   -45,   -38,    20,
     105,    41,   558,  -629,    66,  -629,  -629,  -629,   193,  5299,
    -629,  5435,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,    33,  -629,  -629,  -629,
      91,  -629,  -629,  -629,  6482,  -629,  -629,  -629,  -629,  -629,
    -629,    64,  -629,  -629,  -629,  -629,  7645,  6584,  7645,  5299,
    -629,  -629,  -629,   -20,  6986,  -629,    66,  -629,  -629,  -629,
      97,   139,  2066,   277,  -629,  -629,  4411,   277,  5725,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    -629,  1054,  -629,  5725,  5725,  5725,  5725,  5725,  5725,  5725,
    5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,
    5725,  5725,  1054,  2199,  -629,   114,   277,   192,   222,   325,
    -629,  -629,  -629,  -629,  6686,  5725,    14,  -629,     5,   256,
    -629,  -629,  -629,  -629,  -629,   264,   262,   275,  2719,   250,
      47,   306,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,   347,  -629,  -629,  6788,
    -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  5725,   332,
    6890,   339,  -629,  5725,  6380,  5509,   324,  -629,  -629,  -629,
    -629,   190,  -629,   208,  5725,    69,  -629,  2332,  -629,  -629,
     103,  -629,  6183,  -629,  -629,   330,  -629,  -629,   -49,  -629,
    2465,   341,  -629,  -629,  -629,   107,  -629,  -629,   228,  -629,
    -629,  -629,  -629,  -629,   278,   278,   160,   160,   293,   293,
     293,   293,    60,    60,   308,   -45,   -38,    20,   105,   -61,
    -629,  -629,  -629,   353,  -629,   359,   -18,  -629,   277,   277,
     370,  -629,  6081,   382,   383,   379,  -629,   384,  -629,    14,
    -629,   264,   275,   387,  7088,  5725,   264,  7554,  6183,  5373,
    7463,  -629,  -629,   -51,   244,  4931,    49,  2840,  -629,   121,
    -629,  -629,   300,  -629,  6285,  -629,   444,   373,   374,   330,
     330,   330,   271,  -629,  2961,  3082,   377,   390,  4567,   325,
    5725,  -629,  -629,  -629,  -629,  -629,   393,   400,  5725,  5725,
     402,  -629,  -629,  -629,   414,   415,  -629,   412,   100,   190,
     208,  7183,  5543,   190,  -629,  -629,  -629,   394,  1054,   120,
    -629,  -629,   395,  4236,  -629,  1054,  -629,  -629,  -629,   -49,
    -629,  -629,  -629,  1054,  -629,  5725,  -629,  5725,   277,  -629,
     112,   233,  -629,  5979,   147,  -629,  -629,   300,  -629,  -629,
     693,  -629,  -629,  7372,  -629,  -629,  -629,   264,   361,  -629,
     419,   416,    92,  4814,  -629,  -629,  -629,  -629,   259,  6183,
    -629,  5166,   220,    49,   421,   444,  7278,  1054,   206,  5725,
    -629,   404,    49,   132,  -629,   281,  -629,   406,   444,  -629,
      19,  -629,  -629,  1097,  -629,  -629,  5583,  -629,  -629,   424,
     111,    19,  -629,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    -629,  3203,  -629,  3324,  3445,  4567,  3566,   430,   428,  5725,
    -629,   431,   432,  5725,  -629,  -629,  -629,  -629,   190,  -629,
     438,  -629,   437,   144,  -629,  -629,  -629,  5725,   426,   449,
     451,   469,  4369,   473,   277,   452,   453,  4697,   277,  -629,
     307,   151,  -629,  5047,  -629,  -629,  1667,  1800,   454,  -629,
    -629,  -629,  -629,  -629,   458,  -629,  -629,  -629,  -629,  -629,
    -629,  4567,  -629,  4567,  -629,   300,  -629,   693,    19,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,  -629,   475,   481,  -629,
     688,  -629,  -629,  -629,  -629,   -40,   459,  -629,  -629,  -629,
    -629,    18,  -629,    92,  -629,  -629,   444,  -629,   484,  -629,
    -629,  -629,  2598,   466,   444,   323,  -629,  5725,  -629,    19,
     471,  -629,  -629,  -629,   487,   145,  -629,  -629,   277,  -629,
    -629,  -629,  -629,  3687,  3808,  -629,  -629,  -629,   491,  -629,
    -629,   493,  -629,  -629,  -629,   482,  4369,  5725,  5725,  5617,
     565,  4620,   483,  -629,  -629,  -629,   197,   488,  4369,  -629,
    -629,   198,  -629,   489,  -629,  1933,  -629,  -629,  -629,  -629,
    3929,  4050,  -629,  -629,  5725,   502,   517,  -629,   330,   330,
    -629,   -26,   203,   485,  -629,  -629,  -629,  -629,   496,   494,
    -629,   501,   505,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
    4369,  -629,   235,   273,  4369,   301,   511,  4369,  4654,  -629,
    -629,  5725,  -629,   120,  -629,  4446,  -629,  -629,   336,  -629,
    -629,   -42,   -37,   330,   330,  -629,   330,   330,  -629,   227,
    -629,  5725,  -629,  4369,  4369,  -629,  4369,  5725,  -629,  4369,
    5691,   507,  -629,  4446,  -629,  -629,  -629,   330,  -629,   330,
    -629,    -7,   -23,    44,    28,   330,   330,  -629,  -629,   586,
    -629,  -629,   340,  -629,  4369,   350,  -629,  -629,   174,   514,
     515,   330,  -629,   330,  -629,   330,  -629,   330,  -629,    62,
      54,  4369,   518,  -629,  4369,  4103,  -629,  -629,  -629,   519,
     520,   522,   523,   330,  -629,   330,  -629,  -629,  -629,  -629,
    -629,  -629,  -629,  -629,  -629,  -629,   524,   525,  -629,  -629
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -629,   329,  -629,  -629,  -112,   932,  -629,  -629,     0,  -629,
      13,   303,   337,   338,   345,   516,   528,   533,   536,   521,
    -629,    52,     1,   630,   -14,     7,  -329,  -629,    16,  -629,
     584,  -629,    34,   -28,   862,  -629,  -629,  -503,  -629,   261,
    1150,   740,   -50,   119,    36,   209,   -12,  -274,  -271,   257,
    -629,  -629,  -290,  -629,   134,    -9,   334,   216,   315,  -205,
     -86,   -94,   -85,  -273,  1110,  -217,  -352,  -629,  1038,  -629,
     920,  -140,  -629,   302,  -629,    87,  -628,  -316,  -629,   155,
    -629,  -629,   201,  -629,  -629,  -164,  -552,  -629,  -629,  -629,
      -4,  -355,   468,  -629,  -629,  -629,  -629,  -629,  -629,  -629,
     461,   333,   465,   470,  -629,  -150,  -629
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -427
static const yytype_int16 yytable[] =
{
      29,    43,   103,   273,   244,    50,    52,    53,   504,   386,
     222,   349,   209,   111,   100,   361,    29,   432,   353,   249,
      98,     2,     2,   408,   284,    84,   158,   617,    97,   687,
     618,   619,   425,   689,   492,   103,     2,   103,   519,   648,
     270,   181,   475,   132,   663,   664,   202,   713,   202,    29,
       2,    29,     2,   451,   453,   707,   167,   456,   150,    70,
      71,     8,    95,   519,   711,    95,   213,     2,   200,   167,
     200,   364,   140,   141,     4,     8,   519,   357,   365,   283,
     375,   410,   291,   146,   205,   103,   205,   206,   426,   206,
      78,   296,     8,   112,   366,     2,   680,   741,   717,    29,
     147,   549,   212,   688,   248,   620,     2,   213,   690,   378,
     113,   114,   115,   660,   336,   715,    29,   246,    29,   665,
       8,   149,   714,     2,   735,   340,   164,   379,   232,   408,
     327,    29,   250,   733,   166,   107,   155,   269,   712,   160,
     359,   504,   504,   166,   161,   468,   251,   252,   253,   202,
       2,    29,    29,   271,   400,   445,   446,   447,   449,   148,
     202,   432,   622,   432,   231,   612,   432,   604,   107,   232,
     359,   331,   287,   718,   439,   162,   163,   156,   166,   349,
     282,   151,   331,   573,   574,   353,   211,   205,   385,   716,
     206,   325,   545,   154,   612,   160,   142,   143,   205,   736,
     161,   206,   612,   172,   167,   231,   397,   734,   178,     2,
     153,   470,   159,    29,   342,   337,   172,    95,   107,   224,
     603,   355,   347,   218,   116,   108,   467,   117,   118,   372,
     282,   162,   163,   567,   373,   333,   274,   354,   568,   378,
     610,   359,   611,   232,   153,   358,   333,     2,   433,   166,
     504,   113,   114,   115,   167,   511,   232,   512,   108,   555,
      95,   506,     2,   225,   434,    70,    71,    95,   383,   404,
     584,   634,   215,   666,   667,   556,   166,   167,   213,   231,
       2,   160,   425,   432,   432,   103,   161,     8,   153,   153,
     136,   137,   231,   173,   599,  -334,    78,   695,   696,    29,
    -334,   725,   401,   138,   139,   204,   173,   204,   108,   541,
     282,   351,   468,   219,   409,   352,   416,   162,   163,   726,
     432,   432,   144,   145,   213,   653,     2,   359,   550,   214,
     282,  -334,  -334,   215,   160,   166,   278,   458,     2,   161,
     650,   654,   113,   114,   115,   461,   462,    95,   668,   166,
     109,   172,   534,     8,   374,   213,   119,   673,   544,   472,
     378,   161,   213,    29,   522,   116,   279,   282,   117,   118,
     162,   163,   697,    29,   507,   537,   513,   293,   514,   493,
     603,   167,    95,   109,   509,   294,   417,   295,   167,   523,
      95,    95,   162,   163,   324,   674,   164,   103,   160,   282,
     213,   172,   628,   161,    95,   157,   524,   133,   334,   282,
     231,    29,   134,   135,   448,   362,   407,   231,   174,   334,
     179,   435,   557,   676,   172,   436,   551,   508,   213,    95,
     207,   174,   207,   109,   162,   163,   525,   526,   220,   254,
     255,   173,   242,   564,   359,   214,   247,     2,   598,   215,
     328,   112,   166,   166,   661,   662,   116,   338,   686,   117,
     118,   341,   722,   213,   419,   167,   578,   213,   329,   231,
     581,    95,   724,   596,   362,   256,   257,   213,   258,   259,
     260,   261,    29,   527,   585,   275,   371,    29,    95,   262,
     263,   173,   382,   625,   380,   381,    29,    29,   376,   691,
     692,   377,   693,   694,   391,   392,   393,   303,   398,   326,
     394,    95,   493,   493,   173,    95,   443,   444,   459,   160,
     522,   454,   540,   709,   161,   710,   460,   463,   172,    95,
     107,   719,   720,   335,   455,   172,   464,   465,   466,   474,
     476,   531,   532,   547,   335,   523,   566,   729,   552,   730,
    -319,   731,   576,   732,   577,   162,   163,   579,   580,   119,
     582,   360,   524,   583,   631,   359,   174,   586,   232,   746,
     587,   747,   588,   642,   643,   645,   120,   121,   122,   123,
     124,   125,   126,   127,   128,   129,    29,    29,    29,    29,
     589,    29,   525,   526,   591,   593,   594,   613,    29,   608,
     658,   609,   614,   621,   231,    29,   626,   275,   275,    95,
    -321,   360,   172,   633,    29,  -320,   174,   638,   173,   639,
     108,   493,   646,   640,   659,   173,   649,   360,   303,   669,
     651,   655,   677,   119,   421,   360,   303,   590,  -322,   174,
      29,   670,   671,   438,    29,   360,   318,    29,    29,  -323,
     706,   721,   607,   303,   303,    29,   684,   303,   681,   727,
     728,   738,   264,   702,   742,   743,   705,   744,   745,   748,
     749,   268,   152,    29,    29,   265,    29,    29,   698,    29,
      29,   266,   210,    29,   684,   267,   558,   682,   360,   630,
     562,   522,   490,   510,     0,   521,     2,   605,   505,     0,
     130,   368,   173,    95,    29,   369,     0,   275,     0,     0,
     370,     0,   360,   360,     0,     0,   523,     0,     0,   360,
       0,    29,     0,    95,    29,    29,   684,     0,     0,     0,
       0,   533,   536,   524,     0,     0,     0,   542,   360,     0,
     303,   641,   360,   174,   360,   109,     0,   360,     0,    87,
     174,   360,    87,   652,     0,     0,   106,   360,     0,   360,
     607,     0,     0,   525,   526,     0,     0,     0,   160,     0,
     360,     0,     0,   161,     0,   318,     0,     0,     0,     0,
     303,     0,   303,   303,   303,   303,     0,     0,     0,   106,
       0,     0,   318,   318,     0,   672,   318,     0,     0,   675,
       0,     0,   678,     0,   162,   163,     0,     0,     0,     0,
     615,   490,     0,   592,   383,   616,     0,   597,   215,     0,
       0,     0,   421,     0,    87,   490,   490,   174,   699,   700,
       0,   701,     0,     0,   703,     0,     0,    87,     0,   106,
     303,     0,   303,     0,    87,     0,   360,   360,     0,     0,
       0,     0,   106,     0,     0,     0,     0,     0,     0,   723,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     623,     0,   624,     0,     0,   360,   737,     0,     0,   739,
       0,     0,     0,   360,   360,     0,     0,     0,   360,     0,
       0,     0,     0,   106,     0,     0,     0,   635,     0,   280,
       0,     0,   303,   303,    87,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   490,     0,     0,   106,   318,
       0,   318,   318,   318,   318,     0,     0,   490,     0,     0,
       0,     0,     0,     0,   490,     0,     0,     0,     0,   303,
     303,     0,     0,     0,     0,     0,   168,     0,     0,     0,
       0,     0,     0,   180,    87,   348,     0,     0,     0,   168,
       0,     0,     0,     0,     0,     0,   216,   106,     0,   490,
       0,     0,    87,   490,     0,     0,   490,     0,     0,   318,
     106,   318,   360,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   490,   490,   177,   490,     0,     0,   490,     0,
       0,     0,     0,     0,     0,     0,     0,   177,     0,     0,
       0,     0,    87,     0,   223,     0,   168,     0,     0,     0,
       0,     0,     0,   490,    87,     0,     0,   406,    87,     0,
      87,   318,   318,     0,   230,    87,     0,   106,     0,     0,
     490,     0,     0,   490,    87,     1,     0,     2,     3,     4,
       5,   168,     6,     7,   106,   106,     0,     0,   106,   457,
       0,     0,   168,     0,     0,     0,   216,     0,   318,   318,
       0,     0,     8,     0,   177,   230,   290,     0,   292,     0,
       0,    87,   473,     0,     0,     0,     0,     0,     1,     0,
       2,     3,     4,   106,     0,     0,     0,     0,     0,     0,
     304,     0,     0,     0,     0,     0,     0,     0,     0,   177,
       0,     0,     0,    87,     0,     8,     9,    10,    11,     0,
     177,     0,     0,    87,   223,     0,   350,     0,     0,     0,
       0,     0,     0,   539,   384,     0,     0,     0,     0,    87,
       0,   106,     0,     0,     0,     0,    87,    12,    13,   230,
       0,   413,     0,     0,    14,     0,   105,   422,     0,     9,
      10,     0,   230,    15,     0,    16,   565,    17,   441,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,   106,     0,   106,   106,   106,   106,     0,   227,   105,
      12,    13,   390,     0,     0,     0,     0,     0,     0,   396,
       0,     0,     0,     0,     0,     0,    15,     0,    51,   415,
      17,   413,     0,     0,     0,   428,   430,     0,     0,     0,
       0,     0,     0,    87,   171,     0,   106,   106,     0,   304,
       0,     0,     0,     0,     0,   384,   201,   171,   201,   105,
       0,   106,   518,   106,   217,     0,   304,   304,     0,     0,
     304,     0,     0,     0,     0,   216,     0,     0,     0,     0,
     543,     0,     0,   413,     0,     0,     0,   518,     0,   415,
     413,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     559,     0,   106,     0,     0,     0,     0,   230,     0,     0,
       0,     0,     0,   390,   517,     0,     0,     0,     0,     0,
       0,     0,     0,   106,   106,     0,   288,     0,     0,     0,
     389,     0,     0,   223,     0,     0,     0,     0,     0,     0,
       0,   415,   290,   546,     0,     0,     0,   389,   415,     0,
       0,     0,   554,   427,   429,   106,     0,     0,     0,   332,
     106,   106,     0,     0,   442,   413,     0,     0,     0,     0,
     332,     0,     0,     0,     0,   304,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   518,
       0,     0,   171,   304,     0,   304,   304,   304,   304,     0,
       0,     0,   387,     0,     0,     0,     0,   389,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   518,   387,
       0,     0,     0,   415,     0,   387,   518,   413,     0,     0,
       0,   389,   516,     0,     0,     0,     0,     0,   389,     0,
       0,     0,   171,     0,     0,     0,     0,     0,     0,   395,
       0,     0,     0,   304,     0,   304,     0,   405,     0,   389,
       0,   516,     0,   389,     0,   171,   389,     0,     0,     0,
     553,     0,     0,     0,     0,     0,   560,     0,   561,   387,
       0,     0,     0,     0,     0,   415,     0,     0,     0,   569,
       0,     0,     0,     0,   230,     0,     0,     0,     0,     0,
       0,     0,     0,   387,   515,     0,     0,     0,     0,     0,
     387,     0,     0,     0,     0,   304,   304,     0,     0,     0,
       0,     0,     0,     0,     0,   413,     0,     0,     0,     0,
       0,   387,     0,   515,     0,   387,     0,     0,   387,     0,
       0,   389,   515,     0,     0,     0,     0,     0,   387,     0,
       0,     0,   304,   304,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   538,     0,   389,   516,     0,     0,   171,
       0,   105,   288,     0,     0,     0,   171,     0,     0,     0,
       0,     0,     0,   415,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   389,     0,     0,     0,     0,     0,
       0,     0,   629,   389,     0,     0,     0,   632,     0,     0,
       0,     0,     0,   387,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   387,   515,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   171,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   387,     0,     0,     0,
       0,     0,     0,     0,   387,   387,     0,     0,     1,   515,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   389,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
     477,   478,   479,   480,   481,   482,   483,   484,   485,   486,
     487,     0,     0,     0,    77,     0,     0,     0,     0,     9,
      10,    11,     0,    78,     0,   488,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   387,     0,     0,     0,     0,    80,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      81,    82,     0,     0,     0,    83,    15,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     489,   362,  -371,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,   477,   478,   479,   480,   481,   482,   483,
     484,   485,   486,   487,     0,     0,     0,    77,     0,     0,
       0,     0,     9,    10,    11,     0,    78,     0,   488,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    81,    82,     0,     0,     0,    83,    15,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   489,   362,  -370,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,   477,   478,   479,   480,
     481,   482,   483,   484,   485,   486,   487,     0,     0,     0,
      77,     0,     0,     0,     0,     9,    10,    11,     0,    78,
       0,   488,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    81,    82,     0,     0,
       0,    83,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   489,   362,  -372,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     9,    10,
      11,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    81,
      82,     0,     0,     0,    83,    15,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   226,
     227,   228,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     9,    10,    11,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    81,    82,     0,     0,     0,    83,    15,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   226,   227,   272,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     9,    10,    11,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    81,    82,     0,     0,     0,
      83,    15,     0,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   226,   227,   356,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     9,    10,    11,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    81,    82,
       0,     0,     0,    83,    15,     0,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   367,   227,
    -426,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       9,    10,    11,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    81,    82,     0,     0,     0,    83,    15,     0,    16,
       1,    17,     2,     3,     4,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   226,   227,   627,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,   297,     0,
       0,     9,    10,     0,   160,    78,     0,     0,   298,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     162,   163,    81,    82,     0,     0,     0,    83,    15,     0,
     299,     1,    17,     2,     3,     4,     0,     0,   166,     0,
       0,   300,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   301,     0,   302,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,   297,
       0,     0,     9,    10,     0,   160,    78,     0,     0,   298,
     161,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   162,   163,    81,    82,     0,     0,     0,    83,    15,
       0,   299,     1,    17,     2,     3,     4,     0,     0,   166,
       0,     0,   300,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   301,     0,   431,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
     297,     0,     0,     9,    10,     0,   160,    78,     0,     0,
     298,   161,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   162,   163,    81,    82,     0,     0,     0,    83,
      15,     0,   299,     1,    17,     2,     3,     4,     0,     0,
     166,     0,     0,   300,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   301,     0,   450,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,   297,     0,     0,     9,    10,     0,   160,    78,     0,
       0,   298,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   162,   163,    81,    82,     0,     0,     0,
      83,    15,     0,   299,     1,    17,     2,     3,     4,     0,
       0,   166,     0,     0,   300,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   301,     0,   452,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,   297,     0,     0,     9,    10,     0,   160,    78,
       0,     0,   298,   161,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   162,   163,    81,    82,     0,     0,
       0,    83,    15,     0,   299,     1,    17,     2,     3,     4,
       0,     0,   166,     0,     0,   300,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   301,     0,   570,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,   297,     0,     0,     9,    10,     0,   160,
      78,     0,     0,   298,   161,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   162,   163,    81,    82,     0,
       0,     0,    83,    15,     0,   299,     1,    17,     2,     3,
       4,     0,     0,   166,     0,     0,   300,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   301,     0,   571,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,   297,     0,     0,     9,    10,     0,
     160,    78,     0,     0,   298,   161,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   162,   163,    81,    82,
       0,     0,     0,    83,    15,     0,   299,     1,    17,     2,
       3,     4,     0,     0,   166,     0,     0,   300,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   301,     0,
     572,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,   297,     0,     0,     9,    10,
       0,   160,    78,     0,     0,   298,   161,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   162,   163,    81,
      82,     0,     0,     0,    83,    15,     0,   299,     1,    17,
       2,     3,     4,     0,     0,   166,     0,     0,   300,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   301,
       0,   575,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,   297,     0,     0,     9,
      10,     0,   160,    78,     0,     0,   298,   161,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   162,   163,
      81,    82,     0,     0,     0,    83,    15,     0,   299,     1,
      17,     2,     3,     4,     0,     0,   166,     0,     0,   300,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     301,     0,   636,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,   297,     0,     0,
       9,    10,     0,   160,    78,     0,     0,   298,   161,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   162,
     163,    81,    82,     0,     0,     0,    83,    15,     0,   299,
       1,    17,     2,     3,     4,     0,     0,   166,     0,     0,
     300,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   301,     0,   637,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,   297,     0,
       0,     9,    10,     0,   160,    78,     0,     0,   298,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     162,   163,    81,    82,     0,     0,     0,    83,    15,     0,
     299,     1,    17,     2,     3,     4,     0,     0,   166,     0,
       0,   300,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   301,     0,   656,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,    77,     0,   297,
       0,     0,     9,    10,     0,   160,    78,     0,     0,   298,
     161,     8,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   162,   163,    81,    82,     0,     0,     0,    83,    15,
       0,   299,     0,    17,     0,     9,    10,    11,     0,   166,
       0,     0,   300,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   301,     0,   657,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,   683,   740,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,   477,
     478,   479,   480,   481,   482,   483,   484,   485,   486,   487,
       0,     0,     0,    77,     0,     0,     0,     0,     9,    10,
      11,     0,    78,     0,   488,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    81,
      82,     0,     0,     0,    83,    15,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   489,
     362,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,   477,   478,   479,   480,   481,   482,   483,   484,
     485,   486,   487,     0,     0,     0,     0,     0,     0,     8,
       0,     9,    10,    11,     0,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     8,     0,     0,     0,     0,    14,
       0,     0,     0,     9,    10,    11,     0,     0,    15,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   489,   362,    12,    13,     0,     0,     9,    10,
      11,    14,     0,     0,     0,     0,     0,     0,     0,     0,
      15,     0,    16,   243,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,   227,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,    16,     1,    17,
       2,     3,     4,     0,    18,    19,    20,    21,    22,    23,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     683,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,    77,     0,   297,     0,     0,     9,
      10,     0,   160,    78,     0,     0,   298,   161,     8,     0,
       0,     0,     0,    79,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,    80,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   162,   163,
      81,    82,     8,     0,     0,    83,    15,     0,   299,     0,
      17,     0,     9,    10,    11,     0,   166,     0,     1,   300,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
     301,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     8,     9,    10,    11,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,    16,   647,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,    12,    13,     0,
       0,     0,     0,   489,    14,     0,     0,     0,     0,     9,
      10,    11,     0,    15,     0,    16,   679,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   489,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     2,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     595,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,   402,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,   160,
      78,     0,     0,     0,   161,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   162,   163,    81,    82,     0,
       0,     0,    83,     0,     2,   214,     0,     0,     0,   215,
       0,     0,     0,   166,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   535,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,   160,    78,     0,     0,
       0,   161,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   162,   163,    81,    82,     0,     0,     0,    83,
       2,     0,   418,     0,     0,     0,     0,     0,     0,     0,
     166,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   419,     0,   420,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,   160,    78,     0,     0,     0,   161,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   162,   163,
      81,    82,     0,     0,     0,    83,     0,     1,   359,     2,
       3,     4,     5,     0,     6,     7,   166,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     600,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     9,    10,
      11,   160,    78,     0,     0,     0,   161,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,    12,
      13,     0,     0,     0,     0,     0,    14,   162,   163,    81,
      82,     0,     0,     0,     0,    15,     0,   411,   101,    17,
       0,     0,     0,     0,    18,   412,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     9,    10,    11,     1,    78,     2,     3,     4,     5,
       0,     6,     7,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    81,    82,     0,     0,     0,     0,    15,     0,
      16,   101,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     9,    10,    11,   160,     0,
       0,     0,     0,   161,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,   162,   163,     0,     0,     0,     0,
       0,     0,    15,     0,   411,   101,    17,     0,     0,     0,
       0,    18,   412,    20,    21,    22,    23,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    12,    13,
       0,     0,     0,     0,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,    16,   101,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     9,    10,    11,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
      16,     0,    17,     0,     0,   346,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     9,    10,    11,     0,     0,
       0,     0,    15,     0,    16,     0,    17,     0,     0,   471,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     9,
      10,    11,     1,    14,     2,     3,     4,     5,     0,     6,
       7,     0,    15,     0,    16,     0,    17,     0,     0,   563,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     1,    14,     2,     3,
       4,     5,     0,     6,     7,     0,    15,     0,    16,   644,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     8,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     9,    10,    11,
       1,    14,     2,     3,     4,     5,     0,     6,     7,     0,
      15,     0,    16,   704,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     8,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     9,    10,    11,
       0,     0,     0,     0,    15,     0,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,    49,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
      51,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     2,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,     0,    99,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,   160,    78,     0,     0,     0,   161,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     2,     0,     0,     0,     0,     0,
     162,   163,    81,    82,     0,     0,     0,    83,     0,     0,
     383,   343,     0,     0,   215,     0,     0,     0,   166,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,   160,    78,     0,     0,
       0,   161,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     2,     0,     0,     0,
       0,     0,   162,   163,    81,    82,     0,     0,     0,    83,
       0,     0,   383,     0,     0,     0,   215,     0,     0,     0,
     166,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,   160,    78,
       0,     0,     0,   161,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     2,     0,
       0,     0,     0,     0,   162,   163,    81,    82,     0,     0,
       0,    83,     0,     0,   359,     0,     0,     0,     0,     0,
       0,     0,   166,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,    82,
       0,     0,     0,    83,     0,     0,     0,   437,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,   160,    78,     0,     0,     0,
     161,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   162,   163,    81,    82,     0,     0,     0,    83,     0,
       0,   214,   343,     0,     0,   215,     0,     0,     0,   166,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,   160,    78,     0,
       0,     0,   161,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   162,   163,    81,    82,     0,     0,     0,
      83,     0,     0,   164,     0,     0,     0,   165,     0,     0,
       0,   166,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,   160,
      78,     0,     0,     0,   161,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   162,   163,    81,    82,     0,
       0,     0,    83,     0,     0,   164,     0,     0,     0,   208,
       0,     0,     0,   166,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,   160,    78,     0,     0,     0,   161,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   162,   163,    81,
      82,     0,     0,     0,    83,     0,     0,   164,   281,     0,
       0,     0,     0,     0,     0,   166,     8,    54,    55,    56,
      57,    58,   182,   183,   184,   185,   186,   187,   188,   189,
     190,   191,   192,    70,    71,   193,   194,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   195,     0,     0,     0,     0,
       0,     0,     0,   160,    78,     0,     0,     0,   161,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   196,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   162,
     163,   197,   198,     0,     0,     0,    83,     0,     0,   164,
       0,     0,     0,   330,     0,     0,     0,   166,     8,    54,
      55,    56,    57,    58,   182,   183,   184,   185,   186,   187,
     188,   189,   190,   191,   192,    70,    71,   193,   194,    74,
      75,    76,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   195,     0,     0,
       0,     0,     0,     0,     0,   160,    78,     0,     0,     0,
     161,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   196,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   162,   163,   197,   198,     0,     0,     0,    83,     0,
       0,   164,     0,     0,     8,   339,     0,     0,     0,   166,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,   160,    78,     0,     0,     0,   161,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   162,   163,    81,
      82,     0,     0,     0,     0,     0,     0,   214,     0,     0,
       0,   215,     0,     0,     0,   166,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,    82,     0,     0,     0,    83,     0,     0,     0,
     399,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,    82,     0,     0,
       0,    83,     0,     0,     0,   469,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,    82,     0,     0,     0,    83,     0,     0,   548,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,   520,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,    82,     0,     0,     0,
      83,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,    82,     0,     0,
       0,    83,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,   402,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,    82,     0,
       0,     0,    83,     8,    54,    55,    56,    57,    58,   182,
     183,   184,   185,   186,   187,   188,   189,   190,   191,   192,
      70,    71,   193,   194,    74,    75,    76,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   195,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   196,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   197,   198,
       0,     0,     0,    83
};

static const yytype_int16 yycheck[] =
{
       0,     0,    16,   153,   116,     5,     6,     7,   363,   282,
     104,   216,    97,    17,    14,   232,    16,   307,   223,   131,
      13,     3,     3,   297,   164,     9,    76,   530,    12,    71,
      70,    71,   305,    70,   363,    49,     3,    51,   390,   591,
     152,    91,   358,    30,    70,    71,    96,    70,    98,    49,
       3,    51,     3,   324,   325,   683,    84,   328,    17,    45,
      46,    28,    10,   415,    71,    13,   127,     3,    96,    97,
      98,   235,    12,    13,     5,    28,   428,   227,   127,   164,
     141,   298,   168,   128,    96,    99,    98,    96,   305,    98,
      76,   177,    28,   144,   143,     3,   648,   725,    70,    99,
     138,   417,   122,   145,   118,   145,     3,   127,   145,   127,
       7,     8,     9,   616,   199,    71,   116,   116,   118,   145,
      28,    16,   145,     3,    70,   210,   121,   145,   112,   403,
     180,   131,   131,    71,   129,    16,    49,   151,   145,    75,
     121,   496,   497,   129,    80,   350,   133,   134,   135,   199,
       3,   151,   152,   152,   294,   319,   320,   321,   322,   139,
     210,   451,   144,   453,   112,   517,   456,   496,    49,   153,
     121,   199,   165,   145,   314,   111,   112,   144,   129,   384,
     164,   140,   210,   454,   455,   390,    99,   199,   282,   145,
     199,   144,   409,     0,   546,    75,   136,   137,   210,   145,
      80,   210,   554,    84,   232,   153,   292,   145,   144,     3,
     144,   351,   121,   213,   213,   208,    97,   165,    99,   122,
     493,   225,   215,   104,   121,    16,   126,   124,   125,   122,
     214,   111,   112,   122,   127,   199,   122,   224,   127,   127,
     511,   121,   513,   227,   144,   142,   210,     3,   127,   129,
     605,     7,     8,     9,   282,   143,   240,   145,    49,   127,
     208,   373,     3,   124,   143,    45,    46,   215,   121,   297,
     126,   126,   125,    70,    71,   143,   129,   305,   127,   227,
       3,    75,   555,   573,   574,   299,    80,    28,   144,   144,
     130,   131,   240,    84,   143,    75,    76,    70,    71,   299,
      80,   127,   295,    10,    11,    96,    97,    98,    99,   403,
     294,   121,   517,   104,   298,   125,   300,   111,   112,   145,
     610,   611,    14,    15,   127,   127,     3,   121,   122,   121,
     314,   111,   112,   125,    75,   129,   144,   330,     3,    80,
     143,   143,     7,     8,     9,   338,   339,   295,   145,   129,
      16,   232,   402,    28,   126,   127,    27,   122,   408,   352,
     127,    80,   127,   363,     3,   121,   144,   351,   124,   125,
     111,   112,   145,   373,   373,   403,   143,   121,   145,   363,
     653,   409,   330,    49,   377,   121,   142,   125,   416,    28,
     338,   339,   111,   112,   144,   122,   121,   411,    75,   383,
     127,   282,   552,    80,   352,    76,    45,   129,   199,   393,
     358,   411,   134,   135,   143,   144,   297,   365,    84,   210,
      91,   121,   141,   122,   305,   125,   419,   375,   127,   377,
      96,    97,    98,    99,   111,   112,    75,    76,   104,   136,
     137,   232,   113,   436,   121,   121,   117,     3,   141,   125,
     144,   144,   129,   129,   618,   619,   121,   125,   122,   124,
     125,   122,   122,   127,   141,   493,   459,   127,   121,   417,
     463,   419,   122,   487,   144,   138,   139,   127,   140,   141,
     142,   143,   482,   122,   477,   156,   145,   487,   436,   144,
     145,   282,   122,   543,   278,   279,   496,   497,   145,   663,
     664,   142,   666,   667,   122,   122,   127,   178,   121,   180,
     126,   459,   496,   497,   305,   463,   143,   143,   125,    75,
       3,   144,   403,   687,    80,   689,   126,   125,   409,   477,
     411,   695,   696,   199,   144,   416,   122,   122,   126,   145,
     145,   122,   126,   122,   210,    28,   122,   711,   144,   713,
     144,   715,   122,   717,   126,   111,   112,   126,   126,   230,
     122,   232,    45,   126,   557,   121,   232,   141,   552,   733,
     121,   735,   121,   587,   588,   589,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,   586,   587,   588,   589,
     121,   591,    75,    76,   121,   143,   143,   122,   598,   145,
     614,   143,   121,   144,   552,   605,   122,   278,   279,   557,
     144,   282,   493,   126,   614,   144,   282,   126,   409,   126,
     411,   605,    57,   141,   122,   416,   143,   298,   299,   144,
     142,   142,   121,   304,   305,   306,   307,   482,   144,   305,
     640,   145,   141,   314,   644,   316,   178,   647,   648,   144,
     143,    65,   497,   324,   325,   655,   655,   328,   651,   145,
     145,   143,   146,   677,   145,   145,   680,   145,   145,   145,
     145,   150,    42,   673,   674,   147,   676,   677,   671,   679,
     680,   148,    98,   683,   683,   149,   425,   653,   359,   555,
     433,     3,   363,   378,    -1,   393,     3,   496,   365,    -1,
     142,   240,   493,   651,   704,   240,    -1,   378,    -1,    -1,
     240,    -1,   383,   384,    -1,    -1,    28,    -1,    -1,   390,
      -1,   721,    -1,   671,   724,   725,   725,    -1,    -1,    -1,
      -1,   402,   403,    45,    -1,    -1,    -1,   408,   409,    -1,
     411,   586,   413,   409,   415,   411,    -1,   418,    -1,     9,
     416,   422,    12,   598,    -1,    -1,    16,   428,    -1,   430,
     605,    -1,    -1,    75,    76,    -1,    -1,    -1,    75,    -1,
     441,    -1,    -1,    80,    -1,   307,    -1,    -1,    -1,    -1,
     451,    -1,   453,   454,   455,   456,    -1,    -1,    -1,    49,
      -1,    -1,   324,   325,    -1,   640,   328,    -1,    -1,   644,
      -1,    -1,   647,    -1,   111,   112,    -1,    -1,    -1,    -1,
     122,   482,    -1,   484,   121,   127,    -1,   488,   125,    -1,
      -1,    -1,   493,    -1,    84,   496,   497,   493,   673,   674,
      -1,   676,    -1,    -1,   679,    -1,    -1,    97,    -1,    99,
     511,    -1,   513,    -1,   104,    -1,   517,   518,    -1,    -1,
      -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,   704,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     541,    -1,   543,    -1,    -1,   546,   721,    -1,    -1,   724,
      -1,    -1,    -1,   554,   555,    -1,    -1,    -1,   559,    -1,
      -1,    -1,    -1,   153,    -1,    -1,    -1,   568,    -1,   159,
      -1,    -1,   573,   574,   164,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   586,    -1,    -1,   178,   451,
      -1,   453,   454,   455,   456,    -1,    -1,   598,    -1,    -1,
      -1,    -1,    -1,    -1,   605,    -1,    -1,    -1,    -1,   610,
     611,    -1,    -1,    -1,    -1,    -1,    84,    -1,    -1,    -1,
      -1,    -1,    -1,    91,   214,   215,    -1,    -1,    -1,    97,
      -1,    -1,    -1,    -1,    -1,    -1,   104,   227,    -1,   640,
      -1,    -1,   232,   644,    -1,    -1,   647,    -1,    -1,   511,
     240,   513,   653,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   673,   674,    84,   676,    -1,    -1,   679,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    97,    -1,    -1,
      -1,    -1,   282,    -1,   104,    -1,   164,    -1,    -1,    -1,
      -1,    -1,    -1,   704,   294,    -1,    -1,   297,   298,    -1,
     300,   573,   574,    -1,   112,   305,    -1,   307,    -1,    -1,
     721,    -1,    -1,   724,   314,     1,    -1,     3,     4,     5,
       6,   199,     8,     9,   324,   325,    -1,    -1,   328,   329,
      -1,    -1,   210,    -1,    -1,    -1,   214,    -1,   610,   611,
      -1,    -1,    28,    -1,   164,   153,   166,    -1,   168,    -1,
      -1,   351,   352,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,   363,    -1,    -1,    -1,    -1,    -1,    -1,
     178,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   199,
      -1,    -1,    -1,   383,    -1,    28,    72,    73,    74,    -1,
     210,    -1,    -1,   393,   214,    -1,   216,    -1,    -1,    -1,
      -1,    -1,    -1,   403,   282,    -1,    -1,    -1,    -1,   409,
      -1,   411,    -1,    -1,    -1,    -1,   416,   103,   104,   227,
      -1,   299,    -1,    -1,   110,    -1,    16,   305,    -1,    72,
      73,    -1,   240,   119,    -1,   121,   436,   123,   316,    -1,
      -1,    -1,   128,   129,   130,   131,   132,   133,    -1,    -1,
      -1,   451,    -1,   453,   454,   455,   456,    -1,   144,    49,
     103,   104,   282,    -1,    -1,    -1,    -1,    -1,    -1,   289,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,   299,
     123,   359,    -1,    -1,    -1,   305,   306,    -1,    -1,    -1,
      -1,    -1,    -1,   493,    84,    -1,   496,   497,    -1,   307,
      -1,    -1,    -1,    -1,    -1,   383,    96,    97,    98,    99,
      -1,   511,   390,   513,   104,    -1,   324,   325,    -1,    -1,
     328,    -1,    -1,    -1,    -1,   403,    -1,    -1,    -1,    -1,
     408,    -1,    -1,   411,    -1,    -1,    -1,   415,    -1,   359,
     418,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     428,    -1,   552,    -1,    -1,    -1,    -1,   365,    -1,    -1,
      -1,    -1,    -1,   383,   384,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   573,   574,    -1,   166,    -1,    -1,    -1,
     282,    -1,    -1,   403,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   411,   412,   413,    -1,    -1,    -1,   299,   418,    -1,
      -1,    -1,   422,   305,   306,   605,    -1,    -1,    -1,   199,
     610,   611,    -1,    -1,   316,   493,    -1,    -1,    -1,    -1,
     210,    -1,    -1,    -1,    -1,   433,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   517,
      -1,    -1,   232,   451,    -1,   453,   454,   455,   456,    -1,
      -1,    -1,   282,    -1,    -1,    -1,    -1,   359,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   546,   299,
      -1,    -1,    -1,   493,    -1,   305,   554,   555,    -1,    -1,
      -1,   383,   384,    -1,    -1,    -1,    -1,    -1,   390,    -1,
      -1,    -1,   282,    -1,    -1,    -1,    -1,    -1,    -1,   289,
      -1,    -1,    -1,   511,    -1,   513,    -1,   297,    -1,   411,
      -1,   413,    -1,   415,    -1,   305,   418,    -1,    -1,    -1,
     422,    -1,    -1,    -1,    -1,    -1,   428,    -1,   430,   359,
      -1,    -1,    -1,    -1,    -1,   555,    -1,    -1,    -1,   441,
      -1,    -1,    -1,    -1,   552,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   383,   384,    -1,    -1,    -1,    -1,    -1,
     390,    -1,    -1,    -1,    -1,   573,   574,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   653,    -1,    -1,    -1,    -1,
      -1,   411,    -1,   413,    -1,   415,    -1,    -1,   418,    -1,
      -1,   493,   422,    -1,    -1,    -1,    -1,    -1,   428,    -1,
      -1,    -1,   610,   611,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   403,    -1,   517,   518,    -1,    -1,   409,
      -1,   411,   412,    -1,    -1,    -1,   416,    -1,    -1,    -1,
      -1,    -1,    -1,   653,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   546,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   554,   555,    -1,    -1,    -1,   559,    -1,    -1,
      -1,    -1,    -1,   493,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   517,   518,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   493,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   546,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   554,   555,    -1,    -1,     1,   559,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   653,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    78,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   653,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,
     133,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     143,   144,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    72,    73,    74,    -1,    76,    -1,    78,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,    -1,    -1,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,   132,   133,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   143,   144,   145,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    76,
      -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   143,   144,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
      74,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   143,
     144,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,
      -1,    72,    73,    74,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,    -1,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,   132,   133,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   143,   144,   145,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,   132,   133,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   143,   144,   145,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,    74,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,    -1,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,   132,   133,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   143,   144,
     145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,
      72,    73,    74,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
       1,   123,     3,     4,     5,    -1,   128,   129,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   143,   144,   145,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,     1,   123,     3,     4,     5,    -1,    -1,   129,    -1,
      -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,     1,   123,     3,     4,     5,    -1,    -1,   129,
      -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,
      79,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,   121,     1,   123,     3,     4,     5,    -1,    -1,
     129,    -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,     1,   123,     3,     4,     5,    -1,
      -1,   129,    -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,     1,   123,     3,     4,     5,
      -1,    -1,   129,    -1,    -1,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,   121,     1,   123,     3,     4,
       5,    -1,    -1,   129,    -1,    -1,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,     3,
       4,     5,    -1,    -1,   129,    -1,    -1,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,
     145,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,
       3,     4,     5,    -1,    -1,   129,    -1,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,     1,
     123,     3,     4,     5,    -1,    -1,   129,    -1,    -1,   132,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,   145,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,
       1,   123,     3,     4,     5,    -1,    -1,   129,    -1,    -1,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   143,    -1,   145,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
     121,     1,   123,     3,     4,     5,    -1,    -1,   129,    -1,
      -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    67,    -1,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    28,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,   123,    -1,    72,    73,    74,    -1,   129,
      -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   143,    -1,   145,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,   144,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
      74,    -1,    76,    -1,    78,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   143,
     144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     121,    -1,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,   144,   103,   104,    -1,    -1,    72,    73,
      74,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,   121,   122,   123,    -1,    -1,    -1,    -1,   128,
     129,   130,   131,   132,   133,    -1,    -1,    -1,    -1,   103,
     104,    -1,    -1,    -1,    -1,   144,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,     1,   123,
       3,     4,     5,    -1,   128,   129,   130,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     144,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    67,    -1,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    28,    -1,
      -1,    -1,    -1,    86,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    28,    -1,    -1,   118,   119,    -1,   121,    -1,
     123,    -1,    72,    73,    74,    -1,   129,    -1,     1,   132,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
     143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    28,    72,    73,    74,    -1,
     110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,   121,   122,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,   132,   133,    -1,    -1,    -1,   103,   104,    -1,
      -1,    -1,    -1,   143,   110,    -1,    -1,    -1,    -1,    72,
      73,    74,    -1,   119,    -1,   121,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,   132,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,     3,   121,    -1,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,     3,   121,    -1,    -1,    -1,   125,
      -1,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   144,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
       3,    -1,   121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,     1,   121,     3,
       4,     5,     6,    -1,     8,     9,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,   119,    -1,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,
      -1,    72,    73,    74,     1,    76,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    28,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,   113,   114,    -1,    -1,    -1,    -1,   119,    -1,
     121,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,   132,   133,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    72,    73,    74,    75,    -1,
      -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,    72,    73,    74,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   103,   104,
      -1,    -1,    -1,    -1,     1,   110,     3,     4,     5,     6,
      -1,     8,     9,    -1,   119,    -1,   121,   122,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,   132,   133,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   103,   104,    -1,    72,    73,    74,     1,   110,
       3,     4,     5,     6,    -1,     8,     9,    -1,   119,    -1,
     121,    -1,   123,    -1,    -1,   126,    -1,   128,   129,   130,
     131,   132,   133,    -1,    -1,    28,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    72,    73,    74,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,   130,   131,   132,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    72,
      73,    74,     1,   110,     3,     4,     5,     6,    -1,     8,
       9,    -1,   119,    -1,   121,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,   130,   131,   132,   133,    -1,    -1,    28,
     103,   104,    -1,    -1,    -1,    -1,     1,   110,     3,     4,
       5,     6,    -1,     8,     9,    -1,   119,    -1,   121,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,
     133,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    72,    73,    74,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   103,   104,    -1,    72,    73,    74,
       1,   110,     3,     4,     5,     6,    -1,     8,     9,    -1,
     119,    -1,   121,   122,   123,    -1,    -1,    -1,    -1,   128,
     129,   130,   131,   132,   133,    -1,    -1,    28,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,    -1,    72,    73,    74,
      -1,    -1,    -1,    -1,   119,    -1,   121,    -1,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,
      -1,    72,    73,    74,     1,   110,     3,     4,     5,     6,
      -1,     8,     9,    -1,   119,    -1,   121,    -1,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,   132,   133,    -1,
      -1,    28,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
     121,    -1,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,     3,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,   122,    -1,    -1,   125,    -1,    -1,    -1,   129,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,    -1,
     129,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   129,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,   122,    -1,    -1,   125,    -1,    -1,    -1,   129,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,
      -1,   129,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,    -1,   125,
      -1,    -1,    -1,   129,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,    -1,
      -1,    -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,    -1,    -1,   129,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,    -1,    -1,    28,   125,    -1,    -1,    -1,   129,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,
      -1,   125,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
     122,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,    -1,   122,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    67,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    72,
      73,    74,   103,   104,   110,   119,   121,   123,   128,   129,
     130,   131,   132,   133,   147,   148,   149,   151,   153,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   168,   187,   188,   236,   238,   252,   121,
     154,   121,   154,   154,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    67,    76,    86,
     101,   113,   114,   118,   174,   179,   186,   187,   189,   191,
     192,   193,   201,   202,   154,   167,   171,   174,   171,   121,
     154,   122,   168,   170,   173,   186,   187,   189,   191,   202,
     221,   236,   144,     7,     8,     9,   121,   124,   125,   147,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
     142,   169,   156,   129,   134,   135,   130,   131,    10,    11,
      12,    13,   136,   137,    14,    15,   128,   138,   139,    16,
      17,   140,   169,   144,     0,   221,   144,   147,   188,   121,
      75,    80,   111,   112,   121,   125,   129,   179,   180,   181,
     185,   186,   189,   191,   202,   206,   208,   216,   144,   147,
     180,   188,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    47,    48,    67,   101,   113,   114,   176,
     179,   186,   188,   190,   191,   192,   201,   202,   125,   208,
     176,   221,   122,   127,   121,   125,   180,   186,   189,   191,
     202,   205,   207,   216,   122,   124,   143,   144,   145,   150,
     151,   167,   174,   223,   239,   245,   246,   247,   248,   249,
     250,   251,   147,   122,   150,   152,   168,   147,   170,   150,
     168,   156,   156,   156,   157,   157,   158,   158,   159,   159,
     159,   159,   160,   160,   161,   162,   163,   164,   165,   170,
     150,   168,   145,   251,   122,   147,   203,   204,   144,   144,
     187,   122,   174,   208,   217,   218,   219,   171,   186,   215,
     216,   206,   216,   121,   121,   125,   206,    69,    79,   121,
     132,   143,   145,   147,   151,   174,   180,   194,   195,   196,
     197,   198,   210,   211,   213,   214,   216,   237,   238,   240,
     241,   242,   243,   244,   144,   144,   147,   188,   144,   121,
     125,   179,   186,   190,   191,   202,   208,   171,   125,   125,
     208,   122,   168,   122,   207,   217,   126,   171,   187,   205,
     216,   121,   125,   205,   156,   236,   145,   251,   142,   121,
     147,   211,   144,   230,   231,   127,   143,   143,   246,   248,
     249,   145,   122,   127,   126,   141,   145,   142,   127,   145,
     203,   203,   122,   121,   180,   207,   209,   210,   212,   214,
     216,   122,   122,   127,   126,   186,   216,   206,   121,   122,
     217,   171,    51,   175,   179,   186,   187,   189,   193,   174,
     211,   121,   129,   180,   209,   216,   174,   142,   121,   141,
     143,   147,   180,   199,   200,   209,   211,   214,   216,   214,
     216,   145,   198,   127,   143,   121,   125,   122,   147,   217,
     220,   180,   214,   143,   143,   231,   231,   231,   143,   231,
     145,   194,   145,   194,   144,   144,   194,   187,   171,   125,
     126,   171,   171,   125,   122,   122,   126,   126,   205,   122,
     217,   126,   171,   187,   145,   223,   145,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    78,   143,
     147,   170,   172,   174,   225,   226,   227,   228,   229,   231,
     232,   233,   234,   235,   237,   247,   150,   168,   167,   171,
     204,   143,   145,   143,   145,   210,   214,   216,   180,   212,
      52,   219,     3,    28,    45,    75,    76,   122,   182,   183,
     184,   122,   126,   147,   188,   144,   147,   179,   186,   187,
     189,   207,   147,   180,   188,   211,   216,   122,   121,   223,
     122,   171,   144,   214,   216,   127,   143,   141,   185,   180,
     214,   214,   195,   126,   171,   187,   122,   122,   127,   214,
     145,   145,   145,   194,   194,   145,   122,   126,   171,   126,
     126,   171,   122,   126,   126,   171,   141,   121,   121,   121,
     225,   121,   147,   143,   143,   143,   170,   147,   141,   143,
     143,   177,   178,   209,   172,   228,   172,   225,   145,   143,
     194,   194,   212,   122,   121,   122,   127,   183,    70,    71,
     145,   144,   144,   147,   147,   188,   122,   145,   251,   214,
     200,   171,   214,   126,   126,   147,   145,   145,   126,   126,
     141,   225,   170,   170,   122,   170,    57,   122,   232,   143,
     143,   142,   225,   127,   143,   142,   145,   145,   170,   122,
     183,   231,   231,    70,    71,   145,    70,    71,   145,   144,
     145,   141,   225,   122,   122,   225,   122,   121,   225,   122,
     232,   171,   178,   144,   168,   222,   122,    71,   145,    70,
     145,   231,   231,   231,   231,    70,    71,   145,   171,   225,
     225,   225,   170,   225,   122,   170,   143,   222,   224,   231,
     231,    71,   145,    70,   145,    71,   145,    70,   145,   231,
     231,    65,   122,   225,   122,   127,   145,   145,   145,   231,
     231,   231,   231,    71,   145,    70,   145,   225,   143,   225,
     145,   222,   145,   145,   145,   145,   231,   231,   145,   145
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
      case 147: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 158 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3424 "expression.ec"
	break;
      case 148: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3433 "expression.ec"
	break;
      case 151: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3442 "expression.ec"
	break;
      case 152: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3451 "expression.ec"
	break;
      case 154: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3460 "expression.ec"
	break;
      case 156: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3469 "expression.ec"
	break;
      case 157: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3478 "expression.ec"
	break;
      case 158: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3487 "expression.ec"
	break;
      case 159: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3496 "expression.ec"
	break;
      case 160: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3505 "expression.ec"
	break;
      case 161: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3514 "expression.ec"
	break;
      case 162: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3523 "expression.ec"
	break;
      case 163: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3532 "expression.ec"
	break;
      case 164: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3541 "expression.ec"
	break;
      case 165: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3550 "expression.ec"
	break;
      case 166: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3559 "expression.ec"
	break;
      case 167: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3568 "expression.ec"
	break;
      case 168: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3577 "expression.ec"
	break;
      case 170: /* "expression" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3586 "expression.ec"
	break;
      case 171: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3595 "expression.ec"
	break;
      case 172: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3604 "expression.ec"
	break;
      case 173: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3613 "expression.ec"
	break;
      case 174: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3622 "expression.ec"
	break;
      case 177: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3631 "expression.ec"
	break;
      case 178: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3640 "expression.ec"
	break;
      case 179: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3649 "expression.ec"
	break;
      case 180: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 207 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3658 "expression.ec"
	break;
      case 182: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3667 "expression.ec"
	break;
      case 183: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 208 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3676 "expression.ec"
	break;
      case 184: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 209 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3685 "expression.ec"
	break;
      case 185: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 206 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3694 "expression.ec"
	break;
      case 186: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3703 "expression.ec"
	break;
      case 187: /* "type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3712 "expression.ec"
	break;
      case 188: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3721 "expression.ec"
	break;
      case 189: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3730 "expression.ec"
	break;
      case 190: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3739 "expression.ec"
	break;
      case 191: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3748 "expression.ec"
	break;
      case 192: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3757 "expression.ec"
	break;
      case 194: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3766 "expression.ec"
	break;
      case 195: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3775 "expression.ec"
	break;
      case 196: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3784 "expression.ec"
	break;
      case 197: /* "property" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3793 "expression.ec"
	break;
      case 198: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3802 "expression.ec"
	break;
      case 199: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3811 "expression.ec"
	break;
      case 200: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3820 "expression.ec"
	break;
      case 201: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3829 "expression.ec"
	break;
      case 202: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3838 "expression.ec"
	break;
      case 203: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3847 "expression.ec"
	break;
      case 204: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3856 "expression.ec"
	break;
      case 205: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3865 "expression.ec"
	break;
      case 206: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3874 "expression.ec"
	break;
      case 207: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3883 "expression.ec"
	break;
      case 208: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3892 "expression.ec"
	break;
      case 209: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3901 "expression.ec"
	break;
      case 210: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3910 "expression.ec"
	break;
      case 211: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3919 "expression.ec"
	break;
      case 212: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3928 "expression.ec"
	break;
      case 213: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3937 "expression.ec"
	break;
      case 214: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3946 "expression.ec"
	break;
      case 215: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3955 "expression.ec"
	break;
      case 216: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3964 "expression.ec"
	break;
      case 217: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3973 "expression.ec"
	break;
      case 218: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3982 "expression.ec"
	break;
      case 219: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3991 "expression.ec"
	break;
      case 220: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4000 "expression.ec"
	break;
      case 221: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4009 "expression.ec"
	break;
      case 222: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4018 "expression.ec"
	break;
      case 223: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4027 "expression.ec"
	break;
      case 224: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4036 "expression.ec"
	break;
      case 225: /* "statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4045 "expression.ec"
	break;
      case 226: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4054 "expression.ec"
	break;
      case 227: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4063 "expression.ec"
	break;
      case 228: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4072 "expression.ec"
	break;
      case 229: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4081 "expression.ec"
	break;
      case 230: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 205 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4090 "expression.ec"
	break;
      case 231: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4099 "expression.ec"
	break;
      case 232: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4108 "expression.ec"
	break;
      case 233: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4117 "expression.ec"
	break;
      case 234: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4126 "expression.ec"
	break;
      case 235: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4135 "expression.ec"
	break;
      case 236: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4144 "expression.ec"
	break;
      case 237: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4153 "expression.ec"
	break;
      case 238: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4162 "expression.ec"
	break;
      case 240: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4171 "expression.ec"
	break;
      case 241: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4180 "expression.ec"
	break;
      case 242: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4189 "expression.ec"
	break;
      case 243: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4198 "expression.ec"
	break;
      case 244: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4207 "expression.ec"
	break;
      case 245: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4216 "expression.ec"
	break;
      case 246: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4225 "expression.ec"
	break;
      case 247: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4234 "expression.ec"
	break;
      case 248: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4243 "expression.ec"
	break;
      case 249: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4252 "expression.ec"
	break;
      case 250: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4261 "expression.ec"
	break;
      case 251: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4270 "expression.ec"
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
#line 217 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 223 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 228 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 230 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 232 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 233 "expression.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 239 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 243 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 244 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 245 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 246 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 247 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 248 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 249 "expression.y"
    { (yyval.exp) = MkExpDummy(); yyerror(); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 253 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 258 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 259 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 260 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 261 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 263 "expression.y"
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

  case 29:

/* Line 1464 of yacc.c  */
#line 275 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 276 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 277 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 307 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 308 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 309 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 310 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 314 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 315 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 316 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 320 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 323 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 324 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 338 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 339 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 341 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 342 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 343 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 344 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 349 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 354 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 355 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 356 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 361 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 362 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 367 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 368 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 373 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 374 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 375 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 376 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 381 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 382 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 387 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 392 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 397 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 402 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 407 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 412 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 417 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 418 "expression.y"
    { yyerror(); (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 420 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 421 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 426 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 427 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 428 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 429 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 431 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 432 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 433 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 434 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 435 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 439 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 440 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 448 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 449 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 450 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 451 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 455 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 459 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 460 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 461 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 462 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 466 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 467 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 468 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 469 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 470 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 471 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 472 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 473 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 474 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 475 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 480 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 482 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 483 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 484 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 485 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 486 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 487 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 491 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 492 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 493 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 494 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 495 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 496 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 497 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 498 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 499 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 500 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 504 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 505 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 509 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 510 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 514 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 515 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 516 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 517 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 518 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 519 "expression.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 523 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 524 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 528 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 529 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 530 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 535 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 536 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 537 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 538 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 539 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 543 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 544 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 548 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 549 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 550 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 554 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 555 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 559 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 560 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 561 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 565 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 590 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 594 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 595 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 596 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 599 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 600 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 601 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 627 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 628 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 636 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 643 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 649 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 650 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 651 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 654 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 658 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 660 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 663 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 665 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 669 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 670 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 674 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 675 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 679 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 683 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 684 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 693 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 695 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 697 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 708 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 711 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 719 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 730 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 737 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 738 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 739 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 740 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 741 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 746 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 748 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 753 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 755 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 757 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 761 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 765 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 766 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 771 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 772 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 773 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 774 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 775 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 780 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 782 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 787 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 795 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 799 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 801 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 803 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 811 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 813 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 815 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 835 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 836 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 841 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 844 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 845 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 846 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 894 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 896 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 902 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 904 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 906 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 908 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 910 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 916 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 919 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 923 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 931 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 933 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 942 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 946 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 950 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 951 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 956 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 957 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 958 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 963 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 967 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 968 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 972 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 973 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 974 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 978 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 979 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 983 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 984 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 994 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 996 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 998 "expression.y"
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

  case 352:

/* Line 1464 of yacc.c  */
#line 1013 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1015 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1036 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1038 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1052 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1054 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1056 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1060 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1061 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1065 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1066 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1069 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1073 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1074 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1075 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1079 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1084 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1092 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1096 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1097 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1102 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1103 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1108 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1109 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1113 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1114 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1119 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1121 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1122 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1126 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1131 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1133 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1138 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1140 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1142 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1144 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1149 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1151 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1156 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1158 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1163 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1168 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1173 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1175 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1180 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1182 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1184 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1186 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1188 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1194 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1199 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1203 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1204 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1209 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1211 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1216 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1220 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1221 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1222 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1223 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1224 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1225 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1230 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1231 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1235 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7352 "expression.ec"
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
#line 1237 "expression.y"


