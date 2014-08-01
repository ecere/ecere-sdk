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
     THREAD = 372,
     WIDE_STRING_LITERAL = 373,
     BUILTIN_OFFSETOF = 374
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
#line 299 "expression.ec"
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
#line 324 "expression.ec"

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
#define YYLAST   7602

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  145
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  427
/* YYNRULES -- Number of states.  */
#define YYNSTATES  748

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   132,     2,     2,   122,   134,   127,     2,
     120,   121,   128,   129,   126,   130,   123,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   140,   142,
     135,   141,   136,   139,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   124,     2,   125,   137,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   143,   138,   144,   131,     2,     2,     2,
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
     115,   116,   117,   118,   119
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
     554,   556,   558,   560,   565,   567,   569,   571,   573,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   601,   606,   608,   614,   619,   624,   628,   634,
     641,   647,   653,   658,   665,   668,   671,   675,   679,   681,
     683,   685,   688,   692,   694,   698,   708,   718,   726,   734,
     740,   751,   762,   771,   780,   787,   796,   805,   812,   819,
     824,   834,   844,   852,   860,   866,   870,   873,   876,   879,
     881,   884,   886,   888,   890,   894,   896,   899,   902,   906,
     912,   915,   918,   923,   929,   937,   945,   951,   953,   957,
     959,   963,   967,   970,   974,   978,   982,   987,   992,   995,
     999,  1003,  1008,  1012,  1015,  1019,  1023,  1028,  1030,  1032,
    1035,  1038,  1041,  1045,  1047,  1049,  1052,  1055,  1058,  1062,
    1064,  1067,  1071,  1073,  1077,  1082,  1086,  1091,  1093,  1096,
    1099,  1103,  1107,  1109,  1111,  1114,  1117,  1120,  1124,  1128,
    1131,  1133,  1136,  1138,  1141,  1144,  1148,  1150,  1154,  1156,
    1160,  1163,  1166,  1168,  1170,  1174,  1176,  1179,  1181,  1185,
    1190,  1192,  1194,  1196,  1200,  1202,  1204,  1206,  1208,  1210,
    1212,  1216,  1221,  1225,  1227,  1230,  1232,  1235,  1238,  1240,
    1242,  1245,  1247,  1250,  1254,  1256,  1259,  1265,  1273,  1279,
    1285,  1293,  1300,  1308,  1313,  1319,  1324,  1328,  1331,  1334,
    1337,  1341,  1343,  1349,  1354,  1359,  1363,  1368,  1372,  1376,
    1379,  1382,  1384,  1388,  1393,  1397,  1400,  1403,  1406,  1409,
    1412,  1415,  1418,  1421,  1425,  1427,  1429,  1433,  1436,  1438,
    1440,  1443,  1446,  1448,  1451,  1453,  1455,  1458
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     251,     0,    -1,     3,    -1,   148,    -1,   120,   169,   121,
      -1,   146,    -1,   237,    -1,     4,    -1,   118,    -1,   235,
      -1,   122,   235,    -1,   122,   235,   123,   235,    -1,   120,
     121,    -1,    71,   173,   207,   124,   170,   125,    -1,    71,
     173,   124,   170,   125,    -1,   102,   173,   207,   124,   170,
     125,    -1,   102,   173,   124,   170,   125,    -1,    72,   170,
     175,   207,   124,   170,   125,    -1,    72,   170,   175,   124,
     170,   125,    -1,   103,   170,   175,   207,   124,   170,   125,
      -1,   103,   170,   175,   124,   170,   125,    -1,     1,    -1,
     238,    -1,   147,    -1,   150,   124,   169,   125,    -1,   150,
     120,   121,    -1,   150,   120,   151,   121,    -1,   150,   123,
     146,    -1,   150,   146,    -1,   150,     7,   146,    -1,   150,
       8,    -1,   150,     9,    -1,   167,    -1,   149,    -1,   151,
     126,   167,    -1,   151,   126,   149,    -1,     8,   153,    -1,
       9,   153,    -1,   154,   155,    -1,     6,   153,    -1,     6,
     120,   220,   121,    -1,   109,   153,    -1,   109,   120,   220,
     121,    -1,   152,    -1,   150,    -1,   127,    -1,   128,    -1,
     129,    -1,   130,    -1,   131,    -1,   132,    -1,    73,    -1,
     153,    -1,   120,   220,   121,   155,    -1,   155,    -1,   156,
     128,   155,    -1,   156,   133,   155,    -1,   156,   134,   155,
      -1,   156,    -1,   157,   129,   156,    -1,   157,   130,   156,
      -1,   157,    -1,   158,    10,   157,    -1,   158,    11,   157,
      -1,   158,    -1,   159,   135,   158,    -1,   159,   136,   158,
      -1,   159,    12,   158,    -1,   159,    13,   158,    -1,   159,
      -1,   160,    14,   159,    -1,   160,    15,   159,    -1,   160,
      -1,   161,   127,   160,    -1,   161,    -1,   162,   137,   161,
      -1,   162,    -1,   163,   138,   162,    -1,   163,    -1,   164,
      16,   163,    -1,   164,    -1,   165,    17,   164,    -1,   165,
      -1,   165,   139,   169,   140,   166,    -1,   166,    -1,   153,
     168,   167,    -1,   166,   168,   167,    -1,   153,   168,   149,
      -1,   166,   168,   149,    -1,   141,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   167,    -1,   169,
     126,   167,    -1,   166,    -1,   173,   142,    -1,   173,   176,
     142,    -1,   236,   142,    -1,    77,   146,   141,   170,   142,
      -1,   185,    -1,   172,   185,    -1,   188,    -1,   172,   188,
      -1,   201,    -1,   172,   201,    -1,   190,    -1,   172,   190,
      -1,   178,    -1,   173,   178,    -1,   185,    -1,   173,   185,
      -1,   188,    -1,   173,   188,    -1,   201,    -1,   173,   201,
      -1,   190,    -1,   173,   190,    -1,   178,    -1,   174,   178,
      -1,   185,    -1,   174,   185,    -1,   188,    -1,   174,   188,
      -1,   186,    -1,   174,   186,    -1,   178,    -1,   175,   178,
      -1,   185,    -1,   175,   185,    -1,   189,    -1,   175,   189,
      -1,   190,    -1,   175,   190,    -1,   201,    -1,   175,   201,
      -1,   177,    -1,   176,   126,   177,    -1,   208,    -1,   208,
     141,   221,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   117,    -1,    74,    -1,   184,    -1,    79,
      -1,   110,    -1,   111,    -1,     3,    -1,    28,    -1,    75,
      -1,    74,    -1,    44,    -1,   181,    -1,   181,   120,   169,
     121,    -1,   182,    -1,   183,   182,    -1,   183,   126,   182,
      -1,   180,   120,   120,   183,   121,   121,    -1,   180,   120,
     120,   121,   121,    -1,    44,    -1,    45,    -1,    75,    -1,
     187,    -1,    28,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,
     113,    -1,   112,    -1,   191,    -1,   200,    -1,   186,    -1,
     100,   120,   186,   121,    -1,    66,    -1,    46,    -1,    34,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,
      -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,
      -1,   113,    -1,   112,    -1,   191,    -1,   200,    -1,   187,
      -1,   100,   120,   186,   121,    -1,    66,    -1,   192,   146,
     143,   193,   144,    -1,   192,   143,   193,   144,    -1,   192,
     146,   143,   144,    -1,   192,   143,   144,    -1,   192,   187,
     143,   193,   144,    -1,   192,   179,   146,   143,   193,   144,
      -1,   192,   179,   143,   193,   144,    -1,   192,   179,   146,
     143,   144,    -1,   192,   179,   143,   144,    -1,   192,   179,
     187,   143,   193,   144,    -1,   192,   146,    -1,   192,   187,
      -1,   192,   179,   146,    -1,   192,   179,   187,    -1,    48,
      -1,    49,    -1,   197,    -1,   193,   197,    -1,   150,   141,
     222,    -1,   194,    -1,   195,   126,   194,    -1,    68,   174,
     146,   143,    69,   230,    70,   230,   144,    -1,    68,   174,
     146,   143,    70,   230,    69,   230,   144,    -1,    68,   174,
     146,   143,    69,   230,   144,    -1,    68,   174,   146,   143,
      70,   230,   144,    -1,    68,   174,   146,   143,   144,    -1,
      68,   174,   206,   146,   143,    69,   230,    70,   230,   144,
      -1,    68,   174,   206,   146,   143,    70,   230,    69,   230,
     144,    -1,    68,   174,   206,   146,   143,    69,   230,   144,
      -1,    68,   174,   206,   146,   143,    70,   230,   144,    -1,
      68,   174,   206,   146,   143,   144,    -1,    68,   174,   143,
      69,   230,    70,   230,   144,    -1,    68,   174,   143,    70,
     230,    69,   230,   144,    -1,    68,   174,   143,    69,   230,
     144,    -1,    68,   174,   143,    70,   230,   144,    -1,    68,
     174,   143,   144,    -1,    68,   174,   206,   143,    69,   230,
      70,   230,   144,    -1,    68,   174,   206,   143,    70,   230,
      69,   230,   144,    -1,    68,   174,   206,   143,    69,   230,
     144,    -1,    68,   174,   206,   143,    70,   230,   144,    -1,
      68,   174,   206,   143,   144,    -1,   173,   198,   142,    -1,
     173,   142,    -1,   237,   142,    -1,   236,   142,    -1,   243,
      -1,   195,   142,    -1,   196,    -1,   142,    -1,   199,    -1,
     198,   126,   199,    -1,   208,    -1,   208,   184,    -1,   140,
     170,    -1,   208,   140,   170,    -1,   208,   140,   170,   140,
     170,    -1,    50,   146,    -1,    50,   187,    -1,    50,   143,
     202,   144,    -1,    50,   146,   143,   202,   144,    -1,    50,
     146,   143,   202,   142,   193,   144,    -1,    50,   187,   143,
     202,   142,   193,   144,    -1,    50,   187,   143,   202,   144,
      -1,   203,    -1,   202,   126,   203,    -1,   146,    -1,   146,
     141,   170,    -1,   120,   206,   121,    -1,   124,   125,    -1,
     124,   170,   125,    -1,   124,   186,   125,    -1,   204,   124,
     125,    -1,   204,   124,   170,   125,    -1,   204,   124,   186,
     125,    -1,   120,   121,    -1,   120,   216,   121,    -1,   204,
     120,   121,    -1,   204,   120,   216,   121,    -1,   120,   207,
     121,    -1,   120,   121,    -1,   120,   216,   121,    -1,   205,
     120,   121,    -1,   205,   120,   216,   121,    -1,   215,    -1,
     204,    -1,   215,   204,    -1,   179,   215,    -1,   179,   204,
      -1,   179,   215,   204,    -1,   215,    -1,   205,    -1,   215,
     205,    -1,   179,   215,    -1,   179,   205,    -1,   179,   215,
     205,    -1,   211,    -1,   215,   211,    -1,   179,   215,   211,
      -1,   146,    -1,   120,   208,   121,    -1,   209,   124,   170,
     125,    -1,   209,   124,   125,    -1,   209,   124,   186,   125,
      -1,   213,    -1,   215,   213,    -1,   179,   213,    -1,   179,
     215,   213,    -1,   215,   179,   213,    -1,   213,    -1,   209,
      -1,   179,   213,    -1,   179,   209,    -1,   209,   120,    -1,
     212,   216,   121,    -1,   212,   219,   121,    -1,   212,   121,
      -1,   185,    -1,   214,   185,    -1,   128,    -1,   128,   214,
      -1,   128,   215,    -1,   128,   214,   215,    -1,   217,    -1,
     217,   126,    51,    -1,   218,    -1,   217,   126,   218,    -1,
     173,   208,    -1,   173,   206,    -1,   173,    -1,   146,    -1,
     219,   126,   146,    -1,   172,    -1,   172,   206,    -1,   167,
      -1,   143,   223,   144,    -1,   143,   223,   126,   144,    -1,
     166,    -1,   149,    -1,   221,    -1,   223,   126,   221,    -1,
     225,    -1,   230,    -1,   231,    -1,   232,    -1,   233,    -1,
     234,    -1,   146,   140,   224,    -1,    52,   170,   140,   224,
      -1,    53,   140,   224,    -1,   171,    -1,   226,   171,    -1,
     224,    -1,   227,   224,    -1,   227,   171,    -1,   227,    -1,
     226,    -1,   226,   227,    -1,   143,    -1,   143,   144,    -1,
     229,   228,   144,    -1,   142,    -1,   169,   142,    -1,    54,
     120,   169,   121,   224,    -1,    54,   120,   169,   121,   224,
      64,   224,    -1,    55,   120,   169,   121,   224,    -1,    56,
     120,   169,   121,   224,    -1,    57,   224,    56,   120,   169,
     121,   142,    -1,    58,   120,   231,   231,   121,   224,    -1,
      58,   120,   231,   231,   169,   121,   224,    -1,    56,   120,
     121,   224,    -1,    58,   120,   231,   121,   224,    -1,    58,
     120,   121,   224,    -1,    59,   146,   142,    -1,    60,   142,
      -1,    61,   142,    -1,    62,   142,    -1,    62,   169,   142,
      -1,     5,    -1,   173,   146,   143,   250,   144,    -1,   173,
     146,   143,   144,    -1,   186,   143,   250,   144,    -1,   186,
     143,   144,    -1,   146,   143,   250,   144,    -1,   146,   143,
     144,    -1,   143,   250,   144,    -1,   143,   144,    -1,   173,
     210,    -1,   210,    -1,   173,   120,   121,    -1,   131,   173,
     120,   121,    -1,    78,   173,   210,    -1,    78,   210,    -1,
     239,   230,    -1,   242,   230,    -1,   242,   142,    -1,   240,
     230,    -1,   241,   230,    -1,   173,   210,    -1,   244,   230,
      -1,   150,   141,   222,    -1,   222,    -1,   246,    -1,   247,
     126,   246,    -1,   247,   142,    -1,   248,    -1,   245,    -1,
     249,   248,    -1,   249,   245,    -1,   142,    -1,   249,   142,
      -1,   249,    -1,   247,    -1,   249,   247,    -1,   167,    -1
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
     609,   610,   611,   612,   613,   617,   618,   619,   620,   621,
     622,   623,   624,   625,   626,   627,   628,   629,   630,   631,
     632,   633,   634,   635,   640,   641,   642,   643,   644,   647,
     648,   649,   650,   651,   656,   657,   660,   662,   667,   668,
     672,   673,   677,   681,   682,   686,   688,   690,   692,   694,
     697,   699,   701,   703,   705,   708,   710,   712,   714,   716,
     719,   721,   723,   725,   727,   732,   733,   734,   735,   736,
     737,   738,   739,   743,   745,   750,   752,   754,   756,   758,
     763,   764,   768,   770,   771,   772,   773,   777,   779,   784,
     786,   792,   794,   796,   798,   800,   802,   804,   806,   808,
     810,   812,   817,   819,   821,   823,   825,   830,   831,   832,
     833,   834,   835,   839,   840,   841,   842,   843,   844,   890,
     891,   893,   899,   901,   903,   905,   907,   912,   913,   916,
     918,   920,   926,   927,   928,   930,   935,   939,   941,   943,
     948,   949,   953,   954,   955,   956,   960,   961,   965,   966,
     970,   971,   972,   976,   977,   981,   982,   991,   993,   995,
    1011,  1012,  1033,  1035,  1040,  1041,  1042,  1043,  1044,  1045,
    1049,  1051,  1053,  1058,  1059,  1063,  1064,  1067,  1071,  1072,
    1073,  1077,  1081,  1089,  1094,  1095,  1099,  1100,  1101,  1105,
    1106,  1107,  1108,  1110,  1111,  1112,  1116,  1117,  1118,  1119,
    1120,  1124,  1128,  1130,  1135,  1137,  1139,  1141,  1146,  1148,
    1153,  1155,  1160,  1165,  1170,  1172,  1177,  1179,  1181,  1183,
    1185,  1191,  1196,  1201,  1202,  1206,  1208,  1213,  1218,  1219,
    1220,  1221,  1222,  1223,  1227,  1228,  1229,  1233
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
      40,    41,    36,    46,    91,    93,    44,    38,    42,    43,
      45,   126,    33,    47,    37,    60,    62,    94,   124,    63,
      58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   145,   146,   147,   147,   148,   148,   148,   148,   148,
     148,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   148,   149,   150,   150,   150,   150,   150,   150,   150,
     150,   150,   151,   151,   151,   151,   152,   152,   152,   152,
     152,   152,   152,   153,   153,   154,   154,   154,   154,   154,
     154,   154,   155,   155,   156,   156,   156,   156,   157,   157,
     157,   158,   158,   158,   159,   159,   159,   159,   159,   160,
     160,   160,   161,   161,   162,   162,   163,   163,   164,   164,
     165,   165,   166,   166,   167,   167,   167,   167,   167,   168,
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
       0,    21,     2,     7,   391,     0,     0,     0,   174,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   427,     0,   173,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   176,
     177,   178,   179,   180,   182,   185,   186,   183,   184,   170,
     171,   175,   181,   228,   229,     0,   194,   172,   187,     0,
     189,   188,   152,     0,   115,   117,   192,   119,   123,   190,
       0,   191,   121,    52,   102,     0,     0,     0,     0,    41,
      12,   100,     0,   345,   107,   192,   109,   113,   111,     0,
      10,     0,     0,    30,    31,     0,     0,     0,    28,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,    89,
       0,    38,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,   270,   271,     0,   153,
     155,   156,   157,     0,     0,   332,   116,     0,     0,   154,
     118,   120,   124,   122,   304,     0,   303,     0,   224,     0,
     225,   196,   197,   198,   199,   200,   202,   205,   206,   203,
     204,   195,   201,   213,     0,   208,   207,     0,   133,   135,
     211,   137,   139,   209,   210,   141,     0,     0,     0,     0,
       4,     0,     0,     0,     0,   108,   110,   114,   112,   298,
     346,   297,     0,     0,   422,     0,   397,   351,    44,   350,
       0,   414,    22,     0,   419,   415,   425,   418,     0,     0,
      29,    25,    33,     0,    32,    27,     0,    87,    85,    55,
      56,    57,    59,    60,    62,    63,    67,    68,    65,    66,
      70,    71,    73,    75,    77,    79,    81,     0,    88,    86,
     395,     0,    40,   279,     0,   277,     0,     0,     0,   293,
     342,     0,     0,   336,   338,     0,   330,   333,   334,   307,
     306,     0,     0,     0,   305,     0,     0,     0,     0,   262,
     217,     5,     0,     0,     0,     0,   233,     0,   261,   230,
       0,   401,     0,   317,     0,     0,     6,     0,     0,     0,
       0,   259,     0,     0,   226,   227,     0,     0,     0,   134,
     136,   138,   140,   142,     0,     0,     0,     0,     0,    42,
     101,   288,     0,     0,   282,     0,     0,   301,   300,     0,
       0,   299,    53,    11,   399,     0,     0,     0,   312,   411,
     371,     0,   412,     0,   417,   423,   421,   426,   420,   396,
      26,     0,    24,     0,   394,     0,     0,   272,     0,     0,
     193,     0,     0,   341,   340,   323,   309,   322,   297,   292,
     294,     0,    14,   331,   335,   308,     0,   295,     0,     0,
       0,     0,   125,   127,   131,   129,     0,     0,   405,     0,
      46,     0,     0,     0,     0,     0,     0,     0,   256,   312,
       0,     0,   263,   265,   400,   322,     0,   319,     0,   215,
     231,     0,   260,   326,     0,   329,   343,     0,     0,     0,
     318,   258,   257,   406,   409,   410,   408,   407,   216,     0,
     222,     0,     0,     0,     0,     0,     0,     0,    16,     0,
       0,     0,   281,   289,   283,   284,   302,   290,     0,   285,
       0,     0,   398,   413,   372,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   374,     5,     0,
     363,     0,   365,   354,     0,     0,     0,   355,   356,   357,
     358,   359,     0,   416,    35,    34,    83,   280,   278,     0,
     273,     0,   276,   325,   324,   300,     0,   310,   337,   339,
     158,   159,   162,   161,   160,     0,   163,   165,     0,   296,
      13,   270,   271,     0,     0,   126,   128,   132,   130,     0,
     224,     0,   225,   404,     0,   313,     0,   232,   402,   267,
       0,   324,     0,     0,   255,     0,   266,     0,   322,   320,
     234,   315,     0,     0,   327,   328,     0,   321,   214,   220,
     221,     0,     0,   218,   212,    18,     0,    15,    20,     0,
     291,   286,   287,     0,     0,     0,     0,     0,     0,     0,
       0,   387,   388,   389,     0,     0,     0,   375,   103,     0,
     143,   145,   364,     0,   367,   366,   373,   105,     0,     0,
     311,   169,     0,     0,     0,   166,     0,     0,   249,     0,
       0,     0,   226,   227,   403,   393,     0,   322,   264,   268,
     324,   314,   316,   344,   219,   223,    17,    19,     0,   362,
       0,     0,     0,     0,     0,     0,     0,   386,   390,     0,
     360,     0,   104,     0,   274,   275,     0,   168,   167,     0,
       0,     0,     0,   239,     0,     0,   254,     0,   392,     0,
     361,     0,     0,   383,     0,     0,   385,     0,     0,     0,
     144,     0,   347,   146,   164,     0,   247,     0,   248,     0,
       0,     0,     0,     0,     0,   244,   269,   376,   378,   379,
       0,   384,     0,     0,   106,   352,     0,     0,     0,     0,
     237,     0,   238,     0,   252,     0,   253,     0,     0,     0,
       0,   381,     0,     0,   348,   245,   246,     0,     0,     0,
       0,     0,   242,     0,   243,   377,   380,   382,   349,   353,
     235,   236,   250,   251,     0,     0,   240,   241
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   227,    27,   243,    28,    93,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   101,   130,   489,    95,   604,   103,   303,   401,
     197,   599,   600,    84,   304,   168,   526,   527,   528,   169,
      85,    44,    45,    87,   201,    88,    89,    90,   305,   306,
     307,   308,   309,   421,   422,    91,    92,   274,   275,   219,
     174,   342,   175,   412,   310,   311,   386,   312,   313,   287,
     314,   343,   283,   284,   438,   109,   683,   231,   706,   492,
     493,   494,   495,   496,   361,   497,   498,   499,   500,   501,
      46,   315,    47,   232,   317,   318,   319,   320,   321,   233,
     234,   235,   236,   237,   238,   239,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -619
static const yytype_int16 yypact[] =
{
    5722,  -619,  -619,  -619,  -619,  5761,  5795,  5795,  -619,  1523,
    5722,  -619,  1523,  5722,  5868,  -619,  5285,    76,  -619,  -619,
    -619,  -619,  -619,  -619,    41,  -619,  -619,   545,  -619,   673,
    5722,  -619,   236,    97,   347,    59,   360,    34,    60,   121,
     246,    17,   673,  -619,   146,  -619,  -619,  -619,   330,  5285,
    -619,  5435,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,    19,  -619,  -619,  -619,   219,
    -619,  -619,  -619,  6471,  -619,  -619,  -619,  -619,  -619,  -619,
     157,  -619,  -619,  -619,  -619,  7485,  6572,  7485,  5285,  -619,
    -619,  -619,   126,  6923,  -619,   146,  -619,  -619,  -619,   238,
     253,  2012,   380,  -619,  -619,  4276,   380,  5722,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    4318,  -619,  5722,  5722,  5722,  5722,  5722,  5722,  5722,  5722,
    5722,  5722,  5722,  5722,  5722,  5722,  5722,  5722,  5722,  5722,
    5722,  4318,  2144,  -619,   273,   380,   260,   262,   368,  -619,
    -619,  -619,  -619,  6673,  5722,    78,  -619,   129,   294,  -619,
    -619,  -619,  -619,  -619,   300,   298,   336,  2660,   287,    40,
     345,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,   357,  -619,  -619,  6774,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  5722,   326,  6875,   358,
    -619,  5722,  6370,  5508,   -18,  -619,  -619,  -619,  -619,   -38,
    -619,   341,  5722,    76,  -619,  2276,  -619,  -619,   314,  -619,
    6175,  -619,  -619,   350,  -619,  -619,   -49,  -619,  2408,   352,
    -619,  -619,  -619,   140,  -619,  -619,   307,  -619,  -619,  -619,
    -619,  -619,   236,   236,    97,    97,   347,   347,   347,   347,
      59,    59,   360,    34,    60,   121,   246,    93,  -619,  -619,
    -619,   361,  -619,   377,    79,  -619,   380,   380,   370,  -619,
    6074,   386,   391,   394,  -619,   396,  -619,    78,  -619,   300,
     336,   402,  7024,  5722,   300,  7395,  6175,  5358,  1523,  -619,
    -619,    41,   378,  4920,    49,  2780,  -619,    72,  -619,  -619,
     348,  -619,  6276,  -619,   537,   381,   383,   350,   350,   350,
     297,  -619,  2900,  3020,   389,   390,  4529,   368,  5722,  -619,
    -619,  -619,  -619,  -619,   410,   401,  5722,  5722,   411,  -619,
    -619,  -619,   415,   416,  -619,   417,   144,   -38,   341,  7118,
    5542,   -38,  -619,  -619,  -619,   399,  4318,   196,  -619,  -619,
     400,  4109,  -619,  4318,  -619,  -619,  -619,   -49,  -619,  -619,
    -619,  4318,  -619,  5722,  -619,  5722,   380,  -619,   106,   134,
    -619,  5973,    18,  -619,  -619,   348,  -619,  -619,   731,  -619,
    -619,  7305,  -619,  -619,  -619,   300,    50,  -619,   424,   422,
      73,  4804,  -619,  -619,  -619,  -619,   163,  6175,  -619,  5153,
     605,    49,   429,   537,  7212,  4318,   418,  5722,  -619,   408,
      49,   162,  -619,   313,  -619,   412,   537,  -619,    47,  -619,
    -619,   459,  -619,  -619,  5581,  -619,  -619,   435,   272,    47,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  3140,
    -619,  3260,  3380,  4529,  3500,   437,   440,  5722,  -619,   442,
     444,  5722,  -619,  -619,  -619,  -619,   -38,  -619,   439,  -619,
     445,   156,  -619,  -619,  -619,  5722,   423,   454,   455,   456,
    4241,   458,   380,   441,   449,  4688,   380,  -619,   -60,   167,
    -619,  5035,  -619,  -619,  1616,  1748,   436,  -619,  -619,  -619,
    -619,  -619,   450,  -619,  -619,  -619,  -619,  -619,  -619,  4529,
    -619,  4529,  -619,   348,  -619,   731,    47,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,   472,   474,  -619,   252,  -619,
    -619,  -619,  -619,    -3,   452,  -619,  -619,  -619,  -619,    14,
    -619,    73,  -619,  -619,   537,  -619,   476,  -619,  -619,  -619,
    2540,   457,   537,   338,  -619,  5722,  -619,    47,   461,  -619,
    -619,  -619,   483,   160,  -619,  -619,   380,  -619,  -619,  -619,
    -619,  3620,  3740,  -619,  -619,  -619,   485,  -619,  -619,   488,
    -619,  -619,  -619,   477,  4241,  5722,  5722,  5615,   543,  4581,
     478,  -619,  -619,  -619,   225,   460,  4241,  -619,  -619,   226,
    -619,   473,  -619,  1880,  -619,  -619,  -619,  -619,  3860,  3980,
    -619,  -619,  5722,   497,   316,  -619,   350,   350,  -619,     4,
     222,   479,  -619,  -619,  -619,  -619,   480,   484,  -619,   481,
     486,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  4241,  -619,
     290,   292,  4241,   310,   503,  4241,  4615,  -619,  -619,  5722,
    -619,   196,  -619,  4409,  -619,  -619,   321,  -619,  -619,   -25,
     -40,   350,   350,  -619,   350,   350,  -619,   285,  -619,  5722,
    -619,  4241,  4241,  -619,  4241,  5722,  -619,  4241,  5688,   493,
    -619,  4409,  -619,  -619,  -619,   350,  -619,   350,  -619,    26,
      28,    58,    30,   350,   350,  -619,  -619,   564,  -619,  -619,
     325,  -619,  4241,   333,  -619,  -619,   189,   492,   495,   350,
    -619,   350,  -619,   350,  -619,   350,  -619,   138,    85,  4241,
     498,  -619,  4241,  1391,  -619,  -619,  -619,   500,   512,   514,
     515,   350,  -619,   350,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,   516,   522,  -619,  -619
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -619,   329,  -619,  -619,   -92,   438,  -619,  -619,     0,  -619,
     -21,   364,   366,   334,   371,   525,   491,   520,   482,   524,
    -619,    52,     1,   641,   -14,   107,  -350,  -619,    16,  -619,
     588,  -619,    36,   -65,   -63,  -619,  -619,  -467,  -619,   265,
     811,   782,   -71,   934,    56,    -8,    12,  -237,  -266,   258,
    -619,  -619,  -261,  -619,   150,    38,  1103,   240,   328,  -175,
    -112,  -100,    -5,  -267,  1059,  -182,  -334,  -619,   992,  -619,
     756,  -153,  -619,   315,  -619,    20,  -618,  -286,  -619,  -340,
    -619,  -619,   213,  -619,  -619,   517,  -407,  -619,  -619,  -619,
      -2,  -319,   918,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
     470,   346,   475,   487,  -619,  -140,  -619
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -425
static const yytype_int16 yytable[] =
{
      29,    43,   102,   220,   157,    50,    52,    53,   107,   131,
     282,   490,   271,   384,    99,   110,    29,     2,   166,   180,
     167,     2,     2,   242,   200,    83,   200,   179,    96,   687,
     198,   166,   198,   167,   149,   102,   423,   102,   247,   347,
     214,   107,   502,     2,   430,   685,   351,     8,   359,    29,
       2,    29,     2,   520,   517,   289,   449,   451,   406,   268,
     454,   615,    94,   705,   294,    94,   616,   617,     8,   154,
     473,   139,   140,   661,   662,   172,     2,   363,   521,   517,
     596,     4,   349,   111,   102,   355,   350,   202,   172,   202,
     107,   207,   517,   364,   522,   217,   709,   711,    29,   715,
     167,     8,   212,   246,   688,   739,   213,   203,   325,   203,
     165,   249,   250,   251,   408,    29,   244,    29,   209,   686,
      97,   424,    69,    70,   523,   524,   200,   230,   713,   547,
      29,   248,   329,   204,   167,   204,   267,   200,   381,   398,
     588,   618,   213,   329,   602,   167,   165,   658,   663,   214,
      29,    29,   269,    77,   733,   605,   150,   620,   281,   437,
       2,   145,   155,   229,   406,   166,     2,   357,   230,   357,
     710,   525,   712,   466,   716,   502,   502,   165,   395,   280,
     383,   610,   646,   323,   111,     8,   571,   572,   430,   332,
     430,     8,   334,   430,   141,   142,   468,   146,   431,     2,
     332,   352,   714,   338,   229,   376,   165,   347,   731,   203,
     610,    29,   340,   351,   432,   166,    94,   382,   610,   211,
     203,   353,   172,   377,   601,   543,   135,   136,   280,   734,
     402,   159,   376,   373,   411,   204,   160,   159,   166,   678,
     420,   230,   160,   608,   639,   609,   204,   210,   509,   163,
     510,   439,   211,   331,   230,   520,   650,   165,    94,   147,
     376,   370,   148,   605,   331,    94,   371,   161,   162,   465,
     159,   285,   172,   161,   162,   160,   511,   229,   512,   504,
     521,   582,   732,   102,   502,   632,   423,   152,   553,   152,
     229,   664,   665,   211,   411,   172,   522,    29,   670,   152,
     177,   539,   673,   152,   554,   676,   161,   162,   280,   597,
     430,   430,   407,   335,   414,   723,   357,     2,   382,   520,
     345,   112,   113,   114,   165,   516,   523,   524,   280,   532,
     153,   697,   698,   724,   699,   542,   535,   701,   214,   158,
     466,     2,   166,   541,   521,    94,   411,   430,   430,   166,
     516,   211,   651,   411,   693,   694,   118,   137,   138,   222,
     522,    29,   721,   557,   132,   280,   666,   648,   652,   133,
     134,    29,   505,   613,   143,   144,   223,   491,   614,   735,
      94,     2,   737,     2,   601,   112,   113,   114,    94,    94,
     523,   524,   160,   565,   272,   102,     8,   280,   566,   172,
     399,   107,    94,   276,   156,   277,   172,   280,   229,    29,
     626,   671,   159,   672,   291,   229,   211,   160,   211,   178,
     292,     2,   293,   161,   162,   506,   166,    94,   411,   695,
     322,   674,   372,   211,   115,   456,   211,   116,   117,   446,
     360,   240,   684,   459,   460,   245,   720,   211,   161,   162,
     336,   211,   516,   555,   722,   356,   163,   470,   357,   211,
       1,   212,     2,     3,     4,   213,   165,   229,   433,    94,
     623,   594,   434,   256,   257,   258,   259,   327,   417,   339,
      29,   516,   507,   172,   273,    29,    94,     8,   326,   516,
     411,   380,   159,   360,    29,    29,   369,   160,   115,   252,
     253,   116,   117,   254,   255,   374,   301,   389,   324,    94,
     491,   491,   390,    94,   260,   261,   378,   379,   375,   415,
     391,   392,   396,   441,   549,   442,   458,    94,   161,   162,
       9,    10,   452,   453,   457,   461,   462,   463,   357,   548,
       2,   562,   464,   472,   474,   529,   165,   530,     2,   228,
     545,   550,   112,   113,   114,  -317,   564,   118,   574,   358,
     580,    12,    13,   584,   576,   575,   230,   577,   579,   578,
     581,   640,   641,   643,   585,   586,   587,    15,   589,    51,
     606,    17,   583,   591,    29,    29,    29,    29,   411,    29,
     228,   592,   607,   611,   612,   619,    29,   624,   656,   644,
    -319,   649,   229,    29,  -318,   273,   273,    94,   631,   358,
     636,   159,    29,   637,   653,   302,   160,   638,   657,   491,
     647,   669,   667,   675,   668,   358,   301,  -320,   719,  -321,
     265,   118,   419,   358,   301,   704,   725,   263,    29,   726,
     736,   436,    29,   358,   740,    29,    29,   161,   162,    69,
      70,   301,   301,    29,   682,   301,   741,   357,   742,   743,
     746,   700,   629,   228,   703,   115,   747,   264,   116,   117,
     262,    29,    29,   266,    29,    29,   228,    29,    29,  -332,
      77,    29,   682,   151,  -332,   208,   358,   680,   556,   560,
     488,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,    94,    29,   628,   508,   273,   519,   603,   366,   503,
     358,   358,     0,   367,     0,  -332,  -332,   358,     0,    29,
       0,    94,    29,    29,   682,   368,     0,     0,     0,   531,
     534,     0,     0,   165,     2,   540,   358,     0,   301,     0,
     358,     0,   358,   302,     0,   358,     0,     0,     0,   358,
     362,     0,     0,     0,     0,   358,   679,   358,     0,     0,
     302,   302,     0,     0,   302,     0,     0,     0,   358,     0,
       0,     0,     0,     0,     0,     0,   696,     0,   301,     0,
     301,   301,   301,   301,     0,     0,     0,     0,     0,     0,
       0,    86,     0,     0,    86,     0,     0,     0,   105,     0,
       0,   228,     0,     0,     0,   159,     0,     0,     0,   488,
     160,   590,     0,     0,   129,   595,     0,     0,     0,     0,
     419,     0,     0,   488,   488,     0,     0,   104,     0,     0,
       0,   105,     0,     0,   443,   444,   445,   447,   301,   176,
     301,   161,   162,     0,   358,   358,     0,     0,     0,     0,
       0,   381,   176,     0,     0,   213,     0,     0,     0,   221,
     104,     0,     0,     0,     0,    86,     0,     0,   621,   302,
     622,     0,     0,   358,     0,     0,     0,     0,    86,     0,
     105,   358,   358,     0,     0,    86,   358,   302,     0,   302,
     302,   302,   302,   105,   170,   633,     0,     0,     0,     0,
     301,   301,     0,     0,     0,     0,   199,   170,   199,   104,
       0,     0,     0,   488,   215,     0,     0,     0,     0,   176,
       0,   288,     0,   290,     0,   488,     0,     0,     0,     0,
       0,     0,   488,     0,   105,     0,     0,   301,   301,     0,
     278,     0,     0,     0,     0,    86,     0,   302,     0,   302,
     106,     0,     0,   176,     0,     0,     0,     0,     0,   105,
       0,     0,     0,     0,   176,     0,     0,   488,   221,     0,
     348,   488,     0,     0,   488,     0,   286,     0,     0,     0,
     358,     0,     0,   106,     0,     0,     0,     0,   228,     0,
       0,     0,     0,     0,    86,   346,     0,     0,     0,     0,
     488,   488,     0,   488,     0,     0,   488,   105,   330,   302,
     302,     0,    86,     0,     0,     0,     0,   171,     0,   330,
     105,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     171,   488,   106,     0,     0,     0,   388,   216,     0,     0,
       0,   170,     0,   394,     0,     0,   302,   302,   488,     0,
       0,   488,     0,   413,     0,     0,     0,     0,     0,   426,
     428,     0,    86,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    86,     0,     0,   404,    86,     0,
      86,     0,     0,     0,     0,    86,     0,   105,     0,     0,
       0,   170,     0,     0,    86,   316,     0,     0,   393,     0,
       0,     0,     0,     0,   105,   105,   403,     0,   105,   455,
       0,     0,     0,   413,   170,     0,     0,     0,     0,   108,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    86,   471,   659,   660,     0,     0,   388,   515,     0,
       0,     0,     0,   105,     0,     0,     0,     0,     0,     0,
       0,     0,   108,     0,     0,     0,     0,   221,     0,     0,
       0,     0,     0,    86,   171,   413,   288,   544,     0,     0,
       0,     0,   413,    86,     0,     0,   552,     0,   689,   690,
       0,   691,   692,   537,     0,     0,   173,     0,     0,    86,
       0,   105,     0,     0,     0,     0,    86,     0,   205,   173,
     205,   108,   707,     0,   708,     0,   218,     0,     0,     0,
     717,   718,   536,     0,   171,     0,   563,     0,   170,     0,
     104,   286,     0,   316,     0,   170,   727,     0,   728,   405,
     729,   105,   730,   105,   105,   105,   105,   171,     0,     0,
     316,   316,     0,     0,   316,     0,     0,   413,   744,     0,
     745,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   387,    86,     0,     0,   105,   105,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   387,
       0,   105,     0,   105,     0,   425,   427,     0,     0,     0,
     333,     0,   170,     0,     0,     0,   440,     0,     0,   413,
       0,   333,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   105,   173,     0,   538,     0,     0,     0,   385,
       0,   171,     0,   106,     0,     0,     0,     0,   171,   387,
       0,     0,     0,   105,   105,     0,   385,     0,     0,     0,
       0,     0,   385,     0,     0,     0,     0,   316,     0,   316,
     316,   316,   316,   387,   514,     0,     0,     0,     0,     0,
     387,     0,     0,   173,     0,   105,     0,     0,     0,     0,
     105,   105,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   387,     0,   514,     0,   387,   173,   413,   387,     0,
       0,     0,   551,     0,     0,     0,   385,     0,   558,     8,
     559,     0,     0,     0,     0,   171,     0,   316,     0,   316,
       0,   567,     0,     0,     0,     0,     0,     0,     0,     0,
     385,   513,     0,     0,     0,     0,     0,   385,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,   385,     0,
     513,     0,   385,     0,     0,   385,     0,     0,     0,   513,
       0,     0,     0,   387,     0,   385,     0,     0,     0,   316,
     316,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,   387,   514,    15,
     173,    16,   108,    17,     0,     0,     0,   173,    18,    19,
      20,    21,    22,    23,     0,     0,   316,   316,     0,     0,
       0,     0,     0,     0,   681,   738,   387,     0,     0,     0,
       0,     0,     0,     0,   627,   387,     0,     0,     0,   630,
     385,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,   385,   513,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,   173,     0,     0,     0,    77,     0,
       0,     0,     0,   385,     0,     0,     0,     0,    78,     0,
       0,   385,   385,     0,     0,     0,   513,     1,     0,     2,
       3,     4,     5,    79,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,    81,     0,     0,     0,
      82,     0,     0,   387,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,   475,   476,
     477,   478,   479,   480,   481,   482,   483,   484,   485,     0,
       0,     0,    76,     0,     0,     0,     0,     9,    10,    11,
       0,    77,     0,   486,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
     385,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    80,    81,
       0,     0,     0,    82,    15,     0,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   487,   360,
    -369,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
     475,   476,   477,   478,   479,   480,   481,   482,   483,   484,
     485,     0,     0,     0,    76,     0,     0,     0,     0,     9,
      10,    11,     0,    77,     0,   486,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      80,    81,     0,     0,     0,    82,    15,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     487,   360,  -368,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,   475,   476,   477,   478,   479,   480,   481,   482,
     483,   484,   485,     0,     0,     0,    76,     0,     0,     0,
       0,     9,    10,    11,     0,    77,     0,   486,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    80,    81,     0,     0,     0,    82,    15,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   487,   360,  -370,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     9,    10,    11,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    80,    81,     0,     0,     0,    82,
      15,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   224,   225,   226,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     9,    10,    11,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    80,    81,     0,     0,
       0,    82,    15,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   224,   225,   270,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,     9,    10,    11,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    80,    81,
       0,     0,     0,    82,    15,     0,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   224,   225,
     354,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     9,
      10,    11,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      80,    81,     0,     0,     0,    82,    15,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     365,   225,  -424,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,     0,     0,
       0,     9,    10,    11,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    80,    81,     0,     0,     0,    82,    15,     0,
      16,     1,    17,     2,     3,     4,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   224,   225,   625,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   300,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   429,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   448,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   450,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   568,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   569,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   570,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   573,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   634,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   635,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     1,    17,     2,     3,     4,     0,     0,   165,     0,
       0,   298,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   299,     0,   654,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,   295,     0,
       0,     9,    10,     0,   159,    77,     0,     0,   296,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,    15,     0,
     297,     0,    17,     0,     0,     0,     0,     0,   165,     0,
       1,   298,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,   299,     0,   655,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,   475,   476,   477,   478,   479,   480,   481,   482,   483,
     484,   485,     0,     0,     0,    76,     0,     0,     0,     0,
       9,    10,    11,     0,    77,     0,   486,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    80,    81,     0,     0,     0,    82,    15,     0,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   487,   360,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,   475,   476,   477,   478,   479,   480,   481,
     482,   483,   484,   485,     8,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     8,     9,    10,    11,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,     0,    12,    13,
       0,     0,     0,   487,   360,    14,     0,     0,     0,     9,
      10,    11,     0,     0,    15,     0,    16,   241,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   225,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     8,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   225,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,    15,     0,    16,
       1,    17,     2,     3,     4,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   681,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,    76,     0,   295,     0,     0,
       9,    10,     0,   159,    77,     0,     0,   296,   160,     8,
       0,     0,     0,     0,    78,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,    79,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   161,
     162,    80,    81,     8,     0,     0,    82,    15,     0,   297,
       0,    17,     9,    10,    11,     0,     0,   165,     0,     0,
     298,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   299,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     9,    10,    11,     1,
      14,     2,     3,     4,     5,     0,     6,     7,     0,    15,
       0,    16,   645,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     8,    12,    13,     0,
       0,     0,     0,   487,    14,     0,     0,     0,     0,     0,
       0,     0,     0,    15,     0,    16,   677,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   487,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     2,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     593,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,   400,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,   159,    77,
       0,     0,     0,   160,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,   162,    80,    81,     0,     0,
       0,    82,     0,     2,   212,     0,     0,     0,   213,     0,
       0,     0,   165,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   533,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,     0,     0,
       0,     0,     0,     0,   159,    77,     0,     0,     0,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,     2,     0,
     416,     0,     0,     0,     0,     0,     0,     0,   165,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     417,     0,   418,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,   159,
      77,     0,     0,     0,   160,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   161,   162,    80,    81,     0,
       0,     0,    82,     0,     1,   357,     2,     3,     4,     5,
       0,     6,     7,   165,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   598,     0,     0,
       0,     8,     0,     0,     0,     0,     0,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     9,    10,    11,   159,    77,     0,
       0,     0,   160,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,    14,   161,   162,    80,    81,     0,     0,     0,
       0,    15,     0,   409,   100,    17,     0,     0,     0,     0,
      18,   410,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     9,    10,    11,     1,
      77,     2,     3,     4,     5,     0,     6,     7,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     8,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    80,    81,     0,
       0,     0,     0,    15,     0,    16,   100,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,   159,     0,     0,     0,     1,   160,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     8,     0,     0,     0,    14,   161,   162,
       0,     0,     0,     0,     0,     0,    15,     0,   409,   100,
      17,     0,     0,     0,     0,    18,   410,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    12,    13,     0,
       0,     0,     0,     1,    14,     2,     3,     4,     5,     0,
       6,     7,     0,    15,     0,    16,   100,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     9,    10,    11,     1,    14,     2,     3,
       4,     5,     0,     6,     7,     0,    15,     0,    16,     0,
      17,     0,     0,   344,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     9,    10,    11,     0,     0,     0,     0,     0,
      15,     0,    16,     0,    17,     0,     0,   469,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     9,    10,    11,     1,
      14,     2,     3,     4,     5,     0,     6,     7,     0,    15,
       0,    16,     0,    17,     0,     0,   561,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     8,    12,    13,     0,
       0,     0,     0,     1,    14,     2,     3,     4,     5,     0,
       6,     7,     0,    15,     0,    16,   642,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     9,    10,    11,     1,    14,     2,     3,
       4,     5,     0,     6,     7,     0,    15,     0,    16,   702,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     9,    10,    11,     0,     0,     0,     0,     0,
      15,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     9,    10,    11,     1,
      14,     2,     3,     4,     5,     0,     6,     7,     0,    15,
       0,    49,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     8,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,    15,     0,    51,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     2,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,    98,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,   159,    77,     0,
       0,     0,   160,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     2,     0,     0,
       0,     0,     0,   161,   162,    80,    81,     0,     0,     0,
      82,     0,     0,   381,   341,     0,     0,   213,     0,     0,
       0,   165,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,   159,    77,
       0,     0,     0,   160,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     2,     0,
       0,     0,     0,     0,   161,   162,    80,    81,     0,     0,
       0,    82,     0,     0,   381,     0,     0,     0,   213,     0,
       0,     0,   165,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,   159,
      77,     0,     0,     0,   160,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     2,
       0,     0,     0,     0,     0,   161,   162,    80,    81,     0,
       0,     0,    82,     0,     0,   357,     0,     0,     0,     0,
       0,     0,     0,   165,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,     0,     0,     0,     0,     0,     0,
       0,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,    81,
       0,     0,     0,    82,     0,     0,     0,   435,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,     0,     0,
       0,     0,     0,     0,   159,    77,     0,     0,     0,   160,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     161,   162,    80,    81,     0,     0,     0,    82,     0,     0,
     212,   341,     0,     0,   213,     0,     0,     0,   165,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,     0,
       0,   163,     0,     0,     0,   164,     0,     0,     0,   165,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     0,     0,     0,   159,    77,     0,     0,
       0,   160,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   161,   162,    80,    81,     0,     0,     0,    82,
       0,     0,   163,     0,     0,     0,   206,     0,     0,     0,
     165,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,   159,    77,     0,
       0,     0,   160,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   161,   162,    80,    81,     0,     0,     0,
      82,     0,     0,   163,   279,     0,     0,     0,     0,     0,
       0,   165,     8,    54,    55,    56,    57,    58,   181,   182,
     183,   184,   185,   186,   187,   188,   189,   190,    69,    70,
     191,   192,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     193,     0,     0,     0,     0,     0,     0,     0,   159,    77,
       0,     0,     0,   160,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   194,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,   162,   195,   196,     0,     0,
       0,    82,     0,     0,   163,     0,     0,     0,   328,     0,
       0,     0,   165,     8,    54,    55,    56,    57,    58,   181,
     182,   183,   184,   185,   186,   187,   188,   189,   190,    69,
      70,   191,   192,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   193,     0,     0,     0,     0,     0,     0,     0,   159,
      77,     8,     0,     0,   160,     0,     0,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,   194,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   161,   162,   195,   196,    76,
       0,     0,    82,     0,     0,   163,     0,   159,    77,   337,
       0,     0,   160,   165,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   161,   162,    80,    81,     0,     0,     0,
       0,     0,     0,   212,     0,     0,     0,   213,     0,     0,
       0,   165,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,     0,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,    81,     0,     0,
       0,    82,     0,     0,     0,   397,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,    81,     0,     0,     0,    82,     0,     0,     0,   467,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     0,     0,     0,     0,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,    81,     0,     0,     0,    82,
       0,     0,   546,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,   518,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,    81,     0,
       0,     0,    82,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,   400,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,    81,     0,
       0,     0,    82,     8,    54,    55,    56,    57,    58,   181,
     182,   183,   184,   185,   186,   187,   188,   189,   190,    69,
      70,   191,   192,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   193,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   194,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   195,   196,     0,
       0,     0,    82
};

static const yytype_int16 yycheck[] =
{
       0,     0,    16,   103,    75,     5,     6,     7,    16,    30,
     163,   361,   152,   280,    14,    17,    16,     3,    83,    90,
      83,     3,     3,   115,    95,     9,    97,    90,    12,    69,
      95,    96,    97,    96,    17,    49,   303,    51,   130,   214,
     103,    49,   361,     3,   305,    70,   221,    28,   230,    49,
       3,    51,     3,     3,   388,   167,   322,   323,   295,   151,
     326,   528,    10,   681,   176,    13,    69,    70,    28,    49,
     356,    12,    13,    69,    70,    83,     3,   126,    28,   413,
     140,     5,   120,   143,    98,   225,   124,    95,    96,    97,
      98,    96,   426,   142,    44,   103,    70,    69,    98,    69,
     163,    28,   120,   117,   144,   723,   124,    95,   179,    97,
     128,   132,   133,   134,   296,   115,   115,   117,    98,   144,
      13,   303,    44,    45,    74,    75,   197,   111,    70,   415,
     130,   130,   197,    95,   197,    97,   150,   208,   120,   292,
     480,   144,   124,   208,   494,   208,   128,   614,   144,   212,
     150,   151,   151,    75,    69,   495,   139,   143,   163,   312,
       3,   127,   143,   111,   401,   230,     3,   120,   152,   120,
     144,   121,   144,   348,   144,   494,   495,   128,   290,   163,
     280,   515,   589,   143,   143,    28,   452,   453,   449,   197,
     451,    28,   197,   454,   135,   136,   349,   137,   126,     3,
     208,   222,   144,   208,   152,   126,   128,   382,    70,   197,
     544,   211,   211,   388,   142,   280,   164,   280,   552,   126,
     208,   223,   230,   144,   491,   407,   129,   130,   212,   144,
     295,    74,   126,   140,   297,   197,    79,    74,   303,   646,
     303,   225,    79,   509,   584,   511,   208,   121,   142,   120,
     144,   314,   126,   197,   238,     3,   596,   128,   206,   138,
     126,   121,    16,   603,   208,   213,   126,   110,   111,   125,
      74,   164,   280,   110,   111,    79,   142,   225,   144,   371,
      28,   125,   144,   297,   603,   125,   553,   143,   126,   143,
     238,    69,    70,   126,   357,   303,    44,   297,   638,   143,
     143,   401,   642,   143,   142,   645,   110,   111,   292,   142,
     571,   572,   296,   206,   298,   126,   120,     3,   381,     3,
     213,     7,     8,     9,   128,   388,    74,    75,   312,   400,
       0,   671,   672,   144,   674,   406,   401,   677,   401,   120,
     515,     3,   407,   406,    28,   293,   409,   608,   609,   414,
     413,   126,   126,   416,    69,    70,    27,    10,    11,   121,
      44,   361,   702,   426,   128,   349,   144,   142,   142,   133,
     134,   371,   371,   121,    14,    15,   123,   361,   126,   719,
     328,     3,   722,     3,   651,     7,     8,     9,   336,   337,
      74,    75,    79,   121,   121,   409,    28,   381,   126,   407,
     293,   409,   350,   143,    75,   143,   414,   391,   356,   409,
     550,   121,    74,   121,   120,   363,   126,    79,   126,    90,
     120,     3,   124,   110,   111,   373,   491,   375,   491,   144,
     143,   121,   125,   126,   120,   328,   126,   123,   124,   142,
     143,   112,   121,   336,   337,   116,   121,   126,   110,   111,
     124,   126,   515,   140,   121,   141,   120,   350,   120,   126,
       1,   120,     3,     4,     5,   124,   128,   415,   120,   417,
     541,   485,   124,   139,   140,   141,   142,   120,   140,   121,
     480,   544,   375,   491,   155,   485,   434,    28,   143,   552,
     553,   121,    74,   143,   494,   495,   144,    79,   120,   135,
     136,   123,   124,   137,   138,   144,   177,   121,   179,   457,
     494,   495,   121,   461,   143,   144,   276,   277,   141,   141,
     126,   125,   120,   142,   417,   142,   125,   475,   110,   111,
      71,    72,   143,   143,   124,   124,   121,   121,   120,   121,
       3,   434,   125,   144,   144,   121,   128,   125,     3,   111,
     121,   143,     7,     8,     9,   143,   121,   228,   121,   230,
     121,   102,   103,   140,   457,   125,   550,   125,   461,   125,
     125,   585,   586,   587,   120,   120,   120,   118,   120,   120,
     144,   122,   475,   142,   584,   585,   586,   587,   651,   589,
     152,   142,   142,   121,   120,   143,   596,   121,   612,    56,
     143,   141,   550,   603,   143,   276,   277,   555,   125,   280,
     125,    74,   612,   125,   141,   177,    79,   140,   121,   603,
     142,   140,   143,   120,   144,   296,   297,   143,    64,   143,
     148,   302,   303,   304,   305,   142,   144,   146,   638,   144,
     142,   312,   642,   314,   144,   645,   646,   110,   111,    44,
      45,   322,   323,   653,   653,   326,   144,   120,   144,   144,
     144,   675,   555,   225,   678,   120,   144,   147,   123,   124,
     145,   671,   672,   149,   674,   675,   238,   677,   678,    74,
      75,   681,   681,    42,    79,    97,   357,   651,   423,   431,
     361,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   649,   702,   553,   376,   376,   391,   494,   238,   363,
     381,   382,    -1,   238,    -1,   110,   111,   388,    -1,   719,
      -1,   669,   722,   723,   723,   238,    -1,    -1,    -1,   400,
     401,    -1,    -1,   128,     3,   406,   407,    -1,   409,    -1,
     411,    -1,   413,   305,    -1,   416,    -1,    -1,    -1,   420,
     233,    -1,    -1,    -1,    -1,   426,   649,   428,    -1,    -1,
     322,   323,    -1,    -1,   326,    -1,    -1,    -1,   439,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   669,    -1,   449,    -1,
     451,   452,   453,   454,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     9,    -1,    -1,    12,    -1,    -1,    -1,    16,    -1,
      -1,   363,    -1,    -1,    -1,    74,    -1,    -1,    -1,   480,
      79,   482,    -1,    -1,   141,   486,    -1,    -1,    -1,    -1,
     491,    -1,    -1,   494,   495,    -1,    -1,    16,    -1,    -1,
      -1,    49,    -1,    -1,   317,   318,   319,   320,   509,    83,
     511,   110,   111,    -1,   515,   516,    -1,    -1,    -1,    -1,
      -1,   120,    96,    -1,    -1,   124,    -1,    -1,    -1,   103,
      49,    -1,    -1,    -1,    -1,    83,    -1,    -1,   539,   431,
     541,    -1,    -1,   544,    -1,    -1,    -1,    -1,    96,    -1,
      98,   552,   553,    -1,    -1,   103,   557,   449,    -1,   451,
     452,   453,   454,   111,    83,   566,    -1,    -1,    -1,    -1,
     571,   572,    -1,    -1,    -1,    -1,    95,    96,    97,    98,
      -1,    -1,    -1,   584,   103,    -1,    -1,    -1,    -1,   163,
      -1,   165,    -1,   167,    -1,   596,    -1,    -1,    -1,    -1,
      -1,    -1,   603,    -1,   152,    -1,    -1,   608,   609,    -1,
     158,    -1,    -1,    -1,    -1,   163,    -1,   509,    -1,   511,
      16,    -1,    -1,   197,    -1,    -1,    -1,    -1,    -1,   177,
      -1,    -1,    -1,    -1,   208,    -1,    -1,   638,   212,    -1,
     214,   642,    -1,    -1,   645,    -1,   165,    -1,    -1,    -1,
     651,    -1,    -1,    49,    -1,    -1,    -1,    -1,   550,    -1,
      -1,    -1,    -1,    -1,   212,   213,    -1,    -1,    -1,    -1,
     671,   672,    -1,   674,    -1,    -1,   677,   225,   197,   571,
     572,    -1,   230,    -1,    -1,    -1,    -1,    83,    -1,   208,
     238,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      96,   702,    98,    -1,    -1,    -1,   280,   103,    -1,    -1,
      -1,   230,    -1,   287,    -1,    -1,   608,   609,   719,    -1,
      -1,   722,    -1,   297,    -1,    -1,    -1,    -1,    -1,   303,
     304,    -1,   280,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   292,    -1,    -1,   295,   296,    -1,
     298,    -1,    -1,    -1,    -1,   303,    -1,   305,    -1,    -1,
      -1,   280,    -1,    -1,   312,   177,    -1,    -1,   287,    -1,
      -1,    -1,    -1,    -1,   322,   323,   295,    -1,   326,   327,
      -1,    -1,    -1,   357,   303,    -1,    -1,    -1,    -1,    16,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   349,   350,   616,   617,    -1,    -1,   381,   382,    -1,
      -1,    -1,    -1,   361,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    49,    -1,    -1,    -1,    -1,   401,    -1,    -1,
      -1,    -1,    -1,   381,   230,   409,   410,   411,    -1,    -1,
      -1,    -1,   416,   391,    -1,    -1,   420,    -1,   661,   662,
      -1,   664,   665,   401,    -1,    -1,    83,    -1,    -1,   407,
      -1,   409,    -1,    -1,    -1,    -1,   414,    -1,    95,    96,
      97,    98,   685,    -1,   687,    -1,   103,    -1,    -1,    -1,
     693,   694,   401,    -1,   280,    -1,   434,    -1,   407,    -1,
     409,   410,    -1,   305,    -1,   414,   709,    -1,   711,   295,
     713,   449,   715,   451,   452,   453,   454,   303,    -1,    -1,
     322,   323,    -1,    -1,   326,    -1,    -1,   491,   731,    -1,
     733,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   280,   491,    -1,    -1,   494,   495,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   297,
      -1,   509,    -1,   511,    -1,   303,   304,    -1,    -1,    -1,
     197,    -1,   491,    -1,    -1,    -1,   314,    -1,    -1,   553,
      -1,   208,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   550,   230,    -1,   401,    -1,    -1,    -1,   280,
      -1,   407,    -1,   409,    -1,    -1,    -1,    -1,   414,   357,
      -1,    -1,    -1,   571,   572,    -1,   297,    -1,    -1,    -1,
      -1,    -1,   303,    -1,    -1,    -1,    -1,   449,    -1,   451,
     452,   453,   454,   381,   382,    -1,    -1,    -1,    -1,    -1,
     388,    -1,    -1,   280,    -1,   603,    -1,    -1,    -1,    -1,
     608,   609,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   409,    -1,   411,    -1,   413,   303,   651,   416,    -1,
      -1,    -1,   420,    -1,    -1,    -1,   357,    -1,   426,    28,
     428,    -1,    -1,    -1,    -1,   491,    -1,   509,    -1,   511,
      -1,   439,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     381,   382,    -1,    -1,    -1,    -1,    -1,   388,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,   409,    -1,
     411,    -1,   413,    -1,    -1,   416,    -1,    -1,    -1,   420,
      -1,    -1,    -1,   491,    -1,   426,    -1,    -1,    -1,   571,
     572,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,   515,   516,   118,
     407,   120,   409,   122,    -1,    -1,    -1,   414,   127,   128,
     129,   130,   131,   132,    -1,    -1,   608,   609,    -1,    -1,
      -1,    -1,    -1,    -1,   143,   144,   544,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   552,   553,    -1,    -1,    -1,   557,
     491,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   515,   516,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,   491,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,   544,    -1,    -1,    -1,    -1,    85,    -1,
      -1,   552,   553,    -1,    -1,    -1,   557,     1,    -1,     3,
       4,     5,     6,   100,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   651,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     651,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,   120,    -1,   122,    -1,
      -1,    -1,    -1,   127,   128,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   142,   143,
     144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     142,   143,   144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,    -1,   122,    -1,    -1,    -1,    -1,   127,   128,   129,
     130,   131,   132,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   142,   143,   144,    -1,    -1,    -1,    -1,    -1,
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
     118,    -1,   120,    -1,   122,    -1,    -1,    -1,    -1,   127,
     128,   129,   130,   131,   132,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   142,   143,   144,    -1,    -1,    -1,
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
      -1,   117,   118,    -1,   120,    -1,   122,    -1,    -1,    -1,
      -1,   127,   128,   129,   130,   131,   132,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   142,   143,   144,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,   118,    -1,   120,    -1,   122,    -1,
      -1,    -1,    -1,   127,   128,   129,   130,   131,   132,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   142,   143,
     144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
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
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     142,   143,   144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,   127,   128,   129,
     130,   131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,   143,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,     1,   122,     3,     4,     5,    -1,    -1,   128,    -1,
      -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
     120,    -1,   122,    -1,    -1,    -1,    -1,    -1,   128,    -1,
       1,   131,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    -1,    -1,
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
      -1,   122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,
     131,   132,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   142,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    28,    71,    72,    73,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
      -1,   120,    -1,   122,    -1,    -1,    -1,    -1,   127,   128,
     129,   130,   131,   132,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,   142,   143,   109,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,   118,    -1,   120,   121,   122,    -1,
      -1,    -1,    -1,   127,   128,   129,   130,   131,   132,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   143,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    28,   120,    -1,
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,   120,
       1,   122,     3,     4,     5,    -1,   127,   128,   129,   130,
     131,   132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   143,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    28,
      -1,    -1,    -1,    -1,    85,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    28,    -1,    -1,   117,   118,    -1,   120,
      -1,   122,    71,    72,    73,    -1,    -1,   128,    -1,    -1,
     131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    71,    72,    73,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,    -1,   118,
      -1,   120,   121,   122,    -1,    -1,    -1,    -1,   127,   128,
     129,   130,   131,   132,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,   142,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,   121,   122,    -1,    -1,
      -1,    -1,   127,   128,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,     3,   120,    -1,
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     142,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,     3,   120,    -1,    -1,    -1,   124,    -1,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,     3,    -1,
     120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,   142,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,     1,   120,     3,     4,     5,     6,
      -1,     8,     9,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
      -1,   118,    -1,   120,   121,   122,    -1,    -1,    -1,    -1,
     127,   128,   129,   130,   131,   132,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      75,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      -1,    -1,    -1,   118,    -1,   120,   121,   122,    -1,    -1,
      -1,    -1,   127,   128,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    -1,    -1,    -1,     1,    79,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    28,    -1,    -1,    -1,   109,   110,   111,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,   120,   121,
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,     1,   109,     3,     4,     5,     6,    -1,
       8,     9,    -1,   118,    -1,   120,   121,   122,    -1,    -1,
      -1,    -1,   127,   128,   129,   130,   131,   132,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    71,    72,    73,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,    -1,   118,    -1,   120,    -1,
     122,    -1,    -1,   125,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
     118,    -1,   120,    -1,   122,    -1,    -1,   125,    -1,   127,
     128,   129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    71,    72,    73,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,    -1,   118,
      -1,   120,    -1,   122,    -1,    -1,   125,    -1,   127,   128,
     129,   130,   131,   132,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,     1,   109,     3,     4,     5,     6,    -1,
       8,     9,    -1,   118,    -1,   120,   121,   122,    -1,    -1,
      -1,    -1,   127,   128,   129,   130,   131,   132,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    71,    72,    73,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,    -1,   118,    -1,   120,   121,
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
     118,    -1,   120,    -1,   122,    -1,    -1,    -1,    -1,   127,
     128,   129,   130,   131,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    71,    72,    73,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,    -1,   118,
      -1,   120,    -1,   122,    -1,    -1,    -1,    -1,   127,   128,
     129,   130,   131,   132,    -1,    -1,    28,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,    -1,   122,    -1,    -1,
      -1,    -1,   127,   128,   129,   130,   131,   132,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,     3,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
     122,    -1,    -1,    -1,    -1,   127,   128,   129,   130,   131,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,   121,    -1,    -1,   124,    -1,    -1,
      -1,   128,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,    -1,   124,    -1,
      -1,    -1,   128,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   128,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,    -1,   121,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,   121,    -1,    -1,   124,    -1,    -1,    -1,   128,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,   124,    -1,    -1,    -1,   128,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,    -1,   124,    -1,    -1,    -1,
     128,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,   121,    -1,    -1,    -1,    -1,    -1,
      -1,   128,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,    -1,   124,    -1,
      -1,    -1,   128,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    28,    -1,    -1,    79,    -1,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    66,
      -1,    -1,   117,    -1,    -1,   120,    -1,    74,    75,   124,
      -1,    -1,    79,   128,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
      -1,    -1,    -1,   120,    -1,    -1,    -1,   124,    -1,    -1,
      -1,   128,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,    -1,   121,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   118,   120,   122,   127,   128,
     129,   130,   131,   132,   146,   147,   148,   150,   152,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   167,   186,   187,   235,   237,   251,   120,
     153,   120,   153,   153,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    66,    75,    85,   100,
     112,   113,   117,   173,   178,   185,   186,   188,   190,   191,
     192,   200,   201,   153,   166,   170,   173,   170,   120,   153,
     121,   167,   169,   172,   185,   186,   188,   190,   201,   220,
     235,   143,     7,     8,     9,   120,   123,   124,   146,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,   141,
     168,   155,   128,   133,   134,   129,   130,    10,    11,    12,
      13,   135,   136,    14,    15,   127,   137,   138,    16,    17,
     139,   168,   143,     0,   220,   143,   146,   187,   120,    74,
      79,   110,   111,   120,   124,   128,   178,   179,   180,   184,
     185,   188,   190,   201,   205,   207,   215,   143,   146,   179,
     187,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    46,    47,    66,   100,   112,   113,   175,   178,   185,
     187,   189,   190,   191,   200,   201,   124,   207,   175,   220,
     121,   126,   120,   124,   179,   185,   188,   190,   201,   204,
     206,   215,   121,   123,   142,   143,   144,   149,   150,   166,
     173,   222,   238,   244,   245,   246,   247,   248,   249,   250,
     146,   121,   149,   151,   167,   146,   169,   149,   167,   155,
     155,   155,   156,   156,   157,   157,   158,   158,   158,   158,
     159,   159,   160,   161,   162,   163,   164,   169,   149,   167,
     144,   250,   121,   146,   202,   203,   143,   143,   186,   121,
     173,   207,   216,   217,   218,   170,   185,   214,   215,   205,
     215,   120,   120,   124,   205,    68,    78,   120,   131,   142,
     144,   146,   150,   173,   179,   193,   194,   195,   196,   197,
     209,   210,   212,   213,   215,   236,   237,   239,   240,   241,
     242,   243,   143,   143,   146,   187,   143,   120,   124,   178,
     185,   189,   190,   201,   207,   170,   124,   124,   207,   121,
     167,   121,   206,   216,   125,   170,   186,   204,   215,   120,
     124,   204,   155,   235,   144,   250,   141,   120,   146,   210,
     143,   229,   230,   126,   142,   142,   245,   247,   248,   144,
     121,   126,   125,   140,   144,   141,   126,   144,   202,   202,
     121,   120,   179,   206,   208,   209,   211,   213,   215,   121,
     121,   126,   125,   185,   215,   205,   120,   121,   216,   170,
      50,   174,   178,   185,   186,   188,   192,   173,   210,   120,
     128,   179,   208,   215,   173,   141,   120,   140,   142,   146,
     179,   198,   199,   208,   210,   213,   215,   213,   215,   144,
     197,   126,   142,   120,   124,   121,   146,   216,   219,   179,
     213,   142,   142,   230,   230,   230,   142,   230,   144,   193,
     144,   193,   143,   143,   193,   186,   170,   124,   125,   170,
     170,   124,   121,   121,   125,   125,   204,   121,   216,   125,
     170,   186,   144,   222,   144,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    77,   142,   146,   169,
     171,   173,   224,   225,   226,   227,   228,   230,   231,   232,
     233,   234,   236,   246,   149,   167,   166,   170,   203,   142,
     144,   142,   144,   209,   213,   215,   179,   211,    51,   218,
       3,    28,    44,    74,    75,   121,   181,   182,   183,   121,
     125,   146,   187,   143,   146,   178,   185,   186,   188,   206,
     146,   179,   187,   210,   215,   121,   120,   222,   121,   170,
     143,   213,   215,   126,   142,   140,   184,   179,   213,   213,
     194,   125,   170,   186,   121,   121,   126,   213,   144,   144,
     144,   193,   193,   144,   121,   125,   170,   125,   125,   170,
     121,   125,   125,   170,   140,   120,   120,   120,   224,   120,
     146,   142,   142,   142,   169,   146,   140,   142,   142,   176,
     177,   208,   171,   227,   171,   224,   144,   142,   193,   193,
     211,   121,   120,   121,   126,   182,    69,    70,   144,   143,
     143,   146,   146,   187,   121,   144,   250,   213,   199,   170,
     213,   125,   125,   146,   144,   144,   125,   125,   140,   224,
     169,   169,   121,   169,    56,   121,   231,   142,   142,   141,
     224,   126,   142,   141,   144,   144,   169,   121,   182,   230,
     230,    69,    70,   144,    69,    70,   144,   143,   144,   140,
     224,   121,   121,   224,   121,   120,   224,   121,   231,   170,
     177,   143,   167,   221,   121,    70,   144,    69,   144,   230,
     230,   230,   230,    69,    70,   144,   170,   224,   224,   224,
     169,   224,   121,   169,   142,   221,   223,   230,   230,    70,
     144,    69,   144,    70,   144,    69,   144,   230,   230,    64,
     121,   224,   121,   126,   144,   144,   144,   230,   230,   230,
     230,    70,   144,    69,   144,   224,   142,   224,   144,   221,
     144,   144,   144,   144,   230,   230,   144,   144
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
      case 146: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 158 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3389 "expression.ec"
	break;
      case 147: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3398 "expression.ec"
	break;
      case 150: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3407 "expression.ec"
	break;
      case 151: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3416 "expression.ec"
	break;
      case 153: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3425 "expression.ec"
	break;
      case 155: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3434 "expression.ec"
	break;
      case 156: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3443 "expression.ec"
	break;
      case 157: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3452 "expression.ec"
	break;
      case 158: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3461 "expression.ec"
	break;
      case 159: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3470 "expression.ec"
	break;
      case 160: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3479 "expression.ec"
	break;
      case 161: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3488 "expression.ec"
	break;
      case 162: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3497 "expression.ec"
	break;
      case 163: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3506 "expression.ec"
	break;
      case 164: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3515 "expression.ec"
	break;
      case 165: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3524 "expression.ec"
	break;
      case 166: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3533 "expression.ec"
	break;
      case 167: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3542 "expression.ec"
	break;
      case 169: /* "expression" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3551 "expression.ec"
	break;
      case 170: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 160 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3560 "expression.ec"
	break;
      case 171: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 179 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3569 "expression.ec"
	break;
      case 172: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3578 "expression.ec"
	break;
      case 173: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3587 "expression.ec"
	break;
      case 176: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3596 "expression.ec"
	break;
      case 177: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3605 "expression.ec"
	break;
      case 178: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3614 "expression.ec"
	break;
      case 179: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 207 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3623 "expression.ec"
	break;
      case 181: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3632 "expression.ec"
	break;
      case 182: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 208 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3641 "expression.ec"
	break;
      case 183: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 209 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3650 "expression.ec"
	break;
      case 184: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 206 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3659 "expression.ec"
	break;
      case 185: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3668 "expression.ec"
	break;
      case 186: /* "type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3677 "expression.ec"
	break;
      case 187: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3686 "expression.ec"
	break;
      case 188: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3695 "expression.ec"
	break;
      case 189: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3704 "expression.ec"
	break;
      case 190: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3713 "expression.ec"
	break;
      case 191: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3722 "expression.ec"
	break;
      case 193: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3731 "expression.ec"
	break;
      case 194: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3740 "expression.ec"
	break;
      case 195: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3749 "expression.ec"
	break;
      case 196: /* "property" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3758 "expression.ec"
	break;
      case 197: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3767 "expression.ec"
	break;
      case 198: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3776 "expression.ec"
	break;
      case 199: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3785 "expression.ec"
	break;
      case 200: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3794 "expression.ec"
	break;
      case 201: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 166 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3803 "expression.ec"
	break;
      case 202: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3812 "expression.ec"
	break;
      case 203: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3821 "expression.ec"
	break;
      case 204: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3830 "expression.ec"
	break;
      case 205: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3839 "expression.ec"
	break;
      case 206: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3848 "expression.ec"
	break;
      case 207: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3857 "expression.ec"
	break;
      case 208: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3866 "expression.ec"
	break;
      case 209: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3875 "expression.ec"
	break;
      case 210: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3884 "expression.ec"
	break;
      case 211: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3893 "expression.ec"
	break;
      case 212: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3902 "expression.ec"
	break;
      case 213: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3911 "expression.ec"
	break;
      case 214: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3920 "expression.ec"
	break;
      case 215: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3929 "expression.ec"
	break;
      case 216: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3938 "expression.ec"
	break;
      case 217: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3947 "expression.ec"
	break;
      case 218: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3956 "expression.ec"
	break;
      case 219: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3965 "expression.ec"
	break;
      case 220: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3974 "expression.ec"
	break;
      case 221: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3983 "expression.ec"
	break;
      case 222: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3992 "expression.ec"
	break;
      case 223: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4001 "expression.ec"
	break;
      case 224: /* "statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4010 "expression.ec"
	break;
      case 225: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4019 "expression.ec"
	break;
      case 226: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4028 "expression.ec"
	break;
      case 227: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4037 "expression.ec"
	break;
      case 228: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4046 "expression.ec"
	break;
      case 229: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 205 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4055 "expression.ec"
	break;
      case 230: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4064 "expression.ec"
	break;
      case 231: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4073 "expression.ec"
	break;
      case 232: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4082 "expression.ec"
	break;
      case 233: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4091 "expression.ec"
	break;
      case 234: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4100 "expression.ec"
	break;
      case 235: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4109 "expression.ec"
	break;
      case 236: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4118 "expression.ec"
	break;
      case 237: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 181 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4127 "expression.ec"
	break;
      case 239: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4136 "expression.ec"
	break;
      case 240: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4145 "expression.ec"
	break;
      case 241: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4154 "expression.ec"
	break;
      case 242: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4163 "expression.ec"
	break;
      case 243: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4172 "expression.ec"
	break;
      case 244: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4181 "expression.ec"
	break;
      case 245: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4190 "expression.ec"
	break;
      case 246: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 183 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4199 "expression.ec"
	break;
      case 247: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4208 "expression.ec"
	break;
      case 248: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4217 "expression.ec"
	break;
      case 249: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4226 "expression.ec"
	break;
      case 250: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4235 "expression.ec"
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
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 601 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 627 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 628 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 635 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 640 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 643 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 648 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 649 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 650 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 656 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 658 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 661 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 663 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 668 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 672 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 673 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 677 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 681 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 682 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 687 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 693 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 695 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 698 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 709 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 711 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 720 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 724 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 728 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 733 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 737 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 738 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 739 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 744 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 746 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 751 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 753 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 755 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 757 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 759 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 763 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 764 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 769 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 770 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 771 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 772 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 773 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 778 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 780 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 785 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 787 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 793 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 795 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 799 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 801 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 803 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 809 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 811 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 813 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 818 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 833 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 835 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 841 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 842 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 844 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 892 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 894 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 900 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 902 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 904 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 906 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 908 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 914 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 917 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 919 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 929 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 931 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 940 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 942 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 948 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 949 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 953 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 954 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 956 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 961 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 965 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 966 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 970 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 971 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 972 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 976 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 977 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 981 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 982 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 992 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 994 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 996 "expression.y"
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

  case 350:

/* Line 1464 of yacc.c  */
#line 1011 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1013 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1034 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1036 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1050 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1052 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1054 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1058 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1059 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1064 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1067 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1071 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1072 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1073 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1077 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1082 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1095 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1100 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1105 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1108 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1111 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1117 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1119 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1124 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1129 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1131 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1136 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1138 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1140 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1142 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1147 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1149 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1154 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1156 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1161 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1166 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1171 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1173 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1178 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1180 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1182 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1184 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1186 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1192 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1197 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1201 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1202 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1207 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1209 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1214 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1219 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1220 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1221 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1222 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1223 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1228 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1229 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1233 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7303 "expression.ec"
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
#line 1235 "expression.y"


