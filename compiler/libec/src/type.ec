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
#line 109 "type.ec"

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
     WIDE_STRING_LITERAL = 373
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 39 "type.y"

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
#line 301 "type.ec"
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
#line 326 "type.ec"

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
#define YYLAST   9157

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  144
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  500
/* YYNRULES -- Number of states.  */
#define YYNSTATES  859

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   373

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   133,     2,     2,   125,   135,   130,     2,
     122,   123,   119,   131,   129,   132,   126,   134,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   139,   141,
     120,   140,   121,   138,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   127,     2,   128,   136,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   142,   137,   143,   124,     2,     2,     2,
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
     115,   116,   117,   118
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
     266,     0,    -1,   154,   119,    -1,   154,   120,    -1,   154,
       1,    -1,   149,    -1,   154,   154,    -1,    28,    -1,   148,
      -1,   148,   120,   207,   121,    -1,   148,   120,   207,    11,
      -1,   184,   226,    -1,   226,    -1,   184,   122,   123,    -1,
     124,   184,   122,   123,    -1,    78,   184,   226,    -1,    78,
     226,    -1,     3,    -1,   156,    -1,   122,   178,   123,    -1,
     154,    -1,   256,    -1,     4,    -1,   118,    -1,   253,    -1,
     125,   253,    -1,   125,   253,   126,   253,    -1,   122,   123,
      -1,    71,   184,   223,   127,   179,   128,    -1,    71,   184,
     127,   179,   128,    -1,   102,   184,   223,   127,   179,   128,
      -1,   102,   184,   127,   179,   128,    -1,    72,   179,   187,
     223,   127,   179,   128,    -1,    72,   179,   187,   127,   179,
     128,    -1,   103,   179,   187,   223,   127,   179,   128,    -1,
     103,   179,   187,   127,   179,   128,    -1,     1,    -1,   155,
      -1,   157,   127,   178,   128,    -1,   157,   122,   123,    -1,
     157,   122,   159,   123,    -1,   157,   126,   154,    -1,   157,
     154,    -1,   157,     7,   154,    -1,   157,     8,    -1,   157,
       9,    -1,   257,    -1,   176,    -1,   158,    -1,   159,   129,
     176,    -1,   159,   129,   158,    -1,     8,   161,    -1,     9,
     161,    -1,   162,   163,    -1,     6,   161,    -1,     6,   122,
     238,   123,    -1,   109,   161,    -1,   109,   122,   238,   123,
      -1,   160,    -1,   157,    -1,   130,    -1,   119,    -1,   131,
      -1,   132,    -1,   124,    -1,   133,    -1,    73,    -1,   161,
      -1,   122,   237,   123,   163,    -1,   163,    -1,   164,   119,
     163,    -1,   164,   134,   163,    -1,   164,   135,   163,    -1,
     164,    -1,   165,   131,   164,    -1,   165,   132,   164,    -1,
     165,    -1,   166,    10,   165,    -1,   166,    11,   165,    -1,
     168,   120,    -1,   166,    -1,   167,   166,    -1,   168,   121,
     166,    -1,   168,    12,   166,    -1,   168,    13,   166,    -1,
     168,    -1,   169,    14,   168,    -1,   169,    15,   168,    -1,
     169,    -1,   170,   130,   169,    -1,   170,    -1,   171,   136,
     170,    -1,   171,    -1,   172,   137,   171,    -1,   172,    -1,
     173,    16,   172,    -1,   173,    -1,   174,    17,   173,    -1,
     174,    -1,   174,   138,   178,   139,   175,    -1,   175,    -1,
     161,   177,   176,    -1,   161,   177,   158,    -1,   140,    -1,
      18,    -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,
      23,    -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,
     176,    -1,   178,   129,   176,    -1,   175,    -1,   183,   141,
      -1,   183,   188,   141,    -1,   254,   141,    -1,    77,   154,
     140,   179,   141,    -1,   198,    -1,   181,   198,    -1,   199,
      -1,   181,   199,    -1,   217,    -1,   181,   217,    -1,   201,
      -1,   181,   201,    -1,   198,    -1,   182,   198,    -1,   199,
      -1,   182,   199,    -1,   145,    -1,   182,   145,    -1,   217,
      -1,   182,   217,    -1,   201,    -1,   182,   201,    -1,   190,
      -1,   183,   190,    -1,   198,    -1,   183,   198,    -1,   199,
      -1,   183,   199,    -1,   217,    -1,   183,   217,    -1,   201,
      -1,   183,   201,    -1,   190,    -1,   184,   190,    -1,   198,
      -1,   184,   198,    -1,   199,    -1,   184,   199,    -1,   145,
      -1,   184,   145,    -1,   201,    -1,   184,   201,    -1,   217,
      -1,   184,   217,    -1,   184,    -1,   146,    -1,   190,    -1,
     186,   190,    -1,   198,    -1,   186,   198,    -1,   200,    -1,
     186,   200,    -1,   154,    -1,   186,   154,    -1,   154,   120,
     207,   121,    -1,   186,   154,   120,   207,   121,    -1,   190,
      -1,   187,   190,    -1,   198,    -1,   187,   198,    -1,   200,
      -1,   187,   200,    -1,   201,    -1,   187,   201,    -1,   217,
      -1,   187,   217,    -1,   154,    -1,   187,   154,    -1,   154,
     120,   207,   121,    -1,   187,   154,   120,   207,   121,    -1,
     189,    -1,   188,   129,   189,    -1,   224,    -1,   224,   140,
     239,    -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,
      33,    -1,   117,    -1,    74,    -1,    75,    -1,   196,    -1,
      79,    -1,   110,    -1,   111,    -1,     3,    -1,    28,    -1,
      75,    -1,    74,    -1,    44,    -1,   193,    -1,   193,   122,
     178,   123,    -1,   194,    -1,   195,   194,    -1,   195,   129,
     194,    -1,   192,   122,   122,   195,   123,   123,    -1,   192,
     122,   122,   123,   123,    -1,   191,    -1,    44,    -1,    45,
      -1,   197,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   113,
      -1,   112,    -1,   202,    -1,   216,    -1,   147,    -1,    87,
     122,   176,   123,    -1,   100,   122,   147,   123,    -1,   100,
     122,   154,   123,    -1,    66,    -1,    82,    -1,    83,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   113,    -1,   112,    -1,
     202,    -1,   216,    -1,   149,    -1,    87,   122,   176,   123,
      -1,   100,   122,   147,   123,    -1,   100,   122,   154,   123,
      -1,    66,    -1,   208,   154,   142,   209,   143,    -1,   208,
     142,   209,   143,    -1,   208,   154,   142,   143,    -1,   208,
     142,   143,    -1,   208,   148,   142,   209,   143,    -1,   208,
     191,   154,   142,   209,   143,    -1,   208,   191,   142,   209,
     143,    -1,   208,   191,   154,   142,   143,    -1,   208,   191,
     142,   143,    -1,   208,   191,   149,   142,   209,   143,    -1,
     208,   154,    -1,   208,   149,    -1,   208,   191,   154,    -1,
     208,   191,   149,    -1,   184,    -1,   184,   222,    -1,   184,
      -1,   184,   222,    -1,   166,    -1,   205,    -1,   204,    -1,
     154,   140,   205,    -1,   154,   140,   204,    -1,   203,   140,
     205,    -1,   203,   140,   204,    -1,   206,    -1,   207,   129,
     206,    -1,    48,    -1,    49,    -1,   213,    -1,   209,   213,
      -1,   157,   140,   240,    -1,   210,    -1,   211,   129,   210,
      -1,    68,   186,   154,   142,    69,   248,    70,   248,   143,
      -1,    68,   186,   154,   142,    70,   248,    69,   248,   143,
      -1,    68,   186,   154,   142,    69,   248,   143,    -1,    68,
     186,   154,   142,    70,   248,   143,    -1,    68,   186,   154,
     142,   143,    -1,    68,   186,   222,   154,   142,    69,   248,
      70,   248,   143,    -1,    68,   186,   222,   154,   142,    70,
     248,    69,   248,   143,    -1,    68,   186,   222,   154,   142,
      69,   248,   143,    -1,    68,   186,   222,   154,   142,    70,
     248,   143,    -1,    68,   186,   222,   154,   142,   143,    -1,
      68,   186,   142,    69,   248,    70,   248,   143,    -1,    68,
     186,   142,    70,   248,    69,   248,   143,    -1,    68,   186,
     142,    69,   248,   143,    -1,    68,   186,   142,    70,   248,
     143,    -1,    68,   186,   142,   143,    -1,    68,   186,   222,
     142,    69,   248,    70,   248,   143,    -1,    68,   186,   222,
     142,    70,   248,    69,   248,   143,    -1,    68,   186,   222,
     142,    69,   248,   143,    -1,    68,   186,   222,   142,    70,
     248,   143,    -1,    68,   186,   222,   142,   143,    -1,   184,
     214,   141,    -1,   184,   141,    -1,   256,   141,    -1,   255,
     141,    -1,   258,    -1,   211,   141,    -1,   212,    -1,   141,
      -1,   215,    -1,   214,   129,   215,    -1,   230,    -1,   230,
     196,    -1,   139,   179,    -1,   230,   139,   179,    -1,   230,
     139,   179,   139,   179,    -1,    50,   154,    -1,    50,   149,
      -1,    50,   142,   218,   143,    -1,    50,   154,   142,   218,
     143,    -1,    50,   154,   142,   218,   141,   209,   143,    -1,
      50,   149,   142,   218,   141,   209,   143,    -1,    50,   149,
     142,   218,   143,    -1,   219,    -1,   218,   129,   219,    -1,
     154,    -1,   154,   140,   179,    -1,   122,   222,   123,    -1,
     127,   128,    -1,   127,   179,   128,    -1,   127,   147,   128,
      -1,   220,   127,   128,    -1,   220,   127,   179,   128,    -1,
     220,   127,   147,   128,    -1,   122,   123,    -1,   122,   233,
     123,    -1,   220,   122,   123,    -1,   220,   122,   233,   123,
      -1,   122,   223,   123,    -1,   122,   123,    -1,   122,   233,
     123,    -1,   221,   122,   123,    -1,   221,   122,   233,   123,
      -1,   232,    -1,   220,    -1,   232,   220,    -1,   191,   232,
      -1,   191,   220,    -1,   191,   232,   220,    -1,   232,    -1,
     221,    -1,   232,   221,    -1,   191,   232,    -1,   191,   221,
      -1,   191,   232,   221,    -1,   229,    -1,   232,   229,    -1,
     191,   232,   229,    -1,   224,   191,    -1,   154,    -1,   122,
     224,   123,    -1,   225,   127,   179,   128,    -1,   225,   127,
     128,    -1,   225,   127,   147,   128,    -1,   228,    -1,   232,
     228,    -1,   191,   228,    -1,   191,   232,   228,    -1,   232,
     191,   228,    -1,   225,   122,    -1,   227,   233,   123,    -1,
     227,   236,   123,    -1,   227,   123,    -1,   228,    -1,   225,
      -1,   191,   228,    -1,   191,   225,    -1,   225,    -1,   232,
     225,    -1,   191,   225,    -1,   191,   232,   225,    -1,   232,
     191,   225,    -1,   198,    -1,   231,   198,    -1,   119,    -1,
     119,   231,    -1,   119,   232,    -1,   119,   231,   232,    -1,
     234,    -1,   234,   129,    51,    -1,   235,    -1,   234,   129,
     235,    -1,   184,   224,    -1,   184,   222,    -1,   184,   130,
      -1,   184,   130,   224,    -1,   185,    -1,    65,    -1,   154,
      -1,   236,   129,   154,    -1,   181,    -1,   181,   222,    -1,
     182,    -1,   182,   222,    -1,   176,    -1,   142,   241,   143,
      -1,   142,   241,   129,   143,    -1,   175,    -1,   158,    -1,
     239,    -1,   241,   129,   239,    -1,   243,    -1,   248,    -1,
     249,    -1,   250,    -1,   251,    -1,   252,    -1,   154,   139,
     242,    -1,    52,   179,   139,   242,    -1,    53,   139,   242,
      -1,   180,    -1,   244,   180,    -1,   242,    -1,   245,   242,
      -1,   245,   180,    -1,   245,    -1,   244,    -1,   244,   245,
      -1,   142,    -1,   142,   143,    -1,   247,   246,   143,    -1,
     141,    -1,   178,   141,    -1,    54,   122,   178,   123,   242,
      -1,    54,   122,   178,   123,   242,    64,   242,    -1,    55,
     122,   178,   123,   242,    -1,    56,   122,   178,   123,   242,
      -1,    57,   242,    56,   122,   178,   123,   141,    -1,    58,
     122,   249,   249,   123,   242,    -1,    58,   122,   249,   249,
     178,   123,   242,    -1,    56,   122,   123,   242,    -1,    58,
     122,   249,   123,   242,    -1,    58,   122,   123,   242,    -1,
      59,   154,   141,    -1,    60,   141,    -1,    61,   141,    -1,
      62,   141,    -1,    62,   178,   141,    -1,     5,    -1,   183,
     154,   142,   265,   143,    -1,   183,   154,   142,   143,    -1,
     184,   154,   142,   265,   143,    -1,   184,   154,   142,   143,
      -1,   147,   142,   265,   143,    -1,   147,   142,   143,    -1,
     154,   142,   265,   143,    -1,   154,   142,   143,    -1,   142,
     265,   143,    -1,   142,   143,    -1,   150,   248,    -1,   153,
     248,    -1,   153,   141,    -1,   151,   248,    -1,   152,   248,
      -1,   183,   226,    -1,   183,   230,    -1,   259,   248,    -1,
     157,   140,   240,    -1,   240,    -1,   261,    -1,   262,   129,
     261,    -1,   262,   141,    -1,   263,    -1,   260,    -1,   264,
     263,    -1,   264,   260,    -1,   141,    -1,   264,   141,    -1,
     264,    -1,   262,    -1,   264,   262,    -1,   235,    -1,   235,
     139,   179,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   229,   229,   247,   271,   311,   312,   339,   343,   344,
     345,   362,   364,   369,   374,   379,   381,   386,   391,   392,
     397,   399,   401,   403,   404,   406,   407,   408,   411,   412,
     413,   414,   415,   416,   417,   418,   419,   423,   424,   425,
     426,   427,   428,   441,   442,   443,   447,   476,   477,   478,
     479,   483,   484,   485,   487,   488,   490,   491,   495,   496,
     505,   506,   507,   508,   509,   510,   511,   515,   516,   520,
     521,   522,   523,   527,   528,   529,   533,   534,   535,   539,
     547,   548,   549,   550,   551,   555,   556,   557,   561,   562,
     566,   567,   571,   572,   576,   577,   581,   582,   586,   587,
     591,   592,   593,   597,   598,   599,   600,   601,   602,   603,
     604,   605,   606,   607,   611,   612,   616,   620,   621,   622,
     623,   627,   628,   629,   630,   631,   632,   633,   634,   638,
     639,   640,   641,   642,   643,   644,   645,   646,   647,   651,
     652,   653,   654,   655,   656,   657,   658,   659,   660,   664,
     665,   666,   667,   668,   669,   670,   671,   672,   673,   674,
     675,   679,   680,   684,   685,   686,   687,   688,   689,   690,
     691,   692,   700,   709,   710,   711,   712,   713,   714,   715,
     716,   717,   718,   719,   720,   721,   729,   738,   739,   743,
     744,   748,   749,   750,   751,   752,   753,   757,   758,   759,
     763,   764,   765,   770,   771,   772,   773,   774,   778,   779,
     783,   784,   785,   789,   790,   794,   798,   799,   800,   805,
     806,   807,   808,   809,   810,   811,   812,   813,   814,   815,
     816,   817,   818,   819,   820,   821,   822,   823,   824,   825,
     826,   827,   828,   832,   833,   834,   835,   836,   837,   838,
     839,   840,   841,   842,   843,   844,   845,   846,   847,   848,
     849,   850,   851,   852,   853,   858,   859,   860,   861,   862,
     865,   866,   867,   868,   869,   874,   875,   878,   880,   885,
     886,   891,   892,   903,   907,   909,   910,   912,   913,   937,
     952,   953,   957,   958,   962,   963,   967,   971,   972,   976,
     978,   980,   982,   984,   987,   989,   991,   993,   995,   998,
    1000,  1002,  1004,  1006,  1009,  1011,  1013,  1015,  1017,  1022,
    1023,  1024,  1025,  1026,  1027,  1028,  1029,  1033,  1035,  1040,
    1042,  1044,  1046,  1048,  1053,  1054,  1058,  1060,  1061,  1062,
    1063,  1067,  1069,  1074,  1076,  1082,  1084,  1086,  1088,  1090,
    1092,  1094,  1096,  1098,  1100,  1102,  1107,  1109,  1111,  1113,
    1115,  1120,  1121,  1122,  1123,  1124,  1125,  1129,  1130,  1131,
    1132,  1133,  1134,  1180,  1181,  1183,  1185,  1190,  1192,  1194,
    1196,  1198,  1203,  1204,  1207,  1209,  1211,  1217,  1221,  1223,
    1225,  1230,  1231,  1232,  1234,  1239,  1240,  1241,  1242,  1243,
    1247,  1248,  1252,  1253,  1254,  1255,  1259,  1260,  1264,  1265,
    1269,  1270,  1271,  1272,  1273,  1284,  1309,  1310,  1314,  1315,
    1319,  1320,  1324,  1326,  1328,  1344,  1346,  1368,  1370,  1375,
    1376,  1377,  1378,  1379,  1380,  1384,  1386,  1388,  1393,  1394,
    1398,  1399,  1402,  1406,  1407,  1408,  1412,  1416,  1424,  1429,
    1430,  1434,  1435,  1436,  1440,  1441,  1442,  1443,  1445,  1446,
    1447,  1451,  1452,  1453,  1454,  1455,  1459,  1463,  1465,  1470,
    1472,  1497,  1499,  1501,  1503,  1508,  1510,  1514,  1516,  1518,
    1520,  1522,  1528,  1530,  1535,  1540,  1541,  1545,  1547,  1552,
    1557,  1558,  1559,  1560,  1561,  1562,  1566,  1567,  1568,  1572,
    1573
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
  "WIDE_STRING_LITERAL", "'*'", "'<'", "'>'", "'('", "')'", "'~'", "'$'",
  "'.'", "'['", "']'", "','", "'&'", "'+'", "'-'", "'!'", "'/'", "'%'",
  "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'", "'}'", "$accept",
  "guess_type", "real_guess_type", "type", "base_strict_type",
  "strict_type", "class_function_definition_start",
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
     365,   366,   367,   368,   369,   370,   371,   372,   373,    42,
      60,    62,    40,    41,   126,    36,    46,    91,    93,    44,
      38,    43,    45,    33,    47,    37,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   144,   145,   145,   146,   147,   147,   148,   149,   149,
     149,   150,   150,   151,   152,   153,   153,   154,   155,   155,
     156,   156,   156,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   158,   159,   159,   159,
     159,   160,   160,   160,   160,   160,   160,   160,   161,   161,
     162,   162,   162,   162,   162,   162,   162,   163,   163,   164,
     164,   164,   164,   165,   165,   165,   166,   166,   166,   167,
     168,   168,   168,   168,   168,   169,   169,   169,   170,   170,
     171,   171,   172,   172,   173,   173,   174,   174,   175,   175,
     176,   176,   176,   177,   177,   177,   177,   177,   177,   177,
     177,   177,   177,   177,   178,   178,   179,   180,   180,   180,
     180,   181,   181,   181,   181,   181,   181,   181,   181,   182,
     182,   182,   182,   182,   182,   182,   182,   182,   182,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   185,   185,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   188,   188,   189,
     189,   190,   190,   190,   190,   190,   190,   191,   191,   191,
     192,   192,   192,   193,   193,   193,   193,   193,   194,   194,
     195,   195,   195,   196,   196,   197,   198,   198,   198,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   202,   202,   202,   202,   203,
     203,   204,   204,   205,   206,   206,   206,   206,   206,   206,
     207,   207,   208,   208,   209,   209,   210,   211,   211,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   213,
     213,   213,   213,   213,   213,   213,   213,   214,   214,   215,
     215,   215,   215,   215,   216,   216,   217,   217,   217,   217,
     217,   218,   218,   219,   219,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   221,   221,   221,   221,
     221,   222,   222,   222,   222,   222,   222,   223,   223,   223,
     223,   223,   223,   224,   224,   224,   224,   225,   225,   225,
     225,   225,   226,   226,   226,   226,   226,   227,   228,   228,
     228,   229,   229,   229,   229,   230,   230,   230,   230,   230,
     231,   231,   232,   232,   232,   232,   233,   233,   234,   234,
     235,   235,   235,   235,   235,   235,   236,   236,   237,   237,
     238,   238,   239,   239,   239,   240,   240,   241,   241,   242,
     242,   242,   242,   242,   242,   243,   243,   243,   244,   244,
     245,   245,   245,   246,   246,   246,   247,   248,   248,   249,
     249,   250,   250,   250,   251,   251,   251,   251,   251,   251,
     251,   252,   252,   252,   252,   252,   253,   254,   254,   255,
     255,   256,   256,   256,   256,   257,   257,   258,   258,   258,
     258,   258,   259,   259,   260,   261,   261,   262,   262,   263,
     264,   264,   264,   264,   264,   264,   265,   265,   265,   266,
     266
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
#define YYPACT_NINF -760
static const yytype_int16 yypact[] =
{
    8770,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,  -760,    35,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,    -3,     6,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,  -100,  -760,   303,  7208,  -760,  -760,  -760,
      45,  -760,  -760,  -760,  -760,  -760,  -760,   563,  -760,  -760,
      77,   137,   138,   112,   136,  6963,    79,  6256,  -760,  -760,
    -760,  -760,  1002,  7311,   933,  1035,  -760,   102,  -760,   216,
    -760,  -760,  -760,  -760,   -21,  -760,   807,   178,  8202,  -760,
    -760,   748,   158,  3556,   -59,  -760,   159,    37,  6963,  -760,
     180,   117,  -760,   138,   138,  -760,  -760,  -760,  7019,  7045,
    7045,  8860,  6963,  -760,  8860,  6963,  7101,  -760,  -760,  6389,
    -760,   334,  -760,  -760,  -760,  -760,   247,    39,  -760,  -760,
     642,  -760,  1003,  6963,  -760,   160,   191,   512,  6963,   245,
     534,   261,   270,   271,   401,     2,  -760,   338,  -760,  -760,
     348,    27,   247,    15,  -760,   512,  6136,   345,  -760,  -760,
    -760,   251,  -760,  1002,  -760,  -760,   773,   365,   852,   367,
     363,  -760,  -760,   146,  -760,   371,  1035,  -760,    84,   807,
      38,   -21,   178,  -760,   748,  8298,  6664,  -760,  -760,  6697,
    -760,   483,   379,   253,    95,   -21,  -760,   454,  8950,  8490,
    6609,  8860,  -760,  -760,   378,   378,   378,   420,    19,   443,
    5906,    84,  3681,  -760,   -57,  -760,  -760,   178,  -760,  -760,
      38,   384,   391,  -760,  5514,  3806,  3931,   392,   397,  -760,
    6963,   138,  -760,   170,   204,  6389,  -760,  6804,  -760,  -760,
     102,  7511,  9040,  7611,  9040,  6389,  -760,  -760,  -760,   301,
    8006,  -760,  -760,  -760,  -760,   418,   417,  2708,  2851,   138,
    -760,  -760,  5233,   138,  6963,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,  -760,  -760,  -760,  -760,  5274,  -760,  6963,
    6963,  6963,  6963,  6963,  6963,  6963,   512,  6963,  6963,  -760,
    6963,  6963,  6963,  6963,  6963,  6963,  6963,  6963,  6963,  -760,
    -760,  -760,  6256,  7411,   320,   406,   346,  6256,  -760,  -760,
    6256,  -760,  -760,  -760,  -760,  -760,  8680,  -760,  -760,    38,
     -21,  -760,  -760,   427,  -760,   214,   424,  -760,   218,   429,
    -760,  -760,   138,  -760,  -760,  -760,  -760,  -760,   432,   445,
    -760,   325,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,
    -760,  -760,  -760,  -760,    79,  -760,  -760,   470,   473,  -760,
    -760,  -760,   456,  5791,  -760,  -760,  -760,  -760,   706,  -760,
    8490,  -760,  1002,  6522,   155,  8585,   455,  5056,  -760,  -760,
    -760,  -760,  -760,  5274,  1085,  6963,  -760,    51,    84,   140,
    -760,   178,  -760,   -30,    38,  -760,    95,  -760,  -760,  1389,
    -760,    95,  -760,  -760,  -760,  4056,  -760,  4181,  -760,  4306,
    5514,  4431,  -760,  -760,  5514,  -760,  5514,  -760,  -760,    19,
    8006,  -760,  -760,  -760,  -760,   477,  8106,  6963,   -48,   488,
     487,   494,   498,  7811,  -760,  -760,  -760,  -760,  -760,  6963,
     492,  7911,   497,  -760,  6963,   138,  -760,  -760,  -760,  -760,
    -760,  6963,   334,  -760,  2994,  -760,   508,  -760,  -760,  8490,
    -760,  -760,  -760,  -760,  -760,  -760,  -760,   378,  -760,  -760,
     230,  -760,  3137,   479,  -760,   480,  -760,  -760,  -760,   314,
    -760,  -760,   451,  -760,  -760,  -760,  -760,  -760,   160,   160,
     191,   191,   512,   512,   512,   245,   245,   534,   261,   270,
     271,   401,   286,  7711,  -760,  -760,   346,  -760,  -760,  -760,
    -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  6963,
     501,   510,  -760,  -760,  -760,  6963,    79,  6256,   -33,   -50,
    -760,  -760,  -760,    40,  -760,    79,  -760,    84,   503,  -760,
    6963,   490,   514,   519,   521,  5198,   522,   138,   506,   515,
    5677,   138,  -760,    26,   249,  -760,  6021,  -760,  -760,  2279,
    2422,   520,  -760,  -760,  -760,  -760,  -760,   516,  -760,  -760,
    -760,  3280,   178,    95,   614,  -760,  6963,  -760,    95,   178,
    -760,  -760,  -760,  -760,  -760,  -760,  4556,  -760,  4681,  4806,
    4931,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,   523,
     530,   538,   488,   494,  8394,  6963,   488,  6256,  6963,   548,
    -760,  -760,  -760,  -760,  -760,   542,   543,  6963,  6963,   545,
    -760,  -760,  -760,  -760,  -760,   527,  5274,   138,  -760,  -760,
    -760,  -760,  -760,  -760,  -760,  -760,  5274,  -760,  -760,  -760,
     230,  -760,  -760,  -760,  -760,  5274,  -760,  6963,  -760,   326,
    -760,  -760,   552,   554,    66,   132,   378,   378,  -760,  6256,
     -18,   -10,   536,  -760,  -760,  -760,   541,  5198,  6963,  6963,
    6830,   625,  5570,   544,  -760,  -760,  -760,   252,   550,  5198,
    -760,  -760,    53,   257,  -760,   691,  -760,  2565,  -760,  -760,
    -760,  -760,  -760,   540,   178,    84,  -760,   557,    38,   558,
     178,  -760,  -760,  -760,  -760,  -760,  -760,  -760,   488,  -760,
     568,   571,   197,   572,  6256,  6963,  -760,   573,   574,  6963,
    -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,  -760,
    -760,   -12,   -14,   292,   378,   378,  -760,   378,   378,  -760,
      20,  5198,  -760,   335,   340,  5198,   343,   581,  5198,  5643,
    -760,  -760,  6963,  -760,  3423,  1035,  -760,  5381,  -760,   557,
      95,    95,   557,  6963,  -760,  -760,  -760,  -760,   311,   576,
    -760,  -760,   578,   378,  -760,   378,  -760,  -760,    94,    -1,
     153,     9,   378,   378,  -760,  -760,  5198,  5198,  -760,  5198,
    6963,  -760,  5198,  6886,   570,  -760,   575,  -760,  5381,  -760,
    -760,   557,   557,  -760,  -760,  -760,  -760,   577,   579,   378,
    -760,   378,  -760,   378,  -760,   378,  -760,   181,   149,   651,
    -760,  -760,   364,  -760,  5198,   413,  -760,  -760,  -760,   219,
    -760,  -760,   580,   585,   586,   589,   378,  -760,   378,  -760,
    5198,   594,  -760,  5198,  2012,  -760,  -760,  -760,  -760,  -760,
     596,   599,  -760,  -760,  -760,  -760,  -760,  -760,  -760
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -760,   193,  -760,   664,   659,    29,  -760,  -760,  -760,  -760,
       0,  -760,  -760,  1461,  -260,  -760,  -760,   167,  -760,  -107,
     289,   297,   -20,  -760,   302,   426,   449,   459,   425,   447,
    -760,  1542,   -49,  -760,   260,   -87,  -363,  -760,  -760,  -372,
      48,  -760,  -760,   502,  -760,    -5,  1452,   927,  -760,  -760,
    -307,  -760,   370,  -760,  1302,  1532,  -177,  1156,  -148,  -760,
     173,   176,   446,  -512,  -188,  -102,   359,  -760,  -760,    72,
    -760,   198,    -6,  1194,   505,   546,   -15,  -396,    -2,  -236,
     -42,   421,  -187,  -760,  1083,   -64,   312,  -760,  1146,   -85,
    -760,     1,  -760,  -760,   528,  -759,  -374,  -760,    80,  -760,
    -760,   223,  -760,  -760,  1157,  -641,  -760,  -760,  -760,  -115,
    -760,  -760,   -80,  -760,  -760,  -760,   316,   148,   318,   319,
    -760,  -250,  -760
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -497
static const yytype_int16 yytable[] =
{
      45,    60,   478,   192,    86,   556,   256,   440,   475,   568,
     368,   229,   371,   222,   555,   655,   147,   483,     1,   297,
      67,   366,     1,   392,    64,   242,   278,   196,   244,     1,
       1,   749,   602,   179,   522,   606,   656,   657,     1,   828,
       1,     1,     1,     1,    85,    71,    77,   155,    46,    29,
     367,   734,   735,    63,     1,   775,     1,    96,   773,   737,
     738,    67,   100,     2,   181,     2,   151,   153,   811,     1,
     659,    72,   399,   166,   426,   177,   195,    71,   815,   177,
      35,    36,     1,   224,   400,   856,    95,     1,   191,   782,
     783,   177,   660,   208,   367,   712,   367,   228,     1,   326,
     323,   185,   329,   100,   100,     1,   186,     2,   793,   576,
     658,   240,    27,    28,   240,   156,   196,    29,   286,    65,
     321,    46,   405,   407,   409,   736,   227,    71,    66,   776,
     265,   774,   222,   739,    69,    70,    46,    99,    69,    70,
     298,     1,   812,   412,   222,   222,   222,   733,    35,    36,
     301,    71,   816,    71,   305,   302,   240,   258,     1,   241,
     176,   258,   243,   784,   809,   679,    71,    92,   258,   320,
      69,    70,   485,   486,   487,   368,   177,    62,   177,   226,
     177,   258,   661,   536,   177,    45,   532,   556,   556,   729,
     599,    71,   369,   571,   177,   754,   686,   615,   362,    77,
     374,   240,   768,    72,   625,   619,   176,   708,    71,   265,
     387,   177,   208,   480,   651,   367,    98,   176,   838,     1,
     177,    69,    70,   813,   208,   208,   208,   361,   484,  -377,
    -377,   100,   132,    46,  -377,   419,   369,   810,   369,    76,
      71,   240,   432,   240,   432,   419,   231,   370,   450,   375,
     445,   836,   721,   730,   103,   321,   612,   287,   288,   476,
     232,   310,   308,   481,   612,  -377,  -377,   492,   493,   574,
     494,   361,   633,   361,   317,   236,   238,   239,   104,   279,
     197,   575,   155,   246,   398,   367,   132,   155,   257,   181,
     155,   195,   839,   367,   280,   281,   814,   258,   570,   231,
     188,   225,   419,    45,    68,   189,     1,   419,   586,   588,
     153,   414,   589,   415,   590,   556,    45,   511,   766,   177,
     230,   693,   282,   283,   837,   222,   310,   222,   333,   222,
     222,   222,   517,   231,   222,    72,   222,   623,    73,   107,
     601,   600,   513,    74,   622,   416,   515,   417,   844,    76,
     503,    46,   616,   334,   524,   503,   257,   369,   156,   636,
     257,   533,   845,   529,    46,   289,   290,   132,   534,   335,
      77,   637,   309,   374,    71,   240,   331,   553,   444,   249,
     310,   444,   332,   523,   177,   723,   755,    71,   177,   257,
     680,   293,   361,   751,   177,   621,   177,    95,   756,   336,
     337,   177,   132,    76,   132,   208,   294,   208,   295,   208,
     208,   208,   132,   777,   208,   444,   208,   296,   596,    71,
     240,   310,    69,    70,   443,   647,    45,   369,   418,   132,
     444,   132,   804,   609,    76,   369,    76,   644,   418,    72,
     310,   609,   303,   645,   132,    71,     1,    74,   520,   726,
     259,   260,   261,   666,   521,   444,   265,   333,   786,   627,
     249,   299,   361,   787,   444,   132,   789,    87,   303,   444,
     361,   300,   444,    74,    46,   504,   652,   398,   505,   398,
     507,   398,   334,   508,    68,   307,     1,   841,   313,   699,
     315,   320,   316,   444,    87,   249,    87,   249,   335,   318,
     182,   648,   330,   240,   796,   249,   222,   155,   222,   222,
     222,     1,    87,   333,   685,   259,   260,   261,   711,   710,
     376,   713,   284,   285,   482,   403,   654,   153,   336,   337,
     717,   718,   404,   662,   410,   664,   843,   177,   334,   411,
     132,   451,   444,   452,   132,   553,  -280,   673,   291,   292,
     512,   678,   514,    71,   335,   518,   682,   516,   502,   553,
     553,   381,   376,    76,   663,   262,     1,   519,    76,   263,
     264,   488,   489,   177,   177,   156,   527,   338,   177,   646,
     444,   490,   491,   383,   336,   337,   208,   155,   208,   208,
     208,     2,   525,   495,   496,   526,   724,    87,   539,   182,
     597,    87,    69,    70,    45,    87,  -416,   153,   233,   234,
     604,   132,  -416,   591,   605,   182,   426,     1,   607,   617,
     620,    87,   642,   643,   650,   671,   665,    71,   769,   667,
     262,   391,   772,   249,   263,   264,   668,    27,    28,   155,
     689,   669,    29,   670,   672,     1,   705,   674,   626,   259,
     260,   261,    46,   706,    71,   156,   675,   691,   398,   153,
     398,   398,   398,   690,    42,   794,   707,   553,   714,   715,
     720,   716,   719,    35,    36,   727,   803,   728,   740,   553,
     741,   747,    71,   758,   189,   750,   132,   553,    27,    28,
     752,   764,   132,    29,   155,   177,    76,   763,   177,   765,
     767,   770,   771,   790,   805,    93,   806,   156,   799,     1,
      42,   826,   132,   685,   153,   840,    94,   132,   827,   497,
     830,   500,   831,   846,    35,    36,   132,   132,   847,   848,
     150,   152,   849,    72,     2,   853,   176,    42,   173,   857,
      87,   553,   858,   498,   501,   553,   441,   742,   553,   799,
     797,     1,    42,   385,   499,   177,   509,   152,   581,   753,
     177,   177,   156,   577,   262,    27,    28,   689,   263,   264,
      29,   634,   696,   442,    68,    42,     1,   413,    42,   649,
      27,    28,   687,   152,   722,    29,   553,   553,   639,   553,
     640,   641,   553,     0,    87,   799,     0,     0,     0,     0,
       0,    35,    36,     0,     0,    87,     0,     0,     0,   572,
     677,     0,   132,     0,     0,   579,    35,    36,     0,     0,
      42,   785,    27,    28,   553,   788,     0,    29,   791,     0,
       0,   757,     0,     0,   132,   132,   132,   132,     0,   132,
     553,     0,     0,   553,     0,     0,   132,  -377,  -377,    42,
     325,     0,  -377,   328,   132,     0,     0,     0,    35,    36,
       0,     0,     0,    42,     0,    42,   819,   820,     0,   821,
      73,     0,   823,     0,    42,    74,   152,     0,     0,     0,
     391,    27,    28,  -377,  -377,     0,    29,     0,   152,   152,
     152,     0,    69,    70,     0,  -377,  -377,     0,     0,   152,
    -377,     0,     0,     0,   842,    42,     0,    42,   132,   152,
       0,     0,   132,     0,    42,   132,   132,    35,    36,     0,
     852,   152,   152,   854,   132,     0,    27,    28,   743,   744,
     746,    29,     0,     0,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   132,   132,     0,   132,   132,   182,   132,
     132,     2,    35,    36,     0,   132,   152,    42,     0,     0,
       0,   152,     0,    79,   152,   314,     0,    87,     0,     0,
      42,     0,     0,     0,    97,     0,     0,     0,     0,     0,
       0,   132,     0,     0,   694,   697,     0,     0,     0,   700,
      79,     0,   178,     0,   111,   112,   113,   132,     0,     0,
     132,   132,     0,   187,     0,     0,     0,     0,   194,     0,
     211,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,     0,     0,     0,    42,   114,   115,   152,     1,    42,
       0,   152,   116,     0,     0,     0,    18,    19,     0,     0,
     822,   117,   118,   825,     0,   119,     0,   120,   121,     0,
       0,   172,     0,   122,   123,   124,   125,     0,     0,   152,
       0,   152,     0,   152,   152,   152,    27,    28,   152,     0,
     152,    29,     0,   304,    42,     0,     0,     0,     1,     0,
      42,     0,     0,     0,     0,   187,     0,     0,     0,     0,
       0,     0,     0,   178,     0,     0,   187,   194,     0,    27,
      28,   194,    35,    36,    29,     0,   759,     0,   152,   762,
       0,    72,     0,    42,     0,     0,   211,   178,     0,    89,
       0,     0,     0,     0,     0,     0,   152,   388,     0,   211,
       0,     0,     0,   276,     0,    35,    36,   401,     0,     0,
       0,   211,   211,   211,    72,     0,    89,   176,    89,    27,
      28,     0,   183,     0,    29,     0,     0,    42,   428,     0,
     428,     0,     0,     0,    89,     0,    87,   304,     0,     0,
       0,   801,   802,     0,     0,     0,     0,     0,     0,     0,
     653,   152,    91,     0,     0,    35,    36,     0,     0,     0,
       0,     0,    82,     0,    72,     0,     0,   176,   569,     0,
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
     105,   423,     1,   106,   107,     0,   306,    82,   437,    82,
     437,   423,    89,     0,    83,     0,   448,     0,     0,     0,
       0,     0,     0,   463,   463,     0,     0,     2,   152,     0,
       0,   251,     0,     0,     0,     0,     0,     0,     0,   424,
     304,     0,     0,     0,     0,    83,   438,    83,   438,   424,
       0,     0,     0,     0,   449,     0,     0,     0,     0,   306,
     506,   464,   464,     0,     0,     0,    89,     0,    80,     0,
     111,   112,     0,     0,     0,   311,     0,    89,     0,     0,
       0,   395,     0,     0,     0,     0,     0,   402,     0,   580,
       0,     0,     0,   537,   582,     0,     0,     0,     0,     0,
       0,   114,   115,     0,     0,     0,     0,     0,    78,     0,
     365,   695,     0,     0,     0,     0,     0,   117,     0,   306,
       0,   237,    80,   211,   121,   211,   211,   211,   164,   180,
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
       0,   630,     0,   850,     0,   851,   458,     0,     0,     0,
       0,     0,     0,     0,   462,     0,     0,     0,   628,     0,
       0,   460,   460,   105,   458,     1,   106,   107,   108,     0,
     109,   110,     0,   460,     0,     0,     0,     0,     0,     0,
       0,     0,   456,     0,     0,    81,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,   209,     0,   209,
     209,   209,     0,     0,     0,     0,   461,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   174,   111,   112,   113,     0,     0,   630,     0,
       0,   462,   462,     0,     0,     0,     0,   456,     0,     0,
       0,     0,     0,   462,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   458,   114,   115,     0,     0,   174,     0,
       0,   116,     0,     0,     0,     0,     0,     0,     0,     0,
     117,   118,     0,     0,   119,     0,   120,   121,     0,   460,
       0,     0,   122,   123,   124,   125,     0,   174,     0,     0,
     174,     0,     0,     0,   798,   855,     0,     0,     0,   174,
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
      36,    37,    38,     0,     0,     0,    39,   117,   118,     0,
       0,   119,     0,   120,   121,     0,     0,     0,     0,   122,
     123,   124,   125,     0,     0,     0,     0,     0,     0,     0,
     552,   376,  -444,   105,     0,     1,   106,   107,   108,     0,
     109,   110,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   540,   541,   542,   543,   544,   545,
     546,   547,   548,   549,   550,     0,     0,     0,    26,     0,
       0,     0,     0,   111,   112,   113,    27,    28,     0,   551,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   114,   115,     0,     0,     0,     0,
       0,   116,    35,    36,    37,    38,     0,     0,     0,    39,
     117,   118,     0,     0,   119,     0,   120,   121,     0,     0,
       0,     0,   122,   123,   124,   125,     0,     0,     0,     0,
       0,     0,     0,   552,   376,  -443,   105,     0,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,   540,   541,   542,
     543,   544,   545,   546,   547,   548,   549,   550,     0,     0,
       0,    26,     0,     0,     0,     0,   111,   112,   113,    27,
      28,     0,   551,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   114,   115,     0,
       0,     0,     0,     0,   116,    35,    36,    37,    38,     0,
       0,     0,    39,   117,   118,     0,     0,   119,     0,   120,
     121,     0,     0,     0,     0,   122,   123,   124,   125,     0,
       0,     0,     0,     0,     0,     0,   552,   376,  -445,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   111,
     112,   113,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     114,   115,     0,     0,     0,     0,     0,   116,    35,    36,
      37,    38,     0,     0,     0,    39,   117,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,   453,
     454,   455,   105,     0,     1,   106,   107,   108,     0,   109,
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
     118,     0,     0,   119,     0,   120,   121,     0,     0,     0,
       0,   122,   123,   124,   125,     0,     0,     0,     0,     0,
       0,     0,   453,   454,   474,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   111,   112,   113,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,   116,    35,    36,    37,    38,     0,     0,
       0,    39,   117,   118,     0,     0,   119,     0,   120,   121,
       0,     0,     0,     0,   122,   123,   124,   125,     0,     0,
       0,     0,     0,     0,     0,   453,   454,   624,   105,     0,
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
      38,     0,     0,     0,    39,   117,   118,     0,     0,   119,
       0,   120,   121,     0,     0,     0,     0,   122,   123,   124,
     125,     0,     0,     0,     0,     0,     0,     0,   638,   454,
    -496,   105,     0,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   111,   112,   113,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   114,   115,     0,     0,     0,     0,     0,   116,
      35,    36,    37,    38,     0,     0,     0,    39,   117,   118,
       0,     0,   119,     0,   120,   121,     0,     0,     0,     0,
     122,   123,   124,   125,     0,     0,     0,     0,     0,     0,
       0,   453,   454,   692,   105,     0,     1,   106,   107,   108,
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
      39,   117,   118,     0,     0,   119,     0,   120,   121,     0,
       0,     0,     0,   122,   123,   124,   125,   105,     0,     1,
     106,   107,     0,     0,   453,   454,   795,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   202,     0,   397,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   406,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   202,     0,   408,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   583,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   202,     0,   584,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   585,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   202,     0,   587,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
     201,   121,   105,     0,     1,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,   701,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   202,     0,   702,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   198,     0,     0,   111,   112,     0,
      27,    28,     0,     0,   199,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,   117,    72,     0,     0,   200,     0,
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
      72,     0,     0,   200,     0,   201,   121,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,     0,   202,     0,   704,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,   540,   541,
     542,   543,   544,   545,   546,   547,   548,   549,   550,     0,
       0,     0,    26,     0,     0,     0,     0,   111,   112,   113,
      27,    28,     0,   551,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,   116,    35,    36,    37,    38,
       0,     0,     0,    39,   117,   118,     0,     0,   119,     0,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
       0,     0,     0,     0,     0,     0,     0,   552,   376,   105,
       0,     1,   106,   107,   108,     0,   109,   110,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,     0,     0,     0,     0,     0,
     540,   541,   542,   543,   544,   545,   546,   547,   548,   549,
     550,     2,     0,     0,     0,     0,     0,     0,     0,   111,
     112,   113,     0,     0,     0,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     114,   115,     2,     0,   111,   112,   113,   116,     0,     0,
       0,     0,     0,     0,     0,     0,   117,   118,     0,     0,
     119,     0,   120,   121,     0,     0,     0,     0,   122,   123,
     124,   125,     0,     0,     0,   114,   115,     0,     0,   552,
     376,     0,   116,     0,     0,   111,   112,   113,     0,     0,
       0,   117,   118,     0,     0,   119,   477,   120,   121,     0,
       0,     0,     0,   122,   123,   124,   125,     0,     0,     0,
       0,     0,     0,     0,     0,   454,   114,   115,     0,     0,
       0,     0,   105,   116,     1,   106,   107,   108,     0,   109,
     110,     0,   117,   118,     0,     0,   119,     0,   120,   121,
       0,     0,     0,     0,   122,   123,   124,   125,     0,     2,
       0,     0,     0,     0,     0,     0,   454,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   111,   112,   113,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,   115,     0,     0,     0,     0,     0,
     116,     0,     0,     0,     0,     0,     0,     0,     0,   117,
     118,     0,     0,   119,     0,   120,   121,     0,     0,     0,
       0,   122,   123,   124,   125,   105,     0,     1,   106,   107,
       0,     0,     0,   798,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,   105,     0,     1,   106,   107,   108,     0,   109,   110,
      26,     0,   198,     0,     0,   111,   112,     0,    27,    28,
       0,     0,   199,    29,     0,     0,    30,    31,     2,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   114,   115,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,   117,    72,     0,     0,   200,     0,   201,   121,
       0,   111,   112,   113,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,   202,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   114,   115,     0,     0,     0,     0,   105,   116,
       1,   106,   107,   108,     0,   109,   110,     0,   117,   118,
       0,     0,   119,   748,   120,   121,     0,     0,     0,     0,
     122,   123,   124,   125,     0,     2,     0,     0,     0,     0,
       0,   552,     0,     0,   111,   112,   113,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   114,   115,     0,   111,   112,
     113,     0,   116,     0,     0,     0,     0,     0,     0,     0,
       0,   117,   118,     0,     0,   119,   792,   120,   121,     0,
       0,     0,     0,   122,   123,   124,   125,     0,     0,   114,
     115,     0,     0,     0,   552,     0,   116,     0,     0,     0,
       0,     0,     0,     0,     1,   117,   118,     0,     0,   119,
       0,   120,   121,     0,     0,     0,     0,   122,   123,   124,
     125,     0,     0,     0,     0,     0,     0,     0,   676,     2,
       3,     4,     5,     6,     7,   342,   343,   344,   345,   346,
     347,   348,   349,   350,   351,    18,    19,   352,   353,    22,
      23,   354,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   355,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   356,     0,   357,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   358,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,   359,   360,     0,     0,     0,    39,     1,
      72,     0,     0,   303,     0,     0,     0,     0,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   528,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     1,    72,     0,     0,   384,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   385,     0,   386,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     1,
      72,     0,     0,   176,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   681,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     0,    72,     0,   105,   303,     1,
     106,   107,   108,    74,   109,   110,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -279,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   111,   112,   113,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   114,   115,
       0,     0,     0,     0,     0,   116,    35,    36,    37,    38,
       0,     0,     0,    39,   117,   118,     0,     0,   119,     0,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,    37,    38,     0,     0,     0,     0,   117,   118,     0,
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
     117,   372,     0,     0,   373,   247,   120,   121,     0,     0,
       0,     0,   122,   123,   124,   125,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   105,     0,     1,   106,   107,
     108,     0,   109,   110,     0,     0,     0,     0,     0,     0,
     111,   112,   113,    27,    28,     0,     0,     0,    29,     0,
       0,     0,     2,     0,     0,     0,     0,     0,   105,     0,
       1,   106,   107,   108,     0,   109,   110,     0,     0,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,    35,
      36,     0,     0,     0,     0,     2,     0,   117,   372,     0,
       0,   373,   247,   120,   121,   111,   112,   113,     0,   122,
     123,   124,   125,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   114,   115,   111,   112,
     113,     0,     0,   116,     0,     0,     0,     0,     0,     0,
       0,     0,   117,   118,     0,     0,   119,     0,   120,   121,
       0,     0,   324,     0,   122,   123,   124,   125,     0,   114,
     115,     0,     0,     0,     0,   105,   116,     1,   106,   107,
     108,     0,   109,   110,     0,   117,   118,     0,     0,   119,
       0,   120,   121,     0,     0,   327,     0,   122,   123,   124,
     125,   105,     2,     1,   106,   107,   108,     0,   109,   110,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   111,   112,   113,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   105,     0,     1,
     106,   107,   108,     0,   109,   110,     0,     0,     0,     0,
       0,   111,   112,   113,     0,     0,   114,   115,     0,     0,
       0,     0,     0,   116,     2,     0,     0,     0,     0,     0,
       0,     0,   117,   118,     0,     0,   119,   247,   120,   121,
       0,     0,   114,   115,   122,   123,   124,   125,     0,   116,
       0,     0,     0,     0,     0,     0,     0,     0,   117,   118,
       0,     0,   119,   745,   120,   121,     0,   111,   112,   113,
     122,   123,   124,   125,   105,     0,     1,   106,   107,   108,
       0,   109,   110,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   114,   115,
       0,     2,     0,     0,     0,   116,     0,     0,     0,     0,
       0,     0,     0,     0,   117,   118,     0,     0,   119,   824,
     120,   121,     0,     0,     0,     0,   122,   123,   124,   125,
     105,     0,     1,   106,   107,   108,     0,   109,   110,     0,
       0,     0,     0,     0,   111,   112,   113,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   105,     2,     1,   106,
     107,   108,     0,   109,   110,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   114,   115,     0,     0,     0,
       0,     0,   116,     2,     0,     0,     0,     0,     0,     0,
       0,   117,   118,     0,     0,   119,     0,   120,   121,     0,
     111,   112,   113,   122,   123,   124,   125,     0,     0,     0,
       0,     0,   105,     0,     1,   106,   107,   108,     0,   109,
     110,     0,     0,     0,     0,     0,   111,   112,   113,     0,
       0,   114,   115,     0,     0,     0,     0,     0,   116,     2,
       0,     0,     0,     0,     0,     0,     0,   117,   118,     0,
       0,   235,     0,   120,   121,     0,     0,   114,   115,   122,
     123,   124,   125,     0,   116,     0,     0,     0,     0,     0,
       0,     0,     0,   117,   118,     0,     0,   237,     0,   120,
     121,     0,   111,   112,   113,   122,   123,   124,   125,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   114,   115,     0,     0,     0,     0,     0,
     116,     1,     0,     0,     0,     0,     0,     0,     0,   117,
     118,     0,     0,   245,     0,   120,   121,     0,     0,     0,
       0,   122,   123,   124,   125,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     1,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,     0,    72,     0,     0,
      73,     0,     0,     0,     0,    74,     0,     0,    75,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
      72,     0,     0,    73,   165,     0,     0,     0,    74,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
      72,     0,     0,   303,   165,     0,     0,     0,    74,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
      72,     0,     0,   426,     0,     0,     0,     0,   427,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
      72,     0,     0,   426,     0,     0,     0,     0,   439,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    39,     0,
      72,     0,     0,   303,     0,     0,     0,     0,    74,     2,
       3,     4,     5,     6,     7,   342,   343,   344,   345,   346,
     347,   348,   349,   350,   351,    18,    19,   352,   353,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   355,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   356,     0,   357,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   358,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    35,    36,   359,   360,     0,     0,     0,    39,     0,
      72,     0,     0,   426,     0,     0,     0,     0,   608,     2,
       3,     4,     5,     6,     7,   342,   343,   344,   345,   346,
     347,   348,   349,   350,   351,    18,    19,   352,   353,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   355,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   356,     0,   357,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,   358,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,   359,   360,     0,     0,     0,    39,     0,
      72,     0,     0,   426,     2,     0,     0,     0,   618,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     1,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,     0,     0,    72,     0,     0,   303,     0,
       0,     0,     0,    74,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    25,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    39,     0,    72,     0,     0,   426,   598,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    39,
       0,     0,     0,     0,     0,   190,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    25,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    39,     0,     0,     0,     0,
       0,   322,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    39,     0,     0,     0,     0,     0,   709,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     0,    72,
       0,     0,   176,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    39,     0,     0,     0,     0,   538,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,   510,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    39,     2,     3,
       4,     5,     6,     7,   342,   343,   344,   345,   346,   347,
     348,   349,   350,   351,    18,    19,   352,   353,    22,    23,
     354,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   355,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,     0,     0,     0,   356,     0,   357,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
     358,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,   359,   360,     0,     0,     0,    39,     2,     3,
       4,     5,     6,     7,   342,   343,   344,   345,   346,   347,
     348,   349,   350,   351,    18,    19,   352,   353,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   355,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,     0,     0,     0,   356,     0,   357,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     358,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,   359,   360,     0,     0,     0,    39
};

static const yytype_int16 yycheck[] =
{
       0,     0,   262,    88,    46,   377,   121,   243,   258,   383,
     198,    98,   199,    93,   377,   527,    65,   277,     3,    17,
     120,   198,     3,   210,    24,   112,   133,    91,   115,     3,
       3,   672,   428,    75,   341,   431,    69,    70,     3,   798,
       3,     3,     3,     3,    46,    45,    46,    67,     0,    79,
     198,    69,    70,    24,     3,    69,     3,    57,    70,    69,
      70,   120,    62,    28,    79,    28,    66,    67,    69,     3,
     120,   119,   129,    73,   122,    75,    91,    77,    69,    79,
     110,   111,     3,   142,   141,   844,    57,     3,    88,    69,
      70,    91,   142,    93,   242,   607,   244,    97,     3,   186,
     185,   122,   189,   103,   104,     3,   127,    28,   749,   139,
     143,   111,    74,    75,   114,    67,   180,    79,   138,   122,
     184,    73,   224,   225,   226,   143,    97,   127,   122,   143,
     130,   143,   212,   143,   119,   120,    88,     0,   119,   120,
     138,     3,   143,   230,   224,   225,   226,   659,   110,   111,
     123,   151,   143,   153,   156,   140,   156,   142,     3,   111,
     122,   142,   114,   143,    70,   139,   166,   122,   142,   184,
     119,   120,   279,   280,   281,   363,   176,   142,   178,   142,
     180,   142,   142,   370,   184,   185,   363,   559,   560,   123,
     426,   191,   198,   142,   194,   142,   559,   433,   198,   199,
     200,   201,   714,   119,   454,   441,   122,   603,   208,   209,
     210,   211,   212,   262,   521,   363,   139,   122,    69,     3,
     220,   119,   120,    70,   224,   225,   226,   198,   277,    74,
      75,   231,    65,   185,    79,   235,   242,   143,   244,    46,
     240,   241,   242,   243,   244,   245,   129,   199,   250,   201,
     250,    70,   626,   121,   142,   319,   433,    12,    13,   259,
     143,   129,    11,   263,   441,   110,   111,   287,   288,   129,
     290,   242,   459,   244,   128,   108,   109,   110,   142,   119,
     122,   141,   302,   116,   212,   433,   119,   307,   142,   304,
     310,   306,   143,   441,   134,   135,   143,   142,   385,   129,
     122,   142,   302,   303,     1,   127,     3,   307,   410,   411,
     310,   141,   414,   143,   416,   687,   316,   316,   121,   319,
     140,   571,   131,   132,   143,   405,   129,   407,     3,   409,
     410,   411,   332,   129,   414,   119,   416,   452,   122,     5,
     427,   426,   128,   127,   451,   141,   128,   143,   129,   156,
     302,   303,   439,    28,   354,   307,   142,   363,   310,   129,
     142,   363,   143,   363,   316,   120,   121,   200,   368,    44,
     370,   141,   121,   373,   374,   375,   123,   377,   129,   119,
     129,   129,   129,   354,   384,   645,   129,   387,   388,   142,
     141,   130,   363,   141,   394,   444,   396,   368,   141,    74,
      75,   401,   235,   210,   237,   405,   136,   407,   137,   409,
     410,   411,   245,   121,   414,   129,   416,    16,   420,   419,
     420,   129,   119,   120,   123,   139,   426,   433,   235,   262,
     129,   264,   121,   433,   241,   441,   243,   123,   245,   119,
     129,   441,   122,   129,   277,   445,     3,   127,   123,   123,
       7,     8,     9,   540,   129,   129,   456,     3,   123,   459,
     200,   123,   433,   123,   129,   298,   123,    46,   122,   129,
     441,   123,   129,   127,   426,   302,   525,   405,   302,   407,
     307,   409,    28,   307,     1,   140,     3,   123,   123,   576,
     123,   506,   129,   129,    73,   235,    75,   237,    44,   128,
      79,   503,   123,   503,   754,   245,   586,   527,   588,   589,
     590,     3,    91,     3,   556,     7,     8,     9,   605,   604,
     142,   608,    10,    11,   264,   141,   526,   527,    74,    75,
     617,   618,   141,   533,   142,   535,   123,   537,    28,   142,
     373,   123,   129,   126,   377,   545,   140,   547,    14,    15,
     123,   551,   128,   553,    44,   123,   556,   128,   298,   559,
     560,   141,   142,   370,   535,   122,     3,   122,   375,   126,
     127,   282,   283,   573,   574,   527,   120,   123,   578,   128,
     129,   284,   285,   140,    74,    75,   586,   607,   588,   589,
     590,    28,   122,   291,   292,   122,   645,   176,   143,   178,
     123,   180,   119,   120,   604,   184,   123,   607,   103,   104,
     122,   444,   129,   420,   127,   194,   122,     3,   120,   127,
     123,   200,   143,   143,   123,   545,   123,   627,   715,   139,
     122,   210,   719,   373,   126,   127,   122,    74,    75,   659,
     560,   122,    79,   122,   122,     3,   123,   141,   140,     7,
       8,     9,   604,   123,   654,   607,   141,   141,   586,   659,
     588,   589,   590,   143,     0,   752,   128,   667,   120,   127,
     143,   128,   127,   110,   111,   123,   763,   123,   142,   679,
     139,    56,   682,   143,   127,   141,   519,   687,    74,    75,
     140,   123,   525,    79,   714,   695,   503,   139,   698,   128,
     128,   128,   128,   122,   128,   142,   128,   659,   757,     3,
      46,   141,   545,   755,   714,    64,    57,   550,   143,   293,
     143,   296,   143,   143,   110,   111,   559,   560,   143,   143,
      66,    67,   143,   119,    28,   141,   122,    73,    74,   143,
     319,   741,   143,   294,   297,   745,   244,   667,   748,   798,
     755,     3,    88,   139,   295,   755,   310,    93,   399,   679,
     760,   761,   714,   393,   122,    74,    75,   687,   126,   127,
      79,   459,   574,   245,     1,   111,     3,   231,   114,   519,
      74,    75,   559,   119,   636,    79,   786,   787,   472,   789,
     472,   472,   792,    -1,   373,   844,    -1,    -1,    -1,    -1,
      -1,   110,   111,    -1,    -1,   384,    -1,    -1,    -1,   388,
     550,    -1,   645,    -1,    -1,   394,   110,   111,    -1,    -1,
     156,   741,    74,    75,   824,   745,    -1,    79,   748,    -1,
      -1,   140,    -1,    -1,   667,   668,   669,   670,    -1,   672,
     840,    -1,    -1,   843,    -1,    -1,   679,    74,    75,   185,
     186,    -1,    79,   189,   687,    -1,    -1,    -1,   110,   111,
      -1,    -1,    -1,   199,    -1,   201,   786,   787,    -1,   789,
     122,    -1,   792,    -1,   210,   127,   212,    -1,    -1,    -1,
     459,    74,    75,   110,   111,    -1,    79,    -1,   224,   225,
     226,    -1,   119,   120,    -1,   122,   123,    -1,    -1,   235,
     127,    -1,    -1,    -1,   824,   241,    -1,   243,   741,   245,
      -1,    -1,   745,    -1,   250,   748,   749,   110,   111,    -1,
     840,   257,   258,   843,   757,    -1,    74,    75,   668,   669,
     670,    79,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   786,   787,    -1,   789,   790,   537,   792,
     793,    28,   110,   111,    -1,   798,   302,   303,    -1,    -1,
      -1,   307,    -1,    46,   310,   123,    -1,   556,    -1,    -1,
     316,    -1,    -1,    -1,    57,    -1,    -1,    -1,    -1,    -1,
      -1,   824,    -1,    -1,   573,   574,    -1,    -1,    -1,   578,
      73,    -1,    75,    -1,    71,    72,    73,   840,    -1,    -1,
     843,   844,    -1,    86,    -1,    -1,    -1,    -1,    91,    -1,
      93,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    -1,    -1,    -1,   370,   102,   103,   373,     3,   375,
      -1,   377,   109,    -1,    -1,    -1,    44,    45,    -1,    -1,
     790,   118,   119,   793,    -1,   122,    -1,   124,   125,    -1,
      -1,   128,    -1,   130,   131,   132,   133,    -1,    -1,   405,
      -1,   407,    -1,   409,   410,   411,    74,    75,   414,    -1,
     416,    79,    -1,   156,   420,    -1,    -1,    -1,     3,    -1,
     426,    -1,    -1,    -1,    -1,   168,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   176,    -1,    -1,   179,   180,    -1,    74,
      75,   184,   110,   111,    79,    -1,   695,    -1,   454,   698,
      -1,   119,    -1,   459,    -1,    -1,   199,   200,    -1,    46,
      -1,    -1,    -1,    -1,    -1,    -1,   472,   210,    -1,   212,
      -1,    -1,    -1,   140,    -1,   110,   111,   220,    -1,    -1,
      -1,   224,   225,   226,   119,    -1,    73,   122,    75,    74,
      75,    -1,    79,    -1,    79,    -1,    -1,   503,   241,    -1,
     243,    -1,    -1,    -1,    91,    -1,   755,   250,    -1,    -1,
      -1,   760,   761,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     526,   527,    46,    -1,    -1,   110,   111,    -1,    -1,    -1,
      -1,    -1,    46,    -1,   119,    -1,    -1,   122,   123,    -1,
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
       1,   235,     3,     4,     5,    -1,   250,   241,   242,   243,
     244,   245,   319,    -1,   210,    -1,   250,    -1,    -1,    -1,
      -1,    -1,    -1,   257,   258,    -1,    -1,    28,   754,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   235,
     503,    -1,    -1,    -1,    -1,   241,   242,   243,   244,   245,
      -1,    -1,    -1,    -1,   250,    -1,    -1,    -1,    -1,   303,
     304,   257,   258,    -1,    -1,    -1,   373,    -1,   156,    -1,
      71,    72,    -1,    -1,    -1,   163,    -1,   384,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,    -1,   394,    -1,   396,
      -1,    -1,    -1,   556,   401,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    46,    -1,
     198,   574,    -1,    -1,    -1,    -1,    -1,   118,    -1,   363,
      -1,   122,   210,   586,   125,   588,   589,   590,   372,   373,
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
      -1,   459,    -1,   836,    -1,   838,   454,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   472,    -1,    -1,    -1,   556,    -1,
      -1,   559,   560,     1,   472,     3,     4,     5,     6,    -1,
       8,     9,    -1,   571,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   571,    -1,    -1,   503,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,   586,    -1,   588,
     589,   590,    -1,    -1,    -1,    -1,   754,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   540,    71,    72,    73,    -1,    -1,   556,    -1,
      -1,   559,   560,    -1,    -1,    -1,    -1,   636,    -1,    -1,
      -1,    -1,    -1,   571,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   571,   102,   103,    -1,    -1,   576,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,   119,    -1,    -1,   122,    -1,   124,   125,    -1,   687,
      -1,    -1,   130,   131,   132,   133,    -1,   605,    -1,    -1,
     608,    -1,    -1,    -1,   142,   143,    -1,    -1,    -1,   617,
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
     111,   112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,
      -1,   122,    -1,   124,   125,    -1,    -1,    -1,    -1,   130,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     141,   142,   143,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,   119,    -1,    -1,   122,    -1,   124,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   141,   142,   143,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    77,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,   124,
     125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   141,   142,   143,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,
     122,    -1,   124,   125,    -1,    -1,    -1,    -1,   130,   131,
     132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,
     142,   143,     1,    -1,     3,     4,     5,     6,    -1,     8,
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
     119,    -1,    -1,   122,    -1,   124,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,   142,   143,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,   119,    -1,    -1,   122,    -1,   124,   125,
      -1,    -1,    -1,    -1,   130,   131,   132,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   141,   142,   143,     1,    -1,
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
     113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,
      -1,   124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,   142,
     143,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,   119,
      -1,    -1,   122,    -1,   124,   125,    -1,    -1,    -1,    -1,
     130,   131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   141,   142,   143,     1,    -1,     3,     4,     5,     6,
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
     117,   118,   119,    -1,    -1,   122,    -1,   124,   125,    -1,
      -1,    -1,    -1,   130,   131,   132,   133,     1,    -1,     3,
       4,     5,    -1,    -1,   141,   142,   143,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
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
     119,    -1,    -1,   122,    -1,   124,   125,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    77,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,   142,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    28,    -1,    71,    72,    73,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   118,   119,    -1,    -1,
     122,    -1,   124,   125,    -1,    -1,    -1,    -1,   130,   131,
     132,   133,    -1,    -1,    -1,   102,   103,    -1,    -1,   141,
     142,    -1,   109,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,   118,   119,    -1,    -1,   122,   123,   124,   125,    -1,
      -1,    -1,    -1,   130,   131,   132,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,   102,   103,    -1,    -1,
      -1,    -1,     1,   109,     3,     4,     5,     6,    -1,     8,
       9,    -1,   118,   119,    -1,    -1,   122,    -1,   124,   125,
      -1,    -1,    -1,    -1,   130,   131,   132,   133,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
     119,    -1,    -1,   122,    -1,   124,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,   142,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    28,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,   119,    -1,    -1,   122,    -1,   124,   125,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,     1,   109,
       3,     4,     5,     6,    -1,     8,     9,    -1,   118,   119,
      -1,    -1,   122,   123,   124,   125,    -1,    -1,    -1,    -1,
     130,   131,   132,   133,    -1,    28,    -1,    -1,    -1,    -1,
      -1,   141,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    71,    72,
      73,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,    -1,    -1,   122,   123,   124,   125,    -1,
      -1,    -1,    -1,   130,   131,   132,   133,    -1,    -1,   102,
     103,    -1,    -1,    -1,   141,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     3,   118,   119,    -1,    -1,   122,
      -1,   124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,     3,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,   127,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   142,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,     3,   119,    -1,    -1,   122,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,     3,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,   119,    -1,     1,   122,     3,
       4,     5,     6,   127,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   140,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,    -1,   122,    -1,
     124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    -1,    -1,    -1,   118,   119,    -1,
      -1,   122,   123,   124,   125,    -1,    -1,    -1,    -1,   130,
     131,   132,   133,     1,    -1,     3,     4,     5,     6,    -1,
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
     118,   119,    -1,    -1,   122,   123,   124,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,    -1,    -1,    -1,    -1,    28,    -1,   118,   119,    -1,
      -1,   122,   123,   124,   125,    71,    72,    73,    -1,   130,
     131,   132,   133,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    71,    72,
      73,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,   119,    -1,    -1,   122,    -1,   124,   125,
      -1,    -1,   128,    -1,   130,   131,   132,   133,    -1,   102,
     103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,
       6,    -1,     8,     9,    -1,   118,   119,    -1,    -1,   122,
      -1,   124,   125,    -1,    -1,   128,    -1,   130,   131,   132,
     133,     1,    28,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,   119,    -1,    -1,   122,   123,   124,   125,
      -1,    -1,   102,   103,   130,   131,   132,   133,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,   119,
      -1,    -1,   122,   123,   124,   125,    -1,    71,    72,    73,
     130,   131,   132,   133,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    28,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   118,   119,    -1,    -1,   122,   123,
     124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    28,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,    -1,    -1,   122,    -1,   124,   125,    -1,
      71,    72,    73,   130,   131,   132,   133,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,   119,    -1,
      -1,   122,    -1,   124,   125,    -1,    -1,   102,   103,   130,
     131,   132,   133,    -1,   109,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   118,   119,    -1,    -1,   122,    -1,   124,
     125,    -1,    71,    72,    73,   130,   131,   132,   133,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,
     119,    -1,    -1,   122,    -1,   124,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,
     122,    -1,    -1,    -1,    -1,   127,    -1,    -1,   130,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    28,    -1,    -1,    -1,   127,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    -1,
      -1,    -1,    -1,   127,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,   119,    -1,    -1,   122,   123,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,    -1,    -1,    -1,   123,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,
      -1,   123,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,    -1,    -1,    -1,   123,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,   119,
      -1,    -1,   122,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,    -1,    -1,   122,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   112,   113,   117,
     145,   146,   147,   148,   149,   154,   184,   185,   190,   191,
     192,   196,   197,   198,   199,   201,   202,   208,   216,   217,
     235,   266,   142,   149,   154,   122,   122,   120,     1,   119,
     120,   154,   119,   122,   127,   130,   145,   154,   190,   191,
     198,   199,   201,   217,   220,   222,   224,   225,   227,   228,
     229,   232,   122,   142,   148,   149,   154,   191,   139,     0,
     154,   218,   219,   142,   142,     1,     4,     5,     6,     8,
       9,    71,    72,    73,   102,   103,   109,   118,   119,   122,
     124,   125,   130,   131,   132,   133,   147,   154,   155,   156,
     157,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   253,   256,
     147,   154,   147,   154,   161,   166,   184,   203,   204,   205,
     206,   207,   198,   231,   232,   123,   154,   222,   224,   233,
     234,   235,   128,   147,   175,   179,   122,   154,   191,   224,
     232,   220,   225,   228,   232,   122,   127,   191,   122,   127,
     123,   154,   233,   236,   191,   220,   229,   122,    68,    78,
     122,   124,   141,   143,   150,   151,   152,   153,   154,   157,
     184,   191,   209,   210,   211,   212,   213,   225,   226,   228,
     232,   255,   256,   258,   142,   142,   142,   149,   154,   179,
     140,   129,   143,   218,   218,   122,   161,   122,   161,   161,
     154,   184,   179,   184,   179,   122,   161,   123,   176,   178,
     181,   198,   199,   201,   217,   237,   253,   142,   142,     7,
       8,     9,   122,   126,   127,   154,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,   140,   177,   163,   119,
     134,   135,   131,   132,    10,    11,   166,    12,    13,   120,
     121,    14,    15,   130,   136,   137,    16,    17,   138,   123,
     123,   123,   140,   122,   191,   222,   232,   140,    11,   121,
     129,   198,   232,   123,   123,   123,   129,   128,   128,   232,
     220,   229,   123,   233,   128,   147,   179,   128,   147,   179,
     123,   123,   129,     3,    28,    44,    74,    75,   123,   193,
     194,   195,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    46,    47,    50,    66,    85,    87,   100,   112,
     113,   149,   154,   186,   190,   198,   200,   202,   208,   216,
     184,   226,   119,   122,   154,   184,   142,   247,   248,   248,
     248,   141,   248,   140,   122,   139,   141,   154,   191,   214,
     215,   225,   226,   230,   232,   228,   232,   143,   213,   129,
     141,   191,   228,   141,   141,   209,   143,   209,   143,   209,
     142,   142,   179,   219,   141,   143,   141,   143,   145,   154,
     182,   198,   199,   201,   217,   238,   122,   127,   191,   221,
     223,   232,   154,   187,   190,   198,   200,   201,   217,   127,
     223,   187,   238,   123,   129,   154,   198,   199,   201,   217,
     222,   123,   126,   141,   142,   143,   157,   158,   175,   183,
     190,   198,   199,   201,   217,   240,   257,   259,   260,   261,
     262,   263,   264,   265,   143,   265,   154,   123,   158,   159,
     176,   154,   178,   158,   176,   163,   163,   163,   164,   164,
     165,   165,   166,   166,   166,   168,   168,   169,   170,   171,
     172,   173,   178,   184,   204,   205,   232,   204,   205,   206,
      51,   235,   123,   128,   128,   128,   128,   154,   123,   122,
     123,   129,   194,   149,   154,   122,   122,   120,   142,   154,
     190,   198,   200,   222,   154,   191,   226,   191,   122,   143,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    77,   141,   154,   178,   180,   183,   242,   243,   244,
     245,   246,   248,   249,   250,   251,   252,   254,   240,   123,
     179,   142,   225,   232,   129,   141,   139,   196,   191,   225,
     228,   210,   228,   143,   143,   143,   209,   143,   209,   209,
     209,   145,   198,   199,   201,   217,   222,   123,   123,   223,
     233,   179,   221,   232,   122,   127,   221,   120,   127,   154,
     190,   198,   200,   201,   217,   223,   179,   127,   127,   223,
     123,   176,   163,   253,   143,   265,   140,   154,   190,   198,
     199,   201,   217,   226,   230,   248,   129,   141,   141,   260,
     262,   263,   143,   143,   123,   129,   128,   139,   222,   178,
     123,   194,   176,   147,   154,   207,    69,    70,   143,   120,
     142,   142,   154,   149,   154,   123,   179,   139,   122,   122,
     122,   242,   122,   154,   141,   141,   141,   178,   154,   139,
     141,   141,   154,   188,   189,   224,   180,   245,   180,   242,
     143,   141,   143,   265,   225,   191,   215,   225,   232,   179,
     225,   143,   143,   143,   143,   123,   123,   128,   221,   123,
     233,   179,   207,   179,   120,   127,   128,   179,   179,   127,
     143,   240,   261,   158,   176,   175,   123,   123,   123,   123,
     121,   248,   248,   207,    69,    70,   143,    69,    70,   143,
     142,   139,   242,   178,   178,   123,   178,    56,   123,   249,
     141,   141,   140,   242,   142,   129,   141,   140,   143,   225,
     232,   191,   225,   139,   123,   128,   121,   128,   207,   179,
     128,   128,   179,    70,   143,    69,   143,   121,   248,   248,
     248,   248,    69,    70,   143,   242,   123,   123,   242,   123,
     122,   242,   123,   249,   179,   143,   265,   189,   142,   176,
     239,   225,   225,   179,   121,   128,   128,   248,   248,    70,
     143,    69,   143,    70,   143,    69,   143,   248,   248,   242,
     242,   242,   178,   242,   123,   178,   141,   143,   239,   241,
     143,   143,   248,   248,   248,   248,    70,   143,    69,   143,
      64,   123,   242,   123,   129,   143,   143,   143,   143,   143,
     248,   248,   242,   141,   242,   143,   239,   143,   143
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
      case 145: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3800 "type.ec"
	break;
      case 147: /* "type" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3809 "type.ec"
	break;
      case 148: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3818 "type.ec"
	break;
      case 149: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3827 "type.ec"
	break;
      case 150: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3836 "type.ec"
	break;
      case 151: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3845 "type.ec"
	break;
      case 152: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3854 "type.ec"
	break;
      case 153: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3863 "type.ec"
	break;
      case 154: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 166 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3872 "type.ec"
	break;
      case 155: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3881 "type.ec"
	break;
      case 157: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3890 "type.ec"
	break;
      case 159: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3899 "type.ec"
	break;
      case 161: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3908 "type.ec"
	break;
      case 163: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3917 "type.ec"
	break;
      case 164: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3926 "type.ec"
	break;
      case 165: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3935 "type.ec"
	break;
      case 166: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3944 "type.ec"
	break;
      case 168: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3953 "type.ec"
	break;
      case 169: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3962 "type.ec"
	break;
      case 170: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3971 "type.ec"
	break;
      case 171: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3980 "type.ec"
	break;
      case 172: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3989 "type.ec"
	break;
      case 173: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3998 "type.ec"
	break;
      case 174: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4007 "type.ec"
	break;
      case 175: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4016 "type.ec"
	break;
      case 176: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4025 "type.ec"
	break;
      case 178: /* "expression" */

/* Line 1009 of yacc.c  */
#line 203 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 4034 "type.ec"
	break;
      case 179: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 168 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4043 "type.ec"
	break;
      case 180: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 189 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4052 "type.ec"
	break;
      case 181: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4061 "type.ec"
	break;
      case 182: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4070 "type.ec"
	break;
      case 183: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4079 "type.ec"
	break;
      case 184: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4088 "type.ec"
	break;
      case 188: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4097 "type.ec"
	break;
      case 189: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 184 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4106 "type.ec"
	break;
      case 190: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4115 "type.ec"
	break;
      case 191: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 220 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4124 "type.ec"
	break;
      case 193: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4133 "type.ec"
	break;
      case 194: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 221 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4142 "type.ec"
	break;
      case 195: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 222 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4151 "type.ec"
	break;
      case 196: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4160 "type.ec"
	break;
      case 197: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4169 "type.ec"
	break;
      case 198: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4178 "type.ec"
	break;
      case 199: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4187 "type.ec"
	break;
      case 200: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4196 "type.ec"
	break;
      case 201: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4205 "type.ec"
	break;
      case 202: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4214 "type.ec"
	break;
      case 203: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4223 "type.ec"
	break;
      case 204: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4232 "type.ec"
	break;
      case 205: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4241 "type.ec"
	break;
      case 206: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4250 "type.ec"
	break;
      case 209: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4259 "type.ec"
	break;
      case 210: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4268 "type.ec"
	break;
      case 211: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4277 "type.ec"
	break;
      case 212: /* "property" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4286 "type.ec"
	break;
      case 213: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 199 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4295 "type.ec"
	break;
      case 214: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4304 "type.ec"
	break;
      case 215: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4313 "type.ec"
	break;
      case 216: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4322 "type.ec"
	break;
      case 217: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4331 "type.ec"
	break;
      case 218: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4340 "type.ec"
	break;
      case 219: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 177 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4349 "type.ec"
	break;
      case 220: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4358 "type.ec"
	break;
      case 221: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4367 "type.ec"
	break;
      case 222: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4376 "type.ec"
	break;
      case 223: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4385 "type.ec"
	break;
      case 224: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4394 "type.ec"
	break;
      case 225: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4403 "type.ec"
	break;
      case 226: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4412 "type.ec"
	break;
      case 227: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4421 "type.ec"
	break;
      case 228: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4430 "type.ec"
	break;
      case 229: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4439 "type.ec"
	break;
      case 230: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 178 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4448 "type.ec"
	break;
      case 231: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4457 "type.ec"
	break;
      case 232: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 167 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4466 "type.ec"
	break;
      case 233: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4475 "type.ec"
	break;
      case 234: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4484 "type.ec"
	break;
      case 235: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4493 "type.ec"
	break;
      case 236: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4502 "type.ec"
	break;
      case 237: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4511 "type.ec"
	break;
      case 238: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 185 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4520 "type.ec"
	break;
      case 239: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4529 "type.ec"
	break;
      case 240: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4538 "type.ec"
	break;
      case 241: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4547 "type.ec"
	break;
      case 242: /* "statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4556 "type.ec"
	break;
      case 243: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4565 "type.ec"
	break;
      case 244: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4574 "type.ec"
	break;
      case 245: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4583 "type.ec"
	break;
      case 246: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4592 "type.ec"
	break;
      case 247: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4601 "type.ec"
	break;
      case 248: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4610 "type.ec"
	break;
      case 249: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4619 "type.ec"
	break;
      case 250: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4628 "type.ec"
	break;
      case 251: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4637 "type.ec"
	break;
      case 252: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4646 "type.ec"
	break;
      case 253: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4655 "type.ec"
	break;
      case 254: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4664 "type.ec"
	break;
      case 256: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 191 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4673 "type.ec"
	break;
      case 258: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4682 "type.ec"
	break;
      case 259: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4691 "type.ec"
	break;
      case 260: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 195 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4700 "type.ec"
	break;
      case 261: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 193 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4709 "type.ec"
	break;
      case 262: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4718 "type.ec"
	break;
      case 263: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4727 "type.ec"
	break;
      case 264: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4736 "type.ec"
	break;
      case 265: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4745 "type.ec"
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
#line 230 "type.y"
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
#line 248 "type.y"
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
#line 272 "type.y"
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
#line 311 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 313 "type.y"
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
#line 339 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 344 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 346 "type.y"
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
#line 363 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 365 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 370 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 375 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 380 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 382 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 387 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 393 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 398 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 400 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 402 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 403 "type.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 405 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 406 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 407 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 409 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 411 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 412 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 413 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 414 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 416 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 418 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 424 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 425 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 426 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
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
#line 441 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 442 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 447 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 476 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 477 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 478 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 479 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 483 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 484 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 485 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 487 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 488 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 490 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 491 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 505 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 506 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 507 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 508 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 509 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 510 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 511 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 516 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 521 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 522 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 528 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 529 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 534 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 535 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 540 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 548 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 549 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 550 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 556 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 557 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 562 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 572 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 577 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 582 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 587 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 592 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 593 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 597 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 598 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 599 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 600 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 601 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 602 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 603 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 604 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 605 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 606 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 607 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 611 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 612 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 627 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 638 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 639 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 640 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 651 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 652 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 653 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 665 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 666 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 667 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 679 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 680 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 684 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 685 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 691 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 693 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 701 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 709 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 710 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 711 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 712 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 713 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 714 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 715 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 716 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 722 "type.y"
    {
         _DeclClass((yyvsp[(1) - (4)].id)._class, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 730 "type.y"
    {
         _DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 738 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 739 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 743 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 744 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 749 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 750 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 751 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 752 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 757 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 758 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 759 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 763 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 764 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 765 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 770 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 771 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 772 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 773 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 778 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 779 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 783 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 784 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 785 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 789 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 790 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 794 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 798 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 799 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 800 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 805 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 806 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 807 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 811 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 812 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 813 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 817 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 818 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 826 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 827 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 828 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 846 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { _DeclClass((yyvsp[(3) - (4)].id)._class, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 879 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 881 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 903 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 910 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
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
#line 938 "type.y"
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
#line 952 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 953 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 957 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 958 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 962 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 967 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 971 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 972 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 977 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 979 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 981 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 985 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 988 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 990 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 994 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 999 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1001 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1005 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1007 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1010 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1012 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1016 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1025 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1027 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1029 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1034 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1041 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1060 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1062 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1075 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1083 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1089 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1091 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1097 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1099 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1101 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1103 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1108 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1123 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1125 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1129 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1131 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1132 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1182 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1186 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1191 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1193 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1195 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1197 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1199 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1205 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1208 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1210 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1212 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1222 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1224 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1226 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1233 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1240 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1241 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1243 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1248 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1252 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1253 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1254 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1255 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1264 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1269 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1270 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1271 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1272 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1309 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1310 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1314 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1315 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1319 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1320 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1325 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1327 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1329 "type.y"
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
#line 1345 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1347 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1369 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1371 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1385 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1387 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1389 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1393 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1394 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 440:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 441:

/* Line 1464 of yacc.c  */
#line 1399 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 442:

/* Line 1464 of yacc.c  */
#line 1402 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 443:

/* Line 1464 of yacc.c  */
#line 1406 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1407 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1408 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1412 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1417 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1425 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1429 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1430 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1434 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1435 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1436 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1440 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1441 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1442 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1443 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1446 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1447 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1451 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1452 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1453 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1459 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1464 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1466 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1471 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1473 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1498 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1500 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1502 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1509 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1511 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1515 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1517 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1519 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1521 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1529 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1531 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1536 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1540 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1541 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1546 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1548 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1553 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1557 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1558 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1559 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1560 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1562 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1567 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1572 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1573 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8420 "type.ec"
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
#line 1576 "type.y"


