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
     WIDE_STRING_LITERAL = 373
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
#line 298 "expression.ec"
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
#line 323 "expression.ec"

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
#define YYLAST   7700

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  144
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  107
/* YYNRULES -- Number of rules.  */
#define YYNRULES  427
/* YYNRULES -- Number of states.  */
#define YYNSTATES  748

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
       2,     2,     2,   131,     2,     2,   121,   133,   126,     2,
     119,   120,   127,   128,   125,   129,   122,   132,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   139,   141,
     134,   140,   135,   138,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,   136,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   142,   137,   143,   130,     2,     2,     2,
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
     250,     0,    -1,     3,    -1,   147,    -1,   119,   168,   120,
      -1,   145,    -1,   236,    -1,     4,    -1,   118,    -1,   234,
      -1,   121,   234,    -1,   121,   234,   122,   234,    -1,   119,
     120,    -1,    71,   172,   206,   123,   169,   124,    -1,    71,
     172,   123,   169,   124,    -1,   102,   172,   206,   123,   169,
     124,    -1,   102,   172,   123,   169,   124,    -1,    72,   169,
     174,   206,   123,   169,   124,    -1,    72,   169,   174,   123,
     169,   124,    -1,   103,   169,   174,   206,   123,   169,   124,
      -1,   103,   169,   174,   123,   169,   124,    -1,     1,    -1,
     237,    -1,   146,    -1,   149,   123,   168,   124,    -1,   149,
     119,   120,    -1,   149,   119,   150,   120,    -1,   149,   122,
     145,    -1,   149,   145,    -1,   149,     7,   145,    -1,   149,
       8,    -1,   149,     9,    -1,   166,    -1,   148,    -1,   150,
     125,   166,    -1,   150,   125,   148,    -1,     8,   152,    -1,
       9,   152,    -1,   153,   154,    -1,     6,   152,    -1,     6,
     119,   219,   120,    -1,   109,   152,    -1,   109,   119,   219,
     120,    -1,   151,    -1,   149,    -1,   126,    -1,   127,    -1,
     128,    -1,   129,    -1,   130,    -1,   131,    -1,    73,    -1,
     152,    -1,   119,   219,   120,   154,    -1,   154,    -1,   155,
     127,   154,    -1,   155,   132,   154,    -1,   155,   133,   154,
      -1,   155,    -1,   156,   128,   155,    -1,   156,   129,   155,
      -1,   156,    -1,   157,    10,   156,    -1,   157,    11,   156,
      -1,   157,    -1,   158,   134,   157,    -1,   158,   135,   157,
      -1,   158,    12,   157,    -1,   158,    13,   157,    -1,   158,
      -1,   159,    14,   158,    -1,   159,    15,   158,    -1,   159,
      -1,   160,   126,   159,    -1,   160,    -1,   161,   136,   160,
      -1,   161,    -1,   162,   137,   161,    -1,   162,    -1,   163,
      16,   162,    -1,   163,    -1,   164,    17,   163,    -1,   164,
      -1,   164,   138,   168,   139,   165,    -1,   165,    -1,   152,
     167,   166,    -1,   165,   167,   166,    -1,   152,   167,   148,
      -1,   165,   167,   148,    -1,   140,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   166,    -1,   168,
     125,   166,    -1,   165,    -1,   172,   141,    -1,   172,   175,
     141,    -1,   235,   141,    -1,    77,   145,   140,   169,   141,
      -1,   184,    -1,   171,   184,    -1,   187,    -1,   171,   187,
      -1,   200,    -1,   171,   200,    -1,   189,    -1,   171,   189,
      -1,   177,    -1,   172,   177,    -1,   184,    -1,   172,   184,
      -1,   187,    -1,   172,   187,    -1,   200,    -1,   172,   200,
      -1,   189,    -1,   172,   189,    -1,   177,    -1,   173,   177,
      -1,   184,    -1,   173,   184,    -1,   187,    -1,   173,   187,
      -1,   185,    -1,   173,   185,    -1,   177,    -1,   174,   177,
      -1,   184,    -1,   174,   184,    -1,   188,    -1,   174,   188,
      -1,   189,    -1,   174,   189,    -1,   200,    -1,   174,   200,
      -1,   176,    -1,   175,   125,   176,    -1,   207,    -1,   207,
     140,   220,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   117,    -1,    74,    -1,   183,    -1,    79,
      -1,   110,    -1,   111,    -1,     3,    -1,    28,    -1,    75,
      -1,    74,    -1,    44,    -1,   180,    -1,   180,   119,   168,
     120,    -1,   181,    -1,   182,   181,    -1,   182,   125,   181,
      -1,   179,   119,   119,   182,   120,   120,    -1,   179,   119,
     119,   120,   120,    -1,    44,    -1,    45,    -1,    75,    -1,
     186,    -1,    28,    -1,    46,    -1,    34,    -1,    35,    -1,
      36,    -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,
      42,    -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,
     113,    -1,   112,    -1,   190,    -1,   199,    -1,   185,    -1,
     100,   119,   185,   120,    -1,    66,    -1,    46,    -1,    34,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,
      -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,
      -1,   113,    -1,   112,    -1,   190,    -1,   199,    -1,   186,
      -1,   100,   119,   185,   120,    -1,    66,    -1,   191,   145,
     142,   192,   143,    -1,   191,   142,   192,   143,    -1,   191,
     145,   142,   143,    -1,   191,   142,   143,    -1,   191,   186,
     142,   192,   143,    -1,   191,   178,   145,   142,   192,   143,
      -1,   191,   178,   142,   192,   143,    -1,   191,   178,   145,
     142,   143,    -1,   191,   178,   142,   143,    -1,   191,   178,
     186,   142,   192,   143,    -1,   191,   145,    -1,   191,   186,
      -1,   191,   178,   145,    -1,   191,   178,   186,    -1,    48,
      -1,    49,    -1,   196,    -1,   192,   196,    -1,   149,   140,
     221,    -1,   193,    -1,   194,   125,   193,    -1,    68,   173,
     145,   142,    69,   229,    70,   229,   143,    -1,    68,   173,
     145,   142,    70,   229,    69,   229,   143,    -1,    68,   173,
     145,   142,    69,   229,   143,    -1,    68,   173,   145,   142,
      70,   229,   143,    -1,    68,   173,   145,   142,   143,    -1,
      68,   173,   205,   145,   142,    69,   229,    70,   229,   143,
      -1,    68,   173,   205,   145,   142,    70,   229,    69,   229,
     143,    -1,    68,   173,   205,   145,   142,    69,   229,   143,
      -1,    68,   173,   205,   145,   142,    70,   229,   143,    -1,
      68,   173,   205,   145,   142,   143,    -1,    68,   173,   142,
      69,   229,    70,   229,   143,    -1,    68,   173,   142,    70,
     229,    69,   229,   143,    -1,    68,   173,   142,    69,   229,
     143,    -1,    68,   173,   142,    70,   229,   143,    -1,    68,
     173,   142,   143,    -1,    68,   173,   205,   142,    69,   229,
      70,   229,   143,    -1,    68,   173,   205,   142,    70,   229,
      69,   229,   143,    -1,    68,   173,   205,   142,    69,   229,
     143,    -1,    68,   173,   205,   142,    70,   229,   143,    -1,
      68,   173,   205,   142,   143,    -1,   172,   197,   141,    -1,
     172,   141,    -1,   236,   141,    -1,   235,   141,    -1,   242,
      -1,   194,   141,    -1,   195,    -1,   141,    -1,   198,    -1,
     197,   125,   198,    -1,   207,    -1,   207,   183,    -1,   139,
     169,    -1,   207,   139,   169,    -1,   207,   139,   169,   139,
     169,    -1,    50,   145,    -1,    50,   186,    -1,    50,   142,
     201,   143,    -1,    50,   145,   142,   201,   143,    -1,    50,
     145,   142,   201,   141,   192,   143,    -1,    50,   186,   142,
     201,   141,   192,   143,    -1,    50,   186,   142,   201,   143,
      -1,   202,    -1,   201,   125,   202,    -1,   145,    -1,   145,
     140,   169,    -1,   119,   205,   120,    -1,   123,   124,    -1,
     123,   169,   124,    -1,   123,   185,   124,    -1,   203,   123,
     124,    -1,   203,   123,   169,   124,    -1,   203,   123,   185,
     124,    -1,   119,   120,    -1,   119,   215,   120,    -1,   203,
     119,   120,    -1,   203,   119,   215,   120,    -1,   119,   206,
     120,    -1,   119,   120,    -1,   119,   215,   120,    -1,   204,
     119,   120,    -1,   204,   119,   215,   120,    -1,   214,    -1,
     203,    -1,   214,   203,    -1,   178,   214,    -1,   178,   203,
      -1,   178,   214,   203,    -1,   214,    -1,   204,    -1,   214,
     204,    -1,   178,   214,    -1,   178,   204,    -1,   178,   214,
     204,    -1,   210,    -1,   214,   210,    -1,   178,   214,   210,
      -1,   145,    -1,   119,   207,   120,    -1,   208,   123,   169,
     124,    -1,   208,   123,   124,    -1,   208,   123,   185,   124,
      -1,   212,    -1,   214,   212,    -1,   178,   212,    -1,   178,
     214,   212,    -1,   214,   178,   212,    -1,   212,    -1,   208,
      -1,   178,   212,    -1,   178,   208,    -1,   208,   119,    -1,
     211,   215,   120,    -1,   211,   218,   120,    -1,   211,   120,
      -1,   184,    -1,   213,   184,    -1,   127,    -1,   127,   213,
      -1,   127,   214,    -1,   127,   213,   214,    -1,   216,    -1,
     216,   125,    51,    -1,   217,    -1,   216,   125,   217,    -1,
     172,   207,    -1,   172,   205,    -1,   172,    -1,   145,    -1,
     218,   125,   145,    -1,   171,    -1,   171,   205,    -1,   166,
      -1,   142,   222,   143,    -1,   142,   222,   125,   143,    -1,
     165,    -1,   148,    -1,   220,    -1,   222,   125,   220,    -1,
     224,    -1,   229,    -1,   230,    -1,   231,    -1,   232,    -1,
     233,    -1,   145,   139,   223,    -1,    52,   169,   139,   223,
      -1,    53,   139,   223,    -1,   170,    -1,   225,   170,    -1,
     223,    -1,   226,   223,    -1,   226,   170,    -1,   226,    -1,
     225,    -1,   225,   226,    -1,   142,    -1,   142,   143,    -1,
     228,   227,   143,    -1,   141,    -1,   168,   141,    -1,    54,
     119,   168,   120,   223,    -1,    54,   119,   168,   120,   223,
      64,   223,    -1,    55,   119,   168,   120,   223,    -1,    56,
     119,   168,   120,   223,    -1,    57,   223,    56,   119,   168,
     120,   141,    -1,    58,   119,   230,   230,   120,   223,    -1,
      58,   119,   230,   230,   168,   120,   223,    -1,    56,   119,
     120,   223,    -1,    58,   119,   230,   120,   223,    -1,    58,
     119,   120,   223,    -1,    59,   145,   141,    -1,    60,   141,
      -1,    61,   141,    -1,    62,   141,    -1,    62,   168,   141,
      -1,     5,    -1,   172,   145,   142,   249,   143,    -1,   172,
     145,   142,   143,    -1,   185,   142,   249,   143,    -1,   185,
     142,   143,    -1,   145,   142,   249,   143,    -1,   145,   142,
     143,    -1,   142,   249,   143,    -1,   142,   143,    -1,   172,
     209,    -1,   209,    -1,   172,   119,   120,    -1,   130,   172,
     119,   120,    -1,    78,   172,   209,    -1,    78,   209,    -1,
     238,   229,    -1,   241,   229,    -1,   241,   141,    -1,   239,
     229,    -1,   240,   229,    -1,   172,   209,    -1,   243,   229,
      -1,   149,   140,   221,    -1,   221,    -1,   245,    -1,   246,
     125,   245,    -1,   246,   141,    -1,   247,    -1,   244,    -1,
     248,   247,    -1,   248,   244,    -1,   141,    -1,   248,   141,
      -1,   248,    -1,   246,    -1,   248,   246,    -1,   166,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   215,   215,   220,   221,   226,   228,   230,   232,   233,
     235,   236,   237,   240,   241,   242,   243,   244,   245,   246,
     247,   248,   252,   256,   257,   258,   259,   260,   261,   274,
     275,   276,   306,   307,   308,   309,   313,   314,   315,   318,
     319,   322,   323,   327,   328,   337,   338,   339,   340,   341,
     342,   343,   347,   348,   352,   353,   354,   355,   359,   360,
     361,   365,   366,   367,   371,   372,   373,   374,   375,   379,
     380,   381,   385,   386,   390,   391,   395,   396,   400,   401,
     405,   406,   410,   411,   415,   416,   417,   419,   420,   424,
     425,   426,   427,   428,   429,   430,   431,   432,   433,   434,
     438,   439,   443,   447,   448,   449,   450,   454,   455,   456,
     457,   458,   459,   460,   461,   465,   466,   467,   468,   469,
     470,   471,   472,   473,   474,   479,   480,   481,   482,   483,
     484,   485,   486,   490,   491,   492,   493,   494,   495,   496,
     497,   498,   499,   503,   504,   508,   509,   513,   514,   515,
     516,   517,   518,   522,   523,   527,   528,   529,   534,   535,
     536,   537,   538,   542,   543,   547,   548,   549,   553,   554,
     558,   559,   560,   564,   589,   593,   594,   595,   596,   597,
     598,   599,   600,   601,   602,   603,   604,   605,   606,   607,
     608,   609,   610,   611,   612,   616,   617,   618,   619,   620,
     621,   622,   623,   624,   625,   626,   627,   628,   629,   630,
     631,   632,   633,   634,   639,   640,   641,   642,   643,   646,
     647,   648,   649,   650,   655,   656,   659,   661,   666,   667,
     671,   672,   676,   680,   681,   685,   687,   689,   691,   693,
     696,   698,   700,   702,   704,   707,   709,   711,   713,   715,
     718,   720,   722,   724,   726,   731,   732,   733,   734,   735,
     736,   737,   738,   742,   744,   749,   751,   753,   755,   757,
     762,   763,   767,   769,   770,   771,   772,   776,   778,   783,
     785,   791,   793,   795,   797,   799,   801,   803,   805,   807,
     809,   811,   816,   818,   820,   822,   824,   829,   830,   831,
     832,   833,   834,   838,   839,   840,   841,   842,   843,   889,
     890,   892,   898,   900,   902,   904,   906,   911,   912,   915,
     917,   919,   925,   926,   927,   929,   934,   938,   940,   942,
     947,   948,   952,   953,   954,   955,   959,   960,   964,   965,
     969,   970,   971,   975,   976,   980,   981,   990,   992,   994,
    1010,  1011,  1032,  1034,  1039,  1040,  1041,  1042,  1043,  1044,
    1048,  1050,  1052,  1057,  1058,  1062,  1063,  1066,  1070,  1071,
    1072,  1076,  1080,  1088,  1093,  1094,  1098,  1099,  1100,  1104,
    1105,  1106,  1107,  1109,  1110,  1111,  1115,  1116,  1117,  1118,
    1119,  1123,  1127,  1129,  1134,  1136,  1138,  1140,  1145,  1147,
    1152,  1154,  1159,  1164,  1169,  1171,  1176,  1178,  1180,  1182,
    1184,  1190,  1195,  1200,  1201,  1205,  1207,  1212,  1217,  1218,
    1219,  1220,  1221,  1222,  1226,  1227,  1228,  1232
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
  "WIDE_STRING_LITERAL", "'('", "')'", "'$'", "'.'", "'['", "']'", "','",
  "'&'", "'*'", "'+'", "'-'", "'~'", "'!'", "'/'", "'%'", "'<'", "'>'",
  "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'", "'}'", "$accept",
  "identifier", "primary_expression", "simple_primary_expression",
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
     365,   366,   367,   368,   369,   370,   371,   372,   373,    40,
      41,    36,    46,    91,    93,    44,    38,    42,    43,    45,
     126,    33,    47,    37,    60,    62,    94,   124,    63,    58,
      61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   144,   145,   146,   146,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   148,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   150,   150,   150,   150,   151,   151,   151,   151,
     151,   151,   151,   152,   152,   153,   153,   153,   153,   153,
     153,   153,   154,   154,   155,   155,   155,   155,   156,   156,
     156,   157,   157,   157,   158,   158,   158,   158,   158,   159,
     159,   159,   160,   160,   161,   161,   162,   162,   163,   163,
     164,   164,   165,   165,   166,   166,   166,   166,   166,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   167,   167,
     168,   168,   169,   170,   170,   170,   170,   171,   171,   171,
     171,   171,   171,   171,   171,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   172,   173,   173,   173,   173,   173,
     173,   173,   173,   174,   174,   174,   174,   174,   174,   174,
     174,   174,   174,   175,   175,   176,   176,   177,   177,   177,
     177,   177,   177,   178,   178,   179,   179,   179,   180,   180,
     180,   180,   180,   181,   181,   182,   182,   182,   183,   183,
     184,   184,   184,   185,   186,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   189,   189,   189,   189,   189,   189,
     189,   189,   189,   189,   190,   190,   190,   190,   191,   191,
     192,   192,   193,   194,   194,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   196,   196,   196,   196,   196,
     196,   196,   196,   197,   197,   198,   198,   198,   198,   198,
     199,   199,   200,   200,   200,   200,   200,   201,   201,   202,
     202,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   204,   204,   204,   204,   204,   205,   205,   205,
     205,   205,   205,   206,   206,   206,   206,   206,   206,   207,
     207,   207,   208,   208,   208,   208,   208,   209,   209,   209,
     209,   209,   210,   210,   210,   210,   211,   212,   212,   212,
     213,   213,   214,   214,   214,   214,   215,   215,   216,   216,
     217,   217,   217,   218,   218,   219,   219,   220,   220,   220,
     221,   221,   222,   222,   223,   223,   223,   223,   223,   223,
     224,   224,   224,   225,   225,   226,   226,   226,   227,   227,
     227,   228,   229,   229,   230,   230,   231,   231,   231,   232,
     232,   232,   232,   232,   232,   232,   233,   233,   233,   233,
     233,   234,   235,   235,   236,   236,   236,   236,   237,   237,
     238,   238,   239,   240,   241,   241,   242,   242,   242,   242,
     242,   243,   244,   245,   245,   246,   246,   247,   248,   248,
     248,   248,   248,   248,   249,   249,   249,   250
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
    5684,  -619,  -619,  -619,  -619,  5757,  5771,  5771,  -619,  7403,
    5684,  -619,  7403,  5684,  5844,  -619,  5242,   104,  -619,  -619,
    -619,  -619,  -619,  -619,   -23,  -619,  -619,   409,  -619,   673,
    5684,  -619,   315,   187,   403,    60,   424,    15,    11,    69,
     204,    59,   673,  -619,    87,  -619,  -619,  -619,   242,  5242,
    -619,  5329,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,    40,  -619,  -619,  -619,   129,
    -619,  -619,  -619,  6441,  -619,  -619,  -619,  -619,  -619,  -619,
      50,  -619,  -619,  -619,  -619,  7583,  6541,  7583,  5242,  -619,
    -619,  -619,   199,  6935,  -619,    87,  -619,  -619,  -619,   135,
     139,  2009,   282,  -619,  -619,  4255,   282,  5684,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    4296,  -619,  5684,  5684,  5684,  5684,  5684,  5684,  5684,  5684,
    5684,  5684,  5684,  5684,  5684,  5684,  5684,  5684,  5684,  5684,
    5684,  4296,  2140,  -619,   179,   282,   167,   185,   302,  -619,
    -619,  -619,  -619,  6641,  5684,   164,  -619,   140,   214,  -619,
    -619,  -619,  -619,  -619,   222,   241,   271,  2652,   252,    42,
     254,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,   284,  -619,  -619,  6741,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,  -619,  5684,   288,  6841,   285,
    -619,  5684,  6341,  5402,   247,  -619,  -619,  -619,  -619,   -13,
    -619,   151,  5684,   104,  -619,  2271,  -619,  -619,   314,  -619,
    6148,  -619,  -619,   279,  -619,  -619,   108,  -619,  2402,   287,
    -619,  -619,  -619,   234,  -619,  -619,   299,  -619,  -619,  -619,
    -619,  -619,   315,   315,   187,   187,   403,   403,   403,   403,
      60,    60,   424,    15,    11,    69,   204,   -58,  -619,  -619,
    -619,   289,  -619,   300,   -39,  -619,   282,   282,   331,  -619,
    6048,   342,   353,   324,  -619,   372,  -619,   164,  -619,   222,
     271,   358,  7035,  5684,   222,  7493,  6148,  5315,  7403,  -619,
    -619,   -23,   378,  4879,    47,  2771,  -619,   125,  -619,  -619,
     173,  -619,  6248,  -619,   518,   338,   366,   279,   279,   279,
     319,  -619,  2890,  3009,   357,   370,  4522,   302,  5684,  -619,
    -619,  -619,  -619,  -619,   391,   392,  5684,  5684,   396,  -619,
    -619,  -619,   395,   400,  -619,   399,    61,   -13,   151,  7128,
    5463,   -13,  -619,  -619,  -619,   382,  4296,   539,  -619,  -619,
     383,  4089,  -619,  4296,  -619,  -619,  -619,   108,  -619,  -619,
    -619,  4296,  -619,  5684,  -619,  5684,   282,  -619,   -42,   226,
    -619,  5948,    19,  -619,  -619,   173,  -619,  -619,   355,  -619,
    -619,  7313,  -619,  -619,  -619,   222,    79,  -619,   417,   415,
      63,  4764,  -619,  -619,  -619,  -619,   265,  6148,  -619,  5111,
     500,    47,   420,   518,  7221,  4296,   443,  5684,  -619,   401,
      47,   137,  -619,   281,  -619,   405,   518,  -619,    58,  -619,
    -619,   825,  -619,  -619,  5536,  -619,  -619,   430,   248,    58,
    -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  3128,
    -619,  3247,  3366,  4522,  3485,   431,   432,  5684,  -619,   436,
     437,  5684,  -619,  -619,  -619,  -619,   -13,  -619,   435,  -619,
     441,    81,  -619,  -619,  -619,  5684,   413,   429,   448,   450,
    4220,   457,   282,   439,   440,  4650,   282,  -619,   -62,   148,
    -619,  4994,  -619,  -619,  1616,  1747,   434,  -619,  -619,  -619,
    -619,  -619,   442,  -619,  -619,  -619,  -619,  -619,  -619,  4522,
    -619,  4522,  -619,   173,  -619,   355,    58,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,  -619,   458,   472,  -619,   232,  -619,
    -619,  -619,  -619,    27,   451,  -619,  -619,  -619,  -619,    14,
    -619,    63,  -619,  -619,   518,  -619,   474,  -619,  -619,  -619,
    2533,   453,   518,   419,  -619,  5684,  -619,    58,   459,  -619,
    -619,  -619,   475,    90,  -619,  -619,   282,  -619,  -619,  -619,
    -619,  3604,  3723,  -619,  -619,  -619,   476,  -619,  -619,   480,
    -619,  -619,  -619,   469,  4220,  5684,  5684,  5550,   558,  4574,
     479,  -619,  -619,  -619,   162,   477,  4220,  -619,  -619,   163,
    -619,   481,  -619,  1878,  -619,  -619,  -619,  -619,  3842,  3961,
    -619,  -619,  5684,   496,   428,  -619,   279,   279,  -619,   157,
     183,   482,  -619,  -619,  -619,  -619,   487,   493,  -619,   483,
     494,  -619,  -619,  -619,  -619,  -619,  -619,  -619,  4220,  -619,
     258,   273,  4220,   330,   504,  4220,  4608,  -619,  -619,  5684,
    -619,   539,  -619,  4403,  -619,  -619,   333,  -619,  -619,   -49,
       5,   279,   279,  -619,   279,   279,  -619,   212,  -619,  5684,
    -619,  4220,  4220,  -619,  4220,  5684,  -619,  4220,  5623,   498,
    -619,  4403,  -619,  -619,  -619,   279,  -619,   279,  -619,   -41,
      88,    48,   103,   279,   279,  -619,  -619,   576,  -619,  -619,
     339,  -619,  4220,   343,  -619,  -619,    94,   501,   505,   279,
    -619,   279,  -619,   279,  -619,   279,  -619,    55,   114,  4220,
     506,  -619,  4220,  1450,  -619,  -619,  -619,   513,   514,   516,
     522,   279,  -619,   279,  -619,  -619,  -619,  -619,  -619,  -619,
    -619,  -619,  -619,  -619,   524,   525,  -619,  -619
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -619,   329,  -619,  -619,   -92,   438,  -619,  -619,     0,  -619,
     -21,   340,   350,   394,   348,   515,   523,   526,   531,   521,
    -619,    52,     1,   638,   -14,   107,  -350,  -619,    16,  -619,
     586,  -619,    33,   -65,   -63,  -619,  -619,  -481,  -619,   262,
     811,   782,   -71,   934,  -139,    -8,    67,  -243,  -266,   256,
    -619,  -619,  -261,  -619,   136,    72,  1103,   228,   312,  -175,
    -112,  -100,    39,  -267,  1059,  -182,  -334,  -619,   992,  -619,
     756,  -153,  -619,   313,  -619,    73,  -618,  -322,  -619,  -340,
    -619,  -619,   209,  -619,  -619,   517,  -518,  -619,  -619,  -619,
      -2,  -319,   918,  -619,  -619,  -619,  -619,  -619,  -619,  -619,
     468,   344,   470,   471,  -619,  -140,  -619
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
     167,   685,     2,   242,   200,    83,   200,   179,    96,   709,
     198,   166,   198,   167,   473,   102,   423,   102,   247,   347,
     214,   107,   502,     2,   430,     2,   351,   615,   359,    29,
       2,    29,   406,     2,   517,   289,   449,   451,   331,   268,
     454,     2,    94,   705,   294,    94,     2,   211,     8,   331,
       8,   646,   139,   140,   687,   172,   149,   596,     8,   517,
     111,   373,   520,   376,   102,   355,   376,   202,   172,   202,
     107,     8,   517,   547,   686,   217,   616,   617,    29,   509,
     167,   510,   710,   246,   377,   739,   349,   521,   325,     4,
     350,   249,   250,   251,   408,    29,   244,    29,   713,   111,
      97,   424,   154,   522,   159,   731,   200,   230,   678,   160,
      29,   248,   329,   658,   167,   207,   267,   200,   381,   398,
     588,   145,   213,   329,   602,   167,   165,   146,   688,   214,
      29,    29,   269,   523,   524,   605,   620,   711,   406,   437,
     161,   162,   203,   229,   203,   166,   357,   204,   230,   204,
     618,   209,   715,   466,   165,   502,   502,   357,   395,   280,
     383,   610,   155,   733,   323,   465,   571,   572,   430,   332,
     430,   714,   177,   430,   141,   142,   468,   150,   732,   525,
     332,   352,   281,   152,   229,   582,   147,   347,    69,    70,
     610,    29,   340,   351,   632,   166,    94,   382,   610,   723,
     148,   353,   172,   152,   601,   543,   661,   662,   280,   152,
     402,   712,   152,   363,   411,   520,   334,   724,   166,    77,
     420,   230,   153,   608,   639,   609,   716,   338,   158,   364,
     431,   439,   664,   665,   230,   222,   650,   734,    94,   163,
     521,   223,   553,   605,   203,    94,   432,   165,     2,   204,
     212,   285,   172,   211,   213,   203,   522,   229,   554,   504,
     204,   693,   694,   102,   502,     2,   423,   211,   651,   597,
     229,   165,   433,     8,   411,   172,   434,    29,   670,   272,
     663,   539,   673,   648,   652,   676,   523,   524,   280,   276,
     430,   430,   407,   335,   414,   135,   136,     2,   382,   210,
     345,   112,   113,   114,   211,   516,   666,   277,   280,   532,
       8,   697,   698,   291,   699,   542,   535,   701,   214,   159,
     466,   292,   166,   541,   160,    94,   411,   430,   430,   166,
     516,   376,   613,   411,   370,   695,   118,   614,     2,   371,
     160,    29,   721,   557,   293,   280,   212,   511,   565,   512,
     213,    29,   505,   566,   165,   161,   162,   491,   671,   735,
      94,     2,   737,   211,   601,   112,   113,   114,    94,    94,
     163,   161,   162,   672,   322,   102,   326,   280,   211,   172,
     399,   107,    94,   327,   156,   339,   172,   280,   229,    29,
     626,   336,     2,   137,   138,   229,   112,   113,   114,   178,
     555,   360,     2,   372,   211,   506,   166,    94,   411,   159,
     369,   520,   374,   115,   160,   456,   116,   117,   143,   144,
     375,   240,   132,   459,   460,   245,     2,   133,   134,   391,
     674,   380,   516,   684,   356,   211,   521,   470,   211,   720,
     446,   360,   389,   722,   211,   161,   162,   229,   211,    94,
     623,   594,   522,   390,   381,   252,   253,   396,   213,   441,
      29,   516,   507,   172,   273,    29,    94,   254,   255,   516,
     411,   260,   261,   159,    29,    29,   392,   115,   160,   452,
     116,   117,   523,   524,   378,   379,   301,   442,   324,    94,
     491,   491,   453,    94,   457,   462,   458,   159,   415,   461,
     463,     2,   160,   464,   549,   472,   474,    94,   115,   161,
     162,   116,   117,   256,   257,   258,   259,   529,   357,   530,
     545,   562,     2,   550,    69,    70,   165,  -317,   585,   228,
     564,   574,   584,   161,   162,   580,   575,   118,   417,   358,
     577,   578,   357,   548,   576,   581,   230,   586,   579,   587,
     165,   640,   641,   643,  -332,    77,   589,   606,   611,  -332,
     591,   592,   583,   607,    29,    29,    29,    29,   411,    29,
     228,   612,   159,   619,   624,  -319,    29,   160,   656,   631,
     636,  -318,   229,    29,   637,   273,   273,    94,   638,   358,
    -332,  -332,    29,   159,   644,   302,   657,   649,   160,   491,
     647,   653,   669,   675,   667,   358,   301,   165,   161,   162,
     668,   118,   419,   358,   301,  -320,  -321,   357,    29,   704,
     719,   436,    29,   358,   725,    29,    29,   736,   726,   161,
     162,   301,   301,    29,   682,   301,   740,   741,   357,   742,
     262,   700,   629,   228,   703,   743,   165,   746,   747,   263,
     266,    29,    29,   264,    29,    29,   228,    29,    29,   265,
     151,    29,   682,   208,   680,   556,   358,   560,   508,   628,
     488,   119,   120,   121,   122,   123,   124,   125,   126,   127,
     128,    94,    29,   603,   519,   273,   366,   503,   367,   368,
     358,   358,     0,     0,     0,     0,     0,   358,     0,    29,
       0,    94,    29,    29,   682,     0,     0,     0,     0,   531,
     534,     0,     0,     0,     0,   540,   358,     0,   301,     0,
     358,     0,   358,   302,     0,   358,     0,     0,     0,   358,
     362,     0,     0,     0,     0,   358,   679,   358,     0,     0,
     302,   302,     0,     0,   302,     0,     0,     0,   358,     0,
       0,     0,     0,     0,     0,     0,   696,     0,   301,     0,
     301,   301,   301,   301,     0,     0,     0,     0,     0,     0,
       0,    86,     0,     0,    86,     0,     0,     0,   105,     0,
       0,   228,     0,     0,     0,     0,     0,     0,     0,   488,
       0,   590,     0,   129,     0,   595,     0,     0,     0,     0,
     419,     0,     0,   488,   488,     0,     1,   104,     2,     3,
       4,   105,     0,     0,   443,   444,   445,   447,   301,   176,
     301,     0,     0,     0,   358,   358,     0,     0,     0,     0,
       0,     0,   176,     8,     0,     0,     0,     0,     0,   221,
     104,     0,     0,     0,     0,    86,     0,     0,   621,   302,
     622,     0,     0,   358,     0,     0,     0,     0,    86,     0,
     105,   358,   358,     0,     0,    86,   358,   302,     0,   302,
     302,   302,   302,   105,   170,   633,     9,    10,     0,     0,
     301,   301,     0,     0,     0,     0,   199,   170,   199,   104,
       0,     0,     0,   488,   215,     0,     0,     0,     0,   176,
       0,   288,     0,   290,     0,   488,     0,    12,    13,     0,
       0,     0,   488,     0,   105,     0,     0,   301,   301,     0,
     278,     0,     0,    15,    51,    86,    17,   302,     0,   302,
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
     105,   105,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   387,     0,   514,     0,   387,   173,   413,   387,     0,
       0,     0,   551,     0,     0,     0,   385,     0,   558,     0,
     559,     0,     0,     0,     0,   171,     0,   316,     0,   316,
       0,   567,     0,     0,     0,     0,     0,     0,     0,     0,
     385,   513,     0,     0,     0,     0,     0,   385,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     0,     0,     0,     0,   385,     0,
     513,     0,   385,     0,     0,   385,     0,     0,     8,   513,
       0,     0,     0,   387,     0,   385,     0,     0,     0,   316,
     316,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   387,   514,     0,
     173,     0,   108,     0,     0,     0,     0,   173,     0,     0,
       0,     9,    10,    11,     0,     0,   316,   316,     0,     0,
       0,     0,     0,     0,     0,     0,   387,     0,     0,     0,
       0,     0,     0,     0,   627,   387,     0,     0,     0,   630,
     385,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,    16,
       0,    17,     0,     0,   385,   513,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   681,   738,   173,     0,     0,     0,     0,     0,
       0,     0,     0,   385,     0,     0,     0,     0,     0,     0,
       0,   385,   385,     0,     0,     0,   513,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   387,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,   475,   476,
     477,   478,   479,   480,   481,   482,   483,   484,   485,     0,
       0,     0,    76,     0,     0,     0,     0,     9,    10,    11,
       0,    77,     0,   486,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
     385,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    80,    81,
       0,     0,     0,    82,    15,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   487,   360,  -369,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,     0,   475,
     476,   477,   478,   479,   480,   481,   482,   483,   484,   485,
       0,     0,     0,    76,     0,     0,     0,     0,     9,    10,
      11,     0,    77,     0,   486,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    80,
      81,     0,     0,     0,    82,    15,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   487,   360,
    -368,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
     475,   476,   477,   478,   479,   480,   481,   482,   483,   484,
     485,     0,     0,     0,    76,     0,     0,     0,     0,     9,
      10,    11,     0,    77,     0,   486,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      80,    81,     0,     0,     0,    82,    15,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   487,
     360,  -370,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    76,     0,     0,     0,     0,
       9,    10,    11,     0,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    80,    81,     0,     0,     0,    82,    15,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     224,   225,   226,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    76,     0,     0,     0,
       0,     9,    10,    11,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    80,    81,     0,     0,     0,    82,    15,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   224,   225,   270,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     9,    10,    11,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    80,    81,     0,     0,     0,    82,    15,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   224,   225,   354,     0,     0,     0,     0,     0,
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
      15,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   365,   225,  -424,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     9,    10,    11,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    80,    81,     0,     0,     0,
      82,    15,    16,     1,    17,     2,     3,     4,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   224,   225,   625,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
     295,     0,     0,     9,    10,     0,   159,    77,     0,     0,
     296,   160,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   161,   162,    80,    81,     0,     0,     0,    82,
      15,   297,     1,    17,     2,     3,     4,     0,     0,   165,
       0,     0,   298,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   299,     0,   300,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,   295,
       0,     0,     9,    10,     0,   159,    77,     0,     0,   296,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,    15,
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
     161,   162,    80,    81,     0,     0,     0,    82,    15,   297,
       1,    17,     2,     3,     4,     0,     0,   165,     0,     0,
     298,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   299,     0,   448,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    76,     0,   295,     0,     0,
       9,    10,     0,   159,    77,     0,     0,   296,   160,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   161,
     162,    80,    81,     0,     0,     0,    82,    15,   297,     1,
      17,     2,     3,     4,     0,     0,   165,     0,     0,   298,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     299,     0,   450,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,   295,     0,     0,     9,
      10,     0,   159,    77,     0,     0,   296,   160,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   161,   162,
      80,    81,     0,     0,     0,    82,    15,   297,     1,    17,
       2,     3,     4,     0,     0,   165,     0,     0,   298,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   299,
       0,   568,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    76,     0,   295,     0,     0,     9,    10,
       0,   159,    77,     0,     0,   296,   160,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   161,   162,    80,
      81,     0,     0,     0,    82,    15,   297,     1,    17,     2,
       3,     4,     0,     0,   165,     0,     0,   298,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   299,     0,
     569,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    76,     0,   295,     0,     0,     9,    10,     0,
     159,    77,     0,     0,   296,   160,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   161,   162,    80,    81,
       0,     0,     0,    82,    15,   297,     1,    17,     2,     3,
       4,     0,     0,   165,     0,     0,   298,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   299,     0,   570,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,   295,     0,     0,     9,    10,     0,   159,
      77,     0,     0,   296,   160,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   161,   162,    80,    81,     0,
       0,     0,    82,    15,   297,     1,    17,     2,     3,     4,
       0,     0,   165,     0,     0,   298,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   299,     0,   573,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,   295,     0,     0,     9,    10,     0,   159,    77,
       0,     0,   296,   160,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   161,   162,    80,    81,     0,     0,
       0,    82,    15,   297,     1,    17,     2,     3,     4,     0,
       0,   165,     0,     0,   298,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   299,     0,   634,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,   295,     0,     0,     9,    10,     0,   159,    77,     0,
       0,   296,   160,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   161,   162,    80,    81,     0,     0,     0,
      82,    15,   297,     1,    17,     2,     3,     4,     0,     0,
     165,     0,     0,   298,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   299,     0,   635,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
     295,     0,     0,     9,    10,     0,   159,    77,     0,     0,
     296,   160,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   161,   162,    80,    81,     0,     0,     0,    82,
      15,   297,     1,    17,     2,     3,     4,     0,     0,   165,
       0,     0,   298,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   299,     0,   654,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,   295,
       0,     0,     9,    10,     0,   159,    77,     0,     0,   296,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,    15,
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
       0,    80,    81,     0,     0,     0,    82,    15,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     1,     0,     2,     3,     4,     5,     0,     6,     7,
     487,   360,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,   475,   476,   477,   478,   479,   480,   481,   482,
     483,   484,   485,     8,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     8,     0,     9,    10,    11,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,    12,    13,     0,
       0,   487,   360,     0,    14,     0,     0,     9,    10,    11,
       0,     0,     0,    15,    16,   241,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   225,    12,    13,
       0,     0,     0,     0,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     0,     0,
       0,     8,     0,     0,     0,     0,     0,     0,   225,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,    10,    11,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,    15,    16,     1,    17,     2,     3,     4,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   681,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,    76,     0,
     295,     0,     0,     9,    10,     0,   159,    77,     0,     0,
     296,   160,     8,     0,     0,     0,     0,    78,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,    79,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   161,   162,    80,    81,     8,     0,     0,    82,
      15,   297,     0,    17,     0,     9,    10,    11,     0,   165,
       0,     1,   298,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,   299,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     8,     9,
      10,    11,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,    16,   645,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     0,     0,     0,     0,
      12,    13,     0,     0,     0,   487,     0,    14,     0,     0,
       0,     9,    10,    11,     0,     0,    15,    16,   677,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   487,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     2,    15,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   593,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,   400,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,   159,    77,
       0,     0,     0,   160,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,   162,    80,    81,     0,     0,
       0,    82,     2,   212,     0,     0,     0,   213,     0,     0,
       0,   165,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   533,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    76,     0,     0,     0,     0,
       0,     0,     0,   159,    77,     0,     0,     0,   160,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   161,
     162,    80,    81,     0,     0,     0,    82,     2,   416,     0,
       0,     0,     0,     0,     0,     0,   165,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   417,     0,
     418,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      76,     0,     0,     0,     0,     0,     0,     0,   159,    77,
       0,     0,     0,   160,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,   162,    80,    81,     0,     0,
       0,    82,     1,   357,     2,     3,     4,     5,     0,     6,
       7,   165,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   598,     0,     0,     0,     8,
       0,     0,     0,     0,     0,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     9,    10,    11,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,    12,    13,     0,     0,     0,     0,     0,
      14,   161,   162,    80,    81,     0,     0,     0,     0,    15,
     409,   100,    17,     0,     0,     0,     0,    18,   410,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,     0,     0,     0,     0,     0,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    76,     0,
       0,     0,     0,     9,    10,    11,     1,    77,     2,     3,
       4,     5,     0,     6,     7,     0,     0,    78,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,    79,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    80,    81,     0,     8,     0,     0,
      15,    16,   100,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,   159,
       0,     0,     0,     0,   160,     0,     0,     0,     0,     0,
       9,    10,    11,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,    12,    13,     0,
       0,     0,     0,     0,    14,   161,   162,     0,     0,     0,
       8,    12,    13,    15,   409,   100,    17,     0,    14,     0,
       0,    18,   410,    20,    21,    22,    23,    15,    16,   100,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
      15,    16,     0,    17,     0,     0,   344,     0,    18,    19,
      20,    21,    22,    23,     9,    10,    11,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,     0,     0,     0,     8,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     8,     0,
       0,    15,    16,     0,    17,     0,     0,   469,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     8,    12,    13,    15,    16,     0,    17,     0,    14,
     561,     0,    18,    19,    20,    21,    22,    23,    15,    16,
     642,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     9,    10,    11,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
       0,    15,    16,   702,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     9,    10,    11,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     0,     0,     8,
       0,     0,    15,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     9,    10,
      11,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     0,
       0,     0,     8,    12,    13,    15,    49,     0,    17,     0,
      14,     0,     0,    18,    19,    20,    21,    22,    23,    15,
      51,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     9,    10,    11,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     0,
       0,     2,     0,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,    98,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   159,    77,     0,     0,     0,   160,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     2,     0,     0,     0,     0,     0,     0,   161,   162,
      80,    81,     0,     0,     0,    82,     0,   381,   341,     0,
       0,   213,     0,     0,     0,   165,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   159,    77,     0,     0,     0,   160,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     2,     0,     0,     0,     0,     0,     0,   161,   162,
      80,    81,     0,     0,     0,    82,     0,   381,     0,     0,
       0,   213,     0,     0,     0,   165,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,   159,    77,     0,     0,     0,   160,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     2,     0,     0,     0,     0,     0,     0,   161,   162,
      80,    81,     0,     0,     0,    82,     0,   357,     0,     0,
       0,     0,     0,     0,     0,   165,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,    81,     0,     0,     0,    82,     0,     0,   435,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,     0,
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
     163,     0,     0,     0,   164,     0,     0,     0,   165,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,     0,
     163,     0,     0,     0,   206,     0,     0,     0,   165,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,    80,    81,     0,     0,     0,    82,     0,
     163,   279,     0,     0,     0,     0,     0,     0,   165,     8,
      54,    55,    56,    57,    58,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,    69,    70,   191,   192,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   193,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   194,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,   195,   196,     0,     0,     0,    82,     0,
     163,     0,     0,     0,   328,     0,     0,     0,   165,     8,
      54,    55,    56,    57,    58,   181,   182,   183,   184,   185,
     186,   187,   188,   189,   190,    69,    70,   191,   192,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   193,     0,     0,
       0,     0,     0,     0,     0,   159,    77,     0,     0,     0,
     160,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   194,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   161,   162,   195,   196,     0,     0,     0,    82,     0,
     163,     0,     0,     8,   337,     0,     0,     0,   165,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,   159,
      77,     0,     0,     0,   160,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   161,   162,    80,    81,     0,
       0,     0,     0,     0,   212,     0,     0,     0,   213,     0,
       0,     0,   165,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    76,     0,     0,     0,     0,     0,     0,     0,     0,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,    81,     0,
       0,     0,    82,     0,     0,   397,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    76,     0,     0,     0,     0,     0,
       0,     0,     0,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,    81,     0,     0,     0,    82,     0,     0,   467,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    76,     0,     0,
       0,     0,     0,     0,     0,     0,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,    81,     0,     0,     0,    82,     0,
     546,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,   518,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,    81,     0,     0,     0,
      82,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,    81,     0,     0,     0,
      82,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,   400,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    76,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,    81,     0,     0,     0,
      82,     8,    54,    55,    56,    57,    58,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,    69,    70,   191,
     192,    73,    74,    75,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   193,
       0,     0,     0,     0,     0,     0,     0,     0,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   194,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   195,   196,     0,     0,     0,
      82
};

static const yytype_int16 yycheck[] =
{
       0,     0,    16,   103,    75,     5,     6,     7,    16,    30,
     163,   361,   152,   280,    14,    17,    16,     3,    83,    90,
      83,    70,     3,   115,    95,     9,    97,    90,    12,    70,
      95,    96,    97,    96,   356,    49,   303,    51,   130,   214,
     103,    49,   361,     3,   305,     3,   221,   528,   230,    49,
       3,    51,   295,     3,   388,   167,   322,   323,   197,   151,
     326,     3,    10,   681,   176,    13,     3,   125,    28,   208,
      28,   589,    12,    13,    69,    83,    17,   139,    28,   413,
     142,   139,     3,   125,    98,   225,   125,    95,    96,    97,
      98,    28,   426,   415,   143,   103,    69,    70,    98,   141,
     163,   143,   143,   117,   143,   723,   119,    28,   179,     5,
     123,   132,   133,   134,   296,   115,   115,   117,    70,   142,
      13,   303,    49,    44,    74,    70,   197,   111,   646,    79,
     130,   130,   197,   614,   197,    96,   150,   208,   119,   292,
     480,   126,   123,   208,   494,   208,   127,   136,   143,   212,
     150,   151,   151,    74,    75,   495,   142,    69,   401,   312,
     110,   111,    95,   111,    97,   230,   119,    95,   152,    97,
     143,    98,    69,   348,   127,   494,   495,   119,   290,   163,
     280,   515,   142,    69,   142,   124,   452,   453,   449,   197,
     451,   143,   142,   454,   134,   135,   349,   138,   143,   120,
     208,   222,   163,   142,   152,   124,   137,   382,    44,    45,
     544,   211,   211,   388,   124,   280,   164,   280,   552,   125,
      16,   223,   230,   142,   491,   407,    69,    70,   212,   142,
     295,   143,   142,   125,   297,     3,   197,   143,   303,    75,
     303,   225,     0,   509,   584,   511,   143,   208,   119,   141,
     125,   314,    69,    70,   238,   120,   596,   143,   206,   119,
      28,   122,   125,   603,   197,   213,   141,   127,     3,   197,
     119,   164,   280,   125,   123,   208,    44,   225,   141,   371,
     208,    69,    70,   297,   603,     3,   553,   125,   125,   141,
     238,   127,   119,    28,   357,   303,   123,   297,   638,   120,
     143,   401,   642,   141,   141,   645,    74,    75,   292,   142,
     571,   572,   296,   206,   298,   128,   129,     3,   381,   120,
     213,     7,     8,     9,   125,   388,   143,   142,   312,   400,
      28,   671,   672,   119,   674,   406,   401,   677,   401,    74,
     515,   119,   407,   406,    79,   293,   409,   608,   609,   414,
     413,   125,   120,   416,   120,   143,    27,   125,     3,   125,
      79,   361,   702,   426,   123,   349,   119,   141,   120,   143,
     123,   371,   371,   125,   127,   110,   111,   361,   120,   719,
     328,     3,   722,   125,   651,     7,     8,     9,   336,   337,
     119,   110,   111,   120,   142,   409,   142,   381,   125,   407,
     293,   409,   350,   119,    75,   120,   414,   391,   356,   409,
     550,   123,     3,    10,    11,   363,     7,     8,     9,    90,
     139,   142,     3,   124,   125,   373,   491,   375,   491,    74,
     143,     3,   143,   119,    79,   328,   122,   123,    14,    15,
     140,   112,   127,   336,   337,   116,     3,   132,   133,   125,
     120,   120,   515,   120,   140,   125,    28,   350,   125,   120,
     141,   142,   120,   120,   125,   110,   111,   415,   125,   417,
     541,   485,    44,   120,   119,   135,   136,   119,   123,   141,
     480,   544,   375,   491,   155,   485,   434,   137,   138,   552,
     553,   143,   144,    74,   494,   495,   124,   119,    79,   142,
     122,   123,    74,    75,   276,   277,   177,   141,   179,   457,
     494,   495,   142,   461,   123,   120,   124,    74,   140,   123,
     120,     3,    79,   124,   417,   143,   143,   475,   119,   110,
     111,   122,   123,   139,   140,   141,   142,   120,   119,   124,
     120,   434,     3,   142,    44,    45,   127,   142,   119,   111,
     120,   120,   139,   110,   111,   120,   124,   228,   139,   230,
     124,   124,   119,   120,   457,   124,   550,   119,   461,   119,
     127,   585,   586,   587,    74,    75,   119,   143,   120,    79,
     141,   141,   475,   141,   584,   585,   586,   587,   651,   589,
     152,   119,    74,   142,   120,   142,   596,    79,   612,   124,
     124,   142,   550,   603,   124,   276,   277,   555,   139,   280,
     110,   111,   612,    74,    56,   177,   120,   140,    79,   603,
     141,   140,   139,   119,   142,   296,   297,   127,   110,   111,
     143,   302,   303,   304,   305,   142,   142,   119,   638,   141,
      64,   312,   642,   314,   143,   645,   646,   141,   143,   110,
     111,   322,   323,   653,   653,   326,   143,   143,   119,   143,
     145,   675,   555,   225,   678,   143,   127,   143,   143,   146,
     149,   671,   672,   147,   674,   675,   238,   677,   678,   148,
      42,   681,   681,    97,   651,   423,   357,   431,   376,   553,
     361,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   649,   702,   494,   391,   376,   238,   363,   238,   238,
     381,   382,    -1,    -1,    -1,    -1,    -1,   388,    -1,   719,
      -1,   669,   722,   723,   723,    -1,    -1,    -1,    -1,   400,
     401,    -1,    -1,    -1,    -1,   406,   407,    -1,   409,    -1,
     411,    -1,   413,   305,    -1,   416,    -1,    -1,    -1,   420,
     233,    -1,    -1,    -1,    -1,   426,   649,   428,    -1,    -1,
     322,   323,    -1,    -1,   326,    -1,    -1,    -1,   439,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   669,    -1,   449,    -1,
     451,   452,   453,   454,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     9,    -1,    -1,    12,    -1,    -1,    -1,    16,    -1,
      -1,   363,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   480,
      -1,   482,    -1,   140,    -1,   486,    -1,    -1,    -1,    -1,
     491,    -1,    -1,   494,   495,    -1,     1,    16,     3,     4,
       5,    49,    -1,    -1,   317,   318,   319,   320,   509,    83,
     511,    -1,    -1,    -1,   515,   516,    -1,    -1,    -1,    -1,
      -1,    -1,    96,    28,    -1,    -1,    -1,    -1,    -1,   103,
      49,    -1,    -1,    -1,    -1,    83,    -1,    -1,   539,   431,
     541,    -1,    -1,   544,    -1,    -1,    -1,    -1,    96,    -1,
      98,   552,   553,    -1,    -1,   103,   557,   449,    -1,   451,
     452,   453,   454,   111,    83,   566,    71,    72,    -1,    -1,
     571,   572,    -1,    -1,    -1,    -1,    95,    96,    97,    98,
      -1,    -1,    -1,   584,   103,    -1,    -1,    -1,    -1,   163,
      -1,   165,    -1,   167,    -1,   596,    -1,   102,   103,    -1,
      -1,    -1,   603,    -1,   152,    -1,    -1,   608,   609,    -1,
     158,    -1,    -1,   118,   119,   163,   121,   509,    -1,   511,
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
     608,   609,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   409,    -1,   411,    -1,   413,   303,   651,   416,    -1,
      -1,    -1,   420,    -1,    -1,    -1,   357,    -1,   426,    -1,
     428,    -1,    -1,    -1,    -1,   491,    -1,   509,    -1,   511,
      -1,   439,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     381,   382,    -1,    -1,    -1,    -1,    -1,   388,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   409,    -1,
     411,    -1,   413,    -1,    -1,   416,    -1,    -1,    28,   420,
      -1,    -1,    -1,   491,    -1,   426,    -1,    -1,    -1,   571,
     572,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   515,   516,    -1,
     407,    -1,   409,    -1,    -1,    -1,    -1,   414,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,   608,   609,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   544,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   552,   553,    -1,    -1,    -1,   557,
     491,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,   515,   516,   126,   127,   128,   129,
     130,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   142,   143,   491,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   544,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   552,   553,    -1,    -1,    -1,   557,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   651,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     651,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,   118,   119,    -1,   121,    -1,    -1,
      -1,    -1,   126,   127,   128,   129,   130,   131,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   141,   142,   143,
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
     113,    -1,    -1,    -1,   117,   118,   119,    -1,   121,    -1,
      -1,    -1,    -1,   126,   127,   128,   129,   130,   131,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   141,   142,
     143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,   121,
      -1,    -1,    -1,    -1,   126,   127,   128,   129,   130,   131,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   141,
     142,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,
     121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,   130,
     131,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     141,   142,   143,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,   117,   118,   119,
      -1,   121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,
     130,   131,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   141,   142,   143,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,   118,
     119,    -1,   121,    -1,    -1,    -1,    -1,   126,   127,   128,
     129,   130,   131,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   141,   142,   143,    -1,    -1,    -1,    -1,    -1,
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
     118,   119,    -1,   121,    -1,    -1,    -1,    -1,   126,   127,
     128,   129,   130,   131,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   141,   142,   143,    -1,    -1,    -1,    -1,
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
     117,   118,   119,     1,   121,     3,     4,     5,    -1,   126,
     127,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,   142,   143,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,   119,     1,   121,     3,     4,     5,    -1,    -1,   127,
      -1,    -1,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
     119,     1,   121,     3,     4,     5,    -1,    -1,   127,    -1,
      -1,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,   119,
       1,   121,     3,     4,     5,    -1,    -1,   127,    -1,    -1,
     130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   141,    -1,   143,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,   119,     1,
     121,     3,     4,     5,    -1,    -1,   127,    -1,    -1,   130,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     141,    -1,   143,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,   119,     1,   121,
       3,     4,     5,    -1,    -1,   127,    -1,    -1,   130,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,
      -1,   143,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,   118,   119,     1,   121,     3,
       4,     5,    -1,    -1,   127,    -1,    -1,   130,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,
     143,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,   118,   119,     1,   121,     3,     4,
       5,    -1,    -1,   127,    -1,    -1,   130,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,   119,     1,   121,     3,     4,     5,
      -1,    -1,   127,    -1,    -1,   130,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   141,    -1,   143,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,   118,   119,     1,   121,     3,     4,     5,    -1,
      -1,   127,    -1,    -1,   130,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   141,    -1,   143,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,   118,   119,     1,   121,     3,     4,     5,    -1,    -1,
     127,    -1,    -1,   130,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   141,    -1,   143,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
     118,   119,     1,   121,     3,     4,     5,    -1,    -1,   127,
      -1,    -1,   130,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,   118,
     119,    -1,   121,    -1,    -1,    -1,    -1,    -1,   127,    -1,
       1,   130,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   141,    -1,   143,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,   112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,
     121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,   130,
     131,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     141,   142,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    28,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    28,    -1,    71,    72,    73,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   118,   119,
      -1,   121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,
     130,   131,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,   141,   142,    -1,   109,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,   118,   119,   120,   121,    -1,    -1,    -1,
      -1,   126,   127,   128,   129,   130,   131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   142,   102,   103,
      -1,    -1,    -1,    -1,     1,   109,     3,     4,     5,     6,
      -1,     8,     9,    -1,   118,   119,    -1,   121,    -1,    -1,
      -1,    -1,   126,   127,   128,   129,   130,   131,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,   142,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,     1,   121,     3,     4,     5,    -1,   126,
     127,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   142,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    28,    -1,    -1,    -1,    -1,    85,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    28,    -1,    -1,   117,
     118,   119,    -1,   121,    -1,    71,    72,    73,    -1,   127,
      -1,     1,   130,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    28,    71,
      72,    73,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,   119,   120,   121,    -1,    -1,    -1,    -1,
     126,   127,   128,   129,   130,   131,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,   141,    -1,   109,    -1,    -1,
      -1,    71,    72,    73,    -1,    -1,   118,   119,   120,   121,
      -1,    -1,    -1,    -1,   126,   127,   128,   129,   130,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   141,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   118,   119,
      -1,   121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,
     130,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   141,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,     3,   119,    -1,    -1,    -1,   123,    -1,    -1,
      -1,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   142,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,     3,   119,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   127,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
     141,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,     1,   119,     3,     4,     5,     6,    -1,     8,
       9,   127,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   141,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,   112,   113,    -1,    -1,    -1,    -1,   118,
     119,   120,   121,    -1,    -1,    -1,    -1,   126,   127,   128,
     129,   130,   131,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,     1,    75,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    85,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,   100,    28,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,    -1,    28,    -1,    -1,
     118,   119,   120,   121,    -1,    -1,    -1,    -1,   126,   127,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      -1,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,    -1,    -1,    -1,
      28,   102,   103,   118,   119,   120,   121,    -1,   109,    -1,
      -1,   126,   127,   128,   129,   130,   131,   118,   119,   120,
     121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,   130,
     131,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,   127,
     128,   129,   130,   131,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,   118,   119,    -1,   121,    -1,    -1,   124,    -1,   126,
     127,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,   118,   119,    -1,   121,    -1,   109,
     124,    -1,   126,   127,   128,   129,   130,   131,   118,   119,
     120,   121,    -1,    -1,    -1,    -1,   126,   127,   128,   129,
     130,   131,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    71,    72,    73,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   118,   119,   120,   121,    -1,    -1,    -1,    -1,   126,
     127,   128,   129,   130,   131,    71,    72,    73,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,   118,   119,    -1,   121,    -1,    -1,    -1,    -1,
     126,   127,   128,   129,   130,   131,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,   118,   119,    -1,   121,    -1,
     109,    -1,    -1,   126,   127,   128,   129,   130,   131,   118,
     119,    -1,   121,    -1,    -1,    -1,    -1,   126,   127,   128,
     129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,
      -1,     3,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,   119,    -1,   121,    -1,    -1,    -1,    -1,
     126,   127,   128,   129,   130,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,   119,   120,    -1,
      -1,   123,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,
      -1,   123,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,   120,    -1,    -1,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    -1,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    -1,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,   120,    -1,    -1,    -1,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    -1,   123,    -1,    -1,    -1,   127,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    28,   123,    -1,    -1,    -1,   127,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,   123,    -1,
      -1,    -1,   127,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,    -1,
     119,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   118,   119,   121,   126,   127,
     128,   129,   130,   131,   145,   146,   147,   149,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,   162,
     163,   164,   165,   166,   185,   186,   234,   236,   250,   119,
     152,   119,   152,   152,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    66,    75,    85,   100,
     112,   113,   117,   172,   177,   184,   185,   187,   189,   190,
     191,   199,   200,   152,   165,   169,   172,   169,   119,   152,
     120,   166,   168,   171,   184,   185,   187,   189,   200,   219,
     234,   142,     7,     8,     9,   119,   122,   123,   145,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,   140,
     167,   154,   127,   132,   133,   128,   129,    10,    11,    12,
      13,   134,   135,    14,    15,   126,   136,   137,    16,    17,
     138,   167,   142,     0,   219,   142,   145,   186,   119,    74,
      79,   110,   111,   119,   123,   127,   177,   178,   179,   183,
     184,   187,   189,   200,   204,   206,   214,   142,   145,   178,
     186,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    46,    47,    66,   100,   112,   113,   174,   177,   184,
     186,   188,   189,   190,   199,   200,   123,   206,   174,   219,
     120,   125,   119,   123,   178,   184,   187,   189,   200,   203,
     205,   214,   120,   122,   141,   142,   143,   148,   149,   165,
     172,   221,   237,   243,   244,   245,   246,   247,   248,   249,
     145,   120,   148,   150,   166,   145,   168,   148,   166,   154,
     154,   154,   155,   155,   156,   156,   157,   157,   157,   157,
     158,   158,   159,   160,   161,   162,   163,   168,   148,   166,
     143,   249,   120,   145,   201,   202,   142,   142,   185,   120,
     172,   206,   215,   216,   217,   169,   184,   213,   214,   204,
     214,   119,   119,   123,   204,    68,    78,   119,   130,   141,
     143,   145,   149,   172,   178,   192,   193,   194,   195,   196,
     208,   209,   211,   212,   214,   235,   236,   238,   239,   240,
     241,   242,   142,   142,   145,   186,   142,   119,   123,   177,
     184,   188,   189,   200,   206,   169,   123,   123,   206,   120,
     166,   120,   205,   215,   124,   169,   185,   203,   214,   119,
     123,   203,   154,   234,   143,   249,   140,   119,   145,   209,
     142,   228,   229,   125,   141,   141,   244,   246,   247,   143,
     120,   125,   124,   139,   143,   140,   125,   143,   201,   201,
     120,   119,   178,   205,   207,   208,   210,   212,   214,   120,
     120,   125,   124,   184,   214,   204,   119,   120,   215,   169,
      50,   173,   177,   184,   185,   187,   191,   172,   209,   119,
     127,   178,   207,   214,   172,   140,   119,   139,   141,   145,
     178,   197,   198,   207,   209,   212,   214,   212,   214,   143,
     196,   125,   141,   119,   123,   120,   145,   215,   218,   178,
     212,   141,   141,   229,   229,   229,   141,   229,   143,   192,
     143,   192,   142,   142,   192,   185,   169,   123,   124,   169,
     169,   123,   120,   120,   124,   124,   203,   120,   215,   124,
     169,   185,   143,   221,   143,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    77,   141,   145,   168,
     170,   172,   223,   224,   225,   226,   227,   229,   230,   231,
     232,   233,   235,   245,   148,   166,   165,   169,   202,   141,
     143,   141,   143,   208,   212,   214,   178,   210,    51,   217,
       3,    28,    44,    74,    75,   120,   180,   181,   182,   120,
     124,   145,   186,   142,   145,   177,   184,   185,   187,   205,
     145,   178,   186,   209,   214,   120,   119,   221,   120,   169,
     142,   212,   214,   125,   141,   139,   183,   178,   212,   212,
     193,   124,   169,   185,   120,   120,   125,   212,   143,   143,
     143,   192,   192,   143,   120,   124,   169,   124,   124,   169,
     120,   124,   124,   169,   139,   119,   119,   119,   223,   119,
     145,   141,   141,   141,   168,   145,   139,   141,   141,   175,
     176,   207,   170,   226,   170,   223,   143,   141,   192,   192,
     210,   120,   119,   120,   125,   181,    69,    70,   143,   142,
     142,   145,   145,   186,   120,   143,   249,   212,   198,   169,
     212,   124,   124,   145,   143,   143,   124,   124,   139,   223,
     168,   168,   120,   168,    56,   120,   230,   141,   141,   140,
     223,   125,   141,   140,   143,   143,   168,   120,   181,   229,
     229,    69,    70,   143,    69,    70,   143,   142,   143,   139,
     223,   120,   120,   223,   120,   119,   223,   120,   230,   169,
     176,   142,   166,   220,   120,    70,   143,    69,   143,   229,
     229,   229,   229,    69,    70,   143,   169,   223,   223,   223,
     168,   223,   120,   168,   141,   220,   222,   229,   229,    70,
     143,    69,   143,    70,   143,    69,   143,   229,   229,    64,
     120,   223,   120,   125,   143,   143,   143,   229,   229,   229,
     229,    70,   143,    69,   143,   223,   141,   223,   143,   220,
     143,   143,   143,   143,   229,   229,   143,   143
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
      case 145: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 157 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3408 "expression.ec"
	break;
      case 146: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3417 "expression.ec"
	break;
      case 149: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3426 "expression.ec"
	break;
      case 150: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3435 "expression.ec"
	break;
      case 152: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3444 "expression.ec"
	break;
      case 154: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3453 "expression.ec"
	break;
      case 155: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3462 "expression.ec"
	break;
      case 156: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3471 "expression.ec"
	break;
      case 157: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3480 "expression.ec"
	break;
      case 158: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3489 "expression.ec"
	break;
      case 159: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3498 "expression.ec"
	break;
      case 160: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3507 "expression.ec"
	break;
      case 161: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3516 "expression.ec"
	break;
      case 162: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3525 "expression.ec"
	break;
      case 163: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3534 "expression.ec"
	break;
      case 164: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3543 "expression.ec"
	break;
      case 165: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3552 "expression.ec"
	break;
      case 166: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3561 "expression.ec"
	break;
      case 168: /* "expression" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3570 "expression.ec"
	break;
      case 169: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 159 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3579 "expression.ec"
	break;
      case 170: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3588 "expression.ec"
	break;
      case 171: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3597 "expression.ec"
	break;
      case 172: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3606 "expression.ec"
	break;
      case 175: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3615 "expression.ec"
	break;
      case 176: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 173 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3624 "expression.ec"
	break;
      case 177: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3633 "expression.ec"
	break;
      case 178: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 206 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3642 "expression.ec"
	break;
      case 180: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3651 "expression.ec"
	break;
      case 181: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 207 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3660 "expression.ec"
	break;
      case 182: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 208 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3669 "expression.ec"
	break;
      case 183: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 205 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3678 "expression.ec"
	break;
      case 184: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3687 "expression.ec"
	break;
      case 185: /* "type" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3696 "expression.ec"
	break;
      case 186: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3705 "expression.ec"
	break;
      case 187: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3714 "expression.ec"
	break;
      case 188: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3723 "expression.ec"
	break;
      case 189: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3732 "expression.ec"
	break;
      case 190: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3741 "expression.ec"
	break;
      case 192: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3750 "expression.ec"
	break;
      case 193: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3759 "expression.ec"
	break;
      case 194: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3768 "expression.ec"
	break;
      case 195: /* "property" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3777 "expression.ec"
	break;
      case 196: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3786 "expression.ec"
	break;
      case 197: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3795 "expression.ec"
	break;
      case 198: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3804 "expression.ec"
	break;
      case 199: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3813 "expression.ec"
	break;
      case 200: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 165 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3822 "expression.ec"
	break;
      case 201: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3831 "expression.ec"
	break;
      case 202: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 167 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3840 "expression.ec"
	break;
      case 203: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3849 "expression.ec"
	break;
      case 204: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3858 "expression.ec"
	break;
      case 205: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3867 "expression.ec"
	break;
      case 206: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3876 "expression.ec"
	break;
      case 207: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3885 "expression.ec"
	break;
      case 208: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3894 "expression.ec"
	break;
      case 209: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3903 "expression.ec"
	break;
      case 210: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3912 "expression.ec"
	break;
      case 211: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3921 "expression.ec"
	break;
      case 212: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3930 "expression.ec"
	break;
      case 213: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3939 "expression.ec"
	break;
      case 214: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 158 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3948 "expression.ec"
	break;
      case 215: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3957 "expression.ec"
	break;
      case 216: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3966 "expression.ec"
	break;
      case 217: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3975 "expression.ec"
	break;
      case 218: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3984 "expression.ec"
	break;
      case 219: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3993 "expression.ec"
	break;
      case 220: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 172 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4002 "expression.ec"
	break;
      case 221: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 172 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4011 "expression.ec"
	break;
      case 222: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4020 "expression.ec"
	break;
      case 223: /* "statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4029 "expression.ec"
	break;
      case 224: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4038 "expression.ec"
	break;
      case 225: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4047 "expression.ec"
	break;
      case 226: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4056 "expression.ec"
	break;
      case 227: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4065 "expression.ec"
	break;
      case 228: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4074 "expression.ec"
	break;
      case 229: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4083 "expression.ec"
	break;
      case 230: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4092 "expression.ec"
	break;
      case 231: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4101 "expression.ec"
	break;
      case 232: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4110 "expression.ec"
	break;
      case 233: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 175 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4119 "expression.ec"
	break;
      case 234: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4128 "expression.ec"
	break;
      case 235: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4137 "expression.ec"
	break;
      case 236: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4146 "expression.ec"
	break;
      case 238: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4155 "expression.ec"
	break;
      case 239: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4164 "expression.ec"
	break;
      case 240: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4173 "expression.ec"
	break;
      case 241: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4182 "expression.ec"
	break;
      case 242: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4191 "expression.ec"
	break;
      case 243: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4200 "expression.ec"
	break;
      case 244: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4209 "expression.ec"
	break;
      case 245: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 182 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4218 "expression.ec"
	break;
      case 246: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4227 "expression.ec"
	break;
      case 247: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4236 "expression.ec"
	break;
      case 248: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4245 "expression.ec"
	break;
      case 249: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4254 "expression.ec"
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
#line 216 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 222 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 227 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 229 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 231 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 232 "expression.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 234 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 238 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 243 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 244 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 245 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 246 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 247 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 248 "expression.y"
    { (yyval.exp) = MkExpDummy(); yyerror(); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 252 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 257 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 258 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 259 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 260 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 262 "expression.y"
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
#line 274 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 275 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 276 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 306 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 307 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 308 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 309 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 313 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 314 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 315 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 318 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 322 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 323 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 337 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 338 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 339 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 341 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 342 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 343 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 348 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 353 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 354 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 355 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 360 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 361 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 366 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 367 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 372 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 373 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 374 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 375 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 380 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 381 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 386 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 391 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 396 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 401 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 406 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 411 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 416 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 417 "expression.y"
    { yyerror(); (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 419 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 420 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 424 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 90:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 426 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 427 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 428 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 429 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 431 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 432 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 433 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 434 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 438 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 439 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 447 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 448 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 449 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 450 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 454 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 455 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 110:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 459 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 460 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 461 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 465 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 466 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 467 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 468 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 469 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 470 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 471 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 472 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 473 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 474 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 479 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 480 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 482 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 483 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 484 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 485 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 486 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 490 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 491 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 492 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 493 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 494 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 495 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 496 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 497 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 498 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 499 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 503 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 504 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 508 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 509 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 513 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 514 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 515 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 516 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 517 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 518 "expression.y"
    { (yyval.specifier) = MkSpecifier(THREAD); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 522 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 523 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 527 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 528 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 529 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 534 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 535 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 536 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 537 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 538 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 542 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 543 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 547 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 548 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 549 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 553 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 554 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 558 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 559 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 560 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 564 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 589 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 593 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 594 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 595 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 596 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 599 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 600 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 601 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 602 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 611 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 622 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 623 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 627 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 628 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 633 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 640 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 646 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 648 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 649 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 651 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 655 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 660 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 662 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 666 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 671 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 672 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 676 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 680 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 681 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 686 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 688 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 690 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 692 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 694 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 697 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 699 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 701 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 703 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 705 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 708 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 710 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 712 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 714 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 716 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 719 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 721 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 723 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 725 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 727 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 731 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 733 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 737 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 738 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 743 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 745 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 750 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 752 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 754 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 756 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 758 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 762 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 763 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 768 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 769 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 770 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 771 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 772 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 777 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 779 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 784 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 786 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 792 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 794 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 796 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 798 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 800 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 802 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 804 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 806 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 808 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 810 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 812 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 817 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 819 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 821 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 823 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 825 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 829 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 831 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 833 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 834 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 838 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 840 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 841 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 842 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 891 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 893 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 899 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 901 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 903 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 905 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 907 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 913 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 916 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 918 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 920 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 928 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 930 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 939 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 941 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 943 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 947 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 948 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 952 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 953 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 954 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 960 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 964 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 965 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 969 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 970 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 971 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 975 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 976 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 980 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 981 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 991 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 993 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 995 "expression.y"
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
#line 1010 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1012 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1033 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1035 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1049 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1051 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1057 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1058 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1066 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1070 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1071 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1072 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1076 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1081 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1089 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1093 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1098 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1100 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1104 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1105 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1106 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1109 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1111 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1115 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1117 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1118 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1119 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1123 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1128 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1130 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1135 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1137 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1139 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1141 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1146 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1148 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1153 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1155 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1160 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1165 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1170 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1172 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1177 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1179 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1181 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1183 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1185 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1191 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1196 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1200 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1201 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1206 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1208 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1213 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1217 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1218 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1219 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1220 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1221 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1222 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1227 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1228 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1232 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7322 "expression.ec"
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
#line 1234 "expression.y"


