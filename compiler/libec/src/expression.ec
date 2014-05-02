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
     RESTRICT = 371,
     THREAD = 372
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
#line 296 "expression.ec"
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
#line 321 "expression.ec"

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
#define YYLAST   7619

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  143
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  109
/* YYNRULES -- Number of rules.  */
#define YYNRULES  437
/* YYNRULES -- Number of states.  */
#define YYNSTATES  765

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
       2,     2,     2,   130,     2,     2,   120,   132,   125,     2,
     118,   119,   126,   127,   124,   128,   121,   131,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   138,   140,
     133,   139,   134,   137,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   122,     2,   123,   135,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   141,   136,   142,   129,     2,     2,     2,
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
     516,   518,   520,   522,   524,   529,   531,   534,   538,   545,
     551,   553,   555,   557,   559,   561,   563,   565,   567,   569,
     571,   573,   575,   577,   579,   581,   583,   585,   587,   589,
     591,   593,   595,   597,   602,   604,   606,   608,   610,   612,
     614,   616,   618,   620,   622,   624,   626,   628,   630,   632,
     634,   636,   638,   643,   645,   651,   656,   661,   665,   671,
     678,   684,   690,   695,   702,   705,   708,   712,   716,   718,
     720,   722,   725,   729,   731,   735,   745,   755,   763,   771,
     777,   788,   799,   808,   817,   824,   833,   842,   849,   856,
     861,   871,   881,   889,   897,   903,   907,   910,   913,   916,
     918,   921,   923,   925,   927,   931,   933,   936,   939,   943,
     949,   952,   955,   960,   966,   974,   982,   988,   990,   994,
     996,  1000,  1004,  1007,  1011,  1015,  1019,  1024,  1029,  1032,
    1036,  1040,  1045,  1049,  1052,  1056,  1060,  1065,  1067,  1069,
    1072,  1075,  1078,  1082,  1084,  1086,  1089,  1092,  1095,  1099,
    1101,  1104,  1108,  1110,  1114,  1119,  1123,  1128,  1130,  1133,
    1136,  1140,  1144,  1146,  1148,  1151,  1154,  1157,  1161,  1165,
    1168,  1170,  1173,  1175,  1178,  1181,  1185,  1187,  1191,  1193,
    1197,  1200,  1203,  1205,  1207,  1211,  1213,  1216,  1218,  1222,
    1227,  1229,  1231,  1233,  1237,  1239,  1241,  1243,  1245,  1247,
    1249,  1253,  1258,  1262,  1264,  1267,  1269,  1272,  1275,  1277,
    1279,  1282,  1284,  1287,  1291,  1293,  1296,  1302,  1310,  1316,
    1322,  1330,  1337,  1345,  1350,  1356,  1361,  1365,  1368,  1371,
    1374,  1378,  1380,  1386,  1391,  1396,  1400,  1405,  1409,  1413,
    1416,  1419,  1421,  1425,  1430,  1434,  1437,  1440,  1443,  1446,
    1449,  1452,  1455,  1458,  1462,  1464,  1466,  1470,  1473,  1475,
    1477,  1480,  1483,  1485,  1488,  1490,  1492,  1495
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     251,     0,    -1,     3,    -1,   146,    -1,   118,   169,   119,
      -1,   144,    -1,   237,    -1,     4,    -1,   235,    -1,   120,
     235,    -1,   120,   235,   121,   235,    -1,   118,   119,    -1,
      71,   173,   207,   122,   170,   123,    -1,    71,   173,   122,
     170,   123,    -1,   102,   173,   207,   122,   170,   123,    -1,
     102,   173,   122,   170,   123,    -1,    72,   170,   175,   207,
     122,   170,   123,    -1,    72,   170,   175,   122,   170,   123,
      -1,   103,   170,   175,   207,   122,   170,   123,    -1,   103,
     170,   175,   122,   170,   123,    -1,     1,    -1,   238,    -1,
     145,    -1,   148,   122,   169,   123,    -1,   148,   118,   119,
      -1,   148,   118,   150,   119,    -1,   148,   121,   144,    -1,
     148,   144,    -1,   148,     7,   144,    -1,   148,     8,    -1,
     148,     9,    -1,   146,    -1,   149,   122,   169,   123,    -1,
     149,   118,   119,    -1,   149,   118,   150,   119,    -1,   149,
     121,   144,    -1,   149,   144,    -1,   149,     7,   144,    -1,
     149,     8,    -1,   149,     9,    -1,   167,    -1,   147,    -1,
     150,   124,   167,    -1,   150,   124,   147,    -1,     8,   152,
      -1,     9,   152,    -1,   154,   155,    -1,     6,   118,   152,
     119,    -1,     6,   153,    -1,     6,   118,   220,   119,    -1,
     109,   118,   152,   119,    -1,   109,   153,    -1,   109,   118,
     220,   119,    -1,   151,    -1,   148,    -1,   151,    -1,   149,
      -1,   125,    -1,   126,    -1,   127,    -1,   128,    -1,   129,
      -1,   130,    -1,    73,    -1,   152,    -1,   118,   220,   119,
     155,    -1,   155,    -1,   156,   126,   155,    -1,   156,   131,
     155,    -1,   156,   132,   155,    -1,   156,    -1,   157,   127,
     156,    -1,   157,   128,   156,    -1,   157,    -1,   158,    10,
     157,    -1,   158,    11,   157,    -1,   158,    -1,   159,   133,
     158,    -1,   159,   134,   158,    -1,   159,    12,   158,    -1,
     159,    13,   158,    -1,   159,    -1,   160,    14,   159,    -1,
     160,    15,   159,    -1,   160,    -1,   161,   125,   160,    -1,
     161,    -1,   162,   135,   161,    -1,   162,    -1,   163,   136,
     162,    -1,   163,    -1,   164,    16,   163,    -1,   164,    -1,
     165,    17,   164,    -1,   165,    -1,   165,   137,   169,   138,
     166,    -1,   166,    -1,   152,   168,   167,    -1,   152,   168,
     147,    -1,   139,    -1,    18,    -1,    19,    -1,    20,    -1,
      21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,    -1,
      26,    -1,    27,    -1,   167,    -1,   169,   124,   167,    -1,
     166,    -1,   173,   140,    -1,   173,   176,   140,    -1,   236,
     140,    -1,    77,   144,   139,   170,   140,    -1,   185,    -1,
     172,   185,    -1,   188,    -1,   172,   188,    -1,   201,    -1,
     172,   201,    -1,   190,    -1,   172,   190,    -1,   178,    -1,
     173,   178,    -1,   185,    -1,   173,   185,    -1,   188,    -1,
     173,   188,    -1,   201,    -1,   173,   201,    -1,   190,    -1,
     173,   190,    -1,   178,    -1,   174,   178,    -1,   185,    -1,
     174,   185,    -1,   188,    -1,   174,   188,    -1,   186,    -1,
     174,   186,    -1,   178,    -1,   175,   178,    -1,   185,    -1,
     175,   185,    -1,   189,    -1,   175,   189,    -1,   190,    -1,
     175,   190,    -1,   201,    -1,   175,   201,    -1,   177,    -1,
     176,   124,   177,    -1,   208,    -1,   208,   139,   221,    -1,
      29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,    -1,
     117,    -1,    74,    -1,   184,    -1,    79,    -1,   110,    -1,
     111,    -1,     3,    -1,    28,    -1,    75,    -1,    74,    -1,
      44,    -1,   181,    -1,   181,   118,   169,   119,    -1,   182,
      -1,   183,   182,    -1,   183,   124,   182,    -1,   180,   118,
     118,   183,   119,   119,    -1,   180,   118,   118,   119,   119,
      -1,    44,    -1,    45,    -1,    75,    -1,   187,    -1,    28,
      -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,
      -1,    40,    -1,    41,    -1,    85,    -1,   113,    -1,   112,
      -1,   191,    -1,   200,    -1,   186,    -1,   100,   118,   186,
     119,    -1,    66,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,   113,    -1,
     112,    -1,   191,    -1,   200,    -1,   187,    -1,   100,   118,
     186,   119,    -1,    66,    -1,   192,   144,   141,   193,   142,
      -1,   192,   141,   193,   142,    -1,   192,   144,   141,   142,
      -1,   192,   141,   142,    -1,   192,   187,   141,   193,   142,
      -1,   192,   179,   144,   141,   193,   142,    -1,   192,   179,
     141,   193,   142,    -1,   192,   179,   144,   141,   142,    -1,
     192,   179,   141,   142,    -1,   192,   179,   187,   141,   193,
     142,    -1,   192,   144,    -1,   192,   187,    -1,   192,   179,
     144,    -1,   192,   179,   187,    -1,    48,    -1,    49,    -1,
     197,    -1,   193,   197,    -1,   148,   139,   222,    -1,   194,
      -1,   195,   124,   194,    -1,    68,   174,   144,   141,    69,
     230,    70,   230,   142,    -1,    68,   174,   144,   141,    70,
     230,    69,   230,   142,    -1,    68,   174,   144,   141,    69,
     230,   142,    -1,    68,   174,   144,   141,    70,   230,   142,
      -1,    68,   174,   144,   141,   142,    -1,    68,   174,   206,
     144,   141,    69,   230,    70,   230,   142,    -1,    68,   174,
     206,   144,   141,    70,   230,    69,   230,   142,    -1,    68,
     174,   206,   144,   141,    69,   230,   142,    -1,    68,   174,
     206,   144,   141,    70,   230,   142,    -1,    68,   174,   206,
     144,   141,   142,    -1,    68,   174,   141,    69,   230,    70,
     230,   142,    -1,    68,   174,   141,    70,   230,    69,   230,
     142,    -1,    68,   174,   141,    69,   230,   142,    -1,    68,
     174,   141,    70,   230,   142,    -1,    68,   174,   141,   142,
      -1,    68,   174,   206,   141,    69,   230,    70,   230,   142,
      -1,    68,   174,   206,   141,    70,   230,    69,   230,   142,
      -1,    68,   174,   206,   141,    69,   230,   142,    -1,    68,
     174,   206,   141,    70,   230,   142,    -1,    68,   174,   206,
     141,   142,    -1,   173,   198,   140,    -1,   173,   140,    -1,
     237,   140,    -1,   236,   140,    -1,   243,    -1,   195,   140,
      -1,   196,    -1,   140,    -1,   199,    -1,   198,   124,   199,
      -1,   208,    -1,   208,   184,    -1,   138,   170,    -1,   208,
     138,   170,    -1,   208,   138,   170,   138,   170,    -1,    50,
     144,    -1,    50,   187,    -1,    50,   141,   202,   142,    -1,
      50,   144,   141,   202,   142,    -1,    50,   144,   141,   202,
     140,   193,   142,    -1,    50,   187,   141,   202,   140,   193,
     142,    -1,    50,   187,   141,   202,   142,    -1,   203,    -1,
     202,   124,   203,    -1,   144,    -1,   144,   139,   170,    -1,
     118,   206,   119,    -1,   122,   123,    -1,   122,   170,   123,
      -1,   122,   186,   123,    -1,   204,   122,   123,    -1,   204,
     122,   170,   123,    -1,   204,   122,   186,   123,    -1,   118,
     119,    -1,   118,   216,   119,    -1,   204,   118,   119,    -1,
     204,   118,   216,   119,    -1,   118,   207,   119,    -1,   118,
     119,    -1,   118,   216,   119,    -1,   205,   118,   119,    -1,
     205,   118,   216,   119,    -1,   215,    -1,   204,    -1,   215,
     204,    -1,   179,   215,    -1,   179,   204,    -1,   179,   215,
     204,    -1,   215,    -1,   205,    -1,   215,   205,    -1,   179,
     215,    -1,   179,   205,    -1,   179,   215,   205,    -1,   211,
      -1,   215,   211,    -1,   179,   215,   211,    -1,   144,    -1,
     118,   208,   119,    -1,   209,   122,   170,   123,    -1,   209,
     122,   123,    -1,   209,   122,   186,   123,    -1,   213,    -1,
     215,   213,    -1,   179,   213,    -1,   179,   215,   213,    -1,
     215,   179,   213,    -1,   213,    -1,   209,    -1,   179,   213,
      -1,   179,   209,    -1,   209,   118,    -1,   212,   216,   119,
      -1,   212,   219,   119,    -1,   212,   119,    -1,   185,    -1,
     214,   185,    -1,   126,    -1,   126,   214,    -1,   126,   215,
      -1,   126,   214,   215,    -1,   217,    -1,   217,   124,    51,
      -1,   218,    -1,   217,   124,   218,    -1,   173,   208,    -1,
     173,   206,    -1,   173,    -1,   144,    -1,   219,   124,   144,
      -1,   172,    -1,   172,   206,    -1,   167,    -1,   141,   223,
     142,    -1,   141,   223,   124,   142,    -1,   166,    -1,   147,
      -1,   221,    -1,   223,   124,   221,    -1,   225,    -1,   230,
      -1,   231,    -1,   232,    -1,   233,    -1,   234,    -1,   144,
     138,   224,    -1,    52,   170,   138,   224,    -1,    53,   138,
     224,    -1,   171,    -1,   226,   171,    -1,   224,    -1,   227,
     224,    -1,   227,   171,    -1,   227,    -1,   226,    -1,   226,
     227,    -1,   141,    -1,   141,   142,    -1,   229,   228,   142,
      -1,   140,    -1,   169,   140,    -1,    54,   118,   169,   119,
     224,    -1,    54,   118,   169,   119,   224,    64,   224,    -1,
      55,   118,   169,   119,   224,    -1,    56,   118,   169,   119,
     224,    -1,    57,   224,    56,   118,   169,   119,   140,    -1,
      58,   118,   231,   231,   119,   224,    -1,    58,   118,   231,
     231,   169,   119,   224,    -1,    56,   118,   119,   224,    -1,
      58,   118,   231,   119,   224,    -1,    58,   118,   119,   224,
      -1,    59,   144,   140,    -1,    60,   140,    -1,    61,   140,
      -1,    62,   140,    -1,    62,   169,   140,    -1,     5,    -1,
     173,   144,   141,   250,   142,    -1,   173,   144,   141,   142,
      -1,   186,   141,   250,   142,    -1,   186,   141,   142,    -1,
     144,   141,   250,   142,    -1,   144,   141,   142,    -1,   141,
     250,   142,    -1,   141,   142,    -1,   173,   210,    -1,   210,
      -1,   173,   118,   119,    -1,   129,   173,   118,   119,    -1,
      78,   173,   210,    -1,    78,   210,    -1,   239,   230,    -1,
     242,   230,    -1,   242,   140,    -1,   240,   230,    -1,   241,
     230,    -1,   173,   210,    -1,   244,   230,    -1,   148,   139,
     222,    -1,   222,    -1,   246,    -1,   247,   124,   246,    -1,
     247,   140,    -1,   248,    -1,   245,    -1,   249,   248,    -1,
     249,   245,    -1,   140,    -1,   249,   140,    -1,   249,    -1,
     247,    -1,   249,   247,    -1,   167,    -1
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
     507,   508,   509,   513,   514,   518,   519,   520,   525,   526,
     527,   528,   529,   533,   534,   538,   539,   540,   544,   545,
     549,   550,   551,   555,   580,   584,   585,   586,   587,   588,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   603,   607,   608,   609,   610,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   620,   621,
     622,   623,   624,   625,   630,   631,   632,   633,   634,   637,
     638,   639,   640,   641,   646,   647,   650,   652,   657,   658,
     662,   663,   667,   671,   672,   676,   678,   680,   682,   684,
     687,   689,   691,   693,   695,   698,   700,   702,   704,   706,
     709,   711,   713,   715,   717,   722,   723,   724,   725,   726,
     727,   728,   729,   733,   735,   740,   742,   744,   746,   748,
     753,   754,   758,   760,   761,   762,   763,   767,   769,   774,
     776,   782,   784,   786,   788,   790,   792,   794,   796,   798,
     800,   802,   807,   809,   811,   813,   815,   820,   821,   822,
     823,   824,   825,   829,   830,   831,   832,   833,   834,   880,
     881,   883,   889,   891,   893,   895,   897,   902,   903,   906,
     908,   910,   916,   917,   918,   920,   925,   929,   931,   933,
     938,   939,   943,   944,   945,   946,   950,   951,   955,   956,
     960,   961,   962,   966,   967,   971,   972,   981,   983,   985,
    1001,  1002,  1023,  1025,  1030,  1031,  1032,  1033,  1034,  1035,
    1039,  1041,  1043,  1048,  1049,  1053,  1054,  1057,  1061,  1062,
    1063,  1067,  1071,  1079,  1084,  1085,  1089,  1090,  1091,  1095,
    1096,  1097,  1098,  1100,  1101,  1102,  1106,  1107,  1108,  1109,
    1110,  1114,  1118,  1120,  1125,  1127,  1129,  1131,  1136,  1138,
    1143,  1145,  1150,  1155,  1160,  1162,  1167,  1169,  1171,  1173,
    1175,  1181,  1186,  1191,  1192,  1196,  1198,  1203,  1208,  1209,
    1210,  1211,  1212,  1213,  1217,  1218,  1219,  1223
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
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "THREAD", "'('", "')'",
  "'$'", "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'", "'~'",
  "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='",
  "';'", "'{'", "'}'", "$accept", "identifier", "primary_expression",
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
     365,   366,   367,   368,   369,   370,   371,   372,    40,    41,
      36,    46,    91,    93,    44,    38,    42,    43,    45,   126,
      33,    47,    37,    60,    62,    94,   124,    63,    58,    61,
      59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   143,   144,   145,   145,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   147,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   149,   149,   149,   149,   149,   149,   149,   149,   149,
     150,   150,   150,   150,   151,   151,   151,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   154,   154,   154,
     154,   154,   154,   154,   155,   155,   156,   156,   156,   156,
     157,   157,   157,   158,   158,   158,   159,   159,   159,   159,
     159,   160,   160,   160,   161,   161,   162,   162,   163,   163,
     164,   164,   165,   165,   166,   166,   167,   167,   167,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     169,   169,   170,   171,   171,   171,   171,   172,   172,   172,
     172,   172,   172,   172,   172,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   173,   174,   174,   174,   174,   174,
     174,   174,   174,   175,   175,   175,   175,   175,   175,   175,
     175,   175,   175,   176,   176,   177,   177,   178,   178,   178,
     178,   178,   178,   179,   179,   180,   180,   180,   181,   181,
     181,   181,   181,   182,   182,   183,   183,   183,   184,   184,
     185,   185,   185,   186,   187,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   191,   191,   191,   191,   192,   192,
     193,   193,   194,   195,   195,   196,   196,   196,   196,   196,
     196,   196,   196,   196,   196,   196,   196,   196,   196,   196,
     196,   196,   196,   196,   196,   197,   197,   197,   197,   197,
     197,   197,   197,   198,   198,   199,   199,   199,   199,   199,
     200,   200,   201,   201,   201,   201,   201,   202,   202,   203,
     203,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   205,   205,   205,   205,   205,   206,   206,   206,
     206,   206,   206,   207,   207,   207,   207,   207,   207,   208,
     208,   208,   209,   209,   209,   209,   209,   210,   210,   210,
     210,   210,   211,   211,   211,   211,   212,   213,   213,   213,
     214,   214,   215,   215,   215,   215,   216,   216,   217,   217,
     218,   218,   218,   219,   219,   220,   220,   221,   221,   221,
     222,   222,   223,   223,   224,   224,   224,   224,   224,   224,
     225,   225,   225,   226,   226,   227,   227,   227,   228,   228,
     228,   229,   230,   230,   231,   231,   232,   232,   232,   233,
     233,   233,   233,   233,   233,   233,   234,   234,   234,   234,
     234,   235,   236,   236,   237,   237,   237,   237,   238,   238,
     239,   239,   240,   241,   242,   242,   243,   243,   243,   243,
     243,   244,   245,   246,   246,   247,   247,   248,   249,   249,
     249,   249,   249,   249,   250,   250,   250,   251
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
       1,     1,     1,     1,     4,     1,     2,     3,     6,     5,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     5,     4,     4,     3,     5,     6,
       5,     5,     4,     6,     2,     2,     3,     3,     1,     1,
       1,     2,     3,     1,     3,     9,     9,     7,     7,     5,
      10,    10,     8,     8,     6,     8,     8,     6,     6,     4,
       9,     9,     7,     7,     5,     3,     2,     2,     2,     1,
       2,     1,     1,     1,     3,     1,     2,     2,     3,     5,
       2,     2,     4,     5,     7,     7,     5,     1,     3,     1,
       3,     3,     2,     3,     3,     3,     4,     4,     2,     3,
       3,     4,     3,     2,     3,     3,     4,     1,     1,     2,
       2,     2,     3,     1,     1,     2,     2,     2,     3,     1,
       2,     3,     1,     3,     4,     3,     4,     1,     2,     2,
       3,     3,     1,     1,     2,     2,     2,     3,     3,     2,
       1,     2,     1,     2,     2,     3,     1,     3,     1,     3,
       2,     2,     1,     1,     3,     1,     2,     1,     3,     4,
       1,     1,     1,     3,     1,     1,     1,     1,     1,     1,
       3,     4,     3,     1,     2,     1,     2,     2,     1,     1,
       2,     1,     2,     3,     1,     2,     5,     7,     5,     5,
       7,     6,     7,     4,     5,     4,     3,     2,     2,     2,
       3,     1,     5,     4,     4,     3,     4,     3,     3,     2,
       2,     1,     3,     4,     3,     2,     2,     2,     2,     2,
       2,     2,     2,     3,     1,     1,     3,     2,     1,     1,
       2,     2,     1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    20,     2,     7,   401,     0,     0,     0,   184,     0,
       0,    63,     0,     0,     0,     0,     0,    57,    58,    59,
      60,    61,    62,     5,    22,     3,    54,    53,    64,     0,
      66,    70,    73,    76,    81,    84,    86,    88,    90,    92,
      94,    96,   437,     0,   183,     8,     6,     0,     0,    31,
      56,    55,    48,     0,    44,    45,   157,   158,   159,   160,
     161,   186,   187,   188,   189,   190,   192,   195,   196,   193,
     194,   180,   181,   185,   191,   238,   239,     0,   204,   182,
     197,     0,   199,   198,   162,     0,   125,   127,   202,   129,
     133,   200,     0,   201,   131,    64,   112,     0,     0,     0,
       0,    51,    11,   110,     0,   355,   117,   202,   119,   123,
     121,     0,     9,     0,     0,    29,    30,     0,     0,     0,
      27,   100,   101,   102,   103,   104,   105,   106,   107,   108,
     109,    99,     0,    46,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,     0,     0,     0,    38,    39,
       0,     0,     0,    36,     0,   280,   281,     0,   163,   165,
     166,   167,     0,     0,   342,   126,     0,     0,   164,   128,
     130,   134,   132,   314,     0,   313,     0,   234,     0,   235,
     206,   207,   208,   209,   210,   212,   215,   216,   213,   214,
     205,   211,   223,     0,   218,   217,     0,   143,   145,   221,
     147,   149,   219,   220,   151,     0,     0,     0,     0,     0,
       4,     0,     0,     0,     0,   118,   120,   124,   122,   308,
     356,   307,     0,     0,   432,     0,   407,   361,    54,   360,
       0,   424,    21,     0,   429,   425,   435,   428,     0,     0,
      28,    24,    41,     0,    40,    26,     0,    98,    97,    67,
      68,    69,    71,    72,    74,    75,    79,    80,    77,    78,
      82,    83,    85,    87,    89,    91,    93,     0,   405,     0,
      47,    49,    37,    33,     0,    35,     0,   289,     0,   287,
       0,     0,     0,   303,   352,     0,     0,   346,   348,     0,
     340,   343,   344,   317,   316,     0,     0,     0,   315,     0,
       0,     0,     0,   272,   227,     5,     0,     0,     0,     0,
     243,     0,   271,   240,     0,   411,     0,   327,     0,     0,
       6,     0,     0,     0,     0,   269,     0,     0,   236,   237,
       0,     0,     0,   144,   146,   148,   150,   152,     0,     0,
       0,     0,     0,    50,    52,   111,   298,     0,     0,   292,
       0,     0,   311,   310,     0,     0,   309,    65,    10,   409,
       0,     0,     0,   322,   421,   381,     0,   422,     0,   427,
     433,   431,   436,   430,   406,    25,     0,    23,     0,   404,
      34,    32,     0,     0,   282,     0,     0,   203,     0,     0,
     351,   350,   333,   319,   332,   307,   302,   304,     0,    13,
     341,   345,   318,     0,   305,     0,     0,     0,     0,   135,
     137,   141,   139,     0,     0,   415,     0,    58,     0,     0,
       0,     0,     0,     0,     0,   266,   322,     0,     0,   273,
     275,   410,   332,     0,   329,     0,   225,   241,     0,   270,
     336,     0,   339,   353,     0,     0,     0,   328,   268,   267,
     416,   419,   420,   418,   417,   226,     0,   232,     0,     0,
       0,     0,     0,     0,     0,    15,     0,     0,     0,   291,
     299,   293,   294,   312,   300,     0,   295,     0,     0,   408,
     423,   382,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   384,     5,     0,   373,     0,   375,
     364,     0,     0,     0,   365,   366,   367,   368,   369,     0,
     426,    43,    42,    95,   290,   288,     0,   283,     0,   286,
     335,   334,   310,     0,   320,   347,   349,   168,   169,   172,
     171,   170,     0,   173,   175,     0,   306,    12,   280,   281,
       0,     0,   136,   138,   142,   140,     0,   234,     0,   235,
     414,     0,   323,     0,   242,   412,   277,     0,   334,     0,
       0,   265,     0,   276,     0,   332,   330,   244,   325,     0,
       0,   337,   338,     0,   331,   224,   230,   231,     0,     0,
     228,   222,    17,     0,    14,    19,     0,   301,   296,   297,
       0,     0,     0,     0,     0,     0,     0,     0,   397,   398,
     399,     0,     0,     0,   385,   113,     0,   153,   155,   374,
       0,   377,   376,   383,   115,     0,     0,   321,   179,     0,
       0,     0,   176,     0,     0,   259,     0,     0,     0,   236,
     237,   413,   403,     0,   332,   274,   278,   334,   324,   326,
     354,   229,   233,    16,    18,     0,   372,     0,     0,     0,
       0,     0,     0,     0,   396,   400,     0,   370,     0,   114,
       0,   284,   285,     0,   178,   177,     0,     0,     0,     0,
     249,     0,     0,   264,     0,   402,     0,   371,     0,     0,
     393,     0,     0,   395,     0,     0,     0,   154,     0,   357,
     156,   174,     0,   257,     0,   258,     0,     0,     0,     0,
       0,     0,   254,   279,   386,   388,   389,     0,   394,     0,
       0,   116,   362,     0,     0,     0,     0,   247,     0,   248,
       0,   262,     0,   263,     0,     0,     0,     0,   391,     0,
       0,   358,   255,   256,     0,     0,     0,     0,     0,   252,
       0,   253,   387,   390,   392,   359,   363,   245,   246,   260,
     261,     0,     0,   250,   251
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    23,    24,    25,   237,    26,    50,   253,    27,    95,
      52,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,   103,   132,   506,    97,   621,   105,
     317,   418,   206,   616,   617,    86,   318,   177,   543,   544,
     545,   178,    87,    43,    44,    89,   210,    90,    91,    92,
     319,   320,   321,   322,   323,   438,   439,    93,    94,   288,
     289,   229,   183,   357,   184,   429,   324,   325,   403,   326,
     327,   301,   328,   358,   297,   298,   455,   111,   700,   241,
     723,   509,   510,   511,   512,   513,   376,   514,   515,   516,
     517,   518,    45,   329,    46,   242,   331,   332,   333,   334,
     335,   243,   244,   245,   246,   247,   248,   249,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -632
static const yytype_int16 yypact[] =
{
    5736,  -632,  -632,  -632,  -632,  5749,  5809,  5809,  -632,  7322,
    5736,  -632,  7322,  5736,  5822,  5241,    73,  -632,  -632,  -632,
    -632,  -632,  -632,   -20,  -632,  -632,   554,  -632,   249,  5736,
    -632,   327,   254,   391,    78,   426,    16,    46,    47,   221,
      21,  -632,  -632,   111,  -632,  -632,  -632,   240,  5371,  -632,
     575,  -632,  -632,  5457,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,  -632,  -632,  -632,  -632,  -632,    15,  -632,  -632,
    -632,   136,  -632,  -632,  -632,  6413,  -632,  -632,  -632,  -632,
    -632,  -632,   171,  -632,  -632,  -632,  -632,  7502,  6512,  7502,
    5371,  -632,  -632,  -632,   -44,  6858,  -632,   111,  -632,  -632,
    -632,   159,   214,  1919,   334,  -632,  -632,  4202,   334,  5736,
    -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,  4332,  -632,  5736,  5736,  5736,  5736,  5736,  5736,
    5736,  5736,  5736,  5736,  5736,  5736,  5736,  5736,  5736,  5736,
    5736,  5736,  5736,  2049,  -632,   227,   233,   334,  -632,  -632,
    4243,   334,  5736,  -632,   334,   223,   229,   355,  -632,  -632,
    -632,  -632,  6611,  5736,   161,  -632,   -41,   295,  -632,  -632,
    -632,  -632,  -632,   315,   250,   319,  2557,   262,    27,   306,
    -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,  -632,   331,  -632,  -632,  6710,  -632,  -632,  -632,
    -632,  -632,  -632,  -632,  -632,  5736,   330,  6809,   341,   354,
    -632,  5736,  6314,  5530,   247,  -632,  -632,  -632,  -632,   297,
    -632,   309,  5736,    73,  -632,  2179,  -632,  -632,    57,  -632,
    6123,  -632,  -632,   339,  -632,  -632,    77,  -632,  2309,   340,
    -632,  -632,  -632,     3,  -632,  -632,   363,  -632,  -632,  -632,
    -632,  -632,   327,   327,   254,   254,   391,   391,   391,   391,
      78,    78,   426,    16,    46,    47,   221,   -50,  -632,   351,
    -632,  -632,  -632,  -632,   205,  -632,   376,   356,   -79,  -632,
     334,   334,   384,  -632,  6024,   396,   401,   398,  -632,   411,
    -632,   161,  -632,   315,   319,   409,  6957,  5736,   315,  7412,
    6123,  5444,  7322,  -632,  -632,   -20,   220,  4879,    66,  2675,
    -632,    85,  -632,  -632,   312,  -632,  6222,  -632,   288,   405,
     412,   339,   339,   339,   364,  -632,  2793,  2911,   403,   410,
    4491,   355,  5736,  -632,  -632,  -632,  -632,  -632,   431,   432,
    5736,  5736,   434,  -632,  -632,  -632,  -632,   435,   448,  -632,
     446,   -52,   297,   309,  7049,  5590,   297,  -632,  -632,  -632,
     429,  4332,   365,  -632,  -632,   437,  4037,  -632,  4332,  -632,
    -632,  -632,    77,  -632,  -632,  -632,  4332,  -632,  5736,  -632,
    -632,  -632,  5736,   334,  -632,   156,   164,  -632,  5925,    76,
    -632,  -632,   312,  -632,  -632,   344,  -632,  -632,  7232,  -632,
    -632,  -632,   315,   404,  -632,   457,   454,   215,  4763,  -632,
    -632,  -632,  -632,   485,  6123,  -632,  5111,   633,    66,   462,
     288,  7141,  4332,   422,  5736,  -632,   444,    66,    90,  -632,
      -9,  -632,   452,   288,  -632,    79,  -632,  -632,   710,  -632,
    -632,  5603,  -632,  -632,   468,   234,    79,  -632,  -632,  -632,
    -632,  -632,  -632,  -632,  -632,  -632,  3029,  -632,  3147,  3265,
    4491,  3383,   470,   471,  5736,  -632,   474,   475,  5736,  -632,
    -632,  -632,  -632,   297,  -632,   481,  -632,   482,   142,  -632,
    -632,  -632,  5736,   472,   491,   493,   494,  4167,   496,   334,
     476,   483,  4650,   334,  -632,   169,   173,  -632,  4992,  -632,
    -632,  1529,  1659,   479,  -632,  -632,  -632,  -632,  -632,   484,
    -632,  -632,  -632,  -632,  -632,  -632,  4491,  -632,  4491,  -632,
     312,  -632,   344,    79,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,   506,   508,  -632,   256,  -632,  -632,  -632,  -632,
      35,   487,  -632,  -632,  -632,  -632,    23,  -632,   215,  -632,
    -632,   288,  -632,   511,  -632,  -632,  -632,  2439,   490,   288,
     183,  -632,  5736,  -632,    79,   495,  -632,  -632,  -632,   509,
     162,  -632,  -632,   334,  -632,  -632,  -632,  -632,  3501,  3619,
    -632,  -632,  -632,   512,  -632,  -632,   514,  -632,  -632,  -632,
     503,  4167,  5736,  5736,  5663,   578,  4543,   510,  -632,  -632,
    -632,   178,   504,  4167,  -632,  -632,   204,  -632,   513,  -632,
    1789,  -632,  -632,  -632,  -632,  3737,  3855,  -632,  -632,  5736,
     532,   317,  -632,   339,   339,  -632,    65,   172,   519,  -632,
    -632,  -632,  -632,   525,   533,  -632,   515,   538,  -632,  -632,
    -632,  -632,  -632,  -632,  -632,  4167,  -632,   271,   285,  4167,
     293,   555,  4167,  4577,  -632,  -632,  5736,  -632,   365,  -632,
    4373,  -632,  -632,   326,  -632,  -632,   -36,   -34,   339,   339,
    -632,   339,   339,  -632,   194,  -632,  5736,  -632,  4167,  4167,
    -632,  4167,  5736,  -632,  4167,  5676,   541,  -632,  4373,  -632,
    -632,  -632,   339,  -632,   339,  -632,   -26,   -29,   -11,   -27,
     339,   339,  -632,  -632,   618,  -632,  -632,   348,  -632,  4167,
     350,  -632,  -632,   -48,   542,   545,   339,  -632,   339,  -632,
     339,  -632,   339,  -632,    29,   -22,  4167,   550,  -632,  4167,
    3907,  -632,  -632,  -632,   559,   560,   561,   563,   339,  -632,
     339,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,  -632,
    -632,   568,   574,  -632,  -632
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -632,   328,  -632,    67,  -109,    60,  -632,   557,   329,     0,
     704,  -632,   -24,   372,   379,   395,   397,   573,   576,   579,
     572,   580,  -632,   656,     1,  -632,   -12,    43,  -357,  -632,
      13,  -632,   624,  -632,    62,   719,    38,  -632,  -632,  -517,
    -632,   292,   978,   857,   -60,    39,    99,    -2,   -47,  -280,
    -279,   277,  -632,  -632,  -299,  -632,   165,   154,   134,   259,
     349,  -210,  -149,  -101,   -30,  -284,   982,  -224,  -381,  -632,
     868,  -632,   808,  -161,  -632,   342,  -632,    25,  -631,  -340,
    -632,   453,  -632,  -632,   226,  -632,  -632,   241,  -443,  -632,
    -632,  -632,    -7,  -364,   321,  -632,  -632,  -632,  -632,  -632,
    -632,  -632,   486,   369,   500,   501,  -632,  -151,  -632
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -435
static const yytype_int16 yytable[] =
{
      28,    42,   279,   104,   230,   133,    54,    55,   252,   112,
     401,   296,   519,   109,   362,    28,   374,   166,     2,   507,
     447,   366,    85,   257,   534,    98,     2,   303,   632,   423,
       2,   490,   189,   440,   702,   704,   308,   209,   151,   209,
     728,   104,   732,     8,   726,   393,   109,   750,   155,   534,
     212,   252,   212,    28,   108,     8,    99,   466,   468,   730,
       2,   471,   534,   394,   114,   115,   116,   722,   216,     2,
     169,   482,    49,   156,   221,   220,   740,   172,     4,     2,
     221,    49,     2,   181,   370,   174,   425,   108,   388,   153,
     141,   142,   564,   441,   741,   211,   181,   211,   109,   748,
     218,   170,   171,   227,   633,   634,   703,   256,   705,   756,
     259,   260,   261,   729,   675,   733,   727,    28,   254,    28,
     751,   113,   385,   176,   180,   219,   240,   386,   339,   572,
     188,   731,    28,   258,   678,   679,   176,   180,   423,   108,
     277,   147,   295,   224,   226,   415,   209,   519,   519,   110,
     286,   627,    28,   483,   619,   412,   164,   209,   152,   212,
      28,   254,    28,   663,   637,   454,   240,   447,   337,   447,
     212,   749,   447,   238,     2,   117,   348,   635,   118,   119,
     627,   148,   110,   149,   372,   294,     2,   352,   627,   362,
     588,   589,   174,   400,   398,   366,   371,   372,   223,     8,
     560,   378,   174,   485,   346,    71,    72,   680,   367,   448,
     176,   143,   144,   238,   570,   346,   299,   379,     2,   182,
     695,    28,   355,     2,   618,   449,   368,   114,   115,   116,
     571,   214,   182,   214,   110,   294,    79,   150,   181,   228,
     154,   681,   682,     8,   176,   168,   316,   625,   240,   626,
     169,   213,   153,   213,   167,   176,   519,   168,   349,   537,
     224,   240,   169,   710,   711,   599,   360,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,   521,   232,   180,
     393,   170,   171,   153,   538,   649,   440,   174,   393,   447,
     447,     2,   181,   170,   171,   238,   526,   221,   527,   104,
     539,   372,   221,   153,   528,   345,   529,   613,   238,   174,
     113,    28,   186,   614,   683,   181,   345,   556,   665,   294,
     537,   434,   483,   424,   390,   431,   447,   447,   668,   386,
     540,   541,   399,   180,    51,   233,   712,     2,   117,   294,
     347,   118,   119,    51,   669,   538,   280,     2,   422,   428,
     416,   347,   281,   582,   120,   437,   180,   549,   583,   432,
     213,   539,   168,   559,   290,   222,   456,   169,     2,   223,
     291,   213,   307,   174,   182,   630,    28,   294,   163,   316,
     631,   137,   138,     8,   618,   473,    28,   522,   131,   508,
     688,   540,   541,   476,   477,   221,   316,   316,   170,   171,
     316,   139,   140,   336,   689,   165,   372,   537,   487,   221,
     428,   294,   691,   305,   104,   364,   643,   221,   168,   365,
     187,   294,   181,   169,   109,     2,    28,   222,   182,   181,
     450,   223,   538,   306,   451,   524,   399,   172,   238,   168,
     145,   146,   250,   533,   169,   701,   255,   340,   539,   341,
     221,   182,   350,   134,   170,   171,   224,   555,   135,   136,
     353,   558,   398,   180,   428,   108,   223,   737,   533,   739,
     180,   428,   221,   354,   221,   170,   171,   566,   540,   541,
     375,   574,   384,   372,   377,   282,   387,   221,     2,   285,
     611,   174,   287,   389,   579,   392,   168,    28,   640,   391,
     221,   169,    28,   397,   463,   375,   181,   330,   316,   262,
     263,    28,    28,     8,   315,   406,   338,   593,   264,   265,
     407,   596,   408,   542,   508,   508,   316,   413,   316,   316,
     316,   316,   170,   171,   409,   600,   266,   267,   268,   269,
     372,   565,   270,   271,   469,   458,   428,   180,   174,   395,
     396,   470,   459,   474,   479,   475,   478,     2,   182,   168,
     110,   114,   115,   116,   169,   182,   120,   480,   373,   481,
     533,   489,   460,   461,   462,   464,   546,   547,     2,   491,
     240,   562,   157,   158,   159,   567,   316,   581,   316,   591,
     657,   658,   660,  -327,   592,   170,   171,   594,   595,   533,
     597,    28,    28,    28,    28,   598,    28,   533,   428,   602,
     601,   603,   604,    28,   606,   646,   608,   673,   287,   287,
      28,   623,   373,   609,   624,   628,   629,   238,   636,    28,
     641,  -329,   648,   508,   661,   653,  -328,   654,   373,   315,
     330,   655,   182,   666,   120,   436,   373,   315,   316,   316,
     664,   674,   670,   686,   453,    28,   373,   330,   330,    28,
     684,   330,    28,    28,   315,   315,    96,   685,   315,    96,
      28,   699,   117,   692,  -330,   118,   119,    71,    72,  -331,
     717,   721,   736,   720,   742,   316,   316,   743,    28,    28,
     753,    28,    28,   160,    28,    28,   161,   162,    28,   699,
     373,   757,   758,   759,   505,   760,   428,  -342,    79,   696,
     763,     1,  -342,     2,     3,     4,   764,   284,   101,    28,
     272,   287,   275,   217,   273,   577,   373,   373,   274,   713,
     697,   276,   573,   373,   381,   645,    28,   620,     8,    28,
      28,   699,   525,  -342,  -342,   548,   551,   520,   382,   383,
     536,   557,   373,     0,   315,     0,   373,     0,   373,   174,
       0,   373,     0,     0,     0,   373,     0,     0,     0,   239,
       0,   373,     0,   373,     0,     0,     0,     0,     0,     0,
       0,     9,    10,     0,   373,     0,     0,   330,     0,   330,
     330,   330,   330,     0,   315,     0,   315,   315,   315,   315,
       0,     0,     0,     0,   175,     0,     0,     0,     0,   239,
       0,     0,    12,    13,     0,     0,   207,   175,   207,     0,
       0,     0,     0,     0,     0,   505,     0,   607,    53,    96,
      16,   612,     0,     0,     0,     0,   436,     0,     0,   505,
     505,     0,     0,     0,     0,     0,     0,   330,     0,   330,
       0,     0,     0,     0,   315,     0,   315,     0,     0,     0,
     373,   373,     0,     0,     0,     0,    88,     0,     0,    88,
       0,    96,   107,     0,   676,   677,     0,     0,     0,    96,
       0,     0,     0,     0,   638,     0,   639,     0,     0,   373,
       0,   239,     0,   185,     0,     0,     0,   373,   373,     0,
       0,     0,   373,     0,   239,   107,   185,     0,     0,   330,
     330,   650,     0,   231,     0,     0,   315,   315,     0,   706,
     707,     0,   708,   709,     0,   343,     0,     0,     0,   505,
       0,     0,     0,     0,     0,     0,   343,     0,     0,     0,
       0,   505,    88,   724,     0,   725,   330,   330,   505,     0,
     605,   734,   735,   315,   315,    88,     0,   107,     0,   175,
       0,     0,    88,    96,     0,   622,     0,   744,     0,   745,
     107,   746,     0,   747,     0,     0,     0,     0,     0,     0,
     185,     0,   302,   505,   304,     0,     0,   505,     0,   761,
     505,   762,     0,   106,     0,     0,   373,     0,    96,     0,
       0,     0,     0,     0,     0,     0,    96,    96,     0,     0,
     107,     0,     0,   175,   185,     0,   505,   505,     0,   505,
       0,    96,   505,     0,   292,   185,   106,   239,   419,    88,
     231,     0,   363,     0,   239,     0,   175,     0,     0,     0,
       0,     0,     0,   107,   523,     0,     0,   505,    96,     0,
       0,     0,     0,     0,   656,     0,     0,     0,     0,     0,
       0,     0,     0,   179,   505,     0,   667,   505,     0,     0,
       0,     0,     0,   622,     0,   208,   179,   208,   106,    88,
     361,     0,     0,   225,     0,     0,     0,     0,   239,     0,
      96,     0,   107,     0,     0,     0,     0,    88,     0,     0,
       0,     0,   405,     0,     0,   107,     0,    96,   687,   411,
       0,     0,   690,     0,     0,   693,     0,     0,     0,   430,
       0,     0,     0,     0,     0,   443,   445,     0,     0,     0,
      96,     0,     0,     0,    96,     0,     0,   552,     0,     0,
       0,   714,   715,   175,   716,     0,     0,   718,    96,     0,
     175,    88,   300,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   404,    88,     0,     0,   421,    88,     0,    88,
       0,     0,   738,     0,    88,     0,   107,     0,     0,   404,
     430,     0,     0,    88,   344,   442,   444,     0,     0,   752,
       0,     0,   754,   107,   107,   344,   457,   107,   472,     0,
       0,     0,     0,     0,     0,     0,   405,   532,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   179,     0,
       0,    88,   488,   239,     0,     0,   231,   175,    96,     0,
       0,     0,     0,   107,   430,   302,   561,     0,     0,     0,
     404,   430,     0,     0,     0,   569,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    88,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    88,   404,   531,     0,     0,
       0,     0,   179,   404,     0,   554,   402,     0,     0,   410,
       0,    88,     0,   107,     0,     0,     0,   420,    88,     0,
       0,     0,     0,   402,   404,   179,   531,     0,   404,   402,
       0,   404,     0,     0,     0,   568,     0,     0,   580,     0,
       0,   575,     0,   576,     0,     0,   430,     0,     0,     0,
       0,     0,    96,   107,   584,   107,   107,   107,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    96,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   402,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    88,     0,     0,   107,   107,
       0,     0,     0,     0,     0,     0,   404,     0,   430,     0,
     402,   530,     0,   107,     0,   107,     0,   402,     0,     0,
       0,     0,     0,     0,     0,     0,   553,     0,     0,     0,
     404,   531,   179,     0,   106,   300,     0,     0,   402,   179,
     530,     0,   402,     0,     0,   402,     0,     0,     0,   530,
       0,     0,     0,     0,   107,   402,     0,     0,     0,   404,
       0,     0,     0,     0,     0,     0,     0,   644,   404,     0,
       0,     0,   647,     0,     0,   107,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   430,   107,     0,     0,
       0,     0,   107,   107,     0,     0,   179,     0,     0,     0,
     402,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   402,   530,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,   404,     6,     7,     0,
       0,     0,     0,   402,     0,     0,     0,     0,     0,     0,
       0,   402,   402,     0,     0,     0,   530,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   492,   493,   494,   495,   496,   497,   498,   499,   500,
     501,   502,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,   503,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
     402,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   504,
     375,  -379,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   492,   493,   494,   495,   496,   497,   498,   499,   500,
     501,   502,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,   503,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   504,
     375,  -378,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   492,   493,   494,   495,   496,   497,   498,   499,   500,
     501,   502,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,   503,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   504,
     375,  -380,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   234,
     235,   236,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   234,
     235,   278,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   234,
     235,   369,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   380,
     235,  -434,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       9,    10,    11,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    82,    83,     0,     0,     0,    84,    15,     1,    16,
       2,     3,     4,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   234,
     235,   642,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   309,     0,     0,     9,    10,
       0,   168,    79,     0,     0,   310,   169,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   170,   171,    82,
      83,     0,     0,     0,    84,   311,     1,    16,     2,     3,
       4,     0,     0,   174,     0,     0,   312,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   313,     0,   314,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,   309,     0,     0,     9,    10,     0,   168,
      79,     0,     0,   310,   169,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   170,   171,    82,    83,     0,
       0,     0,    84,   311,     1,    16,     2,     3,     4,     0,
       0,   174,     0,     0,   312,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   313,     0,   446,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,   309,     0,     0,     9,    10,     0,   168,    79,     0,
       0,   310,   169,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   170,   171,    82,    83,     0,     0,     0,
      84,   311,     1,    16,     2,     3,     4,     0,     0,   174,
       0,     0,   312,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   313,     0,   465,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,   309,
       0,     0,     9,    10,     0,   168,    79,     0,     0,   310,
     169,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   170,   171,    82,    83,     0,     0,     0,    84,   311,
       1,    16,     2,     3,     4,     0,     0,   174,     0,     0,
     312,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   313,     0,   467,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,   309,     0,     0,
       9,    10,     0,   168,    79,     0,     0,   310,   169,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   170,
     171,    82,    83,     0,     0,     0,    84,   311,     1,    16,
       2,     3,     4,     0,     0,   174,     0,     0,   312,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   313,
       0,   585,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   309,     0,     0,     9,    10,
       0,   168,    79,     0,     0,   310,   169,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   170,   171,    82,
      83,     0,     0,     0,    84,   311,     1,    16,     2,     3,
       4,     0,     0,   174,     0,     0,   312,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   313,     0,   586,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,   309,     0,     0,     9,    10,     0,   168,
      79,     0,     0,   310,   169,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   170,   171,    82,    83,     0,
       0,     0,    84,   311,     1,    16,     2,     3,     4,     0,
       0,   174,     0,     0,   312,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   313,     0,   587,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,   309,     0,     0,     9,    10,     0,   168,    79,     0,
       0,   310,   169,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   170,   171,    82,    83,     0,     0,     0,
      84,   311,     1,    16,     2,     3,     4,     0,     0,   174,
       0,     0,   312,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   313,     0,   590,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,   309,
       0,     0,     9,    10,     0,   168,    79,     0,     0,   310,
     169,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   170,   171,    82,    83,     0,     0,     0,    84,   311,
       1,    16,     2,     3,     4,     0,     0,   174,     0,     0,
     312,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   313,     0,   651,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,   309,     0,     0,
       9,    10,     0,   168,    79,     0,     0,   310,   169,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   170,
     171,    82,    83,     0,     0,     0,    84,   311,     1,    16,
       2,     3,     4,     0,     0,   174,     0,     0,   312,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   313,
       0,   652,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   309,     0,     0,     9,    10,
       0,   168,    79,     0,     0,   310,   169,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   170,   171,    82,
      83,     0,     0,     0,    84,   311,     1,    16,     2,     3,
       4,     0,     0,   174,     0,     0,   312,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   313,     0,   671,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,    78,     0,   309,     0,     0,     9,    10,     0,   168,
      79,     0,     0,   310,   169,     8,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   170,   171,    82,    83,     0,
       0,     0,    84,   311,     0,    16,     0,     0,     9,    10,
      11,   174,     0,     0,   312,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   313,     0,   672,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,   698,   755,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,   492,
     493,   494,   495,   496,   497,   498,   499,   500,   501,   502,
       0,     0,     0,    78,     0,     0,     0,     0,     9,    10,
      11,     0,    79,     0,   503,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    82,
      83,     0,     0,     0,    84,    15,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   504,   375,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,   492,
     493,   494,   495,   496,   497,   498,   499,   500,   501,   502,
       8,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     0,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     8,     0,     9,    10,    11,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     0,     0,     0,    12,    13,     0,   504,   375,     0,
       0,    14,     0,     0,     9,    10,    11,     0,     0,     0,
      15,   251,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,   235,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       8,    15,   283,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,   235,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,     0,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     9,    10,    11,     0,     0,     0,
      15,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   235,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,    15,     1,    16,     2,     3,     4,     0,    17,    18,
      19,    20,    21,    22,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   698,     0,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,    78,     0,   309,
       0,     0,     9,    10,     0,   168,    79,     0,     0,   310,
     169,     8,     0,     0,     0,     0,    80,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   170,   171,    82,    83,     8,     0,     0,    84,   311,
       0,    16,     0,     0,     9,    10,    11,   174,     0,     0,
     312,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   313,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,     9,    10,
      11,     1,    14,     2,     3,     4,     5,     0,     6,     7,
       0,    15,   662,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     0,     0,     0,     0,     8,    12,
      13,     0,     0,   504,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,   694,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   504,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     2,     0,    15,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     610,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,   417,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   168,    79,     0,
       0,     0,   169,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   170,   171,    82,    83,     0,     0,     0,
      84,   222,     2,     0,     0,   223,     0,     0,     0,   174,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   550,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,   168,    79,     0,     0,     0,   169,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   170,
     171,    82,    83,     0,     0,     2,    84,   433,     0,     0,
       0,     0,     0,     0,     0,   174,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   434,     0,   435,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,   168,    79,     0,     0,
       0,   169,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   170,   171,    82,    83,     0,     0,     0,    84,
     372,     0,     1,     0,     2,     3,     4,     5,   174,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   615,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     9,    10,    11,   168,    79,     0,     0,     0,
     169,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
      14,   170,   171,    82,    83,     0,     0,     0,     0,   426,
     102,    16,     0,     0,     0,     0,    17,   427,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     9,    10,    11,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    82,    83,     0,     0,     0,     0,    15,
     102,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     9,    10,    11,     1,    79,     2,     3,     4,
       5,     0,     6,     7,     0,     0,    80,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,    81,     8,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    82,    83,     8,     0,     0,     0,    53,
     102,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,   168,     0,
       0,     0,     0,   169,     0,     0,     0,     0,     9,    10,
      11,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,   170,   171,     0,     0,     8,    12,
      13,     0,   426,   102,    16,     0,    14,     0,     0,    17,
     427,    19,    20,    21,    22,    15,   102,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     8,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
      16,     0,     0,   359,     0,    17,    18,    19,    20,    21,
      22,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     9,    10,    11,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     8,    12,    13,     0,    15,     0,
      16,     0,    14,   486,     0,    17,    18,    19,    20,    21,
      22,    15,     0,    16,     0,     0,   578,     0,    17,    18,
      19,    20,    21,    22,     9,    10,    11,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     8,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     8,    12,    13,
       0,    15,   659,    16,     0,    14,     0,     0,    17,    18,
      19,    20,    21,    22,    15,   719,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       9,    10,    11,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     8,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       8,    12,    13,     0,    15,     0,    16,     0,    14,     0,
       0,    17,    18,    19,    20,    21,    22,    48,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       9,    10,    11,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,    12,    13,     0,    53,     2,    16,
       0,    14,     0,     0,    17,    18,    19,    20,    21,    22,
     100,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,   168,
      79,     0,     0,     0,   169,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     2,     0,     0,
       0,     0,     0,     0,     0,   170,   171,    82,    83,     0,
       0,     0,    84,   398,   356,     0,     0,   223,     0,     0,
       0,   174,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,   168,    79,
       0,     0,     0,   169,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     2,     0,     0,     0,
       0,     0,     0,     0,   170,   171,    82,    83,     0,     0,
       0,    84,   398,     0,     0,     0,   223,     0,     0,     0,
     174,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   168,    79,     0,
       0,     0,   169,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     2,     0,     0,     0,     0,
       0,     0,     0,   170,   171,    82,    83,     0,     0,     0,
      84,   372,     0,     0,     0,     0,     0,     0,     0,   174,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,    84,
       0,   452,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,   168,    79,
       0,     0,     0,   169,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   170,   171,    82,    83,     0,     0,
       0,    84,   222,   356,     0,     0,   223,     0,     0,     0,
     174,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   168,    79,     0,
       0,     0,   169,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   170,   171,    82,    83,     0,     0,     0,
      84,   172,     0,     0,     0,   173,     0,     0,     0,   174,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,   168,    79,     0,     0,
       0,   169,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   170,   171,    82,    83,     0,     0,     0,    84,
     172,     0,     0,     0,   215,     0,     0,     0,   174,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,   168,    79,     0,     0,     0,
     169,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   170,   171,    82,    83,     0,     0,     0,    84,   172,
     293,     0,     0,     0,     0,     0,     0,   174,     8,    56,
      57,    58,    59,    60,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,    71,    72,   200,   201,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   202,     0,     0,     0,
       0,     0,     0,     0,   168,    79,     0,     0,     0,   169,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     203,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     170,   171,   204,   205,     0,     0,     0,    84,   172,     0,
       0,     0,   342,     0,     0,     0,   174,     8,    56,    57,
      58,    59,    60,   190,   191,   192,   193,   194,   195,   196,
     197,   198,   199,    71,    72,   200,   201,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   202,     0,     0,     0,     0,
       0,     0,     0,   168,    79,     0,     8,     0,   169,     0,
       0,     0,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,   203,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   170,
     171,   204,   205,     0,    78,     0,    84,   172,     0,     0,
       0,   351,   168,    79,     0,   174,     0,   169,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   170,   171,
      82,    83,     0,     0,     0,     0,   222,     0,     0,     0,
     223,     0,     0,     0,   174,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
      83,     0,     0,     0,    84,     0,   414,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,    83,     0,     0,     0,    84,     0,   484,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,    83,     0,     0,     0,    84,   563,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,   535,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,    84,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,    84,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,   417,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,    84,
       8,    56,    57,    58,    59,    60,   190,   191,   192,   193,
     194,   195,   196,   197,   198,   199,    71,    72,   200,   201,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   202,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   203,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   204,   205,     0,     0,     0,    84
};

static const yytype_int16 yycheck[] =
{
       0,     0,   153,    15,   105,    29,     6,     7,   117,    16,
     294,   172,   376,    15,   224,    15,   240,    77,     3,   376,
     319,   231,     9,   132,   405,    12,     3,   176,   545,   309,
       3,   371,    92,   317,    70,    69,   185,    97,    17,    99,
      69,    53,    69,    28,    70,   124,    48,    69,    48,   430,
      97,   160,    99,    53,    15,    28,    13,   336,   337,    70,
       3,   340,   443,   142,     7,     8,     9,   698,    98,     3,
      79,   123,     5,    48,   124,   119,   124,   118,     5,     3,
     124,    14,     3,    85,   235,   126,   310,    48,   138,   141,
      12,    13,   432,   317,   142,    97,    98,    99,   100,    70,
     100,   110,   111,   105,    69,    70,   142,   119,   142,   740,
     134,   135,   136,   142,   631,   142,   142,   117,   117,   119,
     142,   141,   119,    85,    85,   100,   113,   124,   188,   138,
      92,   142,   132,   132,    69,    70,    98,    98,   418,   100,
     152,   125,   172,   105,   105,   306,   206,   511,   512,    15,
     162,   532,   152,   363,   511,   304,   141,   217,   137,   206,
     160,   160,   162,   606,   141,   326,   153,   466,   141,   468,
     217,   142,   471,   113,     3,   118,   206,   142,   121,   122,
     561,   135,    48,   136,   118,   172,     3,   217,   569,   399,
     469,   470,   126,   294,   118,   405,   139,   118,   122,    28,
     424,   124,   126,   364,   206,    44,    45,   142,   232,   124,
     172,   133,   134,   153,   124,   217,   173,   140,     3,    85,
     663,   221,   221,     3,   508,   140,   233,     7,     8,     9,
     140,    97,    98,    99,   100,   222,    75,    16,   240,   105,
       0,    69,    70,    28,   206,    74,   186,   526,   235,   528,
      79,    97,   141,    99,   118,   217,   620,    74,   215,     3,
     222,   248,    79,    69,    70,   123,   223,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   386,   119,   240,
     124,   110,   111,   141,    28,   123,   570,   126,   124,   588,
     589,     3,   294,   110,   111,   235,   140,   124,   142,   311,
      44,   118,   124,   141,   140,   206,   142,   138,   248,   126,
     141,   311,   141,   140,   142,   317,   217,   418,   140,   306,
       3,   138,   532,   310,   119,   312,   625,   626,   124,   124,
      74,    75,   294,   294,     5,   121,   142,     3,   118,   326,
     206,   121,   122,    14,   140,    28,   119,     3,   309,   311,
     307,   217,   119,   119,    26,   317,   317,   417,   124,   139,
     206,    44,    74,   423,   141,   118,   328,    79,     3,   122,
     141,   217,   122,   126,   240,   119,   376,   364,    50,   319,
     124,   127,   128,    28,   668,   342,   386,   386,   139,   376,
     119,    74,    75,   350,   351,   124,   336,   337,   110,   111,
     340,    10,    11,   141,   119,    77,   118,     3,   365,   124,
     372,   398,   119,   118,   426,   118,   567,   124,    74,   122,
      92,   408,   424,    79,   426,     3,   426,   118,   294,   431,
     118,   122,    28,   118,   122,   392,   398,   118,   378,    74,
      14,    15,   114,   405,    79,   119,   118,   141,    44,   118,
     124,   317,   122,   126,   110,   111,   418,   418,   131,   132,
     119,   423,   118,   424,   426,   426,   122,   119,   430,   119,
     431,   433,   124,   119,   124,   110,   111,   434,    74,    75,
     141,   443,   142,   118,   243,   157,   123,   124,     3,   161,
     502,   126,   164,   142,   451,   139,    74,   497,   558,   123,
     124,    79,   502,   119,   140,   141,   508,   186,   448,   137,
     138,   511,   512,    28,   186,   119,   188,   474,   139,   140,
     119,   478,   124,   119,   511,   512,   466,   118,   468,   469,
     470,   471,   110,   111,   123,   492,   141,   142,   143,   144,
     118,   119,   145,   146,   141,   140,   508,   508,   126,   290,
     291,   141,   140,   122,   119,   123,   122,     3,   424,    74,
     426,     7,     8,     9,    79,   431,   238,   119,   240,   123,
     532,   142,   331,   332,   333,   334,   119,   123,     3,   142,
     567,   119,     7,     8,     9,   141,   526,   119,   528,   119,
     602,   603,   604,   141,   123,   110,   111,   123,   123,   561,
     119,   601,   602,   603,   604,   123,   606,   569,   570,   118,
     138,   118,   118,   613,   118,   572,   140,   629,   290,   291,
     620,   142,   294,   140,   140,   119,   118,   567,   141,   629,
     119,   141,   123,   620,    56,   123,   141,   123,   310,   311,
     319,   138,   508,   139,   316,   317,   318,   319,   588,   589,
     140,   119,   139,   138,   326,   655,   328,   336,   337,   659,
     141,   340,   662,   663,   336,   337,    10,   142,   340,    13,
     670,   670,   118,   118,   141,   121,   122,    44,    45,   141,
     692,   140,    64,   695,   142,   625,   626,   142,   688,   689,
     140,   691,   692,   118,   694,   695,   121,   122,   698,   698,
     372,   142,   142,   142,   376,   142,   668,    74,    75,   666,
     142,     1,    79,     3,     4,     5,   142,   160,    14,   719,
     147,   393,   150,    99,   148,   448,   398,   399,   149,   686,
     668,   151,   440,   405,   248,   570,   736,   511,    28,   739,
     740,   740,   393,   110,   111,   417,   418,   378,   248,   248,
     408,   423,   424,    -1,   426,    -1,   428,    -1,   430,   126,
      -1,   433,    -1,    -1,    -1,   437,    -1,    -1,    -1,   113,
      -1,   443,    -1,   445,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    -1,   456,    -1,    -1,   466,    -1,   468,
     469,   470,   471,    -1,   466,    -1,   468,   469,   470,   471,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,   153,
      -1,    -1,   102,   103,    -1,    -1,    97,    98,    99,    -1,
      -1,    -1,    -1,    -1,    -1,   497,    -1,   499,   118,   173,
     120,   503,    -1,    -1,    -1,    -1,   508,    -1,    -1,   511,
     512,    -1,    -1,    -1,    -1,    -1,    -1,   526,    -1,   528,
      -1,    -1,    -1,    -1,   526,    -1,   528,    -1,    -1,    -1,
     532,   533,    -1,    -1,    -1,    -1,     9,    -1,    -1,    12,
      -1,   215,    15,    -1,   633,   634,    -1,    -1,    -1,   223,
      -1,    -1,    -1,    -1,   556,    -1,   558,    -1,    -1,   561,
      -1,   235,    -1,    85,    -1,    -1,    -1,   569,   570,    -1,
      -1,    -1,   574,    -1,   248,    48,    98,    -1,    -1,   588,
     589,   583,    -1,   105,    -1,    -1,   588,   589,    -1,   678,
     679,    -1,   681,   682,    -1,   206,    -1,    -1,    -1,   601,
      -1,    -1,    -1,    -1,    -1,    -1,   217,    -1,    -1,    -1,
      -1,   613,    85,   702,    -1,   704,   625,   626,   620,    -1,
     497,   710,   711,   625,   626,    98,    -1,   100,    -1,   240,
      -1,    -1,   105,   307,    -1,   512,    -1,   726,    -1,   728,
     113,   730,    -1,   732,    -1,    -1,    -1,    -1,    -1,    -1,
     172,    -1,   174,   655,   176,    -1,    -1,   659,    -1,   748,
     662,   750,    -1,    15,    -1,    -1,   668,    -1,   342,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   350,   351,    -1,    -1,
     153,    -1,    -1,   294,   206,    -1,   688,   689,    -1,   691,
      -1,   365,   694,    -1,   167,   217,    48,   371,   309,   172,
     222,    -1,   224,    -1,   378,    -1,   317,    -1,    -1,    -1,
      -1,    -1,    -1,   186,   388,    -1,    -1,   719,   392,    -1,
      -1,    -1,    -1,    -1,   601,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,   736,    -1,   613,   739,    -1,    -1,
      -1,    -1,    -1,   620,    -1,    97,    98,    99,   100,   222,
     223,    -1,    -1,   105,    -1,    -1,    -1,    -1,   432,    -1,
     434,    -1,   235,    -1,    -1,    -1,    -1,   240,    -1,    -1,
      -1,    -1,   294,    -1,    -1,   248,    -1,   451,   655,   301,
      -1,    -1,   659,    -1,    -1,   662,    -1,    -1,    -1,   311,
      -1,    -1,    -1,    -1,    -1,   317,   318,    -1,    -1,    -1,
     474,    -1,    -1,    -1,   478,    -1,    -1,   418,    -1,    -1,
      -1,   688,   689,   424,   691,    -1,    -1,   694,   492,    -1,
     431,   294,   174,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   294,   306,    -1,    -1,   309,   310,    -1,   312,
      -1,    -1,   719,    -1,   317,    -1,   319,    -1,    -1,   311,
     372,    -1,    -1,   326,   206,   317,   318,    -1,    -1,   736,
      -1,    -1,   739,   336,   337,   217,   328,   340,   341,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   398,   399,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   240,    -1,
      -1,   364,   365,   567,    -1,    -1,   418,   508,   572,    -1,
      -1,    -1,    -1,   376,   426,   427,   428,    -1,    -1,    -1,
     372,   433,    -1,    -1,    -1,   437,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   398,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   408,   398,   399,    -1,    -1,
      -1,    -1,   294,   405,    -1,   418,   294,    -1,    -1,   301,
      -1,   424,    -1,   426,    -1,    -1,    -1,   309,   431,    -1,
      -1,    -1,    -1,   311,   426,   317,   428,    -1,   430,   317,
      -1,   433,    -1,    -1,    -1,   437,    -1,    -1,   451,    -1,
      -1,   443,    -1,   445,    -1,    -1,   508,    -1,    -1,    -1,
      -1,    -1,   666,   466,   456,   468,   469,   470,   471,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   686,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   372,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   508,    -1,    -1,   511,   512,
      -1,    -1,    -1,    -1,    -1,    -1,   508,    -1,   570,    -1,
     398,   399,    -1,   526,    -1,   528,    -1,   405,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   418,    -1,    -1,    -1,
     532,   533,   424,    -1,   426,   427,    -1,    -1,   426,   431,
     428,    -1,   430,    -1,    -1,   433,    -1,    -1,    -1,   437,
      -1,    -1,    -1,    -1,   567,   443,    -1,    -1,    -1,   561,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   569,   570,    -1,
      -1,    -1,   574,    -1,    -1,   588,   589,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   668,   620,    -1,    -1,
      -1,    -1,   625,   626,    -1,    -1,   508,    -1,    -1,    -1,
     508,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   532,   533,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   668,     8,     9,    -1,
      -1,    -1,    -1,   561,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   569,   570,    -1,    -1,    -1,   574,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
     668,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   140,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,     1,   120,
       3,     4,     5,    -1,   125,   126,   127,   128,   129,   130,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
     141,   142,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,     1,   120,     3,     4,
       5,    -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,     1,   120,     3,     4,     5,    -1,
      -1,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,     1,   120,     3,     4,     5,    -1,    -1,   126,
      -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
       1,   120,     3,     4,     5,    -1,    -1,   126,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    -1,   142,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,     1,   120,
       3,     4,     5,    -1,    -1,   126,    -1,    -1,   129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,   142,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,     1,   120,     3,     4,
       5,    -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,     1,   120,     3,     4,     5,    -1,
      -1,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,     1,   120,     3,     4,     5,    -1,    -1,   126,
      -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
       1,   120,     3,     4,     5,    -1,    -1,   126,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    -1,   142,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,     1,   120,
       3,     4,     5,    -1,    -1,   126,    -1,    -1,   129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,   142,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,     1,   120,     3,     4,
       5,    -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    28,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,   120,    -1,    -1,    71,    72,
      73,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,   141,   142,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   140,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    28,    -1,    71,    72,    73,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,   140,   141,    -1,
      -1,   109,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
     118,   119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,
     128,   129,   130,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,   141,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   118,   119,   120,    -1,    -1,    -1,    -1,   125,   126,
     127,   128,   129,   130,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
     118,    -1,   120,    -1,    -1,    -1,    -1,   125,   126,   127,
     128,   129,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   141,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,     1,   120,     3,     4,     5,    -1,   125,   126,
     127,   128,   129,   130,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    28,    -1,    -1,    -1,    -1,    85,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    28,    -1,    -1,   117,   118,
      -1,   120,    -1,    -1,    71,    72,    73,   126,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    71,    72,
      73,     1,   109,     3,     4,     5,     6,    -1,     8,     9,
      -1,   118,   119,   120,    -1,    -1,    -1,    -1,   125,   126,
     127,   128,   129,   130,    -1,    -1,    -1,    -1,    28,   102,
     103,    -1,    -1,   140,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,   119,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,   118,    -1,
     120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,
     130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,     3,    -1,    -1,   122,    -1,    -1,    -1,   126,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,     3,   117,   118,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   126,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   138,    -1,   140,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,     1,    -1,     3,     4,     5,     6,   126,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,   113,    -1,    -1,    -1,    -1,   118,
     119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,
     129,   130,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,   118,
     119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,
     129,   130,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    75,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    85,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   100,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    28,    -1,    -1,    -1,   118,
     119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,
     129,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    -1,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,    -1,    -1,    28,   102,
     103,    -1,   118,   119,   120,    -1,   109,    -1,    -1,   125,
     126,   127,   128,   129,   130,   118,   119,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,
     120,    -1,    -1,   123,    -1,   125,   126,   127,   128,   129,
     130,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,   118,    -1,
     120,    -1,   109,   123,    -1,   125,   126,   127,   128,   129,
     130,   118,    -1,   120,    -1,    -1,   123,    -1,   125,   126,
     127,   128,   129,   130,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    28,   102,   103,
      -1,   118,   119,   120,    -1,   109,    -1,    -1,   125,   126,
     127,   128,   129,   130,   118,   119,   120,    -1,    -1,    -1,
      -1,   125,   126,   127,   128,   129,   130,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      28,   102,   103,    -1,   118,    -1,   120,    -1,   109,    -1,
      -1,   125,   126,   127,   128,   129,   130,   118,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,   118,     3,   120,
      -1,   109,    -1,    -1,   125,   126,   127,   128,   129,   130,
     118,    -1,   120,    -1,    -1,    -1,    -1,   125,   126,   127,
     128,   129,   130,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,    -1,
      -1,   126,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,    -1,    -1,   122,    -1,    -1,    -1,
     126,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   126,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      -1,   119,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,   119,    -1,    -1,   122,    -1,    -1,    -1,
     126,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,    -1,    -1,   122,    -1,    -1,    -1,   126,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,    -1,    -1,    -1,   122,    -1,    -1,    -1,   126,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
     119,    -1,    -1,    -1,    -1,    -1,    -1,   126,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,    -1,   122,    -1,    -1,    -1,   126,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    28,    -1,    79,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    66,    -1,   117,   118,    -1,    -1,
      -1,   122,    74,    75,    -1,   126,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,    -1,   118,    -1,    -1,    -1,
     122,    -1,    -1,    -1,   126,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,    -1,   119,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,    -1,   119,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
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
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   118,   120,   125,   126,   127,
     128,   129,   130,   144,   145,   146,   148,   151,   152,   154,
     155,   156,   157,   158,   159,   160,   161,   162,   163,   164,
     165,   166,   167,   186,   187,   235,   237,   251,   118,   146,
     149,   151,   153,   118,   152,   152,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    66,    75,
      85,   100,   112,   113,   117,   173,   178,   185,   186,   188,
     190,   191,   192,   200,   201,   152,   166,   170,   173,   170,
     118,   153,   119,   167,   169,   172,   185,   186,   188,   190,
     201,   220,   235,   141,     7,     8,     9,   118,   121,   122,
     144,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   139,   168,   155,   126,   131,   132,   127,   128,    10,
      11,    12,    13,   133,   134,    14,    15,   125,   135,   136,
      16,    17,   137,   141,     0,   152,   220,     7,     8,     9,
     118,   121,   122,   144,   141,   144,   187,   118,    74,    79,
     110,   111,   118,   122,   126,   178,   179,   180,   184,   185,
     188,   190,   201,   205,   207,   215,   141,   144,   179,   187,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      46,    47,    66,   100,   112,   113,   175,   178,   185,   187,
     189,   190,   191,   200,   201,   122,   207,   175,   152,   220,
     119,   124,   118,   122,   179,   185,   188,   190,   201,   204,
     206,   215,   119,   121,   140,   141,   142,   147,   148,   166,
     173,   222,   238,   244,   245,   246,   247,   248,   249,   250,
     144,   119,   147,   150,   167,   144,   169,   147,   167,   155,
     155,   155,   156,   156,   157,   157,   158,   158,   158,   158,
     159,   159,   160,   161,   162,   163,   164,   169,   142,   250,
     119,   119,   144,   119,   150,   144,   169,   144,   202,   203,
     141,   141,   186,   119,   173,   207,   216,   217,   218,   170,
     185,   214,   215,   205,   215,   118,   118,   122,   205,    68,
      78,   118,   129,   140,   142,   144,   148,   173,   179,   193,
     194,   195,   196,   197,   209,   210,   212,   213,   215,   236,
     237,   239,   240,   241,   242,   243,   141,   141,   144,   187,
     141,   118,   122,   178,   185,   189,   190,   201,   207,   170,
     122,   122,   207,   119,   119,   167,   119,   206,   216,   123,
     170,   186,   204,   215,   118,   122,   204,   155,   235,   142,
     250,   139,   118,   144,   210,   141,   229,   230,   124,   140,
     140,   245,   247,   248,   142,   119,   124,   123,   138,   142,
     119,   123,   139,   124,   142,   202,   202,   119,   118,   179,
     206,   208,   209,   211,   213,   215,   119,   119,   124,   123,
     185,   215,   205,   118,   119,   216,   170,    50,   174,   178,
     185,   186,   188,   192,   173,   210,   118,   126,   179,   208,
     215,   173,   139,   118,   138,   140,   144,   179,   198,   199,
     208,   210,   213,   215,   213,   215,   142,   197,   124,   140,
     118,   122,   119,   144,   216,   219,   179,   213,   140,   140,
     230,   230,   230,   140,   230,   142,   193,   142,   193,   141,
     141,   193,   186,   170,   122,   123,   170,   170,   122,   119,
     119,   123,   123,   204,   119,   216,   123,   170,   186,   142,
     222,   142,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    77,   140,   144,   169,   171,   173,   224,
     225,   226,   227,   228,   230,   231,   232,   233,   234,   236,
     246,   147,   167,   166,   170,   203,   140,   142,   140,   142,
     209,   213,   215,   179,   211,    51,   218,     3,    28,    44,
      74,    75,   119,   181,   182,   183,   119,   123,   144,   187,
     141,   144,   178,   185,   186,   188,   206,   144,   179,   187,
     210,   215,   119,   118,   222,   119,   170,   141,   213,   215,
     124,   140,   138,   184,   179,   213,   213,   194,   123,   170,
     186,   119,   119,   124,   213,   142,   142,   142,   193,   193,
     142,   119,   123,   170,   123,   123,   170,   119,   123,   123,
     170,   138,   118,   118,   118,   224,   118,   144,   140,   140,
     140,   169,   144,   138,   140,   140,   176,   177,   208,   171,
     227,   171,   224,   142,   140,   193,   193,   211,   119,   118,
     119,   124,   182,    69,    70,   142,   141,   141,   144,   144,
     187,   119,   142,   250,   213,   199,   170,   213,   123,   123,
     144,   142,   142,   123,   123,   138,   224,   169,   169,   119,
     169,    56,   119,   231,   140,   140,   139,   224,   124,   140,
     139,   142,   142,   169,   119,   182,   230,   230,    69,    70,
     142,    69,    70,   142,   141,   142,   138,   224,   119,   119,
     224,   119,   118,   224,   119,   231,   170,   177,   141,   167,
     221,   119,    70,   142,    69,   142,   230,   230,   230,   230,
      69,    70,   142,   170,   224,   224,   224,   169,   224,   119,
     169,   140,   221,   223,   230,   230,    70,   142,    69,   142,
      70,   142,    69,   142,   230,   230,    64,   119,   224,   119,
     124,   142,   142,   142,   230,   230,   230,   230,    70,   142,
      69,   142,   224,   140,   224,   142,   221,   142,   142,   142,
     142,   230,   230,   142,   142
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
      case 144: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 153 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3402 "expression.ec"
	break;
      case 145: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3411 "expression.ec"
	break;
      case 148: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3420 "expression.ec"
	break;
      case 150: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3429 "expression.ec"
	break;
      case 152: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3438 "expression.ec"
	break;
      case 155: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3447 "expression.ec"
	break;
      case 156: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3456 "expression.ec"
	break;
      case 157: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3465 "expression.ec"
	break;
      case 158: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3474 "expression.ec"
	break;
      case 159: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3483 "expression.ec"
	break;
      case 160: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3492 "expression.ec"
	break;
      case 161: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3501 "expression.ec"
	break;
      case 162: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3510 "expression.ec"
	break;
      case 163: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3519 "expression.ec"
	break;
      case 164: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3528 "expression.ec"
	break;
      case 165: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3537 "expression.ec"
	break;
      case 166: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3546 "expression.ec"
	break;
      case 167: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3555 "expression.ec"
	break;
      case 169: /* "expression" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3564 "expression.ec"
	break;
      case 170: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3573 "expression.ec"
	break;
      case 171: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3582 "expression.ec"
	break;
      case 172: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3591 "expression.ec"
	break;
      case 173: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3600 "expression.ec"
	break;
      case 176: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3609 "expression.ec"
	break;
      case 177: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3618 "expression.ec"
	break;
      case 178: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3627 "expression.ec"
	break;
      case 179: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3636 "expression.ec"
	break;
      case 181: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3645 "expression.ec"
	break;
      case 182: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3654 "expression.ec"
	break;
      case 183: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3663 "expression.ec"
	break;
      case 184: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3672 "expression.ec"
	break;
      case 185: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3681 "expression.ec"
	break;
      case 186: /* "type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3690 "expression.ec"
	break;
      case 187: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3699 "expression.ec"
	break;
      case 188: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3708 "expression.ec"
	break;
      case 189: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3717 "expression.ec"
	break;
      case 190: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3726 "expression.ec"
	break;
      case 191: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3735 "expression.ec"
	break;
      case 193: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3744 "expression.ec"
	break;
      case 194: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3753 "expression.ec"
	break;
      case 195: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3762 "expression.ec"
	break;
      case 196: /* "property" */

/* Line 1009 of yacc.c  */
#line 186 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3771 "expression.ec"
	break;
      case 197: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3780 "expression.ec"
	break;
      case 198: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3789 "expression.ec"
	break;
      case 199: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3798 "expression.ec"
	break;
      case 200: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3807 "expression.ec"
	break;
      case 201: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3816 "expression.ec"
	break;
      case 202: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3825 "expression.ec"
	break;
      case 203: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3834 "expression.ec"
	break;
      case 204: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3843 "expression.ec"
	break;
      case 205: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3852 "expression.ec"
	break;
      case 206: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3861 "expression.ec"
	break;
      case 207: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3870 "expression.ec"
	break;
      case 208: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3879 "expression.ec"
	break;
      case 209: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3888 "expression.ec"
	break;
      case 210: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3897 "expression.ec"
	break;
      case 211: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3906 "expression.ec"
	break;
      case 212: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3915 "expression.ec"
	break;
      case 213: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3924 "expression.ec"
	break;
      case 214: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3933 "expression.ec"
	break;
      case 215: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3942 "expression.ec"
	break;
      case 216: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3951 "expression.ec"
	break;
      case 217: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3960 "expression.ec"
	break;
      case 218: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3969 "expression.ec"
	break;
      case 219: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3978 "expression.ec"
	break;
      case 220: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3987 "expression.ec"
	break;
      case 221: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3996 "expression.ec"
	break;
      case 222: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4005 "expression.ec"
	break;
      case 223: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4014 "expression.ec"
	break;
      case 224: /* "statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4023 "expression.ec"
	break;
      case 225: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4032 "expression.ec"
	break;
      case 226: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4041 "expression.ec"
	break;
      case 227: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4050 "expression.ec"
	break;
      case 228: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4059 "expression.ec"
	break;
      case 229: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4068 "expression.ec"
	break;
      case 230: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4077 "expression.ec"
	break;
      case 231: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4086 "expression.ec"
	break;
      case 232: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4095 "expression.ec"
	break;
      case 233: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4104 "expression.ec"
	break;
      case 234: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4113 "expression.ec"
	break;
      case 235: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4122 "expression.ec"
	break;
      case 236: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4131 "expression.ec"
	break;
      case 237: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4140 "expression.ec"
	break;
      case 239: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4149 "expression.ec"
	break;
      case 240: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4158 "expression.ec"
	break;
      case 241: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4167 "expression.ec"
	break;
      case 242: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4176 "expression.ec"
	break;
      case 243: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4185 "expression.ec"
	break;
      case 244: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4194 "expression.ec"
	break;
      case 245: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4203 "expression.ec"
	break;
      case 246: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4212 "expression.ec"
	break;
      case 247: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4221 "expression.ec"
	break;
      case 248: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4230 "expression.ec"
	break;
      case 249: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4239 "expression.ec"
	break;
      case 250: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4248 "expression.ec"
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
    { (yyval.exp) = MkExpDummy(); yyerror(); ;}
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
#line 509 "expression.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 513 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 514 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 518 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 519 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 520 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
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
#line 529 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 533 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 534 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 538 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 539 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 540 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 544 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 545 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 549 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 550 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 551 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 555 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 580 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 584 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 585 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 586 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 587 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 588 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 589 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 590 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 591 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 592 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 593 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 594 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 595 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 596 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 610 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 611 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 633 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 635 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 640 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 646 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 648 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 651 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 653 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 658 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 662 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 663 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 671 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 672 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 677 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 679 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 681 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 683 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 685 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 688 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 690 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 692 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 694 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 696 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 699 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 701 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 703 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 705 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 707 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 710 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 712 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 714 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 716 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 718 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 723 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 725 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 727 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 729 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 741 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 743 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 745 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 747 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 749 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 753 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 754 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 760 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 761 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 762 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 763 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 768 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 770 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 775 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 777 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 783 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 785 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 787 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 791 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 793 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 795 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 799 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 801 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 803 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 808 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 810 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 812 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 814 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 816 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 823 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 825 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 829 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 831 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 833 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 882 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 884 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 890 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 892 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 894 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 896 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 898 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 904 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 907 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 909 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 911 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 919 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 930 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 932 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 934 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 938 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 939 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 943 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 945 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 946 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 951 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 956 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 960 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 961 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 962 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 966 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 967 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 971 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 972 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 982 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 984 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 986 "expression.y"
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

  case 360:

/* Line 1464 of yacc.c  */
#line 1001 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1003 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1024 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1026 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1040 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1042 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1044 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1048 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1049 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1054 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1057 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1061 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1067 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1072 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1080 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1084 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1085 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1089 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1091 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1095 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1096 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1097 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1098 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1100 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1102 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1108 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1109 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1114 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1119 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1121 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1126 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1128 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1130 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1132 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1137 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1139 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1144 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1146 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1151 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1156 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1161 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1163 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1168 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1170 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1172 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1174 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1176 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1182 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1187 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1191 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1192 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1197 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1199 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1204 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1208 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1209 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1210 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1211 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1212 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1213 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1219 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1223 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7376 "expression.ec"
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
#line 1225 "expression.y"


