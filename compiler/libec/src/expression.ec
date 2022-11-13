/* A Bison parser, made by GNU Bison 2.7.12-4996.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.
   
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
#define YYBISON_VERSION "2.7.12-4996"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
/* Line 371 of yacc.c  */
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


/* Line 371 of yacc.c  */
#line 104 "expression.ec"

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
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
     FLOAT16 = 296,
     LONG = 297,
     SIGNED = 298,
     UNSIGNED = 299,
     FLOAT = 300,
     DOUBLE = 301,
     CONST = 302,
     VOLATILE = 303,
     VOID = 304,
     VALIST = 305,
     STRUCT = 306,
     UNION = 307,
     ENUM = 308,
     ELLIPSIS = 309,
     CASE = 310,
     DEFAULT = 311,
     IF = 312,
     SWITCH = 313,
     WHILE = 314,
     DO = 315,
     FOR = 316,
     GOTO = 317,
     CONTINUE = 318,
     BREAK = 319,
     RETURN = 320,
     IFX = 321,
     ELSE = 322,
     CLASS = 323,
     THISCLASS = 324,
     PROPERTY = 325,
     SETPROP = 326,
     GETPROP = 327,
     NEWOP = 328,
     RENEW = 329,
     DELETE = 330,
     EXT_DECL = 331,
     EXT_STORAGE = 332,
     IMPORT = 333,
     DEFINE = 334,
     VIRTUAL = 335,
     ATTRIB = 336,
     PUBLIC = 337,
     PRIVATE = 338,
     TYPED_OBJECT = 339,
     ANY_OBJECT = 340,
     _INCREF = 341,
     EXTENSION = 342,
     ASM = 343,
     TYPEOF = 344,
     WATCH = 345,
     STOPWATCHING = 346,
     FIREWATCHERS = 347,
     WATCHABLE = 348,
     CLASS_DESIGNER = 349,
     CLASS_NO_EXPANSION = 350,
     CLASS_FIXED = 351,
     ISPROPSET = 352,
     CLASS_DEFAULT_PROPERTY = 353,
     PROPERTY_CATEGORY = 354,
     CLASS_DATA = 355,
     CLASS_PROPERTY = 356,
     SUBCLASS = 357,
     NAMESPACE = 358,
     NEW0OP = 359,
     RENEW0 = 360,
     VAARG = 361,
     DBTABLE = 362,
     DBFIELD = 363,
     DBINDEX = 364,
     DATABASE_OPEN = 365,
     ALIGNOF = 366,
     ATTRIB_DEP = 367,
     __ATTRIB = 368,
     BOOL = 369,
     _BOOL = 370,
     _COMPLEX = 371,
     _IMAGINARY = 372,
     RESTRICT = 373,
     THREAD = 374,
     WIDE_STRING_LITERAL = 375,
     BUILTIN_OFFSETOF = 376,
     PRAGMA = 377,
     STATIC_ASSERT = 378
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 387 of yacc.c  */
#line 39 "expression.y"

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


/* Line 387 of yacc.c  */
#line 302 "expression.ec"
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

extern YYSTYPE yylval;
extern YYLTYPE yylloc;
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



/* Copy the second part of user declarations.  */

/* Line 390 of yacc.c  */
#line 343 "expression.ec"

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
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef __attribute__
/* This feature is available in gcc versions 2.5 and later.  */
# if (! defined __GNUC__ || __GNUC__ < 2 \
      || (__GNUC__ == 2 && __GNUC_MINOR__ < 5))
#  define __attribute__(Spec) /* empty */
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif


/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(N) (N)
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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
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
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
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

# define YYCOPY_NEEDED 1

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

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  156
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7840

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  149
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  108
/* YYNRULES -- Number of rules.  */
#define YYNRULES  438
/* YYNRULES -- Number of states.  */
#define YYNSTATES  760

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   378

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   136,     2,     2,   126,   138,   131,     2,
     124,   125,   132,   133,   130,   134,   127,   137,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   144,   146,
     139,   145,   140,   143,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   128,     2,   129,   141,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   147,   142,   148,   135,     2,     2,     2,
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
     115,   116,   117,   118,   119,   120,   121,   122,   123
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
     479,   481,   483,   485,   487,   489,   494,   496,   499,   503,
     510,   516,   518,   521,   523,   525,   527,   529,   531,   533,
     535,   537,   539,   541,   543,   545,   547,   549,   551,   553,
     555,   557,   559,   561,   563,   565,   567,   569,   571,   573,
     578,   580,   582,   584,   586,   588,   590,   592,   594,   596,
     598,   600,   602,   604,   606,   608,   610,   612,   614,   616,
     618,   620,   625,   627,   633,   638,   643,   647,   653,   660,
     666,   672,   677,   684,   687,   690,   694,   698,   700,   702,
     704,   707,   711,   713,   717,   727,   737,   745,   753,   759,
     770,   781,   790,   799,   806,   815,   824,   831,   838,   843,
     853,   863,   871,   879,   885,   889,   892,   895,   898,   900,
     903,   905,   907,   909,   913,   915,   918,   921,   925,   931,
     934,   937,   942,   948,   956,   964,   970,   972,   976,   978,
     982,   985,   990,   994,   997,  1001,  1005,  1009,  1014,  1019,
    1022,  1026,  1030,  1035,  1039,  1042,  1046,  1050,  1055,  1057,
    1059,  1062,  1065,  1068,  1072,  1074,  1076,  1079,  1082,  1085,
    1089,  1091,  1094,  1098,  1100,  1104,  1109,  1113,  1118,  1120,
    1123,  1126,  1130,  1134,  1136,  1138,  1141,  1144,  1147,  1151,
    1155,  1158,  1160,  1163,  1165,  1168,  1171,  1175,  1177,  1181,
    1183,  1187,  1190,  1193,  1195,  1197,  1201,  1203,  1206,  1208,
    1212,  1217,  1219,  1221,  1223,  1227,  1229,  1231,  1233,  1235,
    1237,  1239,  1243,  1248,  1252,  1254,  1257,  1259,  1262,  1265,
    1267,  1269,  1272,  1274,  1277,  1281,  1283,  1286,  1292,  1300,
    1306,  1312,  1320,  1327,  1335,  1340,  1346,  1351,  1355,  1358,
    1361,  1364,  1368,  1370,  1376,  1381,  1386,  1390,  1395,  1399,
    1403,  1406,  1409,  1411,  1415,  1420,  1424,  1427,  1430,  1433,
    1436,  1439,  1442,  1445,  1448,  1452,  1454,  1456,  1460,  1463,
    1465,  1467,  1470,  1473,  1475,  1478,  1480,  1482,  1485
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     256,     0,    -1,     3,    -1,   152,    -1,   124,   173,   125,
      -1,   150,    -1,   242,    -1,     4,    -1,   120,    -1,   240,
      -1,   126,   240,    -1,   126,   240,   127,   240,    -1,   124,
     125,    -1,    73,   177,   212,   128,   174,   129,    -1,    73,
     177,   128,   174,   129,    -1,   104,   177,   212,   128,   174,
     129,    -1,   104,   177,   128,   174,   129,    -1,    74,   174,
     179,   212,   128,   174,   129,    -1,    74,   174,   179,   128,
     174,   129,    -1,   105,   174,   179,   212,   128,   174,   129,
      -1,   105,   174,   179,   128,   174,   129,    -1,     1,    -1,
     243,    -1,   151,    -1,   154,   128,   173,   129,    -1,   154,
     124,   125,    -1,   154,   124,   155,   125,    -1,   154,   127,
     150,    -1,   154,   150,    -1,   154,     7,   150,    -1,   154,
       8,    -1,   154,     9,    -1,   171,    -1,   153,    -1,   155,
     130,   171,    -1,   155,   130,   153,    -1,     8,   157,    -1,
       9,   157,    -1,   158,   159,    -1,     6,   157,    -1,     6,
     124,   225,   125,    -1,   111,   157,    -1,   111,   124,   225,
     125,    -1,   156,    -1,   154,    -1,   131,    -1,   132,    -1,
     133,    -1,   134,    -1,   135,    -1,   136,    -1,    75,    -1,
     157,    -1,   124,   225,   125,   159,    -1,   159,    -1,   160,
     132,   159,    -1,   160,   137,   159,    -1,   160,   138,   159,
      -1,   160,    -1,   161,   133,   160,    -1,   161,   134,   160,
      -1,   161,    -1,   162,    10,   161,    -1,   162,    11,   161,
      -1,   162,    -1,   163,   139,   162,    -1,   163,   140,   162,
      -1,   163,    12,   162,    -1,   163,    13,   162,    -1,   163,
      -1,   164,    14,   163,    -1,   164,    15,   163,    -1,   164,
      -1,   165,   131,   164,    -1,   165,    -1,   166,   141,   165,
      -1,   166,    -1,   167,   142,   166,    -1,   167,    -1,   168,
      16,   167,    -1,   168,    -1,   169,    17,   168,    -1,   169,
      -1,   169,   143,   173,   144,   170,    -1,   170,    -1,   157,
     172,   171,    -1,   170,   172,   171,    -1,   157,   172,   153,
      -1,   170,   172,   153,    -1,   145,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   171,    -1,   173,
     130,   171,    -1,   170,    -1,   177,   146,    -1,   177,   180,
     146,    -1,   241,   146,    -1,    79,   150,   145,   174,   146,
      -1,   190,    -1,   176,   190,    -1,   193,    -1,   176,   193,
      -1,   206,    -1,   176,   206,    -1,   195,    -1,   176,   195,
      -1,   182,    -1,   177,   182,    -1,   190,    -1,   177,   190,
      -1,   193,    -1,   177,   193,    -1,   206,    -1,   177,   206,
      -1,   195,    -1,   177,   195,    -1,   182,    -1,   178,   182,
      -1,   190,    -1,   178,   190,    -1,   193,    -1,   178,   193,
      -1,   191,    -1,   178,   191,    -1,   182,    -1,   179,   182,
      -1,   190,    -1,   179,   190,    -1,   194,    -1,   179,   194,
      -1,   195,    -1,   179,   195,    -1,   206,    -1,   179,   206,
      -1,   181,    -1,   180,   130,   181,    -1,   213,    -1,   213,
     145,   226,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   119,    -1,    76,    -1,   188,    -1,   189,
      -1,    81,    -1,   112,    -1,   113,    -1,     3,    -1,    28,
      -1,    77,    -1,    76,    -1,    47,    -1,   185,    -1,   185,
     124,   173,   125,    -1,   186,    -1,   187,   186,    -1,   187,
     130,   186,    -1,   184,   124,   124,   187,   125,   125,    -1,
     184,   124,   124,   125,   125,    -1,   188,    -1,   189,   188,
      -1,    47,    -1,    48,    -1,    77,    -1,   192,    -1,    28,
      -1,    49,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    39,    -1,    40,    -1,    41,    -1,    50,
      -1,    42,    -1,    45,    -1,    46,    -1,    43,    -1,    44,
      -1,    87,    -1,   115,    -1,   114,    -1,   196,    -1,   205,
      -1,   191,    -1,   102,   124,   191,   125,    -1,    69,    -1,
      49,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,    41,    -1,    50,    -1,
      42,    -1,    45,    -1,    46,    -1,    43,    -1,    44,    -1,
     115,    -1,   114,    -1,   196,    -1,   205,    -1,   192,    -1,
     102,   124,   191,   125,    -1,    69,    -1,   197,   150,   147,
     198,   148,    -1,   197,   147,   198,   148,    -1,   197,   150,
     147,   148,    -1,   197,   147,   148,    -1,   197,   192,   147,
     198,   148,    -1,   197,   183,   150,   147,   198,   148,    -1,
     197,   183,   147,   198,   148,    -1,   197,   183,   150,   147,
     148,    -1,   197,   183,   147,   148,    -1,   197,   183,   192,
     147,   198,   148,    -1,   197,   150,    -1,   197,   192,    -1,
     197,   183,   150,    -1,   197,   183,   192,    -1,    51,    -1,
      52,    -1,   202,    -1,   198,   202,    -1,   154,   145,   227,
      -1,   199,    -1,   200,   130,   199,    -1,    70,   178,   150,
     147,    71,   235,    72,   235,   148,    -1,    70,   178,   150,
     147,    72,   235,    71,   235,   148,    -1,    70,   178,   150,
     147,    71,   235,   148,    -1,    70,   178,   150,   147,    72,
     235,   148,    -1,    70,   178,   150,   147,   148,    -1,    70,
     178,   211,   150,   147,    71,   235,    72,   235,   148,    -1,
      70,   178,   211,   150,   147,    72,   235,    71,   235,   148,
      -1,    70,   178,   211,   150,   147,    71,   235,   148,    -1,
      70,   178,   211,   150,   147,    72,   235,   148,    -1,    70,
     178,   211,   150,   147,   148,    -1,    70,   178,   147,    71,
     235,    72,   235,   148,    -1,    70,   178,   147,    72,   235,
      71,   235,   148,    -1,    70,   178,   147,    71,   235,   148,
      -1,    70,   178,   147,    72,   235,   148,    -1,    70,   178,
     147,   148,    -1,    70,   178,   211,   147,    71,   235,    72,
     235,   148,    -1,    70,   178,   211,   147,    72,   235,    71,
     235,   148,    -1,    70,   178,   211,   147,    71,   235,   148,
      -1,    70,   178,   211,   147,    72,   235,   148,    -1,    70,
     178,   211,   147,   148,    -1,   177,   203,   146,    -1,   177,
     146,    -1,   242,   146,    -1,   241,   146,    -1,   248,    -1,
     200,   146,    -1,   201,    -1,   146,    -1,   204,    -1,   203,
     130,   204,    -1,   213,    -1,   213,   188,    -1,   144,   174,
      -1,   213,   144,   174,    -1,   213,   144,   174,   144,   174,
      -1,    53,   150,    -1,    53,   192,    -1,    53,   147,   207,
     148,    -1,    53,   150,   147,   207,   148,    -1,    53,   150,
     147,   207,   146,   198,   148,    -1,    53,   192,   147,   207,
     146,   198,   148,    -1,    53,   192,   147,   207,   148,    -1,
     208,    -1,   207,   130,   208,    -1,   150,    -1,   150,   145,
     174,    -1,   150,   189,    -1,   150,   189,   145,   174,    -1,
     124,   211,   125,    -1,   128,   129,    -1,   128,   174,   129,
      -1,   128,   191,   129,    -1,   209,   128,   129,    -1,   209,
     128,   174,   129,    -1,   209,   128,   191,   129,    -1,   124,
     125,    -1,   124,   221,   125,    -1,   209,   124,   125,    -1,
     209,   124,   221,   125,    -1,   124,   212,   125,    -1,   124,
     125,    -1,   124,   221,   125,    -1,   210,   124,   125,    -1,
     210,   124,   221,   125,    -1,   220,    -1,   209,    -1,   220,
     209,    -1,   183,   220,    -1,   183,   209,    -1,   183,   220,
     209,    -1,   220,    -1,   210,    -1,   220,   210,    -1,   183,
     220,    -1,   183,   210,    -1,   183,   220,   210,    -1,   216,
      -1,   220,   216,    -1,   183,   220,   216,    -1,   150,    -1,
     124,   213,   125,    -1,   214,   128,   174,   129,    -1,   214,
     128,   129,    -1,   214,   128,   191,   129,    -1,   218,    -1,
     220,   218,    -1,   183,   218,    -1,   183,   220,   218,    -1,
     220,   183,   218,    -1,   218,    -1,   214,    -1,   183,   218,
      -1,   183,   214,    -1,   214,   124,    -1,   217,   221,   125,
      -1,   217,   224,   125,    -1,   217,   125,    -1,   190,    -1,
     219,   190,    -1,   132,    -1,   132,   219,    -1,   132,   220,
      -1,   132,   219,   220,    -1,   222,    -1,   222,   130,    54,
      -1,   223,    -1,   222,   130,   223,    -1,   177,   213,    -1,
     177,   211,    -1,   177,    -1,   150,    -1,   224,   130,   150,
      -1,   176,    -1,   176,   211,    -1,   171,    -1,   147,   228,
     148,    -1,   147,   228,   130,   148,    -1,   170,    -1,   153,
      -1,   226,    -1,   228,   130,   226,    -1,   230,    -1,   235,
      -1,   236,    -1,   237,    -1,   238,    -1,   239,    -1,   150,
     144,   229,    -1,    55,   174,   144,   229,    -1,    56,   144,
     229,    -1,   175,    -1,   231,   175,    -1,   229,    -1,   232,
     229,    -1,   232,   175,    -1,   232,    -1,   231,    -1,   231,
     232,    -1,   147,    -1,   147,   148,    -1,   234,   233,   148,
      -1,   146,    -1,   173,   146,    -1,    57,   124,   173,   125,
     229,    -1,    57,   124,   173,   125,   229,    67,   229,    -1,
      58,   124,   173,   125,   229,    -1,    59,   124,   173,   125,
     229,    -1,    60,   229,    59,   124,   173,   125,   146,    -1,
      61,   124,   236,   236,   125,   229,    -1,    61,   124,   236,
     236,   173,   125,   229,    -1,    59,   124,   125,   229,    -1,
      61,   124,   236,   125,   229,    -1,    61,   124,   125,   229,
      -1,    62,   150,   146,    -1,    63,   146,    -1,    64,   146,
      -1,    65,   146,    -1,    65,   173,   146,    -1,     5,    -1,
     177,   150,   147,   255,   148,    -1,   177,   150,   147,   148,
      -1,   191,   147,   255,   148,    -1,   191,   147,   148,    -1,
     150,   147,   255,   148,    -1,   150,   147,   148,    -1,   147,
     255,   148,    -1,   147,   148,    -1,   177,   215,    -1,   215,
      -1,   177,   124,   125,    -1,   135,   177,   124,   125,    -1,
      80,   177,   215,    -1,    80,   215,    -1,   244,   235,    -1,
     247,   235,    -1,   247,   146,    -1,   245,   235,    -1,   246,
     235,    -1,   177,   215,    -1,   249,   235,    -1,   154,   145,
     227,    -1,   227,    -1,   251,    -1,   252,   130,   251,    -1,
     252,   146,    -1,   253,    -1,   250,    -1,   254,   253,    -1,
     254,   250,    -1,   146,    -1,   254,   146,    -1,   254,    -1,
     252,    -1,   254,   252,    -1,   171,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   220,   220,   225,   226,   231,   233,   235,   237,   238,
     240,   241,   242,   245,   246,   247,   248,   249,   250,   251,
     252,   253,   257,   261,   262,   263,   264,   265,   266,   279,
     280,   281,   311,   312,   313,   314,   318,   319,   320,   323,
     324,   327,   328,   332,   333,   342,   343,   344,   345,   346,
     347,   348,   352,   353,   357,   358,   359,   360,   364,   365,
     366,   370,   371,   372,   376,   377,   378,   379,   380,   384,
     385,   386,   390,   391,   395,   396,   400,   401,   405,   406,
     410,   411,   415,   416,   420,   421,   422,   424,   425,   429,
     430,   431,   432,   433,   434,   435,   436,   437,   438,   439,
     443,   444,   448,   452,   453,   454,   455,   459,   460,   461,
     462,   463,   464,   465,   466,   470,   471,   472,   473,   474,
     475,   476,   477,   478,   479,   484,   485,   486,   487,   488,
     489,   490,   491,   495,   496,   497,   498,   499,   500,   501,
     502,   503,   504,   508,   509,   513,   514,   518,   519,   520,
     521,   522,   523,   527,   528,   529,   533,   534,   535,   540,
     541,   542,   543,   544,   548,   549,   553,   554,   555,   559,
     560,   564,   565,   568,   569,   570,   574,   599,   603,   604,
     605,   606,   607,   608,   609,   610,   611,   612,   613,   614,
     615,   616,   617,   618,   619,   620,   621,   622,   623,   624,
     625,   629,   630,   631,   632,   633,   634,   635,   636,   637,
     638,   639,   640,   641,   642,   643,   644,   645,   646,   647,
     648,   649,   650,   655,   656,   657,   658,   659,   662,   663,
     664,   665,   666,   671,   672,   675,   677,   682,   683,   687,
     688,   692,   696,   697,   701,   703,   705,   707,   709,   712,
     714,   716,   718,   720,   723,   725,   727,   729,   731,   734,
     736,   738,   740,   742,   747,   748,   749,   750,   751,   752,
     753,   754,   758,   760,   765,   767,   769,   771,   773,   778,
     779,   783,   785,   786,   787,   788,   792,   794,   799,   801,
     803,   804,   809,   811,   813,   815,   817,   819,   821,   823,
     825,   827,   829,   834,   836,   838,   840,   842,   847,   848,
     849,   850,   851,   852,   856,   857,   858,   859,   860,   861,
     907,   908,   910,   916,   918,   920,   922,   924,   929,   930,
     933,   935,   937,   943,   944,   945,   947,   952,   956,   958,
     960,   965,   966,   970,   971,   972,   973,   977,   978,   982,
     983,   987,   988,   989,   993,   994,   998,   999,  1008,  1010,
    1012,  1028,  1029,  1050,  1052,  1057,  1058,  1059,  1060,  1061,
    1062,  1066,  1068,  1070,  1075,  1076,  1080,  1081,  1084,  1088,
    1089,  1090,  1094,  1098,  1106,  1111,  1112,  1116,  1117,  1118,
    1122,  1123,  1124,  1125,  1127,  1128,  1129,  1133,  1134,  1135,
    1136,  1137,  1141,  1145,  1147,  1152,  1154,  1156,  1158,  1163,
    1165,  1170,  1172,  1177,  1182,  1187,  1189,  1194,  1196,  1198,
    1200,  1202,  1208,  1213,  1218,  1219,  1223,  1225,  1230,  1235,
    1236,  1237,  1238,  1239,  1240,  1244,  1245,  1246,  1250
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
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
  "SHORT", "INT", "UINT", "INT64", "INT128", "FLOAT128", "FLOAT16", "LONG",
  "SIGNED", "UNSIGNED", "FLOAT", "DOUBLE", "CONST", "VOLATILE", "VOID",
  "VALIST", "STRUCT", "UNION", "ENUM", "ELLIPSIS", "CASE", "DEFAULT", "IF",
  "SWITCH", "WHILE", "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN",
  "IFX", "ELSE", "CLASS", "THISCLASS", "PROPERTY", "SETPROP", "GETPROP",
  "NEWOP", "RENEW", "DELETE", "EXT_DECL", "EXT_STORAGE", "IMPORT",
  "DEFINE", "VIRTUAL", "ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT",
  "ANY_OBJECT", "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH",
  "STOPWATCHING", "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER",
  "CLASS_NO_EXPANSION", "CLASS_FIXED", "ISPROPSET",
  "CLASS_DEFAULT_PROPERTY", "PROPERTY_CATEGORY", "CLASS_DATA",
  "CLASS_PROPERTY", "SUBCLASS", "NAMESPACE", "NEW0OP", "RENEW0", "VAARG",
  "DBTABLE", "DBFIELD", "DBINDEX", "DATABASE_OPEN", "ALIGNOF",
  "ATTRIB_DEP", "__ATTRIB", "BOOL", "_BOOL", "_COMPLEX", "_IMAGINARY",
  "RESTRICT", "THREAD", "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF",
  "PRAGMA", "STATIC_ASSERT", "'('", "')'", "'$'", "'.'", "'['", "']'",
  "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'", "'/'", "'%'", "'<'",
  "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'", "'{'", "'}'", "$accept",
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
  "attribute_word", "attribute", "attribs_list", "attrib", "multi_attrib",
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
  "expression_unit", YY_NULL
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
     375,   376,   377,   378,    40,    41,    36,    46,    91,    93,
      44,    38,    42,    43,    45,   126,    33,    47,    37,    60,
      62,    94,   124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   149,   150,   151,   151,   152,   152,   152,   152,   152,
     152,   152,   152,   152,   152,   152,   152,   152,   152,   152,
     152,   152,   153,   154,   154,   154,   154,   154,   154,   154,
     154,   154,   155,   155,   155,   155,   156,   156,   156,   156,
     156,   156,   156,   157,   157,   158,   158,   158,   158,   158,
     158,   158,   159,   159,   160,   160,   160,   160,   161,   161,
     161,   162,   162,   162,   163,   163,   163,   163,   163,   164,
     164,   164,   165,   165,   166,   166,   167,   167,   168,   168,
     169,   169,   170,   170,   171,   171,   171,   171,   171,   172,
     172,   172,   172,   172,   172,   172,   172,   172,   172,   172,
     173,   173,   174,   175,   175,   175,   175,   176,   176,   176,
     176,   176,   176,   176,   176,   177,   177,   177,   177,   177,
     177,   177,   177,   177,   177,   178,   178,   178,   178,   178,
     178,   178,   178,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   180,   180,   181,   181,   182,   182,   182,
     182,   182,   182,   183,   183,   183,   184,   184,   184,   185,
     185,   185,   185,   185,   186,   186,   187,   187,   187,   188,
     188,   189,   189,   190,   190,   190,   191,   192,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   193,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   193,   193,   193,
     193,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   196,   196,   196,   196,   197,   197,   198,
     198,   199,   200,   200,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   202,   202,   202,   202,   202,   202,
     202,   202,   203,   203,   204,   204,   204,   204,   204,   205,
     205,   206,   206,   206,   206,   206,   207,   207,   208,   208,
     208,   208,   209,   209,   209,   209,   209,   209,   209,   209,
     209,   209,   209,   210,   210,   210,   210,   210,   211,   211,
     211,   211,   211,   211,   212,   212,   212,   212,   212,   212,
     213,   213,   213,   214,   214,   214,   214,   214,   215,   215,
     215,   215,   215,   216,   216,   216,   216,   217,   218,   218,
     218,   219,   219,   220,   220,   220,   220,   221,   221,   222,
     222,   223,   223,   223,   224,   224,   225,   225,   226,   226,
     226,   227,   227,   228,   228,   229,   229,   229,   229,   229,
     229,   230,   230,   230,   231,   231,   232,   232,   232,   233,
     233,   233,   234,   235,   235,   236,   236,   237,   237,   237,
     238,   238,   238,   238,   238,   238,   238,   239,   239,   239,
     239,   239,   240,   241,   241,   242,   242,   242,   242,   243,
     243,   244,   244,   245,   246,   247,   247,   248,   248,   248,
     248,   248,   249,   250,   251,   251,   252,   252,   253,   254,
     254,   254,   254,   254,   254,   255,   255,   255,   256
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
       1,     1,     1,     1,     1,     4,     1,     2,     3,     6,
       5,     1,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     5,     4,     4,     3,     5,     6,     5,
       5,     4,     6,     2,     2,     3,     3,     1,     1,     1,
       2,     3,     1,     3,     9,     9,     7,     7,     5,    10,
      10,     8,     8,     6,     8,     8,     6,     6,     4,     9,
       9,     7,     7,     5,     3,     2,     2,     2,     1,     2,
       1,     1,     1,     3,     1,     2,     2,     3,     5,     2,
       2,     4,     5,     7,     7,     5,     1,     3,     1,     3,
       2,     4,     3,     2,     3,     3,     3,     4,     4,     2,
       3,     3,     4,     3,     2,     3,     3,     4,     1,     1,
       2,     2,     2,     3,     1,     1,     2,     2,     2,     3,
       1,     2,     3,     1,     3,     4,     3,     4,     1,     2,
       2,     3,     3,     1,     1,     2,     2,     2,     3,     3,
       2,     1,     2,     1,     2,     2,     3,     1,     3,     1,
       3,     2,     2,     1,     1,     3,     1,     2,     1,     3,
       4,     1,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     3,     4,     3,     1,     2,     1,     2,     2,     1,
       1,     2,     1,     2,     3,     1,     2,     5,     7,     5,
       5,     7,     6,     7,     4,     5,     4,     3,     2,     2,
       2,     3,     1,     5,     4,     4,     3,     4,     3,     3,
       2,     2,     1,     3,     4,     3,     2,     2,     2,     2,
       2,     2,     2,     2,     3,     1,     1,     3,     2,     1,
       1,     2,     2,     1,     2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    21,     2,     7,   402,     0,     0,     0,   177,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   438,     0,   176,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   179,
     180,   181,   182,   183,   184,   185,   186,   188,   191,   192,
     189,   190,   173,   174,   178,   187,   237,   238,     0,   200,
     175,   193,     0,   195,   194,   152,     0,   115,   117,   198,
     119,   123,   196,     0,   197,   121,    52,   102,     0,     0,
       0,     0,    41,    12,   100,     0,   356,   107,   198,   109,
     113,   111,     0,    10,     0,     0,    30,    31,     0,     0,
       0,    28,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,    89,     0,    38,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     0,   279,
     280,     0,   153,   156,   157,   158,     0,     0,   343,   116,
       0,     0,   154,   155,   118,   120,   124,   122,   315,     0,
     314,     0,   233,     0,   234,   202,   203,   204,   205,   206,
     207,   208,   209,   211,   214,   215,   212,   213,   201,   210,
     222,     0,   217,   216,     0,   133,   135,   220,   137,   139,
     218,   219,   141,     0,     0,     0,     0,     4,     0,     0,
       0,     0,   108,   110,   114,   112,   309,   357,   308,     0,
       0,   433,     0,   408,   362,    44,   361,     0,   425,    22,
       0,   430,   426,   436,   429,     0,     0,    29,    25,    33,
       0,    32,    27,     0,    87,    85,    55,    56,    57,    59,
      60,    62,    63,    67,    68,    65,    66,    70,    71,    73,
      75,    77,    79,    81,     0,    88,    86,   406,     0,    40,
     288,     0,   286,     0,     0,     0,   304,   353,     0,     0,
     347,   349,     0,   341,   344,   345,   318,   317,     0,   172,
       0,     0,   316,     0,     0,     0,     0,   271,   226,     5,
       0,     0,     0,     0,   242,     0,   270,   239,     0,   412,
       0,   328,     0,     0,     6,     0,     0,     0,     0,   268,
       0,     0,   235,   236,     0,     0,     0,   134,   136,   138,
     140,   142,     0,     0,     0,     0,     0,    42,   101,   299,
       0,     0,   293,     0,     0,   312,   311,     0,     0,   310,
      53,    11,   410,     0,     0,     0,   323,   422,   382,     0,
     423,     0,   428,   434,   432,   437,   431,   407,    26,     0,
      24,     0,   405,     0,   171,   290,     0,   281,     0,     0,
     199,     0,     0,   352,   351,   334,   320,   333,   308,   303,
     305,     0,    14,   342,   346,   319,     0,   306,     0,     0,
       0,     0,   125,   127,   131,   129,     0,     0,   416,     0,
      46,     0,     0,     0,     0,     0,     0,     0,   265,   323,
       0,     0,   272,   274,   411,   333,     0,   330,     0,   224,
     240,     0,   269,   337,     0,   340,   354,     0,     0,     0,
     329,   267,   266,   417,   420,   421,   419,   418,   225,     0,
     231,     0,     0,     0,     0,     0,     0,     0,    16,     0,
       0,     0,   292,   300,   294,   295,   313,   301,     0,   296,
       0,     0,   409,   424,   383,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   385,     5,     0,
     374,     0,   376,   365,     0,     0,     0,   366,   367,   368,
     369,   370,     0,   427,    35,    34,    83,   289,     0,   287,
       0,   282,     0,   285,   336,   335,   311,     0,   321,   348,
     350,   159,   160,   163,   162,   161,     0,   164,   166,     0,
     307,    13,   279,   280,     0,     0,   126,   128,   132,   130,
       0,   233,     0,   234,   415,     0,   324,     0,   241,   413,
     276,     0,   335,     0,     0,   264,     0,   275,     0,   333,
     331,   243,   326,     0,     0,   338,   339,     0,   332,   223,
     229,   230,     0,     0,   227,   221,    18,     0,    15,    20,
       0,   302,   297,   298,     0,     0,     0,     0,     0,     0,
       0,     0,   398,   399,   400,     0,     0,     0,   386,   103,
       0,   143,   145,   375,     0,   378,   377,   384,   105,   291,
       0,     0,   322,   170,     0,     0,     0,   167,     0,     0,
     258,     0,     0,     0,   235,   236,   414,   404,     0,   333,
     273,   277,   335,   325,   327,   355,   228,   232,    17,    19,
       0,   373,     0,     0,     0,     0,     0,     0,     0,   397,
     401,     0,   371,     0,   104,     0,   283,   284,     0,   169,
     168,     0,     0,     0,     0,   248,     0,     0,   263,     0,
     403,     0,   372,     0,     0,   394,     0,     0,   396,     0,
       0,     0,   144,     0,   358,   146,   165,     0,   256,     0,
     257,     0,     0,     0,     0,     0,     0,   253,   278,   387,
     389,   390,     0,   395,     0,     0,   106,   363,     0,     0,
       0,     0,   246,     0,   247,     0,   261,     0,   262,     0,
       0,     0,     0,   392,     0,     0,   359,   254,   255,     0,
       0,     0,     0,     0,   251,     0,   252,   388,   391,   393,
     360,   364,   244,   245,   259,   260,     0,     0,   249,   250
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   234,    27,   250,    28,    96,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   104,   133,   499,    98,   615,   106,   311,   411,
     204,   610,   611,    87,   312,   171,   537,   538,   539,   172,
     173,    88,    44,    45,    90,   208,    91,    92,    93,   313,
     314,   315,   316,   317,   431,   432,    94,    95,   281,   282,
     226,   178,   350,   179,   422,   318,   319,   396,   320,   321,
     294,   322,   351,   290,   291,   448,   112,   695,   238,   718,
     502,   503,   504,   505,   506,   369,   507,   508,   509,   510,
     511,    46,   323,    47,   239,   325,   326,   327,   328,   329,
     240,   241,   242,   243,   244,   245,   246,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -560
static const yytype_int16 yypact[] =
{
    5758,  -560,  -560,  -560,  -560,  5792,  5867,  5867,  -560,  7537,
    5758,  -560,  7537,  5758,  5901,  -560,  5345,    45,  -560,  -560,
    -560,  -560,  -560,  -560,  -129,  -560,  -560,   447,  -560,   686,
    5758,  -560,   356,   468,   249,   102,   548,   -79,   -48,   -32,
     107,    13,   686,  -560,     2,  -560,  -560,  -560,   125,  5345,
    -560,  5499,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,    16,  -560,
    -560,  -560,    54,  -560,  -560,  -560,  6528,  -560,  -560,  -560,
    -560,  -560,  -560,   312,  -560,  -560,  -560,  -560,  7721,  6633,
    7721,  5345,  -560,  -560,  -560,   231,  7047,  -560,     2,  -560,
    -560,  -560,    86,   120,  2003,   246,  -560,  -560,  4321,   246,
    5758,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  4457,  -560,  5758,  5758,  5758,  5758,  5758,
    5758,  5758,  5758,  5758,  5758,  5758,  5758,  5758,  5758,  5758,
    5758,  5758,  5758,  5758,  4457,  2139,  -560,   179,   246,   132,
     159,   288,  -560,  -560,  -560,  -560,  6738,  5758,   198,  -560,
     167,   233,   181,   241,  -560,  -560,  -560,  -560,   235,   243,
     274,  2671,   264,    40,   279,  -560,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,
    -560,   321,  -560,  -560,  6843,  -560,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  5758,   333,  6948,   311,  -560,  5758,  6423,
    5533,   336,  -560,  -560,  -560,  -560,   142,  -560,   429,  5758,
      45,  -560,  2275,  -560,  -560,   413,  -560,  6220,  -560,  -560,
     316,  -560,  -560,   -30,  -560,  2411,   324,  -560,  -560,  -560,
     262,  -560,  -560,   474,  -560,  -560,  -560,  -560,  -560,   356,
     356,   468,   468,   249,   249,   249,   249,   102,   102,   548,
     -79,   -48,   -32,   107,   109,  -560,  -560,  -560,   335,  -560,
     205,   126,  -560,   246,   246,   372,  -560,  6115,   381,   387,
     384,  -560,   394,  -560,   198,  -560,   235,   274,   357,  -560,
    7152,  5758,   235,  7629,  6220,  5420,  7537,  -560,  -560,  -129,
     432,  4973,   139,  2795,  -560,    94,  -560,  -560,   437,  -560,
    6325,  -560,   615,   389,   397,   316,   316,   316,   459,  -560,
    2919,  3043,   380,   398,  4598,   288,  5758,  -560,  -560,  -560,
    -560,  -560,   438,   423,  5758,  5758,   444,  -560,  -560,  -560,
     451,   455,  -560,   453,   215,   142,   429,  7250,  5574,   142,
    -560,  -560,  -560,   439,  4457,   404,  -560,  -560,   441,  4168,
    -560,  4457,  -560,  -560,  -560,   -30,  -560,  -560,  -560,  4457,
    -560,  5758,  -560,  5758,  -560,   229,   246,  -560,   150,   154,
    -560,  6010,    67,  -560,  -560,   437,  -560,  -560,   466,  -560,
    -560,  7445,  -560,  -560,  -560,   235,   308,  -560,   491,   462,
      68,  4853,  -560,  -560,  -560,  -560,   641,  6220,  -560,  5209,
     756,   139,   495,   615,  7348,  4457,   207,  5758,  -560,   446,
     139,   203,  -560,   -23,  -560,   452,   615,  -560,    22,  -560,
    -560,   816,  -560,  -560,  5608,  -560,  -560,   498,   337,    22,
    -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  -560,  3167,
    -560,  3291,  3415,  4598,  3539,   500,   504,  5758,  -560,   507,
     508,  5758,  -560,  -560,  -560,  -560,   142,  -560,   502,  -560,
     511,   252,  -560,  -560,  -560,  5758,   497,   518,   519,   522,
    4304,   525,   246,   505,   513,  4734,   246,  -560,   352,   271,
    -560,  5092,  -560,  -560,  1595,  1731,   512,  -560,  -560,  -560,
    -560,  -560,   521,  -560,  -560,  -560,  -560,  -560,  5758,  -560,
    4598,  -560,  4598,  -560,   437,  -560,   466,    22,  -560,  -560,
    -560,  -560,  -560,  -560,  -560,  -560,   528,   546,  -560,   424,
    -560,  -560,  -560,  -560,   -11,   529,  -560,  -560,  -560,  -560,
      18,  -560,    68,  -560,  -560,   615,  -560,   547,  -560,  -560,
    -560,  2547,   531,   615,    60,  -560,  5758,  -560,    22,   532,
    -560,  -560,  -560,   563,   302,  -560,  -560,   246,  -560,  -560,
    -560,  -560,  3663,  3787,  -560,  -560,  -560,   568,  -560,  -560,
     569,  -560,  -560,  -560,   551,  4304,  5758,  5758,  5683,   640,
    4652,   572,  -560,  -560,  -560,   282,   530,  4304,  -560,  -560,
     307,  -560,   570,  -560,  1867,  -560,  -560,  -560,  -560,  -560,
    3911,  4035,  -560,  -560,  5758,   594,   248,  -560,   316,   316,
    -560,    33,    59,   576,  -560,  -560,  -560,  -560,   577,   579,
    -560,   580,   585,  -560,  -560,  -560,  -560,  -560,  -560,  -560,
    4304,  -560,   359,   361,  4304,   373,   609,  4304,  4686,  -560,
    -560,  5758,  -560,   404,  -560,  4474,  -560,  -560,   388,  -560,
    -560,   -16,   -40,   316,   316,  -560,   316,   316,  -560,   134,
    -560,  5758,  -560,  4304,  4304,  -560,  4304,  5758,  -560,  4304,
    5717,   592,  -560,  4474,  -560,  -560,  -560,   316,  -560,   316,
    -560,    31,     4,    66,    11,   316,   316,  -560,  -560,   673,
    -560,  -560,   396,  -560,  4304,   399,  -560,  -560,   328,   593,
     596,   316,  -560,   316,  -560,   316,  -560,   316,  -560,   130,
      35,  4304,   599,  -560,  4304,  1438,  -560,  -560,  -560,   598,
     600,   602,   603,   316,  -560,   316,  -560,  -560,  -560,  -560,
    -560,  -560,  -560,  -560,  -560,  -560,   604,   607,  -560,  -560
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -560,   351,  -560,  -560,  -107,   566,  -560,  -560,     0,  -560,
      -8,   470,   472,   425,   475,   608,   610,   613,   606,   612,
    -560,   616,     1,   716,   -13,     7,  -356,  -560,     3,  -560,
     660,  -560,   103,   -22,   -53,  -560,  -560,  -529,  -560,  -169,
     485,   228,   970,   -19,   127,  -124,   -14,   315,  -276,  -265,
     332,  -560,  -560,  -174,  -560,   211,   377,   131,   347,   383,
    -189,   -97,   -98,   -54,  -263,   954,  -209,  -369,  -560,   934,
    -560,   -44,  -132,  -560,   378,  -560,     8,  -523,  -327,  -560,
     802,  -560,  -560,   272,  -560,  -560,   375,  -559,  -560,  -560,
    -560,     6,  -360,   702,  -560,  -560,  -560,  -560,  -560,  -560,
    -560,   533,   409,   537,   539,  -560,  -138,  -560
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -436
static const yytype_int16 yytable[] =
{
      29,    43,   110,   105,   299,    50,    52,    53,   227,   512,
     627,   249,    86,   500,   102,    99,    29,   278,   114,     2,
     100,     2,   134,   113,   394,     2,   254,   416,   367,   528,
     152,   699,   355,   170,   289,   110,   105,   483,   105,   359,
     183,   658,   180,     2,     8,   214,   170,   275,   433,    29,
       4,    29,   148,   221,   528,   180,   697,   157,   163,   160,
     628,   629,   228,     2,   169,   459,   461,   528,     8,   464,
       2,     2,   176,   296,   184,   723,   205,   169,   205,   207,
     339,   207,   727,   302,   209,   176,   209,   110,   105,   164,
     165,   339,   224,   149,   363,   418,     8,   670,   558,   690,
     371,    29,   434,   721,   673,   674,   745,   253,   700,   216,
     150,   384,   288,   170,   142,   143,   372,   237,    29,   251,
      29,   566,   180,   151,   295,   156,   297,   256,   257,   258,
     676,   677,   698,    29,   255,   416,   162,   630,   725,   440,
     274,   163,     2,   109,   512,   512,   365,   111,   613,   155,
     342,   170,   724,    29,    29,   276,   153,   622,   237,   728,
     180,   346,   170,   158,   333,   632,   221,   476,   408,   287,
     717,   180,   164,   165,   292,   228,   109,   356,   161,   722,
     111,   675,   337,   746,   365,   207,   622,   331,   447,   393,
     340,   391,   168,   337,   622,   220,   207,   582,   583,   168,
     405,   340,   743,   355,   427,   705,   706,   678,   554,   359,
       2,   229,   751,   175,   726,   169,   299,   177,    29,   348,
     343,   360,   287,   176,   441,   478,   175,   353,   109,   212,
     177,   212,   111,   223,   392,   237,   361,   225,   612,   218,
     442,   144,   145,   398,   107,    72,    73,   230,   237,     2,
     404,   531,   421,   381,   512,   620,   386,   621,   430,   140,
     141,   423,  -171,   365,   567,   169,   357,   436,   438,   449,
     358,   168,   514,   176,   387,    80,   532,   107,   744,   283,
     386,   412,   707,   162,   386,   440,   163,   440,   163,   169,
     440,   166,   105,  -171,  -171,   533,   520,   176,   521,   168,
     522,   433,   523,   287,   279,    29,   284,   417,   409,   424,
     163,   531,   421,   550,   174,     2,     8,   164,   165,   164,
     165,   423,   163,   287,   534,   535,   206,   174,   206,   107,
     168,   365,   559,   564,   222,   341,   532,   476,   392,   168,
       8,   164,   165,   466,   475,   527,   341,   398,   526,   565,
     383,   469,   470,   164,   165,   533,   217,   298,   221,   300,
     287,   218,   155,   552,   175,   480,   421,   228,   177,    29,
     527,   301,   501,   421,   518,   423,   295,   555,   121,    29,
     515,   593,   423,   568,   534,   535,   563,   378,   162,   546,
     517,   543,   379,   163,   287,   169,   293,   553,   166,   155,
     612,   218,   169,   176,   287,   110,   105,     2,   440,   440,
     176,   330,   218,   210,   175,   210,     2,   608,   177,    29,
     115,   116,   117,   638,   164,   165,   334,   531,   660,   159,
     415,   644,   338,   536,   560,     2,   347,   663,   175,   115,
     116,   117,   177,   338,   182,   335,   440,   440,   421,   155,
       2,   573,   532,   664,   115,   116,   117,   423,   735,   181,
     219,   344,   576,   368,   220,   174,   247,   577,   168,     2,
     252,   533,   377,   527,   587,   211,   736,   211,   590,   169,
     162,   406,   605,   382,   683,   163,   684,   176,   135,   218,
      29,   218,   594,   136,   137,    29,   607,   390,   686,   114,
     534,   535,   527,   218,    29,    29,   399,   501,   501,   280,
     527,   421,   400,   696,   401,   174,   164,   165,   218,   210,
     423,   732,   403,   402,   734,   619,   218,   462,   365,   218,
     210,   413,   309,   635,   332,   451,   168,   118,   549,   174,
     119,   120,   162,   452,   175,   463,   109,   163,   177,   625,
     111,   175,   468,   219,   626,   177,   118,   220,   364,   119,
     120,   443,   146,   147,   237,   444,   467,   263,   264,   265,
     266,   118,   471,   641,   119,   120,   472,   425,   164,   165,
     473,   211,   474,   652,   653,   655,   121,   482,   366,   484,
     391,   541,   211,   561,   220,    29,    29,    29,    29,  -328,
      29,   138,   139,   380,   218,   456,   368,    29,   259,   260,
     421,   668,   261,   262,    29,   370,   540,   501,     2,   423,
     556,   267,   268,   575,    29,   585,    97,   591,   175,    97,
     388,   389,   177,   586,   280,   280,   588,   589,   366,   547,
     592,   595,   596,   597,     2,   174,   598,   107,   293,   600,
      29,   602,   174,   623,    29,   366,   309,    29,    29,   603,
     617,   121,   429,   366,   309,    29,   694,   618,   691,     8,
     624,   446,   636,   366,   712,   661,   631,   715,  -330,  -329,
     235,   309,   309,    29,    29,   309,    29,    29,   708,    29,
      29,   162,   643,    29,   694,   650,   163,   648,   649,   656,
     453,   454,   455,   457,   122,   123,   124,   125,   126,   127,
     128,   129,   130,   131,    29,   665,   366,   162,   659,   669,
     498,   235,   163,   679,   681,   680,  -331,   164,   165,   174,
     236,    29,  -332,   687,    29,    29,   694,   280,   716,   365,
     731,   737,   366,   366,   738,   748,   752,   310,   753,   366,
     754,   755,   758,   164,   165,   759,   269,   272,   154,   270,
     215,   542,   545,   271,   273,   385,   692,   551,   366,   519,
     309,   236,   366,   571,   366,   640,   614,   366,   374,   530,
     513,   366,   375,    97,   376,     0,     0,   366,     0,   366,
       0,     0,     0,     0,     0,     0,     0,     0,   235,     0,
     366,     0,     0,    72,    73,     0,     0,     0,     0,     0,
     309,   235,   309,   309,   309,   309,     0,     1,     0,     2,
       3,     4,     0,     0,     0,     0,     0,     0,     0,    97,
       0,   132,  -343,    80,     0,     0,    97,  -343,     0,     0,
       0,   498,     0,   601,     8,     0,     0,   606,   236,     0,
       0,     0,   429,     0,     0,   498,   498,     0,     0,     0,
       0,   236,     0,     0,     0,     0,     0,     0,  -343,  -343,
       0,   309,     0,   309,     0,     0,     0,   366,   366,   310,
       0,     0,     0,   324,     0,     0,     0,     0,   168,     9,
      10,     0,     0,     0,     0,     0,   310,   310,     0,     0,
     310,   633,     0,   634,     0,     0,   366,     0,     0,     0,
       0,     0,     0,     0,   366,   366,     0,    97,     0,   366,
      12,    13,     0,     0,     0,     0,     0,     0,   645,     0,
       0,     0,     0,   309,   309,     0,    15,   235,     0,     0,
      51,     0,    17,     0,     0,     0,   498,     0,     0,     0,
       0,     0,    97,     0,     0,     0,     0,     0,   498,     0,
      97,    97,     0,     0,     0,   498,     0,     0,     0,     0,
       0,   309,   309,     0,    97,     0,     0,     0,     0,    89,
     236,     0,    89,     0,     0,     0,   108,   236,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   516,     0,    97,
       0,   498,     0,   671,   672,   498,     0,   310,   498,     0,
       0,     0,     0,     0,   366,   324,     0,     0,     0,   108,
       0,     0,     0,     0,     0,   310,     0,   310,   310,   310,
     310,     0,   324,   324,   498,   498,   324,   498,     0,     0,
     498,   236,     0,    97,     0,     0,     0,     0,   701,   702,
       0,   703,   704,     0,     0,     0,    89,     0,     0,     0,
      97,     0,     0,     0,     0,   498,     0,     0,     0,    89,
       0,   108,   719,     0,   720,     0,    89,     0,     0,     0,
     729,   730,   498,    97,   108,   498,   310,    97,   310,     0,
       0,     0,     0,     0,     0,     0,   739,     0,   740,     0,
     741,    97,   742,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   756,     0,
     757,     0,     0,     0,     0,   108,     0,   235,     0,     0,
       0,   285,     0,     0,    97,     0,    89,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   310,   310,
       0,   108,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   324,     0,   324,   324,   324,   324,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   236,     0,     0,
       0,     0,    97,     0,     0,     0,   310,   310,     0,    89,
     354,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   108,     0,     0,     0,     0,    89,     0,     0,
       0,     0,     0,     0,     0,   108,     0,     0,     0,     0,
       0,   397,   324,     0,   324,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   397,
       0,   395,     0,     0,     0,   435,   437,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   450,    89,     0,   395,
       0,     0,     0,     0,     0,   395,     0,     0,     0,     0,
      89,     0,     0,   414,    89,     0,    89,    97,     0,     0,
       0,    89,     0,   108,   324,   324,     0,     0,     0,     0,
      89,     0,   599,     0,     0,     0,     0,    97,     0,   397,
     108,   108,     0,     0,   108,   465,     0,   616,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   395,
       0,     0,   324,   324,     0,   397,   525,    89,   481,     0,
       0,     0,   397,     0,     0,     0,     0,     0,     0,   108,
       0,     0,     0,     0,     0,   395,   524,     0,     0,     0,
       0,     0,   395,   397,     0,   525,     0,   397,     0,     0,
     397,    89,     0,     0,   562,     0,     0,     0,     0,     0,
     569,    89,   570,   395,     0,   524,     0,   395,     0,     0,
     395,   548,     0,   578,   524,     0,     0,    89,     0,   108,
     395,     0,     0,     0,    89,     0,     0,   651,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   662,
       0,     0,     0,     0,   574,     0,   616,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   108,
       0,   108,   108,   108,   108,   397,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,   682,     0,     0,   395,   685,     0,     0,   688,
     397,   525,     0,     0,     0,     0,     8,     0,     0,     0,
       0,    89,     0,     0,   108,   108,     0,     0,     0,     0,
     395,   524,     0,     0,     0,   709,   710,     0,   711,   397,
     108,   713,   108,     0,     0,     0,     0,   639,   397,     0,
       0,     0,   642,     0,     0,     0,     0,     0,     0,   395,
       0,     9,    10,    11,     0,     0,   733,   395,   395,     0,
       0,     0,   524,     0,     0,     0,     0,     0,     0,     0,
       0,   108,     0,   747,     0,     0,   749,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,   108,   108,     0,     0,     0,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   108,   693,   750,     0,     0,     0,
     108,   108,     0,     0,     0,     0,     1,   397,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   395,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
     485,   486,   487,   488,   489,   490,   491,   492,   493,   494,
     495,     0,     0,     0,    79,     0,     0,     0,     9,    10,
      11,     0,    80,     0,   496,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    83,
      84,     0,     0,     0,    85,    15,     0,     0,     0,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   497,   368,  -380,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,   485,   486,   487,   488,
     489,   490,   491,   492,   493,   494,   495,     0,     0,     0,
      79,     0,     0,     0,     9,    10,    11,     0,    80,     0,
     496,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    83,    84,     0,     0,     0,
      85,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   497,   368,  -379,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,   485,   486,   487,   488,   489,   490,   491,   492,
     493,   494,   495,     0,     0,     0,    79,     0,     0,     0,
       9,    10,    11,     0,    80,     0,   496,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    83,    84,     0,     0,     0,    85,    15,     0,     0,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   497,   368,  -381,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     9,    10,    11,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    83,    84,     0,
       0,     0,    85,    15,     0,     0,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   231,
     232,   233,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     9,    10,    11,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    83,    84,     0,     0,     0,    85,    15,
       0,     0,     0,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   231,   232,   277,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     9,    10,
      11,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    83,
      84,     0,     0,     0,    85,    15,     0,     0,     0,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   231,   232,   362,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     9,    10,    11,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    83,    84,     0,     0,     0,
      85,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   373,   232,  -435,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       9,    10,    11,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    83,    84,     0,     0,     0,    85,    15,     0,     0,
       0,    16,     1,    17,     2,     3,     4,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   231,   232,   637,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,   303,     0,     0,     9,    10,     0,   162,    80,     0,
       0,   304,   163,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   164,   165,    83,    84,     0,     0,     0,
      85,    15,     0,     0,     0,   305,     1,    17,     2,     3,
       4,     0,     0,   168,     0,     0,   306,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   307,     0,   308,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,   303,     0,     0,     9,    10,
       0,   162,    80,     0,     0,   304,   163,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   164,   165,    83,
      84,     0,     0,     0,    85,    15,     0,     0,     0,   305,
       1,    17,     2,     3,     4,     0,     0,   168,     0,     0,
     306,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   307,     0,   439,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,   303,
       0,     0,     9,    10,     0,   162,    80,     0,     0,   304,
     163,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   164,   165,    83,    84,     0,     0,     0,    85,    15,
       0,     0,     0,   305,     1,    17,     2,     3,     4,     0,
       0,   168,     0,     0,   306,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   307,     0,   458,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,   303,     0,     0,     9,    10,     0,   162,
      80,     0,     0,   304,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,    15,     0,     0,     0,   305,     1,    17,
       2,     3,     4,     0,     0,   168,     0,     0,   306,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   307,
       0,   460,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,   303,     0,     0,
       9,    10,     0,   162,    80,     0,     0,   304,   163,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   164,
     165,    83,    84,     0,     0,     0,    85,    15,     0,     0,
       0,   305,     1,    17,     2,     3,     4,     0,     0,   168,
       0,     0,   306,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   307,     0,   579,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,   303,     0,     0,     9,    10,     0,   162,    80,     0,
       0,   304,   163,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   164,   165,    83,    84,     0,     0,     0,
      85,    15,     0,     0,     0,   305,     1,    17,     2,     3,
       4,     0,     0,   168,     0,     0,   306,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   307,     0,   580,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,   303,     0,     0,     9,    10,
       0,   162,    80,     0,     0,   304,   163,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   164,   165,    83,
      84,     0,     0,     0,    85,    15,     0,     0,     0,   305,
       1,    17,     2,     3,     4,     0,     0,   168,     0,     0,
     306,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   307,     0,   581,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,   303,
       0,     0,     9,    10,     0,   162,    80,     0,     0,   304,
     163,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   164,   165,    83,    84,     0,     0,     0,    85,    15,
       0,     0,     0,   305,     1,    17,     2,     3,     4,     0,
       0,   168,     0,     0,   306,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   307,     0,   584,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,   303,     0,     0,     9,    10,     0,   162,
      80,     0,     0,   304,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,    15,     0,     0,     0,   305,     1,    17,
       2,     3,     4,     0,     0,   168,     0,     0,   306,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   307,
       0,   646,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,   303,     0,     0,
       9,    10,     0,   162,    80,     0,     0,   304,   163,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   164,
     165,    83,    84,     0,     0,     0,    85,    15,     0,     0,
       0,   305,     1,    17,     2,     3,     4,     0,     0,   168,
       0,     0,   306,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   307,     0,   647,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      79,   303,     0,     0,     9,    10,     0,   162,    80,     0,
       0,   304,   163,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   164,   165,    83,    84,     0,     0,     0,
      85,    15,     0,     0,     0,   305,     1,    17,     2,     3,
       4,     0,     0,   168,     0,     0,   306,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   307,     0,   666,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,   303,     0,     0,     9,    10,
       0,   162,    80,     0,     0,   304,   163,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   164,   165,    83,
      84,     0,     0,     0,    85,    15,     0,     0,     0,   305,
       0,    17,     0,     0,     0,     0,     0,   168,     0,     1,
     306,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,   307,     0,   667,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,   485,   486,   487,   488,   489,   490,   491,
     492,   493,   494,   495,     0,     0,     0,    79,     0,     0,
       0,     9,    10,    11,     0,    80,     0,   496,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    83,    84,     0,     0,     0,    85,    15,     0,
       0,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   497,   368,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     8,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   485,
     486,   487,   488,   489,   490,   491,   492,   493,   494,   495,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,    10,    11,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,    12,    13,     0,    16,     0,
      17,     0,    14,     0,     0,    18,    19,    20,    21,    22,
      23,    15,     0,     0,     0,    16,   248,    17,     0,     0,
     497,   368,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,   232,     0,
       0,     0,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     8,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,    15,    12,    13,
       0,    16,     0,    17,     0,    14,     0,     0,    18,    19,
      20,    21,    22,    23,    15,     0,     0,     0,    16,     1,
      17,     2,     3,     4,   232,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   693,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,    79,   303,     0,
       0,     9,    10,     0,   162,    80,     0,     0,   304,   163,
       8,     0,     0,     0,     0,    81,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
      82,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     164,   165,    83,    84,     8,     0,     0,    85,    15,     0,
       0,     0,   305,     0,    17,     9,    10,    11,     0,     0,
     168,     0,     0,   306,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   307,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    12,    13,     0,     9,
      10,    11,     8,    14,     0,     0,     0,     0,     0,     0,
       0,     0,    15,     0,     0,     0,    16,   657,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
      12,    13,     0,     0,     0,     0,     0,    14,   497,     0,
       0,     0,     0,     0,     0,     0,    15,     9,    10,    11,
      16,   689,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   497,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     2,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     604,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,   410,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,   162,
      80,     0,     0,     0,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,     0,     0,     0,     2,   219,     0,     0,
       0,   220,     0,     0,     0,   168,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     544,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,   162,
      80,     0,     0,     0,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,     0,     0,     2,     0,   426,     0,     0,
       0,     0,     0,     0,     0,   168,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   427,     0,   428,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,   162,    80,
       0,     0,     0,   163,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   164,   165,    83,    84,     0,     0,
       1,    85,     2,     3,     4,     5,   365,     6,     7,     0,
       0,     0,     0,     0,   168,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,   609,     0,
       0,     0,     0,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     9,    10,    11,   162,    80,     0,     0,     0,
     163,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,    12,    13,     0,     0,     0,     0,     0,
      14,   164,   165,    83,    84,     0,     0,     0,     0,    15,
       0,     0,     0,   419,   103,    17,     0,     0,     0,     0,
      18,   420,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,     0,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     9,    10,
      11,     1,    80,     2,     3,     4,     5,     0,     6,     7,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     8,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    83,
      84,     0,     0,     0,     0,    15,     0,     0,     0,    16,
     103,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     9,    10,    11,   162,     0,     0,     0,
       1,   163,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     8,     0,     0,
       0,    14,   164,   165,     1,     0,     2,     3,     4,     5,
      15,     6,     7,     0,   419,   103,    17,     0,     0,     0,
       0,    18,   420,    20,    21,    22,    23,     0,     0,     0,
       0,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    12,    13,     0,     9,    10,    11,     1,
      14,     2,     3,     4,     5,     0,     6,     7,     0,    15,
       0,     0,     0,    16,   103,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     8,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,     9,    10,    11,
       0,     0,     0,    15,     0,     0,     0,    16,     0,    17,
       0,     0,   352,     0,    18,    19,    20,    21,    22,    23,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,     0,     0,    16,     0,
      17,     0,     0,   479,     0,    18,    19,    20,    21,    22,
      23,     8,    12,    13,     0,     0,     0,     0,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,   572,     0,    18,
      19,    20,    21,    22,    23,     8,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    12,    13,     0,
       9,    10,    11,     1,    14,     2,     3,     4,     5,     0,
       6,     7,     0,    15,     0,     0,     0,    16,   654,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       8,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,     9,    10,    11,     0,     0,     0,    15,     0,     0,
       0,    16,   714,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     9,    10,    11,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     8,    12,    13,     0,     0,
       0,     0,     1,    14,     2,     3,     4,     5,     0,     6,
       7,     0,    15,     0,     0,     0,    49,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     8,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    13,     0,     9,    10,    11,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,    15,     0,     0,
       0,    51,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     2,     0,     0,     0,     0,     0,     0,
       0,    15,     0,     0,     0,   101,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,   162,    80,     0,     0,
       0,   163,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     2,     0,
       0,     0,   164,   165,    83,    84,     0,     0,     0,    85,
       0,     0,     0,     0,   391,   349,     0,     0,   220,     0,
       0,     0,   168,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,   162,    80,     0,     0,     0,   163,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     2,     0,     0,     0,   164,   165,    83,
      84,     0,     0,     0,    85,     0,     0,     0,     0,   391,
       0,     0,     0,   220,     0,     0,     0,   168,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,   162,    80,     0,     0,
       0,   163,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     2,     0,
       0,     0,   164,   165,    83,    84,     0,     0,     0,    85,
       0,     0,     0,     0,   365,     0,     0,     0,     0,     0,
       0,     0,   168,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
      84,     0,     0,     0,    85,     0,     0,     0,     0,     0,
     445,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,   162,
      80,     0,     0,     0,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,     0,     0,     0,     0,   219,   349,     0,
       0,   220,     0,     0,     0,   168,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,   162,    80,     0,     0,     0,   163,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     164,   165,    83,    84,     0,     0,     0,    85,     0,     0,
       0,     0,   166,     0,     0,     0,   167,     0,     0,     0,
     168,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,   162,
      80,     0,     0,     0,   163,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,    83,    84,     0,
       0,     0,    85,     0,     0,     0,     0,   166,     0,     0,
       0,   213,     0,     0,     0,   168,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,   162,    80,     0,     0,     0,   163,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     164,   165,    83,    84,     0,     0,     0,    85,     0,     0,
       0,     0,   166,   286,     0,     0,     0,     0,     0,     0,
     168,     8,    54,    55,    56,    57,    58,   185,   186,   187,
     188,   189,   190,   191,   192,   193,   194,   195,   196,   197,
      72,    73,   198,   199,    76,    77,    78,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   200,     0,     0,     0,     0,     0,     0,   162,
      80,     0,     0,     0,   163,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   201,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   164,   165,   202,   203,     0,
       0,     0,    85,     0,     0,     0,     0,   166,     0,     0,
       0,   336,     0,     0,     0,   168,     8,    54,    55,    56,
      57,    58,   185,   186,   187,   188,   189,   190,   191,   192,
     193,   194,   195,   196,   197,    72,    73,   198,   199,    76,
      77,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   200,     0,     0,
       0,     0,     0,     0,   162,    80,     0,     0,     0,   163,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     201,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     164,   165,   202,   203,     0,     0,     0,    85,     0,     0,
       0,     0,   166,     0,     0,     8,   345,     0,     0,     0,
     168,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,   162,    80,     0,     0,     0,   163,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   164,
     165,    83,    84,     0,     0,     0,     0,     0,     0,     0,
       0,   219,     0,     0,     0,   220,     0,     0,     0,   168,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,    84,     0,     0,
       0,    85,     0,     0,     0,     0,     0,   407,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,    84,     0,     0,     0,    85,
       0,     0,     0,     0,     0,   477,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    83,    84,     0,     0,     0,    85,     0,     0,
       0,     0,   557,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,   529,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
      84,     0,     0,     0,    85,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,    84,     0,     0,     0,    85,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,   410,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    83,    84,     0,     0,     0,    85,     8,
      54,    55,    56,    57,    58,   185,   186,   187,   188,   189,
     190,   191,   192,   193,   194,   195,   196,   197,    72,    73,
     198,   199,    76,    77,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     200,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   201,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   202,   203,     0,     0,     0,
      85
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-560)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,     0,    16,    16,   173,     5,     6,     7,   106,   369,
     539,   118,     9,   369,    14,    12,    16,   155,   147,     3,
      13,     3,    30,    17,   287,     3,   133,   303,   237,   398,
      17,    71,   221,    86,   166,    49,    49,   364,    51,   228,
      93,   600,    86,     3,    28,    99,    99,   154,   311,    49,
       5,    51,   131,   106,   423,    99,    72,    49,    81,    78,
      71,    72,   106,     3,    86,   330,   331,   436,    28,   334,
       3,     3,    86,   170,    93,    71,    98,    99,   100,    98,
     204,   100,    71,   180,    98,    99,   100,   101,   101,   112,
     113,   215,   106,   141,   232,   304,    28,   626,   425,   658,
     130,   101,   311,    72,    71,    72,    71,   120,   148,   101,
     142,   280,   166,   166,    12,    13,   146,   114,   118,   118,
     120,   144,   166,    16,   168,     0,   170,   135,   136,   137,
      71,    72,   148,   133,   133,   411,    76,   148,    72,   313,
     153,    81,     3,    16,   504,   505,   124,    16,   504,   147,
     204,   204,   148,   153,   154,   154,   143,   526,   155,   148,
     204,   215,   215,   147,   183,   147,   219,   356,   300,   166,
     693,   215,   112,   113,   167,   219,    49,   221,   124,   148,
      49,   148,   204,   148,   124,   204,   555,   147,   320,   287,
     204,   124,   132,   215,   563,   128,   215,   462,   463,   132,
     297,   215,    72,   392,   144,    71,    72,   148,   417,   398,
       3,   125,   735,    86,   148,   237,   385,    86,   218,   218,
     213,   229,   219,   237,   130,   357,    99,   220,   101,    98,
      99,   100,   101,   106,   287,   232,   230,   106,   501,   130,
     146,   139,   140,   287,    16,    47,    48,   127,   245,     3,
     294,     3,   305,   144,   614,   520,   130,   522,   311,    10,
      11,   305,    81,   124,   433,   287,   124,   311,   312,   322,
     128,   132,   379,   287,   148,    77,    28,    49,   148,   147,
     130,   303,   148,    76,   130,   459,    81,   461,    81,   311,
     464,   124,   305,   112,   113,    47,   146,   311,   148,   132,
     146,   564,   148,   300,   125,   305,   147,   304,   301,   306,
      81,     3,   365,   411,    86,     3,    28,   112,   113,   112,
     113,   365,    81,   320,    76,    77,    98,    99,   100,   101,
     132,   124,   125,   130,   106,   204,    28,   526,   391,   132,
      28,   112,   113,   336,   129,   398,   215,   391,   392,   146,
     145,   344,   345,   112,   113,    47,   125,   124,   411,   124,
     357,   130,   147,   416,   237,   358,   419,   411,   237,   369,
     423,   128,   369,   426,   145,   419,   420,   421,    27,   379,
     379,   129,   426,   436,    76,    77,   430,   125,    76,   411,
     383,   410,   130,    81,   391,   417,   168,   416,   124,   147,
     663,   130,   424,   417,   401,   419,   419,     3,   582,   583,
     424,   147,   130,    98,   287,   100,     3,   146,   287,   419,
       7,     8,     9,   561,   112,   113,   147,     3,   146,    78,
     303,   129,   204,   125,   427,     3,   125,   130,   311,     7,
       8,     9,   311,   215,    93,   124,   620,   621,   501,   147,
       3,   444,    28,   146,     7,     8,     9,   501,   130,   147,
     124,   128,   125,   147,   128,   237,   115,   130,   132,     3,
     119,    47,   148,   526,   467,    98,   148,   100,   471,   501,
      76,   124,   495,   148,   125,    81,   125,   501,   132,   130,
     490,   130,   485,   137,   138,   495,   144,   125,   125,   147,
      76,    77,   555,   130,   504,   505,   125,   504,   505,   158,
     563,   564,   125,   125,   130,   287,   112,   113,   130,   204,
     564,   125,   294,   129,   125,   518,   130,   147,   124,   130,
     215,   303,   181,   552,   183,   146,   132,   124,   411,   311,
     127,   128,    76,   146,   417,   147,   419,    81,   417,   125,
     419,   424,   129,   124,   130,   424,   124,   128,   145,   127,
     128,   124,    14,    15,   561,   128,   128,   142,   143,   144,
     145,   124,   128,   566,   127,   128,   125,   145,   112,   113,
     125,   204,   129,   596,   597,   598,   235,   148,   237,   148,
     124,   129,   215,   147,   128,   595,   596,   597,   598,   147,
     600,   133,   134,   129,   130,   146,   147,   607,   138,   139,
     663,   624,   140,   141,   614,   240,   125,   614,     3,   663,
     125,   146,   147,   125,   624,   125,    10,   125,   501,    13,
     283,   284,   501,   129,   283,   284,   129,   129,   287,   411,
     129,   144,   124,   124,     3,   417,   124,   419,   420,   124,
     650,   146,   424,   125,   654,   304,   305,   657,   658,   146,
     148,   310,   311,   312,   313,   665,   665,   146,   661,    28,
     124,   320,   125,   322,   687,   145,   147,   690,   147,   147,
     114,   330,   331,   683,   684,   334,   686,   687,   681,   689,
     690,    76,   129,   693,   693,   144,    81,   129,   129,    59,
     325,   326,   327,   328,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,   714,   145,   365,    76,   146,   125,
     369,   155,    81,   147,   144,   148,   147,   112,   113,   501,
     114,   731,   147,   124,   734,   735,   735,   386,   146,   124,
      67,   148,   391,   392,   148,   146,   148,   181,   148,   398,
     148,   148,   148,   112,   113,   148,   148,   151,    42,   149,
     100,   410,   411,   150,   152,   280,   663,   416,   417,   386,
     419,   155,   421,   441,   423,   564,   504,   426,   245,   401,
     371,   430,   245,   167,   245,    -1,    -1,   436,    -1,   438,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   232,    -1,
     449,    -1,    -1,    47,    48,    -1,    -1,    -1,    -1,    -1,
     459,   245,   461,   462,   463,   464,    -1,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   213,
      -1,   145,    76,    77,    -1,    -1,   220,    81,    -1,    -1,
      -1,   490,    -1,   492,    28,    -1,    -1,   496,   232,    -1,
      -1,    -1,   501,    -1,    -1,   504,   505,    -1,    -1,    -1,
      -1,   245,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,
      -1,   520,    -1,   522,    -1,    -1,    -1,   526,   527,   313,
      -1,    -1,    -1,   181,    -1,    -1,    -1,    -1,   132,    73,
      74,    -1,    -1,    -1,    -1,    -1,   330,   331,    -1,    -1,
     334,   550,    -1,   552,    -1,    -1,   555,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   563,   564,    -1,   301,    -1,   568,
     104,   105,    -1,    -1,    -1,    -1,    -1,    -1,   577,    -1,
      -1,    -1,    -1,   582,   583,    -1,   120,   371,    -1,    -1,
     124,    -1,   126,    -1,    -1,    -1,   595,    -1,    -1,    -1,
      -1,    -1,   336,    -1,    -1,    -1,    -1,    -1,   607,    -1,
     344,   345,    -1,    -1,    -1,   614,    -1,    -1,    -1,    -1,
      -1,   620,   621,    -1,   358,    -1,    -1,    -1,    -1,     9,
     364,    -1,    12,    -1,    -1,    -1,    16,   371,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   381,    -1,   383,
      -1,   650,    -1,   628,   629,   654,    -1,   441,   657,    -1,
      -1,    -1,    -1,    -1,   663,   313,    -1,    -1,    -1,    49,
      -1,    -1,    -1,    -1,    -1,   459,    -1,   461,   462,   463,
     464,    -1,   330,   331,   683,   684,   334,   686,    -1,    -1,
     689,   425,    -1,   427,    -1,    -1,    -1,    -1,   673,   674,
      -1,   676,   677,    -1,    -1,    -1,    86,    -1,    -1,    -1,
     444,    -1,    -1,    -1,    -1,   714,    -1,    -1,    -1,    99,
      -1,   101,   697,    -1,   699,    -1,   106,    -1,    -1,    -1,
     705,   706,   731,   467,   114,   734,   520,   471,   522,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   721,    -1,   723,    -1,
     725,   485,   727,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   743,    -1,
     745,    -1,    -1,    -1,    -1,   155,    -1,   561,    -1,    -1,
      -1,   161,    -1,    -1,   518,    -1,   166,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   582,   583,
      -1,   181,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   459,    -1,   461,   462,   463,   464,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   561,    -1,    -1,
      -1,    -1,   566,    -1,    -1,    -1,   620,   621,    -1,   219,
     220,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   232,    -1,    -1,    -1,    -1,   237,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   245,    -1,    -1,    -1,    -1,
      -1,   287,   520,    -1,   522,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   305,
      -1,   287,    -1,    -1,    -1,   311,   312,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   322,   287,    -1,   305,
      -1,    -1,    -1,    -1,    -1,   311,    -1,    -1,    -1,    -1,
     300,    -1,    -1,   303,   304,    -1,   306,   661,    -1,    -1,
      -1,   311,    -1,   313,   582,   583,    -1,    -1,    -1,    -1,
     320,    -1,   490,    -1,    -1,    -1,    -1,   681,    -1,   365,
     330,   331,    -1,    -1,   334,   335,    -1,   505,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   365,
      -1,    -1,   620,   621,    -1,   391,   392,   357,   358,    -1,
      -1,    -1,   398,    -1,    -1,    -1,    -1,    -1,    -1,   369,
      -1,    -1,    -1,    -1,    -1,   391,   392,    -1,    -1,    -1,
      -1,    -1,   398,   419,    -1,   421,    -1,   423,    -1,    -1,
     426,   391,    -1,    -1,   430,    -1,    -1,    -1,    -1,    -1,
     436,   401,   438,   419,    -1,   421,    -1,   423,    -1,    -1,
     426,   411,    -1,   449,   430,    -1,    -1,   417,    -1,   419,
     436,    -1,    -1,    -1,   424,    -1,    -1,   595,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   607,
      -1,    -1,    -1,    -1,   444,    -1,   614,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   459,
      -1,   461,   462,   463,   464,   501,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,   650,    -1,    -1,   501,   654,    -1,    -1,   657,
     526,   527,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,   501,    -1,    -1,   504,   505,    -1,    -1,    -1,    -1,
     526,   527,    -1,    -1,    -1,   683,   684,    -1,   686,   555,
     520,   689,   522,    -1,    -1,    -1,    -1,   563,   564,    -1,
      -1,    -1,   568,    -1,    -1,    -1,    -1,    -1,    -1,   555,
      -1,    73,    74,    75,    -1,    -1,   714,   563,   564,    -1,
      -1,    -1,   568,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   561,    -1,   731,    -1,    -1,   734,    -1,    -1,    -1,
      -1,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
      -1,    -1,   582,   583,    -1,    -1,    -1,    -1,   120,    -1,
      -1,    -1,   124,    -1,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,   135,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   614,   147,   148,    -1,    -1,    -1,
     620,   621,    -1,    -1,    -1,    -1,     1,   663,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   663,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    -1,    -1,    -1,    69,    -1,    -1,    -1,    73,    74,
      75,    -1,    77,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,   114,
     115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,
      -1,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
     135,   136,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   146,   147,   148,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    -1,    -1,    -1,
      69,    -1,    -1,    -1,    73,    74,    75,    -1,    77,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,   111,    -1,    -1,   114,   115,    -1,    -1,    -1,
     119,   120,    -1,    -1,    -1,   124,    -1,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,   135,   136,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   146,   147,   148,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,    -1,
      -1,   114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,
      -1,   124,    -1,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,   135,   136,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   146,   147,   148,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    73,    74,    75,    -1,
      77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,
      -1,    -1,    -1,    -1,   111,    -1,    -1,   114,   115,    -1,
      -1,    -1,   119,   120,    -1,    -1,    -1,   124,    -1,   126,
      -1,    -1,    -1,    -1,   131,   132,   133,   134,   135,   136,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   146,
     147,   148,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,
      -1,    -1,    73,    74,    75,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,
     111,    -1,    -1,   114,   115,    -1,    -1,    -1,   119,   120,
      -1,    -1,    -1,   124,    -1,   126,    -1,    -1,    -1,    -1,
     131,   132,   133,   134,   135,   136,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   146,   147,   148,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    73,    74,
      75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,   114,
     115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,
      -1,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
     135,   136,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   146,   147,   148,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    -1,    -1,    -1,    73,    74,    75,    -1,    77,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,   111,    -1,    -1,   114,   115,    -1,    -1,    -1,
     119,   120,    -1,    -1,    -1,   124,    -1,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,   135,   136,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   146,   147,   148,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      73,    74,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,    -1,
      -1,   114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,
      -1,   124,     1,   126,     3,     4,     5,    -1,   131,   132,
     133,   134,   135,   136,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   146,   147,   148,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    70,    -1,    -1,    73,    74,    -1,    76,    77,    -1,
      -1,    80,    81,    -1,    -1,    -1,    -1,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
     119,   120,    -1,    -1,    -1,   124,     1,   126,     3,     4,
       5,    -1,    -1,   132,    -1,    -1,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,    -1,   148,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    70,    -1,    -1,    73,    74,
      -1,    76,    77,    -1,    -1,    80,    81,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,
       1,   126,     3,     4,     5,    -1,    -1,   132,    -1,    -1,
     135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   146,    -1,   148,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,
      -1,    -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,
      81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,   120,
      -1,    -1,    -1,   124,     1,   126,     3,     4,     5,    -1,
      -1,   132,    -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    70,    -1,    -1,    73,    74,    -1,    76,
      77,    -1,    -1,    80,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,   120,    -1,    -1,    -1,   124,     1,   126,
       3,     4,     5,    -1,    -1,   132,    -1,    -1,   135,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,
      -1,   148,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,    -1,
      73,    74,    -1,    76,    77,    -1,    -1,    80,    81,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,
      -1,   124,     1,   126,     3,     4,     5,    -1,    -1,   132,
      -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    70,    -1,    -1,    73,    74,    -1,    76,    77,    -1,
      -1,    80,    81,    -1,    -1,    -1,    -1,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
     119,   120,    -1,    -1,    -1,   124,     1,   126,     3,     4,
       5,    -1,    -1,   132,    -1,    -1,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,    -1,   148,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    70,    -1,    -1,    73,    74,
      -1,    76,    77,    -1,    -1,    80,    81,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,
       1,   126,     3,     4,     5,    -1,    -1,   132,    -1,    -1,
     135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   146,    -1,   148,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    70,
      -1,    -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,
      81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,   120,
      -1,    -1,    -1,   124,     1,   126,     3,     4,     5,    -1,
      -1,   132,    -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   146,    -1,   148,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    70,    -1,    -1,    73,    74,    -1,    76,
      77,    -1,    -1,    80,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,   104,   105,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,   120,    -1,    -1,    -1,   124,     1,   126,
       3,     4,     5,    -1,    -1,   132,    -1,    -1,   135,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,
      -1,   148,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,    -1,
      73,    74,    -1,    76,    77,    -1,    -1,    80,    81,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,   119,   120,    -1,    -1,
      -1,   124,     1,   126,     3,     4,     5,    -1,    -1,   132,
      -1,    -1,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   146,    -1,   148,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    70,    -1,    -1,    73,    74,    -1,    76,    77,    -1,
      -1,    80,    81,    -1,    -1,    -1,    -1,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,
     119,   120,    -1,    -1,    -1,   124,     1,   126,     3,     4,
       5,    -1,    -1,   132,    -1,    -1,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,    -1,   148,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    70,    -1,    -1,    73,    74,
      -1,    76,    77,    -1,    -1,    80,    81,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,   104,
     105,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119,   120,    -1,    -1,    -1,   124,
      -1,   126,    -1,    -1,    -1,    -1,    -1,   132,    -1,     1,
     135,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   146,    -1,   148,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,
      -1,    -1,   114,   115,    -1,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,   135,   136,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   146,   147,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    73,    74,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,   104,   105,    -1,   124,    -1,
     126,    -1,   111,    -1,    -1,   131,   132,   133,   134,   135,
     136,   120,    -1,    -1,    -1,   124,   125,   126,    -1,    -1,
     146,   147,   131,   132,   133,   134,   135,   136,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,   147,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      73,    74,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   120,   104,   105,
      -1,   124,    -1,   126,    -1,   111,    -1,    -1,   131,   132,
     133,   134,   135,   136,   120,    -1,    -1,    -1,   124,     1,
     126,     3,     4,     5,   147,   131,   132,   133,   134,   135,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   147,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    69,    70,    -1,
      -1,    73,    74,    -1,    76,    77,    -1,    -1,    80,    81,
      28,    -1,    -1,    -1,    -1,    87,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
     102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    28,    -1,    -1,   119,   120,    -1,
      -1,    -1,   124,    -1,   126,    73,    74,    75,    -1,    -1,
     132,    -1,    -1,   135,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   146,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   104,   105,    -1,    73,
      74,    75,    28,   111,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   120,    -1,    -1,    -1,   124,   125,   126,    -1,
      -1,    -1,    -1,   131,   132,   133,   134,   135,   136,    -1,
     104,   105,    -1,    -1,    -1,    -1,    -1,   111,   146,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   120,    73,    74,    75,
     124,   125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,
     134,   135,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   146,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   120,    -1,     3,    -1,   124,    -1,
     126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,   135,
     136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     146,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,     3,   124,    -1,    -1,
      -1,   128,    -1,    -1,    -1,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,     3,    -1,   124,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   132,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   144,    -1,   146,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,    77,
      -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,    -1,
       1,   119,     3,     4,     5,     6,   124,     8,     9,    -1,
      -1,    -1,    -1,    -1,   132,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   146,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,
      -1,    -1,    73,    74,    75,    76,    77,    -1,    -1,    -1,
      81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,   104,   105,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,   115,    -1,    -1,    -1,    -1,   120,
      -1,    -1,    -1,   124,   125,   126,    -1,    -1,    -1,    -1,
     131,   132,   133,   134,   135,   136,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    73,    74,
      75,     1,    77,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    28,   104,
     105,    -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,   114,
     115,    -1,    -1,    -1,    -1,   120,    -1,    -1,    -1,   124,
     125,   126,    -1,    -1,    -1,    -1,   131,   132,   133,   134,
     135,   136,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    73,    74,    75,    76,    -1,    -1,    -1,
       1,    81,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   104,   105,    -1,    28,    -1,    -1,
      -1,   111,   112,   113,     1,    -1,     3,     4,     5,     6,
     120,     8,     9,    -1,   124,   125,   126,    -1,    -1,    -1,
      -1,   131,   132,   133,   134,   135,   136,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    73,    74,    75,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   104,   105,    -1,    73,    74,    75,     1,
     111,     3,     4,     5,     6,    -1,     8,     9,    -1,   120,
      -1,    -1,    -1,   124,   125,   126,    -1,    -1,    -1,    -1,
     131,   132,   133,   134,   135,   136,    28,   104,   105,    -1,
      -1,    -1,    -1,    -1,   111,    -1,    -1,    73,    74,    75,
      -1,    -1,    -1,   120,    -1,    -1,    -1,   124,    -1,   126,
      -1,    -1,   129,    -1,   131,   132,   133,   134,   135,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   104,   105,
      -1,    73,    74,    75,     1,   111,     3,     4,     5,     6,
      -1,     8,     9,    -1,   120,    -1,    -1,    -1,   124,    -1,
     126,    -1,    -1,   129,    -1,   131,   132,   133,   134,   135,
     136,    28,   104,   105,    -1,    -1,    -1,    -1,     1,   111,
       3,     4,     5,     6,    -1,     8,     9,    -1,   120,    -1,
      -1,    -1,   124,    -1,   126,    -1,    -1,   129,    -1,   131,
     132,   133,   134,   135,   136,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    73,    74,    75,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   104,   105,    -1,
      73,    74,    75,     1,   111,     3,     4,     5,     6,    -1,
       8,     9,    -1,   120,    -1,    -1,    -1,   124,   125,   126,
      -1,    -1,    -1,    -1,   131,   132,   133,   134,   135,   136,
      28,   104,   105,    -1,    -1,    -1,    -1,    -1,   111,    -1,
      -1,    73,    74,    75,    -1,    -1,    -1,   120,    -1,    -1,
      -1,   124,   125,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,   135,   136,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   104,   105,    -1,    73,    74,    75,     1,   111,
       3,     4,     5,     6,    -1,     8,     9,    -1,   120,    -1,
      -1,    -1,   124,    -1,   126,    -1,    -1,    -1,    -1,   131,
     132,   133,   134,   135,   136,    28,   104,   105,    -1,    -1,
      -1,    -1,     1,   111,     3,     4,     5,     6,    -1,     8,
       9,    -1,   120,    -1,    -1,    -1,   124,    -1,   126,    -1,
      -1,    -1,    -1,   131,   132,   133,   134,   135,   136,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      73,    74,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   104,   105,    -1,    73,    74,    75,    -1,   111,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   120,    -1,    -1,
      -1,   124,    -1,   126,    -1,    -1,    -1,    -1,   131,   132,
     133,   134,   135,   136,    -1,   104,   105,    -1,    -1,    -1,
      -1,    -1,   111,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   120,    -1,    -1,    -1,   124,    -1,   126,    -1,    -1,
      -1,    -1,   131,   132,   133,   134,   135,   136,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,   124,   125,    -1,    -1,   128,    -1,
      -1,    -1,   132,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    77,    -1,    -1,    -1,    81,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,   112,   113,   114,
     115,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,   124,
      -1,    -1,    -1,   128,    -1,    -1,    -1,   132,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    -1,    -1,    -1,    76,    77,    -1,    -1,
      -1,    81,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   112,   113,   114,   115,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,   124,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   132,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   114,
     115,    -1,    -1,    -1,   119,    -1,    -1,    -1,    -1,    -1,
     125,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,    -1,
      -1,   128,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,    -1,   128,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
      -1,   128,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,   125,    -1,    -1,    -1,    -1,    -1,    -1,
     132,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      77,    -1,    -1,    -1,    81,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,   114,   115,    -1,
      -1,    -1,   119,    -1,    -1,    -1,    -1,   124,    -1,    -1,
      -1,   128,    -1,    -1,    -1,   132,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     112,   113,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    -1,    -1,    28,   128,    -1,    -1,    -1,
     132,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    76,    77,    -1,    -1,    -1,    81,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,
     113,   114,   115,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   124,    -1,    -1,    -1,   128,    -1,    -1,    -1,   132,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    69,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    77,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   114,   115,    -1,    -1,
      -1,   119,    -1,    -1,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   114,   115,    -1,    -1,    -1,   119,
      -1,    -1,    -1,    -1,    -1,   125,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   114,   115,    -1,    -1,    -1,   119,    -1,    -1,
      -1,    -1,   124,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   114,
     115,    -1,    -1,    -1,   119,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   114,   115,    -1,    -1,    -1,   119,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    69,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    77,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   114,   115,    -1,    -1,    -1,   119,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      69,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    77,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   114,   115,    -1,    -1,    -1,
     119
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    73,
      74,    75,   104,   105,   111,   120,   124,   126,   131,   132,
     133,   134,   135,   136,   150,   151,   152,   154,   156,   157,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   167,
     168,   169,   170,   171,   191,   192,   240,   242,   256,   124,
     157,   124,   157,   157,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    69,
      77,    87,   102,   114,   115,   119,   177,   182,   190,   191,
     193,   195,   196,   197,   205,   206,   157,   170,   174,   177,
     174,   124,   157,   125,   171,   173,   176,   190,   191,   193,
     195,   206,   225,   240,   147,     7,     8,     9,   124,   127,
     128,   150,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,   145,   172,   159,   132,   137,   138,   133,   134,
      10,    11,    12,    13,   139,   140,    14,    15,   131,   141,
     142,    16,    17,   143,   172,   147,     0,   225,   147,   150,
     192,   124,    76,    81,   112,   113,   124,   128,   132,   182,
     183,   184,   188,   189,   190,   193,   195,   206,   210,   212,
     220,   147,   150,   183,   192,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    49,    50,
      69,   102,   114,   115,   179,   182,   190,   192,   194,   195,
     196,   205,   206,   128,   212,   179,   225,   125,   130,   124,
     128,   183,   190,   193,   195,   206,   209,   211,   220,   125,
     127,   146,   147,   148,   153,   154,   170,   177,   227,   243,
     249,   250,   251,   252,   253,   254,   255,   150,   125,   153,
     155,   171,   150,   173,   153,   171,   159,   159,   159,   160,
     160,   161,   161,   162,   162,   162,   162,   163,   163,   164,
     165,   166,   167,   168,   173,   153,   171,   148,   255,   125,
     150,   207,   208,   147,   147,   191,   125,   177,   212,   221,
     222,   223,   174,   190,   219,   220,   210,   220,   124,   188,
     124,   128,   210,    70,    80,   124,   135,   146,   148,   150,
     154,   177,   183,   198,   199,   200,   201,   202,   214,   215,
     217,   218,   220,   241,   242,   244,   245,   246,   247,   248,
     147,   147,   150,   192,   147,   124,   128,   182,   190,   194,
     195,   206,   212,   174,   128,   128,   212,   125,   171,   125,
     211,   221,   129,   174,   191,   209,   220,   124,   128,   209,
     159,   240,   148,   255,   145,   124,   150,   215,   147,   234,
     235,   130,   146,   146,   250,   252,   253,   148,   125,   130,
     129,   144,   148,   145,   188,   189,   130,   148,   207,   207,
     125,   124,   183,   211,   213,   214,   216,   218,   220,   125,
     125,   130,   129,   190,   220,   210,   124,   125,   221,   174,
      53,   178,   182,   190,   191,   193,   197,   177,   215,   124,
     132,   183,   213,   220,   177,   145,   124,   144,   146,   150,
     183,   203,   204,   213,   215,   218,   220,   218,   220,   148,
     202,   130,   146,   124,   128,   125,   150,   221,   224,   183,
     218,   146,   146,   235,   235,   235,   146,   235,   148,   198,
     148,   198,   147,   147,   198,   191,   174,   128,   129,   174,
     174,   128,   125,   125,   129,   129,   209,   125,   221,   129,
     174,   191,   148,   227,   148,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    79,   146,   150,   173,
     175,   177,   229,   230,   231,   232,   233,   235,   236,   237,
     238,   239,   241,   251,   153,   171,   170,   174,   145,   208,
     146,   148,   146,   148,   214,   218,   220,   183,   216,    54,
     223,     3,    28,    47,    76,    77,   125,   185,   186,   187,
     125,   129,   150,   192,   147,   150,   182,   190,   191,   193,
     211,   150,   183,   192,   215,   220,   125,   124,   227,   125,
     174,   147,   218,   220,   130,   146,   144,   188,   183,   218,
     218,   199,   129,   174,   191,   125,   125,   130,   218,   148,
     148,   148,   198,   198,   148,   125,   129,   174,   129,   129,
     174,   125,   129,   129,   174,   144,   124,   124,   124,   229,
     124,   150,   146,   146,   146,   173,   150,   144,   146,   146,
     180,   181,   213,   175,   232,   175,   229,   148,   146,   174,
     198,   198,   216,   125,   124,   125,   130,   186,    71,    72,
     148,   147,   147,   150,   150,   192,   125,   148,   255,   218,
     204,   174,   218,   129,   129,   150,   148,   148,   129,   129,
     144,   229,   173,   173,   125,   173,    59,   125,   236,   146,
     146,   145,   229,   130,   146,   145,   148,   148,   173,   125,
     186,   235,   235,    71,    72,   148,    71,    72,   148,   147,
     148,   144,   229,   125,   125,   229,   125,   124,   229,   125,
     236,   174,   181,   147,   171,   226,   125,    72,   148,    71,
     148,   235,   235,   235,   235,    71,    72,   148,   174,   229,
     229,   229,   173,   229,   125,   173,   146,   226,   228,   235,
     235,    72,   148,    71,   148,    72,   148,    71,   148,   235,
     235,    67,   125,   229,   125,   130,   148,   148,   148,   235,
     235,   235,   235,    72,   148,    71,   148,   229,   146,   229,
     148,   226,   148,   148,   148,   148,   235,   235,   148,   148
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

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))

/* Error token number */
#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (YYID (N))                                                     \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (YYID (0))
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

__attribute__((__unused__))
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static unsigned
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
#else
static unsigned
yy_location_print_ (yyo, yylocp)
    FILE *yyo;
    YYLTYPE const * const yylocp;
#endif
{
  unsigned res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += fprintf (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += fprintf (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += fprintf (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += fprintf (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += fprintf (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

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
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  YYUSE (yytype);
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

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
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
      case 150: /* identifier */
/* Line 1393 of yacc.c  */
#line 161 "expression.y"
        { FreeIdentifier(((*yyvaluep).id)); };
/* Line 1393 of yacc.c  */
#line 3547 "expression.ec"
        break;
      case 151: /* primary_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3554 "expression.ec"
        break;
      case 154: /* postfix_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3561 "expression.ec"
        break;
      case 155: /* argument_expression_list */
/* Line 1393 of yacc.c  */
#line 196 "expression.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 3568 "expression.ec"
        break;
      case 157: /* unary_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3575 "expression.ec"
        break;
      case 159: /* cast_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3582 "expression.ec"
        break;
      case 160: /* multiplicative_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3589 "expression.ec"
        break;
      case 161: /* additive_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3596 "expression.ec"
        break;
      case 162: /* shift_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3603 "expression.ec"
        break;
      case 163: /* relational_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3610 "expression.ec"
        break;
      case 164: /* equality_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3617 "expression.ec"
        break;
      case 165: /* and_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3624 "expression.ec"
        break;
      case 166: /* exclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3631 "expression.ec"
        break;
      case 167: /* inclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3638 "expression.ec"
        break;
      case 168: /* logical_and_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3645 "expression.ec"
        break;
      case 169: /* logical_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3652 "expression.ec"
        break;
      case 170: /* conditional_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3659 "expression.ec"
        break;
      case 171: /* assignment_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3666 "expression.ec"
        break;
      case 173: /* expression */
/* Line 1393 of yacc.c  */
#line 196 "expression.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 3673 "expression.ec"
        break;
      case 174: /* constant_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3680 "expression.ec"
        break;
      case 175: /* declaration */
/* Line 1393 of yacc.c  */
#line 182 "expression.y"
        { FreeDeclaration(((*yyvaluep).declaration)); };
/* Line 1393 of yacc.c  */
#line 3687 "expression.ec"
        break;
      case 176: /* specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3694 "expression.ec"
        break;
      case 177: /* declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3701 "expression.ec"
        break;
      case 180: /* init_declarator_list */
/* Line 1393 of yacc.c  */
#line 202 "expression.y"
        { FreeList(((*yyvaluep).list), FreeInitDeclarator); };
/* Line 1393 of yacc.c  */
#line 3708 "expression.ec"
        break;
      case 181: /* init_declarator */
/* Line 1393 of yacc.c  */
#line 177 "expression.y"
        { FreeInitDeclarator(((*yyvaluep).initDeclarator)); };
/* Line 1393 of yacc.c  */
#line 3715 "expression.ec"
        break;
      case 182: /* storage_class_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3722 "expression.ec"
        break;
      case 183: /* ext_decl */
/* Line 1393 of yacc.c  */
#line 210 "expression.y"
        { FreeExtDecl(((*yyvaluep).extDecl)); };
/* Line 1393 of yacc.c  */
#line 3729 "expression.ec"
        break;
      case 185: /* attribute_word */
/* Line 1393 of yacc.c  */
#line 193 "expression.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 3736 "expression.ec"
        break;
      case 186: /* attribute */
/* Line 1393 of yacc.c  */
#line 211 "expression.y"
        { FreeAttribute(((*yyvaluep).attribute)); };
/* Line 1393 of yacc.c  */
#line 3743 "expression.ec"
        break;
      case 187: /* attribs_list */
/* Line 1393 of yacc.c  */
#line 212 "expression.y"
        { FreeList(((*yyvaluep).list), FreeAttribute); };
/* Line 1393 of yacc.c  */
#line 3750 "expression.ec"
        break;
      case 188: /* attrib */
/* Line 1393 of yacc.c  */
#line 209 "expression.y"
        { FreeAttrib(((*yyvaluep).attrib)); };
/* Line 1393 of yacc.c  */
#line 3757 "expression.ec"
        break;
      case 189: /* multi_attrib */
/* Line 1393 of yacc.c  */
#line 213 "expression.y"
        { FreeList(((*yyvaluep).list), FreeAttrib); };
/* Line 1393 of yacc.c  */
#line 3764 "expression.ec"
        break;
      case 190: /* type_qualifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3771 "expression.ec"
        break;
      case 191: /* type */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3778 "expression.ec"
        break;
      case 192: /* strict_type */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3785 "expression.ec"
        break;
      case 193: /* type_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3792 "expression.ec"
        break;
      case 194: /* strict_type_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3799 "expression.ec"
        break;
      case 195: /* struct_or_union_specifier_compound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3806 "expression.ec"
        break;
      case 196: /* struct_or_union_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3813 "expression.ec"
        break;
      case 198: /* struct_declaration_list */
/* Line 1393 of yacc.c  */
#line 205 "expression.y"
        { FreeList(((*yyvaluep).list), FreeClassDef); };
/* Line 1393 of yacc.c  */
#line 3820 "expression.ec"
        break;
      case 199: /* default_property */
/* Line 1393 of yacc.c  */
#line 186 "expression.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 3827 "expression.ec"
        break;
      case 200: /* default_property_list */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 3834 "expression.ec"
        break;
      case 201: /* property */
/* Line 1393 of yacc.c  */
#line 194 "expression.y"
        { FreeProperty(((*yyvaluep).prop)); };
/* Line 1393 of yacc.c  */
#line 3841 "expression.ec"
        break;
      case 202: /* struct_declaration */
/* Line 1393 of yacc.c  */
#line 192 "expression.y"
        { FreeClassDef(((*yyvaluep).classDef)); };
/* Line 1393 of yacc.c  */
#line 3848 "expression.ec"
        break;
      case 203: /* struct_declarator_list */
/* Line 1393 of yacc.c  */
#line 199 "expression.y"
        { FreeList(((*yyvaluep).list), FreeDeclarator); };
/* Line 1393 of yacc.c  */
#line 3855 "expression.ec"
        break;
      case 204: /* struct_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3862 "expression.ec"
        break;
      case 205: /* enum_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3869 "expression.ec"
        break;
      case 206: /* enum_specifier_compound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3876 "expression.ec"
        break;
      case 207: /* enumerator_list */
/* Line 1393 of yacc.c  */
#line 197 "expression.y"
        { FreeList(((*yyvaluep).list), FreeEnumerator); };
/* Line 1393 of yacc.c  */
#line 3883 "expression.ec"
        break;
      case 208: /* enumerator */
/* Line 1393 of yacc.c  */
#line 171 "expression.y"
        { FreeEnumerator(((*yyvaluep).enumerator)); };
/* Line 1393 of yacc.c  */
#line 3890 "expression.ec"
        break;
      case 209: /* direct_abstract_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3897 "expression.ec"
        break;
      case 210: /* direct_abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3904 "expression.ec"
        break;
      case 211: /* abstract_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3911 "expression.ec"
        break;
      case 212: /* abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3918 "expression.ec"
        break;
      case 213: /* declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3925 "expression.ec"
        break;
      case 214: /* direct_declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3932 "expression.ec"
        break;
      case 215: /* declarator_function */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3939 "expression.ec"
        break;
      case 216: /* direct_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3946 "expression.ec"
        break;
      case 217: /* direct_declarator_function_start */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3953 "expression.ec"
        break;
      case 218: /* direct_declarator_function */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3960 "expression.ec"
        break;
      case 219: /* type_qualifier_list */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3967 "expression.ec"
        break;
      case 220: /* pointer */
/* Line 1393 of yacc.c  */
#line 162 "expression.y"
        { FreePointer(((*yyvaluep).pointer)); };
/* Line 1393 of yacc.c  */
#line 3974 "expression.ec"
        break;
      case 221: /* parameter_type_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 3981 "expression.ec"
        break;
      case 222: /* parameter_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 3988 "expression.ec"
        break;
      case 223: /* parameter_declaration */
/* Line 1393 of yacc.c  */
#line 178 "expression.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 3995 "expression.ec"
        break;
      case 224: /* identifier_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4002 "expression.ec"
        break;
      case 225: /* type_name */
/* Line 1393 of yacc.c  */
#line 178 "expression.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4009 "expression.ec"
        break;
      case 226: /* initializer */
/* Line 1393 of yacc.c  */
#line 176 "expression.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4016 "expression.ec"
        break;
      case 227: /* initializer_condition */
/* Line 1393 of yacc.c  */
#line 176 "expression.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4023 "expression.ec"
        break;
      case 228: /* initializer_list */
/* Line 1393 of yacc.c  */
#line 201 "expression.y"
        { FreeList(((*yyvaluep).list), FreeInitializer); };
/* Line 1393 of yacc.c  */
#line 4030 "expression.ec"
        break;
      case 229: /* statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4037 "expression.ec"
        break;
      case 230: /* labeled_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4044 "expression.ec"
        break;
      case 231: /* declaration_list */
/* Line 1393 of yacc.c  */
#line 200 "expression.y"
        { FreeList(((*yyvaluep).list), FreeDeclaration); };
/* Line 1393 of yacc.c  */
#line 4051 "expression.ec"
        break;
      case 232: /* statement_list */
/* Line 1393 of yacc.c  */
#line 204 "expression.y"
        { FreeList(((*yyvaluep).list), FreeStatement); };
/* Line 1393 of yacc.c  */
#line 4058 "expression.ec"
        break;
      case 233: /* compound_inside */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4065 "expression.ec"
        break;
      case 234: /* compound_start */
/* Line 1393 of yacc.c  */
#line 208 "expression.y"
        { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); };
/* Line 1393 of yacc.c  */
#line 4072 "expression.ec"
        break;
      case 235: /* compound_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4079 "expression.ec"
        break;
      case 236: /* expression_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4086 "expression.ec"
        break;
      case 237: /* selection_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4093 "expression.ec"
        break;
      case 238: /* iteration_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4100 "expression.ec"
        break;
      case 239: /* jump_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4107 "expression.ec"
        break;
      case 240: /* string_literal */
/* Line 1393 of yacc.c  */
#line 193 "expression.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4114 "expression.ec"
        break;
      case 241: /* instantiation_named */
/* Line 1393 of yacc.c  */
#line 184 "expression.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4121 "expression.ec"
        break;
      case 242: /* instantiation_unnamed */
/* Line 1393 of yacc.c  */
#line 184 "expression.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4128 "expression.ec"
        break;
      case 244: /* class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4135 "expression.ec"
        break;
      case 245: /* constructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4142 "expression.ec"
        break;
      case 246: /* destructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4149 "expression.ec"
        break;
      case 247: /* virtual_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4156 "expression.ec"
        break;
      case 248: /* class_function_definition */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4163 "expression.ec"
        break;
      case 249: /* instance_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4170 "expression.ec"
        break;
      case 250: /* instance_class_function_definition */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4177 "expression.ec"
        break;
      case 251: /* data_member_initialization */
/* Line 1393 of yacc.c  */
#line 186 "expression.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4184 "expression.ec"
        break;
      case 252: /* data_member_initialization_list */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4191 "expression.ec"
        break;
      case 253: /* data_member_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4198 "expression.ec"
        break;
      case 254: /* members_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 207 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4205 "expression.ec"
        break;
      case 255: /* members_initialization_list */
/* Line 1393 of yacc.c  */
#line 207 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4212 "expression.ec"
        break;

      default:
        break;
    }
}




/* The lookahead symbol.  */
int yychar;


#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE(yyval_default);

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;


/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

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

       Refer to the stacks through separate pointers, to allow yyoverflow
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
    YYLTYPE yyerror_range[3];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
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

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
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
  if (yypact_value_is_default (yyn))
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
      if (yytable_value_is_error (yyn))
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
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
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
/* Line 1787 of yacc.c  */
#line 221 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); }
    break;

  case 4:
/* Line 1787 of yacc.c  */
#line 227 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 5:
/* Line 1787 of yacc.c  */
#line 232 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 6:
/* Line 1787 of yacc.c  */
#line 234 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 7:
/* Line 1787 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 8:
/* Line 1787 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); }
    break;

  case 9:
/* Line 1787 of yacc.c  */
#line 239 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 10:
/* Line 1787 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 11:
/* Line 1787 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); }
    break;

  case 12:
/* Line 1787 of yacc.c  */
#line 243 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); }
    break;

  case 13:
/* Line 1787 of yacc.c  */
#line 245 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 14:
/* Line 1787 of yacc.c  */
#line 246 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 15:
/* Line 1787 of yacc.c  */
#line 247 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 16:
/* Line 1787 of yacc.c  */
#line 248 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 17:
/* Line 1787 of yacc.c  */
#line 249 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 18:
/* Line 1787 of yacc.c  */
#line 250 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 19:
/* Line 1787 of yacc.c  */
#line 251 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 20:
/* Line 1787 of yacc.c  */
#line 252 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 21:
/* Line 1787 of yacc.c  */
#line 253 "expression.y"
    { (yyval.exp) = MkExpDummy(); yyerror(); }
    break;

  case 22:
/* Line 1787 of yacc.c  */
#line 257 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); }
    break;

  case 24:
/* Line 1787 of yacc.c  */
#line 262 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); }
    break;

  case 25:
/* Line 1787 of yacc.c  */
#line 263 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 26:
/* Line 1787 of yacc.c  */
#line 264 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); }
    break;

  case 27:
/* Line 1787 of yacc.c  */
#line 265 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 28:
/* Line 1787 of yacc.c  */
#line 267 "expression.y"
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
   }
    break;

  case 29:
/* Line 1787 of yacc.c  */
#line 279 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); }
    break;

  case 30:
/* Line 1787 of yacc.c  */
#line 280 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 31:
/* Line 1787 of yacc.c  */
#line 281 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); }
    break;

  case 32:
/* Line 1787 of yacc.c  */
#line 311 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 33:
/* Line 1787 of yacc.c  */
#line 312 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 34:
/* Line 1787 of yacc.c  */
#line 313 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 35:
/* Line 1787 of yacc.c  */
#line 314 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  }
    break;

  case 36:
/* Line 1787 of yacc.c  */
#line 318 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 37:
/* Line 1787 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 38:
/* Line 1787 of yacc.c  */
#line 320 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 39:
/* Line 1787 of yacc.c  */
#line 323 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 40:
/* Line 1787 of yacc.c  */
#line 324 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 41:
/* Line 1787 of yacc.c  */
#line 327 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 42:
/* Line 1787 of yacc.c  */
#line 328 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); }
    break;

  case 45:
/* Line 1787 of yacc.c  */
#line 342 "expression.y"
    { (yyval.i) = '&'; }
    break;

  case 46:
/* Line 1787 of yacc.c  */
#line 343 "expression.y"
    { (yyval.i) = '*'; }
    break;

  case 47:
/* Line 1787 of yacc.c  */
#line 344 "expression.y"
    { (yyval.i) = '+'; }
    break;

  case 48:
/* Line 1787 of yacc.c  */
#line 345 "expression.y"
    { (yyval.i) = '-'; }
    break;

  case 49:
/* Line 1787 of yacc.c  */
#line 346 "expression.y"
    { (yyval.i) = '~'; }
    break;

  case 50:
/* Line 1787 of yacc.c  */
#line 347 "expression.y"
    { (yyval.i) = '!'; }
    break;

  case 51:
/* Line 1787 of yacc.c  */
#line 348 "expression.y"
    { (yyval.i) = DELETE; }
    break;

  case 53:
/* Line 1787 of yacc.c  */
#line 353 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 55:
/* Line 1787 of yacc.c  */
#line 358 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 56:
/* Line 1787 of yacc.c  */
#line 359 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 57:
/* Line 1787 of yacc.c  */
#line 360 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 59:
/* Line 1787 of yacc.c  */
#line 365 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 60:
/* Line 1787 of yacc.c  */
#line 366 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 62:
/* Line 1787 of yacc.c  */
#line 371 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 63:
/* Line 1787 of yacc.c  */
#line 372 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 65:
/* Line 1787 of yacc.c  */
#line 377 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 66:
/* Line 1787 of yacc.c  */
#line 378 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 67:
/* Line 1787 of yacc.c  */
#line 379 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 68:
/* Line 1787 of yacc.c  */
#line 380 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 70:
/* Line 1787 of yacc.c  */
#line 385 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 71:
/* Line 1787 of yacc.c  */
#line 386 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 73:
/* Line 1787 of yacc.c  */
#line 391 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 75:
/* Line 1787 of yacc.c  */
#line 396 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 77:
/* Line 1787 of yacc.c  */
#line 401 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 79:
/* Line 1787 of yacc.c  */
#line 406 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 81:
/* Line 1787 of yacc.c  */
#line 411 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 83:
/* Line 1787 of yacc.c  */
#line 416 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 85:
/* Line 1787 of yacc.c  */
#line 421 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 86:
/* Line 1787 of yacc.c  */
#line 422 "expression.y"
    { yyerror(); (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 87:
/* Line 1787 of yacc.c  */
#line 424 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 88:
/* Line 1787 of yacc.c  */
#line 425 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); }
    break;

  case 89:
/* Line 1787 of yacc.c  */
#line 429 "expression.y"
    { (yyval.i) = '='; }
    break;

  case 90:
/* Line 1787 of yacc.c  */
#line 430 "expression.y"
    { (yyval.i) = MUL_ASSIGN; }
    break;

  case 91:
/* Line 1787 of yacc.c  */
#line 431 "expression.y"
    { (yyval.i) = DIV_ASSIGN; }
    break;

  case 92:
/* Line 1787 of yacc.c  */
#line 432 "expression.y"
    { (yyval.i) = MOD_ASSIGN; }
    break;

  case 93:
/* Line 1787 of yacc.c  */
#line 433 "expression.y"
    { (yyval.i) = ADD_ASSIGN; }
    break;

  case 94:
/* Line 1787 of yacc.c  */
#line 434 "expression.y"
    { (yyval.i) = SUB_ASSIGN; }
    break;

  case 95:
/* Line 1787 of yacc.c  */
#line 435 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; }
    break;

  case 96:
/* Line 1787 of yacc.c  */
#line 436 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; }
    break;

  case 97:
/* Line 1787 of yacc.c  */
#line 437 "expression.y"
    { (yyval.i) = AND_ASSIGN; }
    break;

  case 98:
/* Line 1787 of yacc.c  */
#line 438 "expression.y"
    { (yyval.i) = XOR_ASSIGN; }
    break;

  case 99:
/* Line 1787 of yacc.c  */
#line 439 "expression.y"
    { (yyval.i) = OR_ASSIGN; }
    break;

  case 100:
/* Line 1787 of yacc.c  */
#line 443 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); }
    break;

  case 101:
/* Line 1787 of yacc.c  */
#line 444 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); }
    break;

  case 103:
/* Line 1787 of yacc.c  */
#line 452 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); }
    break;

  case 104:
/* Line 1787 of yacc.c  */
#line 453 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); }
    break;

  case 105:
/* Line 1787 of yacc.c  */
#line 454 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); }
    break;

  case 106:
/* Line 1787 of yacc.c  */
#line 455 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); }
    break;

  case 107:
/* Line 1787 of yacc.c  */
#line 459 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 108:
/* Line 1787 of yacc.c  */
#line 460 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 109:
/* Line 1787 of yacc.c  */
#line 461 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 110:
/* Line 1787 of yacc.c  */
#line 462 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 111:
/* Line 1787 of yacc.c  */
#line 463 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 112:
/* Line 1787 of yacc.c  */
#line 464 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 113:
/* Line 1787 of yacc.c  */
#line 465 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 114:
/* Line 1787 of yacc.c  */
#line 466 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 115:
/* Line 1787 of yacc.c  */
#line 470 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 116:
/* Line 1787 of yacc.c  */
#line 471 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 117:
/* Line 1787 of yacc.c  */
#line 472 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 118:
/* Line 1787 of yacc.c  */
#line 473 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 119:
/* Line 1787 of yacc.c  */
#line 474 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 120:
/* Line 1787 of yacc.c  */
#line 475 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 121:
/* Line 1787 of yacc.c  */
#line 476 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 122:
/* Line 1787 of yacc.c  */
#line 477 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 123:
/* Line 1787 of yacc.c  */
#line 478 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 124:
/* Line 1787 of yacc.c  */
#line 479 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 125:
/* Line 1787 of yacc.c  */
#line 484 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 126:
/* Line 1787 of yacc.c  */
#line 485 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 127:
/* Line 1787 of yacc.c  */
#line 486 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 128:
/* Line 1787 of yacc.c  */
#line 487 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 129:
/* Line 1787 of yacc.c  */
#line 488 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 130:
/* Line 1787 of yacc.c  */
#line 489 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 131:
/* Line 1787 of yacc.c  */
#line 490 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 132:
/* Line 1787 of yacc.c  */
#line 491 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 133:
/* Line 1787 of yacc.c  */
#line 495 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 134:
/* Line 1787 of yacc.c  */
#line 496 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 135:
/* Line 1787 of yacc.c  */
#line 497 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 136:
/* Line 1787 of yacc.c  */
#line 498 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 137:
/* Line 1787 of yacc.c  */
#line 499 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 138:
/* Line 1787 of yacc.c  */
#line 500 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 139:
/* Line 1787 of yacc.c  */
#line 501 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 140:
/* Line 1787 of yacc.c  */
#line 502 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 141:
/* Line 1787 of yacc.c  */
#line 503 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 142:
/* Line 1787 of yacc.c  */
#line 504 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); }
    break;

  case 143:
/* Line 1787 of yacc.c  */
#line 508 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); }
    break;

  case 144:
/* Line 1787 of yacc.c  */
#line 509 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); }
    break;

  case 145:
/* Line 1787 of yacc.c  */
#line 513 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); }
    break;

  case 146:
/* Line 1787 of yacc.c  */
#line 514 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; }
    break;

  case 147:
/* Line 1787 of yacc.c  */
#line 518 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); }
    break;

  case 148:
/* Line 1787 of yacc.c  */
#line 519 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); }
    break;

  case 149:
/* Line 1787 of yacc.c  */
#line 520 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); }
    break;

  case 150:
/* Line 1787 of yacc.c  */
#line 521 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); }
    break;

  case 151:
/* Line 1787 of yacc.c  */
#line 522 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); }
    break;

  case 152:
/* Line 1787 of yacc.c  */
#line 523 "expression.y"
    { (yyval.specifier) = MkSpecifier(THREAD); }
    break;

  case 153:
/* Line 1787 of yacc.c  */
#line 527 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
    break;

  case 154:
/* Line 1787 of yacc.c  */
#line 528 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); }
    break;

  case 155:
/* Line 1787 of yacc.c  */
#line 529 "expression.y"
    { (yyval.extDecl) = MkExtDeclMultiAttrib((yyvsp[(1) - (1)].list)); }
    break;

  case 156:
/* Line 1787 of yacc.c  */
#line 533 "expression.y"
    { (yyval.i) = ATTRIB; }
    break;

  case 157:
/* Line 1787 of yacc.c  */
#line 534 "expression.y"
    { (yyval.i) = ATTRIB_DEP; }
    break;

  case 158:
/* Line 1787 of yacc.c  */
#line 535 "expression.y"
    { (yyval.i) = __ATTRIB; }
    break;

  case 159:
/* Line 1787 of yacc.c  */
#line 540 "expression.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 160:
/* Line 1787 of yacc.c  */
#line 541 "expression.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 161:
/* Line 1787 of yacc.c  */
#line 542 "expression.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 162:
/* Line 1787 of yacc.c  */
#line 543 "expression.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 163:
/* Line 1787 of yacc.c  */
#line 544 "expression.y"
    { (yyval.string)  = CopyString(yytext); }
    break;

  case 164:
/* Line 1787 of yacc.c  */
#line 548 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); }
    break;

  case 165:
/* Line 1787 of yacc.c  */
#line 549 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); }
    break;

  case 166:
/* Line 1787 of yacc.c  */
#line 553 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); }
    break;

  case 167:
/* Line 1787 of yacc.c  */
#line 554 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 168:
/* Line 1787 of yacc.c  */
#line 555 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 169:
/* Line 1787 of yacc.c  */
#line 559 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); }
    break;

  case 170:
/* Line 1787 of yacc.c  */
#line 560 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); }
    break;

  case 171:
/* Line 1787 of yacc.c  */
#line 564 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attrib)); }
    break;

  case 172:
/* Line 1787 of yacc.c  */
#line 565 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attrib)); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 173:
/* Line 1787 of yacc.c  */
#line 568 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); }
    break;

  case 174:
/* Line 1787 of yacc.c  */
#line 569 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); }
    break;

  case 175:
/* Line 1787 of yacc.c  */
#line 570 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); }
    break;

  case 176:
/* Line 1787 of yacc.c  */
#line 574 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); }
    break;

  case 177:
/* Line 1787 of yacc.c  */
#line 599 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); }
    break;

  case 178:
/* Line 1787 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 179:
/* Line 1787 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 180:
/* Line 1787 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 181:
/* Line 1787 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 182:
/* Line 1787 of yacc.c  */
#line 607 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 183:
/* Line 1787 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 184:
/* Line 1787 of yacc.c  */
#line 609 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 185:
/* Line 1787 of yacc.c  */
#line 610 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 186:
/* Line 1787 of yacc.c  */
#line 611 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 187:
/* Line 1787 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 188:
/* Line 1787 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 189:
/* Line 1787 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 190:
/* Line 1787 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 191:
/* Line 1787 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 192:
/* Line 1787 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 193:
/* Line 1787 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 194:
/* Line 1787 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 195:
/* Line 1787 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 199:
/* Line 1787 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 200:
/* Line 1787 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 201:
/* Line 1787 of yacc.c  */
#line 629 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 202:
/* Line 1787 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 203:
/* Line 1787 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 204:
/* Line 1787 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 205:
/* Line 1787 of yacc.c  */
#line 633 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 206:
/* Line 1787 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 207:
/* Line 1787 of yacc.c  */
#line 635 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 208:
/* Line 1787 of yacc.c  */
#line 636 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 209:
/* Line 1787 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 210:
/* Line 1787 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 211:
/* Line 1787 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 212:
/* Line 1787 of yacc.c  */
#line 640 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 213:
/* Line 1787 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 214:
/* Line 1787 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 215:
/* Line 1787 of yacc.c  */
#line 643 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 216:
/* Line 1787 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 217:
/* Line 1787 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 221:
/* Line 1787 of yacc.c  */
#line 649 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 222:
/* Line 1787 of yacc.c  */
#line 650 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 223:
/* Line 1787 of yacc.c  */
#line 655 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 224:
/* Line 1787 of yacc.c  */
#line 656 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); }
    break;

  case 225:
/* Line 1787 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); }
    break;

  case 226:
/* Line 1787 of yacc.c  */
#line 658 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); }
    break;

  case 227:
/* Line 1787 of yacc.c  */
#line 660 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 228:
/* Line 1787 of yacc.c  */
#line 662 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); }
    break;

  case 229:
/* Line 1787 of yacc.c  */
#line 663 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); }
    break;

  case 230:
/* Line 1787 of yacc.c  */
#line 664 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); }
    break;

  case 231:
/* Line 1787 of yacc.c  */
#line 665 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 667 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 671 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 673 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 676 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 678 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 682 "expression.y"
    { (yyval.specifierType) = structSpecifier; }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 683 "expression.y"
    { (yyval.specifierType) = unionSpecifier; }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 687 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); }
    break;

  case 240:
/* Line 1787 of yacc.c  */
#line 688 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); }
    break;

  case 241:
/* Line 1787 of yacc.c  */
#line 692 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; }
    break;

  case 242:
/* Line 1787 of yacc.c  */
#line 696 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
    break;

  case 243:
/* Line 1787 of yacc.c  */
#line 697 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 702 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 708 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 710 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 713 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 719 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 721 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 724 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 726 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 728 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 730 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 732 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 735 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 737 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 739 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 741 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 743 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 747 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 748 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 749 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 267:
/* Line 1787 of yacc.c  */
#line 750 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 268:
/* Line 1787 of yacc.c  */
#line 751 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); }
    break;

  case 269:
/* Line 1787 of yacc.c  */
#line 752 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); }
    break;

  case 270:
/* Line 1787 of yacc.c  */
#line 753 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); }
    break;

  case 271:
/* Line 1787 of yacc.c  */
#line 754 "expression.y"
    { (yyval.classDef) = null; }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 759 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 761 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 766 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 768 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 770 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 772 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 774 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 778 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 779 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 784 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 785 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 786 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 787 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 788 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 793 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 795 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 800 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null, null); }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 802 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp), null); }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 803 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (2)].id), null, (yyvsp[(2) - (2)].list)); }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 804 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (4)].id), (yyvsp[(4) - (4)].exp), (yyvsp[(2) - (4)].list)); }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 810 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 293:
/* Line 1787 of yacc.c  */
#line 812 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
    break;

  case 294:
/* Line 1787 of yacc.c  */
#line 814 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); }
    break;

  case 295:
/* Line 1787 of yacc.c  */
#line 816 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); }
    break;

  case 296:
/* Line 1787 of yacc.c  */
#line 818 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 298:
/* Line 1787 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 299:
/* Line 1787 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 300:
/* Line 1787 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 301:
/* Line 1787 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 835 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 841 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 847 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 849 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 311:
/* Line 1787 of yacc.c  */
#line 850 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 851 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 852 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 856 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 858 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 317:
/* Line 1787 of yacc.c  */
#line 859 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 860 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 861 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 909 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 322:
/* Line 1787 of yacc.c  */
#line 911 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 917 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 919 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 923 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 925 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 931 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 330:
/* Line 1787 of yacc.c  */
#line 934 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 936 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 938 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 335:
/* Line 1787 of yacc.c  */
#line 946 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 336:
/* Line 1787 of yacc.c  */
#line 948 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 957 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 339:
/* Line 1787 of yacc.c  */
#line 959 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 961 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 965 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 966 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 970 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 971 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 972 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 973 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 978 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); }
    break;

  case 349:
/* Line 1787 of yacc.c  */
#line 982 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 983 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 987 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 988 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 989 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 993 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 994 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 998 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 999 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 1009 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 1011 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 1013 "expression.y"
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
      }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 1028 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 1030 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 363:
/* Line 1787 of yacc.c  */
#line 1051 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); }
    break;

  case 371:
/* Line 1787 of yacc.c  */
#line 1067 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 372:
/* Line 1787 of yacc.c  */
#line 1069 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; }
    break;

  case 373:
/* Line 1787 of yacc.c  */
#line 1071 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 1075 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); }
    break;

  case 375:
/* Line 1787 of yacc.c  */
#line 1076 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 1080 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 1081 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 1084 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 379:
/* Line 1787 of yacc.c  */
#line 1088 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 1089 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); }
    break;

  case 381:
/* Line 1787 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.context) = PushContext(); }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 1099 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
    break;

  case 384:
/* Line 1787 of yacc.c  */
#line 1107 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 1111 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
    break;

  case 386:
/* Line 1787 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 1116 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 1117 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 1122 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 1123 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 1124 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 393:
/* Line 1787 of yacc.c  */
#line 1125 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 1127 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 395:
/* Line 1787 of yacc.c  */
#line 1128 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 396:
/* Line 1787 of yacc.c  */
#line 1129 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 397:
/* Line 1787 of yacc.c  */
#line 1133 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); }
    break;

  case 398:
/* Line 1787 of yacc.c  */
#line 1134 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 399:
/* Line 1787 of yacc.c  */
#line 1135 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 400:
/* Line 1787 of yacc.c  */
#line 1136 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); }
    break;

  case 401:
/* Line 1787 of yacc.c  */
#line 1137 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 402:
/* Line 1787 of yacc.c  */
#line 1141 "expression.y"
    { (yyval.string) = CopyString(yytext); }
    break;

  case 403:
/* Line 1787 of yacc.c  */
#line 1146 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 404:
/* Line 1787 of yacc.c  */
#line 1148 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 405:
/* Line 1787 of yacc.c  */
#line 1153 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; }
    break;

  case 406:
/* Line 1787 of yacc.c  */
#line 1155 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;}
    break;

  case 407:
/* Line 1787 of yacc.c  */
#line 1157 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); }
    break;

  case 408:
/* Line 1787 of yacc.c  */
#line 1159 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); }
    break;

  case 409:
/* Line 1787 of yacc.c  */
#line 1164 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; }
    break;

  case 410:
/* Line 1787 of yacc.c  */
#line 1166 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;}
    break;

  case 411:
/* Line 1787 of yacc.c  */
#line 1171 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 412:
/* Line 1787 of yacc.c  */
#line 1173 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 413:
/* Line 1787 of yacc.c  */
#line 1178 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); }
    break;

  case 414:
/* Line 1787 of yacc.c  */
#line 1183 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); }
    break;

  case 415:
/* Line 1787 of yacc.c  */
#line 1188 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 416:
/* Line 1787 of yacc.c  */
#line 1190 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 417:
/* Line 1787 of yacc.c  */
#line 1195 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 418:
/* Line 1787 of yacc.c  */
#line 1197 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 419:
/* Line 1787 of yacc.c  */
#line 1199 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 420:
/* Line 1787 of yacc.c  */
#line 1201 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 421:
/* Line 1787 of yacc.c  */
#line 1203 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 422:
/* Line 1787 of yacc.c  */
#line 1209 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 423:
/* Line 1787 of yacc.c  */
#line 1214 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 424:
/* Line 1787 of yacc.c  */
#line 1218 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;}
    break;

  case 425:
/* Line 1787 of yacc.c  */
#line 1219 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
    break;

  case 426:
/* Line 1787 of yacc.c  */
#line 1224 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); }
    break;

  case 427:
/* Line 1787 of yacc.c  */
#line 1226 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 428:
/* Line 1787 of yacc.c  */
#line 1231 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 429:
/* Line 1787 of yacc.c  */
#line 1235 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); }
    break;

  case 430:
/* Line 1787 of yacc.c  */
#line 1236 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 431:
/* Line 1787 of yacc.c  */
#line 1237 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 432:
/* Line 1787 of yacc.c  */
#line 1238 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 433:
/* Line 1787 of yacc.c  */
#line 1239 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  }
    break;

  case 434:
/* Line 1787 of yacc.c  */
#line 1240 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 436:
/* Line 1787 of yacc.c  */
#line 1245 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 437:
/* Line 1787 of yacc.c  */
#line 1246 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); }
    break;

  case 438:
/* Line 1787 of yacc.c  */
#line 1250 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); }
    break;


/* Line 1787 of yacc.c  */
#line 6943 "expression.ec"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
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
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

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

  yyerror_range[1] = yylsp[1-yylen];
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
      if (!yypact_value_is_default (yyn))
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

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
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

#if !defined yyoverflow || YYERROR_VERBOSE
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
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
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


/* Line 2050 of yacc.c  */
#line 1252 "expression.y"

