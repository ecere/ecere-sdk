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
#line 303 "type.ec"
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
#line 328 "type.ec"

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
#define YYLAST   9303

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  145
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  500
/* YYNRULES -- Number of states.  */
#define YYNSTATES  859

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
       2,     2,     2,   134,     2,     2,   126,   136,   131,     2,
     123,   124,   120,   132,   130,   133,   127,   135,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   140,   142,
     121,   141,   122,   139,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   128,     2,   129,   137,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   143,   138,   144,   125,     2,     2,     2,
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
     675,   677,   679,   681,   683,   685,   687,   689,   694,   699,
     704,   706,   708,   710,   712,   714,   716,   718,   720,   722,
     724,   726,   728,   730,   732,   734,   736,   738,   740,   742,
     744,   746,   751,   756,   761,   763,   769,   774,   779,   783,
     789,   796,   802,   808,   813,   820,   823,   826,   830,   834,
     836,   839,   841,   844,   846,   848,   850,   854,   858,   862,
     866,   868,   872,   874,   876,   878,   881,   885,   887,   891,
     901,   911,   919,   927,   933,   944,   955,   964,   973,   980,
     989,   998,  1005,  1012,  1017,  1027,  1037,  1045,  1053,  1059,
    1063,  1066,  1069,  1072,  1074,  1077,  1079,  1081,  1083,  1087,
    1089,  1092,  1095,  1099,  1105,  1108,  1111,  1116,  1122,  1130,
    1138,  1144,  1146,  1150,  1152,  1156,  1160,  1163,  1167,  1171,
    1175,  1180,  1185,  1188,  1192,  1196,  1201,  1205,  1208,  1212,
    1216,  1221,  1223,  1225,  1228,  1231,  1234,  1238,  1240,  1242,
    1245,  1248,  1251,  1255,  1257,  1260,  1264,  1267,  1269,  1273,
    1278,  1282,  1287,  1289,  1292,  1295,  1299,  1303,  1306,  1310,
    1314,  1317,  1319,  1321,  1324,  1327,  1329,  1332,  1335,  1339,
    1343,  1345,  1348,  1350,  1353,  1356,  1360,  1362,  1366,  1368,
    1372,  1375,  1378,  1381,  1385,  1387,  1389,  1391,  1395,  1397,
    1400,  1402,  1405,  1407,  1411,  1416,  1418,  1420,  1422,  1426,
    1428,  1430,  1432,  1434,  1436,  1438,  1442,  1447,  1451,  1453,
    1456,  1458,  1461,  1464,  1466,  1468,  1471,  1473,  1476,  1480,
    1482,  1485,  1491,  1499,  1505,  1511,  1519,  1526,  1534,  1539,
    1545,  1550,  1554,  1557,  1560,  1563,  1567,  1569,  1575,  1580,
    1586,  1591,  1596,  1600,  1605,  1609,  1613,  1616,  1619,  1622,
    1625,  1628,  1631,  1634,  1637,  1640,  1644,  1646,  1648,  1652,
    1655,  1657,  1659,  1662,  1665,  1667,  1670,  1672,  1674,  1677,
    1679
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     267,     0,    -1,   155,   120,    -1,   155,   121,    -1,   155,
       1,    -1,   150,    -1,   155,   155,    -1,    28,    -1,   149,
      -1,   149,   121,   208,   122,    -1,   149,   121,   208,    11,
      -1,   185,   227,    -1,   227,    -1,   185,   123,   124,    -1,
     125,   185,   123,   124,    -1,    78,   185,   227,    -1,    78,
     227,    -1,     3,    -1,   157,    -1,   123,   179,   124,    -1,
     155,    -1,   257,    -1,     4,    -1,   118,    -1,   254,    -1,
     126,   254,    -1,   126,   254,   127,   254,    -1,   123,   124,
      -1,    71,   185,   224,   128,   180,   129,    -1,    71,   185,
     128,   180,   129,    -1,   102,   185,   224,   128,   180,   129,
      -1,   102,   185,   128,   180,   129,    -1,    72,   180,   188,
     224,   128,   180,   129,    -1,    72,   180,   188,   128,   180,
     129,    -1,   103,   180,   188,   224,   128,   180,   129,    -1,
     103,   180,   188,   128,   180,   129,    -1,     1,    -1,   156,
      -1,   158,   128,   179,   129,    -1,   158,   123,   124,    -1,
     158,   123,   160,   124,    -1,   158,   127,   155,    -1,   158,
     155,    -1,   158,     7,   155,    -1,   158,     8,    -1,   158,
       9,    -1,   258,    -1,   177,    -1,   159,    -1,   160,   130,
     177,    -1,   160,   130,   159,    -1,     8,   162,    -1,     9,
     162,    -1,   163,   164,    -1,     6,   162,    -1,     6,   123,
     239,   124,    -1,   109,   162,    -1,   109,   123,   239,   124,
      -1,   161,    -1,   158,    -1,   131,    -1,   120,    -1,   132,
      -1,   133,    -1,   125,    -1,   134,    -1,    73,    -1,   162,
      -1,   123,   238,   124,   164,    -1,   164,    -1,   165,   120,
     164,    -1,   165,   135,   164,    -1,   165,   136,   164,    -1,
     165,    -1,   166,   132,   165,    -1,   166,   133,   165,    -1,
     166,    -1,   167,    10,   166,    -1,   167,    11,   166,    -1,
     169,   121,    -1,   167,    -1,   168,   167,    -1,   169,   122,
     167,    -1,   169,    12,   167,    -1,   169,    13,   167,    -1,
     169,    -1,   170,    14,   169,    -1,   170,    15,   169,    -1,
     170,    -1,   171,   131,   170,    -1,   171,    -1,   172,   137,
     171,    -1,   172,    -1,   173,   138,   172,    -1,   173,    -1,
     174,    16,   173,    -1,   174,    -1,   175,    17,   174,    -1,
     175,    -1,   175,   139,   179,   140,   176,    -1,   176,    -1,
     162,   178,   177,    -1,   162,   178,   159,    -1,   141,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     177,    -1,   179,   130,   177,    -1,   176,    -1,   184,   142,
      -1,   184,   189,   142,    -1,   255,   142,    -1,    77,   155,
     141,   180,   142,    -1,   199,    -1,   182,   199,    -1,   200,
      -1,   182,   200,    -1,   218,    -1,   182,   218,    -1,   202,
      -1,   182,   202,    -1,   199,    -1,   183,   199,    -1,   200,
      -1,   183,   200,    -1,   146,    -1,   183,   146,    -1,   218,
      -1,   183,   218,    -1,   202,    -1,   183,   202,    -1,   191,
      -1,   184,   191,    -1,   199,    -1,   184,   199,    -1,   200,
      -1,   184,   200,    -1,   218,    -1,   184,   218,    -1,   202,
      -1,   184,   202,    -1,   191,    -1,   185,   191,    -1,   199,
      -1,   185,   199,    -1,   200,    -1,   185,   200,    -1,   146,
      -1,   185,   146,    -1,   202,    -1,   185,   202,    -1,   218,
      -1,   185,   218,    -1,   185,    -1,   147,    -1,   191,    -1,
     187,   191,    -1,   199,    -1,   187,   199,    -1,   201,    -1,
     187,   201,    -1,   155,    -1,   187,   155,    -1,   155,   121,
     208,   122,    -1,   187,   155,   121,   208,   122,    -1,   191,
      -1,   188,   191,    -1,   199,    -1,   188,   199,    -1,   201,
      -1,   188,   201,    -1,   202,    -1,   188,   202,    -1,   218,
      -1,   188,   218,    -1,   155,    -1,   188,   155,    -1,   155,
     121,   208,   122,    -1,   188,   155,   121,   208,   122,    -1,
     190,    -1,   189,   130,   190,    -1,   225,    -1,   225,   141,
     240,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   117,    -1,    74,    -1,    75,    -1,   197,    -1,
      79,    -1,   110,    -1,   111,    -1,     3,    -1,    28,    -1,
      75,    -1,    74,    -1,    44,    -1,   194,    -1,   194,   123,
     179,   124,    -1,   195,    -1,   196,   195,    -1,   196,   130,
     195,    -1,   193,   123,   123,   196,   124,   124,    -1,   193,
     123,   123,   124,   124,    -1,   192,    -1,    44,    -1,    45,
      -1,   198,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   113,
      -1,   112,    -1,   203,    -1,   217,    -1,   148,    -1,    87,
     123,   177,   124,    -1,   100,   123,   148,   124,    -1,   100,
     123,   155,   124,    -1,    66,    -1,    82,    -1,    83,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   113,    -1,   112,    -1,
     203,    -1,   217,    -1,   150,    -1,    87,   123,   177,   124,
      -1,   100,   123,   148,   124,    -1,   100,   123,   155,   124,
      -1,    66,    -1,   209,   155,   143,   210,   144,    -1,   209,
     143,   210,   144,    -1,   209,   155,   143,   144,    -1,   209,
     143,   144,    -1,   209,   149,   143,   210,   144,    -1,   209,
     192,   155,   143,   210,   144,    -1,   209,   192,   143,   210,
     144,    -1,   209,   192,   155,   143,   144,    -1,   209,   192,
     143,   144,    -1,   209,   192,   150,   143,   210,   144,    -1,
     209,   155,    -1,   209,   150,    -1,   209,   192,   155,    -1,
     209,   192,   150,    -1,   185,    -1,   185,   223,    -1,   185,
      -1,   185,   223,    -1,   167,    -1,   206,    -1,   205,    -1,
     155,   141,   206,    -1,   155,   141,   205,    -1,   204,   141,
     206,    -1,   204,   141,   205,    -1,   207,    -1,   208,   130,
     207,    -1,    48,    -1,    49,    -1,   214,    -1,   210,   214,
      -1,   158,   141,   241,    -1,   211,    -1,   212,   130,   211,
      -1,    68,   187,   155,   143,    69,   249,    70,   249,   144,
      -1,    68,   187,   155,   143,    70,   249,    69,   249,   144,
      -1,    68,   187,   155,   143,    69,   249,   144,    -1,    68,
     187,   155,   143,    70,   249,   144,    -1,    68,   187,   155,
     143,   144,    -1,    68,   187,   223,   155,   143,    69,   249,
      70,   249,   144,    -1,    68,   187,   223,   155,   143,    70,
     249,    69,   249,   144,    -1,    68,   187,   223,   155,   143,
      69,   249,   144,    -1,    68,   187,   223,   155,   143,    70,
     249,   144,    -1,    68,   187,   223,   155,   143,   144,    -1,
      68,   187,   143,    69,   249,    70,   249,   144,    -1,    68,
     187,   143,    70,   249,    69,   249,   144,    -1,    68,   187,
     143,    69,   249,   144,    -1,    68,   187,   143,    70,   249,
     144,    -1,    68,   187,   143,   144,    -1,    68,   187,   223,
     143,    69,   249,    70,   249,   144,    -1,    68,   187,   223,
     143,    70,   249,    69,   249,   144,    -1,    68,   187,   223,
     143,    69,   249,   144,    -1,    68,   187,   223,   143,    70,
     249,   144,    -1,    68,   187,   223,   143,   144,    -1,   185,
     215,   142,    -1,   185,   142,    -1,   257,   142,    -1,   256,
     142,    -1,   259,    -1,   212,   142,    -1,   213,    -1,   142,
      -1,   216,    -1,   215,   130,   216,    -1,   231,    -1,   231,
     197,    -1,   140,   180,    -1,   231,   140,   180,    -1,   231,
     140,   180,   140,   180,    -1,    50,   155,    -1,    50,   150,
      -1,    50,   143,   219,   144,    -1,    50,   155,   143,   219,
     144,    -1,    50,   155,   143,   219,   142,   210,   144,    -1,
      50,   150,   143,   219,   142,   210,   144,    -1,    50,   150,
     143,   219,   144,    -1,   220,    -1,   219,   130,   220,    -1,
     155,    -1,   155,   141,   180,    -1,   123,   223,   124,    -1,
     128,   129,    -1,   128,   180,   129,    -1,   128,   148,   129,
      -1,   221,   128,   129,    -1,   221,   128,   180,   129,    -1,
     221,   128,   148,   129,    -1,   123,   124,    -1,   123,   234,
     124,    -1,   221,   123,   124,    -1,   221,   123,   234,   124,
      -1,   123,   224,   124,    -1,   123,   124,    -1,   123,   234,
     124,    -1,   222,   123,   124,    -1,   222,   123,   234,   124,
      -1,   233,    -1,   221,    -1,   233,   221,    -1,   192,   233,
      -1,   192,   221,    -1,   192,   233,   221,    -1,   233,    -1,
     222,    -1,   233,   222,    -1,   192,   233,    -1,   192,   222,
      -1,   192,   233,   222,    -1,   230,    -1,   233,   230,    -1,
     192,   233,   230,    -1,   225,   192,    -1,   155,    -1,   123,
     225,   124,    -1,   226,   128,   180,   129,    -1,   226,   128,
     129,    -1,   226,   128,   148,   129,    -1,   229,    -1,   233,
     229,    -1,   192,   229,    -1,   192,   233,   229,    -1,   233,
     192,   229,    -1,   226,   123,    -1,   228,   234,   124,    -1,
     228,   237,   124,    -1,   228,   124,    -1,   229,    -1,   226,
      -1,   192,   229,    -1,   192,   226,    -1,   226,    -1,   233,
     226,    -1,   192,   226,    -1,   192,   233,   226,    -1,   233,
     192,   226,    -1,   199,    -1,   232,   199,    -1,   120,    -1,
     120,   232,    -1,   120,   233,    -1,   120,   232,   233,    -1,
     235,    -1,   235,   130,    51,    -1,   236,    -1,   235,   130,
     236,    -1,   185,   225,    -1,   185,   223,    -1,   185,   131,
      -1,   185,   131,   225,    -1,   186,    -1,    65,    -1,   155,
      -1,   237,   130,   155,    -1,   182,    -1,   182,   223,    -1,
     183,    -1,   183,   223,    -1,   177,    -1,   143,   242,   144,
      -1,   143,   242,   130,   144,    -1,   176,    -1,   159,    -1,
     240,    -1,   242,   130,   240,    -1,   244,    -1,   249,    -1,
     250,    -1,   251,    -1,   252,    -1,   253,    -1,   155,   140,
     243,    -1,    52,   180,   140,   243,    -1,    53,   140,   243,
      -1,   181,    -1,   245,   181,    -1,   243,    -1,   246,   243,
      -1,   246,   181,    -1,   246,    -1,   245,    -1,   245,   246,
      -1,   143,    -1,   143,   144,    -1,   248,   247,   144,    -1,
     142,    -1,   179,   142,    -1,    54,   123,   179,   124,   243,
      -1,    54,   123,   179,   124,   243,    64,   243,    -1,    55,
     123,   179,   124,   243,    -1,    56,   123,   179,   124,   243,
      -1,    57,   243,    56,   123,   179,   124,   142,    -1,    58,
     123,   250,   250,   124,   243,    -1,    58,   123,   250,   250,
     179,   124,   243,    -1,    56,   123,   124,   243,    -1,    58,
     123,   250,   124,   243,    -1,    58,   123,   124,   243,    -1,
      59,   155,   142,    -1,    60,   142,    -1,    61,   142,    -1,
      62,   142,    -1,    62,   179,   142,    -1,     5,    -1,   184,
     155,   143,   266,   144,    -1,   184,   155,   143,   144,    -1,
     185,   155,   143,   266,   144,    -1,   185,   155,   143,   144,
      -1,   148,   143,   266,   144,    -1,   148,   143,   144,    -1,
     155,   143,   266,   144,    -1,   155,   143,   144,    -1,   143,
     266,   144,    -1,   143,   144,    -1,   151,   249,    -1,   154,
     249,    -1,   154,   142,    -1,   152,   249,    -1,   153,   249,
      -1,   184,   227,    -1,   184,   231,    -1,   260,   249,    -1,
     158,   141,   241,    -1,   241,    -1,   262,    -1,   263,   130,
     262,    -1,   263,   142,    -1,   264,    -1,   261,    -1,   265,
     264,    -1,   265,   261,    -1,   142,    -1,   265,   142,    -1,
     265,    -1,   263,    -1,   265,   263,    -1,   236,    -1,   236,
     140,   180,    -1
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
     828,   829,   830,   834,   835,   836,   837,   838,   839,   840,
     841,   842,   843,   844,   845,   846,   847,   848,   849,   850,
     851,   852,   853,   854,   855,   860,   861,   862,   863,   864,
     867,   868,   869,   870,   871,   876,   877,   880,   882,   887,
     888,   893,   894,   905,   909,   911,   912,   914,   915,   939,
     954,   955,   959,   960,   964,   965,   969,   973,   974,   978,
     980,   982,   984,   986,   989,   991,   993,   995,   997,  1000,
    1002,  1004,  1006,  1008,  1011,  1013,  1015,  1017,  1019,  1024,
    1025,  1026,  1027,  1028,  1029,  1030,  1031,  1035,  1037,  1042,
    1044,  1046,  1048,  1050,  1055,  1056,  1060,  1062,  1063,  1064,
    1065,  1069,  1071,  1076,  1078,  1084,  1086,  1088,  1090,  1092,
    1094,  1096,  1098,  1100,  1102,  1104,  1109,  1111,  1113,  1115,
    1117,  1122,  1123,  1124,  1125,  1126,  1127,  1131,  1132,  1133,
    1134,  1135,  1136,  1182,  1183,  1185,  1187,  1192,  1194,  1196,
    1198,  1200,  1205,  1206,  1209,  1211,  1213,  1219,  1223,  1225,
    1227,  1232,  1233,  1234,  1236,  1241,  1242,  1243,  1244,  1245,
    1249,  1250,  1254,  1255,  1256,  1257,  1261,  1262,  1266,  1267,
    1271,  1272,  1273,  1274,  1275,  1286,  1311,  1312,  1316,  1317,
    1321,  1322,  1326,  1328,  1330,  1346,  1348,  1370,  1372,  1377,
    1378,  1379,  1380,  1381,  1382,  1386,  1388,  1390,  1395,  1396,
    1400,  1401,  1404,  1408,  1409,  1410,  1414,  1418,  1426,  1431,
    1432,  1436,  1437,  1438,  1442,  1443,  1444,  1445,  1447,  1448,
    1449,  1453,  1454,  1455,  1456,  1457,  1461,  1465,  1467,  1472,
    1474,  1499,  1501,  1503,  1505,  1510,  1512,  1516,  1518,  1520,
    1522,  1524,  1530,  1532,  1537,  1542,  1543,  1547,  1549,  1554,
    1559,  1560,  1561,  1562,  1563,  1564,  1568,  1569,  1570,  1574,
    1575
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
      42,    60,    62,    40,    41,   126,    36,    46,    91,    93,
      44,    38,    43,    45,    33,    47,    37,    94,   124,    63,
      58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   145,   146,   146,   147,   148,   148,   149,   150,   150,
     150,   151,   151,   152,   153,   154,   154,   155,   156,   156,
     157,   157,   157,   157,   157,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   157,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   159,   160,   160,   160,
     160,   161,   161,   161,   161,   161,   161,   161,   162,   162,
     163,   163,   163,   163,   163,   163,   163,   164,   164,   165,
     165,   165,   165,   166,   166,   166,   167,   167,   167,   168,
     169,   169,   169,   169,   169,   170,   170,   170,   171,   171,
     172,   172,   173,   173,   174,   174,   175,   175,   176,   176,
     177,   177,   177,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   179,   179,   180,   181,   181,   181,
     181,   182,   182,   182,   182,   182,   182,   182,   182,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   185,
     185,   185,   185,   185,   185,   185,   185,   185,   185,   185,
     185,   186,   186,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   189,   189,   190,
     190,   191,   191,   191,   191,   191,   191,   192,   192,   192,
     193,   193,   193,   194,   194,   194,   194,   194,   195,   195,
     196,   196,   196,   197,   197,   198,   199,   199,   199,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   203,   203,   203,   203,   204,
     204,   205,   205,   206,   207,   207,   207,   207,   207,   207,
     208,   208,   209,   209,   210,   210,   211,   212,   212,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   214,
     214,   214,   214,   214,   214,   214,   214,   215,   215,   216,
     216,   216,   216,   216,   217,   217,   218,   218,   218,   218,
     218,   219,   219,   220,   220,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   221,   221,   222,   222,   222,   222,
     222,   223,   223,   223,   223,   223,   223,   224,   224,   224,
     224,   224,   224,   225,   225,   225,   225,   226,   226,   226,
     226,   226,   227,   227,   227,   227,   227,   228,   229,   229,
     229,   230,   230,   230,   230,   231,   231,   231,   231,   231,
     232,   232,   233,   233,   233,   233,   234,   234,   235,   235,
     236,   236,   236,   236,   236,   236,   237,   237,   238,   238,
     239,   239,   240,   240,   240,   241,   241,   242,   242,   243,
     243,   243,   243,   243,   243,   244,   244,   244,   245,   245,
     246,   246,   246,   247,   247,   247,   248,   249,   249,   250,
     250,   251,   251,   251,   252,   252,   252,   252,   252,   252,
     252,   253,   253,   253,   253,   253,   254,   255,   255,   256,
     256,   257,   257,   257,   257,   258,   258,   259,   259,   259,
     259,   259,   260,   260,   261,   262,   262,   263,   263,   264,
     265,   265,   265,   265,   265,   265,   266,   266,   266,   267,
     267
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
       1,     1,     1,     1,     1,     1,     1,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     4,     4,     1,     5,     4,     4,     3,     5,
       6,     5,     5,     4,     6,     2,     2,     3,     3,     1,
       2,     1,     2,     1,     1,     1,     3,     3,     3,     3,
       1,     3,     1,     1,     1,     2,     3,     1,     3,     9,
       9,     7,     7,     5,    10,    10,     8,     8,     6,     8,
       8,     6,     6,     4,     9,     9,     7,     7,     5,     3,
       2,     2,     2,     1,     2,     1,     1,     1,     3,     1,
       2,     2,     3,     5,     2,     2,     4,     5,     7,     7,
       5,     1,     3,     1,     3,     3,     2,     3,     3,     3,
       4,     4,     2,     3,     3,     4,     3,     2,     3,     3,
       4,     1,     1,     2,     2,     2,     3,     1,     1,     2,
       2,     2,     3,     1,     2,     3,     2,     1,     3,     4,
       3,     4,     1,     2,     2,     3,     3,     2,     3,     3,
       2,     1,     1,     2,     2,     1,     2,     2,     3,     3,
       1,     2,     1,     2,     2,     3,     1,     3,     1,     3,
       2,     2,     2,     3,     1,     1,     1,     3,     1,     2,
       1,     2,     1,     3,     4,     1,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     3,     4,     3,     1,     2,
       1,     2,     2,     1,     1,     2,     1,     2,     3,     1,
       2,     5,     7,     5,     5,     7,     6,     7,     4,     5,
       4,     3,     2,     2,     2,     3,     1,     5,     4,     5,
       4,     4,     3,     4,     3,     3,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     3,     1,     1,     3,     2,
       1,     1,     2,     2,     1,     2,     1,     1,     2,     1,
       3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   220,   221,
     222,   223,   224,   226,   229,   230,   227,   228,   216,   217,
     219,   225,   292,   293,     0,   415,   240,   197,   198,   200,
     241,   242,   231,     0,     0,   201,   202,   233,   232,   196,
     155,   162,   236,     8,     5,     0,   161,   414,   149,   215,
       0,   199,   218,   151,   153,   157,   234,     0,   235,   159,
     499,     0,     0,   335,   334,     0,     0,     0,     4,     2,
       3,     6,   402,     0,     0,   412,   156,   377,   150,   215,
     152,   154,   158,   160,   362,   411,   410,   392,     0,   391,
     373,   361,     0,     0,     8,   276,   275,     0,     0,     1,
     343,     0,   341,     0,     0,    36,    22,   466,     0,     0,
       0,     0,     0,    66,     0,     0,     0,    23,    61,     0,
      64,     0,    60,    62,    63,    65,     0,    20,    37,    18,
      59,    58,    67,     0,    69,    73,    76,    80,     0,    85,
      88,    90,    92,    94,    96,    98,   100,     0,    24,    21,
       0,     0,   236,    20,    67,   283,   281,     0,   285,   284,
     290,     0,   400,   403,   404,   352,     0,     0,     0,     0,
     406,   408,   346,     0,   116,     0,     0,   377,     0,   413,
       0,   365,   394,   393,   364,     0,     0,   376,   387,     0,
     390,     0,     0,     0,     0,   363,   374,     0,     0,     0,
       0,     0,   326,   268,     0,     0,     0,     0,    20,     0,
       0,   215,     0,   297,     0,   325,   294,     0,    12,   382,
       0,     0,    21,   323,     0,     0,     0,   278,   277,   500,
       0,     0,   336,     0,     0,     0,    54,     0,    51,    52,
       0,     0,     0,     0,     0,     0,    56,    27,   114,     0,
     418,   121,   123,   127,   125,     0,    25,     0,     0,     0,
      44,    45,     0,     0,     0,    42,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   103,     0,    53,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   237,
     238,   239,     0,     0,   215,   282,   361,     0,    10,     9,
       0,   401,   405,   345,   378,   353,     0,   348,   347,     0,
     366,   375,   354,     0,   349,     0,     0,   380,     0,     0,
     388,   389,     0,   203,   204,   207,   206,   205,     0,   208,
     210,     0,   244,   245,   246,   247,   248,   250,   253,   254,
     251,   252,   243,   249,     0,   264,   255,     0,     0,   257,
     256,   260,   169,     0,   163,   165,   167,   258,     0,   259,
       0,    16,    61,     0,    20,     0,   446,     0,   477,   480,
     481,   479,   478,     0,     0,     0,   320,   377,   215,     0,
     327,   395,    11,   329,     0,   384,     0,   266,   295,     0,
     324,     0,   383,   322,   321,     0,   267,     0,   273,     0,
       0,     0,   344,   342,     0,   340,     0,   337,   133,    20,
     420,   129,   131,   137,   135,     0,     0,     0,   215,   368,
       0,   367,   183,     0,   173,   175,   177,   179,   181,     0,
       0,     0,     0,    19,     0,     0,   122,   124,   128,   126,
     419,     0,     0,   494,     0,   472,    59,   426,   425,     0,
     139,   141,   143,   147,   145,   486,    46,     0,   491,   487,
     497,   490,     0,     0,   474,     0,    43,    39,    48,     0,
      47,    41,     0,   102,   101,    70,    71,    72,    74,    75,
      77,    78,    83,    84,    82,    86,    87,    89,    91,    93,
      95,    97,     0,   281,   287,   286,   364,   289,   288,   291,
     407,   409,   355,   351,   350,   381,   379,   417,   214,     0,
       0,     0,   211,   335,   334,     0,     0,     0,     0,   170,
     164,   166,   168,     0,   275,     0,    15,   215,     0,   447,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   449,    20,     0,   438,     0,   440,   429,     0,
       0,     0,   430,   431,   432,   433,   434,     0,   296,    13,
     331,     0,   397,     0,     0,   319,     0,   330,     0,   396,
     385,   298,   386,   269,   265,   271,     0,   272,     0,     0,
       0,   134,   130,   132,   138,   136,   421,    55,   357,     0,
       0,     0,   371,   370,     0,     0,   369,     0,     0,   184,
     174,   176,   178,   180,   182,     0,     0,     0,     0,     0,
      57,   115,    68,    26,   476,     0,     0,   377,   140,   142,
     144,   148,   146,   482,   483,   484,     0,   489,   495,   493,
     498,   492,   471,   473,    40,     0,    38,     0,   282,     0,
     213,   212,     0,     0,     0,     0,     0,     0,   313,     0,
       0,     0,     0,   278,   277,    14,     0,     0,     0,     0,
       0,     0,     0,     0,   462,   463,   464,     0,     0,     0,
     450,   117,   377,     0,   187,   189,   439,     0,   442,   441,
     448,   119,   470,     0,   398,     0,   328,   395,     0,   332,
     399,   274,   270,   339,   338,   356,   358,    29,   372,   359,
       0,     0,     0,     0,     0,     0,    31,     0,     0,     0,
     475,   485,   488,    50,    49,    99,   209,   261,   262,   263,
     171,     0,     0,     0,     0,     0,   303,     0,     0,   318,
       0,     0,   437,     0,     0,     0,     0,     0,     0,     0,
     461,   465,     0,   435,     0,     0,   118,     0,   469,   397,
       0,     0,   396,     0,   360,    28,   185,    33,     0,     0,
      30,    35,     0,     0,   311,     0,   312,   172,     0,     0,
       0,     0,     0,     0,   308,   436,     0,     0,   458,     0,
       0,   460,     0,     0,     0,   468,     0,   188,     0,   422,
     190,   398,   399,   333,   186,    32,    34,     0,     0,     0,
     301,     0,   302,     0,   316,     0,   317,     0,     0,   451,
     453,   454,     0,   459,     0,     0,   120,   467,   427,     0,
     309,   310,     0,     0,     0,     0,     0,   306,     0,   307,
       0,     0,   456,     0,     0,   423,   299,   300,   314,   315,
       0,     0,   452,   455,   457,   424,   428,   304,   305
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    40,    41,   126,    43,    44,   204,   205,   206,   207,
     127,   128,   129,   130,   457,   479,   131,   154,   133,   134,
     135,   136,   137,   138,   139,   140,   141,   142,   143,   144,
     145,   146,   248,   277,   554,   175,   688,   250,   420,   459,
     210,    47,   363,   433,   683,   684,    48,    49,    50,   339,
     340,   341,    51,    52,    53,    54,   436,    55,    56,   157,
     158,   159,   160,   161,    57,   212,   213,   214,   215,   216,
     389,   390,    58,    59,   101,   102,    84,   429,   167,   430,
     168,   217,   218,    88,   219,    90,   393,   163,   220,   169,
     170,   171,   193,   255,   425,   800,   465,   829,   557,   558,
     559,   560,   561,   377,   562,   563,   564,   565,   566,   148,
     567,   221,   149,   466,   223,   467,   468,   469,   470,   471,
     472,   473,    61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -761
static const yytype_int16 yypact[] =
{
    8916,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,  -761,    27,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,   -84,   -40,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,   -36,  -761,   303,  7335,  -761,  -761,  -761,
     -14,  -761,  -761,  -761,  -761,  -761,  -761,   563,  -761,  -761,
      24,   129,   122,    75,   119,  7048,    78,  6284,  -761,  -761,
    -761,  -761,  1002,  7439,  6695,   748,  -761,   102,  -761,   258,
    -761,  -761,  -761,  -761,   106,  -761,   781,   340,  8340,  -761,
    -761,   654,   199,  3565,   -69,  -761,   192,    28,  7048,  -761,
     215,   116,  -761,   122,   122,  -761,  -761,  -761,  7088,  7195,
    7195,  9006,  7048,  -761,  9006,  7048,  7228,  -761,  -761,  6418,
    -761,   360,  -761,  -761,  -761,  -761,   239,    34,  -761,  -761,
     574,  -761,   921,  7048,  -761,   -66,   406,   531,  7048,    95,
     534,   262,   269,   253,   399,     2,  -761,   347,  -761,  -761,
     349,    26,   239,    17,  -761,   531,  6163,   276,  -761,  -761,
    -761,   144,  -761,  1002,  -761,  -761,   773,   351,   660,   364,
     302,  -761,  -761,   152,  -761,   310,   748,  -761,   131,   781,
     609,   106,   340,  -761,   654,  8438,  6728,  -761,  -761,  6835,
    -761,   218,   375,   164,    19,   106,  -761,    15,  9096,  8634,
    6639,  9006,  -761,  -761,   309,   309,   309,   412,   137,   475,
    5933,   131,  3691,  -761,   -32,  -761,  -761,   340,  -761,  -761,
     609,   322,   371,  -761,  5538,  3817,  3943,   359,   382,  -761,
    7048,   122,  -761,   -62,   169,  6418,  -761,  6868,  -761,  -761,
     102,  7641,  9186,  7742,  9186,  6418,  -761,  -761,  -761,   196,
    8141,  -761,  -761,  -761,  -761,   405,   407,  2711,  2855,   122,
    -761,  -761,  5255,   122,  7048,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,  -761,  -761,  -761,  -761,  5297,  -761,  7048,
    7048,  7048,  7048,  7048,  7048,  7048,   531,  7048,  7048,  -761,
    7048,  7048,  7048,  7048,  7048,  7048,  7048,  7048,  7048,  -761,
    -761,  -761,  6284,  7540,   320,   391,   362,  6284,  -761,  -761,
    6284,  -761,  -761,  -761,  -761,  -761,  8826,  -761,  -761,   609,
     106,  -761,  -761,   419,  -761,   233,   417,  -761,   237,   423,
    -761,  -761,   122,  -761,  -761,  -761,  -761,  -761,   426,   413,
    -761,   325,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,
    -761,  -761,  -761,  -761,    78,  -761,  -761,   434,   444,  -761,
    -761,  -761,   451,  5817,  -761,  -761,  -761,  -761,   922,  -761,
    8634,  -761,  1002,  6552,    38,  8730,   456,  5077,  -761,  -761,
    -761,  -761,  -761,  5297,   706,  7048,  -761,   158,   131,   123,
    -761,   340,  -761,   -39,   609,  -761,    19,  -761,  -761,   933,
    -761,    19,  -761,  -761,  -761,  4069,  -761,  4195,  -761,  4321,
    5538,  4447,  -761,  -761,  5538,  -761,  5538,  -761,  -761,   137,
    8141,  -761,  -761,  -761,  -761,   452,  8242,  7048,    45,   483,
     480,   486,   489,  7944,  -761,  -761,  -761,  -761,  -761,  7048,
     490,  8045,   493,  -761,  7048,   122,  -761,  -761,  -761,  -761,
    -761,  7048,   360,  -761,  2999,  -761,   562,  -761,  -761,  8634,
    -761,  -761,  -761,  -761,  -761,  -761,  -761,   309,  -761,  -761,
     203,  -761,  3143,   470,  -761,   476,  -761,  -761,  -761,   327,
    -761,  -761,   432,  -761,  -761,  -761,  -761,  -761,   -66,   -66,
     406,   406,   531,   531,   531,    95,    95,   534,   262,   269,
     253,   399,   307,  7843,  -761,  -761,   362,  -761,  -761,  -761,
    -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  7048,
     495,   315,  -761,  -761,  -761,  7048,    78,  6284,    -9,   -56,
    -761,  -761,  -761,    46,  -761,    78,  -761,   131,   498,  -761,
    7048,   484,   500,   503,   506,  5220,   507,   122,   492,   494,
    5701,   122,  -761,    39,   230,  -761,  6048,  -761,  -761,  2279,
    2423,   497,  -761,  -761,  -761,  -761,  -761,   501,  -761,  -761,
    -761,  3287,   340,    19,   722,  -761,  7048,  -761,    19,   340,
    -761,  -761,  -761,  -761,  -761,  -761,  4573,  -761,  4699,  4825,
    4951,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,   511,
     522,   518,   483,   486,  8536,  7048,   483,  6284,  7048,   527,
    -761,  -761,  -761,  -761,  -761,   523,   521,  7048,  7048,   525,
    -761,  -761,  -761,  -761,  -761,   512,  5297,   122,  -761,  -761,
    -761,  -761,  -761,  -761,  -761,  -761,  5297,  -761,  -761,  -761,
     203,  -761,  -761,  -761,  -761,  5297,  -761,  7048,  -761,   342,
    -761,  -761,   539,   542,    33,   170,   309,   309,  -761,  6284,
     227,   254,   526,  -761,  -761,  -761,   528,  5220,  7048,  7048,
    6908,   614,  5594,   529,  -761,  -761,  -761,   283,   536,  5220,
    -761,  -761,    60,   300,  -761,   570,  -761,  2567,  -761,  -761,
    -761,  -761,  -761,   547,   340,   131,  -761,   544,   609,   535,
     340,  -761,  -761,  -761,  -761,  -761,  -761,  -761,   483,  -761,
     554,   564,   324,   571,  6284,  7048,  -761,   575,   576,  7048,
    -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,  -761,
    -761,     8,   -11,   328,   309,   309,  -761,   309,   309,  -761,
     277,  5220,  -761,   356,   363,  5220,   368,   592,  5220,  5667,
    -761,  -761,  7048,  -761,  3431,   748,  -761,  5404,  -761,   544,
      19,    19,   544,  7048,  -761,  -761,  -761,  -761,   339,   587,
    -761,  -761,   589,   309,  -761,   309,  -761,  -761,    49,    23,
      93,    62,   309,   309,  -761,  -761,  5220,  5220,  -761,  5220,
    7048,  -761,  5220,  7015,   557,  -761,   577,  -761,  5404,  -761,
    -761,   544,   544,  -761,  -761,  -761,  -761,   578,   579,   309,
    -761,   309,  -761,   309,  -761,   309,  -761,   125,   161,   672,
    -761,  -761,   387,  -761,  5220,   392,  -761,  -761,  -761,   278,
    -761,  -761,   580,   598,   599,   600,   309,  -761,   309,  -761,
    5220,   604,  -761,  5220,  1997,  -761,  -761,  -761,  -761,  -761,
     606,   610,  -761,  -761,  -761,  -761,  -761,  -761,  -761
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -761,   193,  -761,   664,   696,    29,  -761,  -761,  -761,  -761,
       0,  -761,  -761,  1461,  -260,  -761,  -761,   167,  -761,  -107,
     297,   308,   -20,  -761,   293,   463,   464,   468,   472,   469,
    -761,  1542,   -49,  -761,   260,   -87,  -363,  -761,  -761,  -372,
      48,  -761,  -761,   546,  -761,    14,  1452,   927,  -761,  -761,
    -307,  -761,   379,  -761,  1302,  1532,  -177,  1156,  -148,  -761,
     213,   221,   478,  -512,  -188,  -102,   374,  -761,  -761,    72,
    -761,   217,    -6,  1194,   491,   567,   -15,  -396,    -2,  -236,
     -42,   421,  -187,  -761,  1083,   -64,   334,  -761,  1146,   -85,
    -761,     1,  -761,  -761,   555,  -760,  -374,  -761,    80,  -761,
    -761,   240,  -761,  -761,  1157,  -621,  -761,  -761,  -761,  -115,
    -761,  -761,   -80,  -761,  -761,  -761,   330,   168,   331,   335,
    -761,  -250,  -761
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -497
static const yytype_int16 yytable[] =
{
      45,    60,   478,   192,    86,   556,   256,   440,   475,   568,
     368,   229,   371,   222,   555,   655,   147,   483,   333,   297,
       1,   366,     1,   392,    64,   242,   278,   196,   244,     1,
       1,     1,   602,   179,   522,   606,     1,     1,   828,    65,
      29,     1,     1,   334,    85,    71,    77,   155,    46,     1,
     367,   749,    67,    63,   279,     2,     2,    96,   775,   335,
     656,   657,   100,     1,   181,   659,   151,   153,   231,   280,
     281,    35,    36,   166,   224,   177,   195,    71,   773,   177,
     414,     1,   415,    66,   856,    67,    95,   660,   191,   336,
     337,   177,   811,   208,   367,   712,   367,   228,   399,   326,
     323,   576,   329,   100,   100,     1,     2,   287,   288,    92,
     400,   240,  -377,  -377,   240,   156,   196,  -377,   286,   809,
     321,    46,   405,   407,   409,     1,   227,    71,   793,    99,
     265,   815,   222,   776,     1,   658,    46,    69,    70,   338,
       1,   298,   176,   412,   222,   222,   222,   733,  -377,  -377,
     301,    71,   774,    71,   305,   308,   240,   729,   302,   241,
     258,     1,   243,   813,    98,    72,    71,   812,   426,   320,
      62,   226,   485,   486,   487,   368,   177,   258,   177,   679,
     177,   258,   258,   536,   177,    45,   532,   556,   556,   661,
     599,    71,   369,   810,   177,   836,   686,   615,   362,    77,
     374,   240,   768,   754,   625,   619,   816,   708,    71,   265,
     387,   177,   208,   480,   651,   367,   289,   290,   103,    68,
     177,     1,    69,    70,   208,   208,   208,   361,   484,   185,
     838,   100,   132,    46,   186,   419,   369,   814,   369,    76,
      71,   240,   432,   240,   432,   419,   231,   370,   450,   375,
     445,    72,   721,   574,   176,   321,   612,    69,    70,   476,
     232,     1,   104,   481,   612,   575,   309,   492,   493,   837,
     494,   361,   633,   361,   310,   236,   238,   239,    69,    70,
     258,   317,   155,   246,   398,   367,   132,   155,   331,   181,
     155,   195,   730,   367,   332,   257,   734,   735,   570,   231,
     310,   571,   419,    45,    68,   839,     1,   419,   586,   588,
     153,   416,   589,   417,   590,   556,    45,   511,   333,   177,
     443,   693,   197,   737,   738,   222,   444,   222,   333,   222,
     222,   222,   517,   636,   222,   225,   222,   623,    69,    70,
     601,   600,  -416,   334,   622,   637,   782,   783,  -416,    76,
     503,    46,   616,   334,   524,   503,   230,   369,   156,   335,
     444,   533,   513,   529,    46,   107,   515,   132,   534,   335,
      77,   736,   680,   374,    71,   240,   257,   553,    72,   249,
     257,    73,   257,   523,   177,   723,    74,    71,   177,   336,
     337,   295,   361,   293,   177,   621,   177,    95,   739,   336,
     337,   177,   132,    76,   132,   208,   294,   208,   844,   208,
     208,   208,   132,   444,   208,   296,   208,   307,   596,    71,
     240,   784,   845,    69,    70,   751,    45,   369,   418,   132,
     755,   132,   316,   609,    76,   369,    76,   444,   418,   318,
      72,   609,   756,   303,   132,    71,   766,   647,    74,   520,
     777,   644,   376,   666,   310,   521,   265,   645,   310,   627,
     249,   804,   361,   188,   403,   132,   726,    87,   189,   310,
     361,   299,   444,   300,    46,   313,   652,   398,     1,   398,
     786,   398,   259,   260,   261,   303,   444,   787,   315,   699,
      74,   320,   789,   444,    87,   249,    87,   249,   444,   330,
     182,   648,   410,   240,   796,   249,   222,   155,   222,   222,
     222,   841,    87,   404,   685,   504,   843,   444,   711,   710,
     507,   713,   444,   505,   482,   411,   654,   153,   508,   451,
     717,   718,  -280,   662,   452,   664,   519,   177,   282,   283,
     132,   284,   285,   512,   132,   553,   514,   673,   291,   292,
     518,   678,   516,    71,   381,   376,   682,   525,   502,   553,
     553,   646,   444,    76,   663,     1,     1,   526,    76,   259,
     260,   261,   527,   177,   177,   156,   597,     1,   177,   488,
     489,   259,   260,   261,   495,   496,   208,   155,   208,   208,
     208,     2,   490,   491,   233,   234,   724,    87,   262,   182,
     539,    87,   263,   264,    45,    87,   604,   153,   605,   426,
     607,   132,     1,   591,   642,   182,   383,   620,   617,   650,
     643,    87,   665,   668,   667,   671,   669,    71,   769,   670,
     672,   391,   772,   249,   674,   705,   675,    27,    28,   155,
     689,   690,    29,   691,    27,    28,   706,   707,   714,    29,
     716,   715,    46,   719,    71,   156,   720,     1,   398,   153,
     398,   398,   398,   727,    42,   794,   728,   553,   741,   740,
     747,   750,   189,    35,    36,   763,   803,   752,   764,   553,
      35,    36,    71,    27,    28,   262,   132,   553,    29,   263,
     264,   758,   132,   765,   155,   177,    76,   262,   177,   826,
     767,   263,   264,   626,   770,   771,    93,   156,   799,     1,
      42,   757,   132,   685,   153,   790,   805,   132,   806,    35,
      36,   827,   830,   831,   846,     1,   132,   132,    27,    28,
     150,   152,   176,    29,    27,    28,   840,    42,   173,    29,
      87,   553,   847,   848,   849,   553,   853,   742,   553,   799,
     857,     1,    42,    94,   858,   177,   497,   152,   498,   753,
     177,   177,   156,   499,    35,    36,   501,   689,   500,   797,
      35,    36,   577,   581,    68,    42,     1,    73,    42,   649,
      27,    28,    74,   152,   314,    29,   553,   553,   509,   553,
     441,   696,   553,   634,    87,   799,    27,    28,   413,   687,
     442,    29,   639,   640,   722,    87,     0,   641,     0,   572,
     677,     0,   132,     0,     0,   579,    35,    36,     0,     0,
      42,   785,    27,    28,   553,   788,    72,    29,   791,   176,
     569,     0,    35,    36,   132,   132,   132,   132,     0,   132,
     553,     0,    72,   553,     0,   176,   132,  -377,  -377,    42,
     325,     0,  -377,   328,   132,    27,    28,     0,    35,    36,
      29,     0,   385,    42,     0,    42,   819,   820,    72,   821,
       0,   176,   823,     0,    42,     0,   152,     0,     0,     0,
     391,     0,     0,  -377,  -377,     0,     0,     0,   152,   152,
     152,    35,    36,    69,    70,     0,  -377,  -377,     0,   152,
       0,  -377,     0,     0,   842,    42,     0,    42,   132,   152,
       0,     0,   132,     0,    42,   132,   132,     0,     0,     0,
     852,   152,   152,   854,   132,     1,     0,     0,   743,   744,
     746,     0,     0,     0,   105,     0,     1,   106,   107,   266,
     267,   268,   269,   270,   271,   272,   273,   274,   275,     0,
       2,     0,     0,   132,   132,     0,   132,   132,   182,   132,
     132,     2,     0,     0,     0,   132,   152,    42,     0,     0,
       0,   152,     0,    79,   152,     0,     0,    87,     0,     0,
      42,     0,     0,     0,    97,     0,     0,     0,     0,     0,
       0,   132,     0,     0,   694,   697,    27,    28,     0,   700,
      79,    29,   178,     0,   111,   112,     0,   132,     0,     0,
     132,   132,     0,   187,     0,     0,     0,     0,   194,     0,
     211,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    42,   114,   115,   152,     0,    42,
       0,   152,     0,     0,     0,     0,    18,    19,     0,     0,
     822,   117,     0,   825,     0,     0,   237,     0,     0,   121,
       0,     0,   276,     0,     0,     0,     0,     0,     0,   152,
       0,   152,     0,   152,   152,   152,    27,    28,   152,     0,
     152,    29,     0,   304,    42,     0,     0,     0,     0,     0,
      42,     0,     0,     0,     0,   187,     0,     0,     0,     0,
       0,     0,     0,   178,     0,     0,   187,   194,     0,     0,
       0,   194,    35,    36,     0,     0,   759,     0,   152,   762,
       0,     0,    72,    42,     0,     0,   211,   178,     0,    89,
       0,     0,     0,     0,     0,     0,   152,   388,     0,   211,
       0,     0,     0,     0,     0,     0,     0,   401,     0,     0,
       0,   211,   211,   211,     0,     0,    89,     0,    89,     0,
       0,     0,   183,     0,     0,     0,     0,    42,   428,     0,
     428,     0,     0,     0,    89,     0,    87,   304,     0,     0,
       0,   801,   802,     0,     0,     0,     0,     0,     0,     0,
     653,   152,    91,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   164,    91,
      42,   180,     0,   152,   152,   184,     0,     0,     0,     0,
     304,     0,     0,     0,     0,   152,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,   194,     0,     0,     0,
     152,     0,   152,   152,   152,     0,     0,     0,     0,    89,
       0,   183,     0,    89,     0,     0,     0,    89,    42,     0,
       0,   152,     0,     0,     0,   253,     0,   183,     0,     0,
       0,     0,     0,    89,     0,     0,     0,     0,     0,     0,
     304,     0,     0,     0,   395,   535,     0,   211,     0,     0,
     537,     0,   306,   402,     0,     0,     0,     0,     0,   312,
       0,   178,    82,   254,     0,     0,     0,     0,     0,     0,
       0,   578,   180,   152,   319,     0,     0,     0,     0,     0,
       0,     0,   211,     0,   211,     0,   211,   211,   211,     0,
       0,   211,     0,   211,     0,     0,   180,   304,    80,     0,
      83,   152,     0,   428,     0,     0,   394,   396,     0,     0,
     428,   378,   379,   380,   382,     0,    82,     0,   428,     0,
       0,     0,     0,     0,   162,     0,     0,     0,   152,     0,
       0,     0,     0,     0,     0,     0,   388,   431,     0,   431,
       0,   423,     0,     0,     0,     0,   306,    82,   437,    82,
     437,   423,    89,     0,    83,     0,   448,     0,     0,     0,
       0,     0,     0,   463,   463,     0,     0,     0,   152,     0,
       0,   251,     0,     0,     0,     0,     0,     0,     0,   424,
     304,     0,     0,     0,     0,    83,   438,    83,   438,   424,
       0,     0,     0,     0,   449,     0,     0,     0,     0,   306,
     506,   464,   464,     0,     0,     0,    89,     0,    80,     0,
       0,     0,     0,     0,     0,   311,     0,    89,     0,     0,
       0,   395,     0,     0,     0,     0,     0,   402,     0,   580,
       0,     0,     0,   537,   582,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     365,   695,     0,     0,     0,     0,     0,     0,     0,   306,
       0,     0,    80,   211,     0,   211,   211,   211,   164,   180,
       0,     0,     0,     0,     0,     0,    82,     0,     0,   253,
     180,    82,     0,   463,   573,     0,     0,   421,     0,     0,
       0,     0,     0,    80,   435,    80,   435,   421,     0,     0,
       0,     0,   446,     0,   209,     0,     0,     0,     0,   461,
     461,     0,     0,     0,    83,     0,   306,   254,     0,    83,
       0,   464,   431,     0,   603,     0,   594,     0,    81,   431,
       0,     0,     0,     0,     0,     0,     0,   431,     0,   613,
       0,     0,     0,     0,     0,     0,     0,   613,     0,     0,
       0,     0,     0,     0,     0,   394,     0,     0,    78,     0,
     463,     0,   187,     0,   595,   631,   174,     0,     0,     0,
     183,     0,     0,     0,   635,   761,     0,   614,   463,     0,
       0,     0,     0,     0,     0,   614,     0,     0,     0,    89,
     174,     0,     0,     0,     0,     0,     0,     0,   464,   306,
     364,   252,     0,   632,   174,     0,   580,   174,     0,    82,
       0,   582,    78,     0,     0,   531,   464,     0,     0,     0,
       0,     0,    80,   209,   162,   251,     0,    80,     0,   461,
       0,     0,   178,   319,     0,   209,   209,   209,    81,     0,
       0,     0,     0,    78,   434,    78,   434,    83,     0,     0,
       0,     0,   180,     0,     0,     0,     0,     0,     0,   460,
     460,     0,   631,     0,     0,   463,   463,     0,   456,   456,
     698,     0,   592,     0,     0,     0,     0,   463,   174,     0,
       0,   174,     0,     0,     0,   611,     0,     0,     0,     0,
       0,     0,    81,   611,     0,     0,     0,     0,     0,     0,
     632,     0,     0,   464,   464,     0,   461,     0,     0,     0,
       0,   629,     0,     0,     0,   464,     0,   422,     0,     0,
       0,     0,   174,    81,   461,    81,     0,   422,     0,     0,
       0,     0,   447,     0,     0,     0,     0,     0,     0,   462,
     462,     0,     0,     0,     0,     0,     0,     0,     0,   458,
     458,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,   731,   732,   530,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,    78,     0,   460,
       0,     0,     0,     0,     0,     0,     0,     0,    89,     0,
       0,   760,     0,   463,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   629,     0,
     209,   461,   461,     0,     0,     0,   209,     0,   209,     0,
     209,   209,   209,   461,     0,   209,     0,   209,     0,     0,
       0,   464,     0,     0,     0,   610,     0,     0,     0,     0,
       0,   778,   779,   610,   780,   781,     0,     0,     0,     0,
       0,   180,    81,     0,     0,   252,   460,    81,     0,   462,
     463,   628,     0,     0,     0,   456,     0,     0,     0,     0,
       0,     0,     0,     0,   460,   458,     0,   174,     0,     0,
     807,     0,   808,   456,     0,     0,     0,     0,     0,   817,
     818,     0,     0,     0,     0,     0,     0,     0,   464,     0,
       0,     0,   593,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   832,     0,   833,   174,
     834,     0,   835,     0,     0,     0,     0,     0,     0,     0,
       0,   174,     0,     0,     0,     0,   462,     0,     0,   461,
       0,   630,     0,   850,     0,   851,   458,     0,   105,     0,
       1,   106,   107,   108,   462,   109,   110,     0,   628,     0,
       0,   460,   460,     0,   458,     0,     0,     0,     0,     0,
       0,     0,     0,   460,     0,     2,     0,     0,     0,     0,
       0,     0,   456,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   209,     0,   209,
     209,   209,     0,     0,     0,     0,   461,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   111,   112,
     113,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   174,     0,     0,     0,     0,     0,   630,     0,
       0,   462,   462,     0,     0,     0,     0,   456,     0,   114,
     115,     0,     0,   462,     0,     0,   116,     0,     0,     0,
       0,     0,     0,   458,     0,   117,     0,   118,   174,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,   460,
     798,   855,     0,     0,     0,     0,     0,   174,     0,     0,
     174,     0,     0,     0,     0,     0,     0,     0,     0,   174,
     174,     0,     0,     0,     0,     0,     0,     0,   458,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   458,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   725,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   460,     0,     0,     0,
       0,     0,     0,     0,     0,   456,     0,     0,     0,   462,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   174,     0,     0,
       0,   174,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     105,     0,     1,   106,   107,   108,   462,   109,   110,     0,
       0,     0,     0,     0,   174,     0,   458,     0,     0,     0,
       0,     0,     0,     0,     0,   174,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,   540,   541,   542,   543,   544,   545,   546,   547,   548,
     549,   550,     0,     0,     0,    26,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,   551,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,    37,    38,     0,     0,     0,    39,   117,     0,   118,
       0,     0,   119,     0,   120,   121,     0,     0,     0,     0,
     122,   123,   124,   125,     0,     0,     0,     0,     0,     0,
       0,   552,   376,  -444,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,   540,   541,   542,   543,   544,
     545,   546,   547,   548,   549,   550,     0,     0,     0,    26,
       0,     0,     0,     0,   111,   112,   113,    27,    28,     0,
     551,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,   116,    35,    36,    37,    38,     0,     0,     0,
      39,   117,     0,   118,     0,     0,   119,     0,   120,   121,
       0,     0,     0,     0,   122,   123,   124,   125,     0,     0,
       0,     0,     0,     0,     0,   552,   376,  -443,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,   540,
     541,   542,   543,   544,   545,   546,   547,   548,   549,   550,
       0,     0,     0,    26,     0,     0,     0,     0,   111,   112,
     113,    27,    28,     0,   551,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,   116,    35,    36,    37,
      38,     0,     0,     0,    39,   117,     0,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,   552,
     376,  -445,   105,     0,     1,   106,   107,   108,     0,   109,
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
       0,   118,     0,     0,   119,     0,   120,   121,     0,     0,
       0,     0,   122,   123,   124,   125,     0,     0,     0,     0,
       0,     0,     0,   453,   454,   455,   105,     0,     1,   106,
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
       0,     0,    39,   117,     0,   118,     0,     0,   119,     0,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
       0,     0,     0,     0,     0,     0,     0,   453,   454,   474,
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
      36,    37,    38,     0,     0,     0,    39,   117,     0,   118,
       0,     0,   119,     0,   120,   121,     0,     0,     0,     0,
     122,   123,   124,   125,     0,     0,     0,     0,     0,     0,
       0,   453,   454,   624,   105,     0,     1,   106,   107,   108,
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
      39,   117,     0,   118,     0,     0,   119,     0,   120,   121,
       0,     0,     0,     0,   122,   123,   124,   125,     0,     0,
       0,     0,     0,     0,     0,   638,   454,  -496,   105,     0,
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
      38,     0,     0,     0,    39,   117,     0,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,   453,
     454,   692,   105,     0,     1,   106,   107,   108,     0,   109,
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
       0,   118,     0,     0,   119,     0,   120,   121,     0,     0,
       0,     0,   122,   123,   124,   125,   105,     0,     1,   106,
     107,     0,     0,   453,   454,   795,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   198,     0,     0,   111,   112,     0,    27,
      28,     0,     0,   199,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,   117,     0,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   203,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   198,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   199,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,   117,
       0,    72,     0,     0,   200,     0,   201,   121,   105,     0,
       1,   106,   107,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   202,     0,   397,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   198,     0,     0,   111,   112,
       0,    27,    28,     0,     0,   199,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,   117,     0,    72,     0,     0,
     200,     0,   201,   121,   105,     0,     1,   106,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   202,
       0,   406,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   198,     0,     0,   111,   112,     0,    27,    28,     0,
       0,   199,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,   117,     0,    72,     0,     0,   200,     0,   201,   121,
     105,     0,     1,   106,   107,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   202,     0,   408,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   198,     0,     0,
     111,   112,     0,    27,    28,     0,     0,   199,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,   117,     0,    72,
       0,     0,   200,     0,   201,   121,   105,     0,     1,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   202,     0,   583,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   198,     0,     0,   111,   112,     0,    27,
      28,     0,     0,   199,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,   117,     0,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   584,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   198,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   199,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,   117,
       0,    72,     0,     0,   200,     0,   201,   121,   105,     0,
       1,   106,   107,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   202,     0,   585,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   198,     0,     0,   111,   112,
       0,    27,    28,     0,     0,   199,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    39,   117,     0,    72,     0,     0,
     200,     0,   201,   121,   105,     0,     1,   106,   107,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   202,
       0,   587,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   198,     0,     0,   111,   112,     0,    27,    28,     0,
       0,   199,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   114,   115,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,   117,     0,    72,     0,     0,   200,     0,   201,   121,
     105,     0,     1,   106,   107,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   202,     0,   701,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   198,     0,     0,
     111,   112,     0,    27,    28,     0,     0,   199,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,   117,     0,    72,
       0,     0,   200,     0,   201,   121,   105,     0,     1,   106,
     107,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   202,     0,   702,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   198,     0,     0,   111,   112,     0,    27,
      28,     0,     0,   199,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,   117,     0,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   703,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   198,
       0,     0,   111,   112,     0,    27,    28,     0,     0,   199,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   114,   115,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,   117,
       0,    72,     0,     0,   200,     0,   201,   121,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,   202,     0,   704,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,   540,
     541,   542,   543,   544,   545,   546,   547,   548,   549,   550,
       0,     0,     0,    26,     0,     0,     0,     0,   111,   112,
     113,    27,    28,     0,   551,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   114,
     115,     0,     0,     0,     0,     0,   116,    35,    36,    37,
      38,     0,     0,     0,    39,   117,     0,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,   552,
     376,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,   540,   541,   542,   543,   544,   545,   546,   547,
     548,   549,   550,     2,     0,     0,     0,     0,     0,     0,
       0,   111,   112,   113,     0,     0,     0,     0,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   114,   115,     0,     2,   111,   112,   113,   116,
       0,     0,     0,     0,     0,     0,     0,     0,   117,     0,
     118,     0,     0,   119,     0,   120,   121,     0,     0,     0,
       0,   122,   123,   124,   125,     0,     0,   114,   115,     0,
       0,     0,   552,   376,   116,     0,     0,     0,   111,   112,
     113,     0,     0,   117,     0,   118,     0,     0,   119,   477,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
       0,     0,     0,     0,     0,     0,     0,     0,   454,   114,
     115,     0,     0,     0,     0,   105,   116,     1,   106,   107,
     108,     0,   109,   110,     0,   117,     0,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     2,     0,     0,     0,     0,     0,     0,     0,
     454,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   111,   112,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   114,   115,     0,     0,
       0,     0,     0,   116,     0,     0,     0,     0,     0,     0,
       0,     0,   117,     0,   118,     0,     0,   119,     0,   120,
     121,     0,     0,     0,     0,   122,   123,   124,   125,   105,
       0,     1,   106,   107,     0,     0,     0,   798,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,   105,     0,     1,   106,   107,
     108,     0,   109,   110,    26,     0,   198,     0,     0,   111,
     112,     0,    27,    28,     0,     0,   199,    29,     0,     0,
      30,    31,     2,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,   117,     0,    72,     0,
       0,   200,     0,   201,   121,   111,   112,   113,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
     202,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,   114,   115,     0,     0,
       0,     0,   105,   116,     1,   106,   107,   108,     0,   109,
     110,     0,   117,     0,   118,     0,     0,   119,   748,   120,
     121,     0,     0,     0,     0,   122,   123,   124,   125,     2,
       0,     0,     0,     0,     0,     0,   552,     0,   111,   112,
     113,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   114,
     115,     0,   111,   112,   113,     0,   116,     0,     0,     0,
       0,     0,     0,     0,     0,   117,     0,   118,     0,     0,
     119,   792,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,   114,   115,     0,     0,     0,     0,   552,
     116,     0,     0,     0,     0,     0,     0,     0,     0,   117,
       1,   118,     0,     0,   119,     0,   120,   121,     0,     0,
       0,     0,   122,   123,   124,   125,     0,     0,     0,     0,
       0,     0,     0,   676,     0,     2,     3,     4,     5,     6,
       7,   342,   343,   344,   345,   346,   347,   348,   349,   350,
     351,    18,    19,   352,   353,    22,    23,   354,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   355,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,     0,
       0,     0,   356,     0,   357,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   358,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,   359,
     360,     0,     0,     0,    39,     0,     1,    72,     0,     0,
     303,     0,     0,     0,     0,    74,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     528,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,     1,     0,    72,     0,     0,   384,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   385,     0,   386,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,     1,     0,    72,     0,
       0,   176,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     681,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,     0,     0,    72,     0,   105,   303,     1,   106,   107,
     108,    74,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,  -279,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   111,   112,   113,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,   116,    35,    36,    37,    38,     0,     0,
       0,    39,   117,     0,   118,     0,     0,   119,     0,   120,
     121,     0,     0,     0,     0,   122,   123,   124,   125,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   111,
     112,   113,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,   116,    35,    36,
      37,    38,     0,     0,     0,     0,   117,     0,   118,     0,
       0,   119,   247,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     2,     0,     0,
     117,     0,   372,     0,     0,   373,   247,   120,   121,     0,
       0,     0,     0,   122,   123,   124,   125,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,     0,     0,    29,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,     0,     0,     0,     0,     0,     2,   117,     0,   372,
       0,     0,   373,   247,   120,   121,   111,   112,   113,     0,
     122,   123,   124,   125,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   114,   115,   111,
     112,   113,     0,     0,   116,     0,     0,     0,     0,     0,
       0,     0,     0,   117,     0,   118,     0,     0,   119,     0,
     120,   121,     0,     0,   172,     0,   122,   123,   124,   125,
     114,   115,     0,     0,     0,     0,   105,   116,     1,   106,
     107,   108,     0,   109,   110,     0,   117,     0,   118,     0,
       0,   119,     0,   120,   121,     0,     0,   324,     0,   122,
     123,   124,   125,     2,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   111,   112,   113,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   114,   115,   111,
     112,   113,     0,     0,   116,     0,     0,     0,     0,     0,
       0,     0,     0,   117,     0,   118,     0,     0,   119,     0,
     120,   121,     0,     0,   327,     0,   122,   123,   124,   125,
     114,   115,     0,     0,     0,     0,     0,   116,     0,   111,
     112,   113,     0,     0,     0,     0,   117,     0,   118,     0,
       0,   119,   247,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     0,     0,     0,     0,     0,     0,     0,
     114,   115,     0,     0,     0,     0,   105,   116,     1,   106,
     107,   108,     0,   109,   110,     0,   117,     0,   118,     0,
       0,   119,   745,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     2,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   111,   112,   113,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,   114,   115,   111,
     112,   113,     0,     0,   116,     0,     0,     0,     0,     0,
       0,     0,     0,   117,     0,   118,     0,     0,   119,   824,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
     114,   115,     0,     0,     0,     0,     0,   116,     0,   111,
     112,   113,     0,     0,     0,     0,   117,     0,   118,     0,
       0,   119,     0,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     0,     0,     0,     0,     0,     0,     0,
     114,   115,     0,     0,     0,     0,   105,   116,     1,   106,
     107,   108,     0,   109,   110,     0,   117,     0,   118,     0,
       0,   235,     0,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     2,     0,     0,     0,     0,     0,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   111,   112,   113,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   114,   115,   111,
     112,   113,     0,     0,   116,     0,     0,     0,     0,     0,
       0,     0,     0,   117,     0,   118,     0,     0,   237,     0,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
     114,   115,     0,     0,     0,     0,     0,   116,     1,     0,
       0,     0,     0,     0,     0,     0,   117,     0,   118,     0,
       0,   245,     0,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     1,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,     0,     0,    72,     0,     0,    73,     0,
       0,     0,     0,    74,     0,     0,    75,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     1,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    39,     0,     0,    72,
       0,     0,    73,   165,     0,     0,     0,    74,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     1,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     0,     0,
      72,     0,     0,   303,   165,     0,     0,     0,    74,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     1,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
       0,    72,     0,     0,   426,     0,     0,     0,     0,   427,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     1,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
       0,     0,    72,     0,     0,   426,     0,     0,     0,     0,
     439,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     1,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      39,     0,     0,    72,     0,     0,   303,     0,     0,     0,
       0,    74,     2,     3,     4,     5,     6,     7,   342,   343,
     344,   345,   346,   347,   348,   349,   350,   351,    18,    19,
     352,   353,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     355,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,     0,     0,     0,   356,
       0,   357,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   358,     0,     0,     0,     1,     0,
       0,     0,     0,     0,    35,    36,   359,   360,     0,     0,
       0,    39,     0,     0,    72,     0,     0,   426,     0,     0,
       0,     0,   608,     2,     3,     4,     5,     6,     7,   342,
     343,   344,   345,   346,   347,   348,   349,   350,   351,    18,
      19,   352,   353,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   355,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,     0,     0,     0,
     356,     0,   357,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     1,   358,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,   359,   360,     0,
       0,     0,    39,     0,     0,    72,     0,     0,   426,     2,
       0,     0,     0,   618,     0,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     1,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,     0,     0,
       0,    72,     0,     0,   303,     0,     0,     0,     0,    74,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     1,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
       0,     0,    72,     0,     0,   426,   598,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     0,     0,
       0,     0,     0,     0,   190,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    25,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,     0,     0,     0,     0,
       0,     0,   322,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     0,     0,     0,     0,     0,     0,
     709,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,     0,     0,    72,     0,     0,   176,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     0,     0,
       0,     0,     0,   538,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,   510,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     2,     3,     4,     5,     6,     7,
     342,   343,   344,   345,   346,   347,   348,   349,   350,   351,
      18,    19,   352,   353,    22,    23,   354,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   355,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,     0,     0,
       0,   356,     0,   357,     0,     0,     0,     0,     0,     1,
       0,     0,     0,     0,     0,     0,   358,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,   359,   360,
       0,     0,     0,    39,     2,     3,     4,     5,     6,     7,
     342,   343,   344,   345,   346,   347,   348,   349,   350,   351,
      18,    19,   352,   353,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   355,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,     0,     0,
       0,   356,     0,   357,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   358,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,   359,   360,
       0,     0,     0,    39
};

static const yytype_int16 yycheck[] =
{
       0,     0,   262,    88,    46,   377,   121,   243,   258,   383,
     198,    98,   199,    93,   377,   527,    65,   277,     3,    17,
       3,   198,     3,   210,    24,   112,   133,    91,   115,     3,
       3,     3,   428,    75,   341,   431,     3,     3,   798,   123,
      79,     3,     3,    28,    46,    45,    46,    67,     0,     3,
     198,   672,   121,    24,   120,    28,    28,    57,    69,    44,
      69,    70,    62,     3,    79,   121,    66,    67,   130,   135,
     136,   110,   111,    73,   143,    75,    91,    77,    70,    79,
     142,     3,   144,   123,   844,   121,    57,   143,    88,    74,
      75,    91,    69,    93,   242,   607,   244,    97,   130,   186,
     185,   140,   189,   103,   104,     3,    28,    12,    13,   123,
     142,   111,    74,    75,   114,    67,   180,    79,   138,    70,
     184,    73,   224,   225,   226,     3,    97,   127,   749,     0,
     130,    69,   212,   144,     3,   144,    88,   120,   121,   124,
       3,   139,   123,   230,   224,   225,   226,   659,   110,   111,
     124,   151,   144,   153,   156,    11,   156,   124,   141,   111,
     143,     3,   114,    70,   140,   120,   166,   144,   123,   184,
     143,   143,   279,   280,   281,   363,   176,   143,   178,   140,
     180,   143,   143,   370,   184,   185,   363,   559,   560,   143,
     426,   191,   198,   144,   194,    70,   559,   433,   198,   199,
     200,   201,   714,   143,   454,   441,   144,   603,   208,   209,
     210,   211,   212,   262,   521,   363,   121,   122,   143,     1,
     220,     3,   120,   121,   224,   225,   226,   198,   277,   123,
      69,   231,    65,   185,   128,   235,   242,   144,   244,    46,
     240,   241,   242,   243,   244,   245,   130,   199,   250,   201,
     250,   120,   626,   130,   123,   319,   433,   120,   121,   259,
     144,     3,   143,   263,   441,   142,   122,   287,   288,   144,
     290,   242,   459,   244,   130,   108,   109,   110,   120,   121,
     143,   129,   302,   116,   212,   433,   119,   307,   124,   304,
     310,   306,   122,   441,   130,   143,    69,    70,   385,   130,
     130,   143,   302,   303,     1,   144,     3,   307,   410,   411,
     310,   142,   414,   144,   416,   687,   316,   316,     3,   319,
     124,   571,   123,    69,    70,   405,   130,   407,     3,   409,
     410,   411,   332,   130,   414,   143,   416,   452,   120,   121,
     427,   426,   124,    28,   451,   142,    69,    70,   130,   156,
     302,   303,   439,    28,   354,   307,   141,   363,   310,    44,
     130,   363,   129,   363,   316,     5,   129,   200,   368,    44,
     370,   144,   142,   373,   374,   375,   143,   377,   120,   119,
     143,   123,   143,   354,   384,   645,   128,   387,   388,    74,
      75,   138,   363,   131,   394,   444,   396,   368,   144,    74,
      75,   401,   235,   210,   237,   405,   137,   407,   130,   409,
     410,   411,   245,   130,   414,    16,   416,   141,   420,   419,
     420,   144,   144,   120,   121,   142,   426,   433,   235,   262,
     130,   264,   130,   433,   241,   441,   243,   130,   245,   129,
     120,   441,   142,   123,   277,   445,   122,   140,   128,   124,
     122,   124,   143,   540,   130,   130,   456,   130,   130,   459,
     200,   122,   433,   123,   142,   298,   124,    46,   128,   130,
     441,   124,   130,   124,   426,   124,   525,   405,     3,   407,
     124,   409,     7,     8,     9,   123,   130,   124,   124,   576,
     128,   506,   124,   130,    73,   235,    75,   237,   130,   124,
      79,   503,   143,   503,   754,   245,   586,   527,   588,   589,
     590,   124,    91,   142,   556,   302,   124,   130,   605,   604,
     307,   608,   130,   302,   264,   143,   526,   527,   307,   124,
     617,   618,   141,   533,   127,   535,   123,   537,   132,   133,
     373,    10,    11,   124,   377,   545,   129,   547,    14,    15,
     124,   551,   129,   553,   142,   143,   556,   123,   298,   559,
     560,   129,   130,   370,   535,     3,     3,   123,   375,     7,
       8,     9,   121,   573,   574,   527,   124,     3,   578,   282,
     283,     7,     8,     9,   291,   292,   586,   607,   588,   589,
     590,    28,   284,   285,   103,   104,   645,   176,   123,   178,
     144,   180,   127,   128,   604,   184,   123,   607,   128,   123,
     121,   444,     3,   420,   144,   194,   141,   124,   128,   124,
     144,   200,   124,   123,   140,   545,   123,   627,   715,   123,
     123,   210,   719,   373,   142,   124,   142,    74,    75,   659,
     560,   144,    79,   142,    74,    75,   124,   129,   121,    79,
     129,   128,   604,   128,   654,   607,   144,     3,   586,   659,
     588,   589,   590,   124,     0,   752,   124,   667,   140,   143,
      56,   142,   128,   110,   111,   140,   763,   141,   124,   679,
     110,   111,   682,    74,    75,   123,   519,   687,    79,   127,
     128,   144,   525,   129,   714,   695,   503,   123,   698,   142,
     129,   127,   128,   141,   129,   129,   143,   659,   757,     3,
      46,   141,   545,   755,   714,   123,   129,   550,   129,   110,
     111,   144,   144,   144,   144,     3,   559,   560,    74,    75,
      66,    67,   123,    79,    74,    75,    64,    73,    74,    79,
     319,   741,   144,   144,   144,   745,   142,   667,   748,   798,
     144,     3,    88,    57,   144,   755,   293,    93,   294,   679,
     760,   761,   714,   295,   110,   111,   297,   687,   296,   755,
     110,   111,   393,   399,     1,   111,     3,   123,   114,   519,
      74,    75,   128,   119,   124,    79,   786,   787,   310,   789,
     244,   574,   792,   459,   373,   844,    74,    75,   231,   559,
     245,    79,   472,   472,   636,   384,    -1,   472,    -1,   388,
     550,    -1,   645,    -1,    -1,   394,   110,   111,    -1,    -1,
     156,   741,    74,    75,   824,   745,   120,    79,   748,   123,
     124,    -1,   110,   111,   667,   668,   669,   670,    -1,   672,
     840,    -1,   120,   843,    -1,   123,   679,    74,    75,   185,
     186,    -1,    79,   189,   687,    74,    75,    -1,   110,   111,
      79,    -1,   140,   199,    -1,   201,   786,   787,   120,   789,
      -1,   123,   792,    -1,   210,    -1,   212,    -1,    -1,    -1,
     459,    -1,    -1,   110,   111,    -1,    -1,    -1,   224,   225,
     226,   110,   111,   120,   121,    -1,   123,   124,    -1,   235,
      -1,   128,    -1,    -1,   824,   241,    -1,   243,   741,   245,
      -1,    -1,   745,    -1,   250,   748,   749,    -1,    -1,    -1,
     840,   257,   258,   843,   757,     3,    -1,    -1,   668,   669,
     670,    -1,    -1,    -1,     1,    -1,     3,     4,     5,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,    -1,
      28,    -1,    -1,   786,   787,    -1,   789,   790,   537,   792,
     793,    28,    -1,    -1,    -1,   798,   302,   303,    -1,    -1,
      -1,   307,    -1,    46,   310,    -1,    -1,   556,    -1,    -1,
     316,    -1,    -1,    -1,    57,    -1,    -1,    -1,    -1,    -1,
      -1,   824,    -1,    -1,   573,   574,    74,    75,    -1,   578,
      73,    79,    75,    -1,    71,    72,    -1,   840,    -1,    -1,
     843,   844,    -1,    86,    -1,    -1,    -1,    -1,    91,    -1,
      93,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   370,   102,   103,   373,    -1,   375,
      -1,   377,    -1,    -1,    -1,    -1,    44,    45,    -1,    -1,
     790,   118,    -1,   793,    -1,    -1,   123,    -1,    -1,   126,
      -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,   405,
      -1,   407,    -1,   409,   410,   411,    74,    75,   414,    -1,
     416,    79,    -1,   156,   420,    -1,    -1,    -1,    -1,    -1,
     426,    -1,    -1,    -1,    -1,   168,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   176,    -1,    -1,   179,   180,    -1,    -1,
      -1,   184,   110,   111,    -1,    -1,   695,    -1,   454,   698,
      -1,    -1,   120,   459,    -1,    -1,   199,   200,    -1,    46,
      -1,    -1,    -1,    -1,    -1,    -1,   472,   210,    -1,   212,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   220,    -1,    -1,
      -1,   224,   225,   226,    -1,    -1,    73,    -1,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,   503,   241,    -1,
     243,    -1,    -1,    -1,    91,    -1,   755,   250,    -1,    -1,
      -1,   760,   761,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     526,   527,    46,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    46,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,
     556,    75,    -1,   559,   560,    79,    -1,    -1,    -1,    -1,
     303,    -1,    -1,    -1,    -1,   571,    -1,    -1,    -1,    -1,
      46,    -1,    -1,    -1,    -1,    -1,   319,    -1,    -1,    -1,
     586,    -1,   588,   589,   590,    -1,    -1,    -1,    -1,   176,
      -1,   178,    -1,   180,    -1,    -1,    -1,   184,   604,    -1,
      -1,   607,    -1,    -1,    -1,   119,    -1,   194,    -1,    -1,
      -1,    -1,    -1,   200,    -1,    -1,    -1,    -1,    -1,    -1,
     363,    -1,    -1,    -1,   211,   368,    -1,   370,    -1,    -1,
     373,    -1,   156,   220,    -1,    -1,    -1,    -1,    -1,   163,
      -1,   384,   156,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   394,   176,   659,   178,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   405,    -1,   407,    -1,   409,   410,   411,    -1,
      -1,   414,    -1,   416,    -1,    -1,   200,   420,    46,    -1,
     156,   687,    -1,   426,    -1,    -1,   210,   211,    -1,    -1,
     433,   204,   205,   206,   207,    -1,   210,    -1,   441,    -1,
      -1,    -1,    -1,    -1,    72,    -1,    -1,    -1,   714,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   459,   241,    -1,   243,
      -1,   235,    -1,    -1,    -1,    -1,   250,   241,   242,   243,
     244,   245,   319,    -1,   210,    -1,   250,    -1,    -1,    -1,
      -1,    -1,    -1,   257,   258,    -1,    -1,    -1,   754,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   235,
     503,    -1,    -1,    -1,    -1,   241,   242,   243,   244,   245,
      -1,    -1,    -1,    -1,   250,    -1,    -1,    -1,    -1,   303,
     304,   257,   258,    -1,    -1,    -1,   373,    -1,   156,    -1,
      -1,    -1,    -1,    -1,    -1,   163,    -1,   384,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,   394,    -1,   396,
      -1,    -1,    -1,   556,   401,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    46,    -1,
     198,   574,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   363,
      -1,    -1,   210,   586,    -1,   588,   589,   590,   372,   373,
      -1,    -1,    -1,    -1,    -1,    -1,   370,    -1,    -1,   373,
     384,   375,    -1,   377,   388,    -1,    -1,   235,    -1,    -1,
      -1,    -1,    -1,   241,   242,   243,   244,   245,    -1,    -1,
      -1,    -1,   250,    -1,    93,    -1,    -1,    -1,    -1,   257,
     258,    -1,    -1,    -1,   370,    -1,   420,   373,    -1,   375,
      -1,   377,   426,    -1,   428,    -1,   420,    -1,    46,   433,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   441,    -1,   433,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   441,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   459,    -1,    -1,   156,    -1,
     454,    -1,   685,    -1,   420,   459,    74,    -1,    -1,    -1,
     537,    -1,    -1,    -1,   467,   698,    -1,   433,   472,    -1,
      -1,    -1,    -1,    -1,    -1,   441,    -1,    -1,    -1,   556,
      98,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   454,   503,
     198,   119,    -1,   459,   112,    -1,   573,   115,    -1,   503,
      -1,   578,   210,    -1,    -1,   363,   472,    -1,    -1,    -1,
      -1,    -1,   370,   212,   372,   373,    -1,   375,    -1,   377,
      -1,    -1,   755,   537,    -1,   224,   225,   226,   156,    -1,
      -1,    -1,    -1,   241,   242,   243,   244,   503,    -1,    -1,
      -1,    -1,   556,    -1,    -1,    -1,    -1,    -1,    -1,   257,
     258,    -1,   556,    -1,    -1,   559,   560,    -1,   257,   258,
     574,    -1,   420,    -1,    -1,    -1,    -1,   571,   186,    -1,
      -1,   189,    -1,    -1,    -1,   433,    -1,    -1,    -1,    -1,
      -1,    -1,   210,   441,    -1,    -1,    -1,    -1,    -1,    -1,
     556,    -1,    -1,   559,   560,    -1,   454,    -1,    -1,    -1,
      -1,   459,    -1,    -1,    -1,   571,    -1,   235,    -1,    -1,
      -1,    -1,   230,   241,   472,   243,    -1,   245,    -1,    -1,
      -1,    -1,   250,    -1,    -1,    -1,    -1,    -1,    -1,   257,
     258,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   257,
     258,    -1,    -1,    -1,    -1,   503,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   656,   657,   363,    -1,    -1,    -1,    -1,
      -1,    -1,   370,    -1,    -1,    -1,    -1,   375,    -1,   377,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   755,    -1,
      -1,   695,    -1,   687,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   556,    -1,
     399,   559,   560,    -1,    -1,    -1,   405,    -1,   407,    -1,
     409,   410,   411,   571,    -1,   414,    -1,   416,    -1,    -1,
      -1,   687,    -1,    -1,    -1,   433,    -1,    -1,    -1,    -1,
      -1,   734,   735,   441,   737,   738,    -1,    -1,    -1,    -1,
      -1,   755,   370,    -1,    -1,   373,   454,   375,    -1,   377,
     754,   459,    -1,    -1,    -1,   454,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   472,   383,    -1,   385,    -1,    -1,
     773,    -1,   775,   472,    -1,    -1,    -1,    -1,    -1,   782,
     783,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   754,    -1,
      -1,    -1,   420,    -1,    -1,   503,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   809,    -1,   811,   427,
     813,    -1,   815,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   439,    -1,    -1,    -1,    -1,   454,    -1,    -1,   687,
      -1,   459,    -1,   836,    -1,   838,   454,    -1,     1,    -1,
       3,     4,     5,     6,   472,     8,     9,    -1,   556,    -1,
      -1,   559,   560,    -1,   472,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   571,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,   571,    -1,    -1,   503,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   586,    -1,   588,
     589,   590,    -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   540,    -1,    -1,    -1,    -1,    -1,   556,    -1,
      -1,   559,   560,    -1,    -1,    -1,    -1,   636,    -1,   102,
     103,    -1,    -1,   571,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,   571,    -1,   118,    -1,   120,   576,    -1,
     123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   687,
     143,   144,    -1,    -1,    -1,    -1,    -1,   605,    -1,    -1,
     608,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   617,
     618,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   626,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   636,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   647,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,   687,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   715,    -1,    -1,
      -1,   719,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,   754,     8,     9,    -1,
      -1,    -1,    -1,    -1,   752,    -1,   754,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   763,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    77,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,   123,    -1,   125,   126,    -1,    -1,    -1,    -1,
     131,   132,   133,   134,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,   143,   144,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,   120,    -1,    -1,   123,    -1,   125,   126,
      -1,    -1,    -1,    -1,   131,   132,   133,   134,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,   143,   144,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
     143,   144,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
      -1,   120,    -1,    -1,   123,    -1,   125,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   142,   143,   144,     1,    -1,     3,     4,
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
      -1,    -1,   117,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,   143,   144,
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
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,   123,    -1,   125,   126,    -1,    -1,    -1,    -1,
     131,   132,   133,   134,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,   143,   144,     1,    -1,     3,     4,     5,     6,
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
     117,   118,    -1,   120,    -1,    -1,   123,    -1,   125,   126,
      -1,    -1,    -1,    -1,   131,   132,   133,   134,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,   143,   144,     1,    -1,
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
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
     143,   144,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
      -1,   120,    -1,    -1,   123,    -1,   125,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,     1,    -1,     3,     4,
       5,    -1,    -1,   142,   143,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,   144,
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
      -1,   120,    -1,    -1,   123,    -1,   125,   126,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
      -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,   120,    -1,    -1,   123,    -1,   125,   126,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,    -1,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,   123,    -1,   125,   126,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,    -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,   144,
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
      -1,   120,    -1,    -1,   123,    -1,   125,   126,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
      -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,    -1,   120,    -1,    -1,   123,    -1,   125,   126,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,    -1,   144,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,
      -1,    -1,   123,    -1,   125,   126,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   142,    -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,   144,
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
      -1,   120,    -1,    -1,   123,    -1,   125,   126,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,   142,    -1,   144,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,
     143,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    28,    71,    72,    73,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,
     120,    -1,    -1,   123,    -1,   125,   126,    -1,    -1,    -1,
      -1,   131,   132,   133,   134,    -1,    -1,   102,   103,    -1,
      -1,    -1,   142,   143,   109,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,   118,    -1,   120,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,   102,
     103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,
       6,    -1,     8,     9,    -1,   118,    -1,   120,    -1,    -1,
     123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,    -1,   120,    -1,    -1,   123,    -1,   125,
     126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,   143,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    28,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
     142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,
      -1,    -1,     1,   109,     3,     4,     5,     6,    -1,     8,
       9,    -1,   118,    -1,   120,    -1,    -1,   123,   124,   125,
     126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,    28,
      -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    71,    72,    73,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,    -1,
     123,   124,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,    -1,   102,   103,    -1,    -1,    -1,    -1,   142,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
       3,   120,    -1,    -1,   123,    -1,   125,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   142,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,     3,   120,    -1,    -1,
     123,    -1,    -1,    -1,    -1,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     143,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,     3,    -1,   120,    -1,    -1,   123,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,    -1,   142,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,     3,    -1,   120,    -1,
      -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     142,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,     1,   123,     3,     4,     5,
       6,   128,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,    -1,   120,    -1,    -1,   123,    -1,   125,
     126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,   113,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    28,    -1,    -1,
     118,    -1,   120,    -1,    -1,   123,   124,   125,   126,    -1,
      -1,    -1,    -1,   131,   132,   133,   134,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,    -1,    -1,    -1,    -1,    -1,    28,   118,    -1,   120,
      -1,    -1,   123,   124,   125,   126,    71,    72,    73,    -1,
     131,   132,   133,   134,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,    -1,    -1,   129,    -1,   131,   132,   133,   134,
     102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,    -1,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,    -1,    -1,   129,    -1,   131,
     132,   133,   134,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,    71,
      72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,    -1,    -1,   129,    -1,   131,   132,   133,   134,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,    -1,   118,    -1,   120,    -1,
      -1,   123,   124,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,    71,
      72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,    -1,    -1,   123,   124,
     125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    71,
      72,    73,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,    -1,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,    28,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,
      72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,    -1,   120,    -1,    -1,   123,    -1,
     125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,    -1,   120,    -1,
      -1,   123,    -1,   125,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,    -1,   123,    -1,
      -1,    -1,    -1,   128,    -1,    -1,   131,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,    -1,   123,   124,    -1,    -1,    -1,   128,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,    -1,   123,   124,    -1,    -1,    -1,   128,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,   123,    -1,    -1,    -1,    -1,   128,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,     3,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,   123,    -1,    -1,    -1,    -1,
     128,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,     3,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,    -1,   123,    -1,    -1,    -1,
      -1,   128,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,     3,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,   123,    -1,    -1,
      -1,    -1,   128,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,    -1,   123,    28,
      -1,    -1,    -1,   128,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,    -1,    -1,
      -1,   120,    -1,    -1,   123,    -1,    -1,    -1,    -1,   128,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,   123,   124,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
      -1,    -1,    -1,    -1,   124,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,
      -1,    -1,   124,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,    -1,    -1,
     124,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,   123,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
      -1,    -1,    -1,   123,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   112,   113,   117,
     146,   147,   148,   149,   150,   155,   185,   186,   191,   192,
     193,   197,   198,   199,   200,   202,   203,   209,   217,   218,
     236,   267,   143,   150,   155,   123,   123,   121,     1,   120,
     121,   155,   120,   123,   128,   131,   146,   155,   191,   192,
     199,   200,   202,   218,   221,   223,   225,   226,   228,   229,
     230,   233,   123,   143,   149,   150,   155,   192,   140,     0,
     155,   219,   220,   143,   143,     1,     4,     5,     6,     8,
       9,    71,    72,    73,   102,   103,   109,   118,   120,   123,
     125,   126,   131,   132,   133,   134,   148,   155,   156,   157,
     158,   161,   162,   163,   164,   165,   166,   167,   168,   169,
     170,   171,   172,   173,   174,   175,   176,   177,   254,   257,
     148,   155,   148,   155,   162,   167,   185,   204,   205,   206,
     207,   208,   199,   232,   233,   124,   155,   223,   225,   234,
     235,   236,   129,   148,   176,   180,   123,   155,   192,   225,
     233,   221,   226,   229,   233,   123,   128,   192,   123,   128,
     124,   155,   234,   237,   192,   221,   230,   123,    68,    78,
     123,   125,   142,   144,   151,   152,   153,   154,   155,   158,
     185,   192,   210,   211,   212,   213,   214,   226,   227,   229,
     233,   256,   257,   259,   143,   143,   143,   150,   155,   180,
     141,   130,   144,   219,   219,   123,   162,   123,   162,   162,
     155,   185,   180,   185,   180,   123,   162,   124,   177,   179,
     182,   199,   200,   202,   218,   238,   254,   143,   143,     7,
       8,     9,   123,   127,   128,   155,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,   141,   178,   164,   120,
     135,   136,   132,   133,    10,    11,   167,    12,    13,   121,
     122,    14,    15,   131,   137,   138,    16,    17,   139,   124,
     124,   124,   141,   123,   192,   223,   233,   141,    11,   122,
     130,   199,   233,   124,   124,   124,   130,   129,   129,   233,
     221,   230,   124,   234,   129,   148,   180,   129,   148,   180,
     124,   124,   130,     3,    28,    44,    74,    75,   124,   194,
     195,   196,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    46,    47,    50,    66,    85,    87,   100,   112,
     113,   150,   155,   187,   191,   199,   201,   203,   209,   217,
     185,   227,   120,   123,   155,   185,   143,   248,   249,   249,
     249,   142,   249,   141,   123,   140,   142,   155,   192,   215,
     216,   226,   227,   231,   233,   229,   233,   144,   214,   130,
     142,   192,   229,   142,   142,   210,   144,   210,   144,   210,
     143,   143,   180,   220,   142,   144,   142,   144,   146,   155,
     183,   199,   200,   202,   218,   239,   123,   128,   192,   222,
     224,   233,   155,   188,   191,   199,   201,   202,   218,   128,
     224,   188,   239,   124,   130,   155,   199,   200,   202,   218,
     223,   124,   127,   142,   143,   144,   158,   159,   176,   184,
     191,   199,   200,   202,   218,   241,   258,   260,   261,   262,
     263,   264,   265,   266,   144,   266,   155,   124,   159,   160,
     177,   155,   179,   159,   177,   164,   164,   164,   165,   165,
     166,   166,   167,   167,   167,   169,   169,   170,   171,   172,
     173,   174,   179,   185,   205,   206,   233,   205,   206,   207,
      51,   236,   124,   129,   129,   129,   129,   155,   124,   123,
     124,   130,   195,   150,   155,   123,   123,   121,   143,   155,
     191,   199,   201,   223,   155,   192,   227,   192,   123,   144,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    77,   142,   155,   179,   181,   184,   243,   244,   245,
     246,   247,   249,   250,   251,   252,   253,   255,   241,   124,
     180,   143,   226,   233,   130,   142,   140,   197,   192,   226,
     229,   211,   229,   144,   144,   144,   210,   144,   210,   210,
     210,   146,   199,   200,   202,   218,   223,   124,   124,   224,
     234,   180,   222,   233,   123,   128,   222,   121,   128,   155,
     191,   199,   201,   202,   218,   224,   180,   128,   128,   224,
     124,   177,   164,   254,   144,   266,   141,   155,   191,   199,
     200,   202,   218,   227,   231,   249,   130,   142,   142,   261,
     263,   264,   144,   144,   124,   130,   129,   140,   223,   179,
     124,   195,   177,   148,   155,   208,    69,    70,   144,   121,
     143,   143,   155,   150,   155,   124,   180,   140,   123,   123,
     123,   243,   123,   155,   142,   142,   142,   179,   155,   140,
     142,   142,   155,   189,   190,   225,   181,   246,   181,   243,
     144,   142,   144,   266,   226,   192,   216,   226,   233,   180,
     226,   144,   144,   144,   144,   124,   124,   129,   222,   124,
     234,   180,   208,   180,   121,   128,   129,   180,   180,   128,
     144,   241,   262,   159,   177,   176,   124,   124,   124,   124,
     122,   249,   249,   208,    69,    70,   144,    69,    70,   144,
     143,   140,   243,   179,   179,   124,   179,    56,   124,   250,
     142,   142,   141,   243,   143,   130,   142,   141,   144,   226,
     233,   192,   226,   140,   124,   129,   122,   129,   208,   180,
     129,   129,   180,    70,   144,    69,   144,   122,   249,   249,
     249,   249,    69,    70,   144,   243,   124,   124,   243,   124,
     123,   243,   124,   250,   180,   144,   266,   190,   143,   177,
     240,   226,   226,   180,   122,   129,   129,   249,   249,    70,
     144,    69,   144,    70,   144,    69,   144,   249,   249,   243,
     243,   243,   179,   243,   124,   179,   142,   144,   240,   242,
     144,   144,   249,   249,   249,   249,    70,   144,    69,   144,
      64,   124,   243,   124,   130,   144,   144,   144,   144,   144,
     249,   249,   243,   142,   243,   144,   240,   144,   144
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
      case 146: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3832 "type.ec"
	break;
      case 148: /* "type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3841 "type.ec"
	break;
      case 149: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3850 "type.ec"
	break;
      case 150: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3859 "type.ec"
	break;
      case 151: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3868 "type.ec"
	break;
      case 152: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3877 "type.ec"
	break;
      case 153: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3886 "type.ec"
	break;
      case 154: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3895 "type.ec"
	break;
      case 155: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3904 "type.ec"
	break;
      case 156: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3913 "type.ec"
	break;
      case 158: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3922 "type.ec"
	break;
      case 160: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3931 "type.ec"
	break;
      case 162: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3940 "type.ec"
	break;
      case 164: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3949 "type.ec"
	break;
      case 165: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3958 "type.ec"
	break;
      case 166: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3967 "type.ec"
	break;
      case 167: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3976 "type.ec"
	break;
      case 169: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3985 "type.ec"
	break;
      case 170: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3994 "type.ec"
	break;
      case 171: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4003 "type.ec"
	break;
      case 172: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4012 "type.ec"
	break;
      case 173: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4021 "type.ec"
	break;
      case 174: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4030 "type.ec"
	break;
      case 175: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4039 "type.ec"
	break;
      case 176: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4048 "type.ec"
	break;
      case 177: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4057 "type.ec"
	break;
      case 179: /* "expression" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 4066 "type.ec"
	break;
      case 180: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 170 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4075 "type.ec"
	break;
      case 181: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4084 "type.ec"
	break;
      case 182: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4093 "type.ec"
	break;
      case 183: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4102 "type.ec"
	break;
      case 184: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4111 "type.ec"
	break;
      case 185: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4120 "type.ec"
	break;
      case 189: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4129 "type.ec"
	break;
      case 190: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4138 "type.ec"
	break;
      case 191: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4147 "type.ec"
	break;
      case 192: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 222 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4156 "type.ec"
	break;
      case 194: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4165 "type.ec"
	break;
      case 195: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 223 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4174 "type.ec"
	break;
      case 196: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 224 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4183 "type.ec"
	break;
      case 197: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 221 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4192 "type.ec"
	break;
      case 198: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4201 "type.ec"
	break;
      case 199: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4210 "type.ec"
	break;
      case 200: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4219 "type.ec"
	break;
      case 201: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4228 "type.ec"
	break;
      case 202: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4237 "type.ec"
	break;
      case 203: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4246 "type.ec"
	break;
      case 204: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 220 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4255 "type.ec"
	break;
      case 205: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4264 "type.ec"
	break;
      case 206: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4273 "type.ec"
	break;
      case 207: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4282 "type.ec"
	break;
      case 210: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4291 "type.ec"
	break;
      case 211: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4300 "type.ec"
	break;
      case 212: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4309 "type.ec"
	break;
      case 213: /* "property" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4318 "type.ec"
	break;
      case 214: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4327 "type.ec"
	break;
      case 215: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4336 "type.ec"
	break;
      case 216: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4345 "type.ec"
	break;
      case 217: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4354 "type.ec"
	break;
      case 218: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 176 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4363 "type.ec"
	break;
      case 219: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4372 "type.ec"
	break;
      case 220: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 179 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4381 "type.ec"
	break;
      case 221: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4390 "type.ec"
	break;
      case 222: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4399 "type.ec"
	break;
      case 223: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4408 "type.ec"
	break;
      case 224: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4417 "type.ec"
	break;
      case 225: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4426 "type.ec"
	break;
      case 226: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4435 "type.ec"
	break;
      case 227: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4444 "type.ec"
	break;
      case 228: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4453 "type.ec"
	break;
      case 229: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4462 "type.ec"
	break;
      case 230: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4471 "type.ec"
	break;
      case 231: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4480 "type.ec"
	break;
      case 232: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4489 "type.ec"
	break;
      case 233: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 169 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4498 "type.ec"
	break;
      case 234: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4507 "type.ec"
	break;
      case 235: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4516 "type.ec"
	break;
      case 236: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4525 "type.ec"
	break;
      case 237: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4534 "type.ec"
	break;
      case 238: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4543 "type.ec"
	break;
      case 239: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 187 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4552 "type.ec"
	break;
      case 240: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4561 "type.ec"
	break;
      case 241: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4570 "type.ec"
	break;
      case 242: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4579 "type.ec"
	break;
      case 243: /* "statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4588 "type.ec"
	break;
      case 244: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4597 "type.ec"
	break;
      case 245: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4606 "type.ec"
	break;
      case 246: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4615 "type.ec"
	break;
      case 247: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4624 "type.ec"
	break;
      case 248: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4633 "type.ec"
	break;
      case 249: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4642 "type.ec"
	break;
      case 250: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4651 "type.ec"
	break;
      case 251: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4660 "type.ec"
	break;
      case 252: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4669 "type.ec"
	break;
      case 253: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4678 "type.ec"
	break;
      case 254: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4687 "type.ec"
	break;
      case 255: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4696 "type.ec"
	break;
      case 257: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4705 "type.ec"
	break;
      case 259: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4714 "type.ec"
	break;
      case 260: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4723 "type.ec"
	break;
      case 261: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4732 "type.ec"
	break;
      case 262: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4741 "type.ec"
	break;
      case 263: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4750 "type.ec"
	break;
      case 264: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4759 "type.ec"
	break;
      case 265: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4768 "type.ec"
	break;
      case 266: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4777 "type.ec"
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
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 820 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 847 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 854 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 855 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 872 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 905 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
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

  case 289:

/* Line 1464 of yacc.c  */
#line 940 "type.y"
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

  case 290:

/* Line 1464 of yacc.c  */
#line 954 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 955 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 959 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 960 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 964 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 965 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 969 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 973 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 974 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 979 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 981 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 990 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 998 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1020 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1031 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1038 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1055 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1056 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1062 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1064 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1065 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1089 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1091 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1118 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1125 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1126 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1127 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1131 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1188 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1193 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1197 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1199 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1201 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1207 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1210 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1214 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1224 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1226 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1228 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1237 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1245 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1249 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1250 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1254 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1256 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1257 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1262 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1266 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1267 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1271 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1272 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1274 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1287 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1311 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1312 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1316 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1317 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1321 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1322 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1327 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1331 "type.y"
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

  case 425:

/* Line 1464 of yacc.c  */
#line 1347 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1349 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1371 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1373 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1387 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1389 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1391 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1395 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1396 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1400 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1401 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1404 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1409 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1410 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1414 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1419 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1427 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1431 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1432 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1436 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1437 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1438 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1442 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1443 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1444 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1447 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1448 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1453 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1456 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1466 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1468 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1473 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1475 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1500 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1502 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1506 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1511 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1513 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1517 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1519 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1521 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1531 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1533 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1538 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1542 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1543 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1548 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1550 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1555 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1559 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1560 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1562 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1563 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1564 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1569 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1570 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1574 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1575 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8452 "type.ec"
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
#line 1578 "type.y"


