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
     __ATTRIB = 366,
     BOOL = 367,
     _BOOL = 368,
     _COMPLEX = 369,
     _IMAGINARY = 370,
     RESTRICT = 371
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
#line 295 "expression.ec"
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
#line 320 "expression.ec"

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
#define YYFINAL  153
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7593

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  142
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  109
/* YYNRULES -- Number of rules.  */
#define YYNRULES  436
/* YYNRULES -- Number of states.  */
#define YYNSTATES  764

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   129,     2,     2,   119,   131,   124,     2,
     117,   118,   125,   126,   123,   127,   120,   130,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   137,   139,
     132,   138,   133,   136,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,   134,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   140,   135,   141,   128,     2,     2,     2,
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
     115,   116
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    11,    13,    15,    17,    19,
      22,    27,    30,    37,    43,    50,    56,    64,    71,    79,
      86,    88,    90,    92,    97,   101,   106,   110,   113,   117,
     120,   123,   125,   130,   134,   139,   143,   146,   150,   153,
     156,   158,   160,   164,   168,   171,   174,   177,   182,   185,
     190,   195,   198,   203,   205,   207,   209,   211,   213,   215,
     217,   219,   221,   223,   225,   227,   232,   234,   238,   242,
     246,   248,   252,   256,   258,   262,   266,   268,   272,   276,
     280,   284,   286,   290,   294,   296,   300,   302,   306,   308,
     312,   314,   318,   320,   324,   326,   332,   334,   338,   342,
     344,   346,   348,   350,   352,   354,   356,   358,   360,   362,
     364,   366,   370,   372,   375,   379,   382,   388,   390,   393,
     395,   398,   400,   403,   405,   408,   410,   413,   415,   418,
     420,   423,   425,   428,   430,   433,   435,   438,   440,   443,
     445,   448,   450,   453,   455,   458,   460,   463,   465,   468,
     470,   473,   475,   478,   480,   484,   486,   490,   492,   494,
     496,   498,   500,   502,   504,   506,   508,   510,   512,   514,
     516,   518,   520,   522,   527,   529,   532,   536,   543,   549,
     551,   553,   555,   557,   559,   561,   563,   565,   567,   569,
     571,   573,   575,   577,   579,   581,   583,   585,   587,   589,
     591,   593,   595,   600,   602,   604,   606,   608,   610,   612,
     614,   616,   618,   620,   622,   624,   626,   628,   630,   632,
     634,   636,   641,   643,   649,   654,   659,   663,   669,   676,
     682,   688,   693,   700,   703,   706,   710,   714,   716,   718,
     720,   723,   727,   729,   733,   743,   753,   761,   769,   775,
     786,   797,   806,   815,   822,   831,   840,   847,   854,   859,
     869,   879,   887,   895,   901,   905,   908,   911,   914,   916,
     919,   921,   923,   925,   929,   931,   934,   937,   941,   947,
     950,   953,   958,   964,   972,   980,   986,   988,   992,   994,
     998,  1002,  1005,  1009,  1013,  1017,  1022,  1027,  1030,  1034,
    1038,  1043,  1047,  1050,  1054,  1058,  1063,  1065,  1067,  1070,
    1073,  1076,  1080,  1082,  1084,  1087,  1090,  1093,  1097,  1099,
    1102,  1106,  1108,  1112,  1117,  1121,  1126,  1128,  1131,  1134,
    1138,  1142,  1144,  1146,  1149,  1152,  1155,  1159,  1163,  1166,
    1168,  1171,  1173,  1176,  1179,  1183,  1185,  1189,  1191,  1195,
    1198,  1201,  1203,  1205,  1209,  1211,  1214,  1216,  1220,  1225,
    1227,  1229,  1231,  1235,  1237,  1239,  1241,  1243,  1245,  1247,
    1251,  1256,  1260,  1262,  1265,  1267,  1270,  1273,  1275,  1277,
    1280,  1282,  1285,  1289,  1291,  1294,  1300,  1308,  1314,  1320,
    1328,  1335,  1343,  1348,  1354,  1359,  1363,  1366,  1369,  1372,
    1376,  1378,  1384,  1389,  1394,  1398,  1403,  1407,  1411,  1414,
    1417,  1419,  1423,  1428,  1432,  1435,  1438,  1441,  1444,  1447,
    1450,  1453,  1456,  1460,  1462,  1464,  1468,  1471,  1473,  1475,
    1478,  1481,  1483,  1486,  1488,  1490,  1493
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     250,     0,    -1,     3,    -1,   145,    -1,   117,   168,   118,
      -1,   143,    -1,   236,    -1,     4,    -1,   234,    -1,   119,
     234,    -1,   119,   234,   120,   234,    -1,   117,   118,    -1,
      71,   172,   206,   121,   169,   122,    -1,    71,   172,   121,
     169,   122,    -1,   102,   172,   206,   121,   169,   122,    -1,
     102,   172,   121,   169,   122,    -1,    72,   169,   174,   206,
     121,   169,   122,    -1,    72,   169,   174,   121,   169,   122,
      -1,   103,   169,   174,   206,   121,   169,   122,    -1,   103,
     169,   174,   121,   169,   122,    -1,     1,    -1,   237,    -1,
     144,    -1,   147,   121,   168,   122,    -1,   147,   117,   118,
      -1,   147,   117,   149,   118,    -1,   147,   120,   143,    -1,
     147,   143,    -1,   147,     7,   143,    -1,   147,     8,    -1,
     147,     9,    -1,   145,    -1,   148,   121,   168,   122,    -1,
     148,   117,   118,    -1,   148,   117,   149,   118,    -1,   148,
     120,   143,    -1,   148,   143,    -1,   148,     7,   143,    -1,
     148,     8,    -1,   148,     9,    -1,   166,    -1,   146,    -1,
     149,   123,   166,    -1,   149,   123,   146,    -1,     8,   151,
      -1,     9,   151,    -1,   153,   154,    -1,     6,   117,   151,
     118,    -1,     6,   152,    -1,     6,   117,   219,   118,    -1,
     109,   117,   151,   118,    -1,   109,   152,    -1,   109,   117,
     219,   118,    -1,   150,    -1,   147,    -1,   150,    -1,   148,
      -1,   124,    -1,   125,    -1,   126,    -1,   127,    -1,   128,
      -1,   129,    -1,    73,    -1,   151,    -1,   117,   219,   118,
     154,    -1,   154,    -1,   155,   125,   154,    -1,   155,   130,
     154,    -1,   155,   131,   154,    -1,   155,    -1,   156,   126,
     155,    -1,   156,   127,   155,    -1,   156,    -1,   157,    10,
     156,    -1,   157,    11,   156,    -1,   157,    -1,   158,   132,
     157,    -1,   158,   133,   157,    -1,   158,    12,   157,    -1,
     158,    13,   157,    -1,   158,    -1,   159,    14,   158,    -1,
     159,    15,   158,    -1,   159,    -1,   160,   124,   159,    -1,
     160,    -1,   161,   134,   160,    -1,   161,    -1,   162,   135,
     161,    -1,   162,    -1,   163,    16,   162,    -1,   163,    -1,
     164,    17,   163,    -1,   164,    -1,   164,   136,   168,   137,
     165,    -1,   165,    -1,   151,   167,   166,    -1,   151,   167,
     146,    -1,   138,    -1,    18,    -1,    19,    -1,    20,    -1,
      21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,    -1,
      26,    -1,    27,    -1,   166,    -1,   168,   123,   166,    -1,
     165,    -1,   172,   139,    -1,   172,   175,   139,    -1,   235,
     139,    -1,    77,   143,   138,   169,   139,    -1,   184,    -1,
     171,   184,    -1,   187,    -1,   171,   187,    -1,   200,    -1,
     171,   200,    -1,   189,    -1,   171,   189,    -1,   177,    -1,
     172,   177,    -1,   184,    -1,   172,   184,    -1,   187,    -1,
     172,   187,    -1,   200,    -1,   172,   200,    -1,   189,    -1,
     172,   189,    -1,   177,    -1,   173,   177,    -1,   184,    -1,
     173,   184,    -1,   187,    -1,   173,   187,    -1,   185,    -1,
     173,   185,    -1,   177,    -1,   174,   177,    -1,   184,    -1,
     174,   184,    -1,   188,    -1,   174,   188,    -1,   189,    -1,
     174,   189,    -1,   200,    -1,   174,   200,    -1,   176,    -1,
     175,   123,   176,    -1,   207,    -1,   207,   138,   220,    -1,
      29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,    -1,
      74,    -1,   183,    -1,    79,    -1,   110,    -1,   111,    -1,
       3,    -1,    28,    -1,    75,    -1,    74,    -1,    44,    -1,
     180,    -1,   180,   117,   168,   118,    -1,   181,    -1,   182,
     181,    -1,   182,   123,   181,    -1,   179,   117,   117,   182,
     118,   118,    -1,   179,   117,   117,   118,   118,    -1,    44,
      -1,    45,    -1,    75,    -1,   186,    -1,    28,    -1,    46,
      -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,    40,
      -1,    41,    -1,    85,    -1,   113,    -1,   112,    -1,   190,
      -1,   199,    -1,   185,    -1,   100,   117,   185,   118,    -1,
      66,    -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,
      43,    -1,    40,    -1,    41,    -1,   113,    -1,   112,    -1,
     190,    -1,   199,    -1,   186,    -1,   100,   117,   185,   118,
      -1,    66,    -1,   191,   143,   140,   192,   141,    -1,   191,
     140,   192,   141,    -1,   191,   143,   140,   141,    -1,   191,
     140,   141,    -1,   191,   186,   140,   192,   141,    -1,   191,
     178,   143,   140,   192,   141,    -1,   191,   178,   140,   192,
     141,    -1,   191,   178,   143,   140,   141,    -1,   191,   178,
     140,   141,    -1,   191,   178,   186,   140,   192,   141,    -1,
     191,   143,    -1,   191,   186,    -1,   191,   178,   143,    -1,
     191,   178,   186,    -1,    48,    -1,    49,    -1,   196,    -1,
     192,   196,    -1,   147,   138,   221,    -1,   193,    -1,   194,
     123,   193,    -1,    68,   173,   143,   140,    69,   229,    70,
     229,   141,    -1,    68,   173,   143,   140,    70,   229,    69,
     229,   141,    -1,    68,   173,   143,   140,    69,   229,   141,
      -1,    68,   173,   143,   140,    70,   229,   141,    -1,    68,
     173,   143,   140,   141,    -1,    68,   173,   205,   143,   140,
      69,   229,    70,   229,   141,    -1,    68,   173,   205,   143,
     140,    70,   229,    69,   229,   141,    -1,    68,   173,   205,
     143,   140,    69,   229,   141,    -1,    68,   173,   205,   143,
     140,    70,   229,   141,    -1,    68,   173,   205,   143,   140,
     141,    -1,    68,   173,   140,    69,   229,    70,   229,   141,
      -1,    68,   173,   140,    70,   229,    69,   229,   141,    -1,
      68,   173,   140,    69,   229,   141,    -1,    68,   173,   140,
      70,   229,   141,    -1,    68,   173,   140,   141,    -1,    68,
     173,   205,   140,    69,   229,    70,   229,   141,    -1,    68,
     173,   205,   140,    70,   229,    69,   229,   141,    -1,    68,
     173,   205,   140,    69,   229,   141,    -1,    68,   173,   205,
     140,    70,   229,   141,    -1,    68,   173,   205,   140,   141,
      -1,   172,   197,   139,    -1,   172,   139,    -1,   236,   139,
      -1,   235,   139,    -1,   242,    -1,   194,   139,    -1,   195,
      -1,   139,    -1,   198,    -1,   197,   123,   198,    -1,   207,
      -1,   207,   183,    -1,   137,   169,    -1,   207,   137,   169,
      -1,   207,   137,   169,   137,   169,    -1,    50,   143,    -1,
      50,   186,    -1,    50,   140,   201,   141,    -1,    50,   143,
     140,   201,   141,    -1,    50,   143,   140,   201,   139,   192,
     141,    -1,    50,   186,   140,   201,   139,   192,   141,    -1,
      50,   186,   140,   201,   141,    -1,   202,    -1,   201,   123,
     202,    -1,   143,    -1,   143,   138,   169,    -1,   117,   205,
     118,    -1,   121,   122,    -1,   121,   169,   122,    -1,   121,
     185,   122,    -1,   203,   121,   122,    -1,   203,   121,   169,
     122,    -1,   203,   121,   185,   122,    -1,   117,   118,    -1,
     117,   215,   118,    -1,   203,   117,   118,    -1,   203,   117,
     215,   118,    -1,   117,   206,   118,    -1,   117,   118,    -1,
     117,   215,   118,    -1,   204,   117,   118,    -1,   204,   117,
     215,   118,    -1,   214,    -1,   203,    -1,   214,   203,    -1,
     178,   214,    -1,   178,   203,    -1,   178,   214,   203,    -1,
     214,    -1,   204,    -1,   214,   204,    -1,   178,   214,    -1,
     178,   204,    -1,   178,   214,   204,    -1,   210,    -1,   214,
     210,    -1,   178,   214,   210,    -1,   143,    -1,   117,   207,
     118,    -1,   208,   121,   169,   122,    -1,   208,   121,   122,
      -1,   208,   121,   185,   122,    -1,   212,    -1,   214,   212,
      -1,   178,   212,    -1,   178,   214,   212,    -1,   214,   178,
     212,    -1,   212,    -1,   208,    -1,   178,   212,    -1,   178,
     208,    -1,   208,   117,    -1,   211,   215,   118,    -1,   211,
     218,   118,    -1,   211,   118,    -1,   184,    -1,   213,   184,
      -1,   125,    -1,   125,   213,    -1,   125,   214,    -1,   125,
     213,   214,    -1,   216,    -1,   216,   123,    51,    -1,   217,
      -1,   216,   123,   217,    -1,   172,   207,    -1,   172,   205,
      -1,   172,    -1,   143,    -1,   218,   123,   143,    -1,   171,
      -1,   171,   205,    -1,   166,    -1,   140,   222,   141,    -1,
     140,   222,   123,   141,    -1,   165,    -1,   146,    -1,   220,
      -1,   222,   123,   220,    -1,   224,    -1,   229,    -1,   230,
      -1,   231,    -1,   232,    -1,   233,    -1,   143,   137,   223,
      -1,    52,   169,   137,   223,    -1,    53,   137,   223,    -1,
     170,    -1,   225,   170,    -1,   223,    -1,   226,   223,    -1,
     226,   170,    -1,   226,    -1,   225,    -1,   225,   226,    -1,
     140,    -1,   140,   141,    -1,   228,   227,   141,    -1,   139,
      -1,   168,   139,    -1,    54,   117,   168,   118,   223,    -1,
      54,   117,   168,   118,   223,    64,   223,    -1,    55,   117,
     168,   118,   223,    -1,    56,   117,   168,   118,   223,    -1,
      57,   223,    56,   117,   168,   118,   139,    -1,    58,   117,
     230,   230,   118,   223,    -1,    58,   117,   230,   230,   168,
     118,   223,    -1,    56,   117,   118,   223,    -1,    58,   117,
     230,   118,   223,    -1,    58,   117,   118,   223,    -1,    59,
     143,   139,    -1,    60,   139,    -1,    61,   139,    -1,    62,
     139,    -1,    62,   168,   139,    -1,     5,    -1,   172,   143,
     140,   249,   141,    -1,   172,   143,   140,   141,    -1,   185,
     140,   249,   141,    -1,   185,   140,   141,    -1,   143,   140,
     249,   141,    -1,   143,   140,   141,    -1,   140,   249,   141,
      -1,   140,   141,    -1,   172,   209,    -1,   209,    -1,   172,
     117,   118,    -1,   128,   172,   117,   118,    -1,    78,   172,
     209,    -1,    78,   209,    -1,   238,   229,    -1,   241,   229,
      -1,   241,   139,    -1,   239,   229,    -1,   240,   229,    -1,
     172,   209,    -1,   243,   229,    -1,   147,   138,   221,    -1,
     221,    -1,   245,    -1,   246,   123,   245,    -1,   246,   139,
      -1,   247,    -1,   244,    -1,   248,   247,    -1,   248,   244,
      -1,   139,    -1,   248,   139,    -1,   248,    -1,   246,    -1,
     248,   246,    -1,   166,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   211,   211,   216,   217,   222,   224,   226,   228,   230,
     231,   232,   235,   236,   237,   238,   239,   240,   241,   242,
     243,   247,   251,   252,   253,   254,   255,   256,   269,   270,
     271,   276,   277,   278,   279,   280,   281,   294,   295,   296,
     300,   301,   302,   303,   307,   308,   309,   310,   311,   312,
     313,   314,   315,   319,   320,   324,   325,   329,   330,   331,
     332,   333,   334,   335,   339,   340,   344,   345,   346,   347,
     351,   352,   353,   357,   358,   359,   363,   364,   365,   366,
     367,   371,   372,   373,   377,   378,   382,   383,   387,   388,
     392,   393,   397,   398,   402,   403,   407,   408,   410,   415,
     416,   417,   418,   419,   420,   421,   422,   423,   424,   425,
     429,   430,   434,   438,   439,   440,   441,   445,   446,   447,
     448,   449,   450,   451,   452,   456,   457,   458,   459,   460,
     461,   462,   463,   464,   465,   470,   471,   472,   473,   474,
     475,   476,   477,   481,   482,   483,   484,   485,   486,   487,
     488,   489,   490,   494,   495,   499,   500,   504,   505,   506,
     507,   508,   512,   513,   517,   518,   519,   524,   525,   526,
     527,   528,   532,   533,   537,   538,   539,   543,   544,   548,
     549,   550,   554,   579,   583,   584,   585,   586,   587,   588,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   606,   607,   608,   609,   610,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   620,   621,
     622,   623,   624,   629,   630,   631,   632,   633,   636,   637,
     638,   639,   640,   645,   646,   649,   651,   656,   657,   661,
     662,   666,   670,   671,   675,   677,   679,   681,   683,   686,
     688,   690,   692,   694,   697,   699,   701,   703,   705,   708,
     710,   712,   714,   716,   721,   722,   723,   724,   725,   726,
     727,   728,   732,   734,   739,   741,   743,   745,   747,   752,
     753,   757,   759,   760,   761,   762,   766,   768,   773,   775,
     781,   783,   785,   787,   789,   791,   793,   795,   797,   799,
     801,   806,   808,   810,   812,   814,   819,   820,   821,   822,
     823,   824,   828,   829,   830,   831,   832,   833,   879,   880,
     882,   888,   890,   892,   894,   896,   901,   902,   905,   907,
     909,   915,   916,   917,   919,   924,   928,   930,   932,   937,
     938,   942,   943,   944,   945,   949,   950,   954,   955,   959,
     960,   961,   965,   966,   970,   971,   980,   982,   984,  1000,
    1001,  1022,  1024,  1029,  1030,  1031,  1032,  1033,  1034,  1038,
    1040,  1042,  1047,  1048,  1052,  1053,  1056,  1060,  1061,  1062,
    1066,  1070,  1078,  1083,  1084,  1088,  1089,  1090,  1094,  1095,
    1096,  1097,  1099,  1100,  1101,  1105,  1106,  1107,  1108,  1109,
    1113,  1117,  1119,  1124,  1126,  1128,  1130,  1135,  1137,  1142,
    1144,  1149,  1154,  1159,  1161,  1166,  1168,  1170,  1172,  1174,
    1180,  1185,  1190,  1191,  1195,  1197,  1202,  1207,  1208,  1209,
    1210,  1211,  1212,  1216,  1217,  1218,  1222
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
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "'('", "')'", "'$'",
  "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'",
  "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'",
  "'{'", "'}'", "$accept", "identifier", "primary_expression",
  "simple_primary_expression", "anon_instantiation_expression",
  "postfix_expression", "simple_postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
  "cast_expression", "multiplicative_expression", "additive_expression",
  "shift_expression", "relational_expression", "equality_expression",
  "and_expression", "exclusive_or_expression", "inclusive_or_expression",
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
     365,   366,   367,   368,   369,   370,   371,    40,    41,    36,
      46,    91,    93,    44,    38,    42,    43,    45,   126,    33,
      47,    37,    60,    62,    94,   124,    63,    58,    61,    59,
     123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   142,   143,   144,   144,   145,   145,   145,   145,   145,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   146,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     149,   149,   149,   149,   150,   150,   150,   150,   150,   150,
     150,   150,   150,   151,   151,   152,   152,   153,   153,   153,
     153,   153,   153,   153,   154,   154,   155,   155,   155,   155,
     156,   156,   156,   157,   157,   157,   158,   158,   158,   158,
     158,   159,   159,   159,   160,   160,   161,   161,   162,   162,
     163,   163,   164,   164,   165,   165,   166,   166,   166,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     168,   168,   169,   170,   170,   170,   170,   171,   171,   171,
     171,   171,   171,   171,   171,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   172,   173,   173,   173,   173,   173,
     173,   173,   173,   174,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   175,   175,   176,   176,   177,   177,   177,
     177,   177,   178,   178,   179,   179,   179,   180,   180,   180,
     180,   180,   181,   181,   182,   182,   182,   183,   183,   184,
     184,   184,   185,   186,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   190,   190,   190,   190,   191,   191,   192,
     192,   193,   194,   194,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   196,   196,   196,   196,   196,   196,
     196,   196,   197,   197,   198,   198,   198,   198,   198,   199,
     199,   200,   200,   200,   200,   200,   201,   201,   202,   202,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   204,   204,   204,   204,   204,   205,   205,   205,   205,
     205,   205,   206,   206,   206,   206,   206,   206,   207,   207,
     207,   208,   208,   208,   208,   208,   209,   209,   209,   209,
     209,   210,   210,   210,   210,   211,   212,   212,   212,   213,
     213,   214,   214,   214,   214,   215,   215,   216,   216,   217,
     217,   217,   218,   218,   219,   219,   220,   220,   220,   221,
     221,   222,   222,   223,   223,   223,   223,   223,   223,   224,
     224,   224,   225,   225,   226,   226,   226,   227,   227,   227,
     228,   229,   229,   230,   230,   231,   231,   231,   232,   232,
     232,   232,   232,   232,   232,   233,   233,   233,   233,   233,
     234,   235,   235,   236,   236,   236,   236,   237,   237,   238,
     238,   239,   240,   241,   241,   242,   242,   242,   242,   242,
     243,   244,   245,   245,   246,   246,   247,   248,   248,   248,
     248,   248,   248,   249,   249,   249,   250
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       4,     2,     6,     5,     6,     5,     7,     6,     7,     6,
       1,     1,     1,     4,     3,     4,     3,     2,     3,     2,
       2,     1,     4,     3,     4,     3,     2,     3,     2,     2,
       1,     1,     3,     3,     2,     2,     2,     4,     2,     4,
       4,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     1,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     3,     1,     5,     1,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     3,     2,     5,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     3,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     2,     3,     6,     5,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     5,     4,     4,     3,     5,     6,     5,
       5,     4,     6,     2,     2,     3,     3,     1,     1,     1,
       2,     3,     1,     3,     9,     9,     7,     7,     5,    10,
      10,     8,     8,     6,     8,     8,     6,     6,     4,     9,
       9,     7,     7,     5,     3,     2,     2,     2,     1,     2,
       1,     1,     1,     3,     1,     2,     2,     3,     5,     2,
       2,     4,     5,     7,     7,     5,     1,     3,     1,     3,
       3,     2,     3,     3,     3,     4,     4,     2,     3,     3,
       4,     3,     2,     3,     3,     4,     1,     1,     2,     2,
       2,     3,     1,     1,     2,     2,     2,     3,     1,     2,
       3,     1,     3,     4,     3,     4,     1,     2,     2,     3,
       3,     1,     1,     2,     2,     2,     3,     3,     2,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     1,     1,     3,     1,     2,     1,     3,     4,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     3,
       4,     3,     1,     2,     1,     2,     2,     1,     1,     2,
       1,     2,     3,     1,     2,     5,     7,     5,     5,     7,
       6,     7,     4,     5,     4,     3,     2,     2,     2,     3,
       1,     5,     4,     4,     3,     4,     3,     3,     2,     2,
       1,     3,     4,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     3,     1,     1,     3,     2,     1,     1,     2,
       2,     1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    20,     2,     7,   400,     0,     0,     0,   183,     0,
       0,    63,     0,     0,     0,     0,     0,    57,    58,    59,
      60,    61,    62,     5,    22,     3,    54,    53,    64,     0,
      66,    70,    73,    76,    81,    84,    86,    88,    90,    92,
      94,    96,   436,     0,   182,     8,     6,     0,     0,    31,
      56,    55,    48,     0,    44,    45,   157,   158,   159,   160,
     161,   185,   186,   187,   188,   189,   191,   194,   195,   192,
     193,   179,   180,   184,   190,   237,   238,     0,   203,   181,
     196,     0,   198,   197,     0,   125,   127,   201,   129,   133,
     199,     0,   200,   131,    64,   112,     0,     0,     0,     0,
      51,    11,   110,     0,   354,   117,   201,   119,   123,   121,
       0,     9,     0,     0,    29,    30,     0,     0,     0,    27,
     100,   101,   102,   103,   104,   105,   106,   107,   108,   109,
      99,     0,    46,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,     0,    38,    39,     0,
       0,     0,    36,     0,   279,   280,     0,   162,   164,   165,
     166,     0,     0,   341,   126,     0,     0,   163,   128,   130,
     134,   132,   313,     0,   312,     0,   233,     0,   234,   205,
     206,   207,   208,   209,   211,   214,   215,   212,   213,   204,
     210,   222,     0,   217,   216,     0,   143,   145,   220,   147,
     149,   218,   219,   151,     0,     0,     0,     0,     0,     4,
       0,     0,     0,     0,   118,   120,   124,   122,   307,   355,
     306,     0,     0,   431,     0,   406,   360,    54,   359,     0,
     423,    21,     0,   428,   424,   434,   427,     0,     0,    28,
      24,    41,     0,    40,    26,     0,    98,    97,    67,    68,
      69,    71,    72,    74,    75,    79,    80,    77,    78,    82,
      83,    85,    87,    89,    91,    93,     0,   404,     0,    47,
      49,    37,    33,     0,    35,     0,   288,     0,   286,     0,
       0,     0,   302,   351,     0,     0,   345,   347,     0,   339,
     342,   343,   316,   315,     0,     0,     0,   314,     0,     0,
       0,     0,   271,   226,     5,     0,     0,     0,     0,   242,
       0,   270,   239,     0,   410,     0,   326,     0,     0,     6,
       0,     0,     0,     0,   268,     0,     0,   235,   236,     0,
       0,     0,   144,   146,   148,   150,   152,     0,     0,     0,
       0,     0,    50,    52,   111,   297,     0,     0,   291,     0,
       0,   310,   309,     0,     0,   308,    65,    10,   408,     0,
       0,     0,   321,   420,   380,     0,   421,     0,   426,   432,
     430,   435,   429,   405,    25,     0,    23,     0,   403,    34,
      32,     0,     0,   281,     0,     0,   202,     0,     0,   350,
     349,   332,   318,   331,   306,   301,   303,     0,    13,   340,
     344,   317,     0,   304,     0,     0,     0,     0,   135,   137,
     141,   139,     0,     0,   414,     0,    58,     0,     0,     0,
       0,     0,     0,     0,   265,   321,     0,     0,   272,   274,
     409,   331,     0,   328,     0,   224,   240,     0,   269,   335,
       0,   338,   352,     0,     0,     0,   327,   267,   266,   415,
     418,   419,   417,   416,   225,     0,   231,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,     0,   290,   298,
     292,   293,   311,   299,     0,   294,     0,     0,   407,   422,
     381,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   383,     5,     0,   372,     0,   374,   363,
       0,     0,     0,   364,   365,   366,   367,   368,     0,   425,
      43,    42,    95,   289,   287,     0,   282,     0,   285,   334,
     333,   309,     0,   319,   346,   348,   167,   168,   171,   170,
     169,     0,   172,   174,     0,   305,    12,   279,   280,     0,
       0,   136,   138,   142,   140,     0,   233,     0,   234,   413,
       0,   322,     0,   241,   411,   276,     0,   333,     0,     0,
     264,     0,   275,     0,   331,   329,   243,   324,     0,     0,
     336,   337,     0,   330,   223,   229,   230,     0,     0,   227,
     221,    17,     0,    14,    19,     0,   300,   295,   296,     0,
       0,     0,     0,     0,     0,     0,     0,   396,   397,   398,
       0,     0,     0,   384,   113,     0,   153,   155,   373,     0,
     376,   375,   382,   115,     0,     0,   320,   178,     0,     0,
       0,   175,     0,     0,   258,     0,     0,     0,   235,   236,
     412,   402,     0,   331,   273,   277,   333,   323,   325,   353,
     228,   232,    16,    18,     0,   371,     0,     0,     0,     0,
       0,     0,     0,   395,   399,     0,   369,     0,   114,     0,
     283,   284,     0,   177,   176,     0,     0,     0,     0,   248,
       0,     0,   263,     0,   401,     0,   370,     0,     0,   392,
       0,     0,   394,     0,     0,     0,   154,     0,   356,   156,
     173,     0,   256,     0,   257,     0,     0,     0,     0,     0,
       0,   253,   278,   385,   387,   388,     0,   393,     0,     0,
     116,   361,     0,     0,     0,     0,   246,     0,   247,     0,
     261,     0,   262,     0,     0,     0,     0,   390,     0,     0,
     357,   254,   255,     0,     0,     0,     0,     0,   251,     0,
     252,   386,   389,   391,   358,   362,   244,   245,   259,   260,
       0,     0,   249,   250
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    23,    24,    25,   236,    26,    50,   252,    27,    94,
      52,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,   102,   131,   505,    96,   620,   104,
     316,   417,   205,   615,   616,    85,   317,   176,   542,   543,
     544,   177,    86,    43,    44,    88,   209,    89,    90,    91,
     318,   319,   320,   321,   322,   437,   438,    92,    93,   287,
     288,   228,   182,   356,   183,   428,   323,   324,   402,   325,
     326,   300,   327,   357,   296,   297,   454,   110,   699,   240,
     722,   508,   509,   510,   511,   512,   375,   513,   514,   515,
     516,   517,    45,   328,    46,   241,   330,   331,   332,   333,
     334,   242,   243,   244,   245,   246,   247,   248,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -662
static const yytype_int16 yypact[] =
{
    5737,  -662,  -662,  -662,  -662,  5786,  5814,  5814,  -662,  7308,
    5737,  -662,  7308,  5737,  5827,  5176,    34,  -662,  -662,  -662,
    -662,  -662,  -662,   -68,  -662,  -662,   424,  -662,  1261,  5737,
    -662,   249,   246,   428,    44,   455,    28,   -60,   -11,   118,
       2,  -662,  -662,    14,  -662,  -662,  -662,   188,  5305,  -662,
     465,  -662,  -662,  5392,  -662,  -662,  -662,  -662,  -662,  -662,
    -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,
    -662,  -662,  -662,  -662,  -662,  -662,  -662,    10,  -662,  -662,
    -662,    77,  -662,  -662,  6412,  -662,  -662,  -662,  -662,  -662,
    -662,   159,  -662,  -662,  -662,  -662,  7480,  6510,  7480,  5305,
    -662,  -662,  -662,    19,  6852,  -662,    14,  -662,  -662,  -662,
      89,   111,  1914,   247,  -662,  -662,  4178,   247,  5737,  -662,
    -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,
    -662,  4285,  -662,  5737,  5737,  5737,  5737,  5737,  5737,  5737,
    5737,  5737,  5737,  5737,  5737,  5737,  5737,  5737,  5737,  5737,
    5737,  5737,  2043,  -662,   138,   177,   247,  -662,  -662,  4212,
     247,  5737,  -662,   247,   198,   220,   334,  -662,  -662,  -662,
    -662,  6608,  5737,   203,  -662,   209,   264,  -662,  -662,  -662,
    -662,  -662,   271,   243,   273,  2547,   259,    32,   267,  -662,
    -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,
    -662,  -662,   305,  -662,  -662,  6706,  -662,  -662,  -662,  -662,
    -662,  -662,  -662,  -662,  5737,   326,  6804,   311,   333,  -662,
    5737,  6314,  5441,   323,  -662,  -662,  -662,  -662,   146,  -662,
     175,  5737,    34,  -662,  2172,  -662,  -662,   563,  -662,  6125,
    -662,  -662,   321,  -662,  -662,    50,  -662,  2301,   322,  -662,
    -662,  -662,   297,  -662,  -662,   364,  -662,  -662,  -662,  -662,
    -662,   249,   249,   246,   246,   428,   428,   428,   428,    44,
      44,   455,    28,   -60,   -11,   118,   -52,  -662,   338,  -662,
    -662,  -662,  -662,   312,  -662,   372,   376,   -76,  -662,   247,
     247,   358,  -662,  6027,   387,   406,   404,  -662,   409,  -662,
     203,  -662,   271,   273,   423,  6950,  5737,   271,  7394,  6125,
    5364,  7308,  -662,  -662,   -68,   669,  4820,   101,  2664,  -662,
     142,  -662,  -662,   199,  -662,  6223,  -662,   626,   408,   411,
     321,   321,   321,   380,  -662,  2781,  2898,   419,   429,  4436,
     334,  5737,  -662,  -662,  -662,  -662,  -662,   427,   446,  5737,
    5737,   453,  -662,  -662,  -662,  -662,   458,   460,  -662,   459,
     -72,   146,   175,  7041,  5521,   146,  -662,  -662,  -662,   439,
    4285,   287,  -662,  -662,   442,  4049,  -662,  4285,  -662,  -662,
    -662,    50,  -662,  -662,  -662,  4285,  -662,  5737,  -662,  -662,
    -662,  5737,   247,  -662,   201,   228,  -662,  5929,   154,  -662,
    -662,   199,  -662,  -662,   513,  -662,  -662,  7222,  -662,  -662,
    -662,   271,   489,  -662,   466,   471,    42,  4707,  -662,  -662,
    -662,  -662,   172,  6125,  -662,  5047,   757,   101,   470,   626,
    7132,  4285,   332,  5737,  -662,   454,   101,   164,  -662,   163,
    -662,   456,   626,  -662,    49,  -662,  -662,   842,  -662,  -662,
    5580,  -662,  -662,   481,   335,    49,  -662,  -662,  -662,  -662,
    -662,  -662,  -662,  -662,  -662,  3015,  -662,  3132,  3249,  4436,
    3366,   486,   484,  5737,  -662,   487,   488,  5737,  -662,  -662,
    -662,  -662,   146,  -662,   495,  -662,   498,   -71,  -662,  -662,
    -662,  5737,   485,   508,   509,   510,  4139,   514,   247,   493,
     496,  4595,   247,  -662,   213,   165,  -662,  4932,  -662,  -662,
    1527,  1656,   500,  -662,  -662,  -662,  -662,  -662,   497,  -662,
    -662,  -662,  -662,  -662,  -662,  4436,  -662,  4436,  -662,   199,
    -662,   513,    49,  -662,  -662,  -662,  -662,  -662,  -662,  -662,
    -662,   521,   523,  -662,   269,  -662,  -662,  -662,  -662,   -27,
     502,  -662,  -662,  -662,  -662,    25,  -662,    42,  -662,  -662,
     626,  -662,   529,  -662,  -662,  -662,  2430,   512,   626,   291,
    -662,  5737,  -662,    49,   516,  -662,  -662,  -662,   526,   -61,
    -662,  -662,   247,  -662,  -662,  -662,  -662,  3483,  3600,  -662,
    -662,  -662,   527,  -662,  -662,   528,  -662,  -662,  -662,   520,
    4139,  5737,  5737,  5608,   604,  4522,   534,  -662,  -662,  -662,
     191,   530,  4139,  -662,  -662,   192,  -662,   536,  -662,  1785,
    -662,  -662,  -662,  -662,  3717,  3834,  -662,  -662,  5737,   547,
     308,  -662,   321,   321,  -662,    17,    41,   535,  -662,  -662,
    -662,  -662,   540,   545,  -662,   549,   555,  -662,  -662,  -662,
    -662,  -662,  -662,  -662,  4139,  -662,   344,   360,  4139,   367,
     572,  4139,  4562,  -662,  -662,  5737,  -662,   287,  -662,  4319,
    -662,  -662,   375,  -662,  -662,   -48,     6,   321,   321,  -662,
     321,   321,  -662,   207,  -662,  5737,  -662,  4139,  4139,  -662,
    4139,  5737,  -662,  4139,  5657,   557,  -662,  4319,  -662,  -662,
    -662,   321,  -662,   321,  -662,   -38,    60,   -36,   116,   321,
     321,  -662,  -662,   640,  -662,  -662,   379,  -662,  4139,   385,
    -662,  -662,   -50,   566,   567,   321,  -662,   321,  -662,   321,
    -662,   321,  -662,   -21,   150,  4139,   570,  -662,  4139,  3920,
    -662,  -662,  -662,   569,   573,   575,   578,   321,  -662,   321,
    -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,  -662,
     582,   583,  -662,  -662
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -662,   328,  -662,   279,  -105,   630,  -662,   552,   313,     0,
     713,  -662,    35,   398,   383,   413,   394,   584,   581,   586,
     580,   591,  -662,   499,     1,  -662,   -12,    27,  -357,  -662,
      -4,  -662,   633,  -662,    80,   929,    -8,  -662,  -662,  -530,
    -662,   309,    29,   808,   -75,   618,  -124,   107,    11,  -277,
    -273,   302,  -662,  -662,  -230,  -662,   183,    23,   907,   253,
     362,  -206,  -129,  -100,   -70,  -283,   956,  -214,  -345,  -662,
     870,  -662,    39,  -141,  -662,   349,  -662,   -19,  -661,  -333,
    -662,  -429,  -662,  -662,   248,  -662,  -662,  -152,  -547,  -662,
    -662,  -662,     4,  -366,   615,  -662,  -662,  -662,  -662,  -662,
    -662,  -662,   515,   382,   518,   519,  -662,  -140,  -662
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -434
static const yytype_int16 yytable[] =
{
      28,    42,   165,   103,   229,    84,    54,    55,    97,   518,
     400,   251,   278,     2,   631,    28,   188,   361,   506,   150,
     111,   208,   701,   208,   365,   373,   256,   215,     2,   155,
     295,   422,   725,   439,   729,     2,   721,   489,     8,     4,
      98,   103,   632,   633,   105,     2,   302,   392,   154,   747,
     481,   598,     2,    28,   251,   307,   140,   141,   662,   533,
       8,   648,   465,   467,   132,   393,   470,   604,   152,   152,
       8,   220,   112,   739,   147,   703,   175,   105,   755,   152,
     218,   344,   621,   187,   533,   387,   677,   678,   446,   175,
     376,   740,   344,   702,   369,   424,   223,   533,   563,   217,
     674,   294,   440,   726,     2,   730,   255,   211,   239,   211,
     680,   681,   338,   178,   634,   694,    28,   253,    28,   212,
     748,   212,   108,   184,   148,   207,   178,   207,   105,   727,
     208,    28,   257,   224,   149,   347,   184,   219,   151,   276,
     422,   208,   220,   230,   518,   518,   351,   704,   239,   285,
     163,    28,   146,   618,   152,   108,   482,     2,   679,    28,
     253,    28,     2,   175,   414,   636,   371,   293,   258,   259,
     260,   655,   336,   377,   411,     2,   142,   143,   459,   460,
     461,   463,   682,   666,   453,   731,   626,     8,   153,   378,
     621,   180,   361,   399,   166,   587,   588,   175,   365,   298,
       8,   728,   299,   210,   180,   210,   108,   231,   175,   559,
     184,   226,   301,   223,   303,   626,   211,   293,   371,   749,
      28,   354,   484,   626,   617,   686,   173,   211,   212,   689,
     239,   232,   692,   167,   343,   446,   367,   446,   168,   212,
     446,   348,   168,   239,   184,   343,   167,    71,    72,   359,
       2,   168,   624,   518,   625,   184,   279,   732,   713,   714,
     230,   715,   362,   363,   717,   447,   366,   364,   178,   169,
     170,   397,   536,   169,   170,   222,   709,   710,    79,   173,
     520,   448,   169,   170,    49,   398,   439,   569,   220,   737,
       2,   750,   221,    49,     2,   280,   222,   537,   103,   185,
     571,   293,   427,   570,   613,   423,   751,   430,   436,   753,
      28,   536,   345,   538,   220,   667,   449,   555,    51,   455,
     450,   293,   178,   345,   392,   482,   171,    51,   173,   409,
     664,   668,   404,   415,   173,     2,   537,   419,   289,   410,
     525,   548,   526,   539,   540,   178,   180,   558,   711,   429,
     612,   392,   538,   112,   119,   442,   444,   446,   446,   293,
     290,   167,     8,   427,   306,   167,   168,   527,   472,   528,
     168,   507,   136,   137,   133,    28,   475,   476,   162,   134,
     135,   304,   539,   540,   617,    28,   521,   629,   305,   398,
     171,   486,   630,   293,   446,   446,   532,   169,   170,   335,
     180,   169,   170,   293,   371,   164,   167,   339,   371,   223,
     429,   168,   173,   103,   557,   384,   173,   427,   523,   186,
     385,   532,   340,   180,   427,    28,   642,     2,   433,   352,
     389,   113,   114,   115,   573,   385,   404,   531,   138,   139,
     221,   249,   169,   170,   222,   254,   552,   349,   173,   371,
     564,   353,   178,   581,   105,   299,   230,   173,   582,   178,
     565,   374,   687,   383,   429,   301,   560,   220,     2,   144,
     145,   429,   156,   157,   158,   568,   396,   578,   688,   388,
     675,   676,   639,   220,   281,   690,   386,   220,   284,   610,
     220,   286,   536,   700,   390,   220,    28,   736,   220,   427,
     592,    28,   220,   738,   595,   405,   507,   507,   220,    95,
      28,    28,    95,   314,   391,   337,     2,   537,   599,   462,
     374,   263,   264,   532,   406,   705,   706,   407,   707,   708,
     180,   408,   108,   538,   261,   262,   178,   180,   269,   270,
     412,   116,   394,   395,   117,   118,   429,   457,   473,   723,
     458,   724,   532,   265,   266,   267,   268,   733,   734,   468,
     532,   427,   239,   539,   540,   119,     2,   372,   474,   469,
     113,   114,   115,   743,   477,   744,   478,   745,   479,   746,
     488,   480,   159,   490,   545,   160,   161,   167,   561,   656,
     657,   659,   168,   546,   566,   760,  -326,   761,   645,   580,
      28,    28,    28,    28,   590,    28,   591,   541,   429,   593,
     594,   238,    28,   596,   180,   507,   672,   286,   286,    28,
     597,   372,   600,   169,   170,   601,   602,   603,    28,     2,
     397,   605,   607,   107,   222,   608,   623,   372,   314,   627,
     628,   622,   635,   119,   435,   372,   314,   640,   647,   652,
     653,   238,  -328,   452,    28,   372,  -327,   654,    28,   427,
     660,    28,    28,   314,   314,   673,   107,   314,   665,    28,
     698,    95,     2,   663,   669,   683,   113,   114,   115,   716,
     116,   684,   719,   117,   118,  -329,   685,    28,    28,   691,
      28,    28,   695,    28,    28,  -330,   720,    28,   698,   372,
     167,   370,   179,   504,   735,   168,   429,   741,   742,   752,
     756,   283,   712,    95,   757,   179,   758,   107,    28,   759,
     286,    95,   225,   762,   763,   372,   372,   100,   272,   274,
     271,   216,   372,   238,   273,    28,   169,   170,    28,    28,
     698,   275,   237,   371,   547,   550,   238,   696,   572,   576,
     556,   372,   644,   314,   524,   372,   535,   372,   619,   519,
     372,     0,   380,     0,   372,   381,   382,     0,     0,     0,
     372,     0,   372,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   237,   372,     0,     0,   116,     0,     0,   117,
     118,     0,     0,   314,     0,   314,   314,   314,   314,     0,
     329,    71,    72,     0,     0,    95,     0,   431,     0,     0,
       0,     0,     0,     0,     0,   315,     0,    87,     0,     0,
      87,     0,     0,   106,   504,     0,   606,     0,     0,     0,
     611,  -341,    79,     0,     0,   435,  -341,     0,   504,   504,
      95,     0,     0,     1,     0,     2,     3,     4,    95,    95,
       0,     0,     0,   314,     0,   314,   106,   179,     0,   372,
     372,     0,     0,    95,   237,     0,     0,  -341,  -341,   238,
       8,     0,     0,     0,     0,     0,   238,   237,     0,     0,
       0,     0,   173,   637,     0,   638,   522,     0,   372,     0,
      95,     0,    87,     0,     0,     0,   372,   372,     0,     0,
       0,   372,     0,     0,     0,    87,     0,   106,     0,     0,
     649,   179,    87,     9,    10,   314,   314,     0,     0,     0,
     106,     0,   109,     0,     0,     0,   421,     0,   504,     0,
     238,     0,    95,   329,   179,     0,     0,     0,     0,     0,
     504,     0,     0,     0,    12,    13,     0,   504,   315,    95,
     329,   329,   314,   314,   329,   109,     0,     0,     0,    53,
     106,    16,     0,     0,     0,   315,   315,     0,     0,   315,
       0,     0,    95,     0,   291,     0,    95,     0,     0,    87,
       0,     0,   504,     0,     0,     0,   504,     0,     0,   504,
      95,   181,     0,   106,     0,   372,     0,     0,     0,     0,
       0,     0,     0,   213,   181,   213,   109,   237,     0,     0,
       0,   227,     0,   174,     0,   504,   504,     0,   504,     0,
       0,   504,     0,     0,     0,   206,   174,   206,     0,    87,
     360,     0,     0,     0,     0,   554,     0,     0,     0,     0,
       0,   179,   106,   107,     0,     0,   504,    87,   179,     0,
       0,     0,     0,     0,     0,   106,     0,     0,     0,     0,
       0,     0,     0,   504,     0,   238,   504,     0,     0,     0,
      95,     0,     0,     0,     0,     0,     0,   315,     0,     0,
     329,     0,   329,   329,   329,   329,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   315,     0,   315,   315,   315,
     315,    87,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   346,    87,     0,     0,   420,    87,     0,    87,
       0,     0,     0,   346,    87,   179,   106,     0,     0,     0,
       0,     0,     0,    87,   342,     0,     0,     0,     0,     0,
     329,     0,   329,   106,   106,   342,   181,   106,   471,     0,
       0,     0,     0,     0,     0,   315,     0,   315,     0,     0,
       0,     0,     0,   403,    95,     0,     0,     0,   174,     0,
       0,    87,   487,     0,     0,     0,     0,     0,     0,     0,
     403,     0,     0,   106,    95,     0,   441,   443,     0,     0,
       0,     0,     0,     0,     0,     0,   237,   456,     0,     0,
     181,     0,   329,   329,     0,    87,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    87,     0,   315,   315,     0,
       0,     0,   174,   181,     0,   553,     0,     0,     0,     0,
       0,    87,     0,   106,     0,     0,     0,   418,    87,   329,
     329,   403,     0,     0,     0,   174,     0,     0,     0,   401,
       0,     0,     0,     0,   315,   315,     0,     0,   579,     0,
       0,     0,     0,     0,     0,     0,   401,   403,   530,     0,
       0,     0,   401,   106,   403,   106,   106,   106,   106,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,   403,     0,   530,     0,   403,
       0,     0,   403,     0,     0,     0,   567,     0,     0,     0,
       0,     0,   574,     0,   575,    87,     0,     0,   106,   106,
       0,     0,     0,     0,     0,   583,     0,   401,     0,     0,
     181,     0,   109,   106,     0,   106,     0,   181,     0,     0,
       0,     0,     0,     0,     0,     0,   551,     0,     0,     0,
       0,     0,   174,   401,   529,     0,     0,     0,     0,   174,
     401,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   106,     0,     0,   403,     0,     0,
       0,   401,     0,   529,     0,   401,     0,     0,   401,     0,
       0,     0,   529,     0,     0,   106,   106,     0,   401,   130,
       0,   403,   530,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   181,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   106,     0,     0,
     403,     0,   106,   106,     0,     0,   174,     0,   643,   403,
       0,     0,     0,   646,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   401,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   401,   529,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   401,     0,     0,     0,
       0,     0,     0,     0,   401,   401,     0,     0,     1,   529,
       2,     3,     4,     5,     0,     6,     7,   403,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,   491,
     492,   493,   494,   495,   496,   497,   498,   499,   500,   501,
       0,     0,     0,    78,     0,     0,     0,     0,     9,    10,
      11,     0,    79,     0,   502,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   401,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    82,
      83,     0,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   503,   374,  -378,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,   491,   492,
     493,   494,   495,   496,   497,   498,   499,   500,   501,     0,
       0,     0,    78,     0,     0,     0,     0,     9,    10,    11,
       0,    79,     0,   502,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    82,    83,
       0,     0,     0,    15,     0,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   503,   374,  -377,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,   491,   492,   493,
     494,   495,   496,   497,   498,   499,   500,   501,     0,     0,
       0,    78,     0,     0,     0,     0,     9,    10,    11,     0,
      79,     0,   502,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    82,    83,     0,
       0,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   503,   374,  -379,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     9,    10,    11,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    82,    83,     0,     0,
       0,    15,     0,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   233,   234,   235,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     9,    10,    11,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      15,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   233,   234,   277,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     9,    10,    11,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    82,    83,     0,     0,     0,    15,
       0,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   233,   234,   368,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     9,    10,    11,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    82,    83,     0,     0,     0,    15,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     379,   234,  -433,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     9,    10,    11,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    82,    83,     0,     0,     0,    15,     1,    16,
       2,     3,     4,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   233,
     234,   641,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   308,     0,     0,     9,    10,
       0,   167,    79,     0,     0,   309,   168,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   169,   170,    82,
      83,     0,     0,     0,   310,     1,    16,     2,     3,     4,
       0,     0,   173,     0,     0,   311,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   312,     0,   313,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,   308,     0,     0,     9,    10,     0,   167,    79,
       0,     0,   309,   168,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   169,   170,    82,    83,     0,     0,
       0,   310,     1,    16,     2,     3,     4,     0,     0,   173,
       0,     0,   311,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   312,     0,   445,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,   308,
       0,     0,     9,    10,     0,   167,    79,     0,     0,   309,
     168,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   169,   170,    82,    83,     0,     0,     0,   310,     1,
      16,     2,     3,     4,     0,     0,   173,     0,     0,   311,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     312,     0,   464,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,   308,     0,     0,     9,
      10,     0,   167,    79,     0,     0,   309,   168,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   169,   170,
      82,    83,     0,     0,     0,   310,     1,    16,     2,     3,
       4,     0,     0,   173,     0,     0,   311,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   312,     0,   466,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,   308,     0,     0,     9,    10,     0,   167,
      79,     0,     0,   309,   168,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   169,   170,    82,    83,     0,
       0,     0,   310,     1,    16,     2,     3,     4,     0,     0,
     173,     0,     0,   311,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   312,     0,   584,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     308,     0,     0,     9,    10,     0,   167,    79,     0,     0,
     309,   168,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   169,   170,    82,    83,     0,     0,     0,   310,
       1,    16,     2,     3,     4,     0,     0,   173,     0,     0,
     311,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   312,     0,   585,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,   308,     0,     0,
       9,    10,     0,   167,    79,     0,     0,   309,   168,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   169,
     170,    82,    83,     0,     0,     0,   310,     1,    16,     2,
       3,     4,     0,     0,   173,     0,     0,   311,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   312,     0,
     586,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,   308,     0,     0,     9,    10,     0,
     167,    79,     0,     0,   309,   168,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   169,   170,    82,    83,
       0,     0,     0,   310,     1,    16,     2,     3,     4,     0,
       0,   173,     0,     0,   311,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   312,     0,   589,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,   308,     0,     0,     9,    10,     0,   167,    79,     0,
       0,   309,   168,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   169,   170,    82,    83,     0,     0,     0,
     310,     1,    16,     2,     3,     4,     0,     0,   173,     0,
       0,   311,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   312,     0,   650,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,   308,     0,
       0,     9,    10,     0,   167,    79,     0,     0,   309,   168,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     169,   170,    82,    83,     0,     0,     0,   310,     1,    16,
       2,     3,     4,     0,     0,   173,     0,     0,   311,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   312,
       0,   651,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   308,     0,     0,     9,    10,
       0,   167,    79,     0,     0,   309,   168,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   169,   170,    82,
      83,     0,     0,     0,   310,     1,    16,     2,     3,     4,
       0,     0,   173,     0,     0,   311,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   312,     0,   670,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,   308,     0,     0,     9,    10,     0,   167,    79,
       0,     0,   309,   168,     0,     0,     0,     0,     0,    80,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   169,   170,    82,    83,     8,     0,
       0,   310,     0,    16,     0,     0,     0,     0,     0,   173,
       0,     0,   311,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   312,     0,   671,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
     697,   754,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   491,   492,   493,   494,   495,   496,   497,   498,   499,
     500,   501,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,   502,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    15,     8,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   503,   374,
       0,   491,   492,   493,   494,   495,   496,   497,   498,   499,
     500,   501,     0,     0,     0,     0,     8,     0,     0,     0,
       9,    10,    11,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    12,    13,     0,     0,     0,     0,     0,    14,     9,
      10,    11,     0,     0,     0,     0,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   503,   374,
      12,    13,     0,     9,    10,    11,     1,    14,     2,     3,
       4,     5,     0,     6,     7,    15,   250,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     0,   234,     0,
       1,    14,     2,     3,     4,     5,     0,     6,     7,    15,
     282,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,   234,     0,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     0,
       9,    10,    11,     0,    14,     0,     0,     0,     0,     0,
       0,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,   234,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,    15,     1,    16,     2,
       3,     4,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   697,
       0,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,   308,     0,     0,     9,    10,     0,
     167,    79,     0,     0,   309,   168,     0,     0,     0,     0,
       0,    80,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   169,   170,    82,    83,
       8,     0,     0,   310,     0,    16,     0,     0,     0,     0,
       0,   173,     0,     1,   311,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,   312,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,     0,     0,     9,    10,    11,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     9,    10,    11,     0,     0,     0,    15,
     661,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   503,     0,     0,    12,    13,     9,    10,    11,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,    15,
     693,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,    12,    13,     0,
       0,   503,     0,     0,    14,     0,     0,     0,     0,     0,
       2,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   609,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,   416,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,   167,    79,     0,     0,     0,   168,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   169,   170,    82,
      83,     0,     0,     2,   221,     0,     0,     0,   222,     0,
       0,     0,   173,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   549,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,   167,    79,     0,     0,     0,   168,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     169,   170,    82,    83,     0,     2,     0,   432,     0,     0,
       0,     0,     0,     0,     0,   173,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   433,     0,   434,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,   167,    79,     0,     0,
       0,   168,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   169,   170,    82,    83,     0,     0,     1,   371,
       2,     3,     4,     5,     0,     6,     7,   173,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   614,     0,     0,     0,     8,     0,     0,     0,     0,
       0,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     9,    10,
      11,   167,    79,     0,     0,     0,   168,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,   169,   170,    82,
      83,     0,     0,     0,   425,   101,    16,     0,     0,     0,
       0,    17,   426,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     9,    10,    11,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    82,    83,
       0,     0,     0,    15,   101,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     2,     3,     4,
       5,    78,     6,     7,     0,     0,     9,    10,    11,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     8,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    82,    83,     0,
       8,     0,    53,   101,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     9,    10,    11,   167,     0,
       0,     0,     1,   168,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,    12,    13,     0,     8,
       0,     0,     0,    14,   169,   170,     0,     0,     0,     0,
       0,   425,   101,    16,     0,     0,     0,     0,    17,   426,
      19,    20,    21,    22,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,    15,
     101,    16,     9,    10,    11,     0,    17,    18,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     8,
      14,     0,     0,     0,     0,     0,     0,     0,    15,     0,
      16,     0,     0,   358,     0,    17,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     9,    10,    11,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     8,     0,    15,     0,
      16,     0,     0,   485,     0,    17,    18,    19,    20,    21,
      22,     9,    10,    11,     0,     0,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,    12,    13,     0,     8,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,    15,     0,    16,
       0,     0,   577,     0,    17,    18,    19,    20,    21,    22,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,    15,   658,    16,     9,    10,
      11,     0,    17,    18,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     8,    14,     0,     0,     0,
       0,     0,     0,     0,    15,   718,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     0,     0,     0,     8,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,    12,
      13,     0,     8,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,    15,     8,    16,     9,    10,    11,
       0,    17,    18,    19,    20,    21,    22,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     9,    10,
      11,     0,     0,    48,     0,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     0,     0,    12,
      13,    53,     2,    16,     0,     0,    14,     0,    17,    18,
      19,    20,    21,    22,    99,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,   167,    79,     0,     0,     0,   168,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       2,     0,     0,     0,     0,     0,     0,     0,     0,   169,
     170,    82,    83,     0,     0,     0,   397,   355,     0,     0,
     222,     0,     0,     0,   173,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,   167,    79,     0,     0,     0,   168,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     2,     0,
       0,     0,     0,     0,     0,     0,     0,   169,   170,    82,
      83,     0,     0,     0,   397,     0,     0,     0,   222,     0,
       0,     0,   173,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,   167,
      79,     0,     0,     0,   168,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     2,     0,     0,     0,
       0,     0,     0,     0,     0,   169,   170,    82,    83,     0,
       0,     0,   371,     0,     0,     0,     0,     0,     0,     0,
     173,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     0,     0,     0,
       0,   451,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,   167,    79,
       0,     0,     0,   168,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   169,   170,    82,    83,     0,     0,
       0,   221,   355,     0,     0,   222,     0,     0,     0,   173,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,   167,    79,     0,     0,
       0,   168,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   169,   170,    82,    83,     0,     0,     0,   171,
       0,     0,     0,   172,     0,     0,     0,   173,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,   167,    79,     0,     0,     0,   168,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     169,   170,    82,    83,     0,     0,     0,   171,     0,     0,
       0,   214,     0,     0,     0,   173,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,   167,    79,     0,     0,     0,   168,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   169,   170,
      82,    83,     0,     0,     0,   171,   292,     0,     0,     0,
       0,     0,     0,   173,     8,    56,    57,    58,    59,    60,
     189,   190,   191,   192,   193,   194,   195,   196,   197,   198,
      71,    72,   199,   200,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   201,     0,     0,     0,     0,     0,     0,     0,
     167,    79,     0,     0,     0,   168,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   202,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   169,   170,   203,   204,
       0,     0,     0,   171,     0,     0,     0,   341,     0,     0,
       0,   173,     8,    56,    57,    58,    59,    60,   189,   190,
     191,   192,   193,   194,   195,   196,   197,   198,    71,    72,
     199,   200,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     201,     0,     0,     0,     0,     0,     0,     0,   167,    79,
       8,     0,     0,   168,     0,     0,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,   202,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   169,   170,   203,   204,    78,     0,
       0,   171,     0,     0,     0,   350,   167,    79,     0,   173,
       0,   168,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   169,   170,    82,    83,     0,     0,     0,   221,
       0,     0,     0,   222,     0,     0,     0,   173,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,    83,     0,     0,     0,     0,   413,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,    83,     0,     0,     0,     0,   483,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,   562,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,   534,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,    83,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,   416,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     8,    56,
      57,    58,    59,    60,   189,   190,   191,   192,   193,   194,
     195,   196,   197,   198,    71,    72,   199,   200,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   201,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     202,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   203,   204
};

static const yytype_int16 yycheck[] =
{
       0,     0,    77,    15,   104,     9,     6,     7,    12,   375,
     293,   116,   152,     3,   544,    15,    91,   223,   375,    17,
      16,    96,    70,    98,   230,   239,   131,    97,     3,    48,
     171,   308,    70,   316,    70,     3,   697,   370,    28,     5,
      13,    53,    69,    70,    15,     3,   175,   123,    48,    70,
     122,   122,     3,    53,   159,   184,    12,    13,   605,   404,
      28,   122,   335,   336,    29,   141,   339,   496,   140,   140,
      28,   123,   140,   123,   134,    69,    84,    48,   739,   140,
      99,   205,   511,    91,   429,   137,    69,    70,   318,    97,
     242,   141,   216,   141,   234,   309,   104,   442,   431,    99,
     630,   171,   316,   141,     3,   141,   118,    96,   112,    98,
      69,    70,   187,    84,   141,   662,   116,   116,   118,    96,
     141,    98,    15,    84,   135,    96,    97,    98,    99,    69,
     205,   131,   131,   104,    16,   205,    97,   118,   136,   151,
     417,   216,   123,   104,   510,   511,   216,   141,   152,   161,
     140,   151,   124,   510,   140,    48,   362,     3,   141,   159,
     159,   161,     3,   171,   305,   140,   117,   171,   133,   134,
     135,   600,   140,   123,   303,     3,   132,   133,   330,   331,
     332,   333,   141,   612,   325,    69,   531,    28,     0,   139,
     619,    84,   398,   293,   117,   468,   469,   205,   404,   172,
      28,   141,   173,    96,    97,    98,    99,   118,   216,   423,
     171,   104,   173,   221,   175,   560,   205,   221,   117,    69,
     220,   220,   363,   568,   507,   654,   125,   216,   205,   658,
     234,   120,   661,    74,   205,   465,   232,   467,    79,   216,
     470,   214,    79,   247,   205,   216,    74,    44,    45,   222,
       3,    79,   525,   619,   527,   216,   118,   141,   687,   688,
     221,   690,   223,   117,   693,   123,   231,   121,   239,   110,
     111,   117,     3,   110,   111,   121,    69,    70,    75,   125,
     385,   139,   110,   111,     5,   293,   569,   123,   123,   718,
       3,   141,   117,    14,     3,   118,   121,    28,   310,   140,
     137,   305,   310,   139,   139,   309,   735,   311,   316,   738,
     310,     3,   205,    44,   123,   123,   117,   417,     5,   327,
     121,   325,   293,   216,   123,   531,   117,    14,   125,   300,
     139,   139,   293,   306,   125,     3,    28,   308,   140,   300,
     139,   416,   141,    74,    75,   316,   239,   422,   141,   310,
     137,   123,    44,   140,    26,   316,   317,   587,   588,   363,
     140,    74,    28,   371,   121,    74,    79,   139,   341,   141,
      79,   375,   126,   127,   125,   375,   349,   350,    50,   130,
     131,   117,    74,    75,   667,   385,   385,   118,   117,   397,
     117,   364,   123,   397,   624,   625,   404,   110,   111,   140,
     293,   110,   111,   407,   117,    77,    74,   140,   117,   417,
     371,    79,   125,   425,   422,   118,   125,   425,   391,    91,
     123,   429,   117,   316,   432,   425,   566,     3,   137,   118,
     118,     7,     8,     9,   442,   123,   397,   398,    10,    11,
     117,   113,   110,   111,   121,   117,   417,   121,   125,   117,
     118,   118,   423,   118,   425,   426,   417,   125,   123,   430,
     433,   140,   118,   141,   425,   426,   427,   123,     3,    14,
      15,   432,     7,     8,     9,   436,   118,   450,   118,   141,
     632,   633,   557,   123,   156,   118,   122,   123,   160,   501,
     123,   163,     3,   118,   122,   123,   496,   118,   123,   507,
     473,   501,   123,   118,   477,   118,   510,   511,   123,    10,
     510,   511,    13,   185,   138,   187,     3,    28,   491,   139,
     140,   138,   139,   531,   118,   677,   678,   123,   680,   681,
     423,   122,   425,    44,   136,   137,   507,   430,   144,   145,
     117,   117,   289,   290,   120,   121,   507,   139,   121,   701,
     139,   703,   560,   140,   141,   142,   143,   709,   710,   140,
     568,   569,   566,    74,    75,   237,     3,   239,   122,   140,
       7,     8,     9,   725,   121,   727,   118,   729,   118,   731,
     141,   122,   117,   141,   118,   120,   121,    74,   118,   601,
     602,   603,    79,   122,   140,   747,   140,   749,   571,   118,
     600,   601,   602,   603,   118,   605,   122,   118,   569,   122,
     122,   112,   612,   118,   507,   619,   628,   289,   290,   619,
     122,   293,   137,   110,   111,   117,   117,   117,   628,     3,
     117,   117,   139,    15,   121,   139,   139,   309,   310,   118,
     117,   141,   140,   315,   316,   317,   318,   118,   122,   122,
     122,   152,   140,   325,   654,   327,   140,   137,   658,   667,
      56,   661,   662,   335,   336,   118,    48,   339,   138,   669,
     669,   172,     3,   139,   138,   140,     7,     8,     9,   691,
     117,   141,   694,   120,   121,   140,   137,   687,   688,   117,
     690,   691,   665,   693,   694,   140,   139,   697,   697,   371,
      74,   138,    84,   375,    64,    79,   667,   141,   141,   139,
     141,   159,   685,   214,   141,    97,   141,    99,   718,   141,
     392,   222,   104,   141,   141,   397,   398,    14,   147,   149,
     146,    98,   404,   234,   148,   735,   110,   111,   738,   739,
     739,   150,   112,   117,   416,   417,   247,   667,   439,   447,
     422,   423,   569,   425,   392,   427,   407,   429,   510,   377,
     432,    -1,   247,    -1,   436,   247,   247,    -1,    -1,    -1,
     442,    -1,   444,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   152,   455,    -1,    -1,   117,    -1,    -1,   120,
     121,    -1,    -1,   465,    -1,   467,   468,   469,   470,    -1,
     185,    44,    45,    -1,    -1,   306,    -1,   138,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   185,    -1,     9,    -1,    -1,
      12,    -1,    -1,    15,   496,    -1,   498,    -1,    -1,    -1,
     502,    74,    75,    -1,    -1,   507,    79,    -1,   510,   511,
     341,    -1,    -1,     1,    -1,     3,     4,     5,   349,   350,
      -1,    -1,    -1,   525,    -1,   527,    48,   239,    -1,   531,
     532,    -1,    -1,   364,   234,    -1,    -1,   110,   111,   370,
      28,    -1,    -1,    -1,    -1,    -1,   377,   247,    -1,    -1,
      -1,    -1,   125,   555,    -1,   557,   387,    -1,   560,    -1,
     391,    -1,    84,    -1,    -1,    -1,   568,   569,    -1,    -1,
      -1,   573,    -1,    -1,    -1,    97,    -1,    99,    -1,    -1,
     582,   293,   104,    71,    72,   587,   588,    -1,    -1,    -1,
     112,    -1,    15,    -1,    -1,    -1,   308,    -1,   600,    -1,
     431,    -1,   433,   318,   316,    -1,    -1,    -1,    -1,    -1,
     612,    -1,    -1,    -1,   102,   103,    -1,   619,   318,   450,
     335,   336,   624,   625,   339,    48,    -1,    -1,    -1,   117,
     152,   119,    -1,    -1,    -1,   335,   336,    -1,    -1,   339,
      -1,    -1,   473,    -1,   166,    -1,   477,    -1,    -1,   171,
      -1,    -1,   654,    -1,    -1,    -1,   658,    -1,    -1,   661,
     491,    84,    -1,   185,    -1,   667,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    96,    97,    98,    99,   377,    -1,    -1,
      -1,   104,    -1,    84,    -1,   687,   688,    -1,   690,    -1,
      -1,   693,    -1,    -1,    -1,    96,    97,    98,    -1,   221,
     222,    -1,    -1,    -1,    -1,   417,    -1,    -1,    -1,    -1,
      -1,   423,   234,   425,    -1,    -1,   718,   239,   430,    -1,
      -1,    -1,    -1,    -1,    -1,   247,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   735,    -1,   566,   738,    -1,    -1,    -1,
     571,    -1,    -1,    -1,    -1,    -1,    -1,   447,    -1,    -1,
     465,    -1,   467,   468,   469,   470,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   465,    -1,   467,   468,   469,
     470,   293,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   205,   305,    -1,    -1,   308,   309,    -1,   311,
      -1,    -1,    -1,   216,   316,   507,   318,    -1,    -1,    -1,
      -1,    -1,    -1,   325,   205,    -1,    -1,    -1,    -1,    -1,
     525,    -1,   527,   335,   336,   216,   239,   339,   340,    -1,
      -1,    -1,    -1,    -1,    -1,   525,    -1,   527,    -1,    -1,
      -1,    -1,    -1,   293,   665,    -1,    -1,    -1,   239,    -1,
      -1,   363,   364,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     310,    -1,    -1,   375,   685,    -1,   316,   317,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   566,   327,    -1,    -1,
     293,    -1,   587,   588,    -1,   397,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   407,    -1,   587,   588,    -1,
      -1,    -1,   293,   316,    -1,   417,    -1,    -1,    -1,    -1,
      -1,   423,    -1,   425,    -1,    -1,    -1,   308,   430,   624,
     625,   371,    -1,    -1,    -1,   316,    -1,    -1,    -1,   293,
      -1,    -1,    -1,    -1,   624,   625,    -1,    -1,   450,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   310,   397,   398,    -1,
      -1,    -1,   316,   465,   404,   467,   468,   469,   470,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    -1,
      -1,    -1,    -1,    -1,    -1,   425,    -1,   427,    -1,   429,
      -1,    -1,   432,    -1,    -1,    -1,   436,    -1,    -1,    -1,
      -1,    -1,   442,    -1,   444,   507,    -1,    -1,   510,   511,
      -1,    -1,    -1,    -1,    -1,   455,    -1,   371,    -1,    -1,
     423,    -1,   425,   525,    -1,   527,    -1,   430,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   417,    -1,    -1,    -1,
      -1,    -1,   423,   397,   398,    -1,    -1,    -1,    -1,   430,
     404,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   566,    -1,    -1,   507,    -1,    -1,
      -1,   425,    -1,   427,    -1,   429,    -1,    -1,   432,    -1,
      -1,    -1,   436,    -1,    -1,   587,   588,    -1,   442,   138,
      -1,   531,   532,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   507,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   619,    -1,    -1,
     560,    -1,   624,   625,    -1,    -1,   507,    -1,   568,   569,
      -1,    -1,    -1,   573,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   507,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   531,   532,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   560,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   568,   569,    -1,    -1,     1,   573,
       3,     4,     5,     6,    -1,     8,     9,   667,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   667,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   139,   140,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   139,   140,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   139,   140,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,    -1,
      -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,
     126,   127,   128,   129,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   139,   140,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,   126,
     127,   128,   129,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   139,   140,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      -1,   119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,
     128,   129,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   139,   140,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,
     129,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     139,   140,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,   117,     1,   119,
       3,     4,     5,    -1,   124,   125,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
     140,   141,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,     1,   119,     3,     4,     5,
      -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,     1,   119,     3,     4,     5,    -1,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,     1,
     119,     3,     4,     5,    -1,    -1,   125,    -1,    -1,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,    -1,   141,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,     1,   119,     3,     4,
       5,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,     1,   119,     3,     4,     5,    -1,    -1,
     125,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
       1,   119,     3,     4,     5,    -1,    -1,   125,    -1,    -1,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,   141,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,     1,   119,     3,
       4,     5,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
     141,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,     1,   119,     3,     4,     5,    -1,
      -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,     1,   119,     3,     4,     5,    -1,    -1,   125,    -1,
      -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,     1,   119,
       3,     4,     5,    -1,    -1,   125,    -1,    -1,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   141,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,     1,   119,     3,     4,     5,
      -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    28,    -1,
      -1,   117,    -1,   119,    -1,    -1,    -1,    -1,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,   119,
      -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,   129,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     140,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,    28,   119,    -1,
      -1,    -1,    -1,   124,   125,   126,   127,   128,   129,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   139,   140,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    71,
      72,    73,    -1,    -1,    -1,    -1,   117,    -1,   119,    -1,
      -1,    -1,    -1,   124,   125,   126,   127,   128,   129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,   140,
     102,   103,    -1,    71,    72,    73,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,   117,   118,   119,    -1,    -1,
      -1,    -1,   124,   125,   126,   127,   128,   129,    -1,    -1,
      -1,    -1,    -1,    28,   102,   103,    -1,    -1,   140,    -1,
       1,   109,     3,     4,     5,     6,    -1,     8,     9,   117,
     118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,   140,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      71,    72,    73,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,   140,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   117,     1,   119,     3,
       4,     5,    -1,   124,   125,   126,   127,   128,   129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      28,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
      -1,   125,    -1,     1,   128,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,   139,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    71,    72,    73,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    71,    72,    73,    -1,    -1,    -1,   117,
     118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,    -1,   102,   103,    71,    72,    73,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
     118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,   139,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
       3,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,     3,   117,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,     3,    -1,   117,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   137,    -1,   139,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,     1,   117,
       3,     4,     5,     6,    -1,     8,     9,   125,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    66,     8,     9,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    28,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      28,    -1,   117,   118,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,    71,    72,    73,    74,    -1,
      -1,    -1,     1,    79,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,   102,   103,    -1,    28,
      -1,    -1,    -1,   109,   110,   111,    -1,    -1,    -1,    -1,
      -1,   117,   118,   119,    -1,    -1,    -1,    -1,   124,   125,
     126,   127,   128,   129,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
     118,   119,    71,    72,    73,    -1,   124,   125,   126,   127,
     128,   129,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    28,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,   128,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    28,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,   128,
     129,    71,    72,    73,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,   102,   103,    -1,    28,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,   119,
      -1,    -1,   122,    -1,   124,   125,   126,   127,   128,   129,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,   118,   119,    71,    72,
      73,    -1,   124,   125,   126,   127,   128,   129,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    28,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    28,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,   102,
     103,    -1,    28,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   117,    28,   119,    71,    72,    73,
      -1,   124,   125,   126,   127,   128,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    71,    72,
      73,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,   102,
     103,   117,     3,   119,    -1,    -1,   109,    -1,   124,   125,
     126,   127,   128,   129,   117,    -1,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
     121,    -1,    -1,    -1,   125,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     125,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,   121,    -1,    -1,    -1,   125,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
      -1,   121,    -1,    -1,    -1,   125,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,    -1,
      -1,    -1,    -1,   125,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,    -1,   121,    -1,    -1,
      -1,   125,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      28,    -1,    -1,    79,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    66,    -1,
      -1,   117,    -1,    -1,    -1,   121,    74,    75,    -1,   125,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   112,   113,    -1,    -1,    -1,    -1,   118,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   112,   113
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   117,   119,   124,   125,   126,
     127,   128,   129,   143,   144,   145,   147,   150,   151,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   185,   186,   234,   236,   250,   117,   145,
     148,   150,   152,   117,   151,   151,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    66,    75,
      85,   100,   112,   113,   172,   177,   184,   185,   187,   189,
     190,   191,   199,   200,   151,   165,   169,   172,   169,   117,
     152,   118,   166,   168,   171,   184,   185,   187,   189,   200,
     219,   234,   140,     7,     8,     9,   117,   120,   121,   143,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
     138,   167,   154,   125,   130,   131,   126,   127,    10,    11,
      12,    13,   132,   133,    14,    15,   124,   134,   135,    16,
      17,   136,   140,     0,   151,   219,     7,     8,     9,   117,
     120,   121,   143,   140,   143,   186,   117,    74,    79,   110,
     111,   117,   121,   125,   177,   178,   179,   183,   184,   187,
     189,   200,   204,   206,   214,   140,   143,   178,   186,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    46,
      47,    66,   100,   112,   113,   174,   177,   184,   186,   188,
     189,   190,   199,   200,   121,   206,   174,   151,   219,   118,
     123,   117,   121,   178,   184,   187,   189,   200,   203,   205,
     214,   118,   120,   139,   140,   141,   146,   147,   165,   172,
     221,   237,   243,   244,   245,   246,   247,   248,   249,   143,
     118,   146,   149,   166,   143,   168,   146,   166,   154,   154,
     154,   155,   155,   156,   156,   157,   157,   157,   157,   158,
     158,   159,   160,   161,   162,   163,   168,   141,   249,   118,
     118,   143,   118,   149,   143,   168,   143,   201,   202,   140,
     140,   185,   118,   172,   206,   215,   216,   217,   169,   184,
     213,   214,   204,   214,   117,   117,   121,   204,    68,    78,
     117,   128,   139,   141,   143,   147,   172,   178,   192,   193,
     194,   195,   196,   208,   209,   211,   212,   214,   235,   236,
     238,   239,   240,   241,   242,   140,   140,   143,   186,   140,
     117,   121,   177,   184,   188,   189,   200,   206,   169,   121,
     121,   206,   118,   118,   166,   118,   205,   215,   122,   169,
     185,   203,   214,   117,   121,   203,   154,   234,   141,   249,
     138,   117,   143,   209,   140,   228,   229,   123,   139,   139,
     244,   246,   247,   141,   118,   123,   122,   137,   141,   118,
     122,   138,   123,   141,   201,   201,   118,   117,   178,   205,
     207,   208,   210,   212,   214,   118,   118,   123,   122,   184,
     214,   204,   117,   118,   215,   169,    50,   173,   177,   184,
     185,   187,   191,   172,   209,   117,   125,   178,   207,   214,
     172,   138,   117,   137,   139,   143,   178,   197,   198,   207,
     209,   212,   214,   212,   214,   141,   196,   123,   139,   117,
     121,   118,   143,   215,   218,   178,   212,   139,   139,   229,
     229,   229,   139,   229,   141,   192,   141,   192,   140,   140,
     192,   185,   169,   121,   122,   169,   169,   121,   118,   118,
     122,   122,   203,   118,   215,   122,   169,   185,   141,   221,
     141,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    77,   139,   143,   168,   170,   172,   223,   224,
     225,   226,   227,   229,   230,   231,   232,   233,   235,   245,
     146,   166,   165,   169,   202,   139,   141,   139,   141,   208,
     212,   214,   178,   210,    51,   217,     3,    28,    44,    74,
      75,   118,   180,   181,   182,   118,   122,   143,   186,   140,
     143,   177,   184,   185,   187,   205,   143,   178,   186,   209,
     214,   118,   117,   221,   118,   169,   140,   212,   214,   123,
     139,   137,   183,   178,   212,   212,   193,   122,   169,   185,
     118,   118,   123,   212,   141,   141,   141,   192,   192,   141,
     118,   122,   169,   122,   122,   169,   118,   122,   122,   169,
     137,   117,   117,   117,   223,   117,   143,   139,   139,   139,
     168,   143,   137,   139,   139,   175,   176,   207,   170,   226,
     170,   223,   141,   139,   192,   192,   210,   118,   117,   118,
     123,   181,    69,    70,   141,   140,   140,   143,   143,   186,
     118,   141,   249,   212,   198,   169,   212,   122,   122,   143,
     141,   141,   122,   122,   137,   223,   168,   168,   118,   168,
      56,   118,   230,   139,   139,   138,   223,   123,   139,   138,
     141,   141,   168,   118,   181,   229,   229,    69,    70,   141,
      69,    70,   141,   140,   141,   137,   223,   118,   118,   223,
     118,   117,   223,   118,   230,   169,   176,   140,   166,   220,
     118,    70,   141,    69,   141,   229,   229,   229,   229,    69,
      70,   141,   169,   223,   223,   223,   168,   223,   118,   168,
     139,   220,   222,   229,   229,    70,   141,    69,   141,    70,
     141,    69,   141,   229,   229,    64,   118,   223,   118,   123,
     141,   141,   141,   229,   229,   229,   229,    70,   141,    69,
     141,   223,   139,   223,   141,   220,   141,   141,   141,   141,
     229,   229,   141,   141
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
      case 143: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 153 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3397 "expression.ec"
	break;
      case 144: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3406 "expression.ec"
	break;
      case 147: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3415 "expression.ec"
	break;
      case 149: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3424 "expression.ec"
	break;
      case 151: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3433 "expression.ec"
	break;
      case 154: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3442 "expression.ec"
	break;
      case 155: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3451 "expression.ec"
	break;
      case 156: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3460 "expression.ec"
	break;
      case 157: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3469 "expression.ec"
	break;
      case 158: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3478 "expression.ec"
	break;
      case 159: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3487 "expression.ec"
	break;
      case 160: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3496 "expression.ec"
	break;
      case 161: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3505 "expression.ec"
	break;
      case 162: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3514 "expression.ec"
	break;
      case 163: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3523 "expression.ec"
	break;
      case 164: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3532 "expression.ec"
	break;
      case 165: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3541 "expression.ec"
	break;
      case 166: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3550 "expression.ec"
	break;
      case 168: /* "expression" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3559 "expression.ec"
	break;
      case 169: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3568 "expression.ec"
	break;
      case 170: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3577 "expression.ec"
	break;
      case 171: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3586 "expression.ec"
	break;
      case 172: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3595 "expression.ec"
	break;
      case 175: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3604 "expression.ec"
	break;
      case 176: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3613 "expression.ec"
	break;
      case 177: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3622 "expression.ec"
	break;
      case 178: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3631 "expression.ec"
	break;
      case 180: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3640 "expression.ec"
	break;
      case 181: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3649 "expression.ec"
	break;
      case 182: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3658 "expression.ec"
	break;
      case 183: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3667 "expression.ec"
	break;
      case 184: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3676 "expression.ec"
	break;
      case 185: /* "type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3685 "expression.ec"
	break;
      case 186: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3694 "expression.ec"
	break;
      case 187: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3703 "expression.ec"
	break;
      case 188: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3712 "expression.ec"
	break;
      case 189: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3721 "expression.ec"
	break;
      case 190: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3730 "expression.ec"
	break;
      case 192: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3739 "expression.ec"
	break;
      case 193: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3748 "expression.ec"
	break;
      case 194: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3757 "expression.ec"
	break;
      case 195: /* "property" */

/* Line 1009 of yacc.c  */
#line 186 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3766 "expression.ec"
	break;
      case 196: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3775 "expression.ec"
	break;
      case 197: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3784 "expression.ec"
	break;
      case 198: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3793 "expression.ec"
	break;
      case 199: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3802 "expression.ec"
	break;
      case 200: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3811 "expression.ec"
	break;
      case 201: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3820 "expression.ec"
	break;
      case 202: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3829 "expression.ec"
	break;
      case 203: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3838 "expression.ec"
	break;
      case 204: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3847 "expression.ec"
	break;
      case 205: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3856 "expression.ec"
	break;
      case 206: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3865 "expression.ec"
	break;
      case 207: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3874 "expression.ec"
	break;
      case 208: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3883 "expression.ec"
	break;
      case 209: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3892 "expression.ec"
	break;
      case 210: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3901 "expression.ec"
	break;
      case 211: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3910 "expression.ec"
	break;
      case 212: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3919 "expression.ec"
	break;
      case 213: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3928 "expression.ec"
	break;
      case 214: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3937 "expression.ec"
	break;
      case 215: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3946 "expression.ec"
	break;
      case 216: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3955 "expression.ec"
	break;
      case 217: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3964 "expression.ec"
	break;
      case 218: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3973 "expression.ec"
	break;
      case 219: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3982 "expression.ec"
	break;
      case 220: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3991 "expression.ec"
	break;
      case 221: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4000 "expression.ec"
	break;
      case 222: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4009 "expression.ec"
	break;
      case 223: /* "statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4018 "expression.ec"
	break;
      case 224: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4027 "expression.ec"
	break;
      case 225: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4036 "expression.ec"
	break;
      case 226: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4045 "expression.ec"
	break;
      case 227: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4054 "expression.ec"
	break;
      case 228: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4063 "expression.ec"
	break;
      case 229: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4072 "expression.ec"
	break;
      case 230: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4081 "expression.ec"
	break;
      case 231: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4090 "expression.ec"
	break;
      case 232: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4099 "expression.ec"
	break;
      case 233: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4108 "expression.ec"
	break;
      case 234: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4117 "expression.ec"
	break;
      case 235: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4126 "expression.ec"
	break;
      case 236: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4135 "expression.ec"
	break;
      case 238: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4144 "expression.ec"
	break;
      case 239: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4153 "expression.ec"
	break;
      case 240: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4162 "expression.ec"
	break;
      case 241: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4171 "expression.ec"
	break;
      case 242: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4180 "expression.ec"
	break;
      case 243: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4189 "expression.ec"
	break;
      case 244: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4198 "expression.ec"
	break;
      case 245: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4207 "expression.ec"
	break;
      case 246: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4216 "expression.ec"
	break;
      case 247: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4225 "expression.ec"
	break;
      case 248: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4234 "expression.ec"
	break;
      case 249: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4243 "expression.ec"
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
#line 212 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 218 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 223 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 225 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 227 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 229 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 230 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 231 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 233 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 238 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 239 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 243 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 247 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 252 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 253 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 254 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 255 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 257 "expression.y"
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

  case 28:

/* Line 1464 of yacc.c  */
#line 269 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 270 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 271 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 277 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 278 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 279 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 280 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 282 "expression.y"
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

  case 37:

/* Line 1464 of yacc.c  */
#line 294 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 295 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 296 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 300 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 301 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 302 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 303 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 307 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 308 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 309 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 310 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 311 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 312 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 313 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 314 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 315 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 329 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 330 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 331 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 332 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 333 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 334 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 335 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 345 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 346 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 347 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 352 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 353 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 358 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 359 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 364 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 365 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 366 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 367 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 372 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 373 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 378 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 383 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 388 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 393 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 398 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 403 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 408 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 410 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 415 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 416 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 417 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 418 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 419 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 420 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 421 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 422 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 423 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 424 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 429 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 438 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 439 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 440 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 441 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 445 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 446 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 447 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 448 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 449 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 450 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 451 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 452 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 459 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 460 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 461 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 462 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 463 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 464 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 465 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 470 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 471 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 472 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 473 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 474 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 475 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 476 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 477 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 482 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 483 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 484 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 485 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 486 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 487 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 488 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 489 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 490 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 494 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 495 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 499 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 500 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 504 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 505 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 506 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 507 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 508 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 512 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 513 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 517 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 518 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 519 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 524 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 525 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 526 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 527 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 528 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 532 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 533 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 537 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 538 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 539 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 543 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 544 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 548 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 549 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 550 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 554 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 579 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 583 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 584 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 585 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 586 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 587 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 588 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 589 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 590 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 591 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 592 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 593 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 594 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 595 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 596 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 601 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 610 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 611 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 636 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 650 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 656 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 661 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 662 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 666 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 670 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 671 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 676 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 678 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 680 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 682 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 684 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 687 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 693 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 695 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 698 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 709 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 711 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 721 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 723 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 725 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 727 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 733 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 740 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 742 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 744 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 746 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 748 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 752 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 753 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 758 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 760 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 761 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 762 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 767 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 769 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 774 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 776 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 782 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 784 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 786 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 788 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 790 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 792 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 794 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 796 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 798 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 800 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 802 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 811 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 813 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 815 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 819 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 821 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 823 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 831 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 833 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 881 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 883 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 889 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 891 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 893 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 895 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 897 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 903 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 906 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 908 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 910 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 918 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 920 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 929 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 931 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 933 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 937 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 938 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 942 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 943 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 945 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 950 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 954 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 959 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 960 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 961 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 965 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 966 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 970 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 971 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 981 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 983 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 985 "expression.y"
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

  case 359:

/* Line 1464 of yacc.c  */
#line 1000 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1002 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1023 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1025 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1039 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1041 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1043 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1047 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1048 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1052 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1056 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1060 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1061 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1066 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1071 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1079 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1083 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1084 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1088 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1089 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1095 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1096 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1097 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1100 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1105 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1108 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1109 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1113 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1125 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1127 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1129 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1131 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1136 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1138 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1143 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1145 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1150 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1155 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1160 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1162 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1167 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1169 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1171 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1173 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1175 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1181 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1186 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1190 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1191 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1196 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1198 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1203 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1207 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1208 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1209 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1210 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1211 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1212 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1217 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1222 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7364 "expression.ec"
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
#line 1224 "expression.y"


