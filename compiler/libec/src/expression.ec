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
#define YYFINAL  155
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7763

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  146
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  431
/* YYNRULES -- Number of states.  */
#define YYNSTATES  752

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
     554,   556,   558,   560,   562,   564,   569,   571,   573,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   601,   603,   605,   607,   609,   614,   616,   622,
     627,   632,   636,   642,   649,   655,   661,   666,   673,   676,
     679,   683,   687,   689,   691,   693,   696,   700,   702,   706,
     716,   726,   734,   742,   748,   759,   770,   779,   788,   795,
     804,   813,   820,   827,   832,   842,   852,   860,   868,   874,
     878,   881,   884,   887,   889,   892,   894,   896,   898,   902,
     904,   907,   910,   914,   920,   923,   926,   931,   937,   945,
     953,   959,   961,   965,   967,   971,   975,   978,   982,   986,
     990,   995,  1000,  1003,  1007,  1011,  1016,  1020,  1023,  1027,
    1031,  1036,  1038,  1040,  1043,  1046,  1049,  1053,  1055,  1057,
    1060,  1063,  1066,  1070,  1072,  1075,  1079,  1081,  1085,  1090,
    1094,  1099,  1101,  1104,  1107,  1111,  1115,  1117,  1119,  1122,
    1125,  1128,  1132,  1136,  1139,  1141,  1144,  1146,  1149,  1152,
    1156,  1158,  1162,  1164,  1168,  1171,  1174,  1176,  1178,  1182,
    1184,  1187,  1189,  1193,  1198,  1200,  1202,  1204,  1208,  1210,
    1212,  1214,  1216,  1218,  1220,  1224,  1229,  1233,  1235,  1238,
    1240,  1243,  1246,  1248,  1250,  1253,  1255,  1258,  1262,  1264,
    1267,  1273,  1281,  1287,  1293,  1301,  1308,  1316,  1321,  1327,
    1332,  1336,  1339,  1342,  1345,  1349,  1351,  1357,  1362,  1367,
    1371,  1376,  1380,  1384,  1387,  1390,  1392,  1396,  1401,  1405,
    1408,  1411,  1414,  1417,  1420,  1423,  1426,  1429,  1433,  1435,
    1437,  1441,  1444,  1446,  1448,  1451,  1454,  1456,  1459,  1461,
    1463,  1466
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
      -1,    75,    -1,    46,    -1,   182,    -1,   182,   121,   170,
     122,    -1,   183,    -1,   184,   183,    -1,   184,   127,   183,
      -1,   181,   121,   121,   184,   122,   122,    -1,   181,   121,
     121,   122,   122,    -1,    46,    -1,    47,    -1,    76,    -1,
     188,    -1,    28,    -1,    48,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    39,    -1,    40,    -1,
      49,    -1,    41,    -1,    44,    -1,    45,    -1,    42,    -1,
      43,    -1,    86,    -1,   114,    -1,   113,    -1,   192,    -1,
     201,    -1,   187,    -1,   101,   121,   187,   122,    -1,    68,
      -1,    48,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    39,    -1,    40,    -1,    49,    -1,    41,
      -1,    44,    -1,    45,    -1,    42,    -1,    43,    -1,   114,
      -1,   113,    -1,   192,    -1,   201,    -1,   188,    -1,   101,
     121,   187,   122,    -1,    68,    -1,   193,   147,   144,   194,
     145,    -1,   193,   144,   194,   145,    -1,   193,   147,   144,
     145,    -1,   193,   144,   145,    -1,   193,   188,   144,   194,
     145,    -1,   193,   180,   147,   144,   194,   145,    -1,   193,
     180,   144,   194,   145,    -1,   193,   180,   147,   144,   145,
      -1,   193,   180,   144,   145,    -1,   193,   180,   188,   144,
     194,   145,    -1,   193,   147,    -1,   193,   188,    -1,   193,
     180,   147,    -1,   193,   180,   188,    -1,    50,    -1,    51,
      -1,   198,    -1,   194,   198,    -1,   151,   142,   223,    -1,
     195,    -1,   196,   127,   195,    -1,    69,   175,   147,   144,
      70,   231,    71,   231,   145,    -1,    69,   175,   147,   144,
      71,   231,    70,   231,   145,    -1,    69,   175,   147,   144,
      70,   231,   145,    -1,    69,   175,   147,   144,    71,   231,
     145,    -1,    69,   175,   147,   144,   145,    -1,    69,   175,
     207,   147,   144,    70,   231,    71,   231,   145,    -1,    69,
     175,   207,   147,   144,    71,   231,    70,   231,   145,    -1,
      69,   175,   207,   147,   144,    70,   231,   145,    -1,    69,
     175,   207,   147,   144,    71,   231,   145,    -1,    69,   175,
     207,   147,   144,   145,    -1,    69,   175,   144,    70,   231,
      71,   231,   145,    -1,    69,   175,   144,    71,   231,    70,
     231,   145,    -1,    69,   175,   144,    70,   231,   145,    -1,
      69,   175,   144,    71,   231,   145,    -1,    69,   175,   144,
     145,    -1,    69,   175,   207,   144,    70,   231,    71,   231,
     145,    -1,    69,   175,   207,   144,    71,   231,    70,   231,
     145,    -1,    69,   175,   207,   144,    70,   231,   145,    -1,
      69,   175,   207,   144,    71,   231,   145,    -1,    69,   175,
     207,   144,   145,    -1,   174,   199,   143,    -1,   174,   143,
      -1,   238,   143,    -1,   237,   143,    -1,   244,    -1,   196,
     143,    -1,   197,    -1,   143,    -1,   200,    -1,   199,   127,
     200,    -1,   209,    -1,   209,   185,    -1,   141,   171,    -1,
     209,   141,   171,    -1,   209,   141,   171,   141,   171,    -1,
      52,   147,    -1,    52,   188,    -1,    52,   144,   203,   145,
      -1,    52,   147,   144,   203,   145,    -1,    52,   147,   144,
     203,   143,   194,   145,    -1,    52,   188,   144,   203,   143,
     194,   145,    -1,    52,   188,   144,   203,   145,    -1,   204,
      -1,   203,   127,   204,    -1,   147,    -1,   147,   142,   171,
      -1,   121,   207,   122,    -1,   125,   126,    -1,   125,   171,
     126,    -1,   125,   187,   126,    -1,   205,   125,   126,    -1,
     205,   125,   171,   126,    -1,   205,   125,   187,   126,    -1,
     121,   122,    -1,   121,   217,   122,    -1,   205,   121,   122,
      -1,   205,   121,   217,   122,    -1,   121,   208,   122,    -1,
     121,   122,    -1,   121,   217,   122,    -1,   206,   121,   122,
      -1,   206,   121,   217,   122,    -1,   216,    -1,   205,    -1,
     216,   205,    -1,   180,   216,    -1,   180,   205,    -1,   180,
     216,   205,    -1,   216,    -1,   206,    -1,   216,   206,    -1,
     180,   216,    -1,   180,   206,    -1,   180,   216,   206,    -1,
     212,    -1,   216,   212,    -1,   180,   216,   212,    -1,   147,
      -1,   121,   209,   122,    -1,   210,   125,   171,   126,    -1,
     210,   125,   126,    -1,   210,   125,   187,   126,    -1,   214,
      -1,   216,   214,    -1,   180,   214,    -1,   180,   216,   214,
      -1,   216,   180,   214,    -1,   214,    -1,   210,    -1,   180,
     214,    -1,   180,   210,    -1,   210,   121,    -1,   213,   217,
     122,    -1,   213,   220,   122,    -1,   213,   122,    -1,   186,
      -1,   215,   186,    -1,   129,    -1,   129,   215,    -1,   129,
     216,    -1,   129,   215,   216,    -1,   218,    -1,   218,   127,
      53,    -1,   219,    -1,   218,   127,   219,    -1,   174,   209,
      -1,   174,   207,    -1,   174,    -1,   147,    -1,   220,   127,
     147,    -1,   173,    -1,   173,   207,    -1,   168,    -1,   144,
     224,   145,    -1,   144,   224,   127,   145,    -1,   167,    -1,
     150,    -1,   222,    -1,   224,   127,   222,    -1,   226,    -1,
     231,    -1,   232,    -1,   233,    -1,   234,    -1,   235,    -1,
     147,   141,   225,    -1,    54,   171,   141,   225,    -1,    55,
     141,   225,    -1,   172,    -1,   227,   172,    -1,   225,    -1,
     228,   225,    -1,   228,   172,    -1,   228,    -1,   227,    -1,
     227,   228,    -1,   144,    -1,   144,   145,    -1,   230,   229,
     145,    -1,   143,    -1,   170,   143,    -1,    56,   121,   170,
     122,   225,    -1,    56,   121,   170,   122,   225,    66,   225,
      -1,    57,   121,   170,   122,   225,    -1,    58,   121,   170,
     122,   225,    -1,    59,   225,    58,   121,   170,   122,   143,
      -1,    60,   121,   232,   232,   122,   225,    -1,    60,   121,
     232,   232,   170,   122,   225,    -1,    58,   121,   122,   225,
      -1,    60,   121,   232,   122,   225,    -1,    60,   121,   122,
     225,    -1,    61,   147,   143,    -1,    62,   143,    -1,    63,
     143,    -1,    64,   143,    -1,    64,   170,   143,    -1,     5,
      -1,   174,   147,   144,   251,   145,    -1,   174,   147,   144,
     145,    -1,   187,   144,   251,   145,    -1,   187,   144,   145,
      -1,   147,   144,   251,   145,    -1,   147,   144,   145,    -1,
     144,   251,   145,    -1,   144,   145,    -1,   174,   211,    -1,
     211,    -1,   174,   121,   122,    -1,   132,   174,   121,   122,
      -1,    79,   174,   211,    -1,    79,   211,    -1,   240,   231,
      -1,   243,   231,    -1,   243,   143,    -1,   241,   231,    -1,
     242,   231,    -1,   174,   211,    -1,   245,   231,    -1,   151,
     142,   223,    -1,   223,    -1,   247,    -1,   248,   127,   247,
      -1,   248,   143,    -1,   249,    -1,   246,    -1,   250,   249,
      -1,   250,   246,    -1,   143,    -1,   250,   143,    -1,   250,
      -1,   248,    -1,   250,   248,    -1,   168,    -1
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
     609,   610,   611,   612,   613,   614,   615,   619,   620,   621,
     622,   623,   624,   625,   626,   627,   628,   629,   630,   631,
     632,   633,   634,   635,   636,   637,   638,   639,   644,   645,
     646,   647,   648,   651,   652,   653,   654,   655,   660,   661,
     664,   666,   671,   672,   676,   677,   681,   685,   686,   690,
     692,   694,   696,   698,   701,   703,   705,   707,   709,   712,
     714,   716,   718,   720,   723,   725,   727,   729,   731,   736,
     737,   738,   739,   740,   741,   742,   743,   747,   749,   754,
     756,   758,   760,   762,   767,   768,   772,   774,   775,   776,
     777,   781,   783,   788,   790,   796,   798,   800,   802,   804,
     806,   808,   810,   812,   814,   816,   821,   823,   825,   827,
     829,   834,   835,   836,   837,   838,   839,   843,   844,   845,
     846,   847,   848,   894,   895,   897,   903,   905,   907,   909,
     911,   916,   917,   920,   922,   924,   930,   931,   932,   934,
     939,   943,   945,   947,   952,   953,   957,   958,   959,   960,
     964,   965,   969,   970,   974,   975,   976,   980,   981,   985,
     986,   995,   997,   999,  1015,  1016,  1037,  1039,  1044,  1045,
    1046,  1047,  1048,  1049,  1053,  1055,  1057,  1062,  1063,  1067,
    1068,  1071,  1075,  1076,  1077,  1081,  1085,  1093,  1098,  1099,
    1103,  1104,  1105,  1109,  1110,  1111,  1112,  1114,  1115,  1116,
    1120,  1121,  1122,  1123,  1124,  1128,  1132,  1134,  1139,  1141,
    1143,  1145,  1150,  1152,  1157,  1159,  1164,  1169,  1174,  1176,
    1181,  1183,  1185,  1187,  1189,  1195,  1200,  1205,  1206,  1210,
    1212,  1217,  1222,  1223,  1224,  1225,  1226,  1227,  1231,  1232,
    1233,  1237
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
  "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF", "'('", "')'", "'$'", "'.'",
  "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'", "'/'",
  "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'",
  "'}'", "$accept", "identifier", "primary_expression",
  "simple_primary_expression", "anon_instantiation_expression",
  "postfix_expression", "argument_expression_list",
  "common_unary_expression", "unary_expression", "unary_operator",
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
     189,   189,   189,   189,   189,   189,   189,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   191,   191,
     191,   191,   191,   191,   191,   191,   191,   191,   192,   192,
     192,   192,   193,   193,   194,   194,   195,   196,   196,   197,
     197,   197,   197,   197,   197,   197,   197,   197,   197,   197,
     197,   197,   197,   197,   197,   197,   197,   197,   197,   198,
     198,   198,   198,   198,   198,   198,   198,   199,   199,   200,
     200,   200,   200,   200,   201,   201,   202,   202,   202,   202,
     202,   203,   203,   204,   204,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   206,   206,   206,   206,
     206,   207,   207,   207,   207,   207,   207,   208,   208,   208,
     208,   208,   208,   209,   209,   209,   210,   210,   210,   210,
     210,   211,   211,   211,   211,   211,   212,   212,   212,   212,
     213,   214,   214,   214,   215,   215,   216,   216,   216,   216,
     217,   217,   218,   218,   219,   219,   219,   220,   220,   221,
     221,   222,   222,   222,   223,   223,   224,   224,   225,   225,
     225,   225,   225,   225,   226,   226,   226,   227,   227,   228,
     228,   228,   229,   229,   229,   230,   231,   231,   232,   232,
     233,   233,   233,   234,   234,   234,   234,   234,   234,   234,
     235,   235,   235,   235,   235,   236,   237,   237,   238,   238,
     238,   238,   239,   239,   240,   240,   241,   242,   243,   243,
     244,   244,   244,   244,   244,   245,   246,   247,   247,   248,
     248,   249,   250,   250,   250,   250,   250,   250,   251,   251,
     251,   252
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
       1,     1,     1,     1,     1,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     1,     5,     4,
       4,     3,     5,     6,     5,     5,     4,     6,     2,     2,
       3,     3,     1,     1,     1,     2,     3,     1,     3,     9,
       9,     7,     7,     5,    10,    10,     8,     8,     6,     8,
       8,     6,     6,     4,     9,     9,     7,     7,     5,     3,
       2,     2,     2,     1,     2,     1,     1,     1,     3,     1,
       2,     2,     3,     5,     2,     2,     4,     5,     7,     7,
       5,     1,     3,     1,     3,     3,     2,     3,     3,     3,
       4,     4,     2,     3,     3,     4,     3,     2,     3,     3,
       4,     1,     1,     2,     2,     2,     3,     1,     1,     2,
       2,     2,     3,     1,     2,     3,     1,     3,     4,     3,
       4,     1,     2,     2,     3,     3,     1,     1,     2,     2,
       2,     3,     3,     2,     1,     2,     1,     2,     2,     3,
       1,     3,     1,     3,     2,     2,     1,     1,     3,     1,
       2,     1,     3,     4,     1,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     3,     4,     3,     1,     2,     1,
       2,     2,     1,     1,     2,     1,     2,     3,     1,     2,
       5,     7,     5,     5,     7,     6,     7,     4,     5,     4,
       3,     2,     2,     2,     3,     1,     5,     4,     4,     3,
       4,     3,     3,     2,     2,     1,     3,     4,     3,     2,
       2,     2,     2,     2,     2,     2,     2,     3,     1,     1,
       3,     2,     1,     1,     2,     2,     1,     2,     1,     1,
       2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    21,     2,     7,   395,     0,     0,     0,   174,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   431,     0,   173,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   176,
     177,   178,   179,   180,   181,   182,   184,   187,   188,   185,
     186,   170,   171,   175,   183,   232,   233,     0,   196,   172,
     189,     0,   191,   190,   152,     0,   115,   117,   194,   119,
     123,   192,     0,   193,   121,    52,   102,     0,     0,     0,
       0,    41,    12,   100,     0,   349,   107,   194,   109,   113,
     111,     0,    10,     0,     0,    30,    31,     0,     0,     0,
      28,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,    89,     0,    38,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,   274,   275,
       0,   153,   155,   156,   157,     0,     0,   336,   116,     0,
       0,   154,   118,   120,   124,   122,   308,     0,   307,     0,
     228,     0,   229,   198,   199,   200,   201,   202,   203,   204,
     206,   209,   210,   207,   208,   197,   205,   217,     0,   212,
     211,     0,   133,   135,   215,   137,   139,   213,   214,   141,
       0,     0,     0,     0,     4,     0,     0,     0,     0,   108,
     110,   114,   112,   302,   350,   301,     0,     0,   426,     0,
     401,   355,    44,   354,     0,   418,    22,     0,   423,   419,
     429,   422,     0,     0,    29,    25,    33,     0,    32,    27,
       0,    87,    85,    55,    56,    57,    59,    60,    62,    63,
      67,    68,    65,    66,    70,    71,    73,    75,    77,    79,
      81,     0,    88,    86,   399,     0,    40,   283,     0,   281,
       0,     0,     0,   297,   346,     0,     0,   340,   342,     0,
     334,   337,   338,   311,   310,     0,     0,     0,   309,     0,
       0,     0,     0,   266,   221,     5,     0,     0,     0,     0,
     237,     0,   265,   234,     0,   405,     0,   321,     0,     0,
       6,     0,     0,     0,     0,   263,     0,     0,   230,   231,
       0,     0,     0,   134,   136,   138,   140,   142,     0,     0,
       0,     0,     0,    42,   101,   292,     0,     0,   286,     0,
       0,   305,   304,     0,     0,   303,    53,    11,   403,     0,
       0,     0,   316,   415,   375,     0,   416,     0,   421,   427,
     425,   430,   424,   400,    26,     0,    24,     0,   398,     0,
       0,   276,     0,     0,   195,     0,     0,   345,   344,   327,
     313,   326,   301,   296,   298,     0,    14,   335,   339,   312,
       0,   299,     0,     0,     0,     0,   125,   127,   131,   129,
       0,     0,   409,     0,    46,     0,     0,     0,     0,     0,
       0,     0,   260,   316,     0,     0,   267,   269,   404,   326,
       0,   323,     0,   219,   235,     0,   264,   330,     0,   333,
     347,     0,     0,     0,   322,   262,   261,   410,   413,   414,
     412,   411,   220,     0,   226,     0,     0,     0,     0,     0,
       0,     0,    16,     0,     0,     0,   285,   293,   287,   288,
     306,   294,     0,   289,     0,     0,   402,   417,   376,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   378,     5,     0,   367,     0,   369,   358,     0,     0,
       0,   359,   360,   361,   362,   363,     0,   420,    35,    34,
      83,   284,   282,     0,   277,     0,   280,   329,   328,   304,
       0,   314,   341,   343,   158,   159,   162,   161,   160,     0,
     163,   165,     0,   300,    13,   274,   275,     0,     0,   126,
     128,   132,   130,     0,   228,     0,   229,   408,     0,   317,
       0,   236,   406,   271,     0,   328,     0,     0,   259,     0,
     270,     0,   326,   324,   238,   319,     0,     0,   331,   332,
       0,   325,   218,   224,   225,     0,     0,   222,   216,    18,
       0,    15,    20,     0,   295,   290,   291,     0,     0,     0,
       0,     0,     0,     0,     0,   391,   392,   393,     0,     0,
       0,   379,   103,     0,   143,   145,   368,     0,   371,   370,
     377,   105,     0,     0,   315,   169,     0,     0,     0,   166,
       0,     0,   253,     0,     0,     0,   230,   231,   407,   397,
       0,   326,   268,   272,   328,   318,   320,   348,   223,   227,
      17,    19,     0,   366,     0,     0,     0,     0,     0,     0,
       0,   390,   394,     0,   364,     0,   104,     0,   278,   279,
       0,   168,   167,     0,     0,     0,     0,   243,     0,     0,
     258,     0,   396,     0,   365,     0,     0,   387,     0,     0,
     389,     0,     0,     0,   144,     0,   351,   146,   164,     0,
     251,     0,   252,     0,     0,     0,     0,     0,     0,   248,
     273,   380,   382,   383,     0,   388,     0,     0,   106,   356,
       0,     0,     0,     0,   241,     0,   242,     0,   256,     0,
     257,     0,     0,     0,     0,   385,     0,     0,   352,   249,
     250,     0,     0,     0,     0,     0,   246,     0,   247,   381,
     384,   386,   353,   357,   239,   240,   254,   255,     0,     0,
     244,   245
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   231,    27,   247,    28,    95,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   103,   132,   493,    97,   608,   105,   307,   405,
     201,   603,   604,    86,   308,   170,   530,   531,   532,   171,
      87,    44,    45,    89,   205,    90,    91,    92,   309,   310,
     311,   312,   313,   425,   426,    93,    94,   278,   279,   223,
     176,   346,   177,   416,   314,   315,   390,   316,   317,   291,
     318,   347,   287,   288,   442,   111,   687,   235,   710,   496,
     497,   498,   499,   500,   365,   501,   502,   503,   504,   505,
      46,   319,    47,   236,   321,   322,   323,   324,   325,   237,
     238,   239,   240,   241,   242,   243,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -636
static const yytype_int16 yypact[] =
{
    5725,  -636,  -636,  -636,  -636,  5765,  5799,  5799,  -636,  7463,
    5725,  -636,  7463,  5725,  5873,  -636,  5299,    14,  -636,  -636,
    -636,  -636,  -636,  -636,   -84,  -636,  -636,   122,  -636,  1399,
    5725,  -636,   197,   253,   394,    81,   435,   -59,   -76,   -55,
      87,    -4,  1399,  -636,    11,  -636,  -636,  -636,   252,  5299,
    -636,  5435,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  -636,  -636,  -636,  -636,  -636,    27,  -636,  -636,
    -636,   110,  -636,  -636,  -636,  6482,  -636,  -636,  -636,  -636,
    -636,  -636,    33,  -636,  -636,  -636,  -636,  7645,  6584,  7645,
    5299,  -636,  -636,  -636,   169,  6986,  -636,    11,  -636,  -636,
    -636,   143,   158,  1933,   285,  -636,  -636,  4278,   285,  5725,
    -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  4313,  -636,  5725,  5725,  5725,  5725,  5725,  5725,
    5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,  5725,
    5725,  5725,  5725,  4313,  2066,  -636,   196,   285,   199,   224,
     390,  -636,  -636,  -636,  -636,  6686,  5725,   231,  -636,   -30,
     299,  -636,  -636,  -636,  -636,  -636,   314,   332,   342,  2586,
     321,    31,   336,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,   364,  -636,
    -636,  6788,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
    5725,   369,  6890,   385,  -636,  5725,  6380,  5509,   164,  -636,
    -636,  -636,  -636,   -24,  -636,   307,  5725,    14,  -636,  2199,
    -636,  -636,   291,  -636,  6183,  -636,  -636,   365,  -636,  -636,
     179,  -636,  2332,   368,  -636,  -636,  -636,   181,  -636,  -636,
     327,  -636,  -636,  -636,  -636,  -636,   197,   197,   253,   253,
     394,   394,   394,   394,    81,    81,   435,   -59,   -76,   -55,
      87,   140,  -636,  -636,  -636,   375,  -636,   384,   -31,  -636,
     285,   285,   405,  -636,  6081,   406,   408,   404,  -636,   407,
    -636,   231,  -636,   314,   342,   411,  7088,  5725,   314,  7554,
    6183,  5373,  7463,  -636,  -636,   -84,   316,  4931,    53,  2707,
    -636,   203,  -636,  -636,   317,  -636,  6285,  -636,   441,   391,
     392,   365,   365,   365,   344,  -636,  2828,  2949,   393,   395,
    4567,   390,  5725,  -636,  -636,  -636,  -636,  -636,   416,   410,
    5725,  5725,   424,  -636,  -636,  -636,   429,   432,  -636,   430,
      97,   -24,   307,  7183,  5543,   -24,  -636,  -636,  -636,   412,
    4313,    84,  -636,  -636,   414,  4103,  -636,  4313,  -636,  -636,
    -636,   179,  -636,  -636,  -636,  4313,  -636,  5725,  -636,  5725,
     285,  -636,   -63,   141,  -636,  5979,   124,  -636,  -636,   317,
    -636,  -636,   289,  -636,  -636,  7372,  -636,  -636,  -636,   314,
      82,  -636,   433,   434,   207,  4814,  -636,  -636,  -636,  -636,
     241,  6183,  -636,  5166,   468,    53,   443,   441,  7278,  4313,
     371,  5725,  -636,   422,    53,   236,  -636,   -37,  -636,   425,
     441,  -636,    49,  -636,  -636,   957,  -636,  -636,  5583,  -636,
    -636,   446,   213,    49,  -636,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  -636,  3070,  -636,  3191,  3312,  4567,  3433,   448,
     445,  5725,  -636,   447,   452,  5725,  -636,  -636,  -636,  -636,
     -24,  -636,   459,  -636,   456,   128,  -636,  -636,  -636,  5725,
     442,   453,   463,   465,  4236,   466,   285,   449,   451,  4697,
     285,  -636,   176,   246,  -636,  5047,  -636,  -636,  1534,  1667,
     450,  -636,  -636,  -636,  -636,  -636,   455,  -636,  -636,  -636,
    -636,  -636,  -636,  4567,  -636,  4567,  -636,   317,  -636,   289,
      49,  -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,   474,
     480,  -636,   420,  -636,  -636,  -636,  -636,   -29,   460,  -636,
    -636,  -636,  -636,    25,  -636,   207,  -636,  -636,   441,  -636,
     481,  -636,  -636,  -636,  2465,   461,   441,   230,  -636,  5725,
    -636,    49,   462,  -636,  -636,  -636,   482,   132,  -636,  -636,
     285,  -636,  -636,  -636,  -636,  3554,  3675,  -636,  -636,  -636,
     485,  -636,  -636,   486,  -636,  -636,  -636,   473,  4236,  5725,
    5725,  5617,   557,  4620,   475,  -636,  -636,  -636,   264,   477,
    4236,  -636,  -636,   266,  -636,   479,  -636,  1800,  -636,  -636,
    -636,  -636,  3796,  3917,  -636,  -636,  5725,   495,   427,  -636,
     365,   365,  -636,   189,   191,   484,  -636,  -636,  -636,  -636,
     478,   487,  -636,   483,   488,  -636,  -636,  -636,  -636,  -636,
    -636,  -636,  4236,  -636,   228,   268,  4236,   275,   504,  4236,
    4654,  -636,  -636,  5725,  -636,    84,  -636,  4446,  -636,  -636,
     300,  -636,  -636,   -25,   -43,   365,   365,  -636,   365,   365,
    -636,   200,  -636,  5725,  -636,  4236,  4236,  -636,  4236,  5725,
    -636,  4236,  5691,   490,  -636,  4446,  -636,  -636,  -636,   365,
    -636,   365,  -636,    -3,    -5,    35,    41,   365,   365,  -636,
    -636,   560,  -636,  -636,   302,  -636,  4236,   309,  -636,  -636,
      75,   489,   496,   365,  -636,   365,  -636,   365,  -636,   365,
    -636,    76,   138,  4236,   497,  -636,  4236,  3970,  -636,  -636,
    -636,   498,   503,   506,   508,   365,  -636,   365,  -636,  -636,
    -636,  -636,  -636,  -636,  -636,  -636,  -636,  -636,   509,   515,
    -636,  -636
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -636,   329,  -636,  -636,  -109,   343,  -636,  -636,     0,  -636,
     -12,   322,   351,   328,   372,   514,   516,   513,   521,   512,
    -636,    85,     1,   624,   -14,    40,  -326,  -636,    13,  -636,
     568,  -636,    17,   852,   808,  -636,  -636,  -469,  -636,   247,
      63,   692,   -66,   882,  -154,   127,    -9,  -284,  -306,   242,
    -636,  -636,  -264,  -636,   123,    10,   847,   244,   303,  -152,
     -97,  -101,    36,  -267,   975,  -224,  -363,  -636,   894,  -636,
     -28,  -117,  -636,   292,  -636,   -11,  -635,  -348,  -636,   674,
    -636,  -636,   186,  -636,  -636,   517,  -412,  -636,  -636,  -636,
      -8,  -333,   585,  -636,  -636,  -636,  -636,  -636,  -636,  -636,
     454,   324,   457,   458,  -636,  -151,  -636
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -429
static const yytype_int16 yytable[] =
{
      29,    43,   104,   275,   224,    50,    52,    53,   246,   112,
     363,   159,   477,   151,   101,   410,    29,   388,   133,     4,
     453,   455,    85,   251,   458,    98,   182,   691,     2,   521,
       2,   204,   506,   204,     2,   104,     2,   104,   156,   494,
     427,   620,   621,   162,   272,   434,   689,   335,   286,    29,
     709,    29,     2,    99,   521,     8,     2,   178,   335,     8,
     113,     8,   148,   619,   380,   715,   351,   521,   713,   147,
     178,   551,   293,   355,   163,   164,   412,   225,   359,   106,
     513,   298,   514,   428,   149,   524,   104,     2,   207,   213,
     207,   165,   743,   141,   142,    96,   380,   353,    96,   167,
      29,   354,   692,   150,   559,   250,   717,   208,   161,   208,
     525,   719,   106,   162,   381,   329,   622,    29,   248,    29,
     690,   410,   253,   254,   255,     2,   234,     2,   526,   114,
     115,   116,    29,   252,   211,   204,   152,   178,   271,   292,
     716,   294,   714,   109,   163,   164,   204,   735,   172,   662,
     575,   576,    29,    29,   273,   154,   614,   527,   528,   161,
     203,   172,   203,   106,   162,   506,   506,   234,   219,   624,
     361,   157,   606,   178,   361,   327,   109,   179,   284,   402,
     718,   650,   167,   387,   178,   614,   720,   547,   225,   434,
     352,   434,   207,   614,   434,   163,   164,   399,   233,   441,
     470,   285,   727,   207,   529,   361,   289,   612,   737,   613,
       2,   208,   174,   167,   356,    29,   344,   143,   144,   357,
     728,   736,   208,   469,   206,   174,   206,   109,   605,   284,
     290,   160,   221,     2,   351,     8,   472,   338,   682,   233,
     355,   154,   234,   117,     2,   385,   118,   119,   342,   217,
     339,    96,   155,   167,   586,   234,   392,   349,   636,   665,
     666,   668,   669,   398,   334,   226,   508,   215,   380,     8,
     697,   698,   154,   417,   506,   334,   154,    71,    72,   430,
     432,   377,   227,   738,   515,   216,   516,   104,     2,   217,
     427,   214,     2,   167,     2,    96,   215,   172,   114,   115,
     116,    29,    96,   374,   543,   161,   367,    79,   375,   284,
     162,   434,   434,   411,   233,   418,   161,   600,   276,     2,
     113,   162,   368,   114,   115,   116,   134,   233,   336,   284,
     435,   135,   136,   417,   667,   569,   670,   403,   536,   336,
     570,   163,   164,   280,   546,   699,   436,   172,   434,   434,
     675,   361,   163,   164,   397,   215,   120,   392,   519,   167,
     167,   174,   407,   557,   161,    29,   284,   470,   281,   162,
     172,   421,   460,   215,     2,    29,   509,   225,   495,   558,
     463,   464,    96,   137,   138,   417,   292,   548,   605,   601,
     676,   215,   417,   655,   474,   215,   556,   678,   284,   104,
     163,   164,   215,   630,   139,   140,   158,   652,   284,   656,
     385,   174,   117,    29,   217,   118,   119,    96,     8,   511,
     295,   180,   688,   524,   724,    96,    96,   215,   216,   215,
     524,   726,   217,   360,   174,   296,   215,   117,   437,    96,
     118,   119,   438,   244,     2,   233,   161,   249,   525,   145,
     146,   162,   233,   376,   215,   525,   232,   297,   419,   256,
     257,   553,   510,   165,    96,   326,   526,   417,   540,   260,
     261,   262,   263,   526,   172,   598,   106,   290,   566,   627,
     330,   172,   163,   164,    29,   331,   277,   450,   364,    29,
     258,   259,   361,   552,   340,   527,   528,   232,    29,    29,
     167,   580,   527,   528,   233,   583,    96,   343,   305,   364,
     328,   495,   495,   373,    71,    72,   161,   264,   265,   587,
     378,   162,   306,    96,   382,   383,   379,   384,   393,   417,
     394,   395,   400,   396,   445,   446,   462,   456,   174,   457,
     109,   461,   617,  -336,    79,   174,    96,   618,  -336,   465,
      96,   466,   163,   164,   467,   533,   468,   476,   172,   478,
     534,   120,   361,   362,    96,   549,   554,   234,   568,  -321,
     578,   579,   232,   581,   589,   644,   645,   647,   582,  -336,
    -336,   584,   585,   588,   590,   232,   591,   593,    29,    29,
      29,    29,   595,    29,   596,   610,   615,   167,   611,   633,
      29,   616,   660,   628,   623,  -323,  -322,    29,   635,   277,
     277,   640,   641,   362,   642,   648,    29,   661,   651,   653,
     495,   657,   174,   672,   673,   679,   723,   417,   671,   362,
     305,  -324,  -325,   708,   729,   120,   423,   362,   305,   233,
     740,   730,    29,   744,    96,   440,    29,   362,   745,    29,
      29,   746,   306,   747,   750,   305,   305,    29,   686,   305,
     751,   266,   268,   270,   267,   704,   153,   212,   707,   306,
     306,   269,   684,   306,   560,    29,    29,   564,    29,    29,
     632,    29,    29,   512,   607,    29,   686,   523,     0,     0,
     362,   507,     0,   683,   492,     0,   370,     0,     0,   371,
     372,    88,     0,     0,    88,     0,    29,     0,   107,   277,
     232,     0,     0,   700,   362,   362,     0,     0,     0,     0,
       0,   362,     0,    29,     0,     0,    29,    29,   686,     0,
       0,     0,     0,   535,   538,     0,     0,     0,    96,   544,
     362,   107,   305,     0,   362,     0,   362,     0,     0,   362,
       0,     0,     0,   362,   366,     0,     0,     0,    96,   362,
       0,   362,     0,     0,   320,     0,     0,     0,     0,     0,
       0,     0,   362,     0,     0,     0,     0,    88,   306,     0,
       0,     0,   305,     0,   305,   305,   305,   305,     0,     0,
      88,     0,   107,     0,     0,     0,   306,    88,   306,   306,
     306,   306,     0,     0,     0,   107,     0,     0,     0,     0,
       0,     0,     0,   492,     0,   594,     0,     0,     0,   599,
       0,     0,     0,     0,   423,     0,     0,   492,   492,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   447,   448,
     449,   451,   305,     0,   305,     0,   107,     0,   362,   362,
       0,     0,   282,     0,     0,     0,   306,    88,   306,     0,
       0,     0,     0,   110,     0,     0,     0,     0,     0,     0,
       0,   107,   625,     0,   626,     0,     0,   362,     0,     0,
       0,     0,     0,     0,     0,   362,   362,     0,     0,     0,
     362,     0,     0,   169,   320,     0,   110,   232,   108,   637,
     181,     0,     0,     0,   305,   305,   169,     0,    88,   350,
       0,   320,   320,   218,     0,   320,     0,   492,   306,   306,
       0,   107,     0,     0,     0,     0,    88,     0,     0,   492,
       0,   108,   175,     0,   107,     0,   492,   168,     0,     0,
       0,   305,   305,     0,   209,   175,   209,   110,     0,   202,
     168,   202,   222,     0,     0,   306,   306,     0,     1,     0,
       2,     3,     4,     0,     0,     0,     0,   173,     0,     0,
       0,   492,     0,   169,     0,   492,    88,     0,   492,     0,
     173,     0,   108,     0,   362,     8,     0,   220,    88,     0,
       0,   408,    88,     0,    88,     0,     0,     0,     0,    88,
       0,   107,     0,     0,   492,   492,     0,   492,    88,   169,
     492,     0,     0,     0,     0,     0,     0,     0,   107,   107,
     169,     0,   107,   459,   218,     0,     0,     0,     0,     9,
      10,     0,     0,     0,     0,   492,     0,     0,   320,     0,
     320,   320,   320,   320,     0,    88,   475,     0,   337,     0,
       0,     0,   492,   333,     0,   492,     0,   107,     0,   337,
      12,    13,     0,     0,   333,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    15,    88,    51,     0,
      17,   175,     0,     0,     0,     0,   168,    88,     0,     0,
       0,     0,   386,     0,     0,     0,     0,   541,   320,     0,
     320,     0,     0,    88,     0,   107,     0,     0,     0,   415,
      88,     0,     0,     0,     0,   424,   173,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   443,     0,     0,     0,
     567,   175,     0,     0,     0,     0,   168,   663,   664,     0,
       0,     0,     0,     0,     0,   107,     0,   107,   107,   107,
     107,   406,     0,     0,   175,     0,     0,     0,   592,   168,
     320,   320,     0,     0,     0,     0,   173,     0,     0,   415,
       0,     0,     0,   609,     0,     0,     0,     0,   391,     0,
       0,   409,   693,   694,     0,   695,   696,    88,     0,   173,
     107,   107,     0,   386,     0,   391,     0,   320,   320,     0,
     520,   429,   431,     0,     0,   107,   711,   107,   712,     0,
       0,     0,   444,   218,   721,   722,     0,     0,   545,     0,
       0,   415,     0,     0,     0,   520,     0,     0,   415,     0,
     731,     0,   732,     0,   733,     0,   734,     0,   561,     0,
       0,     0,     0,     0,     0,     0,   107,     0,     0,     0,
       0,     0,   748,     0,   749,   391,     0,   539,   175,   389,
     110,     0,   643,   168,     0,   175,     0,   107,   107,     0,
     168,     0,     0,     0,   654,     0,   389,     0,     0,   391,
     518,   609,   389,     0,     0,     0,   391,   542,     0,     0,
       0,     0,     0,   173,     0,   108,     0,     0,     0,   107,
     173,     0,     0,   415,   107,   107,     0,   391,     0,   518,
       0,   391,     0,     0,   391,     0,   674,     0,   555,     0,
     677,     0,     0,   680,   562,     0,   563,   520,     0,     0,
       0,     0,     0,     0,     0,     0,   389,   571,     0,     0,
       0,     0,   175,     0,     0,     0,     0,   168,     0,   701,
     702,     0,   703,     0,     0,   705,   520,     0,     0,     0,
     389,   517,     0,     0,   520,   415,     0,   389,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   173,     0,     0,
     725,     0,     0,     0,     0,     0,     0,     0,   389,   391,
     517,     0,   389,     0,     0,   389,     0,   739,     0,   517,
     741,     0,     0,     0,     0,   389,     0,     0,     0,     0,
       0,     0,     0,   391,   518,     0,     0,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   391,     0,     0,     0,     0,     0,     0,     0,
     631,   391,     0,     0,     0,   634,     0,     0,     0,     0,
       0,     0,     0,   415,     0,     0,     0,     0,     0,     0,
     389,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   389,   517,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   389,     0,     0,     0,     0,     0,     0,
       0,   389,   389,     0,     0,     1,   517,     2,     3,     4,
       5,   131,     6,     7,     0,     0,     0,     0,     0,   391,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,   479,   480,
     481,   482,   483,   484,   485,   486,   487,   488,   489,     0,
       0,     0,    78,     0,     0,     0,     9,    10,    11,     0,
      79,     0,   490,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     389,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    82,    83,     0,
       0,     0,    84,    15,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   491,   364,  -373,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   479,   480,   481,   482,   483,   484,   485,   486,   487,
     488,   489,     0,     0,     0,    78,     0,     0,     0,     9,
      10,    11,     0,    79,     0,   490,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    84,    15,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     491,   364,  -372,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,   479,   480,   481,   482,   483,   484,
     485,   486,   487,   488,   489,     0,     0,     0,    78,     0,
       0,     0,     9,    10,    11,     0,    79,     0,   490,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    82,    83,     0,     0,     0,    84,    15,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   491,   364,  -374,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     9,    10,    11,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    82,    83,     0,     0,
       0,    84,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   228,   229,   230,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     9,    10,
      11,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    82,
      83,     0,     0,     0,    84,    15,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   228,
     229,   274,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     9,    10,    11,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    82,    83,     0,     0,     0,    84,    15,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   228,   229,   358,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   369,   229,  -428,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     9,    10,    11,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    82,    83,
       0,     0,     0,    84,    15,     0,    16,     1,    17,     2,
       3,     4,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   228,   229,
     629,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,   299,     0,     0,     9,    10,
       0,   161,    79,     0,     0,   300,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   163,   164,    82,
      83,     0,     0,     0,    84,    15,     0,   301,     1,    17,
       2,     3,     4,     0,     0,   167,     0,     0,   302,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   303,
       0,   304,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,   299,     0,     0,     9,
      10,     0,   161,    79,     0,     0,   300,   162,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   163,   164,
      82,    83,     0,     0,     0,    84,    15,     0,   301,     1,
      17,     2,     3,     4,     0,     0,   167,     0,     0,   302,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     303,     0,   433,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,   299,     0,     0,
       9,    10,     0,   161,    79,     0,     0,   300,   162,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   163,
     164,    82,    83,     0,     0,     0,    84,    15,     0,   301,
       1,    17,     2,     3,     4,     0,     0,   167,     0,     0,
     302,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   303,     0,   452,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,   299,     0,
       0,     9,    10,     0,   161,    79,     0,     0,   300,   162,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     163,   164,    82,    83,     0,     0,     0,    84,    15,     0,
     301,     1,    17,     2,     3,     4,     0,     0,   167,     0,
       0,   302,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   303,     0,   454,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,   299,
       0,     0,     9,    10,     0,   161,    79,     0,     0,   300,
     162,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   163,   164,    82,    83,     0,     0,     0,    84,    15,
       0,   301,     1,    17,     2,     3,     4,     0,     0,   167,
       0,     0,   302,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   303,     0,   572,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
     299,     0,     0,     9,    10,     0,   161,    79,     0,     0,
     300,   162,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   163,   164,    82,    83,     0,     0,     0,    84,
      15,     0,   301,     1,    17,     2,     3,     4,     0,     0,
     167,     0,     0,   302,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   303,     0,   573,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,   299,     0,     0,     9,    10,     0,   161,    79,     0,
       0,   300,   162,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     0,     0,     0,
      84,    15,     0,   301,     1,    17,     2,     3,     4,     0,
       0,   167,     0,     0,   302,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   303,     0,   574,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,   299,     0,     0,     9,    10,     0,   161,    79,
       0,     0,   300,   162,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   163,   164,    82,    83,     0,     0,
       0,    84,    15,     0,   301,     1,    17,     2,     3,     4,
       0,     0,   167,     0,     0,   302,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   303,     0,   577,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,   299,     0,     0,     9,    10,     0,   161,
      79,     0,     0,   300,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,    15,     0,   301,     1,    17,     2,     3,
       4,     0,     0,   167,     0,     0,   302,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   303,     0,   638,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,   299,     0,     0,     9,    10,     0,
     161,    79,     0,     0,   300,   162,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   163,   164,    82,    83,
       0,     0,     0,    84,    15,     0,   301,     1,    17,     2,
       3,     4,     0,     0,   167,     0,     0,   302,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   303,     0,
     639,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,   299,     0,     0,     9,    10,
       0,   161,    79,     0,     0,   300,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   163,   164,    82,
      83,     0,     0,     0,    84,    15,     0,   301,     1,    17,
       2,     3,     4,     0,     0,   167,     0,     0,   302,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   303,
       0,   658,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,    78,   299,     0,     0,     9,
      10,     0,   161,    79,     0,     0,   300,   162,     8,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   163,   164,
      82,    83,     0,     0,     0,    84,    15,     0,   301,     0,
      17,     0,     9,    10,    11,     0,   167,     0,     0,   302,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     303,     0,   659,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,   685,   742,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,   479,   480,   481,
     482,   483,   484,   485,   486,   487,   488,   489,     0,     0,
       0,    78,     0,     0,     0,     9,    10,    11,     0,    79,
       0,   490,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    82,    83,     0,     0,
       0,    84,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   491,   364,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
     479,   480,   481,   482,   483,   484,   485,   486,   487,   488,
     489,     0,     0,     0,     0,     0,     8,     0,     9,    10,
      11,     0,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     8,     0,     0,     0,     0,    14,     0,     0,     0,
       9,    10,    11,     0,     0,    15,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   491,
     364,    12,    13,     0,     0,     9,    10,    11,    14,     0,
       0,     0,     0,     0,     0,     0,     0,    15,     0,    16,
     245,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,   229,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,   229,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,    16,     1,    17,
       2,     3,     4,     0,    18,    19,    20,    21,    22,    23,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     685,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,    78,   299,     0,     0,     9,
      10,     0,   161,    79,     0,     0,   300,   162,     8,     0,
       0,     0,     0,    80,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   163,   164,
      82,    83,     8,     0,     0,    84,    15,     0,   301,     0,
      17,     0,     9,    10,    11,     0,   167,     0,     1,   302,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
     303,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     8,     9,    10,    11,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,    16,   649,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,    12,    13,     0,
       0,     0,     0,   491,    14,     0,     0,     0,     0,     9,
      10,    11,     0,    15,     0,    16,   681,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   491,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     2,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     597,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,   404,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,   161,
      79,     0,     0,     0,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,     0,     2,   216,     0,     0,     0,   217,
       0,     0,     0,   167,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   537,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,   161,    79,     0,     0,
       0,   162,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   163,   164,    82,    83,     0,     0,     0,    84,
       2,     0,   420,     0,     0,     0,     0,     0,     0,     0,
     167,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   421,     0,   422,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,   161,    79,     0,     0,     0,   162,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   163,   164,
      82,    83,     0,     0,     0,    84,     0,     1,   361,     2,
       3,     4,     5,     0,     6,     7,   167,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     602,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     9,    10,
      11,   161,    79,     0,     0,     0,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,   163,   164,    82,
      83,     0,     0,     0,     0,    15,     0,   413,   102,    17,
       0,     0,     0,     0,    18,   414,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     9,    10,    11,     1,    79,     2,     3,     4,     5,
       0,     6,     7,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    82,    83,     0,     0,     0,     0,    15,     0,
      16,   102,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     9,    10,    11,   161,     0,
       0,     0,     0,   162,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     0,     0,    14,   163,   164,     0,     0,     0,     0,
       0,     0,    15,     0,   413,   102,    17,     0,     0,     0,
       0,    18,   414,    20,    21,    22,    23,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    12,    13,
       0,     0,     0,     0,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,    16,   102,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     9,    10,    11,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
      16,     0,    17,     0,     0,   348,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     9,    10,    11,     0,     0,
       0,     0,    15,     0,    16,     0,    17,     0,     0,   473,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     9,
      10,    11,     1,    14,     2,     3,     4,     5,     0,     6,
       7,     0,    15,     0,    16,     0,    17,     0,     0,   565,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     1,    14,     2,     3,
       4,     5,     0,     6,     7,     0,    15,     0,    16,   646,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     8,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    12,    13,     0,     9,    10,    11,
       1,    14,     2,     3,     4,     5,     0,     6,     7,     0,
      15,     0,    16,   706,    17,     0,     0,     0,     0,    18,
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
       0,     0,    15,     0,   100,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,   161,    79,     0,     0,     0,   162,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     2,     0,     0,     0,     0,     0,
     163,   164,    82,    83,     0,     0,     0,    84,     0,     0,
     385,   345,     0,     0,   217,     0,     0,     0,   167,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,   161,    79,     0,     0,
       0,   162,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     2,     0,     0,     0,
       0,     0,   163,   164,    82,    83,     0,     0,     0,    84,
       0,     0,   385,     0,     0,     0,   217,     0,     0,     0,
     167,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,   161,    79,
       0,     0,     0,   162,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     2,     0,
       0,     0,     0,     0,   163,   164,    82,    83,     0,     0,
       0,    84,     0,     0,   361,     0,     0,     0,     0,     0,
       0,     0,   167,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    82,    83,
       0,     0,     0,    84,     0,     0,     0,   439,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,   161,    79,     0,     0,     0,
     162,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   163,   164,    82,    83,     0,     0,     0,    84,     0,
       0,   216,   345,     0,     0,   217,     0,     0,     0,   167,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,   161,    79,     0,
       0,     0,   162,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     0,     0,     0,
      84,     0,     0,   165,     0,     0,     0,   166,     0,     0,
       0,   167,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,   161,
      79,     0,     0,     0,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,     0,     0,   165,     0,     0,     0,   210,
       0,     0,     0,   167,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,   161,    79,     0,     0,     0,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   163,   164,    82,
      83,     0,     0,     0,    84,     0,     0,   165,   283,     0,
       0,     0,     0,     0,     0,   167,     8,    54,    55,    56,
      57,    58,   183,   184,   185,   186,   187,   188,   189,   190,
     191,   192,   193,   194,    71,    72,   195,   196,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   197,     0,     0,     0,
       0,     0,     0,   161,    79,     0,     0,     0,   162,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   198,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   163,
     164,   199,   200,     0,     0,     0,    84,     0,     0,   165,
       0,     0,     0,   332,     0,     0,     0,   167,     8,    54,
      55,    56,    57,    58,   183,   184,   185,   186,   187,   188,
     189,   190,   191,   192,   193,   194,    71,    72,   195,   196,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   197,     0,
       0,     0,     0,     0,     0,   161,    79,     0,     0,     0,
     162,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   198,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   163,   164,   199,   200,     0,     0,     0,    84,     0,
       0,   165,     0,     0,     8,   341,     0,     0,     0,   167,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,   161,    79,     0,     0,     0,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   163,   164,    82,
      83,     0,     0,     0,     0,     0,     0,   216,     0,     0,
       0,   217,     0,     0,     0,   167,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,    83,     0,     0,     0,    84,     0,     0,     0,
     401,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     0,     0,
       0,    84,     0,     0,     0,   471,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,    83,     0,     0,     0,    84,     0,     0,   550,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,   522,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     0,     0,     0,
      84,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     0,     0,
       0,    84,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,   404,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,    83,     0,
       0,     0,    84,     8,    54,    55,    56,    57,    58,   183,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,    71,    72,   195,   196,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   197,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   198,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   199,   200,
       0,     0,     0,    84
};

static const yytype_int16 yycheck[] =
{
       0,     0,    16,   154,   105,     5,     6,     7,   117,    17,
     234,    77,   360,    17,    14,   299,    16,   284,    30,     5,
     326,   327,     9,   132,   330,    12,    92,    70,     3,   392,
       3,    97,   365,    99,     3,    49,     3,    51,    49,   365,
     307,    70,    71,    80,   153,   309,    71,   201,   165,    49,
     685,    51,     3,    13,   417,    28,     3,    85,   212,    28,
     144,    28,   138,   532,   127,    70,   218,   430,    71,   128,
      98,   419,   169,   225,   111,   112,   300,   105,   229,    16,
     143,   178,   145,   307,   139,     3,   100,     3,    97,   100,
      99,   121,   727,    12,    13,    10,   127,   121,    13,   129,
     100,   125,   145,    16,   141,   119,    71,    97,    75,    99,
      28,    70,    49,    80,   145,   181,   145,   117,   117,   119,
     145,   405,   134,   135,   136,     3,   113,     3,    46,     7,
       8,     9,   132,   132,    98,   201,   140,   165,   152,   167,
     145,   169,   145,    16,   111,   112,   212,    71,    85,   618,
     456,   457,   152,   153,   153,   144,   519,    75,    76,    75,
      97,    98,    99,   100,    80,   498,   499,   154,   105,   144,
     121,   144,   498,   201,   121,   144,    49,   144,   165,   296,
     145,   593,   129,   284,   212,   548,   145,   411,   216,   453,
     218,   455,   201,   556,   458,   111,   112,   294,   113,   316,
     352,   165,   127,   212,   122,   121,   166,   513,    70,   515,
       3,   201,    85,   129,   226,   215,   215,   136,   137,   227,
     145,   145,   212,   126,    97,    98,    99,   100,   495,   216,
     167,   121,   105,     3,   386,    28,   353,   201,   650,   154,
     392,   144,   229,   121,     3,   121,   124,   125,   212,   125,
     210,   166,     0,   129,   126,   242,   284,   217,   126,    70,
      71,    70,    71,   291,   201,   122,   375,   127,   127,    28,
      70,    71,   144,   301,   607,   212,   144,    46,    47,   307,
     308,   141,   124,   145,   143,   121,   145,   301,     3,   125,
     557,   122,     3,   129,     3,   210,   127,   234,     7,     8,
       9,   301,   217,   122,   405,    75,   127,    76,   127,   296,
      80,   575,   576,   300,   229,   302,    75,   141,   122,     3,
     144,    80,   143,     7,     8,     9,   129,   242,   201,   316,
     127,   134,   135,   361,   145,   122,   145,   297,   404,   212,
     127,   111,   112,   144,   410,   145,   143,   284,   612,   613,
     122,   121,   111,   112,   291,   127,    27,   385,   386,   129,
     129,   234,   299,   127,    75,   365,   353,   519,   144,    80,
     307,   141,   332,   127,     3,   375,   375,   405,   365,   143,
     340,   341,   297,   130,   131,   413,   414,   415,   655,   143,
     122,   127,   420,   127,   354,   127,   424,   122,   385,   413,
     111,   112,   127,   554,    10,    11,    77,   143,   395,   143,
     121,   284,   121,   413,   125,   124,   125,   332,    28,   379,
     121,    92,   122,     3,   122,   340,   341,   127,   121,   127,
       3,   122,   125,   142,   307,   121,   127,   121,   121,   354,
     124,   125,   125,   114,     3,   360,    75,   118,    28,    14,
      15,    80,   367,   126,   127,    28,   113,   125,   142,   137,
     138,   421,   377,   121,   379,   144,    46,   495,   405,   141,
     142,   143,   144,    46,   411,   489,   413,   414,   438,   545,
     144,   418,   111,   112,   484,   121,   157,   143,   144,   489,
     139,   140,   121,   122,   125,    75,    76,   154,   498,   499,
     129,   461,    75,    76,   419,   465,   421,   122,   179,   144,
     181,   498,   499,   145,    46,    47,    75,   145,   146,   479,
     145,    80,   179,   438,   280,   281,   142,   122,   122,   557,
     122,   127,   121,   126,   143,   143,   126,   144,   411,   144,
     413,   125,   122,    75,    76,   418,   461,   127,    80,   125,
     465,   122,   111,   112,   122,   122,   126,   145,   495,   145,
     126,   232,   121,   234,   479,   122,   144,   554,   122,   144,
     122,   126,   229,   126,   121,   589,   590,   591,   126,   111,
     112,   122,   126,   141,   121,   242,   121,   121,   588,   589,
     590,   591,   143,   593,   143,   145,   122,   129,   143,   559,
     600,   121,   616,   122,   144,   144,   144,   607,   126,   280,
     281,   126,   126,   284,   141,    58,   616,   122,   143,   142,
     607,   142,   495,   145,   141,   121,    66,   655,   144,   300,
     301,   144,   144,   143,   145,   306,   307,   308,   309,   554,
     143,   145,   642,   145,   559,   316,   646,   318,   145,   649,
     650,   145,   309,   145,   145,   326,   327,   657,   657,   330,
     145,   147,   149,   151,   148,   679,    42,    99,   682,   326,
     327,   150,   655,   330,   427,   675,   676,   435,   678,   679,
     557,   681,   682,   380,   498,   685,   685,   395,    -1,    -1,
     361,   367,    -1,   653,   365,    -1,   242,    -1,    -1,   242,
     242,     9,    -1,    -1,    12,    -1,   706,    -1,    16,   380,
     367,    -1,    -1,   673,   385,   386,    -1,    -1,    -1,    -1,
      -1,   392,    -1,   723,    -1,    -1,   726,   727,   727,    -1,
      -1,    -1,    -1,   404,   405,    -1,    -1,    -1,   653,   410,
     411,    49,   413,    -1,   415,    -1,   417,    -1,    -1,   420,
      -1,    -1,    -1,   424,   237,    -1,    -1,    -1,   673,   430,
      -1,   432,    -1,    -1,   179,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   443,    -1,    -1,    -1,    -1,    85,   435,    -1,
      -1,    -1,   453,    -1,   455,   456,   457,   458,    -1,    -1,
      98,    -1,   100,    -1,    -1,    -1,   453,   105,   455,   456,
     457,   458,    -1,    -1,    -1,   113,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   484,    -1,   486,    -1,    -1,    -1,   490,
      -1,    -1,    -1,    -1,   495,    -1,    -1,   498,   499,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   321,   322,
     323,   324,   513,    -1,   515,    -1,   154,    -1,   519,   520,
      -1,    -1,   160,    -1,    -1,    -1,   513,   165,   515,    -1,
      -1,    -1,    -1,    16,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   179,   543,    -1,   545,    -1,    -1,   548,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   556,   557,    -1,    -1,    -1,
     561,    -1,    -1,    85,   309,    -1,    49,   554,    16,   570,
      92,    -1,    -1,    -1,   575,   576,    98,    -1,   216,   217,
      -1,   326,   327,   105,    -1,   330,    -1,   588,   575,   576,
      -1,   229,    -1,    -1,    -1,    -1,   234,    -1,    -1,   600,
      -1,    49,    85,    -1,   242,    -1,   607,    85,    -1,    -1,
      -1,   612,   613,    -1,    97,    98,    99,   100,    -1,    97,
      98,    99,   105,    -1,    -1,   612,   613,    -1,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,   642,    -1,   165,    -1,   646,   284,    -1,   649,    -1,
      98,    -1,   100,    -1,   655,    28,    -1,   105,   296,    -1,
      -1,   299,   300,    -1,   302,    -1,    -1,    -1,    -1,   307,
      -1,   309,    -1,    -1,   675,   676,    -1,   678,   316,   201,
     681,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   326,   327,
     212,    -1,   330,   331,   216,    -1,    -1,    -1,    -1,    72,
      73,    -1,    -1,    -1,    -1,   706,    -1,    -1,   453,    -1,
     455,   456,   457,   458,    -1,   353,   354,    -1,   201,    -1,
      -1,    -1,   723,   201,    -1,   726,    -1,   365,    -1,   212,
     103,   104,    -1,    -1,   212,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,   385,   121,    -1,
     123,   234,    -1,    -1,    -1,    -1,   234,   395,    -1,    -1,
      -1,    -1,   284,    -1,    -1,    -1,    -1,   405,   513,    -1,
     515,    -1,    -1,   411,    -1,   413,    -1,    -1,    -1,   301,
     418,    -1,    -1,    -1,    -1,   307,   234,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   318,    -1,    -1,    -1,
     438,   284,    -1,    -1,    -1,    -1,   284,   620,   621,    -1,
      -1,    -1,    -1,    -1,    -1,   453,    -1,   455,   456,   457,
     458,   299,    -1,    -1,   307,    -1,    -1,    -1,   484,   307,
     575,   576,    -1,    -1,    -1,    -1,   284,    -1,    -1,   361,
      -1,    -1,    -1,   499,    -1,    -1,    -1,    -1,   284,    -1,
      -1,   299,   665,   666,    -1,   668,   669,   495,    -1,   307,
     498,   499,    -1,   385,    -1,   301,    -1,   612,   613,    -1,
     392,   307,   308,    -1,    -1,   513,   689,   515,   691,    -1,
      -1,    -1,   318,   405,   697,   698,    -1,    -1,   410,    -1,
      -1,   413,    -1,    -1,    -1,   417,    -1,    -1,   420,    -1,
     713,    -1,   715,    -1,   717,    -1,   719,    -1,   430,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   554,    -1,    -1,    -1,
      -1,    -1,   735,    -1,   737,   361,    -1,   405,   411,   284,
     413,    -1,   588,   411,    -1,   418,    -1,   575,   576,    -1,
     418,    -1,    -1,    -1,   600,    -1,   301,    -1,    -1,   385,
     386,   607,   307,    -1,    -1,    -1,   392,   405,    -1,    -1,
      -1,    -1,    -1,   411,    -1,   413,    -1,    -1,    -1,   607,
     418,    -1,    -1,   495,   612,   613,    -1,   413,    -1,   415,
      -1,   417,    -1,    -1,   420,    -1,   642,    -1,   424,    -1,
     646,    -1,    -1,   649,   430,    -1,   432,   519,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   361,   443,    -1,    -1,
      -1,    -1,   495,    -1,    -1,    -1,    -1,   495,    -1,   675,
     676,    -1,   678,    -1,    -1,   681,   548,    -1,    -1,    -1,
     385,   386,    -1,    -1,   556,   557,    -1,   392,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   495,    -1,    -1,
     706,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   413,   495,
     415,    -1,   417,    -1,    -1,   420,    -1,   723,    -1,   424,
     726,    -1,    -1,    -1,    -1,   430,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   519,   520,    -1,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   548,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     556,   557,    -1,    -1,    -1,   561,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   655,    -1,    -1,    -1,    -1,    -1,    -1,
     495,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   519,   520,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   548,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   556,   557,    -1,    -1,     1,   561,     3,     4,     5,
       6,   142,     8,     9,    -1,    -1,    -1,    -1,    -1,   655,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    72,    73,    74,    -1,
      76,    -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     655,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,   110,    -1,    -1,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,   121,    -1,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,   132,   133,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   143,   144,   145,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    78,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,
     133,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     143,   144,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    -1,    -1,    -1,    68,    -1,
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
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   143,   144,   145,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
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
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
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
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
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
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,    74,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,     3,
       4,     5,    -1,   128,   129,   130,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,   144,
     145,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,
       3,     4,     5,    -1,    -1,   129,    -1,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
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
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
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
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
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
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
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
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
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
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,   121,     1,   123,     3,     4,     5,    -1,
      -1,   129,    -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,     1,   123,     3,     4,     5,
      -1,    -1,   129,    -1,    -1,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,   121,     1,   123,     3,     4,
       5,    -1,    -1,   129,    -1,    -1,   132,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,     3,
       4,     5,    -1,    -1,   129,    -1,    -1,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,
     145,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,   121,     1,   123,
       3,     4,     5,    -1,    -1,   129,    -1,    -1,   132,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
      -1,   145,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    28,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,   121,    -1,
     123,    -1,    72,    73,    74,    -1,   129,    -1,    -1,   132,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,   121,    -1,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,   132,   133,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,   144,   145,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,
      -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   143,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    -1,    -1,    -1,    -1,    -1,    28,    -1,    72,    73,
      74,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
     104,    28,    -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,
      72,    73,    74,    -1,    -1,   119,    -1,   121,    -1,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,
     144,   103,   104,    -1,    -1,    72,    73,    74,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,   121,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,   144,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,   121,    -1,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,
      74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,   121,     1,   123,
       3,     4,     5,    -1,   128,   129,   130,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     144,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
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
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,     3,   121,    -1,    -1,    -1,   125,
      -1,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   144,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
       3,    -1,   121,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,     1,   121,     3,
       4,     5,     6,    -1,     8,     9,   129,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
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
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
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
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
     121,   122,    -1,    -1,   125,    -1,    -1,    -1,   129,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,    -1,
     129,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,   121,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   129,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,   122,    -1,    -1,   125,    -1,    -1,    -1,   129,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,    -1,
      -1,   129,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,   121,    -1,    -1,    -1,   125,
      -1,    -1,    -1,   129,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,   121,   122,    -1,
      -1,    -1,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,    -1,    -1,   129,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,   121,    -1,    -1,    28,   125,    -1,    -1,    -1,   129,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,
      -1,   125,    -1,    -1,    -1,   129,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
     122,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,    -1,   122,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
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
      45,    46,    47,    48,    49,    50,    51,    52,    68,    76,
      86,   101,   113,   114,   118,   174,   179,   186,   187,   189,
     191,   192,   193,   201,   202,   154,   167,   171,   174,   171,
     121,   154,   122,   168,   170,   173,   186,   187,   189,   191,
     202,   221,   236,   144,     7,     8,     9,   121,   124,   125,
     147,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   142,   169,   156,   129,   134,   135,   130,   131,    10,
      11,    12,    13,   136,   137,    14,    15,   128,   138,   139,
      16,    17,   140,   169,   144,     0,   221,   144,   147,   188,
     121,    75,    80,   111,   112,   121,   125,   129,   179,   180,
     181,   185,   186,   189,   191,   202,   206,   208,   216,   144,
     147,   180,   188,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    48,    49,    68,   101,   113,
     114,   176,   179,   186,   188,   190,   191,   192,   201,   202,
     125,   208,   176,   221,   122,   127,   121,   125,   180,   186,
     189,   191,   202,   205,   207,   216,   122,   124,   143,   144,
     145,   150,   151,   167,   174,   223,   239,   245,   246,   247,
     248,   249,   250,   251,   147,   122,   150,   152,   168,   147,
     170,   150,   168,   156,   156,   156,   157,   157,   158,   158,
     159,   159,   159,   159,   160,   160,   161,   162,   163,   164,
     165,   170,   150,   168,   145,   251,   122,   147,   203,   204,
     144,   144,   187,   122,   174,   208,   217,   218,   219,   171,
     186,   215,   216,   206,   216,   121,   121,   125,   206,    69,
      79,   121,   132,   143,   145,   147,   151,   174,   180,   194,
     195,   196,   197,   198,   210,   211,   213,   214,   216,   237,
     238,   240,   241,   242,   243,   244,   144,   144,   147,   188,
     144,   121,   125,   179,   186,   190,   191,   202,   208,   171,
     125,   125,   208,   122,   168,   122,   207,   217,   126,   171,
     187,   205,   216,   121,   125,   205,   156,   236,   145,   251,
     142,   121,   147,   211,   144,   230,   231,   127,   143,   143,
     246,   248,   249,   145,   122,   127,   126,   141,   145,   142,
     127,   145,   203,   203,   122,   121,   180,   207,   209,   210,
     212,   214,   216,   122,   122,   127,   126,   186,   216,   206,
     121,   122,   217,   171,    52,   175,   179,   186,   187,   189,
     193,   174,   211,   121,   129,   180,   209,   216,   174,   142,
     121,   141,   143,   147,   180,   199,   200,   209,   211,   214,
     216,   214,   216,   145,   198,   127,   143,   121,   125,   122,
     147,   217,   220,   180,   214,   143,   143,   231,   231,   231,
     143,   231,   145,   194,   145,   194,   144,   144,   194,   187,
     171,   125,   126,   171,   171,   125,   122,   122,   126,   126,
     205,   122,   217,   126,   171,   187,   145,   223,   145,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      78,   143,   147,   170,   172,   174,   225,   226,   227,   228,
     229,   231,   232,   233,   234,   235,   237,   247,   150,   168,
     167,   171,   204,   143,   145,   143,   145,   210,   214,   216,
     180,   212,    53,   219,     3,    28,    46,    75,    76,   122,
     182,   183,   184,   122,   126,   147,   188,   144,   147,   179,
     186,   187,   189,   207,   147,   180,   188,   211,   216,   122,
     121,   223,   122,   171,   144,   214,   216,   127,   143,   141,
     185,   180,   214,   214,   195,   126,   171,   187,   122,   122,
     127,   214,   145,   145,   145,   194,   194,   145,   122,   126,
     171,   126,   126,   171,   122,   126,   126,   171,   141,   121,
     121,   121,   225,   121,   147,   143,   143,   143,   170,   147,
     141,   143,   143,   177,   178,   209,   172,   228,   172,   225,
     145,   143,   194,   194,   212,   122,   121,   122,   127,   183,
      70,    71,   145,   144,   144,   147,   147,   188,   122,   145,
     251,   214,   200,   171,   214,   126,   126,   147,   145,   145,
     126,   126,   141,   225,   170,   170,   122,   170,    58,   122,
     232,   143,   143,   142,   225,   127,   143,   142,   145,   145,
     170,   122,   183,   231,   231,    70,    71,   145,    70,    71,
     145,   144,   145,   141,   225,   122,   122,   225,   122,   121,
     225,   122,   232,   171,   178,   144,   168,   222,   122,    71,
     145,    70,   145,   231,   231,   231,   231,    70,    71,   145,
     171,   225,   225,   225,   170,   225,   122,   170,   143,   222,
     224,   231,   231,    71,   145,    70,   145,    71,   145,    70,
     145,   231,   231,    66,   122,   225,   122,   127,   145,   145,
     145,   231,   231,   231,   231,    71,   145,    70,   145,   225,
     143,   225,   145,   222,   145,   145,   145,   145,   231,   231,
     145,   145
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
#line 3430 "expression.ec"
	break;
      case 148: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3439 "expression.ec"
	break;
      case 151: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3448 "expression.ec"
	break;
      case 152: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3457 "expression.ec"
	break;
      case 154: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3466 "expression.ec"
	break;
      case 156: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3475 "expression.ec"
	break;
      case 157: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3484 "expression.ec"
	break;
      case 158: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3493 "expression.ec"
	break;
      case 159: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3502 "expression.ec"
	break;
      case 160: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3511 "expression.ec"
	break;
      case 161: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3520 "expression.ec"
	break;
      case 162: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3529 "expression.ec"
	break;
      case 163: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3538 "expression.ec"
	break;
      case 164: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3547 "expression.ec"
	break;
      case 165: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3556 "expression.ec"
	break;
      case 166: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3565 "expression.ec"
	break;
      case 167: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3574 "expression.ec"
	break;
      case 168: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3583 "expression.ec"
	break;
      case 170: /* "expression" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3592 "expression.ec"
	break;
      case 171: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3601 "expression.ec"
	break;
      case 172: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3610 "expression.ec"
	break;
      case 173: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3619 "expression.ec"
	break;
      case 174: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3628 "expression.ec"
	break;
      case 177: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3637 "expression.ec"
	break;
      case 178: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3646 "expression.ec"
	break;
      case 179: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3655 "expression.ec"
	break;
      case 180: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 207 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3664 "expression.ec"
	break;
      case 182: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3673 "expression.ec"
	break;
      case 183: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 208 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3682 "expression.ec"
	break;
      case 184: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 209 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3691 "expression.ec"
	break;
      case 185: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 206 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3700 "expression.ec"
	break;
      case 186: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3709 "expression.ec"
	break;
      case 187: /* "type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3718 "expression.ec"
	break;
      case 188: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3727 "expression.ec"
	break;
      case 189: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3736 "expression.ec"
	break;
      case 190: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3745 "expression.ec"
	break;
      case 191: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3754 "expression.ec"
	break;
      case 192: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3763 "expression.ec"
	break;
      case 194: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3772 "expression.ec"
	break;
      case 195: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3781 "expression.ec"
	break;
      case 196: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3790 "expression.ec"
	break;
      case 197: /* "property" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3799 "expression.ec"
	break;
      case 198: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3808 "expression.ec"
	break;
      case 199: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3817 "expression.ec"
	break;
      case 200: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3826 "expression.ec"
	break;
      case 201: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3835 "expression.ec"
	break;
      case 202: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3844 "expression.ec"
	break;
      case 203: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3853 "expression.ec"
	break;
      case 204: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3862 "expression.ec"
	break;
      case 205: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3871 "expression.ec"
	break;
      case 206: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3880 "expression.ec"
	break;
      case 207: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3889 "expression.ec"
	break;
      case 208: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3898 "expression.ec"
	break;
      case 209: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3907 "expression.ec"
	break;
      case 210: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3916 "expression.ec"
	break;
      case 211: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3925 "expression.ec"
	break;
      case 212: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3934 "expression.ec"
	break;
      case 213: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3943 "expression.ec"
	break;
      case 214: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3952 "expression.ec"
	break;
      case 215: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3961 "expression.ec"
	break;
      case 216: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3970 "expression.ec"
	break;
      case 217: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3979 "expression.ec"
	break;
      case 218: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3988 "expression.ec"
	break;
      case 219: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3997 "expression.ec"
	break;
      case 220: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4006 "expression.ec"
	break;
      case 221: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4015 "expression.ec"
	break;
      case 222: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4024 "expression.ec"
	break;
      case 223: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4033 "expression.ec"
	break;
      case 224: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4042 "expression.ec"
	break;
      case 225: /* "statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4051 "expression.ec"
	break;
      case 226: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4060 "expression.ec"
	break;
      case 227: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4069 "expression.ec"
	break;
      case 228: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4078 "expression.ec"
	break;
      case 229: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4087 "expression.ec"
	break;
      case 230: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 205 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4096 "expression.ec"
	break;
      case 231: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4105 "expression.ec"
	break;
      case 232: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4114 "expression.ec"
	break;
      case 233: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4123 "expression.ec"
	break;
      case 234: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4132 "expression.ec"
	break;
      case 235: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4141 "expression.ec"
	break;
      case 236: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4150 "expression.ec"
	break;
      case 237: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4159 "expression.ec"
	break;
      case 238: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4168 "expression.ec"
	break;
      case 240: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4177 "expression.ec"
	break;
      case 241: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4186 "expression.ec"
	break;
      case 242: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4195 "expression.ec"
	break;
      case 243: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4204 "expression.ec"
	break;
      case 244: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4213 "expression.ec"
	break;
      case 245: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4222 "expression.ec"
	break;
      case 246: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4231 "expression.ec"
	break;
      case 247: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4240 "expression.ec"
	break;
      case 248: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4249 "expression.ec"
	break;
      case 249: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4258 "expression.ec"
	break;
      case 250: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4267 "expression.ec"
	break;
      case 251: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4276 "expression.ec"
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
    { (yyval.specifier) = MkSpecifier(FLOAT128); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 610 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 627 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 628 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 633 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 646 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 649 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 651 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 653 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 654 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 656 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 660 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 662 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 665 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 671 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 672 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 676 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 677 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 681 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 685 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 686 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 693 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 695 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 697 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 699 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 708 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 710 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 719 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 721 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 730 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 737 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 738 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 739 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 740 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 741 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 742 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 743 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 748 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 750 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 755 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 757 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 761 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 763 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 767 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 768 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 773 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 774 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 775 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 776 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 777 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 782 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 784 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 791 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 799 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 801 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 803 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 811 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 813 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 815 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 817 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 836 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 838 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 845 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 846 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 847 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 848 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 896 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 898 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 904 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 906 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 908 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 910 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 912 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 918 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 923 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 925 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 933 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 935 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 946 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 948 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 952 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 953 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 957 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 958 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 959 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 960 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 965 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 969 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 970 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 974 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 975 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 976 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 980 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 981 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 985 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 986 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 996 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 998 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1000 "expression.y"
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

  case 354:

/* Line 1464 of yacc.c  */
#line 1015 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1017 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1038 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1040 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1054 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1056 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1058 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1067 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1068 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1071 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1075 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1076 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1077 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1081 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1086 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1098 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1103 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1104 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1105 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1109 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1111 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1114 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1115 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1121 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1122 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1123 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1124 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1128 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1133 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1135 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1140 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1142 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1144 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1146 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1151 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1153 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1158 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1160 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1165 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1170 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1175 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1177 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1182 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1184 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1186 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1188 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1190 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1196 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1201 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1205 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1206 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1211 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1213 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1222 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1223 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1224 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1225 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1226 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1227 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1232 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1233 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1237 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7372 "expression.ec"
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
#line 1239 "expression.y"


