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
#line 107 "expression.ec"

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
#line 37 "expression.y"

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
#line 290 "expression.ec"
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
#line 315 "expression.ec"

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
#define YYFINAL  150
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   6639

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  109
/* YYNRULES -- Number of rules.  */
#define YYNRULES  422
/* YYNRULES -- Number of states.  */
#define YYNSTATES  739

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
       2,     2,     2,   124,     2,     2,   114,   126,   119,     2,
     112,   113,   120,   121,   118,   122,   115,   125,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   132,   134,
     127,   133,   128,   131,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   116,     2,   117,   129,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   135,   130,   136,   123,     2,     2,     2,
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
       0,     0,     3,     5,     7,    11,    13,    15,    17,    19,
      22,    27,    30,    37,    43,    50,    56,    64,    71,    79,
      86,    88,    90,    92,    97,   101,   106,   110,   114,   117,
     120,   122,   127,   131,   136,   140,   144,   147,   150,   152,
     154,   158,   162,   165,   168,   171,   176,   179,   184,   189,
     192,   197,   199,   201,   203,   205,   207,   209,   211,   213,
     215,   217,   219,   221,   226,   228,   232,   236,   240,   242,
     246,   250,   252,   256,   260,   262,   266,   270,   274,   278,
     280,   284,   288,   290,   294,   296,   300,   302,   306,   308,
     312,   314,   318,   320,   326,   328,   332,   336,   338,   340,
     342,   344,   346,   348,   350,   352,   354,   356,   358,   360,
     364,   366,   369,   373,   376,   382,   384,   387,   389,   392,
     394,   397,   399,   402,   404,   407,   409,   412,   414,   417,
     419,   422,   424,   427,   429,   432,   434,   437,   439,   442,
     444,   447,   449,   452,   454,   457,   459,   462,   464,   467,
     469,   472,   474,   478,   480,   484,   486,   488,   490,   492,
     494,   496,   498,   500,   502,   504,   506,   508,   510,   512,
     514,   516,   521,   523,   526,   533,   539,   541,   543,   545,
     547,   549,   551,   553,   555,   557,   559,   561,   563,   565,
     567,   569,   571,   573,   575,   577,   579,   581,   586,   588,
     590,   592,   594,   596,   598,   600,   602,   604,   606,   608,
     610,   612,   614,   616,   618,   623,   625,   631,   636,   641,
     645,   651,   654,   657,   659,   661,   663,   666,   670,   672,
     676,   686,   696,   704,   712,   718,   729,   740,   749,   758,
     765,   774,   783,   790,   797,   802,   812,   822,   830,   838,
     844,   848,   851,   854,   857,   859,   862,   864,   866,   868,
     872,   874,   877,   880,   884,   890,   893,   896,   901,   907,
     915,   923,   929,   931,   935,   937,   941,   945,   948,   952,
     956,   960,   965,   970,   973,   977,   981,   986,   990,   993,
     997,  1001,  1006,  1008,  1010,  1013,  1016,  1019,  1023,  1025,
    1027,  1030,  1033,  1036,  1040,  1042,  1045,  1049,  1051,  1055,
    1060,  1064,  1069,  1071,  1074,  1077,  1081,  1085,  1087,  1089,
    1092,  1095,  1098,  1102,  1106,  1109,  1111,  1114,  1116,  1119,
    1122,  1126,  1128,  1132,  1134,  1138,  1141,  1144,  1146,  1148,
    1152,  1154,  1157,  1159,  1163,  1168,  1170,  1172,  1174,  1178,
    1180,  1182,  1184,  1186,  1188,  1190,  1194,  1199,  1203,  1205,
    1208,  1210,  1213,  1216,  1218,  1220,  1223,  1225,  1228,  1232,
    1234,  1237,  1243,  1251,  1257,  1263,  1271,  1278,  1286,  1291,
    1297,  1302,  1306,  1309,  1312,  1315,  1319,  1321,  1327,  1332,
    1337,  1341,  1346,  1350,  1354,  1357,  1360,  1362,  1366,  1371,
    1375,  1378,  1381,  1384,  1387,  1390,  1393,  1396,  1399,  1403,
    1405,  1407,  1411,  1414,  1416,  1418,  1421,  1424,  1426,  1429,
    1431,  1433,  1436
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     245,     0,    -1,     3,    -1,   140,    -1,   112,   163,   113,
      -1,   138,    -1,   231,    -1,     4,    -1,   229,    -1,   114,
     229,    -1,   114,   229,   115,   229,    -1,   112,   113,    -1,
      71,   167,   201,   116,   164,   117,    -1,    71,   167,   116,
     164,   117,    -1,   102,   167,   201,   116,   164,   117,    -1,
     102,   167,   116,   164,   117,    -1,    72,   164,   169,   201,
     116,   164,   117,    -1,    72,   164,   169,   116,   164,   117,
      -1,   103,   164,   169,   201,   116,   164,   117,    -1,   103,
     164,   169,   116,   164,   117,    -1,     1,    -1,   232,    -1,
     139,    -1,   142,   116,   163,   117,    -1,   142,   112,   113,
      -1,   142,   112,   144,   113,    -1,   142,   115,   138,    -1,
     142,     7,   138,    -1,   142,     8,    -1,   142,     9,    -1,
     140,    -1,   143,   116,   163,   117,    -1,   143,   112,   113,
      -1,   143,   112,   144,   113,    -1,   143,   115,   138,    -1,
     143,     7,   138,    -1,   143,     8,    -1,   143,     9,    -1,
     161,    -1,   141,    -1,   144,   118,   161,    -1,   144,   118,
     141,    -1,     8,   146,    -1,     9,   146,    -1,   148,   149,
      -1,     6,   112,   146,   113,    -1,     6,   147,    -1,     6,
     112,   214,   113,    -1,   109,   112,   146,   113,    -1,   109,
     147,    -1,   109,   112,   214,   113,    -1,   145,    -1,   142,
      -1,   145,    -1,   143,    -1,   119,    -1,   120,    -1,   121,
      -1,   122,    -1,   123,    -1,   124,    -1,    73,    -1,   146,
      -1,   112,   214,   113,   149,    -1,   149,    -1,   150,   120,
     149,    -1,   150,   125,   149,    -1,   150,   126,   149,    -1,
     150,    -1,   151,   121,   150,    -1,   151,   122,   150,    -1,
     151,    -1,   152,    10,   151,    -1,   152,    11,   151,    -1,
     152,    -1,   153,   127,   152,    -1,   153,   128,   152,    -1,
     153,    12,   152,    -1,   153,    13,   152,    -1,   153,    -1,
     154,    14,   153,    -1,   154,    15,   153,    -1,   154,    -1,
     155,   119,   154,    -1,   155,    -1,   156,   129,   155,    -1,
     156,    -1,   157,   130,   156,    -1,   157,    -1,   158,    16,
     157,    -1,   158,    -1,   159,    17,   158,    -1,   159,    -1,
     159,   131,   163,   132,   160,    -1,   160,    -1,   146,   162,
     161,    -1,   146,   162,   141,    -1,   133,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   161,    -1,
     163,   118,   161,    -1,   160,    -1,   167,   134,    -1,   167,
     170,   134,    -1,   230,   134,    -1,    77,   138,   133,   164,
     134,    -1,   179,    -1,   166,   179,    -1,   182,    -1,   166,
     182,    -1,   195,    -1,   166,   195,    -1,   184,    -1,   166,
     184,    -1,   172,    -1,   167,   172,    -1,   179,    -1,   167,
     179,    -1,   182,    -1,   167,   182,    -1,   195,    -1,   167,
     195,    -1,   184,    -1,   167,   184,    -1,   172,    -1,   168,
     172,    -1,   179,    -1,   168,   179,    -1,   182,    -1,   168,
     182,    -1,   180,    -1,   168,   180,    -1,   172,    -1,   169,
     172,    -1,   179,    -1,   169,   179,    -1,   183,    -1,   169,
     183,    -1,   184,    -1,   169,   184,    -1,   195,    -1,   169,
     195,    -1,   171,    -1,   170,   118,   171,    -1,   202,    -1,
     202,   133,   215,    -1,    29,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    74,    -1,   178,    -1,    79,    -1,
     110,    -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,
      74,    -1,    44,    -1,   175,    -1,   175,   112,   163,   113,
      -1,   176,    -1,   177,   176,    -1,   174,   112,   112,   177,
     113,   113,    -1,   174,   112,   112,   113,   113,    -1,    44,
      -1,    45,    -1,    75,    -1,   181,    -1,    28,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,    85,    -1,   185,    -1,   194,    -1,   180,
      -1,   100,   112,   180,   113,    -1,    66,    -1,    46,    -1,
      34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
      47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,
      41,    -1,   185,    -1,   194,    -1,   181,    -1,   100,   112,
     180,   113,    -1,    66,    -1,   186,   138,   135,   187,   136,
      -1,   186,   135,   187,   136,    -1,   186,   138,   135,   136,
      -1,   186,   135,   136,    -1,   186,   181,   135,   187,   136,
      -1,   186,   138,    -1,   186,   181,    -1,    48,    -1,    49,
      -1,   191,    -1,   187,   191,    -1,   142,   133,   216,    -1,
     188,    -1,   189,   118,   188,    -1,    68,   168,   138,   135,
      69,   224,    70,   224,   136,    -1,    68,   168,   138,   135,
      70,   224,    69,   224,   136,    -1,    68,   168,   138,   135,
      69,   224,   136,    -1,    68,   168,   138,   135,    70,   224,
     136,    -1,    68,   168,   138,   135,   136,    -1,    68,   168,
     200,   138,   135,    69,   224,    70,   224,   136,    -1,    68,
     168,   200,   138,   135,    70,   224,    69,   224,   136,    -1,
      68,   168,   200,   138,   135,    69,   224,   136,    -1,    68,
     168,   200,   138,   135,    70,   224,   136,    -1,    68,   168,
     200,   138,   135,   136,    -1,    68,   168,   135,    69,   224,
      70,   224,   136,    -1,    68,   168,   135,    70,   224,    69,
     224,   136,    -1,    68,   168,   135,    69,   224,   136,    -1,
      68,   168,   135,    70,   224,   136,    -1,    68,   168,   135,
     136,    -1,    68,   168,   200,   135,    69,   224,    70,   224,
     136,    -1,    68,   168,   200,   135,    70,   224,    69,   224,
     136,    -1,    68,   168,   200,   135,    69,   224,   136,    -1,
      68,   168,   200,   135,    70,   224,   136,    -1,    68,   168,
     200,   135,   136,    -1,   167,   192,   134,    -1,   167,   134,
      -1,   231,   134,    -1,   230,   134,    -1,   237,    -1,   189,
     134,    -1,   190,    -1,   134,    -1,   193,    -1,   192,   118,
     193,    -1,   202,    -1,   202,   178,    -1,   132,   164,    -1,
     202,   132,   164,    -1,   202,   132,   164,   132,   164,    -1,
      50,   138,    -1,    50,   181,    -1,    50,   135,   196,   136,
      -1,    50,   138,   135,   196,   136,    -1,    50,   138,   135,
     196,   134,   187,   136,    -1,    50,   181,   135,   196,   134,
     187,   136,    -1,    50,   181,   135,   196,   136,    -1,   197,
      -1,   196,   118,   197,    -1,   138,    -1,   138,   133,   164,
      -1,   112,   200,   113,    -1,   116,   117,    -1,   116,   164,
     117,    -1,   116,   180,   117,    -1,   198,   116,   117,    -1,
     198,   116,   164,   117,    -1,   198,   116,   180,   117,    -1,
     112,   113,    -1,   112,   210,   113,    -1,   198,   112,   113,
      -1,   198,   112,   210,   113,    -1,   112,   201,   113,    -1,
     112,   113,    -1,   112,   210,   113,    -1,   199,   112,   113,
      -1,   199,   112,   210,   113,    -1,   209,    -1,   198,    -1,
     209,   198,    -1,   173,   209,    -1,   173,   198,    -1,   173,
     209,   198,    -1,   209,    -1,   199,    -1,   209,   199,    -1,
     173,   209,    -1,   173,   199,    -1,   173,   209,   199,    -1,
     205,    -1,   209,   205,    -1,   173,   209,   205,    -1,   138,
      -1,   112,   202,   113,    -1,   203,   116,   164,   117,    -1,
     203,   116,   117,    -1,   203,   116,   180,   117,    -1,   207,
      -1,   209,   207,    -1,   173,   207,    -1,   173,   209,   207,
      -1,   209,   173,   207,    -1,   207,    -1,   203,    -1,   173,
     207,    -1,   173,   203,    -1,   203,   112,    -1,   206,   210,
     113,    -1,   206,   213,   113,    -1,   206,   113,    -1,   179,
      -1,   208,   179,    -1,   120,    -1,   120,   208,    -1,   120,
     209,    -1,   120,   208,   209,    -1,   211,    -1,   211,   118,
      51,    -1,   212,    -1,   211,   118,   212,    -1,   167,   202,
      -1,   167,   200,    -1,   167,    -1,   138,    -1,   213,   118,
     138,    -1,   166,    -1,   166,   200,    -1,   161,    -1,   135,
     217,   136,    -1,   135,   217,   118,   136,    -1,   160,    -1,
     141,    -1,   215,    -1,   217,   118,   215,    -1,   219,    -1,
     224,    -1,   225,    -1,   226,    -1,   227,    -1,   228,    -1,
     138,   132,   218,    -1,    52,   164,   132,   218,    -1,    53,
     132,   218,    -1,   165,    -1,   220,   165,    -1,   218,    -1,
     221,   218,    -1,   221,   165,    -1,   221,    -1,   220,    -1,
     220,   221,    -1,   135,    -1,   135,   136,    -1,   223,   222,
     136,    -1,   134,    -1,   163,   134,    -1,    54,   112,   163,
     113,   218,    -1,    54,   112,   163,   113,   218,    64,   218,
      -1,    55,   112,   163,   113,   218,    -1,    56,   112,   163,
     113,   218,    -1,    57,   218,    56,   112,   163,   113,   134,
      -1,    58,   112,   225,   225,   113,   218,    -1,    58,   112,
     225,   225,   163,   113,   218,    -1,    56,   112,   113,   218,
      -1,    58,   112,   225,   113,   218,    -1,    58,   112,   113,
     218,    -1,    59,   138,   134,    -1,    60,   134,    -1,    61,
     134,    -1,    62,   134,    -1,    62,   163,   134,    -1,     5,
      -1,   167,   138,   135,   244,   136,    -1,   167,   138,   135,
     136,    -1,   180,   135,   244,   136,    -1,   180,   135,   136,
      -1,   138,   135,   244,   136,    -1,   138,   135,   136,    -1,
     135,   244,   136,    -1,   135,   136,    -1,   167,   204,    -1,
     204,    -1,   167,   112,   113,    -1,   123,   167,   112,   113,
      -1,    78,   167,   204,    -1,    78,   204,    -1,   233,   224,
      -1,   236,   224,    -1,   236,   134,    -1,   234,   224,    -1,
     235,   224,    -1,   167,   204,    -1,   238,   224,    -1,   142,
     133,   216,    -1,   216,    -1,   240,    -1,   241,   118,   240,
      -1,   241,   134,    -1,   242,    -1,   239,    -1,   243,   242,
      -1,   243,   239,    -1,   134,    -1,   243,   134,    -1,   243,
      -1,   241,    -1,   243,   241,    -1,   161,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   210,   210,   215,   216,   221,   223,   225,   227,   229,
     230,   231,   234,   235,   236,   237,   238,   239,   240,   241,
     242,   246,   250,   251,   252,   253,   254,   255,   256,   257,
     262,   263,   264,   265,   266,   267,   268,   269,   273,   274,
     275,   276,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   292,   293,   297,   298,   302,   303,   304,   305,   306,
     307,   308,   312,   313,   317,   318,   319,   320,   324,   325,
     326,   330,   331,   332,   336,   337,   338,   339,   340,   344,
     345,   346,   350,   351,   355,   356,   360,   361,   365,   366,
     370,   371,   375,   376,   380,   381,   383,   388,   389,   390,
     391,   392,   393,   394,   395,   396,   397,   398,   402,   403,
     407,   411,   412,   413,   414,   418,   419,   420,   421,   422,
     423,   424,   425,   429,   430,   431,   432,   433,   434,   435,
     436,   437,   438,   443,   444,   445,   446,   447,   448,   449,
     450,   454,   455,   456,   457,   458,   459,   460,   461,   462,
     463,   467,   468,   472,   473,   477,   478,   479,   480,   481,
     485,   486,   490,   491,   492,   497,   498,   499,   500,   501,
     505,   506,   510,   511,   515,   516,   520,   521,   522,   526,
     551,   555,   556,   557,   558,   559,   560,   561,   562,   563,
     564,   565,   566,   567,   568,   569,   570,   571,   572,   576,
     577,   578,   579,   580,   581,   582,   583,   584,   585,   586,
     587,   588,   589,   590,   591,   592,   597,   598,   599,   600,
     601,   606,   607,   612,   613,   617,   618,   622,   626,   627,
     631,   633,   635,   637,   639,   642,   644,   646,   648,   650,
     653,   655,   657,   659,   661,   664,   666,   668,   670,   672,
     677,   678,   679,   680,   681,   682,   683,   684,   688,   690,
     695,   697,   699,   701,   703,   708,   709,   713,   715,   716,
     717,   718,   722,   724,   729,   731,   737,   739,   741,   743,
     745,   747,   749,   751,   753,   755,   757,   762,   764,   766,
     768,   770,   775,   776,   777,   778,   779,   780,   784,   785,
     786,   787,   788,   789,   835,   836,   838,   844,   846,   848,
     850,   852,   857,   858,   861,   863,   865,   871,   872,   873,
     875,   880,   884,   886,   888,   893,   894,   898,   899,   900,
     901,   905,   906,   910,   911,   915,   916,   917,   921,   922,
     926,   927,   936,   938,   940,   956,   957,   978,   980,   985,
     986,   987,   988,   989,   990,   994,   996,   998,  1003,  1004,
    1008,  1009,  1012,  1016,  1017,  1018,  1022,  1026,  1034,  1039,
    1040,  1044,  1045,  1046,  1050,  1051,  1052,  1053,  1055,  1056,
    1057,  1061,  1062,  1063,  1064,  1065,  1069,  1073,  1075,  1080,
    1082,  1084,  1086,  1091,  1093,  1098,  1100,  1105,  1110,  1115,
    1117,  1122,  1124,  1126,  1128,  1130,  1136,  1141,  1146,  1147,
    1151,  1153,  1158,  1163,  1164,  1165,  1166,  1167,  1168,  1172,
    1173,  1174,  1178
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
  "DBINDEX", "DATABASE_OPEN", "ALIGNOF", "ATTRIB_DEP", "__ATTRIB", "'('",
  "')'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'",
  "'~'", "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'",
  "'='", "';'", "'{'", "'}'", "$accept", "identifier",
  "primary_expression", "simple_primary_expression",
  "anon_instantiation_expression", "postfix_expression",
  "simple_postfix_expression", "argument_expression_list",
  "common_unary_expression", "unary_expression", "simple_unary_expression",
  "unary_operator", "cast_expression", "multiplicative_expression",
  "additive_expression", "shift_expression", "relational_expression",
  "equality_expression", "and_expression", "exclusive_or_expression",
  "inclusive_or_expression", "logical_and_expression",
  "logical_or_expression", "conditional_expression",
  "assignment_expression", "assignment_operator", "expression",
  "constant_expression", "declaration", "specifier_qualifier_list",
  "declaration_specifiers", "property_specifiers", "renew_specifiers",
  "init_declarator_list", "init_declarator", "storage_class_specifier",
  "ext_decl", "_attrib", "attribute_word", "attribute", "attribs_list",
  "attrib", "type_qualifier", "type", "strict_type", "type_specifier",
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
     365,   366,    40,    41,    36,    46,    91,    93,    44,    38,
      42,    43,    45,   126,    33,    47,    37,    60,    62,    94,
     124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   137,   138,   139,   139,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   141,   142,   142,   142,   142,   142,   142,   142,   142,
     143,   143,   143,   143,   143,   143,   143,   143,   144,   144,
     144,   144,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   146,   146,   147,   147,   148,   148,   148,   148,   148,
     148,   148,   149,   149,   150,   150,   150,   150,   151,   151,
     151,   152,   152,   152,   153,   153,   153,   153,   153,   154,
     154,   154,   155,   155,   156,   156,   157,   157,   158,   158,
     159,   159,   160,   160,   161,   161,   161,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   163,   163,
     164,   165,   165,   165,   165,   166,   166,   166,   166,   166,
     166,   166,   166,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   168,   168,   168,   168,   168,   168,   168,
     168,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     169,   170,   170,   171,   171,   172,   172,   172,   172,   172,
     173,   173,   174,   174,   174,   175,   175,   175,   175,   175,
     176,   176,   177,   177,   178,   178,   179,   179,   179,   180,
     181,   182,   182,   182,   182,   182,   182,   182,   182,   182,
     182,   182,   182,   182,   182,   182,   182,   182,   182,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   183,   183,   183,   183,   183,   184,   184,   184,   184,
     184,   185,   185,   186,   186,   187,   187,   188,   189,   189,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     191,   191,   191,   191,   191,   191,   191,   191,   192,   192,
     193,   193,   193,   193,   193,   194,   194,   195,   195,   195,
     195,   195,   196,   196,   197,   197,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   199,   199,   199,
     199,   199,   200,   200,   200,   200,   200,   200,   201,   201,
     201,   201,   201,   201,   202,   202,   202,   203,   203,   203,
     203,   203,   204,   204,   204,   204,   204,   205,   205,   205,
     205,   206,   207,   207,   207,   208,   208,   209,   209,   209,
     209,   210,   210,   211,   211,   212,   212,   212,   213,   213,
     214,   214,   215,   215,   215,   216,   216,   217,   217,   218,
     218,   218,   218,   218,   218,   219,   219,   219,   220,   220,
     221,   221,   221,   222,   222,   222,   223,   224,   224,   225,
     225,   226,   226,   226,   227,   227,   227,   227,   227,   227,
     227,   228,   228,   228,   228,   228,   229,   230,   230,   231,
     231,   231,   231,   232,   232,   233,   233,   234,   235,   236,
     236,   237,   237,   237,   237,   237,   238,   239,   240,   240,
     241,   241,   242,   243,   243,   243,   243,   243,   243,   244,
     244,   244,   245
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       4,     2,     6,     5,     6,     5,     7,     6,     7,     6,
       1,     1,     1,     4,     3,     4,     3,     3,     2,     2,
       1,     4,     3,     4,     3,     3,     2,     2,     1,     1,
       3,     3,     2,     2,     2,     4,     2,     4,     4,     2,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     5,     1,     3,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       1,     2,     3,     2,     5,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     3,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     2,     6,     5,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     1,     5,     4,     4,     3,
       5,     2,     2,     1,     1,     1,     2,     3,     1,     3,
       9,     9,     7,     7,     5,    10,    10,     8,     8,     6,
       8,     8,     6,     6,     4,     9,     9,     7,     7,     5,
       3,     2,     2,     2,     1,     2,     1,     1,     1,     3,
       1,     2,     2,     3,     5,     2,     2,     4,     5,     7,
       7,     5,     1,     3,     1,     3,     3,     2,     3,     3,
       3,     4,     4,     2,     3,     3,     4,     3,     2,     3,
       3,     4,     1,     1,     2,     2,     2,     3,     1,     1,
       2,     2,     2,     3,     1,     2,     3,     1,     3,     4,
       3,     4,     1,     2,     2,     3,     3,     1,     1,     2,
       2,     2,     3,     3,     2,     1,     2,     1,     2,     2,
       3,     1,     3,     1,     3,     2,     2,     1,     1,     3,
       1,     2,     1,     3,     4,     1,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     3,     4,     3,     1,     2,
       1,     2,     2,     1,     1,     2,     1,     2,     3,     1,
       2,     5,     7,     5,     5,     7,     6,     7,     4,     5,
       4,     3,     2,     2,     2,     3,     1,     5,     4,     4,
       3,     4,     3,     3,     2,     2,     1,     3,     4,     3,
       2,     2,     2,     2,     2,     2,     2,     2,     3,     1,
       1,     3,     2,     1,     1,     2,     2,     1,     2,     1,
       1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    20,     2,     7,   386,     0,     0,     0,   180,     0,
       0,    61,     0,     0,     0,     0,     0,    55,    56,    57,
      58,    59,    60,     5,    22,     3,    52,    51,    62,     0,
      64,    68,    71,    74,    79,    82,    84,    86,    88,    90,
      92,    94,   422,     0,   179,     8,     6,     0,     0,    30,
      54,    53,    46,     0,    42,    43,   155,   156,   157,   158,
     159,   182,   183,   184,   185,   186,   188,   191,   192,   189,
     190,   176,   177,   181,   187,   223,   224,     0,   198,   178,
     193,     0,     0,   123,   125,   196,   127,   131,   194,     0,
     195,   129,    62,   110,     0,     0,     0,     0,    49,    11,
     108,     0,   340,   115,   196,   117,   121,   119,     0,     9,
       0,     0,    28,    29,     0,     0,     0,    98,    99,   100,
     101,   102,   103,   104,   105,   106,   107,    97,     0,    44,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     0,     0,    36,    37,     0,     0,     0,     0,
     265,   266,     0,   160,   162,   163,   164,     0,     0,   327,
     124,     0,     0,   161,   126,   128,   132,   130,   299,     0,
     298,     0,   221,   222,   200,   201,   202,   203,   204,   206,
     209,   210,   207,   208,   199,   205,   215,     0,     0,   141,
     143,   213,   145,   147,   211,   212,   149,     0,     0,     0,
       0,     0,     4,     0,     0,     0,     0,   116,   118,   122,
     120,   293,   341,   292,     0,     0,   417,     0,   392,   346,
      52,   345,     0,   409,    21,     0,   414,   410,   420,   413,
       0,     0,    27,    24,    39,     0,    38,    26,     0,    96,
      95,    65,    66,    67,    69,    70,    72,    73,    77,    78,
      75,    76,    80,    81,    83,    85,    87,    89,    91,     0,
     390,     0,    45,    47,    35,    32,     0,    34,     0,   274,
       0,   272,     0,     0,     0,   288,   337,     0,     0,   331,
     333,     0,   325,   328,   329,   302,   301,     0,     0,     0,
     300,     0,     0,     0,     0,   257,   219,     5,     0,     0,
       0,     0,   228,     0,   256,   225,     0,   396,     0,   312,
       0,     0,     6,     0,     0,     0,     0,   254,     0,     0,
       0,     0,   142,   144,   146,   148,   150,     0,     0,     0,
       0,     0,    48,    50,   109,   283,     0,     0,   277,     0,
       0,   296,   295,     0,     0,   294,    63,    10,   394,     0,
       0,     0,   307,   406,   366,     0,   407,     0,   412,   418,
     416,   421,   415,   391,    25,     0,    23,     0,   389,    33,
      31,     0,     0,   267,     0,     0,   197,     0,     0,   336,
     335,   318,   304,   317,   292,   287,   289,     0,    13,   326,
     330,   303,     0,   290,     0,     0,     0,     0,   133,   135,
     139,   137,     0,     0,   400,     0,    56,     0,     0,     0,
       0,     0,     0,     0,   251,   307,     0,     0,   258,   260,
     395,   317,     0,   314,     0,   217,   226,     0,   255,   321,
       0,   324,   338,     0,     0,     0,   313,   253,   252,   401,
     404,   405,   403,   402,   218,     0,     0,     0,     0,     0,
      15,     0,     0,     0,   276,   284,   278,   279,   297,   285,
       0,   280,     0,     0,   393,   408,   367,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   369,
       5,     0,   358,     0,   360,   349,     0,     0,     0,   350,
     351,   352,   353,   354,     0,   411,    41,    40,    93,   275,
     273,     0,   268,     0,   271,   320,   319,   295,     0,   305,
     332,   334,   165,   166,   169,   168,   167,     0,   170,   172,
       0,   291,    12,   265,   266,     0,     0,   134,   136,   140,
     138,     0,   221,   222,   399,     0,   308,     0,   227,   397,
     262,     0,   319,     0,     0,   250,     0,   261,     0,   317,
     315,   229,   310,     0,     0,   322,   323,     0,   316,   216,
     220,   214,    17,     0,    14,    19,     0,   286,   281,   282,
       0,     0,     0,     0,     0,     0,     0,     0,   382,   383,
     384,     0,     0,     0,   370,   111,     0,   151,   153,   359,
       0,   362,   361,   368,   113,     0,     0,   306,   175,     0,
       0,   173,     0,     0,   244,     0,     0,     0,   398,   388,
       0,   317,   259,   263,   319,   309,   311,   339,    16,    18,
       0,   357,     0,     0,     0,     0,     0,     0,     0,   381,
     385,     0,   355,     0,   112,     0,   269,   270,     0,   174,
       0,     0,     0,     0,   234,     0,     0,   249,     0,   387,
       0,   356,     0,     0,   378,     0,     0,   380,     0,     0,
       0,   152,     0,   342,   154,   171,     0,   242,     0,   243,
       0,     0,     0,     0,     0,     0,   239,   264,   371,   373,
     374,     0,   379,     0,     0,   114,   347,     0,     0,     0,
       0,   232,     0,   233,     0,   247,     0,   248,     0,     0,
       0,     0,   376,     0,     0,   343,   240,   241,     0,     0,
       0,     0,     0,   237,     0,   238,   372,   375,   377,   344,
     348,   230,   231,   245,   246,     0,     0,   235,   236
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    23,    24,    25,   229,    26,    50,   245,    27,    92,
      52,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,   100,   128,   491,    94,   601,   102,
     309,   407,   198,   596,   597,    83,   310,   172,   528,   529,
     530,   173,    84,    43,    44,    86,   202,    87,    88,    89,
     311,   312,   313,   314,   315,   427,   428,    90,    91,   280,
     281,   221,   178,   346,   179,   418,   316,   317,   392,   318,
     319,   293,   320,   347,   289,   290,   444,   108,   674,   233,
     697,   494,   495,   496,   497,   498,   365,   499,   500,   501,
     502,   503,    45,   321,    46,   234,   323,   324,   325,   326,
     327,   235,   236,   237,   238,   239,   240,   241,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -610
static const yytype_int16 yypact[] =
{
    4842,  -610,  -610,  -610,  -610,  4915,  4969,  4969,  -610,  6393,
    4842,  -610,  6393,  4842,  4995,  4370,    57,  -610,  -610,  -610,
    -610,  -610,  -610,     4,  -610,  -610,   447,  -610,   682,  4842,
    -610,   205,   252,   406,    59,   410,   -49,    80,   -11,   231,
      11,  -610,  -610,   101,  -610,  -610,  -610,   264,  4494,  -610,
     536,  -610,  -610,  3972,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,    14,  -610,  -610,
    -610,   160,  5550,  -610,  -610,  -610,  -610,  -610,  -610,    33,
    -610,  -610,  -610,  -610,  6539,  5643,  6539,  4494,  -610,  -610,
    -610,   -44,  5970,  -610,   101,  -610,  -610,  -610,   183,   204,
    1782,   331,  -610,  -610,  3397,   331,  4842,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  -610,  3525,  -610,
    4842,  4842,  4842,  4842,  4842,  4842,  4842,  4842,  4842,  4842,
    4842,  4842,  4842,  4842,  4842,  4842,  4842,  4842,  4842,  1906,
    -610,   238,   249,   331,  -610,  -610,  3470,   331,  4842,   331,
     257,   262,   358,  -610,  -610,  -610,  -610,  5736,  4842,   190,
    -610,    84,   291,  -610,  -610,  -610,  -610,  -610,   294,   296,
     298,  2390,   287,   301,  -610,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,   317,  5829,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,  4842,   315,  5922,
     326,   329,  -610,  4842,  5457,  4581,   216,  -610,  -610,  -610,
    -610,    -3,  -610,   283,  4842,    57,  -610,  2030,  -610,  -610,
     164,  -610,  5278,  -610,  -610,   310,  -610,  -610,   122,  -610,
    2154,   311,  -610,  -610,  -610,    -6,  -610,  -610,   316,  -610,
    -610,  -610,  -610,  -610,   205,   205,   252,   252,   406,   406,
     406,   406,    59,    59,   410,   -49,    80,   -11,   231,   149,
    -610,   313,  -610,  -610,  -610,  -610,   195,  -610,   354,   328,
     -50,  -610,   331,   331,   346,  -610,  5185,   350,   353,   351,
    -610,   356,  -610,   190,  -610,   294,   298,   363,  6063,  4842,
     294,  6466,  5278,  4548,  6393,  -610,  -610,     4,   234,  4023,
      96,  2502,  -610,   132,  -610,  -610,   292,  -610,  5371,  -610,
     531,   344,   352,   310,   310,   310,   375,  -610,  2614,  3665,
     358,  4842,  -610,  -610,  -610,  -610,  -610,   368,   384,  4842,
    4842,   376,  -610,  -610,  -610,  -610,   386,   390,  -610,   396,
     -39,    -3,   283,  6149,  4635,    -3,  -610,  -610,  -610,   399,
    3525,   511,  -610,  -610,   402,  3239,  -610,  3525,  -610,  -610,
    -610,   122,  -610,  -610,  -610,  3525,  -610,  4842,  -610,  -610,
    -610,  4842,   331,  -610,   -61,   127,  -610,  5092,   105,  -610,
    -610,   292,  -610,  -610,   487,  -610,  -610,  6320,  -610,  -610,
    -610,   294,   393,  -610,   407,   405,    53,  3913,  -610,  -610,
    -610,  -610,    53,  5278,  -610,  4246,   616,    96,   416,   531,
    6235,  3525,   340,  4842,  -610,   404,    96,   144,  -610,   213,
    -610,   412,   531,  -610,    31,  -610,  -610,   946,  -610,  -610,
    4708,  -610,  -610,   427,   222,    31,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,  2726,  2838,   438,   436,  4842,
    -610,   440,   443,  4842,  -610,  -610,  -610,  -610,    -3,  -610,
     442,  -610,   448,    65,  -610,  -610,  -610,  4842,   432,   455,
     460,   463,  3324,   477,   331,   445,   453,  3806,   331,  -610,
     185,   184,  -610,  4133,  -610,  -610,  1410,  1534,   465,  -610,
    -610,  -610,  -610,  -610,   457,  -610,  -610,  -610,  -610,  -610,
    -610,  3665,  -610,  3665,  -610,   292,  -610,   487,    31,  -610,
    -610,  -610,  -610,  -610,  -610,  -610,  -610,   489,   505,  -610,
     467,  -610,  -610,  -610,  -610,   -25,   483,  -610,  -610,  -610,
    -610,    32,  -610,  -610,  -610,   531,  -610,   506,  -610,  -610,
    -610,  2278,   485,   531,    91,  -610,  4842,  -610,    31,   491,
    -610,  -610,  -610,   510,    98,  -610,  -610,   331,  -610,  -610,
    -610,  -610,  -610,   512,  -610,  -610,   515,  -610,  -610,  -610,
     496,  3324,  4842,  4842,  4762,   577,  3718,   501,  -610,  -610,
    -610,   188,   503,  3324,  -610,  -610,   193,  -610,   514,  -610,
    1658,  -610,  -610,  -610,  -610,  2950,  3062,  -610,  -610,  4842,
     526,  -610,   310,   310,  -610,   123,   158,   509,  -610,  -610,
     513,   519,  -610,   518,   520,  -610,  -610,  -610,  -610,  -610,
    3324,  -610,   241,   245,  3324,   248,   545,  3324,  3752,  -610,
    -610,  4842,  -610,   511,  -610,  3553,  -610,  -610,   251,  -610,
     -47,   -48,   310,   310,  -610,   310,   310,  -610,   179,  -610,
    4842,  -610,  3324,  3324,  -610,  3324,  4842,  -610,  3324,  4788,
     525,  -610,  3553,  -610,  -610,  -610,   310,  -610,   310,  -610,
     -38,   -18,   -16,   -10,   310,   310,  -610,  -610,   600,  -610,
    -610,   270,  -610,  3324,   272,  -610,  -610,   134,   534,   535,
     310,  -610,   310,  -610,   310,  -610,   310,  -610,    -5,    10,
    3324,   544,  -610,  3324,  3115,  -610,  -610,  -610,   546,   547,
     549,   556,   310,  -610,   310,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,  -610,  -610,  -610,   560,   561,  -610,  -610
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -610,   435,  -610,   277,  -106,   -28,  -610,   542,   284,     0,
     667,  -610,    29,   355,   382,   475,   385,   568,   572,   567,
     573,   575,  -610,    17,     1,  -610,   -13,    39,  -346,  -610,
     128,  -610,   624,  -610,    81,   713,   672,  -610,  -610,   199,
    -610,   303,    28,   823,   -65,    -2,   -92,   191,    -4,  -216,
    -291,   286,  -610,  -610,  -301,  -610,   171,   135,   592,   250,
     348,  -205,  -155,   -98,   -29,  -283,   872,  -218,  -355,  -610,
     854,  -610,   -35,  -134,  -610,   337,  -610,     7,  -609,  -319,
    -610,   361,  -610,  -610,   239,  -610,  -610,  -148,  -537,  -610,
    -610,  -610,    -7,  -345,   220,  -610,  -610,  -610,  -610,  -610,
    -610,  -610,   499,   373,   502,   507,  -610,  -144,  -610
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -420
static const yytype_int16 yytable[] =
{
      28,    42,   101,   390,   222,   271,    54,    55,   244,   109,
     436,   351,   161,   105,   363,    28,   295,     2,   355,   492,
     504,   678,   249,   676,   183,   300,   429,    93,   147,   201,
      93,   201,   700,   288,     2,     2,     2,   455,   456,   519,
     101,   475,     8,   103,   612,   613,   105,   180,   151,   638,
     244,   702,    96,    28,   704,   152,     2,   382,   129,   706,
     180,     8,     4,   696,   519,   722,   208,   223,   382,   212,
     143,   137,   138,   511,   213,   512,   103,   519,   467,   724,
     175,     8,   230,   359,   414,   412,   383,   366,   679,   677,
     204,   430,   204,   175,     2,   105,   149,   210,   701,     2,
     218,   669,   548,   248,   211,   730,   334,   374,     2,   353,
     174,   614,   375,   354,    28,   246,    28,   334,   703,   145,
     705,   230,   200,   174,   200,   103,   707,   231,    28,   250,
     217,   723,   180,   201,   294,   269,   296,    82,   287,   110,
      95,   401,   148,   361,   201,   278,   725,   468,    28,   159,
     599,   504,   504,   308,   436,   436,    28,   246,    28,   251,
     252,   253,   607,   180,   404,   163,   231,   616,   181,   337,
     164,   111,   112,   113,   180,   449,   450,   451,   453,   223,
     341,   352,   579,   351,   443,    93,   139,   140,   389,   355,
     607,   412,   652,   653,   204,   544,   167,   292,   607,   230,
     149,   165,   166,   361,   169,   204,   106,   291,   361,   144,
     598,   169,   230,    28,   344,   626,   169,   387,   357,   470,
     605,   215,   606,   423,    93,   169,   333,   655,   656,   205,
     175,   205,    93,   149,    71,    72,   149,   333,   232,   106,
     367,   111,   112,   113,   231,   382,   338,   146,   684,   685,
     437,   394,   714,   356,   349,   504,   368,   231,   400,   654,
     174,   513,   554,   514,   150,    79,   438,   213,   419,   506,
     715,   429,   162,   176,   432,   434,   114,   232,   555,   115,
     116,   377,    49,   308,   175,   203,   176,   203,   106,    51,
     101,    49,   164,   219,   657,   286,   224,   360,    51,   411,
     308,   308,   213,    28,   436,   436,   213,   175,   379,   541,
     169,   643,   468,   375,   174,   686,    93,   593,   594,   225,
     110,   399,   640,   165,   166,   130,   419,   644,   214,   409,
     131,   132,   215,   205,     2,   566,   169,   174,   405,   230,
     567,   534,   286,     2,   205,   556,   114,   543,    93,   115,
     116,   272,   394,   517,   662,   232,    93,    93,   663,   213,
     598,   665,   273,   213,   675,    28,   213,   421,   232,   213,
     458,    93,   223,   133,   134,    28,   507,   231,   461,   462,
     419,   294,   545,   711,   231,   713,     8,   419,   213,   335,
     213,   553,   282,   472,   508,   214,   522,   283,    93,   215,
     335,   322,   101,   297,   439,   540,   298,   620,   440,   308,
     167,   175,   299,   105,   163,    28,   135,   136,   175,   164,
     509,   523,   328,   176,   141,   142,   286,   308,   308,   330,
     413,   339,   420,   376,   213,   538,   329,   524,   231,   342,
      93,   174,   343,   103,   292,   364,   286,   373,   174,   378,
     165,   166,   361,   549,   111,   112,   113,    93,   419,   386,
     169,   381,   550,   395,   650,   651,   396,   525,   526,   397,
     522,   380,   213,   398,   591,   402,    93,   176,   447,   563,
      93,   286,    28,   308,   459,   308,   448,    28,   254,   255,
       2,   175,   463,   493,    93,   523,    28,    28,   573,   464,
     176,   460,   576,   465,   680,   681,   527,   682,   683,   452,
     364,   524,   160,   466,     2,   286,   580,   256,   257,   419,
     531,   174,   532,   230,   182,   286,   262,   263,   698,   546,
     699,   322,   384,   385,     2,   474,   708,   709,   476,   551,
     565,   525,   526,   153,   154,   155,   242,  -312,   322,   322,
     247,   571,   718,   572,   719,   577,   720,   574,   721,   114,
     575,   163,   115,   116,   581,   578,   164,   582,   231,   632,
     633,   635,   583,    93,   735,   584,   736,   308,   308,   588,
     610,    28,    28,    28,    28,   163,    28,   589,   274,   586,
     164,   604,   277,    28,   279,   623,   648,   165,   166,   387,
      28,   603,   608,   215,   176,   163,   106,   107,   419,    28,
     164,   176,   258,   259,   260,   261,   307,   609,   615,   618,
    -314,   165,   166,   361,   493,   493,  -313,   625,   630,   628,
      28,   169,   629,   636,    28,   639,   641,    28,    28,   649,
     107,   165,   166,   361,   658,    28,   673,   645,   156,   659,
     660,   157,   158,   691,  -315,  -316,   694,   666,    93,   695,
      71,    72,    28,    28,   710,    28,    28,   362,    28,    28,
     716,   717,    28,   673,   177,   322,   322,    93,   727,   232,
     670,    98,   731,   732,   176,   733,   206,   177,   206,   107,
    -327,    79,   734,    28,   220,  -327,   737,   738,   276,   687,
     117,   118,   119,   120,   121,   122,   123,   124,   125,   126,
      28,   264,   266,    28,    28,   673,   265,   279,   279,   267,
     209,   362,   268,   561,   671,   622,  -327,  -327,   493,   611,
     510,   322,   557,   322,   521,   600,   169,   362,   307,   370,
     505,     0,   371,     0,   425,   362,   307,   372,     0,     0,
       0,     0,     0,   442,   171,   362,     0,     0,     0,     0,
       0,     0,     0,   307,   307,     0,     0,   171,     0,     0,
       0,     0,     0,     0,   216,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     336,     0,     0,     0,     0,   170,   362,     0,     0,     0,
     490,   336,     0,     0,     0,     0,     0,   199,   170,   199,
       0,     0,     0,     0,     0,   127,     0,   279,     0,     0,
       0,     0,   362,   362,   177,   322,   322,     0,     0,   362,
       0,     0,    85,     0,     0,    85,     0,     0,   104,   171,
       0,   533,   536,   585,     0,     0,     0,   542,   362,     0,
     307,     0,   362,     0,   362,     0,     0,   362,   602,     0,
       0,   362,     0,     0,     0,     0,     0,   362,     0,   362,
     171,   104,     0,     0,     0,     0,     0,     0,   177,     0,
     362,   171,     0,     0,     0,     0,   216,     0,     0,     0,
     307,   307,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   177,     0,     0,     0,    85,     0,     0,     0,     0,
       0,   332,     0,     0,     0,     0,     0,   490,    85,   587,
     104,     0,   332,   592,     0,    85,     0,     0,   425,     0,
       0,   490,   490,   104,     0,     0,     0,     0,     0,     0,
       0,     0,   631,     0,     0,   170,   307,     1,   307,     2,
       3,     4,   362,   362,   642,     0,     0,     0,   388,     0,
       0,   602,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   104,     0,     8,   417,   617,     0,     0,     0,
     362,   426,     0,     0,     0,   284,     0,     0,   362,   362,
      85,   661,   445,   362,     0,   664,     0,     0,   667,   170,
       0,     0,   627,     0,   104,   177,     0,   107,     0,     0,
       0,     0,   177,     0,   408,     0,   490,     9,    10,     0,
       0,     0,   170,   688,   689,     0,   690,     0,   490,   692,
       0,     0,     0,   417,     0,   490,     0,    85,   350,     0,
     307,   307,     0,     0,     0,     0,     0,     0,    12,    13,
     104,     0,     0,     0,   712,    85,     0,     0,    53,   388,
      16,     0,     0,   104,     0,   490,   518,     0,     0,   490,
       0,   726,   490,     0,   728,     0,     0,     0,   362,   216,
       0,     0,     0,     0,     0,   177,     0,   417,     0,     0,
       0,   518,     0,     0,   417,     0,     0,   490,   490,     0,
     490,     0,     0,   490,   558,     0,     0,     0,     0,    85,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     537,    85,     0,     0,   410,    85,   170,    85,   490,     0,
       0,     0,    85,   170,   104,     0,     0,     0,     0,     0,
     393,    85,     0,     0,     0,   490,     0,     0,   490,     0,
       0,   104,   104,   457,     0,     0,     0,   393,   391,     0,
       0,     0,     0,   431,   433,   417,     0,     0,     0,     0,
       0,     0,     0,     0,   446,   391,    85,   473,     0,     0,
       0,   391,     0,     0,     0,     0,     0,     0,   104,   518,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   170,     0,     0,     0,
      85,     0,     0,     0,     0,   393,     0,   518,     0,     0,
      85,     0,     0,     0,     0,   518,   417,     0,     0,     0,
     539,     0,     0,   391,     0,     0,    85,     0,   104,     0,
       0,   393,   516,    85,     0,     0,     0,     0,   393,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   391,
     515,     0,     0,   564,     0,     0,   391,     0,     0,   393,
       0,   516,     0,   393,     0,     0,   393,     0,   104,   104,
     552,     0,     0,     0,     0,     0,   559,   391,   560,   515,
       0,   391,     0,     0,   391,     0,     0,     0,   515,   568,
       0,     0,     0,     0,   391,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   417,    85,     0,     0,   104,
     104,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   104,     0,   104,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   393,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   391,     0,     0,     0,     0,
       0,   393,   516,     0,   104,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   391,
     515,     0,     0,     0,     0,     0,     0,     0,     0,   393,
       0,     0,     0,     0,     0,     0,     0,   621,   393,     0,
       0,     1,   624,     2,     3,     4,     5,   391,     6,     7,
       0,     0,     0,   104,     0,   391,   391,     0,   104,   104,
     515,     0,     0,     0,     0,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,   477,   478,   479,   480,   481,   482,   483,   484,
     485,   486,   487,     0,     0,     0,    78,     0,     0,     0,
       0,     9,    10,    11,     0,    79,     0,   488,     0,     0,
       0,     0,     0,     0,     0,    80,     0,   393,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,   391,     0,     0,     0,    14,
       0,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   489,   364,  -364,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,   477,   478,   479,   480,
     481,   482,   483,   484,   485,   486,   487,     0,     0,     0,
      78,     0,     0,     0,     0,     9,    10,    11,     0,    79,
       0,   488,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   489,   364,
    -363,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
     477,   478,   479,   480,   481,   482,   483,   484,   485,   486,
     487,     0,     0,     0,    78,     0,     0,     0,     0,     9,
      10,    11,     0,    79,     0,   488,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      15,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   489,   364,  -365,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     9,    10,    11,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   226,   227,   228,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     9,    10,    11,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    15,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     226,   227,   270,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     9,    10,    11,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   226,   227,   358,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     9,    10,    11,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   369,   227,
    -419,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     9,
      10,    11,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      15,     1,    16,     2,     3,     4,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   226,   227,   619,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,   301,     0,
       0,     9,    10,     0,   163,    79,     0,     0,   302,   164,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     165,   166,   303,     1,    16,     2,     3,     4,     0,     0,
     169,     0,     0,   304,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   305,     0,   306,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     301,     0,     0,     9,    10,     0,   163,    79,     0,     0,
     302,   164,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   165,   166,   303,     1,    16,     2,     3,     4,
       0,     0,   169,     0,     0,   304,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   305,     0,   435,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,   301,     0,     0,     9,    10,     0,   163,    79,
       0,     0,   302,   164,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   165,   166,   303,     1,    16,     2,
       3,     4,     0,     0,   169,     0,     0,   304,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   305,     0,
     454,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,   301,     0,     0,     9,    10,     0,
     163,    79,     0,     0,   302,   164,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,   303,     1,
      16,     2,     3,     4,     0,     0,   169,     0,     0,   304,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     305,     0,   569,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,   301,     0,     0,     9,
      10,     0,   163,    79,     0,     0,   302,   164,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   165,   166,
     303,     1,    16,     2,     3,     4,     0,     0,   169,     0,
       0,   304,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   305,     0,   570,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,   301,     0,
       0,     9,    10,     0,   163,    79,     0,     0,   302,   164,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     165,   166,   303,     1,    16,     2,     3,     4,     0,     0,
     169,     0,     0,   304,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   305,     0,   646,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,    78,     0,
     301,     0,     0,     9,    10,     0,   163,    79,     0,     0,
     302,   164,     0,     8,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   165,   166,   303,     0,    16,     0,     0,     0,
       0,     0,   169,     0,     0,   304,     9,    10,    11,     0,
       0,     0,     0,     0,     0,     0,   305,     0,   647,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
     672,   729,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   477,   478,   479,   480,   481,   482,   483,   484,   485,
     486,   487,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,   488,     0,     0,     0,
       0,     0,     0,     0,    80,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    15,     8,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   489,   364,     0,   477,   478,   479,   480,
     481,   482,   483,   484,   485,   486,   487,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   489,   364,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    15,
     243,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     1,     0,     2,     3,
       4,     5,   227,     6,     7,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     8,    15,   275,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     0,   227,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,    10,    11,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,    12,    13,     0,     0,     0,
     227,     0,    14,     0,     0,    15,     1,    16,     2,     3,
       4,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   672,     0,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,    78,     0,   301,     0,     0,     9,    10,     0,   163,
      79,     0,     0,   302,   164,     0,     8,     0,     0,     0,
      80,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   165,   166,   303,     0,    16,
       8,     0,     0,     0,     0,   169,     0,     0,   304,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,   305,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
      12,    13,     0,     9,    10,    11,     0,    14,     0,     0,
      15,   637,    16,     0,     8,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   489,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    15,   668,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     9,    10,    11,
       0,     0,     0,     0,     0,     0,   489,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     2,     0,    15,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     590,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,   406,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,    78,
       6,     7,     0,     0,     0,     0,     0,   163,    79,     0,
       0,     0,   164,     0,     0,     0,     0,     0,    80,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   166,   214,     2,     0,     0,   215,
       0,     0,     0,   169,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     0,     0,   535,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    15,    99,    16,     0,     0,    78,
       0,    17,    18,    19,    20,    21,    22,   163,    79,     0,
       0,     0,   164,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   166,   422,     2,     0,     0,     0,
       0,     0,     0,   169,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   423,     0,   424,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   163,    79,     0,
       0,     0,   164,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   166,   361,     0,     1,     0,     2,
       3,     4,     5,   169,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   595,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     9,    10,    11,
     163,    79,     0,     0,     0,   164,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,   165,   166,   415,    99,
      16,     0,     0,     0,     0,    17,   416,    19,    20,    21,
      22,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,     0,
       0,     0,     0,     0,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     9,    10,    11,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    15,    99,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,     0,     0,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
      78,     0,     0,     0,     0,     9,    10,    11,     0,    79,
       0,     0,     0,     0,     0,     0,     8,     0,     0,    80,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    53,    99,    16,     8,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     9,
      10,    11,   163,     0,     0,     0,     0,   164,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
      12,    13,     9,    10,    11,     0,     0,    14,   165,   166,
     415,    99,    16,     8,     0,     0,     0,    17,   416,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    15,     0,    16,     0,     0,   348,     0,
      17,    18,    19,    20,    21,    22,     9,    10,    11,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    15,     0,    16,
       0,     0,   471,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,     1,
       8,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     8,    14,     0,     0,
      15,     0,    16,     0,     0,   562,     0,    17,    18,    19,
      20,    21,    22,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,    12,    13,     0,     0,     0,     0,
       8,    14,     0,     0,    15,   634,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      15,   693,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     9,    10,    11,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     0,     0,     1,     8,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     0,
       0,     0,     0,     8,    14,     0,     0,    48,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       9,    10,    11,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     0,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    53,     0,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     0,     2,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    97,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,   163,    79,     0,     0,
       0,   164,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   165,   166,   387,   345,     0,     0,   215,     0,
       0,     0,   169,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,   163,
      79,     0,     0,     0,   164,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   165,   166,   387,     0,     0,
       0,   215,     0,     0,     0,   169,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,   163,    79,     0,     0,     0,   164,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   165,   166,
     361,     0,     0,     0,     0,     0,     0,     0,   169,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   441,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,   163,    79,     0,     0,     0,   164,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   165,   166,   214,
     345,     0,     0,   215,     0,     0,     0,   169,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,   163,    79,     0,     0,     0,   164,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     165,   166,   167,     0,     0,     0,   168,     0,     0,     0,
     169,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   163,    79,     0,
       0,     0,   164,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   166,   167,     0,     0,     0,   207,
       0,     0,     0,   169,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
     163,    79,     0,     0,     0,   164,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   165,   166,   167,   285,
       0,     0,     0,     0,     0,     0,   169,     8,    56,    57,
      58,    59,    60,   184,   185,   186,   187,   188,   189,   190,
     191,   192,   193,    71,    72,   194,   195,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   196,     0,     0,     0,     0,
       0,     0,     0,   163,    79,     0,     0,     0,   164,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   197,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   165,
     166,   167,     0,     0,     0,   331,     0,     0,     0,   169,
       8,    56,    57,    58,    59,    60,   184,   185,   186,   187,
     188,   189,   190,   191,   192,   193,    71,    72,   194,   195,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   196,     0,
       0,     0,     0,     0,     0,     0,   163,    79,     8,     0,
       0,   164,     0,     0,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,   197,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   165,   166,   167,     0,    78,     0,   340,     0,
       0,     0,   169,     0,   163,    79,     0,     0,     0,   164,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     165,   166,   214,     0,     0,     0,   215,     0,     0,     0,
     169,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   403,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   469,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   547,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,   520,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,   406,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     8,    56,    57,
      58,    59,    60,   184,   185,   186,   187,   188,   189,   190,
     191,   192,   193,    71,    72,   194,   195,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   196,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   197
};

static const yytype_int16 yycheck[] =
{
       0,     0,    15,   286,   102,   149,     6,     7,   114,    16,
     311,   216,    77,    15,   232,    15,   171,     3,   223,   365,
     365,    69,   128,    70,    89,   180,   309,    10,    17,    94,
      13,    96,    70,   167,     3,     3,     3,   328,   329,   394,
      53,   360,    28,    15,    69,    70,    48,    82,    48,   586,
     156,    69,    13,    53,    70,    48,     3,   118,    29,    69,
      95,    28,     5,   672,   419,    70,    95,   102,   118,   113,
     119,    12,    13,   134,   118,   136,    48,   432,   117,    69,
      82,    28,   110,   227,   302,   301,   136,   235,   136,   136,
      94,   309,    96,    95,     3,    97,   135,    97,   136,     3,
     102,   638,   421,   116,    97,   714,   198,   113,     3,   112,
      82,   136,   118,   116,   114,   114,   116,   209,   136,   130,
     136,   149,    94,    95,    96,    97,   136,   110,   128,   128,
     102,   136,   167,   198,   169,   148,   171,     9,   167,   135,
      12,   296,   131,   112,   209,   158,   136,   352,   148,   135,
     496,   496,   497,   181,   455,   456,   156,   156,   158,   130,
     131,   132,   517,   198,   298,    74,   149,   135,   135,   198,
      79,     7,     8,     9,   209,   323,   324,   325,   326,   214,
     209,   216,   117,   388,   318,   168,   127,   128,   286,   394,
     545,   407,    69,    70,   198,   413,   112,   169,   553,   227,
     135,   110,   111,   112,   120,   209,    15,   168,   112,   129,
     493,   120,   240,   213,   213,   117,   120,   112,   225,   353,
     511,   116,   513,   132,   207,   120,   198,    69,    70,    94,
     232,    96,   215,   135,    44,    45,   135,   209,   110,    48,
     118,     7,     8,     9,   227,   118,   207,    16,    69,    70,
     118,   286,   118,   224,   215,   600,   134,   240,   293,   136,
     232,   134,   118,   136,     0,    75,   134,   118,   303,   375,
     136,   554,   112,    82,   309,   310,   112,   149,   134,   115,
     116,   132,     5,   311,   286,    94,    95,    96,    97,     5,
     303,    14,    79,   102,   136,   167,   113,   133,    14,   301,
     328,   329,   118,   303,   605,   606,   118,   309,   113,   407,
     120,   118,   517,   118,   286,   136,   299,   132,   134,   115,
     135,   293,   134,   110,   111,   120,   361,   134,   112,   301,
     125,   126,   116,   198,     3,   113,   120,   309,   299,   367,
     118,   406,   214,     3,   209,   132,   112,   412,   331,   115,
     116,   113,   387,   388,   113,   227,   339,   340,   113,   118,
     643,   113,   113,   118,   113,   365,   118,   133,   240,   118,
     331,   354,   407,   121,   122,   375,   375,   360,   339,   340,
     415,   416,   417,   113,   367,   113,    28,   422,   118,   198,
     118,   426,   135,   354,   377,   112,     3,   135,   381,   116,
     209,   181,   415,   112,   112,   407,   112,   551,   116,   437,
     112,   413,   116,   415,    74,   415,    10,    11,   420,    79,
     381,    28,   135,   232,    14,    15,   298,   455,   456,   112,
     302,   116,   304,   117,   118,   407,   135,    44,   421,   113,
     423,   413,   113,   415,   416,   135,   318,   136,   420,   136,
     110,   111,   112,   113,     7,     8,     9,   440,   493,   113,
     120,   133,   423,   113,   612,   613,   113,    74,    75,   118,
       3,   117,   118,   117,   487,   112,   459,   286,   134,   440,
     463,   353,   482,   511,   116,   513,   134,   487,   133,   134,
       3,   493,   116,   365,   477,    28,   496,   497,   459,   113,
     309,   117,   463,   113,   652,   653,   113,   655,   656,   134,
     135,    44,    77,   117,     3,   387,   477,   135,   136,   554,
     113,   493,   117,   551,    89,   397,   141,   142,   676,   113,
     678,   311,   282,   283,     3,   136,   684,   685,   136,   135,
     113,    74,    75,     7,     8,     9,   111,   135,   328,   329,
     115,   113,   700,   117,   702,   113,   704,   117,   706,   112,
     117,    74,   115,   116,   132,   117,    79,   112,   551,   582,
     583,   584,   112,   556,   722,   112,   724,   605,   606,   134,
     113,   581,   582,   583,   584,    74,   586,   134,   153,   112,
      79,   134,   157,   593,   159,   556,   609,   110,   111,   112,
     600,   136,   113,   116,   413,    74,   415,    15,   643,   609,
      79,   420,   137,   138,   139,   140,   181,   112,   135,   113,
     135,   110,   111,   112,   496,   497,   135,   117,   132,   117,
     630,   120,   117,    56,   634,   134,   133,   637,   638,   113,
      48,   110,   111,   112,   135,   645,   645,   133,   112,   136,
     132,   115,   116,   666,   135,   135,   669,   112,   641,   134,
      44,    45,   662,   663,    64,   665,   666,   232,   668,   669,
     136,   136,   672,   672,    82,   455,   456,   660,   134,   551,
     641,    14,   136,   136,   493,   136,    94,    95,    96,    97,
      74,    75,   136,   693,   102,    79,   136,   136,   156,   660,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
     710,   143,   145,   713,   714,   714,   144,   282,   283,   146,
      96,   286,   147,   437,   643,   554,   110,   111,   600,   530,
     382,   511,   429,   513,   397,   496,   120,   302,   303,   240,
     367,    -1,   240,    -1,   309,   310,   311,   240,    -1,    -1,
      -1,    -1,    -1,   318,    82,   320,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   328,   329,    -1,    -1,    95,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     198,    -1,    -1,    -1,    -1,    82,   361,    -1,    -1,    -1,
     365,   209,    -1,    -1,    -1,    -1,    -1,    94,    95,    96,
      -1,    -1,    -1,    -1,    -1,   133,    -1,   382,    -1,    -1,
      -1,    -1,   387,   388,   232,   605,   606,    -1,    -1,   394,
      -1,    -1,     9,    -1,    -1,    12,    -1,    -1,    15,   167,
      -1,   406,   407,   482,    -1,    -1,    -1,   412,   413,    -1,
     415,    -1,   417,    -1,   419,    -1,    -1,   422,   497,    -1,
      -1,   426,    -1,    -1,    -1,    -1,    -1,   432,    -1,   434,
     198,    48,    -1,    -1,    -1,    -1,    -1,    -1,   286,    -1,
     445,   209,    -1,    -1,    -1,    -1,   214,    -1,    -1,    -1,
     455,   456,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   309,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,
      -1,   198,    -1,    -1,    -1,    -1,    -1,   482,    95,   484,
      97,    -1,   209,   488,    -1,   102,    -1,    -1,   493,    -1,
      -1,   496,   497,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   581,    -1,    -1,   232,   511,     1,   513,     3,
       4,     5,   517,   518,   593,    -1,    -1,    -1,   286,    -1,
      -1,   600,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   149,    -1,    28,   303,   541,    -1,    -1,    -1,
     545,   309,    -1,    -1,    -1,   162,    -1,    -1,   553,   554,
     167,   630,   320,   558,    -1,   634,    -1,    -1,   637,   286,
      -1,    -1,   567,    -1,   181,   413,    -1,   415,    -1,    -1,
      -1,    -1,   420,    -1,   301,    -1,   581,    71,    72,    -1,
      -1,    -1,   309,   662,   663,    -1,   665,    -1,   593,   668,
      -1,    -1,    -1,   361,    -1,   600,    -1,   214,   215,    -1,
     605,   606,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
     227,    -1,    -1,    -1,   693,   232,    -1,    -1,   112,   387,
     114,    -1,    -1,   240,    -1,   630,   394,    -1,    -1,   634,
      -1,   710,   637,    -1,   713,    -1,    -1,    -1,   643,   407,
      -1,    -1,    -1,    -1,    -1,   493,    -1,   415,    -1,    -1,
      -1,   419,    -1,    -1,   422,    -1,    -1,   662,   663,    -1,
     665,    -1,    -1,   668,   432,    -1,    -1,    -1,    -1,   286,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     407,   298,    -1,    -1,   301,   302,   413,   304,   693,    -1,
      -1,    -1,   309,   420,   311,    -1,    -1,    -1,    -1,    -1,
     286,   318,    -1,    -1,    -1,   710,    -1,    -1,   713,    -1,
      -1,   328,   329,   330,    -1,    -1,    -1,   303,   286,    -1,
      -1,    -1,    -1,   309,   310,   493,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   320,   303,   353,   354,    -1,    -1,
      -1,   309,    -1,    -1,    -1,    -1,    -1,    -1,   365,   517,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   493,    -1,    -1,    -1,
     387,    -1,    -1,    -1,    -1,   361,    -1,   545,    -1,    -1,
     397,    -1,    -1,    -1,    -1,   553,   554,    -1,    -1,    -1,
     407,    -1,    -1,   361,    -1,    -1,   413,    -1,   415,    -1,
      -1,   387,   388,   420,    -1,    -1,    -1,    -1,   394,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   387,
     388,    -1,    -1,   440,    -1,    -1,   394,    -1,    -1,   415,
      -1,   417,    -1,   419,    -1,    -1,   422,    -1,   455,   456,
     426,    -1,    -1,    -1,    -1,    -1,   432,   415,   434,   417,
      -1,   419,    -1,    -1,   422,    -1,    -1,    -1,   426,   445,
      -1,    -1,    -1,    -1,   432,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   643,   493,    -1,    -1,   496,
     497,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   511,    -1,   513,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   493,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   493,    -1,    -1,    -1,    -1,
      -1,   517,   518,    -1,   551,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   517,
     518,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   545,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   553,   554,    -1,
      -1,     1,   558,     3,     4,     5,     6,   545,     8,     9,
      -1,    -1,    -1,   600,    -1,   553,   554,    -1,   605,   606,
     558,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,   643,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,   643,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,   123,   124,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   134,   135,   136,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,   120,   121,   122,   123,   124,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   134,   135,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,    -1,    -1,   119,   120,   121,
     122,   123,   124,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   134,   135,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,   123,   124,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   134,   135,   136,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,
     124,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     134,   135,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,   123,   124,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   134,   135,   136,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,   120,   121,   122,   123,   124,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   134,   135,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,     1,   114,     3,     4,     5,    -1,   119,   120,   121,
     122,   123,   124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,   135,   136,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,     1,   114,     3,     4,     5,    -1,    -1,
     120,    -1,    -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,     1,   114,     3,     4,     5,
      -1,    -1,   120,    -1,    -1,   123,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,     1,   114,     3,
       4,     5,    -1,    -1,   120,    -1,    -1,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,
     136,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,     1,
     114,     3,     4,     5,    -1,    -1,   120,    -1,    -1,   123,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     134,    -1,   136,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,     1,   114,     3,     4,     5,    -1,    -1,   120,    -1,
      -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,    -1,   136,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,     1,   114,     3,     4,     5,    -1,    -1,
     120,    -1,    -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   134,    -1,   136,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    28,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,   114,    -1,    -1,    -1,
      -1,    -1,   120,    -1,    -1,   123,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,   136,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,   124,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     135,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    28,   114,    -1,    -1,    -1,    -1,   119,   120,
     121,   122,   123,   124,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   134,   135,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,    -1,
      -1,    -1,    -1,   119,   120,   121,   122,   123,   124,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,   135,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,   114,    -1,    -1,    -1,    -1,   119,   120,   121,   122,
     123,   124,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,   135,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    28,   112,   113,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,   123,   124,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,   135,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,   124,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
     135,    -1,   109,    -1,    -1,   112,     1,   114,     3,     4,
       5,    -1,   119,   120,   121,   122,   123,   124,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   135,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    28,    -1,    -1,    -1,
      85,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,   114,
      28,    -1,    -1,    -1,    -1,   120,    -1,    -1,   123,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
     102,   103,    -1,    71,    72,    73,    -1,   109,    -1,    -1,
     112,   113,   114,    -1,    28,    -1,    -1,   119,   120,   121,
     122,   123,   124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   134,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,   123,   124,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,     3,    -1,   112,    -1,
     114,    -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,
     124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     134,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    66,
       8,     9,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,     3,    -1,    -1,   116,
      -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,   135,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    66,
      -1,   119,   120,   121,   122,   123,   124,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,     3,    -1,    -1,    -1,
      -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   132,    -1,   134,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,     1,    -1,     3,
       4,     5,     6,   120,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   134,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,
     124,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,   114,    -1,    -1,    -1,    -1,   119,
     120,   121,   122,   123,   124,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    85,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,   113,   114,    28,
      -1,    -1,    -1,   119,   120,   121,   122,   123,   124,    71,
      72,    73,    74,    -1,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
     102,   103,    71,    72,    73,    -1,    -1,   109,   110,   111,
     112,   113,   114,    28,    -1,    -1,    -1,   119,   120,   121,
     122,   123,   124,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,    -1,   114,    -1,    -1,   117,    -1,
     119,   120,   121,   122,   123,   124,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,   117,    -1,   119,   120,   121,   122,   123,   124,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      28,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    28,   109,    -1,    -1,
     112,    -1,   114,    -1,    -1,   117,    -1,   119,   120,   121,
     122,   123,   124,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      28,   109,    -1,    -1,   112,   113,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,   123,   124,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,   114,    -1,    -1,    -1,    -1,   119,   120,   121,
     122,   123,   124,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,    -1,   114,    -1,    -1,    -1,
      -1,   119,   120,   121,   122,   123,   124,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    28,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    28,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,   124,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,    -1,   114,    -1,    -1,    -1,    -1,   119,   120,
     121,   122,   123,   124,    -1,     3,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,    -1,   114,
      -1,    -1,    -1,    -1,   119,   120,   121,   122,   123,   124,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,   116,    -1,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
      -1,   116,    -1,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   113,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,   116,    -1,    -1,    -1,   120,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,    -1,   116,    -1,    -1,    -1,
     120,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,    -1,    -1,    -1,   116,
      -1,    -1,    -1,   120,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,    -1,    -1,    -1,   120,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,    -1,    -1,    -1,   116,    -1,    -1,    -1,   120,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    28,    -1,
      -1,    79,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,    -1,    66,    -1,   116,    -1,
      -1,    -1,   120,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,    -1,    -1,    -1,   116,    -1,    -1,    -1,
     120,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   112,   114,   119,   120,   121,
     122,   123,   124,   138,   139,   140,   142,   145,   146,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   160,   161,   180,   181,   229,   231,   245,   112,   140,
     143,   145,   147,   112,   146,   146,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    66,    75,
      85,   100,   167,   172,   179,   180,   182,   184,   185,   186,
     194,   195,   146,   160,   164,   167,   164,   112,   147,   113,
     161,   163,   166,   179,   180,   182,   184,   195,   214,   229,
     135,     7,     8,     9,   112,   115,   116,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   133,   162,   149,
     120,   125,   126,   121,   122,    10,    11,    12,    13,   127,
     128,    14,    15,   119,   129,   130,    16,    17,   131,   135,
       0,   146,   214,     7,     8,     9,   112,   115,   116,   135,
     138,   181,   112,    74,    79,   110,   111,   112,   116,   120,
     172,   173,   174,   178,   179,   182,   184,   195,   199,   201,
     209,   135,   138,   181,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    46,    47,    66,   100,   169,   172,
     179,   181,   183,   184,   185,   194,   195,   116,   201,   169,
     146,   214,   113,   118,   112,   116,   173,   179,   182,   184,
     195,   198,   200,   209,   113,   115,   134,   135,   136,   141,
     142,   160,   167,   216,   232,   238,   239,   240,   241,   242,
     243,   244,   138,   113,   141,   144,   161,   138,   163,   141,
     161,   149,   149,   149,   150,   150,   151,   151,   152,   152,
     152,   152,   153,   153,   154,   155,   156,   157,   158,   163,
     136,   244,   113,   113,   138,   113,   144,   138,   163,   138,
     196,   197,   135,   135,   180,   113,   167,   201,   210,   211,
     212,   164,   179,   208,   209,   199,   209,   112,   112,   116,
     199,    68,    78,   112,   123,   134,   136,   138,   142,   167,
     173,   187,   188,   189,   190,   191,   203,   204,   206,   207,
     209,   230,   231,   233,   234,   235,   236,   237,   135,   135,
     112,   116,   172,   179,   183,   184,   195,   201,   164,   116,
     116,   201,   113,   113,   161,   113,   200,   210,   117,   164,
     180,   198,   209,   112,   116,   198,   149,   229,   136,   244,
     133,   112,   138,   204,   135,   223,   224,   118,   134,   134,
     239,   241,   242,   136,   113,   118,   117,   132,   136,   113,
     117,   133,   118,   136,   196,   196,   113,   112,   173,   200,
     202,   203,   205,   207,   209,   113,   113,   118,   117,   179,
     209,   199,   112,   113,   210,   164,    50,   168,   172,   179,
     180,   182,   186,   167,   204,   112,   120,   173,   202,   209,
     167,   133,   112,   132,   134,   138,   173,   192,   193,   202,
     204,   207,   209,   207,   209,   136,   191,   118,   134,   112,
     116,   113,   138,   210,   213,   173,   207,   134,   134,   224,
     224,   224,   134,   224,   136,   187,   187,   180,   164,   116,
     117,   164,   164,   116,   113,   113,   117,   117,   198,   113,
     210,   117,   164,   180,   136,   216,   136,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    77,   134,
     138,   163,   165,   167,   218,   219,   220,   221,   222,   224,
     225,   226,   227,   228,   230,   240,   141,   161,   160,   164,
     197,   134,   136,   134,   136,   203,   207,   209,   173,   205,
      51,   212,     3,    28,    44,    74,    75,   113,   175,   176,
     177,   113,   117,   138,   181,   135,   138,   172,   179,   180,
     182,   200,   138,   181,   204,   209,   113,   112,   216,   113,
     164,   135,   207,   209,   118,   134,   132,   178,   173,   207,
     207,   188,   117,   164,   180,   113,   113,   118,   207,   136,
     136,   113,   117,   164,   117,   117,   164,   113,   117,   117,
     164,   132,   112,   112,   112,   218,   112,   138,   134,   134,
     134,   163,   138,   132,   134,   134,   170,   171,   202,   165,
     221,   165,   218,   136,   134,   187,   187,   205,   113,   112,
     113,   176,    69,    70,   136,   135,   135,   138,   113,   136,
     244,   207,   193,   164,   207,   117,   117,   138,   117,   117,
     132,   218,   163,   163,   113,   163,    56,   113,   225,   134,
     134,   133,   218,   118,   134,   133,   136,   136,   163,   113,
     224,   224,    69,    70,   136,    69,    70,   136,   135,   136,
     132,   218,   113,   113,   218,   113,   112,   218,   113,   225,
     164,   171,   135,   161,   215,   113,    70,   136,    69,   136,
     224,   224,   224,   224,    69,    70,   136,   164,   218,   218,
     218,   163,   218,   113,   163,   134,   215,   217,   224,   224,
      70,   136,    69,   136,    70,   136,    69,   136,   224,   224,
      64,   113,   218,   113,   118,   136,   136,   136,   224,   224,
     224,   224,    70,   136,    69,   136,   218,   134,   218,   136,
     215,   136,   136,   136,   136,   224,   224,   136,   136
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
      case 138: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 152 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3178 "expression.ec"
	break;
      case 139: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3187 "expression.ec"
	break;
      case 142: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3196 "expression.ec"
	break;
      case 144: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 187 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3205 "expression.ec"
	break;
      case 146: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3214 "expression.ec"
	break;
      case 149: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3223 "expression.ec"
	break;
      case 150: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3232 "expression.ec"
	break;
      case 151: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3241 "expression.ec"
	break;
      case 152: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3250 "expression.ec"
	break;
      case 153: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3259 "expression.ec"
	break;
      case 154: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3268 "expression.ec"
	break;
      case 155: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3277 "expression.ec"
	break;
      case 156: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3286 "expression.ec"
	break;
      case 157: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3295 "expression.ec"
	break;
      case 158: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3304 "expression.ec"
	break;
      case 159: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3313 "expression.ec"
	break;
      case 160: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3322 "expression.ec"
	break;
      case 161: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3331 "expression.ec"
	break;
      case 163: /* "expression" */

/* Line 1009 of yacc.c  */
#line 187 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3340 "expression.ec"
	break;
      case 164: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3349 "expression.ec"
	break;
      case 165: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3358 "expression.ec"
	break;
      case 166: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3367 "expression.ec"
	break;
      case 167: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3376 "expression.ec"
	break;
      case 170: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3385 "expression.ec"
	break;
      case 171: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3394 "expression.ec"
	break;
      case 172: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3403 "expression.ec"
	break;
      case 173: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3412 "expression.ec"
	break;
      case 175: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3421 "expression.ec"
	break;
      case 176: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3430 "expression.ec"
	break;
      case 177: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3439 "expression.ec"
	break;
      case 178: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3448 "expression.ec"
	break;
      case 179: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3457 "expression.ec"
	break;
      case 180: /* "type" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3466 "expression.ec"
	break;
      case 181: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3475 "expression.ec"
	break;
      case 182: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3484 "expression.ec"
	break;
      case 183: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3493 "expression.ec"
	break;
      case 184: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3502 "expression.ec"
	break;
      case 185: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3511 "expression.ec"
	break;
      case 187: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3520 "expression.ec"
	break;
      case 188: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 177 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3529 "expression.ec"
	break;
      case 189: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3538 "expression.ec"
	break;
      case 190: /* "property" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3547 "expression.ec"
	break;
      case 191: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3556 "expression.ec"
	break;
      case 192: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3565 "expression.ec"
	break;
      case 193: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3574 "expression.ec"
	break;
      case 194: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3583 "expression.ec"
	break;
      case 195: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3592 "expression.ec"
	break;
      case 196: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3601 "expression.ec"
	break;
      case 197: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 162 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3610 "expression.ec"
	break;
      case 198: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3619 "expression.ec"
	break;
      case 199: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3628 "expression.ec"
	break;
      case 200: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3637 "expression.ec"
	break;
      case 201: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3646 "expression.ec"
	break;
      case 202: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3655 "expression.ec"
	break;
      case 203: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3664 "expression.ec"
	break;
      case 204: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3673 "expression.ec"
	break;
      case 205: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3682 "expression.ec"
	break;
      case 206: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3691 "expression.ec"
	break;
      case 207: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3700 "expression.ec"
	break;
      case 208: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3709 "expression.ec"
	break;
      case 209: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 153 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3718 "expression.ec"
	break;
      case 210: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3727 "expression.ec"
	break;
      case 211: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3736 "expression.ec"
	break;
      case 212: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3745 "expression.ec"
	break;
      case 213: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3754 "expression.ec"
	break;
      case 214: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3763 "expression.ec"
	break;
      case 215: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 167 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3772 "expression.ec"
	break;
      case 216: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 167 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3781 "expression.ec"
	break;
      case 217: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 3790 "expression.ec"
	break;
      case 218: /* "statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3799 "expression.ec"
	break;
      case 219: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3808 "expression.ec"
	break;
      case 220: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 3817 "expression.ec"
	break;
      case 221: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 3826 "expression.ec"
	break;
      case 222: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3835 "expression.ec"
	break;
      case 223: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 3844 "expression.ec"
	break;
      case 224: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3853 "expression.ec"
	break;
      case 225: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3862 "expression.ec"
	break;
      case 226: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3871 "expression.ec"
	break;
      case 227: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3880 "expression.ec"
	break;
      case 228: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3889 "expression.ec"
	break;
      case 229: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3898 "expression.ec"
	break;
      case 230: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 3907 "expression.ec"
	break;
      case 231: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 3916 "expression.ec"
	break;
      case 233: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3925 "expression.ec"
	break;
      case 234: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3934 "expression.ec"
	break;
      case 235: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3943 "expression.ec"
	break;
      case 236: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3952 "expression.ec"
	break;
      case 237: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3961 "expression.ec"
	break;
      case 238: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3970 "expression.ec"
	break;
      case 239: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3979 "expression.ec"
	break;
      case 240: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 177 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3988 "expression.ec"
	break;
      case 241: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3997 "expression.ec"
	break;
      case 242: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4006 "expression.ec"
	break;
      case 243: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4015 "expression.ec"
	break;
      case 244: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4024 "expression.ec"
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
#line 211 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 217 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 222 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 224 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 226 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 228 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 229 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 230 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 232 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 234 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 238 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 239 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 246 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 251 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 252 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 253 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 254 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 255 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 256 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 257 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 263 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 264 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 265 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 266 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 267 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 268 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 269 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 273 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 274 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 275 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 276 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 280 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 281 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 282 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 283 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 284 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 285 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 286 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 287 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 288 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 302 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 303 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 304 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 305 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 306 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 307 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 308 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 313 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 318 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 320 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 325 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 326 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 331 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 332 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 337 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 338 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 339 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 345 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 346 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 351 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 356 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 361 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 366 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 371 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 376 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 381 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 383 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 388 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 389 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 390 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 391 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 392 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 393 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 394 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 395 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 396 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 397 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 398 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 402 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 403 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 411 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 412 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 413 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 414 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 418 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 419 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 420 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 421 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 422 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 423 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 424 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 429 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 431 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 432 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 433 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 434 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 435 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 436 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 437 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 438 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 443 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 444 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 445 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 446 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 447 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 448 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 449 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 450 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 454 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 455 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 459 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 460 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 461 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 462 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 463 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 467 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 468 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 472 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 473 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 477 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 478 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 479 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 480 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 485 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 486 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 490 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 491 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 492 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 497 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 498 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 499 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 500 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 501 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 505 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 506 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 510 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 511 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 515 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 516 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 520 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 521 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 522 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 526 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 551 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 555 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 556 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 557 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 558 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 559 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 560 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 561 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 562 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 563 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 564 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 565 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 566 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 567 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 571 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 572 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 576 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 577 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 578 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 579 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 580 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 581 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 582 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 583 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 584 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 585 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 586 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 587 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 591 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 592 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 599 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 600 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 627 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 632 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 634 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 636 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 638 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 640 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 643 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 649 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 651 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 654 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 656 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 658 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 660 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 662 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 665 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 669 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 671 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 673 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 677 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 678 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 679 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 680 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 681 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 682 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 683 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 684 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 696 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 698 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 704 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 708 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 709 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 714 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 715 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 716 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 717 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 718 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 723 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 725 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 730 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 738 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 740 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 742 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 744 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 746 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 748 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 750 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 752 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 754 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 756 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 758 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 763 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 765 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 767 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 769 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 771 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 775 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 777 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 778 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 779 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 780 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 784 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 786 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 787 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 788 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 845 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 847 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 849 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 851 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 853 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 859 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 862 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 864 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 866 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 874 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 876 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 885 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 887 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 889 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 893 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 894 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 898 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 899 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 900 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 901 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 906 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 910 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 911 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 915 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 916 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 917 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 921 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 922 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 926 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 927 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 937 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 939 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 941 "expression.y"
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

  case 345:

/* Line 1464 of yacc.c  */
#line 956 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 958 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 979 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 981 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 995 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 997 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 999 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1003 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1004 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1008 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1009 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1012 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1016 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1017 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1018 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1022 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1027 "expression.y"
    { 
      (yyval.stmt) = MkCompoundStmt(null, null); 
      (yyval.stmt).compound.context = PushContext(); 
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc); 
   ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1035 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1039 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1040 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1044 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1045 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1046 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1050 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1051 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1052 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1055 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1056 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1057 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1061 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1064 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1065 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1069 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1074 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1076 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1081 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1083 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1085 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1087 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1092 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1111 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1123 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1125 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1127 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1129 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1131 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1137 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1142 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1146 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1147 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1152 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1154 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1159 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1163 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1164 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1165 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1166 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1167 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1168 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1173 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1174 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1178 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7025 "expression.ec"
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
#line 1180 "expression.y"


