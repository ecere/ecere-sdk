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
     RESTRICT = 371
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
#line 299 "type.ec"
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
#line 324 "type.ec"

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
#define YYFINAL  98
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8880

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  142
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  511
/* YYNRULES -- Number of states.  */
#define YYNSTATES  878

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
       2,     2,     2,   131,     2,     2,   123,   133,   128,     2,
     120,   121,   117,   129,   127,   130,   124,   132,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   137,   139,
     118,   138,   119,   136,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   125,     2,   126,   134,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   140,   135,   141,   122,     2,     2,     2,
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
       0,     0,     3,     6,     9,    12,    14,    17,    19,    21,
      26,    31,    34,    36,    40,    45,    49,    52,    54,    56,
      60,    62,    64,    66,    68,    71,    76,    79,    86,    92,
      99,   105,   113,   120,   128,   135,   137,   139,   144,   148,
     153,   157,   160,   164,   167,   170,   172,   174,   179,   183,
     188,   192,   195,   199,   202,   205,   207,   209,   213,   217,
     220,   223,   226,   231,   234,   239,   244,   247,   252,   254,
     256,   258,   260,   262,   264,   266,   268,   270,   272,   274,
     276,   281,   283,   287,   291,   295,   297,   301,   305,   307,
     311,   315,   318,   320,   323,   327,   331,   335,   337,   341,
     345,   347,   351,   353,   357,   359,   363,   365,   369,   371,
     375,   377,   383,   385,   389,   393,   395,   397,   399,   401,
     403,   405,   407,   409,   411,   413,   415,   417,   421,   423,
     426,   430,   433,   439,   441,   444,   446,   449,   451,   454,
     456,   459,   461,   464,   466,   469,   471,   474,   476,   479,
     481,   484,   486,   489,   491,   494,   496,   499,   501,   504,
     506,   509,   511,   514,   516,   519,   521,   524,   526,   529,
     531,   534,   536,   539,   541,   543,   545,   548,   550,   553,
     555,   558,   560,   563,   568,   574,   576,   579,   581,   584,
     586,   589,   591,   594,   596,   599,   601,   604,   609,   615,
     617,   621,   623,   627,   629,   631,   633,   635,   637,   639,
     641,   643,   645,   647,   649,   651,   653,   655,   657,   659,
     661,   666,   668,   671,   675,   682,   688,   690,   692,   694,
     696,   698,   700,   702,   704,   706,   708,   710,   712,   714,
     716,   718,   720,   722,   724,   726,   728,   730,   732,   737,
     742,   747,   749,   751,   753,   755,   757,   759,   761,   763,
     765,   767,   769,   771,   773,   775,   777,   779,   781,   783,
     785,   787,   789,   794,   799,   804,   806,   812,   817,   822,
     826,   832,   839,   845,   851,   856,   863,   866,   869,   873,
     877,   879,   882,   884,   887,   889,   891,   893,   897,   901,
     905,   909,   911,   915,   917,   919,   921,   924,   928,   930,
     934,   944,   954,   962,   970,   976,   987,   998,  1007,  1016,
    1023,  1032,  1041,  1048,  1055,  1060,  1070,  1080,  1088,  1096,
    1102,  1106,  1109,  1112,  1115,  1117,  1120,  1122,  1124,  1126,
    1130,  1132,  1135,  1138,  1142,  1148,  1151,  1154,  1159,  1165,
    1173,  1181,  1187,  1189,  1193,  1195,  1199,  1203,  1206,  1210,
    1214,  1218,  1223,  1228,  1231,  1235,  1239,  1244,  1248,  1251,
    1255,  1259,  1264,  1266,  1268,  1271,  1274,  1277,  1281,  1283,
    1285,  1288,  1291,  1294,  1298,  1300,  1303,  1307,  1310,  1312,
    1316,  1321,  1325,  1330,  1332,  1335,  1338,  1342,  1346,  1349,
    1353,  1357,  1360,  1362,  1364,  1367,  1370,  1372,  1375,  1378,
    1382,  1386,  1388,  1391,  1393,  1396,  1399,  1403,  1405,  1409,
    1411,  1415,  1418,  1421,  1424,  1428,  1430,  1432,  1434,  1438,
    1440,  1443,  1445,  1448,  1450,  1454,  1459,  1461,  1463,  1465,
    1469,  1471,  1473,  1475,  1477,  1479,  1481,  1485,  1490,  1494,
    1496,  1499,  1501,  1504,  1507,  1509,  1511,  1514,  1516,  1519,
    1523,  1525,  1528,  1534,  1542,  1548,  1554,  1562,  1569,  1577,
    1582,  1588,  1593,  1597,  1600,  1603,  1606,  1610,  1612,  1618,
    1623,  1629,  1634,  1639,  1643,  1648,  1652,  1656,  1659,  1662,
    1665,  1668,  1671,  1674,  1677,  1680,  1683,  1687,  1689,  1691,
    1695,  1698,  1700,  1702,  1705,  1708,  1710,  1713,  1715,  1717,
    1720,  1722
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     266,     0,    -1,   152,   117,    -1,   152,   118,    -1,   152,
       1,    -1,   147,    -1,   152,   152,    -1,    28,    -1,   146,
      -1,   146,   118,   207,   119,    -1,   146,   118,   207,    11,
      -1,   184,   226,    -1,   226,    -1,   184,   120,   121,    -1,
     122,   184,   120,   121,    -1,    78,   184,   226,    -1,    78,
     226,    -1,     3,    -1,   154,    -1,   120,   178,   121,    -1,
     152,    -1,   256,    -1,     4,    -1,   253,    -1,   123,   253,
      -1,   123,   253,   124,   253,    -1,   120,   121,    -1,    71,
     184,   223,   125,   179,   126,    -1,    71,   184,   125,   179,
     126,    -1,   102,   184,   223,   125,   179,   126,    -1,   102,
     184,   125,   179,   126,    -1,    72,   179,   187,   223,   125,
     179,   126,    -1,    72,   179,   187,   125,   179,   126,    -1,
     103,   179,   187,   223,   125,   179,   126,    -1,   103,   179,
     187,   125,   179,   126,    -1,     1,    -1,   153,    -1,   155,
     125,   178,   126,    -1,   155,   120,   121,    -1,   155,   120,
     158,   121,    -1,   155,   124,   152,    -1,   155,   152,    -1,
     155,     7,   152,    -1,   155,     8,    -1,   155,     9,    -1,
     257,    -1,   154,    -1,   157,   125,   178,   126,    -1,   157,
     120,   121,    -1,   157,   120,   158,   121,    -1,   157,   124,
     152,    -1,   157,   152,    -1,   157,     7,   152,    -1,   157,
       8,    -1,   157,     9,    -1,   176,    -1,   156,    -1,   158,
     127,   176,    -1,   158,   127,   156,    -1,     8,   160,    -1,
       9,   160,    -1,   162,   163,    -1,     6,   120,   160,   121,
      -1,     6,   161,    -1,     6,   120,   238,   121,    -1,   109,
     120,   160,   121,    -1,   109,   161,    -1,   109,   120,   238,
     121,    -1,   159,    -1,   155,    -1,   159,    -1,   157,    -1,
     128,    -1,   117,    -1,   129,    -1,   130,    -1,   122,    -1,
     131,    -1,    73,    -1,   160,    -1,   120,   237,   121,   163,
      -1,   163,    -1,   164,   117,   163,    -1,   164,   132,   163,
      -1,   164,   133,   163,    -1,   164,    -1,   165,   129,   164,
      -1,   165,   130,   164,    -1,   165,    -1,   166,    10,   165,
      -1,   166,    11,   165,    -1,   168,   118,    -1,   166,    -1,
     167,   166,    -1,   168,   119,   166,    -1,   168,    12,   166,
      -1,   168,    13,   166,    -1,   168,    -1,   169,    14,   168,
      -1,   169,    15,   168,    -1,   169,    -1,   170,   128,   169,
      -1,   170,    -1,   171,   134,   170,    -1,   171,    -1,   172,
     135,   171,    -1,   172,    -1,   173,    16,   172,    -1,   173,
      -1,   174,    17,   173,    -1,   174,    -1,   174,   136,   178,
     137,   175,    -1,   175,    -1,   160,   177,   176,    -1,   160,
     177,   156,    -1,   138,    -1,    18,    -1,    19,    -1,    20,
      -1,    21,    -1,    22,    -1,    23,    -1,    24,    -1,    25,
      -1,    26,    -1,    27,    -1,   176,    -1,   178,   127,   176,
      -1,   175,    -1,   183,   139,    -1,   183,   188,   139,    -1,
     254,   139,    -1,    77,   152,   138,   179,   139,    -1,   198,
      -1,   181,   198,    -1,   199,    -1,   181,   199,    -1,   217,
      -1,   181,   217,    -1,   201,    -1,   181,   201,    -1,   198,
      -1,   182,   198,    -1,   199,    -1,   182,   199,    -1,   143,
      -1,   182,   143,    -1,   217,    -1,   182,   217,    -1,   201,
      -1,   182,   201,    -1,   190,    -1,   183,   190,    -1,   198,
      -1,   183,   198,    -1,   199,    -1,   183,   199,    -1,   217,
      -1,   183,   217,    -1,   201,    -1,   183,   201,    -1,   190,
      -1,   184,   190,    -1,   198,    -1,   184,   198,    -1,   199,
      -1,   184,   199,    -1,   143,    -1,   184,   143,    -1,   201,
      -1,   184,   201,    -1,   217,    -1,   184,   217,    -1,   184,
      -1,   144,    -1,   190,    -1,   186,   190,    -1,   198,    -1,
     186,   198,    -1,   200,    -1,   186,   200,    -1,   152,    -1,
     186,   152,    -1,   152,   118,   207,   119,    -1,   186,   152,
     118,   207,   119,    -1,   190,    -1,   187,   190,    -1,   198,
      -1,   187,   198,    -1,   200,    -1,   187,   200,    -1,   201,
      -1,   187,   201,    -1,   217,    -1,   187,   217,    -1,   152,
      -1,   187,   152,    -1,   152,   118,   207,   119,    -1,   187,
     152,   118,   207,   119,    -1,   189,    -1,   188,   127,   189,
      -1,   224,    -1,   224,   138,   239,    -1,    29,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,    74,    -1,    75,
      -1,   196,    -1,    79,    -1,   110,    -1,   111,    -1,     3,
      -1,    28,    -1,    75,    -1,    74,    -1,    44,    -1,   193,
      -1,   193,   120,   178,   121,    -1,   194,    -1,   195,   194,
      -1,   195,   127,   194,    -1,   192,   120,   120,   195,   121,
     121,    -1,   192,   120,   120,   121,   121,    -1,   191,    -1,
      44,    -1,    45,    -1,   197,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
      85,    -1,   113,    -1,   112,    -1,   202,    -1,   216,    -1,
     145,    -1,    87,   120,   176,   121,    -1,   100,   120,   145,
     121,    -1,   100,   120,   152,   121,    -1,    66,    -1,    82,
      -1,    83,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   113,
      -1,   112,    -1,   202,    -1,   216,    -1,   147,    -1,    87,
     120,   176,   121,    -1,   100,   120,   145,   121,    -1,   100,
     120,   152,   121,    -1,    66,    -1,   208,   152,   140,   209,
     141,    -1,   208,   140,   209,   141,    -1,   208,   152,   140,
     141,    -1,   208,   140,   141,    -1,   208,   146,   140,   209,
     141,    -1,   208,   191,   152,   140,   209,   141,    -1,   208,
     191,   140,   209,   141,    -1,   208,   191,   152,   140,   141,
      -1,   208,   191,   140,   141,    -1,   208,   191,   147,   140,
     209,   141,    -1,   208,   152,    -1,   208,   147,    -1,   208,
     191,   152,    -1,   208,   191,   147,    -1,   184,    -1,   184,
     222,    -1,   184,    -1,   184,   222,    -1,   166,    -1,   205,
      -1,   204,    -1,   152,   138,   205,    -1,   152,   138,   204,
      -1,   203,   138,   205,    -1,   203,   138,   204,    -1,   206,
      -1,   207,   127,   206,    -1,    48,    -1,    49,    -1,   213,
      -1,   209,   213,    -1,   155,   138,   240,    -1,   210,    -1,
     211,   127,   210,    -1,    68,   186,   152,   140,    69,   248,
      70,   248,   141,    -1,    68,   186,   152,   140,    70,   248,
      69,   248,   141,    -1,    68,   186,   152,   140,    69,   248,
     141,    -1,    68,   186,   152,   140,    70,   248,   141,    -1,
      68,   186,   152,   140,   141,    -1,    68,   186,   222,   152,
     140,    69,   248,    70,   248,   141,    -1,    68,   186,   222,
     152,   140,    70,   248,    69,   248,   141,    -1,    68,   186,
     222,   152,   140,    69,   248,   141,    -1,    68,   186,   222,
     152,   140,    70,   248,   141,    -1,    68,   186,   222,   152,
     140,   141,    -1,    68,   186,   140,    69,   248,    70,   248,
     141,    -1,    68,   186,   140,    70,   248,    69,   248,   141,
      -1,    68,   186,   140,    69,   248,   141,    -1,    68,   186,
     140,    70,   248,   141,    -1,    68,   186,   140,   141,    -1,
      68,   186,   222,   140,    69,   248,    70,   248,   141,    -1,
      68,   186,   222,   140,    70,   248,    69,   248,   141,    -1,
      68,   186,   222,   140,    69,   248,   141,    -1,    68,   186,
     222,   140,    70,   248,   141,    -1,    68,   186,   222,   140,
     141,    -1,   184,   214,   139,    -1,   184,   139,    -1,   256,
     139,    -1,   255,   139,    -1,   258,    -1,   211,   139,    -1,
     212,    -1,   139,    -1,   215,    -1,   214,   127,   215,    -1,
     230,    -1,   230,   196,    -1,   137,   179,    -1,   230,   137,
     179,    -1,   230,   137,   179,   137,   179,    -1,    50,   152,
      -1,    50,   147,    -1,    50,   140,   218,   141,    -1,    50,
     152,   140,   218,   141,    -1,    50,   152,   140,   218,   139,
     209,   141,    -1,    50,   147,   140,   218,   139,   209,   141,
      -1,    50,   147,   140,   218,   141,    -1,   219,    -1,   218,
     127,   219,    -1,   152,    -1,   152,   138,   179,    -1,   120,
     222,   121,    -1,   125,   126,    -1,   125,   179,   126,    -1,
     125,   145,   126,    -1,   220,   125,   126,    -1,   220,   125,
     179,   126,    -1,   220,   125,   145,   126,    -1,   120,   121,
      -1,   120,   233,   121,    -1,   220,   120,   121,    -1,   220,
     120,   233,   121,    -1,   120,   223,   121,    -1,   120,   121,
      -1,   120,   233,   121,    -1,   221,   120,   121,    -1,   221,
     120,   233,   121,    -1,   232,    -1,   220,    -1,   232,   220,
      -1,   191,   232,    -1,   191,   220,    -1,   191,   232,   220,
      -1,   232,    -1,   221,    -1,   232,   221,    -1,   191,   232,
      -1,   191,   221,    -1,   191,   232,   221,    -1,   229,    -1,
     232,   229,    -1,   191,   232,   229,    -1,   224,   191,    -1,
     152,    -1,   120,   224,   121,    -1,   225,   125,   179,   126,
      -1,   225,   125,   126,    -1,   225,   125,   145,   126,    -1,
     228,    -1,   232,   228,    -1,   191,   228,    -1,   191,   232,
     228,    -1,   232,   191,   228,    -1,   225,   120,    -1,   227,
     233,   121,    -1,   227,   236,   121,    -1,   227,   121,    -1,
     228,    -1,   225,    -1,   191,   228,    -1,   191,   225,    -1,
     225,    -1,   232,   225,    -1,   191,   225,    -1,   191,   232,
     225,    -1,   232,   191,   225,    -1,   198,    -1,   231,   198,
      -1,   117,    -1,   117,   231,    -1,   117,   232,    -1,   117,
     231,   232,    -1,   234,    -1,   234,   127,    51,    -1,   235,
      -1,   234,   127,   235,    -1,   184,   224,    -1,   184,   222,
      -1,   184,   128,    -1,   184,   128,   224,    -1,   185,    -1,
      65,    -1,   152,    -1,   236,   127,   152,    -1,   181,    -1,
     181,   222,    -1,   182,    -1,   182,   222,    -1,   176,    -1,
     140,   241,   141,    -1,   140,   241,   127,   141,    -1,   175,
      -1,   156,    -1,   239,    -1,   241,   127,   239,    -1,   243,
      -1,   248,    -1,   249,    -1,   250,    -1,   251,    -1,   252,
      -1,   152,   137,   242,    -1,    52,   179,   137,   242,    -1,
      53,   137,   242,    -1,   180,    -1,   244,   180,    -1,   242,
      -1,   245,   242,    -1,   245,   180,    -1,   245,    -1,   244,
      -1,   244,   245,    -1,   140,    -1,   140,   141,    -1,   247,
     246,   141,    -1,   139,    -1,   178,   139,    -1,    54,   120,
     178,   121,   242,    -1,    54,   120,   178,   121,   242,    64,
     242,    -1,    55,   120,   178,   121,   242,    -1,    56,   120,
     178,   121,   242,    -1,    57,   242,    56,   120,   178,   121,
     139,    -1,    58,   120,   249,   249,   121,   242,    -1,    58,
     120,   249,   249,   178,   121,   242,    -1,    56,   120,   121,
     242,    -1,    58,   120,   249,   121,   242,    -1,    58,   120,
     121,   242,    -1,    59,   152,   139,    -1,    60,   139,    -1,
      61,   139,    -1,    62,   139,    -1,    62,   178,   139,    -1,
       5,    -1,   183,   152,   140,   265,   141,    -1,   183,   152,
     140,   141,    -1,   184,   152,   140,   265,   141,    -1,   184,
     152,   140,   141,    -1,   145,   140,   265,   141,    -1,   145,
     140,   141,    -1,   152,   140,   265,   141,    -1,   152,   140,
     141,    -1,   140,   265,   141,    -1,   140,   141,    -1,   148,
     248,    -1,   151,   248,    -1,   151,   139,    -1,   149,   248,
      -1,   150,   248,    -1,   183,   226,    -1,   183,   230,    -1,
     259,   248,    -1,   155,   138,   240,    -1,   240,    -1,   261,
      -1,   262,   127,   261,    -1,   262,   139,    -1,   263,    -1,
     260,    -1,   264,   263,    -1,   264,   260,    -1,   139,    -1,
     264,   139,    -1,   264,    -1,   262,    -1,   264,   262,    -1,
     235,    -1,   235,   137,   179,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   226,   226,   244,   278,   328,   329,   356,   360,   361,
     362,   379,   381,   386,   391,   396,   398,   403,   408,   409,
     414,   416,   418,   420,   422,   423,   424,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   439,   440,   441,   442,
     443,   444,   457,   458,   459,   463,   468,   469,   470,   471,
     472,   473,   486,   487,   488,   492,   493,   494,   495,   499,
     500,   501,   502,   503,   504,   505,   506,   507,   511,   512,
     516,   517,   521,   522,   523,   524,   525,   526,   527,   531,
     532,   536,   537,   538,   539,   543,   544,   545,   549,   550,
     551,   555,   563,   564,   565,   566,   567,   571,   572,   573,
     577,   578,   582,   583,   587,   588,   592,   593,   597,   598,
     602,   603,   607,   608,   609,   613,   614,   615,   616,   617,
     618,   619,   620,   621,   622,   623,   627,   628,   632,   636,
     637,   638,   639,   643,   644,   645,   646,   647,   648,   649,
     650,   654,   655,   656,   657,   658,   659,   660,   661,   662,
     663,   667,   668,   669,   670,   671,   672,   673,   674,   675,
     676,   680,   681,   682,   683,   684,   685,   686,   687,   688,
     689,   690,   691,   695,   696,   700,   701,   702,   703,   704,
     705,   706,   707,   708,   726,   743,   744,   745,   746,   747,
     748,   749,   750,   751,   752,   753,   754,   755,   773,   790,
     791,   795,   796,   800,   801,   802,   803,   804,   808,   809,
     810,   814,   815,   816,   821,   822,   823,   824,   825,   829,
     830,   834,   835,   836,   840,   841,   845,   849,   850,   851,
     856,   857,   858,   859,   860,   861,   862,   863,   864,   865,
     866,   867,   868,   869,   870,   871,   872,   873,   874,   875,
     876,   877,   878,   879,   883,   884,   885,   886,   887,   888,
     889,   890,   891,   892,   893,   894,   895,   896,   897,   898,
     899,   900,   901,   902,   903,   904,   909,   910,   911,   912,
     913,   916,   917,   918,   919,   920,   925,   926,   929,   931,
     936,   937,   942,   943,   954,   958,   960,   961,   963,   964,
     988,  1003,  1004,  1008,  1009,  1013,  1014,  1018,  1022,  1023,
    1027,  1029,  1031,  1033,  1035,  1038,  1040,  1042,  1044,  1046,
    1049,  1051,  1053,  1055,  1057,  1060,  1062,  1064,  1066,  1068,
    1073,  1074,  1075,  1076,  1077,  1078,  1079,  1080,  1084,  1086,
    1091,  1093,  1095,  1097,  1099,  1104,  1105,  1109,  1111,  1112,
    1113,  1114,  1118,  1120,  1125,  1127,  1133,  1135,  1137,  1139,
    1141,  1143,  1145,  1147,  1149,  1151,  1153,  1158,  1160,  1162,
    1164,  1166,  1171,  1172,  1173,  1174,  1175,  1176,  1180,  1181,
    1182,  1183,  1184,  1185,  1231,  1232,  1234,  1236,  1241,  1243,
    1245,  1247,  1249,  1254,  1255,  1258,  1260,  1262,  1268,  1272,
    1274,  1276,  1281,  1282,  1283,  1285,  1290,  1291,  1292,  1293,
    1294,  1298,  1299,  1303,  1304,  1305,  1306,  1310,  1311,  1315,
    1316,  1320,  1321,  1322,  1323,  1324,  1335,  1360,  1361,  1365,
    1366,  1370,  1371,  1375,  1377,  1379,  1395,  1397,  1419,  1421,
    1426,  1427,  1428,  1429,  1430,  1431,  1435,  1437,  1439,  1444,
    1445,  1449,  1450,  1453,  1457,  1458,  1459,  1463,  1467,  1475,
    1480,  1481,  1485,  1486,  1487,  1491,  1492,  1493,  1494,  1496,
    1497,  1498,  1502,  1503,  1504,  1505,  1506,  1510,  1514,  1516,
    1521,  1523,  1548,  1550,  1552,  1554,  1559,  1561,  1565,  1567,
    1569,  1571,  1573,  1579,  1581,  1586,  1591,  1592,  1596,  1598,
    1603,  1608,  1609,  1610,  1611,  1612,  1613,  1617,  1618,  1619,
    1623,  1624
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
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "'*'", "'<'", "'>'",
  "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'+'",
  "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'", "'='", "';'",
  "'{'", "'}'", "$accept", "guess_type", "real_guess_type", "type",
  "base_strict_type", "strict_type", "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "identifier",
  "primary_expression", "simple_primary_expression", "postfix_expression",
  "anon_instantiation_expression", "simple_postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
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
     365,   366,   367,   368,   369,   370,   371,    42,    60,    62,
      40,    41,   126,    36,    46,    91,    93,    44,    38,    43,
      45,    33,    47,    37,    94,   124,    63,    58,    61,    59,
     123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   142,   143,   143,   144,   145,   145,   146,   147,   147,
     147,   148,   148,   149,   150,   151,   151,   152,   153,   153,
     154,   154,   154,   154,   154,   154,   154,   154,   154,   154,
     154,   154,   154,   154,   154,   154,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   156,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   158,   158,   158,   158,   159,
     159,   159,   159,   159,   159,   159,   159,   159,   160,   160,
     161,   161,   162,   162,   162,   162,   162,   162,   162,   163,
     163,   164,   164,   164,   164,   165,   165,   165,   166,   166,
     166,   167,   168,   168,   168,   168,   168,   169,   169,   169,
     170,   170,   171,   171,   172,   172,   173,   173,   174,   174,
     175,   175,   176,   176,   176,   177,   177,   177,   177,   177,
     177,   177,   177,   177,   177,   177,   178,   178,   179,   180,
     180,   180,   180,   181,   181,   181,   181,   181,   181,   181,
     181,   182,   182,   182,   182,   182,   182,   182,   182,   182,
     182,   183,   183,   183,   183,   183,   183,   183,   183,   183,
     183,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   184,   184,   185,   185,   186,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   189,   189,   190,   190,   190,   190,   190,   191,   191,
     191,   192,   192,   192,   193,   193,   193,   193,   193,   194,
     194,   195,   195,   195,   196,   196,   197,   198,   198,   198,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   202,   202,   202,   202,
     203,   203,   204,   204,   205,   206,   206,   206,   206,   206,
     206,   207,   207,   208,   208,   209,   209,   210,   211,   211,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     213,   213,   213,   213,   213,   213,   213,   213,   214,   214,
     215,   215,   215,   215,   215,   216,   216,   217,   217,   217,
     217,   217,   218,   218,   219,   219,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   221,   221,   221,
     221,   221,   222,   222,   222,   222,   222,   222,   223,   223,
     223,   223,   223,   223,   224,   224,   224,   224,   225,   225,
     225,   225,   225,   226,   226,   226,   226,   226,   227,   228,
     228,   228,   229,   229,   229,   229,   230,   230,   230,   230,
     230,   231,   231,   232,   232,   232,   232,   233,   233,   234,
     234,   235,   235,   235,   235,   235,   235,   236,   236,   237,
     237,   238,   238,   239,   239,   239,   240,   240,   241,   241,
     242,   242,   242,   242,   242,   242,   243,   243,   243,   244,
     244,   245,   245,   245,   246,   246,   246,   247,   248,   248,
     249,   249,   250,   250,   250,   251,   251,   251,   251,   251,
     251,   251,   252,   252,   252,   252,   252,   253,   254,   254,
     255,   255,   256,   256,   256,   256,   257,   257,   258,   258,
     258,   258,   258,   259,   259,   260,   261,   261,   262,   262,
     263,   264,   264,   264,   264,   264,   264,   265,   265,   265,
     266,   266
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     4,     2,     6,     5,     6,
       5,     7,     6,     7,     6,     1,     1,     4,     3,     4,
       3,     2,     3,     2,     2,     1,     1,     4,     3,     4,
       3,     2,     3,     2,     2,     1,     1,     3,     3,     2,
       2,     2,     4,     2,     4,     4,     2,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     2,     1,     2,     3,     3,     3,     1,     3,     3,
       1,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     5,     1,     3,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     1,     2,
       3,     2,     5,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     1,     1,     2,     1,     2,     1,
       2,     1,     2,     4,     5,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     4,     5,     1,
       3,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     2,     3,     6,     5,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     4,     1,     5,     4,     4,     3,
       5,     6,     5,     5,     4,     6,     2,     2,     3,     3,
       1,     2,     1,     2,     1,     1,     1,     3,     3,     3,
       3,     1,     3,     1,     1,     1,     2,     3,     1,     3,
       9,     9,     7,     7,     5,    10,    10,     8,     8,     6,
       8,     8,     6,     6,     4,     9,     9,     7,     7,     5,
       3,     2,     2,     2,     1,     2,     1,     1,     1,     3,
       1,     2,     2,     3,     5,     2,     2,     4,     5,     7,
       7,     5,     1,     3,     1,     3,     3,     2,     3,     3,
       3,     4,     4,     2,     3,     3,     4,     3,     2,     3,
       3,     4,     1,     1,     2,     2,     2,     3,     1,     1,
       2,     2,     2,     3,     1,     2,     3,     2,     1,     3,
       4,     3,     4,     1,     2,     2,     3,     3,     2,     3,
       3,     2,     1,     1,     2,     2,     1,     2,     2,     3,
       3,     1,     2,     1,     2,     2,     3,     1,     3,     1,
       3,     2,     2,     2,     3,     1,     1,     1,     3,     1,
       2,     1,     2,     1,     3,     4,     1,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     3,     4,     3,     1,
       2,     1,     2,     2,     1,     1,     2,     1,     2,     3,
       1,     2,     5,     7,     5,     5,     7,     6,     7,     4,
       5,     4,     3,     2,     2,     2,     3,     1,     5,     4,
       5,     4,     4,     3,     4,     3,     3,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     3,     1,     1,     3,
       2,     1,     1,     2,     2,     1,     2,     1,     1,     2,
       1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   203,   204,   205,   206,   207,   231,   232,
     233,   234,   235,   237,   240,   241,   238,   239,   227,   228,
     230,   236,   303,   304,     0,   426,   251,   208,   209,   211,
     252,   253,   242,     0,     0,   212,   213,   244,   243,   167,
     174,   247,     8,     5,     0,   173,   425,   161,   226,     0,
     210,   229,   163,   165,   169,   245,     0,   246,   171,   510,
       0,     0,   346,   345,     0,     0,     0,     4,     2,     3,
       6,   413,     0,     0,   423,   168,   388,   162,   226,   164,
     166,   170,   172,   373,   422,   421,   403,     0,   402,   384,
     372,     0,     0,     8,   287,   286,     0,     0,     1,   354,
       0,   352,     0,     0,    35,    22,   477,     0,     0,     0,
       0,     0,    78,     0,     0,     0,    73,     0,    76,     0,
      72,    74,    75,    77,     0,    20,    36,    18,    69,    68,
      79,     0,    81,    85,    88,    92,     0,    97,   100,   102,
     104,   106,   108,   110,   112,     0,    23,    21,     0,     0,
     247,    20,    79,   294,   292,     0,   296,   295,   301,     0,
     411,   414,   415,   363,     0,     0,     0,     0,   417,   419,
     357,     0,   128,     0,     0,   388,     0,   424,     0,   376,
     405,   404,   375,     0,     0,   387,   398,     0,   401,     0,
       0,     0,     0,   374,   385,     0,     0,     0,     0,     0,
     337,   279,     0,     0,     0,     0,    20,     0,     0,   226,
       0,   308,     0,   336,   305,     0,    12,   393,     0,     0,
      21,   334,     0,     0,     0,   289,   288,   511,     0,     0,
     347,     0,     0,     0,    46,    71,    70,    63,     0,    59,
      60,     0,     0,     0,     0,     0,     0,    66,    26,   126,
       0,   429,   133,   135,   139,   137,     0,    24,     0,     0,
       0,    43,    44,     0,     0,     0,    41,   116,   117,   118,
     119,   120,   121,   122,   123,   124,   125,   115,     0,    61,
       0,     0,     0,     0,     0,     0,     0,    93,     0,     0,
      91,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     248,   249,   250,     0,     0,   226,   293,   372,     0,    10,
       9,     0,   412,   416,   356,   389,   364,     0,   359,   358,
       0,   377,   386,   365,     0,   360,     0,     0,   391,     0,
       0,   399,   400,     0,   214,   215,   218,   217,   216,     0,
     219,   221,     0,   255,   256,   257,   258,   259,   261,   264,
     265,   262,   263,   254,   260,     0,   275,   266,     0,     0,
     268,   267,   271,   181,     0,   175,   177,   179,   269,     0,
     270,     0,    16,    73,     0,    20,     0,   457,     0,   488,
     491,   492,   490,   489,     0,     0,     0,   331,   388,   226,
       0,   338,   406,    11,   340,     0,   395,     0,   277,   306,
       0,   335,     0,   394,   333,   332,     0,   278,     0,   284,
       0,     0,     0,   355,   353,     0,   351,     0,   348,   145,
      20,     0,   431,   141,   143,   149,   147,     0,     0,    53,
      54,     0,     0,     0,    51,     0,     0,   226,   379,     0,
     378,   195,     0,   185,   187,   189,   191,   193,     0,     0,
       0,     0,     0,    19,     0,     0,   134,   136,   140,   138,
     430,     0,     0,   505,     0,   483,    69,   437,   436,     0,
     151,   153,   155,   159,   157,   497,    45,     0,   502,   498,
     508,   501,     0,     0,   485,     0,    42,    38,    56,     0,
      55,    40,     0,   114,   113,    82,    83,    84,    86,    87,
      89,    90,    95,    96,    94,    98,    99,   101,   103,   105,
     107,   109,     0,   292,   298,   297,   375,   300,   299,   302,
     418,   420,   366,   362,   361,   392,   390,   428,   225,     0,
       0,     0,   222,   346,   345,     0,     0,     0,     0,   182,
     176,   178,   180,     0,   286,     0,    15,   226,     0,   458,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   460,    20,     0,   449,     0,   451,   440,     0,
       0,     0,   441,   442,   443,   444,   445,     0,   307,    13,
     342,     0,   408,     0,     0,   330,     0,   341,     0,   407,
     396,   309,   397,   280,   276,   282,     0,   283,     0,     0,
       0,    62,   146,   142,   144,   150,   148,   432,    64,    52,
      48,     0,    50,     0,   368,     0,     0,     0,   382,   381,
       0,     0,   380,     0,     0,   196,   186,   188,   190,   192,
     194,     0,     0,     0,     0,     0,    65,    67,   127,    80,
      25,   487,     0,     0,   388,   152,   154,   156,   160,   158,
     493,   494,   495,     0,   500,   506,   504,   509,   503,   482,
     484,    39,     0,    37,     0,   293,     0,   224,   223,     0,
       0,     0,     0,     0,     0,   324,     0,     0,     0,     0,
     289,   288,    14,     0,     0,     0,     0,     0,     0,     0,
       0,   473,   474,   475,     0,     0,     0,   461,   129,   388,
       0,   199,   201,   450,     0,   453,   452,   459,   131,   481,
       0,   409,     0,   339,   406,     0,   343,   410,   285,   281,
     350,   349,    49,    47,   367,   369,    28,   383,   370,     0,
       0,     0,     0,     0,     0,    30,     0,     0,     0,   486,
     496,   499,    58,    57,   111,   220,   272,   273,   274,   183,
       0,     0,     0,     0,     0,   314,     0,     0,   329,     0,
       0,   448,     0,     0,     0,     0,     0,     0,     0,   472,
     476,     0,   446,     0,     0,   130,     0,   480,   408,     0,
       0,   407,     0,   371,    27,   197,    32,     0,     0,    29,
      34,     0,     0,   322,     0,   323,   184,     0,     0,     0,
       0,     0,     0,   319,   447,     0,     0,   469,     0,     0,
     471,     0,     0,     0,   479,     0,   200,     0,   433,   202,
     409,   410,   344,   198,    31,    33,     0,     0,     0,   312,
       0,   313,     0,   327,     0,   328,     0,     0,   462,   464,
     465,     0,   470,     0,     0,   132,   478,   438,     0,   320,
     321,     0,     0,     0,     0,     0,   317,     0,   318,     0,
       0,   467,     0,     0,   434,   310,   311,   325,   326,     0,
       0,   463,   466,   468,   435,   439,   315,   316
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    39,    40,   124,    42,    43,   202,   203,   204,   205,
     125,   126,   127,   128,   467,   235,   489,   129,   152,   237,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   249,   278,   564,   173,   705,   251,
     422,   469,   208,    46,   364,   442,   700,   701,    47,    48,
      49,   340,   341,   342,    50,    51,    52,    53,   445,    54,
      55,   155,   156,   157,   158,   159,    56,   210,   211,   212,
     213,   214,   390,   391,    57,    58,   100,   101,    83,   438,
     165,   439,   166,   215,   216,    87,   217,    89,   394,   161,
     218,   167,   168,   169,   191,   256,   427,   819,   475,   848,
     567,   568,   569,   570,   571,   378,   572,   573,   574,   575,
     576,   146,   577,   219,   147,   476,   221,   477,   478,   479,
     480,   481,   482,   483,    60
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -758
static const yytype_int16 yypact[] =
{
    8509,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,  -758,    35,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,   -78,   -67,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,   -48,  -758,   113,  6981,  -758,  -758,  -758,   -11,
    -758,  -758,  -758,  -758,  -758,  -758,   528,  -758,  -758,    36,
      98,   229,    88,   112,  6709,    65,  5886,  -758,  -758,  -758,
    -758,   665,  7082,  6419,  1127,  -758,   177,  -758,   168,  -758,
    -758,  -758,  -758,    75,  -758,   616,   329,  7955,  -758,  -758,
    1006,   119,  3350,   -33,  -758,   133,    77,  6709,  -758,   158,
     -58,  -758,   229,   229,  -758,  -758,  -758,  6770,  6843,  6843,
    8595,  6709,  -758,  8595,  6709,  6877,  -758,  6017,  -758,   294,
    -758,  -758,  -758,  -758,   219,    64,  -758,  -758,   710,  -758,
    1274,  6709,  -758,   240,   232,   318,  6709,   300,   419,   251,
     256,   272,   400,    10,  -758,   309,  -758,  -758,   361,    26,
     219,   169,  -758,   318,  5768,   323,  -758,  -758,  -758,   204,
    -758,   665,  -758,  -758,   782,   372,   897,   376,   380,  -758,
    -758,   143,  -758,   386,  1127,  -758,    25,   616,  1115,    75,
     329,  -758,  1006,  8049,  6452,  -758,  -758,  6529,  -758,   498,
     411,   -27,    61,    75,  -758,   339,  8681,  8237,  6366,  8595,
    -758,  -758,   381,   381,   381,   446,    51,   391,  5544,    25,
    3473,  -758,   -77,  -758,  -758,   329,  -758,  -758,  1115,   414,
     421,  -758,  5193,  3596,  3719,   410,   424,  -758,  6709,   229,
    -758,    99,   199,  6148,  -758,   830,  -758,  -758,  6562,  -758,
    -758,   177,  7278,  8767,  7376,  8767,  6148,  -758,  -758,  -758,
     239,  7763,  -758,  -758,  -758,  -758,   451,   453,  2074,  2655,
     229,  -758,  -758,  1821,   229,  6709,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  5023,  -758,
    6709,  6709,  6709,  6709,  6709,  6709,  6709,   318,  6709,  6709,
    -758,  6709,  6709,  6709,  6709,  6709,  6709,  6709,  6709,  6709,
    -758,  -758,  -758,  5886,  7180,   276,   437,   345,  5886,  -758,
    -758,  5886,  -758,  -758,  -758,  -758,  -758,  8423,  -758,  -758,
    1115,    75,  -758,  -758,   459,  -758,   225,   461,  -758,   242,
     463,  -758,  -758,   229,  -758,  -758,  -758,  -758,  -758,   476,
     481,  -758,   843,  -758,  -758,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,  -758,  -758,    65,  -758,  -758,   486,   488,
    -758,  -758,  -758,   511,  5431,  -758,  -758,  -758,  -758,  1240,
    -758,  8237,  -758,   665,  6279,   378,  8330,   489,  4826,  -758,
    -758,  -758,  -758,  -758,  5023,  1012,  6709,  -758,   174,    25,
     -68,  -758,   329,  -758,   -22,  1115,  -758,    61,  -758,  -758,
     863,  -758,    61,  -758,  -758,  -758,  3842,  -758,  3965,  -758,
    4088,  5193,  4211,  -758,  -758,  5193,  -758,  5193,  -758,  -758,
      51,   510,  7763,  -758,  -758,  -758,  -758,   512,   229,  -758,
    -758,  4989,   229,  6709,  -758,  7861,  6709,    24,   516,   507,
     517,   522,  7572,  -758,  -758,  -758,  -758,  -758,  6709,   518,
    7670,   520,   521,  -758,  6709,   229,  -758,  -758,  -758,  -758,
    -758,  6709,   294,  -758,  2796,  -758,   698,  -758,  -758,  8237,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,   381,  -758,  -758,
      -1,  -758,  2937,   508,  -758,   509,  -758,  -758,  -758,   302,
    -758,  -758,   465,  -758,  -758,  -758,  -758,  -758,   240,   240,
     232,   232,   318,   318,   318,   300,   300,   419,   251,   256,
     272,   400,   152,  7474,  -758,  -758,   345,  -758,  -758,  -758,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  6709,
     530,   435,  -758,  -758,  -758,  6709,    65,  5886,    52,   -32,
    -758,  -758,  -758,    76,  -758,    65,  -758,    25,   532,  -758,
    6709,   519,   537,   541,   545,  4916,   546,   229,   536,   538,
    5319,   229,  -758,    18,   110,  -758,  5656,  -758,  -758,  2232,
    2373,   533,  -758,  -758,  -758,  -758,  -758,   539,  -758,  -758,
    -758,  3078,   329,    61,   535,  -758,  6709,  -758,    61,   329,
    -758,  -758,  -758,  -758,  -758,  -758,  4334,  -758,  4457,  4580,
    4703,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,
    -758,   360,  -758,   468,  -758,   558,   559,   555,   516,   517,
    8143,  6709,   516,  5886,  6709,   565,  -758,  -758,  -758,  -758,
    -758,   560,   561,  6709,  6709,   563,  -758,  -758,  -758,  -758,
    -758,  -758,   548,  5023,   229,  -758,  -758,  -758,  -758,  -758,
    -758,  -758,  -758,  5023,  -758,  -758,  -758,    -1,  -758,  -758,
    -758,  -758,  5023,  -758,  6709,  -758,   398,  -758,  -758,   572,
     573,    46,   324,   381,   381,  -758,  5886,   196,   207,   557,
    -758,  -758,  -758,   574,  4916,  6709,  6709,  6602,   642,  5246,
     575,  -758,  -758,  -758,   297,   562,  4916,  -758,  -758,    79,
     298,  -758,   330,  -758,  2514,  -758,  -758,  -758,  -758,  -758,
     579,   329,    25,  -758,   577,  1115,   584,   329,  -758,  -758,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,   516,  -758,   595,
     597,   340,   603,  5886,  6709,  -758,   604,   610,  6709,  -758,
    -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,  -758,
     -23,   -29,   353,   381,   381,  -758,   381,   381,  -758,   246,
    4916,  -758,   412,   427,  4916,   431,   621,  4916,  5280,  -758,
    -758,  6709,  -758,  3219,  1127,  -758,  5062,  -758,   577,    61,
      61,   577,  6709,  -758,  -758,  -758,  -758,   358,   617,  -758,
    -758,   619,   381,  -758,   381,  -758,  -758,     7,   -14,    11,
      22,   381,   381,  -758,  -758,  4916,  4916,  -758,  4916,  6709,
    -758,  4916,  6693,   607,  -758,   601,  -758,  5062,  -758,  -758,
     577,   577,  -758,  -758,  -758,  -758,   606,   608,   381,  -758,
     381,  -758,   381,  -758,   381,  -758,    47,   186,   691,  -758,
    -758,   441,  -758,  4916,   452,  -758,  -758,  -758,   198,  -758,
    -758,   609,   615,   620,   624,   381,  -758,   381,  -758,  4916,
     629,  -758,  4916,  1779,  -758,  -758,  -758,  -758,  -758,   628,
     630,  -758,  -758,  -758,  -758,  -758,  -758,  -758
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -758,   332,  -758,   686,   714,   109,  -758,  -758,  -758,  -758,
       0,  -758,   387,   567,  -241,  -758,   341,   399,   193,   666,
    -758,  -120,   321,   327,   -41,  -758,   325,   490,   491,   492,
     496,   497,  -758,  1586,   -51,  -758,   383,   406,  -358,  -758,
    -758,  -368,   187,  -758,  -758,   542,  -758,    20,  1308,   961,
    -758,  -758,  -328,  -758,   403,  -758,  1162,  1225,  -179,  1235,
    -170,  -758,   220,   227,   487,  -519,  -180,   -93,   401,  -758,
    -758,  -152,  -758,   216,  -144,  1390,   525,   580,   -71,  -394,
     -30,  -160,   -40,   -42,  -185,  -758,   -39,   -59,   333,  -758,
     868,   -86,  -758,     4,  -758,  -758,   568,  -757,  -375,  -758,
     757,  -758,  -758,   235,  -758,  -758,  1161,  -648,  -758,  -758,
    -758,  -117,  -758,  -758,   252,  -758,  -758,  -758,   331,   162,
     335,   337,  -758,  -251,  -758
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -508
static const yytype_int16 yytable[] =
{
      44,   190,   257,    86,    59,    85,    88,   179,   485,   578,
     566,   279,   372,   145,   532,    84,   369,   367,   672,   193,
     565,     1,   488,   393,    63,   153,   368,   298,     1,     1,
      86,   194,    86,    88,   177,    88,   180,   493,     1,   181,
     794,   768,    64,   618,    70,    76,   622,   792,    86,     1,
     400,    88,   370,    65,     1,   830,    95,    29,   399,   584,
     847,    99,   401,     2,     1,   149,   151,     1,     1,   229,
      66,   585,   164,   368,   175,   368,    70,   828,   175,     1,
       1,   832,     1,   230,   449,    66,   676,   189,    35,    36,
     175,   834,   206,     2,   332,   287,   226,   324,    98,   370,
     333,   370,    99,    99,   731,     2,   875,   222,   677,    91,
     241,   321,   795,   241,    67,   586,     1,   855,   793,   194,
     812,   673,   674,   322,   306,    70,   653,   831,   266,   406,
     408,   410,    86,    62,   180,    88,    86,   181,   654,    88,
      86,    71,    71,    88,   435,   174,   299,   302,   829,    70,
     180,    70,   833,   181,   241,   696,    86,   752,   259,    88,
     495,   496,   497,   835,    70,    94,   392,   748,    68,    69,
     396,     1,     1,    97,   175,    61,   175,     1,   175,   403,
       1,   174,   175,    44,   369,   542,   546,    45,   856,    70,
     488,   259,   175,   675,   368,   183,   363,    76,   375,   241,
     184,   566,   566,   668,   259,   225,    70,   266,   388,   175,
     206,   703,   490,   642,   787,   309,   678,   224,   175,   773,
     370,   460,   206,   206,   206,   727,   229,   494,   102,    99,
      68,    69,     1,   420,   179,   434,   193,   454,   415,   195,
     416,    70,   241,   441,   241,   441,   420,   502,   503,   697,
     504,   455,   103,   154,   399,   857,   399,   130,   399,    45,
     486,   322,   153,   628,   491,   753,   754,   153,   740,   318,
     153,   628,   368,   223,    45,   615,   756,   757,    86,   454,
     368,    88,   631,   258,   650,    71,    68,    69,    72,   664,
     635,    68,    69,    73,    68,    69,   228,   242,   370,   106,
     244,   239,   240,   420,    44,   362,   370,   303,   420,   259,
     130,   151,   288,   289,   581,   801,   802,    44,   596,   598,
     175,   521,   599,   310,   600,   863,   229,   858,   285,   286,
     710,   311,    86,   527,   543,    88,   566,   755,   417,   864,
     418,   639,   334,    86,   220,   640,    88,   582,   758,   616,
     396,   523,   362,   589,   362,   534,   403,   280,   590,   258,
     453,   283,   284,   592,   539,   258,   454,   335,   525,   544,
      45,    76,   281,   282,   375,    70,   241,    75,   563,   294,
     490,     1,   258,   336,   371,   175,   376,   803,    70,   175,
     295,   130,   607,    71,     1,   175,   304,   175,   260,   261,
     262,    73,   175,   638,    27,    28,   206,   296,   206,    29,
     206,   206,   206,   337,   338,   206,   297,   206,   290,   291,
      70,   742,   241,   661,   454,   774,   421,   392,   609,   662,
     300,   130,   612,   292,   293,    44,   770,   775,   334,   451,
      35,    36,   625,   749,   399,   321,   399,   399,   399,   186,
     625,   311,  -388,  -388,   187,    70,   130,  -388,   130,   785,
     339,   308,   220,   335,   533,   304,   266,   311,   776,   644,
      73,   130,   796,   362,   220,   220,   220,   823,    94,   336,
     311,   722,   301,   665,   669,   311,    75,   662,  -388,  -388,
     513,    45,   130,   314,   234,   513,   153,   316,   154,    67,
     250,     1,   234,   227,    45,   180,   236,   317,   181,   337,
     338,   263,   319,   241,   236,   264,   265,   243,   259,   745,
     245,   377,   815,   514,    86,   454,   702,    88,   517,   384,
     515,     1,   331,   805,   729,   518,   671,   151,     1,   454,
      75,   711,   714,   679,   590,   681,   717,   175,   806,   592,
     411,   362,   808,   404,   454,   563,     2,   690,   454,   362,
     405,   695,   860,    70,   412,   419,   699,   130,   454,   563,
     563,   130,   461,   862,    75,  -291,    75,   462,   419,   454,
     522,   250,   153,   175,   175,   382,   377,   524,   175,   526,
     327,   663,   454,   330,   723,   454,   206,   528,   206,   206,
     206,   529,    27,    28,   498,   499,   535,    29,   536,    27,
      28,   743,   500,   501,    29,    68,    69,   505,   506,  -427,
      44,   250,    45,   151,   130,  -427,   130,   231,   232,   537,
     549,   601,   621,   608,   413,   153,   620,   435,    35,    36,
     623,   636,   637,   633,    70,    35,    36,   130,   492,   659,
     660,   667,    71,   682,   680,   174,   684,   685,   220,   207,
     220,   686,   220,   220,   220,   687,   689,   220,    92,   220,
     778,    70,   386,   781,   707,   691,   151,   692,   708,   724,
     725,   726,   512,   733,   563,   734,    41,   735,   738,   739,
      27,    28,   153,   746,   747,    29,   563,   759,   766,    70,
     771,     1,   187,    75,   563,   260,   261,   262,    75,    18,
      19,   760,   175,     1,   769,   175,   783,   260,   261,   262,
     777,   782,   130,   784,   154,   818,    35,    36,   130,   786,
     789,    41,    86,   151,   702,    88,   790,   820,   821,    27,
      28,   809,   846,   824,    29,   825,   845,   849,   130,   850,
     865,   148,   150,   130,   602,   859,   866,   250,    41,   171,
     563,   867,   130,   130,   563,   868,   818,   563,   872,   876,
      93,   877,   611,    41,   175,    35,    36,   207,   150,   175,
     175,   247,    71,    67,   507,     1,   508,   450,   509,   207,
     207,   207,   580,   510,   816,   511,    41,   587,   519,    41,
     713,   591,   651,   150,   704,   563,   563,    45,   563,   414,
     154,   563,   818,   656,   452,   741,   613,   657,   263,   658,
       0,     0,   264,   265,     0,   466,   466,     0,     0,     0,
     263,     0,     0,     1,   264,   265,   643,   428,   429,   430,
      41,     0,   617,   563,     0,    75,   334,     0,   220,     0,
     220,   220,   220,     0,   632,   130,  -388,  -388,     0,   563,
       0,  -388,   563,   154,   104,     0,     1,   105,   106,    41,
     326,   335,     0,   329,     0,     0,     0,   130,   130,   130,
     130,     0,   130,    41,     0,    41,     0,   336,     0,   130,
       0,     2,  -388,  -388,    41,     0,   150,   130,     0,    68,
      69,     0,  -388,  -388,     0,     0,     0,  -388,   150,   150,
     150,     0,   666,    90,     0,     0,     0,   337,   338,   150,
     154,     0,     0,     0,     0,     0,     0,     0,    41,     0,
      41,     0,   150,     0,   110,   111,     0,    41,     0,   162,
      90,     0,   178,   694,   150,   150,   182,     0,     0,     0,
     431,     0,     0,   130,   432,   433,   683,   130,     0,     0,
     130,   130,     0,     0,   530,   113,   114,   207,     0,   130,
     531,    27,    28,   207,     0,   207,    29,   207,   207,   207,
       0,     0,   207,   238,   207,     0,   119,     0,     0,   150,
      41,     0,   716,     0,   150,     0,     0,   150,   130,   130,
       0,   130,   130,    41,   130,   130,    78,    35,    36,     1,
     130,     0,     0,     0,     0,     1,     0,    96,   315,     0,
       0,     0,   307,     0,     0,     0,     0,   730,     0,   313,
     732,   466,     0,    78,     0,   176,   130,     0,     0,   736,
     737,     0,   178,     0,   320,     0,   185,     0,     0,   466,
       0,   192,   130,   209,     0,   130,   130,    41,     0,     0,
     150,     0,    41,     0,   150,     0,   178,     0,   762,   763,
     765,     0,     0,     0,     0,     0,   395,   397,     0,     0,
      27,    28,     0,     0,     0,    29,    27,    28,     0,     0,
       0,    29,   150,     0,   150,     0,   150,   150,   150,     0,
       0,   150,     0,   150,     0,     0,     0,     0,    41,     0,
     440,     0,   440,     0,     0,   305,    35,    36,     1,   307,
       0,    41,    35,    36,     0,     0,    72,   185,     0,    71,
       1,    73,   174,   579,     0,   176,     0,     0,   185,   192,
     788,     0,     0,   192,   791,     0,     0,     0,   466,     0,
     150,     0,     0,     0,     0,    41,     0,     0,   209,   176,
       0,     0,     0,   207,     0,   207,   207,   207,   150,   389,
       0,   209,   307,   516,     0,     0,     0,   813,     0,   402,
       0,     0,     0,   209,   209,   209,     0,     0,   822,    27,
      28,     0,   841,     0,    29,   844,     0,     0,     0,    41,
       0,    27,    28,   437,     0,   437,    29,    79,     0,     0,
       0,     0,   305,     0,     0,     0,     0,     0,     0,     0,
     466,     0,   670,   150,     0,    35,    36,     0,     0,     0,
       0,     0,   307,   160,     0,   174,     0,    35,    36,     0,
       0,   162,   178,     1,    71,     0,     0,   174,     0,     0,
       0,     0,    41,   178,     0,   150,   150,   583,     0,     0,
       0,     0,     0,     0,     0,   305,     0,   150,     2,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,   252,
      81,   192,   150,     0,   150,   150,   150,     0,     0,     0,
     307,     0,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,     0,   440,     0,   619,    41,     0,     0,   150,
     440,     0,   688,     0,    27,    28,    79,     0,   440,    29,
       0,     0,     0,   312,     0,   305,     0,   706,     0,     0,
     545,     0,   209,     0,     0,   547,     0,   395,     0,     0,
     466,     0,   253,     0,     0,     0,   176,     0,     0,     0,
      35,    36,   254,    77,     0,     0,   588,     0,   366,     0,
       0,     0,   150,   379,   380,   381,   383,   209,     0,   209,
      79,   209,   209,   209,     0,     0,   209,     0,   209,    80,
       0,   307,     0,   305,     0,     0,     0,     0,     0,    81,
     150,     0,     0,     0,     0,   423,   437,     0,     0,     0,
       0,     0,     0,   437,    79,   444,    79,   444,   423,     0,
       0,   437,   277,   456,     0,   320,     0,     0,     0,   150,
     471,   471,     0,     0,     0,     0,     0,     0,     0,     0,
     389,     0,     0,    80,   178,    82,     0,     0,     0,     0,
       0,   761,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,   715,   772,     0,     0,     0,     0,   424,   150,
       0,   706,    77,     0,     0,     0,     0,    80,   425,    80,
       0,   424,     0,     0,   305,     0,   457,    81,   446,    81,
     446,   425,     0,   472,   472,     0,   458,     0,     0,     0,
       0,     0,     0,   473,   473,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   365,     0,     0,   255,     0,     0,
       0,     0,     0,     0,     0,     0,    77,   804,     0,     0,
       0,   807,     0,     0,   810,     0,   541,   547,     0,     0,
       0,     0,     0,    79,     0,   160,   252,     0,    79,     0,
     471,     0,     0,     0,    82,   712,     0,     0,     0,     0,
      77,   443,    77,   443,     0,     0,     0,   209,     0,   209,
     209,   209,   838,   839,     0,   840,   470,   470,   842,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     779,     0,     0,     0,   603,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,    82,   253,
     861,    80,     0,   472,   627,     0,    81,     0,     0,   254,
       0,    81,   627,   473,     0,     0,   871,     0,     0,   873,
       0,     0,     0,   426,     0,     0,   471,     0,     0,     0,
       0,   646,    82,   447,    82,   447,   426,     0,   652,     0,
       0,   459,   178,     0,   471,     0,     0,   604,   474,   474,
       0,     0,     0,     0,     0,     0,     0,   605,     0,   172,
       0,     0,     0,   185,     0,     0,     0,     0,     0,     0,
       0,     0,   540,     0,     0,    79,   780,   629,     0,    77,
       0,     0,     0,   172,    77,   629,   470,     0,     0,   472,
       0,     0,     0,     0,   647,     0,     0,   172,     0,   473,
     172,     0,     0,     0,   648,     0,     0,   472,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   473,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   646,     0,
       0,   471,   471,     0,     0,   176,     0,     0,    80,     0,
       0,     0,     0,   471,     0,     0,     0,     0,    81,     0,
     626,     0,     0,     0,     0,     0,     0,     0,   626,     0,
       0,    82,     0,     0,   255,     0,    82,     0,   474,     0,
     172,     0,   470,   172,     0,     0,     0,   645,     0,     0,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
     470,   647,     0,     0,   472,   472,     0,     0,     0,     0,
       0,   648,     0,     0,   473,   473,   472,     2,     0,     0,
       0,     0,   606,     0,   172,     0,   473,     0,     0,     0,
       0,    77,   104,     0,     1,   105,   106,   107,     0,   108,
     109,     0,   630,     0,   750,   751,     0,     0,     0,     0,
     630,     0,     0,     0,   468,   468,     0,     0,     0,     2,
     110,   111,   112,     0,   474,     0,     0,     0,     0,   649,
       0,     0,     0,     0,     0,     0,   471,     0,     0,     0,
       0,     0,   474,     0,   645,     0,     0,   470,   470,     0,
       0,   113,   114,     0,     0,     0,     0,     0,   115,   470,
       0,     0,   110,   111,   112,     0,   116,     0,     0,   117,
       0,   118,   119,    82,     0,     0,     0,   120,   121,   122,
     123,     0,     0,     0,   797,   798,     0,   799,   800,   817,
     874,     0,     0,   113,   114,     0,     0,     0,     0,   472,
     115,     0,     0,     0,     0,   471,     0,     0,   116,   473,
       0,   117,   487,   118,   119,     0,     0,     0,     0,   120,
     121,   122,   123,   826,     0,   827,   649,     0,     0,   474,
     474,   464,   836,   837,     0,     0,     0,     0,     0,     0,
     468,   474,   172,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   851,
       0,   852,     0,   853,     0,   854,     0,     0,   472,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   473,     0,
       0,     0,   470,     0,     0,     0,   869,     0,   870,     0,
       0,     0,   172,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   172,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     468,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   468,     0,
       0,     0,     0,     0,     0,   104,     0,     1,   105,   106,
     107,   470,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   474,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   172,     0,     0,     0,
      26,     0,     0,     0,     0,   110,   111,   112,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,   474,     0,     0,     0,   468,     0,     0,
       0,     0,   172,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,   115,    35,    36,    37,    38,     0,     0,
       0,   116,     0,     0,   117,     0,   118,   119,     0,     0,
       0,     0,   120,   121,   122,   123,     0,   172,     0,     0,
     172,     0,     0,   463,   464,   465,     0,     0,     0,   172,
     172,     0,     0,     0,     0,     0,     0,     0,     0,   468,
       0,     0,     0,   104,     0,     1,   105,   106,   107,   468,
     108,   109,     0,     0,     0,     0,     0,     0,     0,     0,
     744,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   550,   551,   552,   553,   554,   555,
     556,   557,   558,   559,   560,     0,     0,     0,    26,     0,
       0,     0,     0,   110,   111,   112,    27,    28,     0,   561,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
     172,     0,     0,     0,   172,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   113,   114,     0,     0,     0,     0,
       0,   115,    35,    36,    37,    38,     0,     0,     0,   116,
       0,     0,   117,     0,   118,   119,     0,   172,     0,   468,
     120,   121,   122,   123,     0,     0,     0,     0,   172,     0,
       0,   562,   377,  -455,   104,     0,     1,   105,   106,   107,
       0,   108,   109,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,   550,   551,   552,   553,   554,
     555,   556,   557,   558,   559,   560,     0,     0,     0,    26,
       0,     0,     0,     0,   110,   111,   112,    27,    28,     0,
     561,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,   115,    35,    36,    37,    38,     0,     0,     0,
     116,     0,     0,   117,     0,   118,   119,     0,     0,     0,
       0,   120,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,   562,   377,  -454,   104,     0,     1,   105,   106,
     107,     0,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,   550,   551,   552,   553,
     554,   555,   556,   557,   558,   559,   560,     0,     0,     0,
      26,     0,     0,     0,     0,   110,   111,   112,    27,    28,
       0,   561,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,   115,    35,    36,    37,    38,     0,     0,
       0,   116,     0,     0,   117,     0,   118,   119,     0,     0,
       0,     0,   120,   121,   122,   123,     0,     0,     0,     0,
       0,     0,     0,   562,   377,  -456,   104,     0,     1,   105,
     106,   107,     0,   108,   109,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,   110,   111,   112,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   113,   114,     0,
       0,     0,     0,     0,   115,    35,    36,    37,    38,     0,
       0,     0,   116,     0,     0,   117,     0,   118,   119,     0,
       0,     0,     0,   120,   121,   122,   123,     0,     0,     0,
       0,     0,     0,     0,   463,   464,   484,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,    37,    38,
       0,     0,     0,   116,     0,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,   463,   464,   641,   104,     0,
       1,   105,   106,   107,     0,   108,   109,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,   110,   111,
     112,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   113,
     114,     0,     0,     0,     0,     0,   115,    35,    36,    37,
      38,     0,     0,     0,   116,     0,     0,   117,     0,   118,
     119,     0,     0,     0,     0,   120,   121,   122,   123,     0,
       0,     0,     0,     0,     0,     0,   655,   464,  -507,   104,
       0,     1,   105,   106,   107,     0,   108,   109,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   110,
     111,   112,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     113,   114,     0,     0,     0,     0,     0,   115,    35,    36,
      37,    38,     0,     0,     0,   116,     0,     0,   117,     0,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
       0,     0,     0,     0,     0,     0,     0,   463,   464,   709,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     110,   111,   112,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,   115,    35,
      36,    37,    38,     0,     0,     0,   116,     0,     0,   117,
       0,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,   104,     0,     1,   105,   106,     0,     0,   463,   464,
     814,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   196,     0,
       0,   110,   111,     0,    27,    28,     0,     0,   197,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   113,   114,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
     198,     0,   199,   119,   104,     0,     1,   105,   106,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   200,
       0,   201,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   196,     0,     0,   110,   111,     0,    27,    28,     0,
       0,   197,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      71,     0,     0,   198,     0,   199,   119,   104,     0,     1,
     105,   106,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   200,     0,   398,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   196,     0,     0,   110,   111,     0,
      27,    28,     0,     0,   197,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    71,     0,     0,   198,     0,   199,   119,
     104,     0,     1,   105,   106,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   200,     0,   407,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   196,     0,     0,
     110,   111,     0,    27,    28,     0,     0,   197,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    71,     0,     0,   198,
       0,   199,   119,   104,     0,     1,   105,   106,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   200,     0,
     409,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     196,     0,     0,   110,   111,     0,    27,    28,     0,     0,
     197,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   113,   114,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    71,
       0,     0,   198,     0,   199,   119,   104,     0,     1,   105,
     106,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   200,     0,   593,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   196,     0,     0,   110,   111,     0,    27,
      28,     0,     0,   197,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   113,   114,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    71,     0,     0,   198,     0,   199,   119,   104,
       0,     1,   105,   106,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   200,     0,   594,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   196,     0,     0,   110,
     111,     0,    27,    28,     0,     0,   197,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     113,   114,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    71,     0,     0,   198,     0,
     199,   119,   104,     0,     1,   105,   106,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   200,     0,   595,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   196,
       0,     0,   110,   111,     0,    27,    28,     0,     0,   197,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   113,   114,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,   198,     0,   199,   119,   104,     0,     1,   105,   106,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     200,     0,   597,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   196,     0,     0,   110,   111,     0,    27,    28,
       0,     0,   197,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    71,     0,     0,   198,     0,   199,   119,   104,     0,
       1,   105,   106,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   200,     0,   718,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   196,     0,     0,   110,   111,
       0,    27,    28,     0,     0,   197,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   113,
     114,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    71,     0,     0,   198,     0,   199,
     119,   104,     0,     1,   105,   106,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   200,     0,   719,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   196,     0,
       0,   110,   111,     0,    27,    28,     0,     0,   197,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   113,   114,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
     198,     0,   199,   119,   104,     0,     1,   105,   106,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   200,
       0,   720,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   196,     0,     0,   110,   111,     0,    27,    28,     0,
       0,   197,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      71,     0,     0,   198,     0,   199,   119,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,     0,
       0,     0,   200,     0,   721,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,   550,   551,
     552,   553,   554,   555,   556,   557,   558,   559,   560,     0,
       0,     0,    26,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,   561,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,   104,     0,     1,
     105,   106,   107,     0,   108,   109,    34,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,    37,    38,
       0,     0,     0,   116,     2,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,   562,   377,     0,   550,   551,
     552,   553,   554,   555,   556,   557,   558,   559,   560,     0,
       0,     0,     0,     0,     0,     0,     0,   110,   111,   112,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   113,   114,
       0,     0,     0,     0,   104,   115,     1,   105,   106,   107,
       0,   108,   109,   116,     0,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     2,     0,     0,     0,   562,   377,     0,     0,     0,
     110,   111,   112,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   113,   114,     0,   110,   111,   112,     0,   115,     0,
       0,     0,     0,     0,     0,     0,   116,     0,     0,   117,
     610,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,     0,     0,     0,     0,   113,   114,     0,     0,   464,
       0,     0,   115,   110,   111,   112,     0,     0,     0,     0,
     116,     0,     0,   117,     0,   118,   119,     0,     0,     0,
       0,   120,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,     0,   464,   113,   114,     0,     0,     0,     0,
       0,   115,     0,     0,     0,     0,     0,     0,     0,   116,
       0,     0,   117,     0,   118,   119,     0,     0,     0,     0,
     120,   121,   122,   123,   104,     0,     1,   105,   106,     0,
       0,     0,   817,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,    26,
       0,   196,     0,     0,   110,   111,     0,    27,    28,     0,
       0,   197,    29,     0,     2,    30,    31,     0,    32,     0,
      33,   104,     0,     1,   105,   106,   107,     0,   108,   109,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     2,     0,
      71,     0,     0,   198,     0,   199,   119,   110,   111,   112,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,   200,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,   113,   114,
       0,   110,   111,   112,     0,   115,     0,     0,     0,     0,
       0,     0,     0,   116,     0,     0,   117,   767,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,   113,   114,     0,   562,     0,     0,     0,   115,
     110,   111,   112,     0,     0,     0,     0,   116,     0,     0,
     117,   811,   118,   119,     0,     0,     0,     0,   120,   121,
     122,   123,     0,     0,     0,     0,     0,     0,     0,   562,
       0,   113,   114,     0,     0,     0,     0,     0,   115,     0,
       0,     0,     0,     0,     1,     0,   116,     0,     0,   117,
       0,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,   693,     2,
       3,     4,     5,     6,     7,   343,   344,   345,   346,   347,
     348,   349,   350,   351,   352,    18,    19,   353,   354,    22,
      23,   355,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   356,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   357,     0,   358,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   359,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,   360,   361,     0,     0,     1,    71,     0,
       0,   304,     0,     0,     0,     0,    73,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   538,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     1,
       0,    71,     0,     0,   385,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   386,     0,   387,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     1,     0,    71,     0,     0,   174,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   698,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    71,     0,   104,   304,     1,
     105,   106,   107,    73,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,  -290,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,    37,    38,
       0,     0,     0,   116,     0,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,   104,     0,
       1,   105,   106,   107,     0,   108,   109,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,   110,   111,
     112,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   113,
     114,     0,     0,     0,     0,     0,   115,    35,    36,    37,
      38,     0,     0,     0,   116,     0,     0,   117,   248,   118,
     119,     0,     0,     0,     0,   120,   121,   122,   123,   104,
       0,     1,   105,   106,   107,     0,   108,   109,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   110,
     111,   112,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     113,   114,     0,     0,     0,     0,     0,   115,    35,    36,
      37,    38,     0,     0,     0,   116,     0,     0,   238,   248,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     110,   111,   112,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,   115,    35,
      36,    37,    38,     0,     2,     0,   373,     0,     0,   374,
     248,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,     0,     0,    29,     0,     2,     0,     0,
       0,     0,     0,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,     0,     0,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,     0,     0,
       2,     0,     0,   373,     0,     0,   374,   248,   118,   119,
     110,   111,   112,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   113,   114,   110,   111,   112,     0,     0,   115,     0,
     104,     0,     1,   105,   106,   107,   116,   108,   109,   117,
       0,   118,   119,     0,     0,   170,     0,   120,   121,   122,
     123,     0,     0,     0,   113,   114,     0,     2,     0,     0,
       0,   115,     0,   104,     0,     1,   105,   106,   107,   116,
     108,   109,   117,     0,   118,   119,     0,     0,   325,     0,
     120,   121,   122,   123,     0,     0,     0,     0,     0,     0,
       2,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     110,   111,   112,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,   113,   114,   110,   111,   112,     0,     0,   115,     0,
       0,     0,     0,     0,     0,     0,   116,     0,     0,   117,
       0,   118,   119,     0,     0,   328,     0,   120,   121,   122,
     123,     0,     0,     0,   113,   114,     0,     0,     0,     0,
       0,   115,     0,   110,   111,   112,     0,     0,     0,   116,
       0,     0,   117,   248,   118,   119,     0,     0,     0,     0,
     120,   121,   122,   123,   104,     0,     1,   105,   106,   107,
       0,   108,   109,     0,   113,   114,     0,     0,     0,     0,
     104,   115,     1,   105,   106,   107,     0,   108,   109,   116,
       0,     2,   117,   764,   118,   119,     0,     0,     0,     0,
     120,   121,   122,   123,     0,     0,     0,     2,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   110,   111,   112,     0,     0,     0,
       0,   104,     0,     1,   105,   106,   107,     0,   108,   109,
     110,   111,   112,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   113,   114,     0,     2,     0,
       0,     0,   115,     0,     0,     0,     0,     0,     0,     0,
     116,   113,   114,   117,   843,   118,   119,     0,   115,     0,
       0,   120,   121,   122,   123,     0,   116,     0,     0,   117,
       0,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,   110,   111,   112,   104,     0,     1,   105,   106,   107,
       0,   108,   109,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,   113,   114,     0,     0,     0,     0,   104,   115,
       1,   105,   106,   107,     0,   108,   109,   116,     0,     0,
     233,     0,   118,   119,     0,     0,     0,     0,   120,   121,
     122,   123,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     0,     0,     0,   110,   111,   112,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   113,   114,     0,   110,   111,
     112,     0,   115,     0,     0,     0,     0,     0,     0,     0,
     116,     0,     0,   238,     0,   118,   119,     0,     0,     0,
       0,   120,   121,   122,   123,     0,     0,     0,     0,   113,
     114,     0,     0,     0,     1,     0,   115,     0,     0,     0,
       0,     0,     0,     0,   116,     0,     0,   246,     0,   118,
     119,     0,     0,     0,     0,   120,   121,   122,   123,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     1,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,    72,     0,     0,     0,     0,    73,     0,     0,    74,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     1,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    71,
       0,     0,    72,   163,     0,     0,     0,    73,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
     304,   163,     0,     0,     0,    73,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    71,     0,     0,   435,     0,
       0,     0,     0,   436,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    71,     0,     0,   435,     0,     0,     0,
       0,   448,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     1,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    71,     0,     0,   304,     0,     0,     0,     0,    73,
       2,     3,     4,     5,     6,     7,   343,   344,   345,   346,
     347,   348,   349,   350,   351,   352,    18,    19,   353,   354,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   356,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,     0,     0,     0,   357,     0,   358,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   359,     1,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,   360,   361,     0,     0,     0,    71,
       0,     0,   435,     0,     0,     0,     0,   624,     2,     3,
       4,     5,     6,     7,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,    18,    19,   353,   354,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   356,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,     0,     0,     0,   357,     0,   358,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     0,     0,
     359,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,   360,   361,     0,     0,     0,    71,     0,     0,
     435,     2,     0,     0,     0,   634,     0,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     1,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      71,     0,     0,   304,     0,     0,     0,     0,    73,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     1,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,   435,   614,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      25,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,     0,     0,     0,     0,   188,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,     0,     0,     0,     0,
     323,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    25,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       1,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
       0,     0,     0,     0,   728,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     1,     0,     0,     0,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    71,     0,     0,   174,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,     0,     0,     0,
     548,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,   520,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    25,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     1,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     1,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     2,
       3,     4,     5,     6,     7,   343,   344,   345,   346,   347,
     348,   349,   350,   351,   352,    18,    19,   353,   354,    22,
      23,   355,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   356,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   357,     0,   358,     0,
       1,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   359,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,   360,   361,     2,     3,     4,     5,     6,
       7,   343,   344,   345,   346,   347,   348,   349,   350,   351,
     352,    18,    19,   353,   354,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   356,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,     0,
       0,     0,   357,     0,   358,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   359,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,   360,
     361
};

static const yytype_int16 yycheck[] =
{
       0,    87,   119,    45,     0,    45,    45,    78,   259,   384,
     378,   131,   197,    64,   342,    45,   196,   196,   537,    90,
     378,     3,   263,   208,    24,    66,   196,    17,     3,     3,
      72,    90,    74,    72,    74,    74,    78,   278,     3,    78,
      69,   689,   120,   437,    44,    45,   440,    70,    90,     3,
     127,    90,   196,   120,     3,    69,    56,    79,   210,   127,
     817,    61,   139,    28,     3,    65,    66,     3,     3,   127,
     118,   139,    72,   243,    74,   245,    76,    70,    78,     3,
       3,    70,     3,   141,   244,   118,   118,    87,   110,   111,
      90,    69,    92,    28,   121,   136,    96,   183,     0,   243,
     127,   245,   102,   103,   623,    28,   863,   140,   140,   120,
     110,   182,   141,   113,     1,   137,     3,    70,   141,   178,
     768,    69,    70,   182,   154,   125,   127,   141,   128,   222,
     223,   224,   174,    24,   176,   174,   178,   176,   139,   178,
     182,   117,   117,   182,   120,   120,   136,   121,   141,   149,
     192,   151,   141,   192,   154,   137,   198,   676,   140,   198,
     280,   281,   282,   141,   164,    56,   208,   121,   117,   118,
     209,     3,     3,   137,   174,   140,   176,     3,   178,   218,
       3,   120,   182,   183,   364,   364,   371,     0,   141,   189,
     431,   140,   192,   141,   364,   120,   196,   197,   198,   199,
     125,   569,   570,   531,   140,    96,   206,   207,   208,   209,
     210,   569,   263,   464,   733,    11,   140,   140,   218,   140,
     364,   251,   222,   223,   224,   619,   127,   278,   140,   229,
     117,   118,     3,   233,   305,   235,   307,   127,   139,   120,
     141,   241,   242,   243,   244,   245,   246,   288,   289,   139,
     291,   251,   140,    66,   406,    69,   408,    64,   410,    72,
     260,   320,   303,   442,   264,    69,    70,   308,   643,   126,
     311,   450,   442,   140,    87,   435,    69,    70,   320,   127,
     450,   320,   442,   140,   469,   117,   117,   118,   120,   137,
     450,   117,   118,   125,   117,   118,   138,   110,   442,     5,
     113,   108,   109,   303,   304,   196,   450,   138,   308,   140,
     117,   311,    12,    13,   140,    69,    70,   317,   411,   412,
     320,   317,   415,   119,   417,   127,   127,   141,    10,    11,
     581,   127,   374,   333,   364,   374,   704,   141,   139,   141,
     141,   461,     3,   385,    92,   462,   385,   389,   141,   435,
     389,   126,   243,   395,   245,   355,   395,   117,   397,   140,
     121,   129,   130,   402,   364,   140,   127,    28,   126,   369,
     183,   371,   132,   133,   374,   375,   376,    45,   378,   128,
     431,     3,   140,    44,   197,   385,   199,   141,   388,   389,
     134,   198,   422,   117,     3,   395,   120,   397,     7,     8,
       9,   125,   402,   454,    74,    75,   406,   135,   408,    79,
     410,   411,   412,    74,    75,   415,    16,   417,   118,   119,
     420,   662,   422,   121,   127,   127,   233,   469,   428,   127,
     121,   238,   432,    14,    15,   435,   139,   139,     3,   246,
     110,   111,   442,   119,   596,   516,   598,   599,   600,   120,
     450,   127,    74,    75,   125,   455,   263,    79,   265,   119,
     121,   138,   210,    28,   355,   120,   466,   127,   138,   469,
     125,   278,   119,   364,   222,   223,   224,   119,   369,    44,
     127,   121,   121,   513,   535,   127,   154,   127,   110,   111,
     303,   304,   299,   121,   107,   308,   537,   121,   311,     1,
     117,     3,   115,    97,   317,   547,   107,   127,   547,    74,
      75,   120,   126,   513,   115,   124,   125,   111,   140,   121,
     114,   140,   773,   303,   566,   127,   566,   566,   308,   138,
     303,     3,   121,   121,   620,   308,   536,   537,     3,   127,
     208,   583,   584,   543,   583,   545,   588,   547,   121,   588,
     140,   442,   121,   139,   127,   555,    28,   557,   127,   450,
     139,   561,   121,   563,   140,   233,   566,   374,   127,   569,
     570,   378,   121,   121,   242,   138,   244,   124,   246,   127,
     121,   198,   623,   583,   584,   139,   140,   126,   588,   126,
     184,   126,   127,   187,   126,   127,   596,   121,   598,   599,
     600,   120,    74,    75,   283,   284,   120,    79,   120,    74,
      75,   662,   285,   286,    79,   117,   118,   292,   293,   121,
     620,   238,   435,   623,   431,   127,   433,   102,   103,   118,
     141,   121,   125,   121,   228,   676,   120,   120,   110,   111,
     118,   121,   121,   125,   644,   110,   111,   454,   265,   141,
     141,   121,   117,   121,   545,   120,   137,   120,   406,    92,
     408,   120,   410,   411,   412,   120,   120,   415,   140,   417,
     712,   671,   137,   715,   141,   139,   676,   139,   139,   121,
     121,   126,   299,   118,   684,   125,     0,   126,   125,   141,
      74,    75,   733,   121,   121,    79,   696,   140,    56,   699,
     138,     3,   125,   371,   704,     7,     8,     9,   376,    44,
      45,   137,   712,     3,   139,   715,   121,     7,     8,     9,
     141,   137,   529,   126,   537,   776,   110,   111,   535,   126,
     126,    45,   774,   733,   774,   774,   126,   779,   780,    74,
      75,   120,   141,   126,    79,   126,   139,   141,   555,   141,
     141,    65,    66,   560,   422,    64,   141,   374,    72,    73,
     760,   141,   569,   570,   764,   141,   817,   767,   139,   141,
      56,   141,   431,    87,   774,   110,   111,   210,    92,   779,
     780,   115,   117,     1,   294,     3,   295,   245,   296,   222,
     223,   224,   386,   297,   774,   298,   110,   394,   311,   113,
     584,   400,   469,   117,   569,   805,   806,   620,   808,   229,
     623,   811,   863,   482,   246,   653,   433,   482,   120,   482,
      -1,    -1,   124,   125,    -1,   258,   259,    -1,    -1,    -1,
     120,    -1,    -1,     3,   124,   125,   138,     7,     8,     9,
     154,    -1,   436,   843,    -1,   513,     3,    -1,   596,    -1,
     598,   599,   600,    -1,   448,   662,    74,    75,    -1,   859,
      -1,    79,   862,   676,     1,    -1,     3,     4,     5,   183,
     184,    28,    -1,   187,    -1,    -1,    -1,   684,   685,   686,
     687,    -1,   689,   197,    -1,   199,    -1,    44,    -1,   696,
      -1,    28,   110,   111,   208,    -1,   210,   704,    -1,   117,
     118,    -1,   120,   121,    -1,    -1,    -1,   125,   222,   223,
     224,    -1,   529,    45,    -1,    -1,    -1,    74,    75,   233,
     733,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   242,    -1,
     244,    -1,   246,    -1,    71,    72,    -1,   251,    -1,    71,
      72,    -1,    74,   560,   258,   259,    78,    -1,    -1,    -1,
     120,    -1,    -1,   760,   124,   125,   550,   764,    -1,    -1,
     767,   768,    -1,    -1,   121,   102,   103,   400,    -1,   776,
     127,    74,    75,   406,    -1,   408,    79,   410,   411,   412,
      -1,    -1,   415,   120,   417,    -1,   123,    -1,    -1,   303,
     304,    -1,   586,    -1,   308,    -1,    -1,   311,   805,   806,
      -1,   808,   809,   317,   811,   812,    45,   110,   111,     3,
     817,    -1,    -1,    -1,    -1,     3,    -1,    56,   121,    -1,
      -1,    -1,   154,    -1,    -1,    -1,    -1,   621,    -1,   161,
     624,   464,    -1,    72,    -1,    74,   843,    -1,    -1,   633,
     634,    -1,   174,    -1,   176,    -1,    85,    -1,    -1,   482,
      -1,    90,   859,    92,    -1,   862,   863,   371,    -1,    -1,
     374,    -1,   376,    -1,   378,    -1,   198,    -1,   685,   686,
     687,    -1,    -1,    -1,    -1,    -1,   208,   209,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    74,    75,    -1,    -1,
      -1,    79,   406,    -1,   408,    -1,   410,   411,   412,    -1,
      -1,   415,    -1,   417,    -1,    -1,    -1,    -1,   422,    -1,
     242,    -1,   244,    -1,    -1,   154,   110,   111,     3,   251,
      -1,   435,   110,   111,    -1,    -1,   120,   166,    -1,   117,
       3,   125,   120,   121,    -1,   174,    -1,    -1,   177,   178,
     734,    -1,    -1,   182,   738,    -1,    -1,    -1,   581,    -1,
     464,    -1,    -1,    -1,    -1,   469,    -1,    -1,   197,   198,
      -1,    -1,    -1,   596,    -1,   598,   599,   600,   482,   208,
      -1,   210,   304,   305,    -1,    -1,    -1,   771,    -1,   218,
      -1,    -1,    -1,   222,   223,   224,    -1,    -1,   782,    74,
      75,    -1,   809,    -1,    79,   812,    -1,    -1,    -1,   513,
      -1,    74,    75,   242,    -1,   244,    79,    45,    -1,    -1,
      -1,    -1,   251,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     653,    -1,   536,   537,    -1,   110,   111,    -1,    -1,    -1,
      -1,    -1,   364,    71,    -1,   120,    -1,   110,   111,    -1,
      -1,   373,   374,     3,   117,    -1,    -1,   120,    -1,    -1,
      -1,    -1,   566,   385,    -1,   569,   570,   389,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   304,    -1,   581,    28,    -1,
      45,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      45,   320,   596,    -1,   598,   599,   600,    -1,    -1,    -1,
     422,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    -1,   435,    -1,   437,   620,    -1,    -1,   623,
     442,    -1,   555,    -1,    74,    75,   154,    -1,   450,    79,
      -1,    -1,    -1,   161,    -1,   364,    -1,   570,    -1,    -1,
     369,    -1,   371,    -1,    -1,   374,    -1,   469,    -1,    -1,
     773,    -1,   117,    -1,    -1,    -1,   385,    -1,    -1,    -1,
     110,   111,   117,    45,    -1,    -1,   395,    -1,   196,    -1,
      -1,    -1,   676,   202,   203,   204,   205,   406,    -1,   408,
     208,   410,   411,   412,    -1,    -1,   415,    -1,   417,   154,
      -1,   513,    -1,   422,    -1,    -1,    -1,    -1,    -1,   154,
     704,    -1,    -1,    -1,    -1,   233,   435,    -1,    -1,    -1,
      -1,    -1,    -1,   442,   242,   243,   244,   245,   246,    -1,
      -1,   450,   138,   251,    -1,   547,    -1,    -1,    -1,   733,
     258,   259,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     469,    -1,    -1,   208,   566,    45,    -1,    -1,    -1,    -1,
      -1,   684,    -1,   208,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   584,   696,    -1,    -1,    -1,    -1,   233,   773,
      -1,   704,   154,    -1,    -1,    -1,    -1,   242,   233,   244,
      -1,   246,    -1,    -1,   513,    -1,   251,   242,   243,   244,
     245,   246,    -1,   258,   259,    -1,   251,    -1,    -1,    -1,
      -1,    -1,    -1,   258,   259,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   196,    -1,    -1,   117,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   208,   760,    -1,    -1,
      -1,   764,    -1,    -1,   767,    -1,   364,   566,    -1,    -1,
      -1,    -1,    -1,   371,    -1,   373,   374,    -1,   376,    -1,
     378,    -1,    -1,    -1,   154,   584,    -1,    -1,    -1,    -1,
     242,   243,   244,   245,    -1,    -1,    -1,   596,    -1,   598,
     599,   600,   805,   806,    -1,   808,   258,   259,   811,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     712,    -1,    -1,    -1,   422,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   371,    -1,   208,   374,
     843,   376,    -1,   378,   442,    -1,   371,    -1,    -1,   374,
      -1,   376,   450,   378,    -1,    -1,   859,    -1,    -1,   862,
      -1,    -1,    -1,   233,    -1,    -1,   464,    -1,    -1,    -1,
      -1,   469,   242,   243,   244,   245,   246,    -1,   477,    -1,
      -1,   251,   774,    -1,   482,    -1,    -1,   422,   258,   259,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   422,    -1,    73,
      -1,    -1,    -1,   702,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   364,    -1,    -1,   513,   715,   442,    -1,   371,
      -1,    -1,    -1,    97,   376,   450,   378,    -1,    -1,   464,
      -1,    -1,    -1,    -1,   469,    -1,    -1,   111,    -1,   464,
     114,    -1,    -1,    -1,   469,    -1,    -1,   482,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   482,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   566,    -1,
      -1,   569,   570,    -1,    -1,   774,    -1,    -1,   513,    -1,
      -1,    -1,    -1,   581,    -1,    -1,    -1,    -1,   513,    -1,
     442,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   450,    -1,
      -1,   371,    -1,    -1,   374,    -1,   376,    -1,   378,    -1,
     184,    -1,   464,   187,    -1,    -1,    -1,   469,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     482,   566,    -1,    -1,   569,   570,    -1,    -1,    -1,    -1,
      -1,   566,    -1,    -1,   569,   570,   581,    28,    -1,    -1,
      -1,    -1,   422,    -1,   228,    -1,   581,    -1,    -1,    -1,
      -1,   513,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,   442,    -1,   673,   674,    -1,    -1,    -1,    -1,
     450,    -1,    -1,    -1,   258,   259,    -1,    -1,    -1,    28,
      71,    72,    73,    -1,   464,    -1,    -1,    -1,    -1,   469,
      -1,    -1,    -1,    -1,    -1,    -1,   704,    -1,    -1,    -1,
      -1,    -1,   482,    -1,   566,    -1,    -1,   569,   570,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   581,
      -1,    -1,    71,    72,    73,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,   513,    -1,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,   753,   754,    -1,   756,   757,   140,
     141,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,   704,
     109,    -1,    -1,    -1,    -1,   773,    -1,    -1,   117,   704,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,   128,
     129,   130,   131,   792,    -1,   794,   566,    -1,    -1,   569,
     570,   140,   801,   802,    -1,    -1,    -1,    -1,    -1,    -1,
     384,   581,   386,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   828,
      -1,   830,    -1,   832,    -1,   834,    -1,    -1,   773,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   773,    -1,
      -1,    -1,   704,    -1,    -1,    -1,   855,    -1,   857,    -1,
      -1,    -1,   436,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   448,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     464,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   482,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,   773,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   704,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   550,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,   773,    -1,    -1,    -1,   581,    -1,    -1,
      -1,    -1,   586,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,    -1,   621,    -1,    -1,
     624,    -1,    -1,   139,   140,   141,    -1,    -1,    -1,   633,
     634,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   643,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,   653,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     664,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
     734,    -1,    -1,    -1,   738,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,    -1,   771,    -1,   773,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,   782,    -1,
      -1,   139,   140,   141,     1,    -1,     3,     4,     5,     6,
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
     117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,   140,   141,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    77,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,   140,   141,     1,    -1,     3,     4,
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
      -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,   140,   141,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,   140,   141,     1,    -1,
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
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,   140,   141,     1,
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
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,   140,   141,
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
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,     1,    -1,     3,     4,     5,    -1,    -1,   139,   140,
     141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,   122,   123,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
     141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
     122,   123,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,   122,   123,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,   122,   123,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    77,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    28,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,   140,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,
      -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,     6,
      -1,     8,     9,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    28,    -1,    -1,    -1,   139,   140,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   102,   103,    -1,    71,    72,    73,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,   140,
      -1,    -1,   109,    71,    72,    73,    -1,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   140,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,   140,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    28,    82,    83,    -1,    85,    -1,
      87,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    28,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,    71,    72,    73,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   139,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   102,   103,
      -1,    71,    72,    73,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   117,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,   102,   103,    -1,   139,    -1,    -1,    -1,   109,
      71,    72,    73,    -1,    -1,    -1,    -1,   117,    -1,    -1,
     120,   121,   122,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,     3,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,     3,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   140,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,     3,
      -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   137,    -1,   139,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,     3,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,     1,   120,     3,
       4,     5,     6,   125,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   138,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,   121,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,     1,
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
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,   121,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    28,    -1,   117,    -1,    -1,   120,
     121,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    28,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,    -1,    -1,
      28,    -1,    -1,   117,    -1,    -1,   120,   121,   122,   123,
      71,    72,    73,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103,    71,    72,    73,    -1,    -1,   109,    -1,
       1,    -1,     3,     4,     5,     6,   117,     8,     9,   120,
      -1,   122,   123,    -1,    -1,   126,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,   102,   103,    -1,    28,    -1,    -1,
      -1,   109,    -1,     1,    -1,     3,     4,     5,     6,   117,
       8,     9,   120,    -1,   122,   123,    -1,    -1,   126,    -1,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   102,   103,    71,    72,    73,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    -1,    -1,   126,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    71,    72,    73,    -1,    -1,    -1,   117,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,   102,   103,    -1,    -1,    -1,    -1,
       1,   109,     3,     4,     5,     6,    -1,     8,     9,   117,
      -1,    28,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      71,    72,    73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    28,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,   102,   103,   120,   121,   122,   123,    -1,   109,    -1,
      -1,   128,   129,   130,   131,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,     1,   109,
       3,     4,     5,     6,    -1,     8,     9,   117,    -1,    -1,
     120,    -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    71,    72,
      73,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,     3,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,   128,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,   121,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,   121,    -1,    -1,    -1,   125,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
      -1,    -1,    -1,   125,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,     3,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    28,    -1,    -1,    -1,   125,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,   121,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      65,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   121,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,
     120,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   112,   113,   143,
     144,   145,   146,   147,   152,   184,   185,   190,   191,   192,
     196,   197,   198,   199,   201,   202,   208,   216,   217,   235,
     266,   140,   147,   152,   120,   120,   118,     1,   117,   118,
     152,   117,   120,   125,   128,   143,   152,   190,   191,   198,
     199,   201,   217,   220,   222,   224,   225,   227,   228,   229,
     232,   120,   140,   146,   147,   152,   191,   137,     0,   152,
     218,   219,   140,   140,     1,     4,     5,     6,     8,     9,
      71,    72,    73,   102,   103,   109,   117,   120,   122,   123,
     128,   129,   130,   131,   145,   152,   153,   154,   155,   159,
     160,   162,   163,   164,   165,   166,   167,   168,   169,   170,
     171,   172,   173,   174,   175,   176,   253,   256,   145,   152,
     145,   152,   160,   166,   184,   203,   204,   205,   206,   207,
     198,   231,   232,   121,   152,   222,   224,   233,   234,   235,
     126,   145,   175,   179,   120,   152,   191,   224,   232,   220,
     225,   228,   232,   120,   125,   191,   120,   125,   121,   152,
     233,   236,   191,   220,   229,   120,    68,    78,   120,   122,
     139,   141,   148,   149,   150,   151,   152,   155,   184,   191,
     209,   210,   211,   212,   213,   225,   226,   228,   232,   255,
     256,   258,   140,   140,   140,   147,   152,   179,   138,   127,
     141,   218,   218,   120,   154,   157,   159,   161,   120,   160,
     160,   152,   184,   179,   184,   179,   120,   161,   121,   176,
     178,   181,   198,   199,   201,   217,   237,   253,   140,   140,
       7,     8,     9,   120,   124,   125,   152,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,   138,   177,   163,
     117,   132,   133,   129,   130,    10,    11,   166,    12,    13,
     118,   119,    14,    15,   128,   134,   135,    16,    17,   136,
     121,   121,   121,   138,   120,   191,   222,   232,   138,    11,
     119,   127,   198,   232,   121,   121,   121,   127,   126,   126,
     232,   220,   229,   121,   233,   126,   145,   179,   126,   145,
     179,   121,   121,   127,     3,    28,    44,    74,    75,   121,
     193,   194,   195,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    46,    47,    50,    66,    85,    87,   100,
     112,   113,   147,   152,   186,   190,   198,   200,   202,   208,
     216,   184,   226,   117,   120,   152,   184,   140,   247,   248,
     248,   248,   139,   248,   138,   120,   137,   139,   152,   191,
     214,   215,   225,   226,   230,   232,   228,   232,   141,   213,
     127,   139,   191,   228,   139,   139,   209,   141,   209,   141,
     209,   140,   140,   179,   219,   139,   141,   139,   141,   143,
     152,   160,   182,   198,   199,   201,   217,   238,     7,     8,
       9,   120,   124,   125,   152,   120,   125,   191,   221,   223,
     232,   152,   187,   190,   198,   200,   201,   217,   125,   223,
     187,   160,   238,   121,   127,   152,   198,   199,   201,   217,
     222,   121,   124,   139,   140,   141,   155,   156,   175,   183,
     190,   198,   199,   201,   217,   240,   257,   259,   260,   261,
     262,   263,   264,   265,   141,   265,   152,   121,   156,   158,
     176,   152,   178,   156,   176,   163,   163,   163,   164,   164,
     165,   165,   166,   166,   166,   168,   168,   169,   170,   171,
     172,   173,   178,   184,   204,   205,   232,   204,   205,   206,
      51,   235,   121,   126,   126,   126,   126,   152,   121,   120,
     121,   127,   194,   147,   152,   120,   120,   118,   140,   152,
     190,   198,   200,   222,   152,   191,   226,   191,   120,   141,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    77,   139,   152,   178,   180,   183,   242,   243,   244,
     245,   246,   248,   249,   250,   251,   252,   254,   240,   121,
     179,   140,   225,   232,   127,   139,   137,   196,   191,   225,
     228,   210,   228,   141,   141,   141,   209,   141,   209,   209,
     209,   121,   143,   198,   199,   201,   217,   222,   121,   152,
     121,   158,   152,   178,   121,   223,   233,   179,   221,   232,
     120,   125,   221,   118,   125,   152,   190,   198,   200,   201,
     217,   223,   179,   125,   125,   223,   121,   121,   176,   163,
     253,   141,   265,   138,   152,   190,   198,   199,   201,   217,
     226,   230,   248,   127,   139,   139,   260,   262,   263,   141,
     141,   121,   127,   126,   137,   222,   178,   121,   194,   176,
     145,   152,   207,    69,    70,   141,   118,   140,   140,   152,
     147,   152,   121,   179,   137,   120,   120,   120,   242,   120,
     152,   139,   139,   139,   178,   152,   137,   139,   139,   152,
     188,   189,   224,   180,   245,   180,   242,   141,   139,   141,
     265,   225,   191,   215,   225,   232,   179,   225,   141,   141,
     141,   141,   121,   126,   121,   121,   126,   221,   121,   233,
     179,   207,   179,   118,   125,   126,   179,   179,   125,   141,
     240,   261,   156,   176,   175,   121,   121,   121,   121,   119,
     248,   248,   207,    69,    70,   141,    69,    70,   141,   140,
     137,   242,   178,   178,   121,   178,    56,   121,   249,   139,
     139,   138,   242,   140,   127,   139,   138,   141,   225,   232,
     191,   225,   137,   121,   126,   119,   126,   207,   179,   126,
     126,   179,    70,   141,    69,   141,   119,   248,   248,   248,
     248,    69,    70,   141,   242,   121,   121,   242,   121,   120,
     242,   121,   249,   179,   141,   265,   189,   140,   176,   239,
     225,   225,   179,   119,   126,   126,   248,   248,    70,   141,
      69,   141,    70,   141,    69,   141,   248,   248,   242,   242,
     242,   178,   242,   121,   178,   139,   141,   239,   241,   141,
     141,   248,   248,   248,   248,    70,   141,    69,   141,    64,
     121,   242,   121,   127,   141,   141,   141,   141,   141,   248,
     248,   242,   139,   242,   141,   239,   141,   141
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
      case 143: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3758 "type.ec"
	break;
      case 145: /* "type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3767 "type.ec"
	break;
      case 146: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3776 "type.ec"
	break;
      case 147: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3785 "type.ec"
	break;
      case 148: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3794 "type.ec"
	break;
      case 149: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3803 "type.ec"
	break;
      case 150: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3812 "type.ec"
	break;
      case 151: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3821 "type.ec"
	break;
      case 152: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3830 "type.ec"
	break;
      case 153: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3839 "type.ec"
	break;
      case 155: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3848 "type.ec"
	break;
      case 158: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3857 "type.ec"
	break;
      case 160: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3866 "type.ec"
	break;
      case 163: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3875 "type.ec"
	break;
      case 164: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3884 "type.ec"
	break;
      case 165: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3893 "type.ec"
	break;
      case 166: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3902 "type.ec"
	break;
      case 168: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3911 "type.ec"
	break;
      case 169: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3920 "type.ec"
	break;
      case 170: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3929 "type.ec"
	break;
      case 171: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3938 "type.ec"
	break;
      case 172: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3947 "type.ec"
	break;
      case 173: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3956 "type.ec"
	break;
      case 174: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3965 "type.ec"
	break;
      case 175: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3974 "type.ec"
	break;
      case 176: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3983 "type.ec"
	break;
      case 178: /* "expression" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3992 "type.ec"
	break;
      case 179: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 4001 "type.ec"
	break;
      case 180: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4010 "type.ec"
	break;
      case 181: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4019 "type.ec"
	break;
      case 182: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4028 "type.ec"
	break;
      case 183: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4037 "type.ec"
	break;
      case 184: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4046 "type.ec"
	break;
      case 188: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4055 "type.ec"
	break;
      case 189: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4064 "type.ec"
	break;
      case 190: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4073 "type.ec"
	break;
      case 191: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4082 "type.ec"
	break;
      case 193: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4091 "type.ec"
	break;
      case 194: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4100 "type.ec"
	break;
      case 195: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4109 "type.ec"
	break;
      case 196: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4118 "type.ec"
	break;
      case 197: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4127 "type.ec"
	break;
      case 198: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4136 "type.ec"
	break;
      case 199: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4145 "type.ec"
	break;
      case 200: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4154 "type.ec"
	break;
      case 201: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4163 "type.ec"
	break;
      case 202: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4172 "type.ec"
	break;
      case 203: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4181 "type.ec"
	break;
      case 204: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4190 "type.ec"
	break;
      case 205: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4199 "type.ec"
	break;
      case 206: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4208 "type.ec"
	break;
      case 209: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4217 "type.ec"
	break;
      case 210: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4226 "type.ec"
	break;
      case 211: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4235 "type.ec"
	break;
      case 212: /* "property" */

/* Line 1009 of yacc.c  */
#line 198 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4244 "type.ec"
	break;
      case 213: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4253 "type.ec"
	break;
      case 214: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4262 "type.ec"
	break;
      case 215: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4271 "type.ec"
	break;
      case 216: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4280 "type.ec"
	break;
      case 217: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4289 "type.ec"
	break;
      case 218: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4298 "type.ec"
	break;
      case 219: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4307 "type.ec"
	break;
      case 220: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4316 "type.ec"
	break;
      case 221: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4325 "type.ec"
	break;
      case 222: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4334 "type.ec"
	break;
      case 223: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4343 "type.ec"
	break;
      case 224: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4352 "type.ec"
	break;
      case 225: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4361 "type.ec"
	break;
      case 226: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4370 "type.ec"
	break;
      case 227: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4379 "type.ec"
	break;
      case 228: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4388 "type.ec"
	break;
      case 229: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4397 "type.ec"
	break;
      case 230: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4406 "type.ec"
	break;
      case 231: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4415 "type.ec"
	break;
      case 232: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4424 "type.ec"
	break;
      case 233: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4433 "type.ec"
	break;
      case 234: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4442 "type.ec"
	break;
      case 235: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4451 "type.ec"
	break;
      case 236: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4460 "type.ec"
	break;
      case 237: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4469 "type.ec"
	break;
      case 238: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4478 "type.ec"
	break;
      case 239: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4487 "type.ec"
	break;
      case 240: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4496 "type.ec"
	break;
      case 241: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4505 "type.ec"
	break;
      case 242: /* "statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4514 "type.ec"
	break;
      case 243: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4523 "type.ec"
	break;
      case 244: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4532 "type.ec"
	break;
      case 245: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4541 "type.ec"
	break;
      case 246: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4550 "type.ec"
	break;
      case 247: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4559 "type.ec"
	break;
      case 248: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4568 "type.ec"
	break;
      case 249: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4577 "type.ec"
	break;
      case 250: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4586 "type.ec"
	break;
      case 251: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4595 "type.ec"
	break;
      case 252: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4604 "type.ec"
	break;
      case 253: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4613 "type.ec"
	break;
      case 254: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4622 "type.ec"
	break;
      case 256: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4631 "type.ec"
	break;
      case 258: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4640 "type.ec"
	break;
      case 259: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4649 "type.ec"
	break;
      case 260: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4658 "type.ec"
	break;
      case 261: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4667 "type.ec"
	break;
      case 262: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4676 "type.ec"
	break;
      case 263: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4685 "type.ec"
	break;
      case 264: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4694 "type.ec"
	break;
      case 265: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4703 "type.ec"
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
#line 227 "type.y"
    {
      (yyval.specifier) = null;
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
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
#line 245 "type.y"
    {
      (yyval.specifier) = null;
   #ifdef PRECOMPILER
      // if($1._class && !$1._class.name)
      if((yyvsp[(1) - (2)].id)._class)
      {
         char name[1024];
         strcpy(name,  (yyvsp[(1) - (2)].id)._class.name ? (yyvsp[(1) - (2)].id)._class.name : "");
         strcat(name, "::");
         strcat(name, (yyvsp[(1) - (2)].id).string);
         _DeclClass(0, name);
      }
      else
         _DeclClass(0, (yyvsp[(1) - (2)].id).string);

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
#line 279 "type.y"
    {
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
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
#line 328 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 330 "type.y"
    {
   #ifdef PRECOMPILER
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
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
#line 356 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 361 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 363 "type.y"
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
#line 380 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 382 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 387 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 392 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 397 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 399 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 404 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 410 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 423 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 425 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 433 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 434 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 435 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 440 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 441 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 442 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
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

  case 42:

/* Line 1464 of yacc.c  */
#line 457 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 458 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 459 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 463 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 469 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 470 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 471 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 472 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 474 "type.y"
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

  case 52:

/* Line 1464 of yacc.c  */
#line 486 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 487 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 488 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 492 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 493 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 494 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 499 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 500 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 501 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 502 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 503 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 504 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 505 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 506 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 507 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 521 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 522 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 523 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 526 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 527 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 532 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 537 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 538 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 544 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 545 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 550 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 551 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 556 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 564 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 565 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 566 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 572 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 573 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 578 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 583 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 588 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 593 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 598 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 603 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 608 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 609 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 613 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 614 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 615 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 616 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 627 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 636 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 637 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 638 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 639 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 667 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 668 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 671 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 672 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 673 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 680 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 681 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 682 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 683 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 684 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 685 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 686 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 687 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 688 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 689 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 690 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 691 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 695 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 696 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 700 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 701 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 702 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 703 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 704 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 705 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 706 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 707 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 709 "type.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[(1) - (4)].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[(1) - (4)].id)._class.name ? (yyvsp[(1) - (4)].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[(1) - (4)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 727 "type.y"
    {
         if((yyvsp[(2) - (5)].id)._class && !(yyvsp[(2) - (5)].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[(2) - (5)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 743 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 744 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 745 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 746 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 747 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 749 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 750 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 751 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 752 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 753 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 754 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 756 "type.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[(1) - (4)].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[(1) - (4)].id)._class.name ? (yyvsp[(1) - (4)].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[(1) - (4)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
    {
         if((yyvsp[(2) - (5)].id)._class && !(yyvsp[(2) - (5)].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[(2) - (5)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 790 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 791 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 795 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 800 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 801 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 802 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 803 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 804 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 816 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 821 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 822 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 829 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 845 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 856 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 874 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 877 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 879 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 884 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 887 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 889 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 894 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 895 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 896 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 897 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 901 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 902 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 903 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 904 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 909 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 910 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 911 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 912 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 914 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 917 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 918 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 919 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 921 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 925 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 927 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 930 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 932 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 936 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 937 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 942 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 943 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 954 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 961 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 965 "type.y"
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

  case 300:

/* Line 1464 of yacc.c  */
#line 989 "type.y"
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

  case 301:

/* Line 1464 of yacc.c  */
#line 1003 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 1004 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 1008 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 1009 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 1013 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 1014 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 1018 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1022 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1023 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1032 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1034 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1036 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1039 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1041 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1045 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1050 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1052 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1056 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1058 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1063 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1065 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1067 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1069 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1073 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1075 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1076 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1077 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1078 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1080 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1092 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1094 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1096 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1098 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1100 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1104 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1105 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1111 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1113 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1119 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1121 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1126 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1128 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1134 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1136 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1138 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1140 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1142 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1144 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1146 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1148 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1150 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1152 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1154 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1159 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1161 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1163 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1165 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1167 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1171 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1173 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1174 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1175 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1176 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1180 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1182 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1183 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1184 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1185 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1233 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1237 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1242 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1244 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1246 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1248 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1250 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1256 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1259 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1261 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1263 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1275 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1277 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1284 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1286 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1291 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1292 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1293 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1294 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1298 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1299 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1303 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1304 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1305 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1306 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1311 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1315 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1316 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1320 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1321 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1322 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1323 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1324 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1336 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1360 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1361 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1365 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1366 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1370 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1371 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1376 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1378 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1380 "type.y"
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

  case 436:

/* Line 1464 of yacc.c  */
#line 1396 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1398 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 438:

/* Line 1464 of yacc.c  */
#line 1420 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 439:

/* Line 1464 of yacc.c  */
#line 1422 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1436 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1438 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1440 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1444 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1445 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1449 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1453 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1457 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1458 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1459 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1463 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1468 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1476 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1480 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1481 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1485 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1486 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1487 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1491 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1492 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1493 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1494 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1496 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1497 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1498 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1502 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1503 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1504 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1505 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1506 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1510 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1515 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1517 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1522 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1524 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1549 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1551 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1553 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1555 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1560 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1562 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1566 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1568 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1570 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1572 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1574 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1580 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1582 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1587 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1591 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1592 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1597 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1599 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1604 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1608 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1609 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1610 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1611 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 505:

/* Line 1464 of yacc.c  */
#line 1612 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 506:

/* Line 1464 of yacc.c  */
#line 1613 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 508:

/* Line 1464 of yacc.c  */
#line 1618 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 509:

/* Line 1464 of yacc.c  */
#line 1619 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 510:

/* Line 1464 of yacc.c  */
#line 1623 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 511:

/* Line 1464 of yacc.c  */
#line 1624 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8491 "type.ec"
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
#line 1627 "type.y"


