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
#define YYFINAL  152
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7395

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  143
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  426
/* YYNRULES -- Number of states.  */
#define YYNSTATES  747

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
     120,   123,   125,   127,   131,   135,   138,   141,   144,   147,
     152,   155,   160,   162,   164,   166,   168,   170,   172,   174,
     176,   178,   180,   185,   187,   191,   195,   199,   201,   205,
     209,   211,   215,   219,   221,   225,   229,   233,   237,   239,
     243,   247,   249,   253,   255,   259,   261,   265,   267,   271,
     273,   277,   279,   285,   287,   291,   295,   299,   303,   305,
     307,   309,   311,   313,   315,   317,   319,   321,   323,   325,
     327,   331,   333,   336,   340,   343,   349,   351,   354,   356,
     359,   361,   364,   366,   369,   371,   374,   376,   379,   381,
     384,   386,   389,   391,   394,   396,   399,   401,   404,   406,
     409,   411,   414,   416,   419,   421,   424,   426,   429,   431,
     434,   436,   439,   441,   445,   447,   451,   453,   455,   457,
     459,   461,   463,   465,   467,   469,   471,   473,   475,   477,
     479,   481,   483,   485,   490,   492,   495,   499,   506,   512,
     514,   516,   518,   520,   522,   524,   526,   528,   530,   532,
     534,   536,   538,   540,   542,   544,   546,   548,   550,   552,
     554,   556,   558,   563,   565,   567,   569,   571,   573,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   604,   606,   612,   617,   622,   626,   632,   639,
     645,   651,   656,   663,   666,   669,   673,   677,   679,   681,
     683,   686,   690,   692,   696,   706,   716,   724,   732,   738,
     749,   760,   769,   778,   785,   794,   803,   810,   817,   822,
     832,   842,   850,   858,   864,   868,   871,   874,   877,   879,
     882,   884,   886,   888,   892,   894,   897,   900,   904,   910,
     913,   916,   921,   927,   935,   943,   949,   951,   955,   957,
     961,   965,   968,   972,   976,   980,   985,   990,   993,   997,
    1001,  1006,  1010,  1013,  1017,  1021,  1026,  1028,  1030,  1033,
    1036,  1039,  1043,  1045,  1047,  1050,  1053,  1056,  1060,  1062,
    1065,  1069,  1071,  1075,  1080,  1084,  1089,  1091,  1094,  1097,
    1101,  1105,  1107,  1109,  1112,  1115,  1118,  1122,  1126,  1129,
    1131,  1134,  1136,  1139,  1142,  1146,  1148,  1152,  1154,  1158,
    1161,  1164,  1166,  1168,  1172,  1174,  1177,  1179,  1183,  1188,
    1190,  1192,  1194,  1198,  1200,  1202,  1204,  1206,  1208,  1210,
    1214,  1219,  1223,  1225,  1228,  1230,  1233,  1236,  1238,  1240,
    1243,  1245,  1248,  1252,  1254,  1257,  1263,  1271,  1277,  1283,
    1291,  1298,  1306,  1311,  1317,  1322,  1326,  1329,  1332,  1335,
    1339,  1341,  1347,  1352,  1357,  1361,  1366,  1370,  1374,  1377,
    1380,  1382,  1386,  1391,  1395,  1398,  1401,  1404,  1407,  1410,
    1413,  1416,  1419,  1423,  1425,  1427,  1431,  1434,  1436,  1438,
    1441,  1444,  1446,  1449,  1451,  1453,  1456
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     249,     0,    -1,     3,    -1,   146,    -1,   118,   167,   119,
      -1,   144,    -1,   235,    -1,     4,    -1,   233,    -1,   120,
     233,    -1,   120,   233,   121,   233,    -1,   118,   119,    -1,
      71,   171,   205,   122,   168,   123,    -1,    71,   171,   122,
     168,   123,    -1,   102,   171,   205,   122,   168,   123,    -1,
     102,   171,   122,   168,   123,    -1,    72,   168,   173,   205,
     122,   168,   123,    -1,    72,   168,   173,   122,   168,   123,
      -1,   103,   168,   173,   205,   122,   168,   123,    -1,   103,
     168,   173,   122,   168,   123,    -1,     1,    -1,   236,    -1,
     145,    -1,   148,   122,   167,   123,    -1,   148,   118,   119,
      -1,   148,   118,   149,   119,    -1,   148,   121,   144,    -1,
     148,   144,    -1,   148,     7,   144,    -1,   148,     8,    -1,
     148,     9,    -1,   165,    -1,   147,    -1,   149,   124,   165,
      -1,   149,   124,   147,    -1,     8,   151,    -1,     9,   151,
      -1,   152,   153,    -1,     6,   151,    -1,     6,   118,   218,
     119,    -1,   109,   151,    -1,   109,   118,   218,   119,    -1,
     150,    -1,   148,    -1,   125,    -1,   126,    -1,   127,    -1,
     128,    -1,   129,    -1,   130,    -1,    73,    -1,   151,    -1,
     118,   218,   119,   153,    -1,   153,    -1,   154,   126,   153,
      -1,   154,   131,   153,    -1,   154,   132,   153,    -1,   154,
      -1,   155,   127,   154,    -1,   155,   128,   154,    -1,   155,
      -1,   156,    10,   155,    -1,   156,    11,   155,    -1,   156,
      -1,   157,   133,   156,    -1,   157,   134,   156,    -1,   157,
      12,   156,    -1,   157,    13,   156,    -1,   157,    -1,   158,
      14,   157,    -1,   158,    15,   157,    -1,   158,    -1,   159,
     125,   158,    -1,   159,    -1,   160,   135,   159,    -1,   160,
      -1,   161,   136,   160,    -1,   161,    -1,   162,    16,   161,
      -1,   162,    -1,   163,    17,   162,    -1,   163,    -1,   163,
     137,   167,   138,   164,    -1,   164,    -1,   151,   166,   165,
      -1,   164,   166,   165,    -1,   151,   166,   147,    -1,   164,
     166,   147,    -1,   139,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,
      -1,    26,    -1,    27,    -1,   165,    -1,   167,   124,   165,
      -1,   164,    -1,   171,   140,    -1,   171,   174,   140,    -1,
     234,   140,    -1,    77,   144,   139,   168,   140,    -1,   183,
      -1,   170,   183,    -1,   186,    -1,   170,   186,    -1,   199,
      -1,   170,   199,    -1,   188,    -1,   170,   188,    -1,   176,
      -1,   171,   176,    -1,   183,    -1,   171,   183,    -1,   186,
      -1,   171,   186,    -1,   199,    -1,   171,   199,    -1,   188,
      -1,   171,   188,    -1,   176,    -1,   172,   176,    -1,   183,
      -1,   172,   183,    -1,   186,    -1,   172,   186,    -1,   184,
      -1,   172,   184,    -1,   176,    -1,   173,   176,    -1,   183,
      -1,   173,   183,    -1,   187,    -1,   173,   187,    -1,   188,
      -1,   173,   188,    -1,   199,    -1,   173,   199,    -1,   175,
      -1,   174,   124,   175,    -1,   206,    -1,   206,   139,   219,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,   117,    -1,    74,    -1,   182,    -1,    79,    -1,   110,
      -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,    74,
      -1,    44,    -1,   179,    -1,   179,   118,   167,   119,    -1,
     180,    -1,   181,   180,    -1,   181,   124,   180,    -1,   178,
     118,   118,   181,   119,   119,    -1,   178,   118,   118,   119,
     119,    -1,    44,    -1,    45,    -1,    75,    -1,   185,    -1,
      28,    -1,    46,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,    -1,
      43,    -1,    40,    -1,    41,    -1,    85,    -1,   113,    -1,
     112,    -1,   189,    -1,   198,    -1,   184,    -1,   100,   118,
     184,   119,    -1,    66,    -1,    46,    -1,    34,    -1,    35,
      -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,
      -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,   113,
      -1,   112,    -1,   189,    -1,   198,    -1,   185,    -1,   100,
     118,   184,   119,    -1,    66,    -1,   190,   144,   141,   191,
     142,    -1,   190,   141,   191,   142,    -1,   190,   144,   141,
     142,    -1,   190,   141,   142,    -1,   190,   185,   141,   191,
     142,    -1,   190,   177,   144,   141,   191,   142,    -1,   190,
     177,   141,   191,   142,    -1,   190,   177,   144,   141,   142,
      -1,   190,   177,   141,   142,    -1,   190,   177,   185,   141,
     191,   142,    -1,   190,   144,    -1,   190,   185,    -1,   190,
     177,   144,    -1,   190,   177,   185,    -1,    48,    -1,    49,
      -1,   195,    -1,   191,   195,    -1,   148,   139,   220,    -1,
     192,    -1,   193,   124,   192,    -1,    68,   172,   144,   141,
      69,   228,    70,   228,   142,    -1,    68,   172,   144,   141,
      70,   228,    69,   228,   142,    -1,    68,   172,   144,   141,
      69,   228,   142,    -1,    68,   172,   144,   141,    70,   228,
     142,    -1,    68,   172,   144,   141,   142,    -1,    68,   172,
     204,   144,   141,    69,   228,    70,   228,   142,    -1,    68,
     172,   204,   144,   141,    70,   228,    69,   228,   142,    -1,
      68,   172,   204,   144,   141,    69,   228,   142,    -1,    68,
     172,   204,   144,   141,    70,   228,   142,    -1,    68,   172,
     204,   144,   141,   142,    -1,    68,   172,   141,    69,   228,
      70,   228,   142,    -1,    68,   172,   141,    70,   228,    69,
     228,   142,    -1,    68,   172,   141,    69,   228,   142,    -1,
      68,   172,   141,    70,   228,   142,    -1,    68,   172,   141,
     142,    -1,    68,   172,   204,   141,    69,   228,    70,   228,
     142,    -1,    68,   172,   204,   141,    70,   228,    69,   228,
     142,    -1,    68,   172,   204,   141,    69,   228,   142,    -1,
      68,   172,   204,   141,    70,   228,   142,    -1,    68,   172,
     204,   141,   142,    -1,   171,   196,   140,    -1,   171,   140,
      -1,   235,   140,    -1,   234,   140,    -1,   241,    -1,   193,
     140,    -1,   194,    -1,   140,    -1,   197,    -1,   196,   124,
     197,    -1,   206,    -1,   206,   182,    -1,   138,   168,    -1,
     206,   138,   168,    -1,   206,   138,   168,   138,   168,    -1,
      50,   144,    -1,    50,   185,    -1,    50,   141,   200,   142,
      -1,    50,   144,   141,   200,   142,    -1,    50,   144,   141,
     200,   140,   191,   142,    -1,    50,   185,   141,   200,   140,
     191,   142,    -1,    50,   185,   141,   200,   142,    -1,   201,
      -1,   200,   124,   201,    -1,   144,    -1,   144,   139,   168,
      -1,   118,   204,   119,    -1,   122,   123,    -1,   122,   168,
     123,    -1,   122,   184,   123,    -1,   202,   122,   123,    -1,
     202,   122,   168,   123,    -1,   202,   122,   184,   123,    -1,
     118,   119,    -1,   118,   214,   119,    -1,   202,   118,   119,
      -1,   202,   118,   214,   119,    -1,   118,   205,   119,    -1,
     118,   119,    -1,   118,   214,   119,    -1,   203,   118,   119,
      -1,   203,   118,   214,   119,    -1,   213,    -1,   202,    -1,
     213,   202,    -1,   177,   213,    -1,   177,   202,    -1,   177,
     213,   202,    -1,   213,    -1,   203,    -1,   213,   203,    -1,
     177,   213,    -1,   177,   203,    -1,   177,   213,   203,    -1,
     209,    -1,   213,   209,    -1,   177,   213,   209,    -1,   144,
      -1,   118,   206,   119,    -1,   207,   122,   168,   123,    -1,
     207,   122,   123,    -1,   207,   122,   184,   123,    -1,   211,
      -1,   213,   211,    -1,   177,   211,    -1,   177,   213,   211,
      -1,   213,   177,   211,    -1,   211,    -1,   207,    -1,   177,
     211,    -1,   177,   207,    -1,   207,   118,    -1,   210,   214,
     119,    -1,   210,   217,   119,    -1,   210,   119,    -1,   183,
      -1,   212,   183,    -1,   126,    -1,   126,   212,    -1,   126,
     213,    -1,   126,   212,   213,    -1,   215,    -1,   215,   124,
      51,    -1,   216,    -1,   215,   124,   216,    -1,   171,   206,
      -1,   171,   204,    -1,   171,    -1,   144,    -1,   217,   124,
     144,    -1,   170,    -1,   170,   204,    -1,   165,    -1,   141,
     221,   142,    -1,   141,   221,   124,   142,    -1,   164,    -1,
     147,    -1,   219,    -1,   221,   124,   219,    -1,   223,    -1,
     228,    -1,   229,    -1,   230,    -1,   231,    -1,   232,    -1,
     144,   138,   222,    -1,    52,   168,   138,   222,    -1,    53,
     138,   222,    -1,   169,    -1,   224,   169,    -1,   222,    -1,
     225,   222,    -1,   225,   169,    -1,   225,    -1,   224,    -1,
     224,   225,    -1,   141,    -1,   141,   142,    -1,   227,   226,
     142,    -1,   140,    -1,   167,   140,    -1,    54,   118,   167,
     119,   222,    -1,    54,   118,   167,   119,   222,    64,   222,
      -1,    55,   118,   167,   119,   222,    -1,    56,   118,   167,
     119,   222,    -1,    57,   222,    56,   118,   167,   119,   140,
      -1,    58,   118,   229,   229,   119,   222,    -1,    58,   118,
     229,   229,   167,   119,   222,    -1,    56,   118,   119,   222,
      -1,    58,   118,   229,   119,   222,    -1,    58,   118,   119,
     222,    -1,    59,   144,   140,    -1,    60,   140,    -1,    61,
     140,    -1,    62,   140,    -1,    62,   167,   140,    -1,     5,
      -1,   171,   144,   141,   248,   142,    -1,   171,   144,   141,
     142,    -1,   184,   141,   248,   142,    -1,   184,   141,   142,
      -1,   144,   141,   248,   142,    -1,   144,   141,   142,    -1,
     141,   248,   142,    -1,   141,   142,    -1,   171,   208,    -1,
     208,    -1,   171,   118,   119,    -1,   129,   171,   118,   119,
      -1,    78,   171,   208,    -1,    78,   208,    -1,   237,   228,
      -1,   240,   228,    -1,   240,   140,    -1,   238,   228,    -1,
     239,   228,    -1,   171,   208,    -1,   242,   228,    -1,   148,
     139,   220,    -1,   220,    -1,   244,    -1,   245,   124,   244,
      -1,   245,   140,    -1,   246,    -1,   243,    -1,   247,   246,
      -1,   247,   243,    -1,   140,    -1,   247,   140,    -1,   247,
      -1,   245,    -1,   247,   245,    -1,   165,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   213,   213,   218,   219,   224,   226,   228,   230,   232,
     233,   234,   237,   238,   239,   240,   241,   242,   243,   244,
     245,   249,   253,   254,   255,   256,   257,   258,   271,   272,
     273,   303,   304,   305,   306,   310,   311,   312,   315,   316,
     319,   320,   324,   325,   334,   335,   336,   337,   338,   339,
     340,   344,   345,   349,   350,   351,   352,   356,   357,   358,
     362,   363,   364,   368,   369,   370,   371,   372,   376,   377,
     378,   382,   383,   387,   388,   392,   393,   397,   398,   402,
     403,   407,   408,   412,   413,   414,   416,   417,   421,   422,
     423,   424,   425,   426,   427,   428,   429,   430,   431,   435,
     436,   440,   444,   445,   446,   447,   451,   452,   453,   454,
     455,   456,   457,   458,   462,   463,   464,   465,   466,   467,
     468,   469,   470,   471,   476,   477,   478,   479,   480,   481,
     482,   483,   487,   488,   489,   490,   491,   492,   493,   494,
     495,   496,   500,   501,   505,   506,   510,   511,   512,   513,
     514,   515,   519,   520,   524,   525,   526,   531,   532,   533,
     534,   535,   539,   540,   544,   545,   546,   550,   551,   555,
     556,   557,   561,   586,   590,   591,   592,   593,   594,   595,
     596,   597,   598,   599,   600,   601,   602,   603,   604,   605,
     606,   607,   608,   609,   613,   614,   615,   616,   617,   618,
     619,   620,   621,   622,   623,   624,   625,   626,   627,   628,
     629,   630,   631,   636,   637,   638,   639,   640,   643,   644,
     645,   646,   647,   652,   653,   656,   658,   663,   664,   668,
     669,   673,   677,   678,   682,   684,   686,   688,   690,   693,
     695,   697,   699,   701,   704,   706,   708,   710,   712,   715,
     717,   719,   721,   723,   728,   729,   730,   731,   732,   733,
     734,   735,   739,   741,   746,   748,   750,   752,   754,   759,
     760,   764,   766,   767,   768,   769,   773,   775,   780,   782,
     788,   790,   792,   794,   796,   798,   800,   802,   804,   806,
     808,   813,   815,   817,   819,   821,   826,   827,   828,   829,
     830,   831,   835,   836,   837,   838,   839,   840,   886,   887,
     889,   895,   897,   899,   901,   903,   908,   909,   912,   914,
     916,   922,   923,   924,   926,   931,   935,   937,   939,   944,
     945,   949,   950,   951,   952,   956,   957,   961,   962,   966,
     967,   968,   972,   973,   977,   978,   987,   989,   991,  1007,
    1008,  1029,  1031,  1036,  1037,  1038,  1039,  1040,  1041,  1045,
    1047,  1049,  1054,  1055,  1059,  1060,  1063,  1067,  1068,  1069,
    1073,  1077,  1085,  1090,  1091,  1095,  1096,  1097,  1101,  1102,
    1103,  1104,  1106,  1107,  1108,  1112,  1113,  1114,  1115,  1116,
    1120,  1124,  1126,  1131,  1133,  1135,  1137,  1142,  1144,  1149,
    1151,  1156,  1161,  1166,  1168,  1173,  1175,  1177,  1179,  1181,
    1187,  1192,  1197,  1198,  1202,  1204,  1209,  1214,  1215,  1216,
    1217,  1218,  1219,  1223,  1224,  1225,  1229
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
     148,   149,   149,   149,   149,   150,   150,   150,   150,   150,
     150,   150,   151,   151,   152,   152,   152,   152,   152,   152,
     152,   153,   153,   154,   154,   154,   154,   155,   155,   155,
     156,   156,   156,   157,   157,   157,   157,   157,   158,   158,
     158,   159,   159,   160,   160,   161,   161,   162,   162,   163,
     163,   164,   164,   165,   165,   165,   165,   165,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   167,
     167,   168,   169,   169,   169,   169,   170,   170,   170,   170,
     170,   170,   170,   170,   171,   171,   171,   171,   171,   171,
     171,   171,   171,   171,   172,   172,   172,   172,   172,   172,
     172,   172,   173,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   174,   174,   175,   175,   176,   176,   176,   176,
     176,   176,   177,   177,   178,   178,   178,   179,   179,   179,
     179,   179,   180,   180,   181,   181,   181,   182,   182,   183,
     183,   183,   184,   185,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   189,   189,   189,   189,   190,   190,   191,
     191,   192,   193,   193,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   195,   195,   195,   195,   195,   195,
     195,   195,   196,   196,   197,   197,   197,   197,   197,   198,
     198,   199,   199,   199,   199,   199,   200,   200,   201,   201,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   203,   203,   203,   203,   203,   204,   204,   204,   204,
     204,   204,   205,   205,   205,   205,   205,   205,   206,   206,
     206,   207,   207,   207,   207,   207,   208,   208,   208,   208,
     208,   209,   209,   209,   209,   210,   211,   211,   211,   212,
     212,   213,   213,   213,   213,   214,   214,   215,   215,   216,
     216,   216,   217,   217,   218,   218,   219,   219,   219,   220,
     220,   221,   221,   222,   222,   222,   222,   222,   222,   223,
     223,   223,   224,   224,   225,   225,   225,   226,   226,   226,
     227,   228,   228,   229,   229,   230,   230,   230,   231,   231,
     231,   231,   231,   231,   231,   232,   232,   232,   232,   232,
     233,   234,   234,   235,   235,   235,   235,   236,   236,   237,
     237,   238,   239,   240,   240,   241,   241,   241,   241,   241,
     242,   243,   244,   244,   245,   245,   246,   247,   247,   247,
     247,   247,   247,   248,   248,   248,   249
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       4,     2,     6,     5,     6,     5,     7,     6,     7,     6,
       1,     1,     1,     4,     3,     4,     3,     2,     3,     2,
       2,     1,     1,     3,     3,     2,     2,     2,     2,     4,
       2,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     1,     3,     3,     3,     1,     3,     3,
       1,     3,     3,     1,     3,     3,     3,     3,     1,     3,
       3,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     1,     5,     1,     3,     3,     3,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     1,     2,     3,     2,     5,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     2,     1,     2,     1,     2,     1,     2,
       1,     2,     1,     3,     1,     3,     1,     1,     1,     1,
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
       0,    20,     2,     7,   390,     0,     0,     0,   173,     0,
       0,    50,     0,     0,     0,     0,     0,    44,    45,    46,
      47,    48,    49,     5,    22,     3,    43,    42,    51,     0,
      53,    57,    60,    63,    68,    71,    73,    75,    77,    79,
      81,    83,   426,     0,   172,     8,     6,     0,     0,    38,
       0,    35,    36,   146,   147,   148,   149,   150,   175,   176,
     177,   178,   179,   181,   184,   185,   182,   183,   169,   170,
     174,   180,   227,   228,     0,   193,   171,   186,     0,   188,
     187,   151,     0,   114,   116,   191,   118,   122,   189,     0,
     190,   120,    51,   101,     0,     0,     0,     0,    40,    11,
      99,     0,   344,   106,   191,   108,   112,   110,     0,     9,
       0,     0,    29,    30,     0,     0,     0,    27,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    88,     0,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,   269,   270,     0,   152,   154,
     155,   156,     0,     0,   331,   115,     0,     0,   153,   117,
     119,   123,   121,   303,     0,   302,     0,   223,     0,   224,
     195,   196,   197,   198,   199,   201,   204,   205,   202,   203,
     194,   200,   212,     0,   207,   206,     0,   132,   134,   210,
     136,   138,   208,   209,   140,     0,     0,     0,     0,     4,
       0,     0,     0,     0,   107,   109,   113,   111,   297,   345,
     296,     0,     0,   421,     0,   396,   350,    43,   349,     0,
     413,    21,     0,   418,   414,   424,   417,     0,     0,    28,
      24,    32,     0,    31,    26,     0,    86,    84,    54,    55,
      56,    58,    59,    61,    62,    66,    67,    64,    65,    69,
      70,    72,    74,    76,    78,    80,     0,    87,    85,   394,
       0,    39,   278,     0,   276,     0,     0,     0,   292,   341,
       0,     0,   335,   337,     0,   329,   332,   333,   306,   305,
       0,     0,     0,   304,     0,     0,     0,     0,   261,   216,
       5,     0,     0,     0,     0,   232,     0,   260,   229,     0,
     400,     0,   316,     0,     0,     6,     0,     0,     0,     0,
     258,     0,     0,   225,   226,     0,     0,     0,   133,   135,
     137,   139,   141,     0,     0,     0,     0,     0,    41,   100,
     287,     0,     0,   281,     0,     0,   300,   299,     0,     0,
     298,    52,    10,   398,     0,     0,     0,   311,   410,   370,
       0,   411,     0,   416,   422,   420,   425,   419,   395,    25,
       0,    23,     0,   393,     0,     0,   271,     0,     0,   192,
       0,     0,   340,   339,   322,   308,   321,   296,   291,   293,
       0,    13,   330,   334,   307,     0,   294,     0,     0,     0,
       0,   124,   126,   130,   128,     0,     0,   404,     0,    45,
       0,     0,     0,     0,     0,     0,     0,   255,   311,     0,
       0,   262,   264,   399,   321,     0,   318,     0,   214,   230,
       0,   259,   325,     0,   328,   342,     0,     0,     0,   317,
     257,   256,   405,   408,   409,   407,   406,   215,     0,   221,
       0,     0,     0,     0,     0,     0,     0,    15,     0,     0,
       0,   280,   288,   282,   283,   301,   289,     0,   284,     0,
       0,   397,   412,   371,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   373,     5,     0,   362,
       0,   364,   353,     0,     0,     0,   354,   355,   356,   357,
     358,     0,   415,    34,    33,    82,   279,   277,     0,   272,
       0,   275,   324,   323,   299,     0,   309,   336,   338,   157,
     158,   161,   160,   159,     0,   162,   164,     0,   295,    12,
     269,   270,     0,     0,   125,   127,   131,   129,     0,   223,
       0,   224,   403,     0,   312,     0,   231,   401,   266,     0,
     323,     0,     0,   254,     0,   265,     0,   321,   319,   233,
     314,     0,     0,   326,   327,     0,   320,   213,   219,   220,
       0,     0,   217,   211,    17,     0,    14,    19,     0,   290,
     285,   286,     0,     0,     0,     0,     0,     0,     0,     0,
     386,   387,   388,     0,     0,     0,   374,   102,     0,   142,
     144,   363,     0,   366,   365,   372,   104,     0,     0,   310,
     168,     0,     0,     0,   165,     0,     0,   248,     0,     0,
       0,   225,   226,   402,   392,     0,   321,   263,   267,   323,
     313,   315,   343,   218,   222,    16,    18,     0,   361,     0,
       0,     0,     0,     0,     0,     0,   385,   389,     0,   359,
       0,   103,     0,   273,   274,     0,   167,   166,     0,     0,
       0,     0,   238,     0,     0,   253,     0,   391,     0,   360,
       0,     0,   382,     0,     0,   384,     0,     0,     0,   143,
       0,   346,   145,   163,     0,   246,     0,   247,     0,     0,
       0,     0,     0,     0,   243,   268,   375,   377,   378,     0,
     383,     0,     0,   105,   351,     0,     0,     0,     0,   236,
       0,   237,     0,   251,     0,   252,     0,     0,     0,     0,
     380,     0,     0,   347,   244,   245,     0,     0,     0,     0,
       0,   241,     0,   242,   376,   379,   381,   348,   352,   234,
     235,   249,   250,     0,     0,   239,   240
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    23,    24,    25,   226,    26,   242,    27,    92,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,   100,   129,   488,    94,   603,   102,   302,   400,
     196,   598,   599,    83,   303,   167,   525,   526,   527,   168,
      84,    43,    44,    86,   200,    87,    88,    89,   304,   305,
     306,   307,   308,   420,   421,    90,    91,   273,   274,   218,
     173,   341,   174,   411,   309,   310,   385,   311,   312,   286,
     313,   342,   282,   283,   437,   108,   682,   230,   705,   491,
     492,   493,   494,   495,   360,   496,   497,   498,   499,   500,
      45,   314,    46,   231,   316,   317,   318,   319,   320,   232,
     233,   234,   235,   236,   237,   238,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -559
static const yytype_int16 yypact[] =
{
    5604,  -559,  -559,  -559,  -559,  5617,  5677,  5677,  -559,  7098,
    5604,  -559,  7098,  5604,  5690,  5239,    38,  -559,  -559,  -559,
    -559,  -559,  -559,   -55,  -559,  -559,   609,  -559,   739,  5604,
    -559,   295,   307,   444,    49,   462,   -30,   -36,   -27,   117,
      25,   739,  -559,     2,  -559,  -559,  -559,   187,  5239,  -559,
    5325,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,
    -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,
    -559,  -559,  -559,  -559,    19,  -559,  -559,  -559,   114,  -559,
    -559,  -559,  6189,  -559,  -559,  -559,  -559,  -559,  -559,   163,
    -559,  -559,  -559,  -559,  7278,  6288,  7278,  5239,  -559,  -559,
    -559,   -48,  6634,  -559,     2,  -559,  -559,  -559,   115,   155,
    1958,   283,  -559,  -559,  4241,   283,  5604,  -559,  -559,  -559,
    -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  4282,
    -559,  5604,  5604,  5604,  5604,  5604,  5604,  5604,  5604,  5604,
    5604,  5604,  5604,  5604,  5604,  5604,  5604,  5604,  5604,  5604,
    4282,  2088,  -559,   159,   283,   164,   174,   264,  -559,  -559,
    -559,  -559,  6387,  5604,    -6,  -559,   129,   205,  -559,  -559,
    -559,  -559,  -559,   218,   222,   229,  2596,   242,    29,   249,
    -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,
    -559,  -559,  -559,   256,  -559,  -559,  6486,  -559,  -559,  -559,
    -559,  -559,  -559,  -559,  -559,  5604,   279,  6585,   298,  -559,
    5604,  6090,  5398,   274,  -559,  -559,  -559,  -559,   148,  -559,
     244,  5604,    38,  -559,  2218,  -559,  -559,   430,  -559,  5991,
    -559,  -559,   272,  -559,  -559,    73,  -559,  2348,   277,  -559,
    -559,  -559,   232,  -559,  -559,   366,  -559,  -559,  -559,  -559,
    -559,   295,   295,   307,   307,   444,   444,   444,   444,    49,
      49,   462,   -30,   -36,   -27,   117,   -72,  -559,  -559,  -559,
     300,  -559,   306,   116,  -559,   283,   283,   343,  -559,  5892,
     349,   359,   358,  -559,   375,  -559,    -6,  -559,   218,   229,
     397,  6733,  5604,   218,  7188,  5991,  5312,  7098,  -559,  -559,
     -55,   699,  4877,     5,  2714,  -559,   109,  -559,  -559,   351,
    -559,  1418,  -559,   716,   347,   378,   272,   272,   272,   356,
    -559,  2832,  2950,   380,   385,  4489,   264,  5604,  -559,  -559,
    -559,  -559,  -559,   405,   413,  5604,  5604,   421,  -559,  -559,
    -559,   416,   426,  -559,   423,   121,   148,   244,  6825,  5458,
     148,  -559,  -559,  -559,   408,  4282,   412,  -559,  -559,   411,
    4076,  -559,  4282,  -559,  -559,  -559,    73,  -559,  -559,  -559,
    4282,  -559,  5604,  -559,  5604,   283,  -559,   -52,   200,  -559,
    5793,    98,  -559,  -559,   351,  -559,  -559,   517,  -559,  -559,
    7008,  -559,  -559,  -559,   218,   215,  -559,   428,   431,   173,
    4761,  -559,  -559,  -559,  -559,   722,  5991,  -559,  5109,   791,
       5,   436,   716,  6917,  4282,   406,  5604,  -559,   419,     5,
     137,  -559,   146,  -559,   420,   716,  -559,    67,  -559,  -559,
     858,  -559,  -559,  5471,  -559,  -559,   438,   235,    67,  -559,
    -559,  -559,  -559,  -559,  -559,  -559,  -559,  -559,  3068,  -559,
    3186,  3304,  4489,  3422,   443,   442,  5604,  -559,   447,   451,
    5604,  -559,  -559,  -559,  -559,   148,  -559,   448,  -559,   452,
     130,  -559,  -559,  -559,  5604,   439,   460,   463,   464,  4206,
     471,   283,   440,   450,  4648,   283,  -559,   234,   189,  -559,
    4990,  -559,  -559,  1568,  1698,   458,  -559,  -559,  -559,  -559,
    -559,   453,  -559,  -559,  -559,  -559,  -559,  -559,  4489,  -559,
    4489,  -559,   351,  -559,   517,    67,  -559,  -559,  -559,  -559,
    -559,  -559,  -559,  -559,   473,   476,  -559,   224,  -559,  -559,
    -559,  -559,   -14,   465,  -559,  -559,  -559,  -559,    30,  -559,
     173,  -559,  -559,   716,  -559,   484,  -559,  -559,  -559,  2478,
     466,   716,   294,  -559,  5604,  -559,    67,   468,  -559,  -559,
    -559,   478,   140,  -559,  -559,   283,  -559,  -559,  -559,  -559,
    3540,  3658,  -559,  -559,  -559,   487,  -559,  -559,   490,  -559,
    -559,  -559,   477,  4206,  5604,  5604,  5531,   558,  4541,   486,
    -559,  -559,  -559,   195,   495,  4206,  -559,  -559,   206,  -559,
     497,  -559,  1828,  -559,  -559,  -559,  -559,  3776,  3894,  -559,
    -559,  5604,   510,   257,  -559,   272,   272,  -559,   138,   152,
     502,  -559,  -559,  -559,  -559,   504,   506,  -559,   511,   507,
    -559,  -559,  -559,  -559,  -559,  -559,  -559,  4206,  -559,   275,
     312,  4206,   324,   537,  4206,  4575,  -559,  -559,  5604,  -559,
     412,  -559,  4371,  -559,  -559,   333,  -559,  -559,   -25,   -23,
     272,   272,  -559,   272,   272,  -559,   161,  -559,  5604,  -559,
    4206,  4206,  -559,  4206,  5604,  -559,  4206,  5544,   516,  -559,
    4371,  -559,  -559,  -559,   272,  -559,   272,  -559,    13,    27,
      32,    31,   272,   272,  -559,  -559,   593,  -559,  -559,   339,
    -559,  4206,   342,  -559,  -559,   151,   521,   523,   272,  -559,
     272,  -559,   272,  -559,   272,  -559,   165,    57,  4206,   526,
    -559,  4206,  3946,  -559,  -559,  -559,   525,   527,   530,   533,
     272,  -559,   272,  -559,  -559,  -559,  -559,  -559,  -559,  -559,
    -559,  -559,  -559,   541,   542,  -559,  -559
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -559,   329,  -559,  -559,  -101,   984,  -559,  -559,     0,  -559,
      15,   369,   364,   482,   370,   524,   534,   532,   539,   540,
    -559,    14,     1,   646,   -13,   -10,  -330,  -559,    17,  -559,
     594,  -559,    42,   -15,   711,  -559,  -559,  -508,  -559,   273,
      16,   782,   -21,    59,   120,    43,    -2,  -258,  -262,   269,
    -559,  -559,  -250,  -559,   142,    10,   285,   233,   325,  -203,
    -154,   -91,   -75,  -261,  1014,  -213,  -347,  -559,  1000,  -559,
     889,  -139,  -559,   313,  -559,    37,  -558,  -321,  -559,  -142,
    -559,  -559,   212,  -559,  -559,   536,  -537,  -559,  -559,  -559,
      -7,  -335,    89,  -559,  -559,  -559,  -559,  -559,  -559,  -559,
     474,   350,   480,   483,  -559,  -147,  -559
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -424
static const yytype_int16 yytable[] =
{
      28,    42,   101,    96,   270,    49,    51,    52,     2,   109,
     346,   219,   288,   241,    98,    28,   358,   350,   383,   614,
     206,   293,     2,   281,    93,   501,    82,    93,   246,    95,
     489,   103,     2,     2,   472,   101,   405,   101,    68,    69,
     516,   422,   148,     4,   130,   684,   686,     8,    28,   267,
      28,   645,   210,   156,   429,   615,   616,     8,   106,   448,
     450,   138,   139,   453,   103,   516,   372,   165,   179,    76,
       2,   209,   375,   199,   105,   199,   210,   354,   516,   197,
     165,   197,   407,   708,   101,   153,   110,   280,   508,   423,
     509,   106,   202,   546,   202,   144,   710,    28,   169,   145,
     714,     2,   712,   245,   203,   657,   203,   105,   677,   146,
     198,   169,   198,   103,    28,   243,    28,   685,   214,   687,
     164,   333,   704,   356,   228,   171,   732,   229,   617,    28,
     247,   164,   337,   147,   208,   394,   266,   201,   171,   201,
     106,   170,   405,   151,   465,   216,   248,   249,   250,    28,
      28,   268,   397,   284,   170,   709,   105,   324,   501,   501,
     154,   215,   149,   601,   738,   228,     2,   609,   229,   711,
     322,   619,   436,   715,   713,   199,     2,    93,   346,   279,
     285,   328,   140,   141,   350,   356,   199,   152,   382,   570,
     571,     8,   328,   542,   202,   334,   609,   362,   429,   733,
     429,     8,   344,   429,   609,   202,   203,   660,   661,   467,
      28,   339,   329,   363,   165,   352,   380,   203,   519,    93,
     212,   663,   664,   329,   164,   159,    93,   519,   279,   600,
     692,   693,   157,   430,   221,   730,   351,   158,   228,   331,
     375,   229,   159,   520,   464,   169,   607,   162,   608,   431,
     331,   228,   520,   581,   229,   164,   160,   161,   376,   521,
     519,   552,   151,   631,   165,   315,   348,   501,   521,   503,
     349,   151,   171,   160,   161,   722,   222,   553,   271,   401,
     662,   151,   398,   101,   554,   520,     2,   165,   170,   522,
     523,   422,     8,   723,   665,   169,    28,     2,   522,   523,
     107,   521,   392,   694,   176,   275,    93,   731,   279,   538,
     402,   465,   406,   210,   413,   276,   330,   455,   169,   210,
     429,   429,   171,   290,   375,   458,   459,   330,   279,   596,
     650,   522,   523,   107,   524,   647,   291,   587,   170,   469,
     510,    93,   511,   612,   292,   171,   651,   162,   613,    93,
      93,   369,   604,   404,   564,   117,   370,   429,   429,   565,
      28,   170,   211,    93,   506,   279,   212,   172,   158,   228,
      28,   504,   595,   159,   326,   110,   228,   490,   531,   204,
     172,   204,   107,   321,   541,   534,   505,   217,    93,   600,
     325,   165,   211,   315,   670,   101,   212,   279,   165,   210,
     164,   335,   625,   155,   160,   161,   548,   279,    28,     2,
     315,   315,   356,   359,   315,     2,   535,   338,   177,   368,
     164,   131,   169,   561,   103,   285,   132,   133,   228,   169,
      93,   671,   416,     2,   134,   135,   210,   111,   112,   113,
     239,   638,   373,   673,   244,   374,   575,    93,   210,   171,
     578,   106,   683,   649,   136,   137,   171,   210,   719,   537,
     604,   721,   379,   210,   582,   170,   210,   105,   388,   432,
      93,   593,   170,   433,    93,   165,   142,   143,   389,    28,
     158,   332,   390,   272,    28,   159,   158,   440,    93,   371,
     210,   159,   332,    28,    28,   669,   445,   359,   391,   672,
     253,   254,   675,   251,   252,   300,   169,   323,   377,   378,
     490,   490,   259,   260,   172,   395,   160,   161,   441,   622,
       2,   451,   160,   161,   356,   547,   452,   456,   696,   697,
     356,   698,   164,   171,   700,   461,   457,   315,   164,   315,
     315,   315,   315,   460,   628,   462,   463,   528,   114,   170,
     471,   115,   116,   473,   529,   544,   117,   563,   357,   720,
     549,  -316,   573,   228,   172,   574,   229,   579,    93,   355,
     576,   639,   640,   642,   577,   580,   734,   583,   584,   736,
     590,   585,   586,    28,    28,    28,    28,   172,    28,   588,
     591,   158,   610,   606,   611,    28,   159,   315,   655,   315,
     605,   630,    28,   623,   272,   272,   618,  -318,   357,  -317,
     635,    28,     2,   636,   643,   637,   111,   112,   113,   490,
     255,   256,   257,   258,   357,   300,   646,   160,   161,   656,
     117,   418,   357,   300,   648,   380,   652,    28,   678,   212,
     435,    28,   357,   666,    28,    28,   667,  -319,  -320,   668,
     300,   300,    28,   681,   300,   674,   703,   718,   695,   315,
     315,   699,    93,   724,   702,   725,   735,   739,   261,   740,
      28,    28,   741,    28,    28,   742,    28,    28,   263,   262,
      28,   681,    93,   745,   746,   357,   264,   150,   265,   487,
     207,   172,   679,   107,   627,   555,   315,   315,   172,   559,
     507,    28,     2,   518,   272,   602,   111,   112,   113,   357,
     357,   365,   502,     0,     0,     0,   357,   366,    28,     2,
     367,    28,    28,   681,     0,     2,     0,   114,   530,   533,
     115,   116,     0,     0,   539,   357,     0,   300,     0,   357,
       0,   357,     0,     0,   357,     0,     0,     0,   357,     0,
       8,     0,     0,     0,   357,     0,   357,   118,   119,   120,
     121,   122,   123,   124,   125,   126,   127,   357,   361,     0,
       0,     0,     0,     0,     0,   172,     0,   300,     0,   300,
     300,   300,   300,     0,     0,     0,     0,     0,     0,     0,
     158,    85,     0,   166,    85,   159,   158,   104,     0,     0,
     178,   159,     0,     0,     0,     0,   166,     0,   487,     0,
     589,     0,     0,   213,   594,     0,     0,   114,     0,   418,
     115,   116,   487,   487,     0,     0,   160,   161,     0,     0,
     104,     0,   160,   161,   356,    68,    69,   300,   414,   300,
       0,     0,     0,   357,   357,     0,     0,     0,     0,     0,
       0,     0,   442,   443,   444,   446,     0,     0,     0,     1,
       0,     2,     3,     4,    85,  -331,    76,   620,     0,   621,
    -331,     0,   357,   166,     0,     0,     0,    85,   128,   104,
     357,   357,     0,     0,    85,   357,     8,     0,     0,     0,
       0,     0,   104,     0,   632,     0,     0,     0,     0,   300,
     300,  -331,  -331,     0,     0,     0,     0,   166,     0,     0,
       0,     0,   487,     0,     0,     0,     0,   164,   166,     0,
       0,     0,   213,     0,   487,     0,     0,     0,     0,     9,
      10,   487,     0,   104,     0,     0,   300,   300,     0,   277,
       0,     0,     0,     0,    85,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   104,     0,
      12,    13,     0,     0,     0,     0,   487,     0,     0,     0,
     487,   175,     0,   487,     0,     0,    50,     0,    16,   357,
       0,     0,     0,     0,   175,     0,     0,     0,     0,     0,
     381,   220,     0,    85,   345,     0,     0,     0,     0,   487,
     487,     0,   487,     0,     0,   487,   104,   410,     0,     0,
       0,    85,     0,   419,     0,     0,     0,     0,     0,   104,
       0,     0,     0,     0,   438,     0,     0,     0,     0,     0,
     487,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   487,     0,     0,
     487,   175,     0,   287,     0,   289,     0,     0,     0,     0,
       0,    85,     0,     0,     0,     0,     0,   410,     0,     0,
       0,     0,     0,    85,     0,     0,   403,    85,     0,    85,
       0,     0,     0,     0,    85,   175,   104,     0,     0,     0,
       0,   381,     0,    85,   227,     0,   175,     0,   515,     0,
     220,     0,   347,   104,   104,     0,     0,   104,   454,     0,
       0,   213,     0,     0,     0,     0,   540,     0,     0,   410,
       0,     0,     0,   515,     0,     0,   410,     0,     0,     0,
      85,   470,     0,     0,     0,   227,   556,     0,     0,     0,
       0,     0,   104,     0,     0,     0,     0,     0,     0,     0,
       0,   658,   659,     0,     0,     0,     0,     0,     0,     0,
     301,     0,    85,     0,     0,     0,     0,     0,   387,     0,
       0,     0,    85,     0,     0,   393,     0,     0,     0,     0,
       0,     0,   536,     0,     0,   412,     0,     0,    85,     0,
     104,   425,   427,     0,     0,    85,   688,   689,     0,   690,
     691,   410,     0,     0,     0,     0,     0,     0,   227,     0,
       0,     0,     0,     0,     0,   562,     0,     0,     0,     0,
     706,   227,   707,     0,     0,   515,     0,     0,   716,   717,
     104,     0,   104,   104,   104,   104,     0,     0,     0,     0,
       0,     0,     0,     0,   726,   412,   727,     0,   728,     0,
     729,     0,     0,     0,   515,     0,     0,     0,     0,     0,
       0,     0,   515,   410,     0,     0,   743,     0,   744,   387,
     514,     0,    85,     0,     0,   104,   104,     0,     0,   386,
       0,     0,     0,     0,     0,     0,     0,     0,   301,   220,
     104,     0,   104,   384,     0,     0,   386,   412,   287,   543,
       0,     0,   424,   426,   412,   301,   301,     0,   551,   301,
     384,     0,     0,   439,     0,     0,   384,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   104,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   227,     0,     0,     0,
       0,     0,   104,   104,     0,     0,   386,     0,     0,     0,
       0,   410,     0,     0,     0,     0,     0,     0,     0,     0,
     384,     0,     0,     0,     0,     0,     0,     0,     0,   412,
     386,   513,     0,     0,   104,     0,     0,   386,     0,   104,
     104,     0,     0,     0,   384,   512,     0,     0,     0,     0,
       0,   384,     0,     0,     0,     0,     0,     0,   386,     0,
     513,     0,   386,     0,   301,   386,     0,     0,     0,   550,
       0,     2,   384,     0,   512,   557,   384,   558,     0,   384,
       0,     0,   301,   512,   301,   301,   301,   301,   566,   384,
       0,   412,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
     386,     0,   301,    76,   301,     0,     0,     0,     0,     0,
       0,     0,     0,    77,   384,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   386,   513,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   384,   512,
      79,    80,     0,   227,     0,    81,     0,   434,     0,   412,
       0,     0,     0,   386,     0,     0,     0,     0,     0,     0,
       0,   626,   386,     0,   301,   301,   629,   384,     0,     0,
       0,     0,     0,     0,     0,   384,   384,     0,     0,     1,
     512,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   301,   301,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
     474,   475,   476,   477,   478,   479,   480,   481,   482,   483,
     484,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,   485,     0,     0,     0,     0,
     386,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   384,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   486,   359,
    -368,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
     474,   475,   476,   477,   478,   479,   480,   481,   482,   483,
     484,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,   485,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   486,   359,
    -367,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
     474,   475,   476,   477,   478,   479,   480,   481,   482,   483,
     484,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,   485,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   486,   359,
    -369,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   223,   224,
     225,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   223,   224,
     269,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   223,   224,
     353,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   364,   224,
    -423,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     9,
      10,    11,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      79,    80,     0,     0,     0,    81,    15,     1,    16,     2,
       3,     4,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   223,   224,
     624,     0,     0,     0,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,     0,   294,     0,     0,     9,    10,     0,
     158,    76,     0,     0,   295,   159,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   160,   161,    79,    80,
       0,     0,     0,    81,   296,     1,    16,     2,     3,     4,
       0,     0,   164,     0,     0,   297,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   298,     0,   299,     0,
       0,     0,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,     0,   294,     0,     0,     9,    10,     0,   158,    76,
       0,     0,   295,   159,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   160,   161,    79,    80,     0,     0,
       0,    81,   296,     1,    16,     2,     3,     4,     0,     0,
     164,     0,     0,   297,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   298,     0,   428,     0,     0,     0,
       8,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,     0,
     294,     0,     0,     9,    10,     0,   158,    76,     0,     0,
     295,   159,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   160,   161,    79,    80,     0,     0,     0,    81,
     296,     1,    16,     2,     3,     4,     0,     0,   164,     0,
       0,   297,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   298,     0,   447,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,   294,     0,
       0,     9,    10,     0,   158,    76,     0,     0,   295,   159,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     160,   161,    79,    80,     0,     0,     0,    81,   296,     1,
      16,     2,     3,     4,     0,     0,   164,     0,     0,   297,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     298,     0,   449,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,   294,     0,     0,     9,
      10,     0,   158,    76,     0,     0,   295,   159,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   160,   161,
      79,    80,     0,     0,     0,    81,   296,     1,    16,     2,
       3,     4,     0,     0,   164,     0,     0,   297,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   298,     0,
     567,     0,     0,     0,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,     0,   294,     0,     0,     9,    10,     0,
     158,    76,     0,     0,   295,   159,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   160,   161,    79,    80,
       0,     0,     0,    81,   296,     1,    16,     2,     3,     4,
       0,     0,   164,     0,     0,   297,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   298,     0,   568,     0,
       0,     0,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,     0,   294,     0,     0,     9,    10,     0,   158,    76,
       0,     0,   295,   159,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   160,   161,    79,    80,     0,     0,
       0,    81,   296,     1,    16,     2,     3,     4,     0,     0,
     164,     0,     0,   297,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   298,     0,   569,     0,     0,     0,
       8,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,     0,
     294,     0,     0,     9,    10,     0,   158,    76,     0,     0,
     295,   159,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   160,   161,    79,    80,     0,     0,     0,    81,
     296,     1,    16,     2,     3,     4,     0,     0,   164,     0,
       0,   297,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   298,     0,   572,     0,     0,     0,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,   294,     0,
       0,     9,    10,     0,   158,    76,     0,     0,   295,   159,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     160,   161,    79,    80,     0,     0,     0,    81,   296,     1,
      16,     2,     3,     4,     0,     0,   164,     0,     0,   297,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     298,     0,   633,     0,     0,     0,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,   294,     0,     0,     9,
      10,     0,   158,    76,     0,     0,   295,   159,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   160,   161,
      79,    80,     0,     0,     0,    81,   296,     1,    16,     2,
       3,     4,     0,     0,   164,     0,     0,   297,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   298,     0,
     634,     0,     0,     0,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,     0,   294,     0,     0,     9,    10,     0,
     158,    76,     0,     0,   295,   159,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   160,   161,    79,    80,
       0,     0,     0,    81,   296,     1,    16,     2,     3,     4,
       0,     0,   164,     0,     0,   297,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   298,     0,   653,     0,
       0,     0,     8,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
      75,     0,   294,     0,     0,     9,    10,     0,   158,    76,
       0,     0,   295,   159,     8,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   160,   161,    79,    80,     0,     0,
       0,    81,   296,     0,    16,     0,     0,     9,    10,    11,
     164,     0,     0,   297,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   298,     0,   654,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,   680,   737,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,     0,   474,   475,
     476,   477,   478,   479,   480,   481,   482,   483,   484,     0,
       0,     0,    75,     0,     0,     0,     0,     9,    10,    11,
       0,    76,     0,   485,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    79,    80,
       0,     0,     0,    81,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   486,   359,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,   474,   475,
     476,   477,   478,   479,   480,   481,   482,   483,   484,     8,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       8,     0,     9,    10,    11,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     0,     0,     0,
       0,     0,     0,    12,    13,     0,   486,   359,     0,     0,
      14,     0,     0,     9,    10,    11,     0,     0,     0,    15,
     240,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,   224,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     8,
      15,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   224,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       1,    16,     2,     3,     4,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   680,     0,     0,     0,     0,     8,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,    75,     0,   294,     0,     0,
       9,    10,     0,   158,    76,     0,     0,   295,   159,     8,
       0,     0,     0,     0,    77,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   160,
     161,    79,    80,     8,     0,     0,    81,   296,     0,    16,
       0,     0,     9,    10,    11,   164,     0,     0,   297,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   298,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     9,    10,    11,     1,
      14,     2,     3,     4,     5,     0,     6,     7,     0,    15,
     644,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     8,    12,    13,     0,
       0,   486,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,    15,   676,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   486,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     2,     0,    15,     0,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   592,     8,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,   399,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    75,     0,     0,
       0,     0,     0,     0,     0,   158,    76,     0,     0,     0,
     159,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   160,   161,    79,    80,     0,     0,     0,    81,   211,
       2,     0,     0,   212,     0,     0,     0,   164,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   532,     0,     0,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,     0,     0,     0,     0,     0,
       0,   158,    76,     0,     0,     0,   159,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   160,   161,    79,
      80,     0,     0,     2,    81,   415,     0,     0,     0,     0,
       0,     0,     0,   164,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   416,     0,   417,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     0,     0,     0,   158,    76,     0,     0,     0,   159,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     160,   161,    79,    80,     0,     0,     0,    81,   356,     0,
       1,     0,     2,     3,     4,     5,   164,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     597,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       9,    10,    11,   158,    76,     0,     0,     0,   159,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,    12,    13,     0,     0,     0,     0,     0,    14,   160,
     161,    79,    80,     0,     0,     0,     0,   408,    99,    16,
       0,     0,     0,     0,    17,   409,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       9,    10,    11,     1,    76,     2,     3,     4,     5,     0,
       6,     7,     0,     0,    77,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,    78,
       8,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    79,    80,     8,     0,     0,     0,    15,    99,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,   158,     0,     0,     0,
       0,   159,     0,     0,     0,     0,     9,    10,    11,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    14,   160,   161,     0,     0,     8,    12,    13,     0,
     408,    99,    16,     0,    14,     0,     0,    17,   409,    19,
      20,    21,    22,    15,    99,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     8,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,    16,     0,
       0,   343,     0,    17,    18,    19,    20,    21,    22,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     9,    10,    11,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     8,    12,    13,     0,    15,     0,    16,     0,
      14,   468,     0,    17,    18,    19,    20,    21,    22,    15,
       0,    16,     0,     0,   560,     0,    17,    18,    19,    20,
      21,    22,     9,    10,    11,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     9,    10,    11,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     8,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     8,    12,    13,     0,    15,
     641,    16,     0,    14,     0,     0,    17,    18,    19,    20,
      21,    22,    15,   701,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     9,    10,    11,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     9,    10,
      11,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     0,     8,    12,
      13,     0,    15,     0,    16,     0,    14,     0,     0,    17,
      18,    19,    20,    21,    22,    48,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     9,    10,
      11,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,    12,    13,     0,    50,     2,    16,     0,    14,
       0,     0,    17,    18,    19,    20,    21,    22,    97,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     8,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    75,
       0,     0,     0,     0,     0,     0,     0,   158,    76,     0,
       0,     0,   159,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     2,     0,     0,     0,     0,
       0,     0,     0,   160,   161,    79,    80,     0,     0,     0,
      81,   380,   340,     0,     0,   212,     0,     0,     0,   164,
       8,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,     0,
       0,     0,     0,     0,     0,     0,   158,    76,     0,     0,
       0,   159,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     2,     0,     0,     0,     0,     0,
       0,     0,   160,   161,    79,    80,     0,     0,     0,    81,
     380,     0,     0,     0,   212,     0,     0,     0,   164,     8,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    75,     0,     0,
       0,     0,     0,     0,     0,   158,    76,     0,     0,     0,
     159,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   160,   161,    79,    80,     0,     0,     0,    81,   356,
       0,     0,     0,     0,     0,     0,     0,   164,     8,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,     0,     0,     0,
       0,     0,     0,     0,   158,    76,     0,     0,     0,   159,
       0,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     160,   161,    79,    80,     0,     0,     0,    81,   211,   340,
       0,     0,   212,     0,     0,     0,   164,     8,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,     0,     0,     0,     0,
       0,     0,     0,   158,    76,     0,     0,     0,   159,     0,
       0,     0,     0,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   160,
     161,    79,    80,     0,     0,     0,    81,   162,     0,     0,
       0,   163,     0,     0,     0,   164,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
       0,     0,   158,    76,     0,     0,     0,   159,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   160,   161,
      79,    80,     0,     0,     0,    81,   162,     0,     0,     0,
     205,     0,     0,     0,   164,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,     0,     0,     0,     0,     0,
       0,   158,    76,     0,     0,     0,   159,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   160,   161,    79,
      80,     0,     0,     0,    81,   162,   278,     0,     0,     0,
       0,     0,     0,   164,     8,    53,    54,    55,    56,    57,
     180,   181,   182,   183,   184,   185,   186,   187,   188,   189,
      68,    69,   190,   191,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   192,     0,     0,     0,     0,     0,     0,     0,
     158,    76,     0,     0,     0,   159,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   193,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   160,   161,   194,   195,
       0,     0,     0,    81,   162,     0,     0,     0,   327,     0,
       0,     0,   164,     8,    53,    54,    55,    56,    57,   180,
     181,   182,   183,   184,   185,   186,   187,   188,   189,    68,
      69,   190,   191,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   192,     0,     0,     0,     0,     0,     0,     0,   158,
      76,     0,     8,     0,   159,     0,     0,     0,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,   193,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   160,   161,   194,   195,     0,
      75,     0,    81,   162,     0,     0,     0,   336,   158,    76,
       0,   164,     0,   159,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   160,   161,    79,    80,     0,     0,
       0,     0,   211,     0,     0,     0,   212,     0,     0,     0,
     164,     8,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    75,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,    80,     0,     0,     0,
      81,     0,   396,     8,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    75,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,    80,     0,
       0,     0,    81,     0,   466,     8,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
      80,     0,     0,     0,    81,   545,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,   517,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,    80,     0,     0,     0,    81,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,    80,     0,     0,     0,    81,     8,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,   399,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,    80,     0,     0,     0,    81,     8,    53,    54,    55,
      56,    57,   180,   181,   182,   183,   184,   185,   186,   187,
     188,   189,    68,    69,   190,   191,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   192,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   193,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     194,   195,     0,     0,     0,    81
};

static const yytype_int16 yycheck[] =
{
       0,     0,    15,    13,   151,     5,     6,     7,     3,    16,
     213,   102,   166,   114,    14,    15,   229,   220,   279,   527,
      95,   175,     3,   162,    10,   360,     9,    13,   129,    12,
     360,    15,     3,     3,   355,    48,   294,    50,    44,    45,
     387,   302,    17,     5,    29,    70,    69,    28,    48,   150,
      50,   588,   124,    74,   304,    69,    70,    28,    15,   321,
     322,    12,    13,   325,    48,   412,   138,    82,    89,    75,
       3,   119,   124,    94,    15,    96,   124,   224,   425,    94,
      95,    96,   295,    70,    97,    48,   141,   162,   140,   302,
     142,    48,    94,   414,    96,   125,    69,    97,    82,   135,
      69,     3,    70,   116,    94,   613,    96,    48,   645,   136,
      94,    95,    96,    97,   114,   114,   116,   142,   102,   142,
     126,   196,   680,   118,   110,    82,    69,   110,   142,   129,
     129,   126,   207,    16,    97,   289,   149,    94,    95,    96,
      97,    82,   400,   141,   347,   102,   131,   132,   133,   149,
     150,   150,   291,   163,    95,   142,    97,   178,   493,   494,
     141,   102,   137,   493,   722,   151,     3,   514,   151,   142,
     141,   141,   311,   142,   142,   196,     3,   163,   381,   162,
     164,   196,   133,   134,   387,   118,   207,     0,   279,   451,
     452,    28,   207,   406,   196,   205,   543,   124,   448,   142,
     450,    28,   212,   453,   551,   207,   196,    69,    70,   348,
     210,   210,   196,   140,   229,   222,   118,   207,     3,   205,
     122,    69,    70,   207,   126,    79,   212,     3,   211,   490,
      69,    70,   118,   124,   119,    70,   221,    74,   224,   196,
     124,   224,    79,    28,   123,   229,   508,   118,   510,   140,
     207,   237,    28,   123,   237,   126,   110,   111,   142,    44,
       3,   124,   141,   123,   279,   176,   118,   602,    44,   370,
     122,   141,   229,   110,   111,   124,   121,   140,   119,   294,
     142,   141,   292,   296,   138,    28,     3,   302,   229,    74,
      75,   552,    28,   142,   142,   279,   296,     3,    74,    75,
      15,    44,   286,   142,   141,   141,   292,   142,   291,   400,
     294,   514,   295,   124,   297,   141,   196,   327,   302,   124,
     570,   571,   279,   118,   124,   335,   336,   207,   311,   140,
     124,    74,    75,    48,   119,   140,   118,   479,   279,   349,
     140,   327,   142,   119,   122,   302,   140,   118,   124,   335,
     336,   119,   494,   294,   119,    26,   124,   607,   608,   124,
     360,   302,   118,   349,   374,   348,   122,    82,    74,   355,
     370,   370,   138,    79,   118,   141,   362,   360,   399,    94,
      95,    96,    97,   141,   405,   400,   372,   102,   374,   650,
     141,   406,   118,   304,   119,   408,   122,   380,   413,   124,
     126,   122,   549,    74,   110,   111,   416,   390,   408,     3,
     321,   322,   118,   141,   325,     3,   400,   119,    89,   142,
     126,   126,   406,   433,   408,   409,   131,   132,   414,   413,
     416,   119,   138,     3,   127,   128,   124,     7,     8,     9,
     111,   583,   142,   119,   115,   139,   456,   433,   124,   406,
     460,   408,   119,   595,    10,    11,   413,   124,   119,   400,
     602,   119,   119,   124,   474,   406,   124,   408,   119,   118,
     456,   484,   413,   122,   460,   490,    14,    15,   119,   479,
      74,   196,   124,   154,   484,    79,    74,   140,   474,   123,
     124,    79,   207,   493,   494,   637,   140,   141,   123,   641,
     136,   137,   644,   134,   135,   176,   490,   178,   275,   276,
     493,   494,   142,   143,   229,   118,   110,   111,   140,   540,
       3,   141,   110,   111,   118,   119,   141,   122,   670,   671,
     118,   673,   126,   490,   676,   119,   123,   448,   126,   450,
     451,   452,   453,   122,   554,   119,   123,   119,   118,   490,
     142,   121,   122,   142,   123,   119,   227,   119,   229,   701,
     141,   141,   119,   549,   279,   123,   549,   119,   554,   139,
     123,   584,   585,   586,   123,   123,   718,   138,   118,   721,
     140,   118,   118,   583,   584,   585,   586,   302,   588,   118,
     140,    74,   119,   140,   118,   595,    79,   508,   611,   510,
     142,   123,   602,   119,   275,   276,   141,   141,   279,   141,
     123,   611,     3,   123,    56,   138,     7,     8,     9,   602,
     138,   139,   140,   141,   295,   296,   140,   110,   111,   119,
     301,   302,   303,   304,   139,   118,   139,   637,   648,   122,
     311,   641,   313,   141,   644,   645,   142,   141,   141,   138,
     321,   322,   652,   652,   325,   118,   140,    64,   668,   570,
     571,   674,   648,   142,   677,   142,   140,   142,   144,   142,
     670,   671,   142,   673,   674,   142,   676,   677,   146,   145,
     680,   680,   668,   142,   142,   356,   147,    41,   148,   360,
      96,   406,   650,   408,   552,   422,   607,   608,   413,   430,
     375,   701,     3,   390,   375,   493,     7,     8,     9,   380,
     381,   237,   362,    -1,    -1,    -1,   387,   237,   718,     3,
     237,   721,   722,   722,    -1,     3,    -1,   118,   399,   400,
     121,   122,    -1,    -1,   405,   406,    -1,   408,    -1,   410,
      -1,   412,    -1,    -1,   415,    -1,    -1,    -1,   419,    -1,
      28,    -1,    -1,    -1,   425,    -1,   427,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   438,   232,    -1,
      -1,    -1,    -1,    -1,    -1,   490,    -1,   448,    -1,   450,
     451,   452,   453,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,     9,    -1,    82,    12,    79,    74,    15,    -1,    -1,
      89,    79,    -1,    -1,    -1,    -1,    95,    -1,   479,    -1,
     481,    -1,    -1,   102,   485,    -1,    -1,   118,    -1,   490,
     121,   122,   493,   494,    -1,    -1,   110,   111,    -1,    -1,
      48,    -1,   110,   111,   118,    44,    45,   508,   139,   510,
      -1,    -1,    -1,   514,   515,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   316,   317,   318,   319,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,    82,    74,    75,   538,    -1,   540,
      79,    -1,   543,   162,    -1,    -1,    -1,    95,   139,    97,
     551,   552,    -1,    -1,   102,   556,    28,    -1,    -1,    -1,
      -1,    -1,   110,    -1,   565,    -1,    -1,    -1,    -1,   570,
     571,   110,   111,    -1,    -1,    -1,    -1,   196,    -1,    -1,
      -1,    -1,   583,    -1,    -1,    -1,    -1,   126,   207,    -1,
      -1,    -1,   211,    -1,   595,    -1,    -1,    -1,    -1,    71,
      72,   602,    -1,   151,    -1,    -1,   607,   608,    -1,   157,
      -1,    -1,    -1,    -1,   162,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   176,    -1,
     102,   103,    -1,    -1,    -1,    -1,   637,    -1,    -1,    -1,
     641,    82,    -1,   644,    -1,    -1,   118,    -1,   120,   650,
      -1,    -1,    -1,    -1,    95,    -1,    -1,    -1,    -1,    -1,
     279,   102,    -1,   211,   212,    -1,    -1,    -1,    -1,   670,
     671,    -1,   673,    -1,    -1,   676,   224,   296,    -1,    -1,
      -1,   229,    -1,   302,    -1,    -1,    -1,    -1,    -1,   237,
      -1,    -1,    -1,    -1,   313,    -1,    -1,    -1,    -1,    -1,
     701,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   718,    -1,    -1,
     721,   162,    -1,   164,    -1,   166,    -1,    -1,    -1,    -1,
      -1,   279,    -1,    -1,    -1,    -1,    -1,   356,    -1,    -1,
      -1,    -1,    -1,   291,    -1,    -1,   294,   295,    -1,   297,
      -1,    -1,    -1,    -1,   302,   196,   304,    -1,    -1,    -1,
      -1,   380,    -1,   311,   110,    -1,   207,    -1,   387,    -1,
     211,    -1,   213,   321,   322,    -1,    -1,   325,   326,    -1,
      -1,   400,    -1,    -1,    -1,    -1,   405,    -1,    -1,   408,
      -1,    -1,    -1,   412,    -1,    -1,   415,    -1,    -1,    -1,
     348,   349,    -1,    -1,    -1,   151,   425,    -1,    -1,    -1,
      -1,    -1,   360,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   615,   616,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     176,    -1,   380,    -1,    -1,    -1,    -1,    -1,   279,    -1,
      -1,    -1,   390,    -1,    -1,   286,    -1,    -1,    -1,    -1,
      -1,    -1,   400,    -1,    -1,   296,    -1,    -1,   406,    -1,
     408,   302,   303,    -1,    -1,   413,   660,   661,    -1,   663,
     664,   490,    -1,    -1,    -1,    -1,    -1,    -1,   224,    -1,
      -1,    -1,    -1,    -1,    -1,   433,    -1,    -1,    -1,    -1,
     684,   237,   686,    -1,    -1,   514,    -1,    -1,   692,   693,
     448,    -1,   450,   451,   452,   453,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   708,   356,   710,    -1,   712,    -1,
     714,    -1,    -1,    -1,   543,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   551,   552,    -1,    -1,   730,    -1,   732,   380,
     381,    -1,   490,    -1,    -1,   493,   494,    -1,    -1,   279,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   304,   400,
     508,    -1,   510,   279,    -1,    -1,   296,   408,   409,   410,
      -1,    -1,   302,   303,   415,   321,   322,    -1,   419,   325,
     296,    -1,    -1,   313,    -1,    -1,   302,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   549,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   362,    -1,    -1,    -1,
      -1,    -1,   570,   571,    -1,    -1,   356,    -1,    -1,    -1,
      -1,   650,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     356,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   490,
     380,   381,    -1,    -1,   602,    -1,    -1,   387,    -1,   607,
     608,    -1,    -1,    -1,   380,   381,    -1,    -1,    -1,    -1,
      -1,   387,    -1,    -1,    -1,    -1,    -1,    -1,   408,    -1,
     410,    -1,   412,    -1,   430,   415,    -1,    -1,    -1,   419,
      -1,     3,   408,    -1,   410,   425,   412,   427,    -1,   415,
      -1,    -1,   448,   419,   450,   451,   452,   453,   438,   425,
      -1,   552,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
     490,    -1,   508,    75,   510,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,   490,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   514,   515,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   514,   515,
     112,   113,    -1,   549,    -1,   117,    -1,   119,    -1,   650,
      -1,    -1,    -1,   543,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   551,   552,    -1,   570,   571,   556,   543,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   551,   552,    -1,    -1,     1,
     556,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   607,   608,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
     650,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   650,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   140,   141,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,     1,   120,     3,
       4,     5,    -1,   125,   126,   127,   128,   129,   130,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,   141,
     142,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,     1,   120,     3,     4,     5,
      -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,     1,   120,     3,     4,     5,    -1,    -1,
     126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,     1,   120,     3,     4,     5,    -1,    -1,   126,    -1,
      -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,     1,
     120,     3,     4,     5,    -1,    -1,   126,    -1,    -1,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,   142,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,     1,   120,     3,
       4,     5,    -1,    -1,   126,    -1,    -1,   129,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,     1,   120,     3,     4,     5,
      -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,     1,   120,     3,     4,     5,    -1,    -1,
     126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,     1,   120,     3,     4,     5,    -1,    -1,   126,    -1,
      -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   140,    -1,   142,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,     1,
     120,     3,     4,     5,    -1,    -1,   126,    -1,    -1,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,   142,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,     1,   120,     3,
       4,     5,    -1,    -1,   126,    -1,    -1,   129,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,
     142,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,     1,   120,     3,     4,     5,
      -1,    -1,   126,    -1,    -1,   129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,   142,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    28,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,   120,    -1,    -1,    71,    72,    73,
     126,    -1,    -1,   129,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   140,    -1,   142,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,   120,    -1,    -1,    -1,
      -1,   125,   126,   127,   128,   129,   130,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,   141,   142,    -1,
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
      -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,    -1,
      -1,   125,   126,   127,   128,   129,   130,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   140,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      28,    -1,    71,    72,    73,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,    -1,   120,    -1,    -1,    -1,
      -1,   125,   126,   127,   128,   129,   130,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,   140,   141,    -1,    -1,
     109,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,   118,
     119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,
     129,   130,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,   141,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     118,    -1,   120,    -1,    -1,    -1,    -1,   125,   126,   127,
     128,   129,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
       1,   120,     3,     4,     5,    -1,   125,   126,   127,   128,
     129,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    28,
      -1,    -1,    -1,    -1,    85,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    28,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,    71,    72,    73,   126,    -1,    -1,   129,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    71,    72,    73,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,    -1,   118,
     119,   120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,
     129,   130,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,   140,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,   119,   120,    -1,    -1,    -1,    -1,
     125,   126,   127,   128,   129,   130,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,     3,    -1,   118,    -1,   120,    -1,
      -1,    -1,    -1,   125,   126,   127,   128,   129,   130,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
       3,    -1,    -1,   122,    -1,    -1,    -1,   126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,     3,   117,   118,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   126,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   138,    -1,   140,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
       1,    -1,     3,     4,     5,     6,   126,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    -1,    -1,    -1,   118,   119,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    75,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    85,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   100,
      28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    28,    -1,    -1,    -1,   118,   119,   120,
      -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,   130,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    -1,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,    -1,    -1,    28,   102,   103,    -1,
     118,   119,   120,    -1,   109,    -1,    -1,   125,   126,   127,
     128,   129,   130,   118,   119,   120,    -1,    -1,    -1,    -1,
     125,   126,   127,   128,   129,   130,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,   127,   128,   129,   130,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,   118,    -1,   120,    -1,
     109,   123,    -1,   125,   126,   127,   128,   129,   130,   118,
      -1,   120,    -1,    -1,   123,    -1,   125,   126,   127,   128,
     129,   130,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,   118,
     119,   120,    -1,   109,    -1,    -1,   125,   126,   127,   128,
     129,   130,   118,   119,   120,    -1,    -1,    -1,    -1,   125,
     126,   127,   128,   129,   130,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    71,    72,
      73,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    28,   102,
     103,    -1,   118,    -1,   120,    -1,   109,    -1,    -1,   125,
     126,   127,   128,   129,   130,   118,    -1,   120,    -1,    -1,
      -1,    -1,   125,   126,   127,   128,   129,   130,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,   118,     3,   120,    -1,   109,
      -1,    -1,   125,   126,   127,   128,   129,   130,   118,    -1,
     120,    -1,    -1,    -1,    -1,   125,   126,   127,   128,   129,
     130,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,   119,    -1,    -1,   122,    -1,    -1,    -1,   126,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,     3,    -1,    -1,    -1,    -1,    -1,
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
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   126,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,   119,
      -1,    -1,   122,    -1,    -1,    -1,   126,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
      -1,   122,    -1,    -1,    -1,   126,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,    -1,
     122,    -1,    -1,    -1,   126,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,    -1,
      -1,    -1,    -1,   126,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,    -1,    -1,   122,    -1,
      -1,    -1,   126,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    28,    -1,    79,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      66,    -1,   117,   118,    -1,    -1,    -1,   122,    74,    75,
      -1,   126,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,    -1,   118,    -1,    -1,    -1,   122,    -1,    -1,    -1,
     126,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    -1,   119,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    -1,   119,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   118,   120,   125,   126,   127,
     128,   129,   130,   144,   145,   146,   148,   150,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   184,   185,   233,   235,   249,   118,   151,
     118,   151,   151,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    66,    75,    85,   100,   112,
     113,   117,   171,   176,   183,   184,   186,   188,   189,   190,
     198,   199,   151,   164,   168,   171,   168,   118,   151,   119,
     165,   167,   170,   183,   184,   186,   188,   199,   218,   233,
     141,     7,     8,     9,   118,   121,   122,   144,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,   139,   166,
     153,   126,   131,   132,   127,   128,    10,    11,    12,    13,
     133,   134,    14,    15,   125,   135,   136,    16,    17,   137,
     166,   141,     0,   218,   141,   144,   185,   118,    74,    79,
     110,   111,   118,   122,   126,   176,   177,   178,   182,   183,
     186,   188,   199,   203,   205,   213,   141,   144,   177,   185,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      46,    47,    66,   100,   112,   113,   173,   176,   183,   185,
     187,   188,   189,   198,   199,   122,   205,   173,   218,   119,
     124,   118,   122,   177,   183,   186,   188,   199,   202,   204,
     213,   119,   121,   140,   141,   142,   147,   148,   164,   171,
     220,   236,   242,   243,   244,   245,   246,   247,   248,   144,
     119,   147,   149,   165,   144,   167,   147,   165,   153,   153,
     153,   154,   154,   155,   155,   156,   156,   156,   156,   157,
     157,   158,   159,   160,   161,   162,   167,   147,   165,   142,
     248,   119,   144,   200,   201,   141,   141,   184,   119,   171,
     205,   214,   215,   216,   168,   183,   212,   213,   203,   213,
     118,   118,   122,   203,    68,    78,   118,   129,   140,   142,
     144,   148,   171,   177,   191,   192,   193,   194,   195,   207,
     208,   210,   211,   213,   234,   235,   237,   238,   239,   240,
     241,   141,   141,   144,   185,   141,   118,   122,   176,   183,
     187,   188,   199,   205,   168,   122,   122,   205,   119,   165,
     119,   204,   214,   123,   168,   184,   202,   213,   118,   122,
     202,   153,   233,   142,   248,   139,   118,   144,   208,   141,
     227,   228,   124,   140,   140,   243,   245,   246,   142,   119,
     124,   123,   138,   142,   139,   124,   142,   200,   200,   119,
     118,   177,   204,   206,   207,   209,   211,   213,   119,   119,
     124,   123,   183,   213,   203,   118,   119,   214,   168,    50,
     172,   176,   183,   184,   186,   190,   171,   208,   118,   126,
     177,   206,   213,   171,   139,   118,   138,   140,   144,   177,
     196,   197,   206,   208,   211,   213,   211,   213,   142,   195,
     124,   140,   118,   122,   119,   144,   214,   217,   177,   211,
     140,   140,   228,   228,   228,   140,   228,   142,   191,   142,
     191,   141,   141,   191,   184,   168,   122,   123,   168,   168,
     122,   119,   119,   123,   123,   202,   119,   214,   123,   168,
     184,   142,   220,   142,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    77,   140,   144,   167,   169,
     171,   222,   223,   224,   225,   226,   228,   229,   230,   231,
     232,   234,   244,   147,   165,   164,   168,   201,   140,   142,
     140,   142,   207,   211,   213,   177,   209,    51,   216,     3,
      28,    44,    74,    75,   119,   179,   180,   181,   119,   123,
     144,   185,   141,   144,   176,   183,   184,   186,   204,   144,
     177,   185,   208,   213,   119,   118,   220,   119,   168,   141,
     211,   213,   124,   140,   138,   182,   177,   211,   211,   192,
     123,   168,   184,   119,   119,   124,   211,   142,   142,   142,
     191,   191,   142,   119,   123,   168,   123,   123,   168,   119,
     123,   123,   168,   138,   118,   118,   118,   222,   118,   144,
     140,   140,   140,   167,   144,   138,   140,   140,   174,   175,
     206,   169,   225,   169,   222,   142,   140,   191,   191,   209,
     119,   118,   119,   124,   180,    69,    70,   142,   141,   141,
     144,   144,   185,   119,   142,   248,   211,   197,   168,   211,
     123,   123,   144,   142,   142,   123,   123,   138,   222,   167,
     167,   119,   167,    56,   119,   229,   140,   140,   139,   222,
     124,   140,   139,   142,   142,   167,   119,   180,   228,   228,
      69,    70,   142,    69,    70,   142,   141,   142,   138,   222,
     119,   119,   222,   119,   118,   222,   119,   229,   168,   175,
     141,   165,   219,   119,    70,   142,    69,   142,   228,   228,
     228,   228,    69,    70,   142,   168,   222,   222,   222,   167,
     222,   119,   167,   140,   219,   221,   228,   228,    70,   142,
      69,   142,    70,   142,    69,   142,   228,   228,    64,   119,
     222,   119,   124,   142,   142,   142,   228,   228,   228,   228,
      70,   142,    69,   142,   222,   140,   222,   142,   219,   142,
     142,   142,   142,   228,   228,   142,   142
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
#line 155 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3343 "expression.ec"
	break;
      case 145: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3352 "expression.ec"
	break;
      case 148: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3361 "expression.ec"
	break;
      case 149: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3370 "expression.ec"
	break;
      case 151: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3379 "expression.ec"
	break;
      case 153: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3388 "expression.ec"
	break;
      case 154: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3397 "expression.ec"
	break;
      case 155: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3406 "expression.ec"
	break;
      case 156: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3415 "expression.ec"
	break;
      case 157: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3424 "expression.ec"
	break;
      case 158: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3433 "expression.ec"
	break;
      case 159: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3442 "expression.ec"
	break;
      case 160: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3451 "expression.ec"
	break;
      case 161: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3460 "expression.ec"
	break;
      case 162: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3469 "expression.ec"
	break;
      case 163: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3478 "expression.ec"
	break;
      case 164: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3487 "expression.ec"
	break;
      case 165: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3496 "expression.ec"
	break;
      case 167: /* "expression" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3505 "expression.ec"
	break;
      case 168: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3514 "expression.ec"
	break;
      case 169: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3523 "expression.ec"
	break;
      case 170: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3532 "expression.ec"
	break;
      case 171: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3541 "expression.ec"
	break;
      case 174: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3550 "expression.ec"
	break;
      case 175: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3559 "expression.ec"
	break;
      case 176: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3568 "expression.ec"
	break;
      case 177: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3577 "expression.ec"
	break;
      case 179: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 187 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3586 "expression.ec"
	break;
      case 180: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 205 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3595 "expression.ec"
	break;
      case 181: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 206 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3604 "expression.ec"
	break;
      case 182: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3613 "expression.ec"
	break;
      case 183: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3622 "expression.ec"
	break;
      case 184: /* "type" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3631 "expression.ec"
	break;
      case 185: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3640 "expression.ec"
	break;
      case 186: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3649 "expression.ec"
	break;
      case 187: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3658 "expression.ec"
	break;
      case 188: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3667 "expression.ec"
	break;
      case 189: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3676 "expression.ec"
	break;
      case 191: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3685 "expression.ec"
	break;
      case 192: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3694 "expression.ec"
	break;
      case 193: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3703 "expression.ec"
	break;
      case 194: /* "property" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3712 "expression.ec"
	break;
      case 195: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 186 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3721 "expression.ec"
	break;
      case 196: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3730 "expression.ec"
	break;
      case 197: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3739 "expression.ec"
	break;
      case 198: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3748 "expression.ec"
	break;
      case 199: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3757 "expression.ec"
	break;
      case 200: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3766 "expression.ec"
	break;
      case 201: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3775 "expression.ec"
	break;
      case 202: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3784 "expression.ec"
	break;
      case 203: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3793 "expression.ec"
	break;
      case 204: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3802 "expression.ec"
	break;
      case 205: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3811 "expression.ec"
	break;
      case 206: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3820 "expression.ec"
	break;
      case 207: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3829 "expression.ec"
	break;
      case 208: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3838 "expression.ec"
	break;
      case 209: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3847 "expression.ec"
	break;
      case 210: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3856 "expression.ec"
	break;
      case 211: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3865 "expression.ec"
	break;
      case 212: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3874 "expression.ec"
	break;
      case 213: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 156 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3883 "expression.ec"
	break;
      case 214: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3892 "expression.ec"
	break;
      case 215: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3901 "expression.ec"
	break;
      case 216: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 172 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3910 "expression.ec"
	break;
      case 217: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3919 "expression.ec"
	break;
      case 218: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 172 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3928 "expression.ec"
	break;
      case 219: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3937 "expression.ec"
	break;
      case 220: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3946 "expression.ec"
	break;
      case 221: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 3955 "expression.ec"
	break;
      case 222: /* "statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3964 "expression.ec"
	break;
      case 223: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 3973 "expression.ec"
	break;
      case 224: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 3982 "expression.ec"
	break;
      case 225: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 3991 "expression.ec"
	break;
      case 226: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4000 "expression.ec"
	break;
      case 227: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4009 "expression.ec"
	break;
      case 228: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4018 "expression.ec"
	break;
      case 229: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4027 "expression.ec"
	break;
      case 230: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4036 "expression.ec"
	break;
      case 231: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4045 "expression.ec"
	break;
      case 232: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4054 "expression.ec"
	break;
      case 233: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 187 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4063 "expression.ec"
	break;
      case 234: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4072 "expression.ec"
	break;
      case 235: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4081 "expression.ec"
	break;
      case 237: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4090 "expression.ec"
	break;
      case 238: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4099 "expression.ec"
	break;
      case 239: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4108 "expression.ec"
	break;
      case 240: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4117 "expression.ec"
	break;
      case 241: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4126 "expression.ec"
	break;
      case 242: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4135 "expression.ec"
	break;
      case 243: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4144 "expression.ec"
	break;
      case 244: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4153 "expression.ec"
	break;
      case 245: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4162 "expression.ec"
	break;
      case 246: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4171 "expression.ec"
	break;
      case 247: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4180 "expression.ec"
	break;
      case 248: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4189 "expression.ec"
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
#line 214 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 220 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 225 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 227 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 229 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 231 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 232 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 233 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 238 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 239 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 243 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 244 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 245 "expression.y"
    { (yyval.exp) = MkExpDummy(); yyerror(); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 249 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 254 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 255 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 256 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 257 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 259 "expression.y"
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
#line 271 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 272 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 273 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 303 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 304 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 305 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 306 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 310 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 311 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 312 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 315 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 316 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 320 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 334 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 335 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 336 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 337 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 338 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 339 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 345 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 350 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 351 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 352 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 357 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 358 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 363 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 364 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 369 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 370 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 371 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 372 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 377 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 378 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 383 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 388 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 393 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 398 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 403 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 408 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 413 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 414 "expression.y"
    { yyerror(); (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 416 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 417 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 421 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 422 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 423 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 424 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 426 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 427 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 428 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 429 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 431 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 435 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 436 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 444 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 445 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 446 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 447 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 451 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 452 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 453 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 454 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 455 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 462 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 463 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 464 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 465 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 466 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 467 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 468 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 469 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 470 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 471 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 476 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 477 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 478 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 479 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 480 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 482 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 483 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 487 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 488 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 489 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 490 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 491 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 492 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 493 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 494 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 495 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 496 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 500 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 501 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 505 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 506 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 510 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 511 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 512 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 513 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 514 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 515 "expression.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 519 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 520 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 524 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 525 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 526 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 531 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 532 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 533 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 534 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 535 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 539 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 540 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 544 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 545 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 546 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 550 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 551 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 555 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 556 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 557 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 561 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 586 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 590 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 591 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 592 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 593 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 594 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 595 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 596 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 599 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 600 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 601 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 636 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 643 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 646 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 648 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 654 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 659 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 663 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 664 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 668 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 669 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 673 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 677 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 678 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 683 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 685 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 687 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 694 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 696 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 698 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 705 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 707 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 709 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 711 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 716 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 718 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 720 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 729 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 730 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 731 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 733 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 740 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 742 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 747 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 749 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 751 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 753 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 755 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 760 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 765 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 766 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 767 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 768 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 769 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 774 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 776 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 781 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 783 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 791 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 793 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 795 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 799 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 801 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 803 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 814 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 816 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 818 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 829 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 831 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 835 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 838 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 840 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 888 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 890 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 896 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 898 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 900 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 902 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 904 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 910 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 913 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 915 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 917 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 925 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 927 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 936 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 938 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 940 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 945 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 949 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 950 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 951 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 952 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 957 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 961 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 962 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 966 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 967 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 968 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 972 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 973 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 977 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 978 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 988 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 990 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 992 "expression.y"
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

  case 349:

/* Line 1464 of yacc.c  */
#line 1007 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1009 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1030 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1032 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1046 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1048 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1050 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1054 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1055 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1059 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1060 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1067 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1068 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1069 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1073 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1078 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1086 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1091 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1095 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1096 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1097 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1102 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1103 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1104 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1108 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1113 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1114 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1115 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1125 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1127 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1132 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1134 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1136 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1138 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1143 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1145 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1150 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1152 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1157 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1162 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1167 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1169 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1174 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1176 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1178 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
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
#line 1188 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1193 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1197 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1198 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1203 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1205 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1210 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1214 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1215 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1216 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1217 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1219 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1224 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1225 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1229 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7250 "expression.ec"
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
#line 1231 "expression.y"


