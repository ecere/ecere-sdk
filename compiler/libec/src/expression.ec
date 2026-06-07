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
     BF16 = 297,
     LONG = 298,
     SIGNED = 299,
     UNSIGNED = 300,
     FLOAT = 301,
     DOUBLE = 302,
     CONST = 303,
     VOLATILE = 304,
     VOID = 305,
     VALIST = 306,
     STRUCT = 307,
     UNION = 308,
     ENUM = 309,
     ELLIPSIS = 310,
     CASE = 311,
     DEFAULT = 312,
     IF = 313,
     SWITCH = 314,
     WHILE = 315,
     DO = 316,
     FOR = 317,
     GOTO = 318,
     CONTINUE = 319,
     BREAK = 320,
     RETURN = 321,
     IFX = 322,
     ELSE = 323,
     CLASS = 324,
     THISCLASS = 325,
     PROPERTY = 326,
     SETPROP = 327,
     GETPROP = 328,
     NEWOP = 329,
     RENEW = 330,
     DELETE = 331,
     EXT_DECL = 332,
     EXT_STORAGE = 333,
     IMPORT = 334,
     DEFINE = 335,
     VIRTUAL = 336,
     ATTRIB = 337,
     PUBLIC = 338,
     PRIVATE = 339,
     TYPED_OBJECT = 340,
     ANY_OBJECT = 341,
     _INCREF = 342,
     EXTENSION = 343,
     ASM = 344,
     TYPEOF = 345,
     WATCH = 346,
     STOPWATCHING = 347,
     FIREWATCHERS = 348,
     WATCHABLE = 349,
     CLASS_DESIGNER = 350,
     CLASS_NO_EXPANSION = 351,
     CLASS_FIXED = 352,
     ISPROPSET = 353,
     CLASS_DEFAULT_PROPERTY = 354,
     PROPERTY_CATEGORY = 355,
     CLASS_DATA = 356,
     CLASS_PROPERTY = 357,
     SUBCLASS = 358,
     NAMESPACE = 359,
     NEW0OP = 360,
     RENEW0 = 361,
     VAARG = 362,
     DBTABLE = 363,
     DBFIELD = 364,
     DBINDEX = 365,
     DATABASE_OPEN = 366,
     ALIGNOF = 367,
     ATTRIB_DEP = 368,
     __ATTRIB = 369,
     BOOL = 370,
     _BOOL = 371,
     _COMPLEX = 372,
     _IMAGINARY = 373,
     RESTRICT = 374,
     THREAD = 375,
     WIDE_STRING_LITERAL = 376,
     BUILTIN_OFFSETOF = 377,
     PRAGMA = 378,
     STATIC_ASSERT = 379
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
#line 303 "expression.ec"
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
#line 344 "expression.ec"

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
#define YYFINAL  157
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7867

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  150
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  108
/* YYNRULES -- Number of rules.  */
#define YYNRULES  440
/* YYNRULES -- Number of states.  */
#define YYNSTATES  762

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   379

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   137,     2,     2,   127,   139,   132,     2,
     125,   126,   133,   134,   131,   135,   128,   138,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   145,   147,
     140,   146,   141,   144,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   129,     2,   130,   142,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   148,   143,   149,   136,     2,     2,     2,
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
     115,   116,   117,   118,   119,   120,   121,   122,   123,   124
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
     575,   580,   582,   584,   586,   588,   590,   592,   594,   596,
     598,   600,   602,   604,   606,   608,   610,   612,   614,   616,
     618,   620,   622,   624,   629,   631,   637,   642,   647,   651,
     657,   664,   670,   676,   681,   688,   691,   694,   698,   702,
     704,   706,   708,   711,   715,   717,   721,   731,   741,   749,
     757,   763,   774,   785,   794,   803,   810,   819,   828,   835,
     842,   847,   857,   867,   875,   883,   889,   893,   896,   899,
     902,   904,   907,   909,   911,   913,   917,   919,   922,   925,
     929,   935,   938,   941,   946,   952,   960,   968,   974,   976,
     980,   982,   986,   989,   994,   998,  1001,  1005,  1009,  1013,
    1018,  1023,  1026,  1030,  1034,  1039,  1043,  1046,  1050,  1054,
    1059,  1061,  1063,  1066,  1069,  1072,  1076,  1078,  1080,  1083,
    1086,  1089,  1093,  1095,  1098,  1102,  1104,  1108,  1113,  1117,
    1122,  1124,  1127,  1130,  1134,  1138,  1140,  1142,  1145,  1148,
    1151,  1155,  1159,  1162,  1164,  1167,  1169,  1172,  1175,  1179,
    1181,  1185,  1187,  1191,  1194,  1197,  1199,  1201,  1205,  1207,
    1210,  1212,  1216,  1221,  1223,  1225,  1227,  1231,  1233,  1235,
    1237,  1239,  1241,  1243,  1247,  1252,  1256,  1258,  1261,  1263,
    1266,  1269,  1271,  1273,  1276,  1278,  1281,  1285,  1287,  1290,
    1296,  1304,  1310,  1316,  1324,  1331,  1339,  1344,  1350,  1355,
    1359,  1362,  1365,  1368,  1372,  1374,  1380,  1385,  1390,  1394,
    1399,  1403,  1407,  1410,  1413,  1415,  1419,  1424,  1428,  1431,
    1434,  1437,  1440,  1443,  1446,  1449,  1452,  1456,  1458,  1460,
    1464,  1467,  1469,  1471,  1474,  1477,  1479,  1482,  1484,  1486,
    1489
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     257,     0,    -1,     3,    -1,   153,    -1,   125,   174,   126,
      -1,   151,    -1,   243,    -1,     4,    -1,   121,    -1,   241,
      -1,   127,   241,    -1,   127,   241,   128,   241,    -1,   125,
     126,    -1,    74,   178,   213,   129,   175,   130,    -1,    74,
     178,   129,   175,   130,    -1,   105,   178,   213,   129,   175,
     130,    -1,   105,   178,   129,   175,   130,    -1,    75,   175,
     180,   213,   129,   175,   130,    -1,    75,   175,   180,   129,
     175,   130,    -1,   106,   175,   180,   213,   129,   175,   130,
      -1,   106,   175,   180,   129,   175,   130,    -1,     1,    -1,
     244,    -1,   152,    -1,   155,   129,   174,   130,    -1,   155,
     125,   126,    -1,   155,   125,   156,   126,    -1,   155,   128,
     151,    -1,   155,   151,    -1,   155,     7,   151,    -1,   155,
       8,    -1,   155,     9,    -1,   172,    -1,   154,    -1,   156,
     131,   172,    -1,   156,   131,   154,    -1,     8,   158,    -1,
       9,   158,    -1,   159,   160,    -1,     6,   158,    -1,     6,
     125,   226,   126,    -1,   112,   158,    -1,   112,   125,   226,
     126,    -1,   157,    -1,   155,    -1,   132,    -1,   133,    -1,
     134,    -1,   135,    -1,   136,    -1,   137,    -1,    76,    -1,
     158,    -1,   125,   226,   126,   160,    -1,   160,    -1,   161,
     133,   160,    -1,   161,   138,   160,    -1,   161,   139,   160,
      -1,   161,    -1,   162,   134,   161,    -1,   162,   135,   161,
      -1,   162,    -1,   163,    10,   162,    -1,   163,    11,   162,
      -1,   163,    -1,   164,   140,   163,    -1,   164,   141,   163,
      -1,   164,    12,   163,    -1,   164,    13,   163,    -1,   164,
      -1,   165,    14,   164,    -1,   165,    15,   164,    -1,   165,
      -1,   166,   132,   165,    -1,   166,    -1,   167,   142,   166,
      -1,   167,    -1,   168,   143,   167,    -1,   168,    -1,   169,
      16,   168,    -1,   169,    -1,   170,    17,   169,    -1,   170,
      -1,   170,   144,   174,   145,   171,    -1,   171,    -1,   158,
     173,   172,    -1,   171,   173,   172,    -1,   158,   173,   154,
      -1,   171,   173,   154,    -1,   146,    -1,    18,    -1,    19,
      -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    25,    -1,    26,    -1,    27,    -1,   172,    -1,   174,
     131,   172,    -1,   171,    -1,   178,   147,    -1,   178,   181,
     147,    -1,   242,   147,    -1,    80,   151,   146,   175,   147,
      -1,   191,    -1,   177,   191,    -1,   194,    -1,   177,   194,
      -1,   207,    -1,   177,   207,    -1,   196,    -1,   177,   196,
      -1,   183,    -1,   178,   183,    -1,   191,    -1,   178,   191,
      -1,   194,    -1,   178,   194,    -1,   207,    -1,   178,   207,
      -1,   196,    -1,   178,   196,    -1,   183,    -1,   179,   183,
      -1,   191,    -1,   179,   191,    -1,   194,    -1,   179,   194,
      -1,   192,    -1,   179,   192,    -1,   183,    -1,   180,   183,
      -1,   191,    -1,   180,   191,    -1,   195,    -1,   180,   195,
      -1,   196,    -1,   180,   196,    -1,   207,    -1,   180,   207,
      -1,   182,    -1,   181,   131,   182,    -1,   214,    -1,   214,
     146,   227,    -1,    29,    -1,    30,    -1,    31,    -1,    32,
      -1,    33,    -1,   120,    -1,    77,    -1,   189,    -1,   190,
      -1,    82,    -1,   113,    -1,   114,    -1,     3,    -1,    28,
      -1,    78,    -1,    77,    -1,    48,    -1,   186,    -1,   186,
     125,   174,   126,    -1,   187,    -1,   188,   187,    -1,   188,
     131,   187,    -1,   185,   125,   125,   188,   126,   126,    -1,
     185,   125,   125,   126,   126,    -1,   189,    -1,   190,   189,
      -1,    48,    -1,    49,    -1,    78,    -1,   193,    -1,    28,
      -1,    50,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    39,    -1,    40,    -1,    41,    -1,    42,
      -1,    51,    -1,    43,    -1,    46,    -1,    47,    -1,    44,
      -1,    45,    -1,    88,    -1,   116,    -1,   115,    -1,   197,
      -1,   206,    -1,   192,    -1,   103,   125,   192,   126,    -1,
      70,    -1,    50,    -1,    34,    -1,    35,    -1,    36,    -1,
      37,    -1,    38,    -1,    39,    -1,    40,    -1,    41,    -1,
      42,    -1,    51,    -1,    43,    -1,    46,    -1,    47,    -1,
      44,    -1,    45,    -1,   116,    -1,   115,    -1,   197,    -1,
     206,    -1,   193,    -1,   103,   125,   192,   126,    -1,    70,
      -1,   198,   151,   148,   199,   149,    -1,   198,   148,   199,
     149,    -1,   198,   151,   148,   149,    -1,   198,   148,   149,
      -1,   198,   193,   148,   199,   149,    -1,   198,   184,   151,
     148,   199,   149,    -1,   198,   184,   148,   199,   149,    -1,
     198,   184,   151,   148,   149,    -1,   198,   184,   148,   149,
      -1,   198,   184,   193,   148,   199,   149,    -1,   198,   151,
      -1,   198,   193,    -1,   198,   184,   151,    -1,   198,   184,
     193,    -1,    52,    -1,    53,    -1,   203,    -1,   199,   203,
      -1,   155,   146,   228,    -1,   200,    -1,   201,   131,   200,
      -1,    71,   179,   151,   148,    72,   236,    73,   236,   149,
      -1,    71,   179,   151,   148,    73,   236,    72,   236,   149,
      -1,    71,   179,   151,   148,    72,   236,   149,    -1,    71,
     179,   151,   148,    73,   236,   149,    -1,    71,   179,   151,
     148,   149,    -1,    71,   179,   212,   151,   148,    72,   236,
      73,   236,   149,    -1,    71,   179,   212,   151,   148,    73,
     236,    72,   236,   149,    -1,    71,   179,   212,   151,   148,
      72,   236,   149,    -1,    71,   179,   212,   151,   148,    73,
     236,   149,    -1,    71,   179,   212,   151,   148,   149,    -1,
      71,   179,   148,    72,   236,    73,   236,   149,    -1,    71,
     179,   148,    73,   236,    72,   236,   149,    -1,    71,   179,
     148,    72,   236,   149,    -1,    71,   179,   148,    73,   236,
     149,    -1,    71,   179,   148,   149,    -1,    71,   179,   212,
     148,    72,   236,    73,   236,   149,    -1,    71,   179,   212,
     148,    73,   236,    72,   236,   149,    -1,    71,   179,   212,
     148,    72,   236,   149,    -1,    71,   179,   212,   148,    73,
     236,   149,    -1,    71,   179,   212,   148,   149,    -1,   178,
     204,   147,    -1,   178,   147,    -1,   243,   147,    -1,   242,
     147,    -1,   249,    -1,   201,   147,    -1,   202,    -1,   147,
      -1,   205,    -1,   204,   131,   205,    -1,   214,    -1,   214,
     189,    -1,   145,   175,    -1,   214,   145,   175,    -1,   214,
     145,   175,   145,   175,    -1,    54,   151,    -1,    54,   193,
      -1,    54,   148,   208,   149,    -1,    54,   151,   148,   208,
     149,    -1,    54,   151,   148,   208,   147,   199,   149,    -1,
      54,   193,   148,   208,   147,   199,   149,    -1,    54,   193,
     148,   208,   149,    -1,   209,    -1,   208,   131,   209,    -1,
     151,    -1,   151,   146,   175,    -1,   151,   190,    -1,   151,
     190,   146,   175,    -1,   125,   212,   126,    -1,   129,   130,
      -1,   129,   175,   130,    -1,   129,   192,   130,    -1,   210,
     129,   130,    -1,   210,   129,   175,   130,    -1,   210,   129,
     192,   130,    -1,   125,   126,    -1,   125,   222,   126,    -1,
     210,   125,   126,    -1,   210,   125,   222,   126,    -1,   125,
     213,   126,    -1,   125,   126,    -1,   125,   222,   126,    -1,
     211,   125,   126,    -1,   211,   125,   222,   126,    -1,   221,
      -1,   210,    -1,   221,   210,    -1,   184,   221,    -1,   184,
     210,    -1,   184,   221,   210,    -1,   221,    -1,   211,    -1,
     221,   211,    -1,   184,   221,    -1,   184,   211,    -1,   184,
     221,   211,    -1,   217,    -1,   221,   217,    -1,   184,   221,
     217,    -1,   151,    -1,   125,   214,   126,    -1,   215,   129,
     175,   130,    -1,   215,   129,   130,    -1,   215,   129,   192,
     130,    -1,   219,    -1,   221,   219,    -1,   184,   219,    -1,
     184,   221,   219,    -1,   221,   184,   219,    -1,   219,    -1,
     215,    -1,   184,   219,    -1,   184,   215,    -1,   215,   125,
      -1,   218,   222,   126,    -1,   218,   225,   126,    -1,   218,
     126,    -1,   191,    -1,   220,   191,    -1,   133,    -1,   133,
     220,    -1,   133,   221,    -1,   133,   220,   221,    -1,   223,
      -1,   223,   131,    55,    -1,   224,    -1,   223,   131,   224,
      -1,   178,   214,    -1,   178,   212,    -1,   178,    -1,   151,
      -1,   225,   131,   151,    -1,   177,    -1,   177,   212,    -1,
     172,    -1,   148,   229,   149,    -1,   148,   229,   131,   149,
      -1,   171,    -1,   154,    -1,   227,    -1,   229,   131,   227,
      -1,   231,    -1,   236,    -1,   237,    -1,   238,    -1,   239,
      -1,   240,    -1,   151,   145,   230,    -1,    56,   175,   145,
     230,    -1,    57,   145,   230,    -1,   176,    -1,   232,   176,
      -1,   230,    -1,   233,   230,    -1,   233,   176,    -1,   233,
      -1,   232,    -1,   232,   233,    -1,   148,    -1,   148,   149,
      -1,   235,   234,   149,    -1,   147,    -1,   174,   147,    -1,
      58,   125,   174,   126,   230,    -1,    58,   125,   174,   126,
     230,    68,   230,    -1,    59,   125,   174,   126,   230,    -1,
      60,   125,   174,   126,   230,    -1,    61,   230,    60,   125,
     174,   126,   147,    -1,    62,   125,   237,   237,   126,   230,
      -1,    62,   125,   237,   237,   174,   126,   230,    -1,    60,
     125,   126,   230,    -1,    62,   125,   237,   126,   230,    -1,
      62,   125,   126,   230,    -1,    63,   151,   147,    -1,    64,
     147,    -1,    65,   147,    -1,    66,   147,    -1,    66,   174,
     147,    -1,     5,    -1,   178,   151,   148,   256,   149,    -1,
     178,   151,   148,   149,    -1,   192,   148,   256,   149,    -1,
     192,   148,   149,    -1,   151,   148,   256,   149,    -1,   151,
     148,   149,    -1,   148,   256,   149,    -1,   148,   149,    -1,
     178,   216,    -1,   216,    -1,   178,   125,   126,    -1,   136,
     178,   125,   126,    -1,    81,   178,   216,    -1,    81,   216,
      -1,   245,   236,    -1,   248,   236,    -1,   248,   147,    -1,
     246,   236,    -1,   247,   236,    -1,   178,   216,    -1,   250,
     236,    -1,   155,   146,   228,    -1,   228,    -1,   252,    -1,
     253,   131,   252,    -1,   253,   147,    -1,   254,    -1,   251,
      -1,   255,   254,    -1,   255,   251,    -1,   147,    -1,   255,
     147,    -1,   255,    -1,   253,    -1,   255,   253,    -1,   172,
      -1
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
     625,   626,   630,   631,   632,   633,   634,   635,   636,   637,
     638,   639,   640,   641,   642,   643,   644,   645,   646,   647,
     648,   649,   650,   651,   652,   657,   658,   659,   660,   661,
     664,   665,   666,   667,   668,   673,   674,   677,   679,   684,
     685,   689,   690,   694,   698,   699,   703,   705,   707,   709,
     711,   714,   716,   718,   720,   722,   725,   727,   729,   731,
     733,   736,   738,   740,   742,   744,   749,   750,   751,   752,
     753,   754,   755,   756,   760,   762,   767,   769,   771,   773,
     775,   780,   781,   785,   787,   788,   789,   790,   794,   796,
     801,   803,   805,   806,   811,   813,   815,   817,   819,   821,
     823,   825,   827,   829,   831,   836,   838,   840,   842,   844,
     849,   850,   851,   852,   853,   854,   858,   859,   860,   861,
     862,   863,   909,   910,   912,   918,   920,   922,   924,   926,
     931,   932,   935,   937,   939,   945,   946,   947,   949,   954,
     958,   960,   962,   967,   968,   972,   973,   974,   975,   979,
     980,   984,   985,   989,   990,   991,   995,   996,  1000,  1001,
    1010,  1012,  1014,  1030,  1031,  1052,  1054,  1059,  1060,  1061,
    1062,  1063,  1064,  1068,  1070,  1072,  1077,  1078,  1082,  1083,
    1086,  1090,  1091,  1092,  1096,  1100,  1108,  1113,  1114,  1118,
    1119,  1120,  1124,  1125,  1126,  1127,  1129,  1130,  1131,  1135,
    1136,  1137,  1138,  1139,  1143,  1147,  1149,  1154,  1156,  1158,
    1160,  1165,  1167,  1172,  1174,  1179,  1184,  1189,  1191,  1196,
    1198,  1200,  1202,  1204,  1210,  1215,  1220,  1221,  1225,  1227,
    1232,  1237,  1238,  1239,  1240,  1241,  1242,  1246,  1247,  1248,
    1252
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
  "SHORT", "INT", "UINT", "INT64", "INT128", "FLOAT128", "FLOAT16", "BF16",
  "LONG", "SIGNED", "UNSIGNED", "FLOAT", "DOUBLE", "CONST", "VOLATILE",
  "VOID", "VALIST", "STRUCT", "UNION", "ENUM", "ELLIPSIS", "CASE",
  "DEFAULT", "IF", "SWITCH", "WHILE", "DO", "FOR", "GOTO", "CONTINUE",
  "BREAK", "RETURN", "IFX", "ELSE", "CLASS", "THISCLASS", "PROPERTY",
  "SETPROP", "GETPROP", "NEWOP", "RENEW", "DELETE", "EXT_DECL",
  "EXT_STORAGE", "IMPORT", "DEFINE", "VIRTUAL", "ATTRIB", "PUBLIC",
  "PRIVATE", "TYPED_OBJECT", "ANY_OBJECT", "_INCREF", "EXTENSION", "ASM",
  "TYPEOF", "WATCH", "STOPWATCHING", "FIREWATCHERS", "WATCHABLE",
  "CLASS_DESIGNER", "CLASS_NO_EXPANSION", "CLASS_FIXED", "ISPROPSET",
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
     375,   376,   377,   378,   379,    40,    41,    36,    46,    91,
      93,    44,    38,    42,    43,    45,   126,    33,    47,    37,
      60,    62,    94,   124,    63,    58,    61,    59,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   150,   151,   152,   152,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   154,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   156,   156,   156,   156,   157,   157,   157,   157,
     157,   157,   157,   158,   158,   159,   159,   159,   159,   159,
     159,   159,   160,   160,   161,   161,   161,   161,   162,   162,
     162,   163,   163,   163,   164,   164,   164,   164,   164,   165,
     165,   165,   166,   166,   167,   167,   168,   168,   169,   169,
     170,   170,   171,   171,   172,   172,   172,   172,   172,   173,
     173,   173,   173,   173,   173,   173,   173,   173,   173,   173,
     174,   174,   175,   176,   176,   176,   176,   177,   177,   177,
     177,   177,   177,   177,   177,   178,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   179,   179,   179,   179,   179,
     179,   179,   179,   180,   180,   180,   180,   180,   180,   180,
     180,   180,   180,   181,   181,   182,   182,   183,   183,   183,
     183,   183,   183,   184,   184,   184,   185,   185,   185,   186,
     186,   186,   186,   186,   187,   187,   188,   188,   188,   189,
     189,   190,   190,   191,   191,   191,   192,   193,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   194,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   196,   196,   196,   196,   196,
     196,   196,   196,   196,   196,   197,   197,   197,   197,   198,
     198,   199,   199,   200,   201,   201,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,   203,   203,   203,   203,
     203,   203,   203,   203,   204,   204,   205,   205,   205,   205,
     205,   206,   206,   207,   207,   207,   207,   207,   208,   208,
     209,   209,   209,   209,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   211,   211,   211,   211,   211,
     212,   212,   212,   212,   212,   212,   213,   213,   213,   213,
     213,   213,   214,   214,   214,   215,   215,   215,   215,   215,
     216,   216,   216,   216,   216,   217,   217,   217,   217,   218,
     219,   219,   219,   220,   220,   221,   221,   221,   221,   222,
     222,   223,   223,   224,   224,   224,   225,   225,   226,   226,
     227,   227,   227,   228,   228,   229,   229,   230,   230,   230,
     230,   230,   230,   231,   231,   231,   232,   232,   233,   233,
     233,   234,   234,   234,   235,   236,   236,   237,   237,   238,
     238,   238,   239,   239,   239,   239,   239,   239,   239,   240,
     240,   240,   240,   240,   241,   242,   242,   243,   243,   243,
     243,   244,   244,   245,   245,   246,   247,   248,   248,   249,
     249,   249,   249,   249,   250,   251,   252,   252,   253,   253,
     254,   255,   255,   255,   255,   255,   255,   256,   256,   256,
     257
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
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     5,     4,     4,     3,     5,
       6,     5,     5,     4,     6,     2,     2,     3,     3,     1,
       1,     1,     2,     3,     1,     3,     9,     9,     7,     7,
       5,    10,    10,     8,     8,     6,     8,     8,     6,     6,
       4,     9,     9,     7,     7,     5,     3,     2,     2,     2,
       1,     2,     1,     1,     1,     3,     1,     2,     2,     3,
       5,     2,     2,     4,     5,     7,     7,     5,     1,     3,
       1,     3,     2,     4,     3,     2,     3,     3,     3,     4,
       4,     2,     3,     3,     4,     3,     2,     3,     3,     4,
       1,     1,     2,     2,     2,     3,     1,     1,     2,     2,
       2,     3,     1,     2,     3,     1,     3,     4,     3,     4,
       1,     2,     2,     3,     3,     1,     1,     2,     2,     2,
       3,     3,     2,     1,     2,     1,     2,     2,     3,     1,
       3,     1,     3,     2,     2,     1,     1,     3,     1,     2,
       1,     3,     4,     1,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     3,     4,     3,     1,     2,     1,     2,
       2,     1,     1,     2,     1,     2,     3,     1,     2,     5,
       7,     5,     5,     7,     6,     7,     4,     5,     4,     3,
       2,     2,     2,     3,     1,     5,     4,     4,     3,     4,
       3,     3,     2,     2,     1,     3,     4,     3,     2,     2,
       2,     2,     2,     2,     2,     2,     3,     1,     1,     3,
       2,     1,     1,     2,     2,     1,     2,     1,     1,     2,
       1
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    21,     2,     7,   404,     0,     0,     0,   177,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   440,     0,   176,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   179,
     180,   181,   182,   183,   184,   185,   186,   187,   189,   192,
     193,   190,   191,   173,   174,   178,   188,   239,   240,     0,
     201,   175,   194,     0,   196,   195,   152,     0,   115,   117,
     199,   119,   123,   197,     0,   198,   121,    52,   102,     0,
       0,     0,     0,    41,    12,   100,     0,   358,   107,   199,
     109,   113,   111,     0,    10,     0,     0,    30,    31,     0,
       0,     0,    28,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,    89,     0,    38,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
     281,   282,     0,   153,   156,   157,   158,     0,     0,   345,
     116,     0,     0,   154,   155,   118,   120,   124,   122,   317,
       0,   316,     0,   235,     0,   236,   203,   204,   205,   206,
     207,   208,   209,   210,   211,   213,   216,   217,   214,   215,
     202,   212,   224,     0,   219,   218,     0,   133,   135,   222,
     137,   139,   220,   221,   141,     0,     0,     0,     0,     4,
       0,     0,     0,     0,   108,   110,   114,   112,   311,   359,
     310,     0,     0,   435,     0,   410,   364,    44,   363,     0,
     427,    22,     0,   432,   428,   438,   431,     0,     0,    29,
      25,    33,     0,    32,    27,     0,    87,    85,    55,    56,
      57,    59,    60,    62,    63,    67,    68,    65,    66,    70,
      71,    73,    75,    77,    79,    81,     0,    88,    86,   408,
       0,    40,   290,     0,   288,     0,     0,     0,   306,   355,
       0,     0,   349,   351,     0,   343,   346,   347,   320,   319,
       0,   172,     0,     0,   318,     0,     0,     0,     0,   273,
     228,     5,     0,     0,     0,     0,   244,     0,   272,   241,
       0,   414,     0,   330,     0,     0,     6,     0,     0,     0,
       0,   270,     0,     0,   237,   238,     0,     0,     0,   134,
     136,   138,   140,   142,     0,     0,     0,     0,     0,    42,
     101,   301,     0,     0,   295,     0,     0,   314,   313,     0,
       0,   312,    53,    11,   412,     0,     0,     0,   325,   424,
     384,     0,   425,     0,   430,   436,   434,   439,   433,   409,
      26,     0,    24,     0,   407,     0,   171,   292,     0,   283,
       0,     0,   200,     0,     0,   354,   353,   336,   322,   335,
     310,   305,   307,     0,    14,   344,   348,   321,     0,   308,
       0,     0,     0,     0,   125,   127,   131,   129,     0,     0,
     418,     0,    46,     0,     0,     0,     0,     0,     0,     0,
     267,   325,     0,     0,   274,   276,   413,   335,     0,   332,
       0,   226,   242,     0,   271,   339,     0,   342,   356,     0,
       0,     0,   331,   269,   268,   419,   422,   423,   421,   420,
     227,     0,   233,     0,     0,     0,     0,     0,     0,     0,
      16,     0,     0,     0,   294,   302,   296,   297,   315,   303,
       0,   298,     0,     0,   411,   426,   385,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   387,
       5,     0,   376,     0,   378,   367,     0,     0,     0,   368,
     369,   370,   371,   372,     0,   429,    35,    34,    83,   291,
       0,   289,     0,   284,     0,   287,   338,   337,   313,     0,
     323,   350,   352,   159,   160,   163,   162,   161,     0,   164,
     166,     0,   309,    13,   281,   282,     0,     0,   126,   128,
     132,   130,     0,   235,     0,   236,   417,     0,   326,     0,
     243,   415,   278,     0,   337,     0,     0,   266,     0,   277,
       0,   335,   333,   245,   328,     0,     0,   340,   341,     0,
     334,   225,   231,   232,     0,     0,   229,   223,    18,     0,
      15,    20,     0,   304,   299,   300,     0,     0,     0,     0,
       0,     0,     0,     0,   400,   401,   402,     0,     0,     0,
     388,   103,     0,   143,   145,   377,     0,   380,   379,   386,
     105,   293,     0,     0,   324,   170,     0,     0,     0,   167,
       0,     0,   260,     0,     0,     0,   237,   238,   416,   406,
       0,   335,   275,   279,   337,   327,   329,   357,   230,   234,
      17,    19,     0,   375,     0,     0,     0,     0,     0,     0,
       0,   399,   403,     0,   373,     0,   104,     0,   285,   286,
       0,   169,   168,     0,     0,     0,     0,   250,     0,     0,
     265,     0,   405,     0,   374,     0,     0,   396,     0,     0,
     398,     0,     0,     0,   144,     0,   360,   146,   165,     0,
     258,     0,   259,     0,     0,     0,     0,     0,     0,   255,
     280,   389,   391,   392,     0,   397,     0,     0,   106,   365,
       0,     0,     0,     0,   248,     0,   249,     0,   263,     0,
     264,     0,     0,     0,     0,   394,     0,     0,   361,   256,
     257,     0,     0,     0,     0,     0,   253,     0,   254,   390,
     393,   395,   362,   366,   246,   247,   261,   262,     0,     0,
     251,   252
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   236,    27,   252,    28,    97,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   105,   134,   501,    99,   617,   107,   313,   413,
     206,   612,   613,    88,   314,   172,   539,   540,   541,   173,
     174,    89,    44,    45,    91,   210,    92,    93,    94,   315,
     316,   317,   318,   319,   433,   434,    95,    96,   283,   284,
     228,   179,   352,   180,   424,   320,   321,   398,   322,   323,
     296,   324,   353,   292,   293,   450,   113,   697,   240,   720,
     504,   505,   506,   507,   508,   371,   509,   510,   511,   512,
     513,    46,   325,    47,   241,   327,   328,   329,   330,   331,
     242,   243,   244,   245,   246,   247,   248,    48
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -640
static const yytype_int16 yypact[] =
{
    5757,  -640,  -640,  -640,  -640,  5833,  5867,  5867,  -640,  7561,
    5757,  -640,  7561,  5757,  5909,  -640,  5349,    79,  -640,  -640,
    -640,  -640,  -640,  -640,   -47,  -640,  -640,   493,  -640,   800,
    5757,  -640,   289,   128,   399,    62,   432,    15,   117,   126,
     286,    64,   800,  -640,   156,  -640,  -640,  -640,   323,  5349,
    -640,  5489,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,    20,
    -640,  -640,  -640,   213,  -640,  -640,  -640,  6542,  -640,  -640,
    -640,  -640,  -640,  -640,    82,  -640,  -640,  -640,  -640,  7747,
    6648,  7747,  5349,  -640,  -640,  -640,   -19,  7066,  -640,   156,
    -640,  -640,  -640,   222,   231,  1985,   348,  -640,  -640,  4379,
     348,  5757,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,  -640,  -640,  -640,  1140,  -640,  5757,  5757,  5757,  5757,
    5757,  5757,  5757,  5757,  5757,  5757,  5757,  5757,  5757,  5757,
    5757,  5757,  5757,  5757,  5757,  1140,  2122,  -640,   261,   348,
     249,   275,   371,  -640,  -640,  -640,  -640,  6754,  5757,    48,
    -640,   181,   310,   132,   198,  -640,  -640,  -640,  -640,   312,
     334,   314,  2658,   322,    25,   326,  -640,  -640,  -640,  -640,
    -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,  -640,  -640,   353,  -640,  -640,  6860,  -640,  -640,  -640,
    -640,  -640,  -640,  -640,  -640,  5757,   354,  6966,   359,  -640,
    5757,  6436,  5507,   241,  -640,  -640,  -640,  -640,   -43,  -640,
     254,  5757,    79,  -640,  2259,  -640,  -640,   197,  -640,  6231,
    -640,  -640,   345,  -640,  -640,   -69,  -640,  2396,   349,  -640,
    -640,  -640,    40,  -640,  -640,   335,  -640,  -640,  -640,  -640,
    -640,   289,   289,   128,   128,   399,   399,   399,   399,    62,
      62,   432,    15,   117,   126,   286,   172,  -640,  -640,  -640,
     366,  -640,   242,   -25,  -640,   348,   348,   387,  -640,  6125,
     416,   419,   394,  -640,   388,  -640,    48,  -640,   312,   314,
     396,  -640,  7172,  5757,   312,  7654,  6231,  5425,  7561,  -640,
    -640,   -47,   333,  4974,    66,  2783,  -640,   -44,  -640,  -640,
     264,  -640,  6337,  -640,   469,   400,   401,   345,   345,   345,
     364,  -640,  2908,  3033,   402,   405,  4568,   371,  5757,  -640,
    -640,  -640,  -640,  -640,   429,   430,  5757,  5757,   434,  -640,
    -640,  -640,   433,   442,  -640,   439,   127,   -43,   254,  7271,
    5571,   -43,  -640,  -640,  -640,   422,  1140,   479,  -640,  -640,
     424,  4225,  -640,  1140,  -640,  -640,  -640,   -69,  -640,  -640,
    -640,  1140,  -640,  5757,  -640,  5757,  -640,   395,   348,  -640,
     -22,   118,  -640,  6019,    54,  -640,  -640,   264,  -640,  -640,
     236,  -640,  -640,  7468,  -640,  -640,  -640,   312,   250,  -640,
     448,   454,    55,  4853,  -640,  -640,  -640,  -640,   374,  6231,
    -640,  5212,   719,    66,   463,   469,  7370,  1140,   391,  5757,
    -640,   443,    66,   109,  -640,   409,  -640,   447,   469,  -640,
      42,  -640,  -640,  1234,  -640,  -640,  5647,  -640,  -640,   470,
      87,    42,  -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,  3158,  -640,  3283,  3408,  4568,  3533,   475,   473,  5757,
    -640,   476,   477,  5757,  -640,  -640,  -640,  -640,   -43,  -640,
     482,  -640,   480,   134,  -640,  -640,  -640,  5757,   460,   486,
     489,   490,  4362,   492,   348,   472,   481,  4733,   348,  -640,
     -34,   152,  -640,  5094,  -640,  -640,  1574,  1711,   471,  -640,
    -640,  -640,  -640,  -640,   483,  -640,  -640,  -640,  -640,  -640,
    5757,  -640,  4568,  -640,  4568,  -640,   264,  -640,   236,    42,
    -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,   497,   499,
    -640,   412,  -640,  -640,  -640,  -640,    -7,   487,  -640,  -640,
    -640,  -640,    28,  -640,    55,  -640,  -640,   469,  -640,   501,
    -640,  -640,  -640,  2533,   494,   469,   287,  -640,  5757,  -640,
      42,   495,  -640,  -640,  -640,   504,   138,  -640,  -640,   348,
    -640,  -640,  -640,  -640,  3658,  3783,  -640,  -640,  -640,   508,
    -640,  -640,   511,  -640,  -640,  -640,   500,  4362,  5757,  5757,
    5681,   571,  4623,   502,  -640,  -640,  -640,   215,   498,  4362,
    -640,  -640,   221,  -640,   505,  -640,  1848,  -640,  -640,  -640,
    -640,  -640,  3908,  4033,  -640,  -640,  5757,   520,   223,  -640,
     345,   345,  -640,     4,   143,   506,  -640,  -640,  -640,  -640,
     512,   507,  -640,   503,   514,  -640,  -640,  -640,  -640,  -640,
    -640,  -640,  4362,  -640,   298,   300,  4362,   307,   522,  4362,
    4657,  -640,  -640,  5757,  -640,   479,  -640,  4443,  -640,  -640,
     317,  -640,  -640,    -5,    -9,   345,   345,  -640,   345,   345,
    -640,   160,  -640,  5757,  -640,  4362,  4362,  -640,  4362,  5757,
    -640,  4362,  5723,   525,  -640,  4443,  -640,  -640,  -640,   345,
    -640,   345,  -640,    63,    86,    70,   125,   345,   345,  -640,
    -640,   582,  -640,  -640,   328,  -640,  4362,   338,  -640,  -640,
     124,   544,   545,   345,  -640,   345,  -640,   345,  -640,   345,
    -640,   144,   135,  4362,   527,  -640,  4362,  4088,  -640,  -640,
    -640,   548,   549,   550,   551,   345,  -640,   345,  -640,  -640,
    -640,  -640,  -640,  -640,  -640,  -640,  -640,  -640,   553,   556,
    -640,  -640
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -640,   351,  -640,  -640,  -115,   908,  -640,  -640,     0,  -640,
     -21,   389,   390,   435,   392,   557,   519,   560,   555,   559,
    -640,     7,     1,   611,   -13,    57,  -341,  -640,    13,  -640,
     607,  -640,    49,   -28,   698,  -640,  -640,  -491,  -640,  -159,
     431,    -8,   744,   -55,   136,   141,    31,   190,  -268,  -272,
     272,  -640,  -640,  -289,  -640,   151,   238,   465,   251,   331,
    -212,  -139,  -105,   -67,  -279,  1031,  -218,  -371,  -640,   982,
    -640,   889,  -132,  -640,   318,  -640,     3,  -639,  -323,  -640,
     792,  -640,  -640,   217,  -640,  -640,     2,  -547,  -640,  -640,
    -640,    10,  -358,   608,  -640,  -640,  -640,  -640,  -640,  -640,
    -640,   485,   355,   488,   496,  -640,  -144,  -640
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -438
static const yytype_int16 yytable[] =
{
      29,    43,   229,   106,   251,    50,    52,    53,   108,   135,
     396,   357,   280,   514,   103,   301,    29,    98,   361,   256,
      98,   369,    87,     2,   161,   100,   442,   114,     2,   530,
     502,     2,   298,   216,   435,   291,   106,   418,   106,   185,
     277,   108,   304,   485,   209,     2,   209,   111,     8,    29,
     629,    29,   158,     8,   530,   660,   719,     2,     2,   170,
     461,   463,   373,   701,   466,   630,   631,   530,   699,     2,
     101,   207,   170,   207,   143,   144,   675,   676,   374,   175,
     111,   153,   359,     8,     4,     2,   360,   443,   420,   106,
     365,   208,   175,   208,   108,   436,    73,    74,   753,   224,
     290,   115,    29,   444,   560,   218,   388,   219,   255,   388,
       8,   609,   220,   692,   115,   258,   259,   260,   177,    29,
     253,    29,   238,   386,   389,   522,    81,   523,   239,   335,
     211,   177,   211,   111,    29,   257,   723,   672,   226,   344,
     702,   276,   632,   727,   700,   418,   478,   149,   514,   514,
     348,   209,   110,   677,    29,    29,   278,   624,   725,   163,
     407,   295,   209,   238,   164,   615,   380,   367,   159,   239,
     410,   381,   442,   333,   442,    98,   634,   442,   339,   393,
     289,   169,   357,   222,   395,   110,   624,   169,   361,   339,
     449,   367,   584,   585,   624,   165,   166,   729,   340,   169,
       2,   556,   145,   146,   116,   117,   118,   747,   154,   340,
     362,   170,   724,   578,  -171,   678,   679,   745,   579,   728,
      29,   350,    98,   176,   614,   294,   533,   480,   301,    98,
     182,   175,   707,   708,   289,   726,   176,   342,   110,     2,
     566,   238,   363,   225,   372,  -171,  -171,   239,   342,   388,
     622,   534,   623,   533,   238,   737,   567,   477,   514,   150,
     239,   170,   139,   140,   595,   524,   516,   525,   646,   151,
     177,   535,   345,   738,   730,   156,   569,   414,   534,   355,
     164,   175,   156,   220,   748,   170,   156,   435,   405,   212,
       2,   212,   680,   746,   106,   442,   442,   415,   535,   610,
     536,   537,   152,   220,   156,   175,   167,    29,   552,   709,
      98,   165,   166,   163,   169,   289,   478,   383,   164,   419,
     177,   426,   119,   157,   164,   120,   121,   536,   537,   455,
     456,   457,   459,   442,   442,   289,     2,   213,   162,   213,
     116,   117,   118,   366,   177,    98,   220,   341,   231,   165,
     166,     2,   665,    98,    98,   165,   166,   545,   341,   232,
     411,   393,   662,   555,   163,   222,   221,    98,   666,   164,
     222,    29,   289,   238,   169,   176,   538,     2,   122,   221,
     238,    29,   517,   222,   503,   548,   614,   281,   385,   445,
     518,   170,    98,   446,     2,   468,   212,   285,   170,     8,
     165,   166,     8,   471,   472,   549,   289,   212,   106,   141,
     142,   175,   367,   108,   295,   533,   289,   482,   175,   640,
     169,    29,   136,   286,   685,   176,   686,   137,   138,   220,
     160,   220,   429,   688,   238,   300,    98,   302,   220,   167,
     534,   417,   519,   698,   213,   183,   147,   148,   220,   176,
     177,   163,   111,    98,   734,   213,   164,   177,   119,   220,
     535,   120,   121,   303,   736,   382,   220,   249,   163,   220,
     332,   254,     2,   164,   336,   170,    98,   164,   337,   427,
      98,   112,     2,   346,   607,   349,   562,   165,   166,   536,
     537,   164,    29,   370,    98,   175,     2,    29,   379,   637,
     116,   117,   118,   575,   165,   166,    29,    29,   165,   166,
     282,   458,   370,   392,   112,   384,   367,   561,   404,   503,
     503,   408,   165,   166,   169,   403,   589,    98,   261,   262,
     592,   263,   264,   311,   177,   334,   390,   391,   627,   269,
     270,   520,   401,   628,   596,   402,   163,   453,   454,   551,
     464,   164,   178,   465,   568,   176,   163,   110,   469,   474,
     470,   164,   176,   473,   214,   178,   214,   112,   475,   476,
     238,   484,   227,   486,   542,    98,   239,   621,   265,   266,
     267,   268,   165,   166,   543,   654,   655,   657,   122,   558,
     368,   563,   165,   166,   367,  -330,   577,    29,    29,    29,
      29,   587,    29,   588,   367,   597,   590,   591,   593,    29,
     594,   598,   169,   670,   599,   600,    29,   602,   119,   604,
     619,   120,   121,   625,   626,   643,    29,   638,   605,   503,
     620,   658,   673,   674,   645,   633,   282,   282,   650,   176,
     368,   651,  -332,  -331,   663,   652,   671,   689,   683,   661,
     733,   667,    29,   155,   681,  -333,    29,   368,   311,    29,
      29,   682,  -334,   122,   431,   368,   311,    29,   696,   272,
      98,   343,   718,   448,   750,   368,   714,   703,   704,   717,
     705,   706,   343,   311,   311,    29,    29,   311,    29,    29,
      98,    29,    29,   739,   740,    29,   696,   754,   755,   756,
     757,   721,   760,   722,   178,   761,   271,   274,   217,   731,
     732,   273,   275,   387,   694,   573,    29,   642,   368,   521,
     693,   532,   500,   616,     0,   741,     0,   742,   515,   743,
       0,   744,   376,    29,     0,   377,    29,    29,   696,   282,
     710,     0,     0,   378,   368,   368,     0,   758,     0,   759,
       0,   368,     0,    90,   178,     0,    90,     0,     0,     0,
     109,     0,     0,   544,   547,     0,     0,    73,    74,   553,
     368,     0,   311,     0,   368,     0,   368,     0,   178,   368,
       0,     0,     0,   368,     0,   171,     0,     0,     0,   368,
     326,   368,   184,   109,     0,     0,  -345,    81,   171,     0,
       0,  -345,   368,     0,     0,   223,     0,     0,     0,     0,
       0,     0,   311,     0,   311,   311,   311,   311,   123,   124,
     125,   126,   127,   128,   129,   130,   131,   132,     0,     0,
       0,    90,  -345,  -345,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   500,    90,   603,   109,     0,     0,   608,
       0,    90,   169,     0,   431,     0,     0,   500,   500,   109,
       0,     0,     0,     0,     0,   171,     0,     0,     0,     0,
       0,     0,     0,   311,     0,   311,     0,     0,     0,   368,
     368,     0,     0,     0,   178,     0,   112,     0,     0,     0,
       0,   178,     0,     0,     0,     0,     0,     0,     0,     0,
     109,     0,     0,   635,   171,   636,   287,     0,   368,     0,
       0,    90,     0,     0,     0,   171,   368,   368,     0,   223,
       0,   368,     0,   326,     0,     0,   109,     0,     0,     0,
     647,     0,     0,     0,     0,   311,   311,     0,     0,     0,
     326,   326,     0,     0,   326,     0,   133,     0,   500,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     500,     0,     0,     0,     0,    90,   356,   500,   178,     0,
       0,     0,     0,   311,   311,     0,   181,     0,   109,     0,
       0,     0,     0,    90,     0,     0,     0,   394,     0,   181,
       0,   109,     0,     0,     0,     0,   230,     0,     0,     0,
       0,     0,     0,   500,     0,   423,     0,   500,     0,     0,
     500,   432,     0,     0,     0,     0,   368,     0,     0,     0,
       0,     0,   451,   237,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    90,     0,     0,   500,   500,     0,   500,
       0,     0,   500,     0,     0,     0,    90,     0,     0,   416,
      90,     0,    90,     0,     0,     0,   181,    90,   297,   109,
     299,     0,     0,     0,   237,   423,    90,   500,     0,   326,
       0,   326,   326,   326,   326,     0,   109,   109,     0,     0,
     109,   467,     0,     0,   500,     0,     0,   500,     0,     0,
     312,   394,     0,     0,     0,   181,     0,     0,   529,     0,
       0,     0,     0,    90,   483,     0,   181,     0,     0,     0,
     230,   223,   358,     0,     0,   109,   554,     0,     0,   423,
       0,     0,     0,   529,     0,     0,   423,     0,     0,     0,
     326,     0,   326,     0,     0,     0,   570,    90,     0,     0,
       0,     1,   237,     2,     3,     4,     5,    90,     6,     7,
       0,     0,     0,     0,     0,   237,     0,   550,     0,     0,
       0,     0,     0,    90,     0,   109,     0,     0,     8,     0,
      90,     0,     0,     0,     0,     0,     0,     0,   400,     0,
       0,     0,     0,     0,     0,   406,     0,     0,     0,     0,
     576,     0,   326,   326,     0,     0,   425,     0,     0,     0,
       0,   423,   438,   440,     0,   109,     0,   109,   109,   109,
     109,     0,     0,     0,     9,    10,    11,     0,     0,     0,
       0,     0,     0,   312,     0,     0,   529,     0,     0,     0,
     326,   326,     0,     0,     0,     1,     0,     2,     3,     4,
     312,   312,     0,     0,   312,    12,    13,    90,     0,     0,
     109,   109,    14,     0,     0,   529,   425,     0,     0,     0,
       0,    15,     8,   529,   423,    16,   109,    17,   109,     0,
       0,   399,    18,    19,    20,    21,    22,    23,     0,     0,
       0,   237,   400,   528,   601,     0,     0,     0,   234,   399,
       0,     0,     0,     0,     0,   437,   439,     0,     0,   618,
       0,     0,   230,     0,     0,     0,   452,   109,     9,    10,
     425,   297,   557,     0,     0,     0,     0,   425,     0,     0,
     397,   565,     0,     0,     0,     0,     0,     0,   109,   109,
       0,     0,     0,     0,     0,     0,     0,     0,   397,    12,
      13,     0,     0,     0,   397,     0,     0,     0,     0,   399,
       0,   312,     0,     0,     0,    15,     0,     0,     0,    51,
     109,    17,     0,   423,     0,     0,   109,   109,     0,   312,
       0,   312,   312,   312,   312,   399,   527,     0,     0,     0,
       0,     0,   399,     0,     0,     0,     0,     0,     0,   653,
       0,     0,   425,     0,     0,     0,     0,     0,   397,     0,
       0,   664,     0,   399,     0,   527,     0,   399,   618,     0,
     399,     0,     0,     0,   564,     0,     0,     0,     0,     0,
     571,     0,   572,     0,   397,   526,     0,     0,     0,     0,
     312,   397,   312,   580,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   684,     0,     0,     0,   687,     0,
       0,   690,   397,     0,   526,   425,   397,     0,     0,   397,
       0,     0,     0,   526,     0,     0,     0,     0,     0,   397,
       0,   237,     0,     0,     0,     0,     0,   711,   712,     0,
     713,     0,     0,   715,     0,   399,     0,     0,     0,     0,
       0,     0,   312,   312,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   735,     0,
     399,   527,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   749,     0,     0,   751,     0,
     312,   312,     0,     0,   397,     0,     0,     0,     0,   399,
       0,     0,     0,     0,     0,     0,     0,   641,   399,     0,
       0,     0,   644,     0,   425,     0,     0,     0,     0,   397,
     526,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     0,     0,     0,   397,     0,
       0,     0,     0,     0,     0,     0,   397,   397,     0,     0,
       0,   526,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,     0,
     487,   488,   489,   490,   491,   492,   493,   494,   495,   496,
     497,     0,     0,     0,    80,     0,     0,   399,     9,    10,
      11,     0,    81,     0,   498,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    83,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    84,
      85,     0,     0,     0,    86,    15,   397,     0,     0,    16,
       0,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   499,   370,  -382,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,     0,   487,   488,   489,
     490,   491,   492,   493,   494,   495,   496,   497,     0,     0,
       0,    80,     0,     0,     0,     9,    10,    11,     0,    81,
       0,   498,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    84,    85,     0,     0,
       0,    86,    15,     0,     0,     0,    16,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     1,
       0,     2,     3,     4,     5,     0,     6,     7,   499,   370,
    -381,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,   487,   488,   489,   490,   491,   492,
     493,   494,   495,   496,   497,     0,     0,     0,    80,     0,
       0,     0,     9,    10,    11,     0,    81,     0,   498,     0,
       0,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   499,   370,  -383,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     9,
      10,    11,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    83,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      84,    85,     0,     0,     0,    86,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   233,   234,   235,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     9,    10,    11,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    83,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    84,    85,     0,
       0,     0,    86,    15,     0,     0,     0,    16,     0,    17,
       0,     0,     0,     0,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   233,
     234,   279,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     9,    10,    11,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    83,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    84,    85,     0,     0,     0,    86,
      15,     0,     0,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   233,   234,   364,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       9,    10,    11,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
       0,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,    84,    85,     0,     0,     0,    86,    15,     0,     0,
       0,    16,     0,    17,     0,     0,     0,     0,    18,    19,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   375,   234,  -437,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     9,    10,    11,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,    16,     1,
      17,     2,     3,     4,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     233,   234,   639,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   310,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     1,
      17,     2,     3,     4,     0,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   441,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   460,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     1,
      17,     2,     3,     4,     0,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   462,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   581,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     1,
      17,     2,     3,     4,     0,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   582,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   583,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     1,
      17,     2,     3,     4,     0,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   586,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   648,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     1,
      17,     2,     3,     4,     0,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   649,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,    15,
       0,     0,     0,   307,     1,    17,     2,     3,     4,     0,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,   668,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,    80,   305,     0,     0,     9,    10,     0,
     163,    81,     0,     0,   306,   164,     8,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,    15,     0,     0,     0,   307,     0,
      17,     0,     9,    10,    11,     0,   169,     0,     0,   308,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     309,     0,   669,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,     0,    15,
       0,     0,     0,    16,     0,    17,     0,     0,     0,     0,
      18,    19,    20,    21,    22,    23,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,   695,   752,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
       0,   487,   488,   489,   490,   491,   492,   493,   494,   495,
     496,   497,     0,     0,     0,    80,     0,     0,     0,     9,
      10,    11,     0,    81,     0,   498,     0,     0,     0,     0,
       0,     0,     0,    82,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    83,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      84,    85,     0,     0,     0,    86,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   499,   370,     0,     0,     0,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   487,   488,
     489,   490,   491,   492,   493,   494,   495,   496,   497,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    12,    13,     0,
       0,     8,     0,     0,    14,     0,     0,     0,     0,     0,
       0,     0,     0,    15,    12,    13,     0,    16,     0,    17,
       0,    14,     0,     0,    18,    19,    20,    21,    22,    23,
      15,     0,     0,     0,    16,   250,    17,     0,     0,   499,
     370,    18,    19,    20,    21,    22,    23,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,   234,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,     0,    16,     1,
      17,     2,     3,     4,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   695,     0,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,    80,   305,
       0,     0,     9,    10,     0,   163,    81,     0,     0,   306,
     164,     8,     0,     0,     0,     0,    82,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,    83,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     8,     0,     0,    86,    15,
       0,     0,     0,   307,     0,    17,     0,     9,    10,    11,
       0,   169,     0,     0,   308,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   309,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,     0,     0,    16,   659,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     8,    12,    13,     0,     0,     0,     0,     0,    14,
     499,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,     0,    16,   691,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   499,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     2,     0,    16,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     606,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,   412,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
     163,    81,     0,     0,     0,   164,     0,     0,     0,     0,
       0,    82,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    83,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   165,   166,    84,    85,
       0,     0,     0,    86,     0,     0,     0,     2,   221,     0,
       0,     0,   222,     0,     0,     0,   169,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   546,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,   163,    81,     0,     0,     0,   164,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    83,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   165,   166,    84,
      85,     0,     0,     0,    86,     0,     0,     2,     0,   428,
       0,     0,     0,     0,     0,     0,     0,   169,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   429,
       0,   430,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,   163,    81,     0,     0,     0,   164,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    83,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   165,   166,    84,
      85,     0,     0,     1,    86,     2,     3,     4,     5,   367,
       6,     7,     0,     0,     0,     0,     0,   169,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,   611,     0,     0,     0,     0,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     9,    10,    11,   163,
      81,     0,     0,     0,   164,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    83,     0,    12,    13,     0,
       0,     0,     0,     0,    14,   165,   166,    84,    85,     0,
       0,     0,     0,    15,     0,     0,     0,   421,   104,    17,
       0,     0,     0,     0,    18,   422,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     9,    10,    11,     1,    81,     2,     3,
       4,     5,     0,     6,     7,     0,     0,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    83,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    84,    85,     0,     0,     0,     0,
      15,     0,     0,     0,    16,   104,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     9,
      10,    11,   163,     0,     0,     0,     0,   164,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     8,     0,    14,   165,   166,
       0,     0,     0,     0,     0,     0,    15,     0,     0,     0,
     421,   104,    17,     0,     0,     0,     0,    18,   422,    20,
      21,    22,    23,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     8,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
      15,     0,    12,    13,    16,   104,    17,     0,     0,    14,
       0,    18,    19,    20,    21,    22,    23,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,   354,     0,    18,
      19,    20,    21,    22,    23,     9,    10,    11,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    12,    13,     0,     0,
       0,     0,     1,    14,     2,     3,     4,     5,     0,     6,
       7,     0,    15,     0,     0,     0,    16,     0,    17,     0,
       0,   481,     0,    18,    19,    20,    21,    22,    23,     8,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     9,    10,    11,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,   574,     0,    18,
      19,    20,    21,    22,    23,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,     0,     9,    10,    11,
       0,     0,    15,     0,     0,     0,    16,   656,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,     0,     0,    16,   716,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     8,    12,    13,     0,     0,     0,     0,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     8,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    12,    13,
       0,     9,    10,    11,     0,    14,     0,     0,     0,     0,
       0,     0,     0,     0,    15,     0,     0,     0,    49,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     9,    10,    11,     0,     0,    15,     0,
       0,     0,    51,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     2,     0,     0,     0,     0,     0,     0,     0,
      15,     0,     0,     0,   102,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,   163,    81,     0,     0,
       0,   164,     0,     0,     0,     0,     0,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    83,     0,     0,     0,     0,     0,     2,     0,
       0,     0,   165,   166,    84,    85,     0,     0,     0,    86,
       0,     0,     0,     0,   393,   351,     0,     0,   222,     0,
       0,     0,   169,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,   163,    81,     0,     0,     0,   164,     0,     0,
       0,     0,     0,    82,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    83,     0,
       0,     0,     0,     0,     2,     0,     0,     0,   165,   166,
      84,    85,     0,     0,     0,    86,     0,     0,     0,     0,
     393,     0,     0,     0,   222,     0,     0,     0,   169,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,   163,    81,
       0,     0,     0,   164,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       2,     0,     0,     0,   165,   166,    84,    85,     0,     0,
       0,    86,     0,     0,     0,     0,   367,     0,     0,     0,
       0,     0,     0,     0,   169,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      83,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    84,    85,     0,     0,     0,    86,     0,     0,
       0,     0,     0,   447,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,   163,    81,     0,     0,     0,   164,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   165,
     166,    84,    85,     0,     0,     0,    86,     0,     0,     0,
       0,   221,   351,     0,     0,   222,     0,     0,     0,   169,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,   163,
      81,     0,     0,     0,   164,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    83,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   165,   166,    84,    85,     0,
       0,     0,    86,     0,     0,     0,     0,   167,     0,     0,
       0,   168,     0,     0,     0,   169,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,   163,    81,     0,     0,     0,
     164,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   165,   166,    84,    85,     0,     0,     0,    86,     0,
       0,     0,     0,   167,     0,     0,     0,   215,     0,     0,
       0,   169,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,   163,    81,     0,     0,     0,   164,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    83,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   165,   166,    84,
      85,     0,     0,     0,    86,     0,     0,     0,     0,   167,
     288,     0,     0,     0,     0,     0,     0,   169,     8,    54,
      55,    56,    57,    58,   186,   187,   188,   189,   190,   191,
     192,   193,   194,   195,   196,   197,   198,   199,    73,    74,
     200,   201,    77,    78,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     202,     0,     0,     0,     0,     0,     0,   163,    81,     0,
       0,     0,   164,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   203,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   165,   166,   204,   205,     0,     0,     0,
      86,     0,     0,     0,     0,   167,     0,     0,     0,   338,
       0,     0,     0,   169,     8,    54,    55,    56,    57,    58,
     186,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,   197,   198,   199,    73,    74,   200,   201,    77,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   202,     0,     0,     0,
       0,     0,     0,   163,    81,     0,     0,     0,   164,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   203,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   165,
     166,   204,   205,     0,     0,     0,    86,     0,     0,     0,
       0,   167,     0,     0,     8,   347,     0,     0,     0,   169,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,   163,    81,     0,     0,     0,   164,     0,
       0,     0,     0,     0,    82,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    83,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   165,
     166,    84,    85,     0,     0,     0,     0,     0,     0,     0,
       0,   221,     0,     0,     0,   222,     0,     0,     0,   169,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      82,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    83,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    84,    85,     0,
       0,     0,    86,     0,     0,     0,     0,     0,   409,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    84,    85,     0,     0,
       0,    86,     0,     0,     0,     0,     0,   479,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    82,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    83,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    84,    85,     0,     0,     0,
      86,     0,     0,     0,     0,   559,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,   531,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    83,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    84,    85,     0,     0,     0,    86,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    83,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    84,    85,     0,     0,
       0,    86,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,   412,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    83,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    84,
      85,     0,     0,     0,    86,     8,    54,    55,    56,    57,
      58,   186,   187,   188,   189,   190,   191,   192,   193,   194,
     195,   196,   197,   198,   199,    73,    74,   200,   201,    77,
      78,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   202,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     203,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   204,   205,     0,     0,     0,    86
};

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-640)))

#define yytable_value_is_error(Yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
       0,     0,   107,    16,   119,     5,     6,     7,    16,    30,
     289,   223,   156,   371,    14,   174,    16,    10,   230,   134,
      13,   239,     9,     3,    79,    12,   315,    17,     3,   400,
     371,     3,   171,   100,   313,   167,    49,   305,    51,    94,
     155,    49,   181,   366,    99,     3,   101,    16,    28,    49,
     541,    51,    49,    28,   425,   602,   695,     3,     3,    87,
     332,   333,   131,    72,   336,    72,    73,   438,    73,     3,
      13,    99,   100,   101,    12,    13,    72,    73,   147,    87,
      49,    17,   125,    28,     5,     3,   129,   131,   306,   102,
     234,    99,   100,   101,   102,   313,    48,    49,   737,   107,
     167,   148,   102,   147,   427,   102,   131,   126,   121,   131,
      28,   145,   131,   660,   148,   136,   137,   138,    87,   119,
     119,   121,   115,   282,   149,   147,    78,   149,   115,   184,
      99,   100,   101,   102,   134,   134,    73,   628,   107,   206,
     149,   154,   149,    73,   149,   413,   358,   132,   506,   507,
     217,   206,    16,   149,   154,   155,   155,   528,    72,    77,
     299,   169,   217,   156,    82,   506,   126,   125,   148,   156,
     302,   131,   461,   148,   463,   168,   148,   466,   206,   125,
     167,   133,   394,   129,   289,    49,   557,   133,   400,   217,
     322,   125,   464,   465,   565,   113,   114,    72,   206,   133,
       3,   419,   140,   141,     7,     8,     9,    72,   144,   217,
     231,   239,   149,   126,    82,    72,    73,    73,   131,   149,
     220,   220,   215,    87,   503,   168,     3,   359,   387,   222,
     148,   239,    72,    73,   221,   149,   100,   206,   102,     3,
     131,   234,   232,   107,   242,   113,   114,   234,   217,   131,
     522,    28,   524,     3,   247,   131,   147,   130,   616,   142,
     247,   289,   134,   135,   130,   147,   381,   149,   130,   143,
     239,    48,   215,   149,   149,   148,   435,   305,    28,   222,
      82,   289,   148,   131,   149,   313,   148,   566,   296,    99,
       3,   101,   149,   149,   307,   584,   585,   305,    48,   147,
      77,    78,    16,   131,   148,   313,   125,   307,   413,   149,
     303,   113,   114,    77,   133,   302,   528,   145,    82,   306,
     289,   308,   125,     0,    82,   128,   129,    77,    78,   327,
     328,   329,   330,   622,   623,   322,     3,    99,   125,   101,
       7,     8,     9,   146,   313,   338,   131,   206,   126,   113,
     114,     3,   131,   346,   347,   113,   114,   412,   217,   128,
     303,   125,   147,   418,    77,   129,   125,   360,   147,    82,
     129,   371,   359,   366,   133,   239,   126,     3,    27,   125,
     373,   381,   381,   129,   371,   413,   665,   126,   146,   125,
     383,   419,   385,   129,     3,   338,   206,   148,   426,    28,
     113,   114,    28,   346,   347,   413,   393,   217,   421,    10,
      11,   419,   125,   421,   422,     3,   403,   360,   426,   563,
     133,   421,   133,   148,   126,   289,   126,   138,   139,   131,
      79,   131,   145,   126,   427,   125,   429,   125,   131,   125,
      28,   305,   385,   126,   206,    94,    14,    15,   131,   313,
     419,    77,   421,   446,   126,   217,    82,   426,   125,   131,
      48,   128,   129,   129,   126,   130,   131,   116,    77,   131,
     148,   120,     3,    82,   148,   503,   469,    82,   125,   146,
     473,    16,     3,   129,   497,   126,   429,   113,   114,    77,
      78,    82,   492,   148,   487,   503,     3,   497,   149,   554,
       7,     8,     9,   446,   113,   114,   506,   507,   113,   114,
     159,   147,   148,   126,    49,   149,   125,   126,   130,   506,
     507,   125,   113,   114,   133,   131,   469,   520,   139,   140,
     473,   141,   142,   182,   503,   184,   285,   286,   126,   147,
     148,   146,   126,   131,   487,   126,    77,   147,   147,   413,
     148,    82,    87,   148,   145,   419,    77,   421,   129,   126,
     130,    82,   426,   129,    99,   100,   101,   102,   126,   130,
     563,   149,   107,   149,   126,   568,   563,   520,   143,   144,
     145,   146,   113,   114,   130,   598,   599,   600,   237,   126,
     239,   148,   113,   114,   125,   148,   126,   597,   598,   599,
     600,   126,   602,   130,   125,   145,   130,   130,   126,   609,
     130,   125,   133,   626,   125,   125,   616,   125,   125,   147,
     149,   128,   129,   126,   125,   568,   626,   126,   147,   616,
     147,    60,   630,   631,   130,   148,   285,   286,   130,   503,
     289,   130,   148,   148,   146,   145,   126,   125,   145,   147,
      68,   146,   652,    42,   148,   148,   656,   306,   307,   659,
     660,   149,   148,   312,   313,   314,   315,   667,   667,   150,
     663,   206,   147,   322,   147,   324,   689,   675,   676,   692,
     678,   679,   217,   332,   333,   685,   686,   336,   688,   689,
     683,   691,   692,   149,   149,   695,   695,   149,   149,   149,
     149,   699,   149,   701,   239,   149,   149,   152,   101,   707,
     708,   151,   153,   282,   665,   443,   716,   566,   367,   388,
     663,   403,   371,   506,    -1,   723,    -1,   725,   373,   727,
      -1,   729,   247,   733,    -1,   247,   736,   737,   737,   388,
     683,    -1,    -1,   247,   393,   394,    -1,   745,    -1,   747,
      -1,   400,    -1,     9,   289,    -1,    12,    -1,    -1,    -1,
      16,    -1,    -1,   412,   413,    -1,    -1,    48,    49,   418,
     419,    -1,   421,    -1,   423,    -1,   425,    -1,   313,   428,
      -1,    -1,    -1,   432,    -1,    87,    -1,    -1,    -1,   438,
     182,   440,    94,    49,    -1,    -1,    77,    78,   100,    -1,
      -1,    82,   451,    -1,    -1,   107,    -1,    -1,    -1,    -1,
      -1,    -1,   461,    -1,   463,   464,   465,   466,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    -1,    -1,
      -1,    87,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   492,   100,   494,   102,    -1,    -1,   498,
      -1,   107,   133,    -1,   503,    -1,    -1,   506,   507,   115,
      -1,    -1,    -1,    -1,    -1,   167,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   522,    -1,   524,    -1,    -1,    -1,   528,
     529,    -1,    -1,    -1,   419,    -1,   421,    -1,    -1,    -1,
      -1,   426,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     156,    -1,    -1,   552,   206,   554,   162,    -1,   557,    -1,
      -1,   167,    -1,    -1,    -1,   217,   565,   566,    -1,   221,
      -1,   570,    -1,   315,    -1,    -1,   182,    -1,    -1,    -1,
     579,    -1,    -1,    -1,    -1,   584,   585,    -1,    -1,    -1,
     332,   333,    -1,    -1,   336,    -1,   146,    -1,   597,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     609,    -1,    -1,    -1,    -1,   221,   222,   616,   503,    -1,
      -1,    -1,    -1,   622,   623,    -1,    87,    -1,   234,    -1,
      -1,    -1,    -1,   239,    -1,    -1,    -1,   289,    -1,   100,
      -1,   247,    -1,    -1,    -1,    -1,   107,    -1,    -1,    -1,
      -1,    -1,    -1,   652,    -1,   307,    -1,   656,    -1,    -1,
     659,   313,    -1,    -1,    -1,    -1,   665,    -1,    -1,    -1,
      -1,    -1,   324,   115,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   289,    -1,    -1,   685,   686,    -1,   688,
      -1,    -1,   691,    -1,    -1,    -1,   302,    -1,    -1,   305,
     306,    -1,   308,    -1,    -1,    -1,   167,   313,   169,   315,
     171,    -1,    -1,    -1,   156,   367,   322,   716,    -1,   461,
      -1,   463,   464,   465,   466,    -1,   332,   333,    -1,    -1,
     336,   337,    -1,    -1,   733,    -1,    -1,   736,    -1,    -1,
     182,   393,    -1,    -1,    -1,   206,    -1,    -1,   400,    -1,
      -1,    -1,    -1,   359,   360,    -1,   217,    -1,    -1,    -1,
     221,   413,   223,    -1,    -1,   371,   418,    -1,    -1,   421,
      -1,    -1,    -1,   425,    -1,    -1,   428,    -1,    -1,    -1,
     522,    -1,   524,    -1,    -1,    -1,   438,   393,    -1,    -1,
      -1,     1,   234,     3,     4,     5,     6,   403,     8,     9,
      -1,    -1,    -1,    -1,    -1,   247,    -1,   413,    -1,    -1,
      -1,    -1,    -1,   419,    -1,   421,    -1,    -1,    28,    -1,
     426,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   289,    -1,
      -1,    -1,    -1,    -1,    -1,   296,    -1,    -1,    -1,    -1,
     446,    -1,   584,   585,    -1,    -1,   307,    -1,    -1,    -1,
      -1,   503,   313,   314,    -1,   461,    -1,   463,   464,   465,
     466,    -1,    -1,    -1,    74,    75,    76,    -1,    -1,    -1,
      -1,    -1,    -1,   315,    -1,    -1,   528,    -1,    -1,    -1,
     622,   623,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
     332,   333,    -1,    -1,   336,   105,   106,   503,    -1,    -1,
     506,   507,   112,    -1,    -1,   557,   367,    -1,    -1,    -1,
      -1,   121,    28,   565,   566,   125,   522,   127,   524,    -1,
      -1,   289,   132,   133,   134,   135,   136,   137,    -1,    -1,
      -1,   373,   393,   394,   492,    -1,    -1,    -1,   148,   307,
      -1,    -1,    -1,    -1,    -1,   313,   314,    -1,    -1,   507,
      -1,    -1,   413,    -1,    -1,    -1,   324,   563,    74,    75,
     421,   422,   423,    -1,    -1,    -1,    -1,   428,    -1,    -1,
     289,   432,    -1,    -1,    -1,    -1,    -1,    -1,   584,   585,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   307,   105,
     106,    -1,    -1,    -1,   313,    -1,    -1,    -1,    -1,   367,
      -1,   443,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,
     616,   127,    -1,   665,    -1,    -1,   622,   623,    -1,   461,
      -1,   463,   464,   465,   466,   393,   394,    -1,    -1,    -1,
      -1,    -1,   400,    -1,    -1,    -1,    -1,    -1,    -1,   597,
      -1,    -1,   503,    -1,    -1,    -1,    -1,    -1,   367,    -1,
      -1,   609,    -1,   421,    -1,   423,    -1,   425,   616,    -1,
     428,    -1,    -1,    -1,   432,    -1,    -1,    -1,    -1,    -1,
     438,    -1,   440,    -1,   393,   394,    -1,    -1,    -1,    -1,
     522,   400,   524,   451,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   652,    -1,    -1,    -1,   656,    -1,
      -1,   659,   421,    -1,   423,   566,   425,    -1,    -1,   428,
      -1,    -1,    -1,   432,    -1,    -1,    -1,    -1,    -1,   438,
      -1,   563,    -1,    -1,    -1,    -1,    -1,   685,   686,    -1,
     688,    -1,    -1,   691,    -1,   503,    -1,    -1,    -1,    -1,
      -1,    -1,   584,   585,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   716,    -1,
     528,   529,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   733,    -1,    -1,   736,    -1,
     622,   623,    -1,    -1,   503,    -1,    -1,    -1,    -1,   557,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   565,   566,    -1,
      -1,    -1,   570,    -1,   665,    -1,    -1,    -1,    -1,   528,
     529,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,   557,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   565,   566,    -1,    -1,
      -1,   570,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    -1,    -1,    -1,    70,    -1,    -1,   665,    74,    75,
      76,    -1,    78,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,
     106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,   115,
     116,    -1,    -1,    -1,   120,   121,   665,    -1,    -1,   125,
      -1,   127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,
     136,   137,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   147,   148,   149,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,    -1,
      -1,    -1,    -1,   112,    -1,    -1,   115,   116,    -1,    -1,
      -1,   120,   121,    -1,    -1,    -1,   125,    -1,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,   136,   137,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   147,   148,
     149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    74,    75,    76,    -1,    78,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
     112,    -1,    -1,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,    -1,   127,    -1,    -1,    -1,    -1,
     132,   133,   134,   135,   136,   137,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   147,   148,   149,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    74,
      75,    76,    -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,
     115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,
     125,    -1,   127,    -1,    -1,    -1,    -1,   132,   133,   134,
     135,   136,   137,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   147,   148,   149,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    74,    75,    76,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,
      -1,    -1,    -1,    -1,   112,    -1,    -1,   115,   116,    -1,
      -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,   137,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   147,
     148,   149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    74,    75,    76,    -1,    78,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,    -1,    -1,   115,   116,    -1,    -1,    -1,   120,
     121,    -1,    -1,    -1,   125,    -1,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,   136,   137,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   147,   148,   149,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      74,    75,    76,    -1,    78,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,
      -1,   115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,
      -1,   125,    -1,   127,    -1,    -1,    -1,    -1,   132,   133,
     134,   135,   136,   137,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   147,   148,   149,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    -1,    -1,    -1,    74,    75,    76,
      -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,   132,   133,   134,   135,   136,
     137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,   148,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,     1,   127,     3,     4,     5,    -1,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,   149,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    70,    71,    -1,    -1,    74,    75,    -1,
      77,    78,    -1,    -1,    81,    82,    28,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,   121,    -1,    -1,    -1,   125,    -1,
     127,    -1,    74,    75,    76,    -1,   133,    -1,    -1,   136,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    -1,   149,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
     112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,   127,    -1,    -1,    -1,    -1,
     132,   133,   134,   135,   136,   137,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,   148,   149,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    -1,    -1,    -1,    70,    -1,    -1,    -1,    74,
      75,    76,    -1,    78,    -1,    80,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
     105,   106,    -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,
     115,   116,    -1,    -1,    -1,   120,   121,    -1,    -1,    -1,
     125,    -1,   127,    -1,    -1,    -1,    -1,   132,   133,   134,
     135,   136,   137,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   147,   148,    -1,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    74,    75,    76,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,    -1,
      -1,    28,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,   105,   106,    -1,   125,    -1,   127,
      -1,   112,    -1,    -1,   132,   133,   134,   135,   136,   137,
     121,    -1,    -1,    -1,   125,   126,   127,    -1,    -1,   147,
     148,   132,   133,   134,   135,   136,   137,    74,    75,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   148,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,     1,
     127,     3,     4,     5,    -1,   132,   133,   134,   135,   136,
     137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   148,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    70,    71,
      -1,    -1,    74,    75,    -1,    77,    78,    -1,    -1,    81,
      82,    28,    -1,    -1,    -1,    -1,    88,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,   103,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    28,    -1,    -1,   120,   121,
      -1,    -1,    -1,   125,    -1,   127,    -1,    74,    75,    76,
      -1,   133,    -1,    -1,   136,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   147,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      -1,    74,    75,    76,     1,   112,     3,     4,     5,     6,
      -1,     8,     9,    -1,   121,    -1,    -1,    -1,   125,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,
     137,    28,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,
     147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,   126,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   147,    -1,    -1,    74,    75,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      -1,    -1,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,     3,    -1,   125,    -1,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,
     137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     147,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    54,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,
      77,    78,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,
      -1,    -1,    -1,   120,    -1,    -1,    -1,     3,   125,    -1,
      -1,    -1,   129,    -1,    -1,    -1,   133,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   148,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,     3,    -1,   125,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,
      -1,   147,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,     1,   120,     3,     4,     5,     6,   125,
       8,     9,    -1,    -1,    -1,    -1,    -1,   133,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,   147,    -1,    -1,    -1,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    74,    75,    76,    77,
      78,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,   105,   106,    -1,
      -1,    -1,    -1,    -1,   112,   113,   114,   115,   116,    -1,
      -1,    -1,    -1,   121,    -1,    -1,    -1,   125,   126,   127,
      -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,   137,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    74,    75,    76,     1,    78,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    28,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,    -1,    -1,   115,   116,    -1,    -1,    -1,    -1,
     121,    -1,    -1,    -1,   125,   126,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,   136,   137,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    74,
      75,    76,    77,    -1,    -1,    -1,    -1,    82,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     105,   106,    -1,    -1,    -1,    28,    -1,   112,   113,   114,
      -1,    -1,    -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,
     125,   126,   127,    -1,    -1,    -1,    -1,   132,   133,   134,
     135,   136,   137,    74,    75,    76,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    74,    75,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   105,   106,    -1,    -1,    -1,    28,
      -1,   112,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,    -1,   105,   106,   125,   126,   127,    -1,    -1,   112,
      -1,   132,   133,   134,   135,   136,   137,    -1,   121,    -1,
      -1,    -1,   125,    -1,   127,    -1,    -1,   130,    -1,   132,
     133,   134,   135,   136,   137,    74,    75,    76,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,   105,   106,    -1,    -1,
      -1,    -1,     1,   112,     3,     4,     5,     6,    -1,     8,
       9,    -1,   121,    -1,    -1,    -1,   125,    -1,   127,    -1,
      -1,   130,    -1,   132,   133,   134,   135,   136,   137,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    76,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   105,   106,    -1,    74,    75,    76,     1,   112,
       3,     4,     5,     6,    -1,     8,     9,    -1,   121,    -1,
      -1,    -1,   125,    -1,   127,    -1,    -1,   130,    -1,   132,
     133,   134,   135,   136,   137,    28,   105,   106,    -1,    -1,
      -1,    -1,    -1,   112,    -1,    -1,    -1,    74,    75,    76,
      -1,    -1,   121,    -1,    -1,    -1,   125,   126,   127,    -1,
      -1,    -1,    -1,   132,   133,   134,   135,   136,   137,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   105,   106,
      -1,    74,    75,    76,     1,   112,     3,     4,     5,     6,
      -1,     8,     9,    -1,   121,    -1,    -1,    -1,   125,   126,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,
     137,    28,   105,   106,    -1,    -1,    -1,    -1,     1,   112,
       3,     4,     5,     6,    -1,     8,     9,    -1,   121,    -1,
      -1,    -1,   125,    -1,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,   136,   137,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    76,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   105,   106,
      -1,    74,    75,    76,    -1,   112,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    -1,
     127,    -1,    -1,    -1,    -1,   132,   133,   134,   135,   136,
     137,    -1,   105,   106,    -1,    -1,    -1,    -1,    -1,   112,
      -1,    -1,    -1,    74,    75,    76,    -1,    -1,   121,    -1,
      -1,    -1,   125,    -1,   127,    -1,    -1,    -1,    -1,   132,
     133,   134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   105,   106,    -1,    -1,    -1,    -1,
      -1,   112,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     121,    -1,    -1,    -1,   125,    -1,   127,    -1,    -1,    -1,
      -1,   132,   133,   134,   135,   136,   137,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,
      -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,
      -1,    82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,
      -1,    -1,    -1,    -1,   125,   126,    -1,    -1,   129,    -1,
      -1,    -1,   133,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,
      -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,
      -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   113,   114,
     115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,
     125,    -1,    -1,    -1,   129,    -1,    -1,    -1,   133,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,
      -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,
      -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   133,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    78,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,
      -1,    -1,    -1,   126,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,   126,    -1,    -1,   129,    -1,    -1,    -1,   133,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    77,
      78,    -1,    -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,   115,   116,    -1,
      -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    -1,    -1,
      -1,   129,    -1,    -1,    -1,   133,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    77,    78,    -1,    -1,    -1,
      82,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   113,   114,   115,   116,    -1,    -1,    -1,   120,    -1,
      -1,    -1,    -1,   125,    -1,    -1,    -1,   129,    -1,    -1,
      -1,   133,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    77,    78,    -1,    -1,    -1,    82,    -1,    -1,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,   115,
     116,    -1,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,
     126,    -1,    -1,    -1,    -1,    -1,    -1,   133,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    -1,    -1,    -1,    -1,    -1,    -1,    77,    78,    -1,
      -1,    -1,    82,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   113,   114,   115,   116,    -1,    -1,    -1,
     120,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,   129,
      -1,    -1,    -1,   133,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,   120,    -1,    -1,    -1,
      -1,   125,    -1,    -1,    28,   129,    -1,    -1,    -1,   133,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,
      -1,    -1,    -1,    77,    78,    -1,    -1,    -1,    82,    -1,
      -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
     114,   115,   116,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   125,    -1,    -1,    -1,   129,    -1,    -1,    -1,   133,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,   116,    -1,
      -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,   126,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    78,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   115,   116,    -1,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,   126,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      70,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    78,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   115,   116,    -1,    -1,    -1,
     120,    -1,    -1,    -1,    -1,   125,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    78,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   115,   116,    -1,    -1,    -1,   120,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    70,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    78,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   115,   116,    -1,    -1,
      -1,   120,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    70,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   115,
     116,    -1,    -1,    -1,   120,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    54,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    78,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   115,   116,    -1,    -1,    -1,   120
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    74,
      75,    76,   105,   106,   112,   121,   125,   127,   132,   133,
     134,   135,   136,   137,   151,   152,   153,   155,   157,   158,
     159,   160,   161,   162,   163,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   192,   193,   241,   243,   257,   125,
     158,   125,   158,   158,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      70,    78,    88,   103,   115,   116,   120,   178,   183,   191,
     192,   194,   196,   197,   198,   206,   207,   158,   171,   175,
     178,   175,   125,   158,   126,   172,   174,   177,   191,   192,
     194,   196,   207,   226,   241,   148,     7,     8,     9,   125,
     128,   129,   151,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,   146,   173,   160,   133,   138,   139,   134,
     135,    10,    11,    12,    13,   140,   141,    14,    15,   132,
     142,   143,    16,    17,   144,   173,   148,     0,   226,   148,
     151,   193,   125,    77,    82,   113,   114,   125,   129,   133,
     183,   184,   185,   189,   190,   191,   194,   196,   207,   211,
     213,   221,   148,   151,   184,   193,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      50,    51,    70,   103,   115,   116,   180,   183,   191,   193,
     195,   196,   197,   206,   207,   129,   213,   180,   226,   126,
     131,   125,   129,   184,   191,   194,   196,   207,   210,   212,
     221,   126,   128,   147,   148,   149,   154,   155,   171,   178,
     228,   244,   250,   251,   252,   253,   254,   255,   256,   151,
     126,   154,   156,   172,   151,   174,   154,   172,   160,   160,
     160,   161,   161,   162,   162,   163,   163,   163,   163,   164,
     164,   165,   166,   167,   168,   169,   174,   154,   172,   149,
     256,   126,   151,   208,   209,   148,   148,   192,   126,   178,
     213,   222,   223,   224,   175,   191,   220,   221,   211,   221,
     125,   189,   125,   129,   211,    71,    81,   125,   136,   147,
     149,   151,   155,   178,   184,   199,   200,   201,   202,   203,
     215,   216,   218,   219,   221,   242,   243,   245,   246,   247,
     248,   249,   148,   148,   151,   193,   148,   125,   129,   183,
     191,   195,   196,   207,   213,   175,   129,   129,   213,   126,
     172,   126,   212,   222,   130,   175,   192,   210,   221,   125,
     129,   210,   160,   241,   149,   256,   146,   125,   151,   216,
     148,   235,   236,   131,   147,   147,   251,   253,   254,   149,
     126,   131,   130,   145,   149,   146,   189,   190,   131,   149,
     208,   208,   126,   125,   184,   212,   214,   215,   217,   219,
     221,   126,   126,   131,   130,   191,   221,   211,   125,   126,
     222,   175,    54,   179,   183,   191,   192,   194,   198,   178,
     216,   125,   133,   184,   214,   221,   178,   146,   125,   145,
     147,   151,   184,   204,   205,   214,   216,   219,   221,   219,
     221,   149,   203,   131,   147,   125,   129,   126,   151,   222,
     225,   184,   219,   147,   147,   236,   236,   236,   147,   236,
     149,   199,   149,   199,   148,   148,   199,   192,   175,   129,
     130,   175,   175,   129,   126,   126,   130,   130,   210,   126,
     222,   130,   175,   192,   149,   228,   149,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    80,   147,
     151,   174,   176,   178,   230,   231,   232,   233,   234,   236,
     237,   238,   239,   240,   242,   252,   154,   172,   171,   175,
     146,   209,   147,   149,   147,   149,   215,   219,   221,   184,
     217,    55,   224,     3,    28,    48,    77,    78,   126,   186,
     187,   188,   126,   130,   151,   193,   148,   151,   183,   191,
     192,   194,   212,   151,   184,   193,   216,   221,   126,   125,
     228,   126,   175,   148,   219,   221,   131,   147,   145,   189,
     184,   219,   219,   200,   130,   175,   192,   126,   126,   131,
     219,   149,   149,   149,   199,   199,   149,   126,   130,   175,
     130,   130,   175,   126,   130,   130,   175,   145,   125,   125,
     125,   230,   125,   151,   147,   147,   147,   174,   151,   145,
     147,   147,   181,   182,   214,   176,   233,   176,   230,   149,
     147,   175,   199,   199,   217,   126,   125,   126,   131,   187,
      72,    73,   149,   148,   148,   151,   151,   193,   126,   149,
     256,   219,   205,   175,   219,   130,   130,   151,   149,   149,
     130,   130,   145,   230,   174,   174,   126,   174,    60,   126,
     237,   147,   147,   146,   230,   131,   147,   146,   149,   149,
     174,   126,   187,   236,   236,    72,    73,   149,    72,    73,
     149,   148,   149,   145,   230,   126,   126,   230,   126,   125,
     230,   126,   237,   175,   182,   148,   172,   227,   126,    73,
     149,    72,   149,   236,   236,   236,   236,    72,    73,   149,
     175,   230,   230,   230,   174,   230,   126,   174,   147,   227,
     229,   236,   236,    73,   149,    72,   149,    73,   149,    72,
     149,   236,   236,    68,   126,   230,   126,   131,   149,   149,
     149,   236,   236,   236,   236,    73,   149,    72,   149,   230,
     147,   230,   149,   227,   149,   149,   149,   149,   236,   236,
     149,   149
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
      case 151: /* identifier */
/* Line 1393 of yacc.c  */
#line 161 "expression.y"
        { FreeIdentifier(((*yyvaluep).id)); };
/* Line 1393 of yacc.c  */
#line 3560 "expression.ec"
        break;
      case 152: /* primary_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3567 "expression.ec"
        break;
      case 155: /* postfix_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3574 "expression.ec"
        break;
      case 156: /* argument_expression_list */
/* Line 1393 of yacc.c  */
#line 196 "expression.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 3581 "expression.ec"
        break;
      case 158: /* unary_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3588 "expression.ec"
        break;
      case 160: /* cast_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3595 "expression.ec"
        break;
      case 161: /* multiplicative_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3602 "expression.ec"
        break;
      case 162: /* additive_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3609 "expression.ec"
        break;
      case 163: /* shift_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3616 "expression.ec"
        break;
      case 164: /* relational_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3623 "expression.ec"
        break;
      case 165: /* equality_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3630 "expression.ec"
        break;
      case 166: /* and_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3637 "expression.ec"
        break;
      case 167: /* exclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3644 "expression.ec"
        break;
      case 168: /* inclusive_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3651 "expression.ec"
        break;
      case 169: /* logical_and_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3658 "expression.ec"
        break;
      case 170: /* logical_or_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3665 "expression.ec"
        break;
      case 171: /* conditional_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3672 "expression.ec"
        break;
      case 172: /* assignment_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3679 "expression.ec"
        break;
      case 174: /* expression */
/* Line 1393 of yacc.c  */
#line 196 "expression.y"
        { FreeList(((*yyvaluep).list), FreeExpression); };
/* Line 1393 of yacc.c  */
#line 3686 "expression.ec"
        break;
      case 175: /* constant_expression */
/* Line 1393 of yacc.c  */
#line 163 "expression.y"
        { FreeExpression(((*yyvaluep).exp)); };
/* Line 1393 of yacc.c  */
#line 3693 "expression.ec"
        break;
      case 176: /* declaration */
/* Line 1393 of yacc.c  */
#line 182 "expression.y"
        { FreeDeclaration(((*yyvaluep).declaration)); };
/* Line 1393 of yacc.c  */
#line 3700 "expression.ec"
        break;
      case 177: /* specifier_qualifier_list */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3707 "expression.ec"
        break;
      case 178: /* declaration_specifiers */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3714 "expression.ec"
        break;
      case 181: /* init_declarator_list */
/* Line 1393 of yacc.c  */
#line 202 "expression.y"
        { FreeList(((*yyvaluep).list), FreeInitDeclarator); };
/* Line 1393 of yacc.c  */
#line 3721 "expression.ec"
        break;
      case 182: /* init_declarator */
/* Line 1393 of yacc.c  */
#line 177 "expression.y"
        { FreeInitDeclarator(((*yyvaluep).initDeclarator)); };
/* Line 1393 of yacc.c  */
#line 3728 "expression.ec"
        break;
      case 183: /* storage_class_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3735 "expression.ec"
        break;
      case 184: /* ext_decl */
/* Line 1393 of yacc.c  */
#line 210 "expression.y"
        { FreeExtDecl(((*yyvaluep).extDecl)); };
/* Line 1393 of yacc.c  */
#line 3742 "expression.ec"
        break;
      case 186: /* attribute_word */
/* Line 1393 of yacc.c  */
#line 193 "expression.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 3749 "expression.ec"
        break;
      case 187: /* attribute */
/* Line 1393 of yacc.c  */
#line 211 "expression.y"
        { FreeAttribute(((*yyvaluep).attribute)); };
/* Line 1393 of yacc.c  */
#line 3756 "expression.ec"
        break;
      case 188: /* attribs_list */
/* Line 1393 of yacc.c  */
#line 212 "expression.y"
        { FreeList(((*yyvaluep).list), FreeAttribute); };
/* Line 1393 of yacc.c  */
#line 3763 "expression.ec"
        break;
      case 189: /* attrib */
/* Line 1393 of yacc.c  */
#line 209 "expression.y"
        { FreeAttrib(((*yyvaluep).attrib)); };
/* Line 1393 of yacc.c  */
#line 3770 "expression.ec"
        break;
      case 190: /* multi_attrib */
/* Line 1393 of yacc.c  */
#line 213 "expression.y"
        { FreeList(((*yyvaluep).list), FreeAttrib); };
/* Line 1393 of yacc.c  */
#line 3777 "expression.ec"
        break;
      case 191: /* type_qualifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3784 "expression.ec"
        break;
      case 192: /* type */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3791 "expression.ec"
        break;
      case 193: /* strict_type */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3798 "expression.ec"
        break;
      case 194: /* type_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3805 "expression.ec"
        break;
      case 195: /* strict_type_specifier */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3812 "expression.ec"
        break;
      case 196: /* struct_or_union_specifier_compound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3819 "expression.ec"
        break;
      case 197: /* struct_or_union_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3826 "expression.ec"
        break;
      case 199: /* struct_declaration_list */
/* Line 1393 of yacc.c  */
#line 205 "expression.y"
        { FreeList(((*yyvaluep).list), FreeClassDef); };
/* Line 1393 of yacc.c  */
#line 3833 "expression.ec"
        break;
      case 200: /* default_property */
/* Line 1393 of yacc.c  */
#line 186 "expression.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 3840 "expression.ec"
        break;
      case 201: /* default_property_list */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 3847 "expression.ec"
        break;
      case 202: /* property */
/* Line 1393 of yacc.c  */
#line 194 "expression.y"
        { FreeProperty(((*yyvaluep).prop)); };
/* Line 1393 of yacc.c  */
#line 3854 "expression.ec"
        break;
      case 203: /* struct_declaration */
/* Line 1393 of yacc.c  */
#line 192 "expression.y"
        { FreeClassDef(((*yyvaluep).classDef)); };
/* Line 1393 of yacc.c  */
#line 3861 "expression.ec"
        break;
      case 204: /* struct_declarator_list */
/* Line 1393 of yacc.c  */
#line 199 "expression.y"
        { FreeList(((*yyvaluep).list), FreeDeclarator); };
/* Line 1393 of yacc.c  */
#line 3868 "expression.ec"
        break;
      case 205: /* struct_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3875 "expression.ec"
        break;
      case 206: /* enum_specifier_nocompound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3882 "expression.ec"
        break;
      case 207: /* enum_specifier_compound */
/* Line 1393 of yacc.c  */
#line 169 "expression.y"
        { FreeSpecifier(((*yyvaluep).specifier)); };
/* Line 1393 of yacc.c  */
#line 3889 "expression.ec"
        break;
      case 208: /* enumerator_list */
/* Line 1393 of yacc.c  */
#line 197 "expression.y"
        { FreeList(((*yyvaluep).list), FreeEnumerator); };
/* Line 1393 of yacc.c  */
#line 3896 "expression.ec"
        break;
      case 209: /* enumerator */
/* Line 1393 of yacc.c  */
#line 171 "expression.y"
        { FreeEnumerator(((*yyvaluep).enumerator)); };
/* Line 1393 of yacc.c  */
#line 3903 "expression.ec"
        break;
      case 210: /* direct_abstract_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3910 "expression.ec"
        break;
      case 211: /* direct_abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3917 "expression.ec"
        break;
      case 212: /* abstract_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3924 "expression.ec"
        break;
      case 213: /* abstract_declarator_noarray */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3931 "expression.ec"
        break;
      case 214: /* declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3938 "expression.ec"
        break;
      case 215: /* direct_declarator_nofunction */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3945 "expression.ec"
        break;
      case 216: /* declarator_function */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3952 "expression.ec"
        break;
      case 217: /* direct_declarator */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3959 "expression.ec"
        break;
      case 218: /* direct_declarator_function_start */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3966 "expression.ec"
        break;
      case 219: /* direct_declarator_function */
/* Line 1393 of yacc.c  */
#line 172 "expression.y"
        { FreeDeclarator(((*yyvaluep).declarator)); };
/* Line 1393 of yacc.c  */
#line 3973 "expression.ec"
        break;
      case 220: /* type_qualifier_list */
/* Line 1393 of yacc.c  */
#line 198 "expression.y"
        { FreeList(((*yyvaluep).list), FreeSpecifier); };
/* Line 1393 of yacc.c  */
#line 3980 "expression.ec"
        break;
      case 221: /* pointer */
/* Line 1393 of yacc.c  */
#line 162 "expression.y"
        { FreePointer(((*yyvaluep).pointer)); };
/* Line 1393 of yacc.c  */
#line 3987 "expression.ec"
        break;
      case 222: /* parameter_type_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 3994 "expression.ec"
        break;
      case 223: /* parameter_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4001 "expression.ec"
        break;
      case 224: /* parameter_declaration */
/* Line 1393 of yacc.c  */
#line 178 "expression.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4008 "expression.ec"
        break;
      case 225: /* identifier_list */
/* Line 1393 of yacc.c  */
#line 203 "expression.y"
        { FreeList(((*yyvaluep).list), FreeTypeName); };
/* Line 1393 of yacc.c  */
#line 4015 "expression.ec"
        break;
      case 226: /* type_name */
/* Line 1393 of yacc.c  */
#line 178 "expression.y"
        { FreeTypeName(((*yyvaluep).typeName)); };
/* Line 1393 of yacc.c  */
#line 4022 "expression.ec"
        break;
      case 227: /* initializer */
/* Line 1393 of yacc.c  */
#line 176 "expression.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4029 "expression.ec"
        break;
      case 228: /* initializer_condition */
/* Line 1393 of yacc.c  */
#line 176 "expression.y"
        { FreeInitializer(((*yyvaluep).initializer)); };
/* Line 1393 of yacc.c  */
#line 4036 "expression.ec"
        break;
      case 229: /* initializer_list */
/* Line 1393 of yacc.c  */
#line 201 "expression.y"
        { FreeList(((*yyvaluep).list), FreeInitializer); };
/* Line 1393 of yacc.c  */
#line 4043 "expression.ec"
        break;
      case 230: /* statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4050 "expression.ec"
        break;
      case 231: /* labeled_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4057 "expression.ec"
        break;
      case 232: /* declaration_list */
/* Line 1393 of yacc.c  */
#line 200 "expression.y"
        { FreeList(((*yyvaluep).list), FreeDeclaration); };
/* Line 1393 of yacc.c  */
#line 4064 "expression.ec"
        break;
      case 233: /* statement_list */
/* Line 1393 of yacc.c  */
#line 204 "expression.y"
        { FreeList(((*yyvaluep).list), FreeStatement); };
/* Line 1393 of yacc.c  */
#line 4071 "expression.ec"
        break;
      case 234: /* compound_inside */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4078 "expression.ec"
        break;
      case 235: /* compound_start */
/* Line 1393 of yacc.c  */
#line 208 "expression.y"
        { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); };
/* Line 1393 of yacc.c  */
#line 4085 "expression.ec"
        break;
      case 236: /* compound_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4092 "expression.ec"
        break;
      case 237: /* expression_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4099 "expression.ec"
        break;
      case 238: /* selection_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4106 "expression.ec"
        break;
      case 239: /* iteration_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4113 "expression.ec"
        break;
      case 240: /* jump_statement */
/* Line 1393 of yacc.c  */
#line 179 "expression.y"
        { FreeStatement(((*yyvaluep).stmt)); };
/* Line 1393 of yacc.c  */
#line 4120 "expression.ec"
        break;
      case 241: /* string_literal */
/* Line 1393 of yacc.c  */
#line 193 "expression.y"
        { delete ((*yyvaluep).string); };
/* Line 1393 of yacc.c  */
#line 4127 "expression.ec"
        break;
      case 242: /* instantiation_named */
/* Line 1393 of yacc.c  */
#line 184 "expression.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4134 "expression.ec"
        break;
      case 243: /* instantiation_unnamed */
/* Line 1393 of yacc.c  */
#line 184 "expression.y"
        { FreeInstance(((*yyvaluep).instance)); };
/* Line 1393 of yacc.c  */
#line 4141 "expression.ec"
        break;
      case 245: /* class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4148 "expression.ec"
        break;
      case 246: /* constructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4155 "expression.ec"
        break;
      case 247: /* destructor_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4162 "expression.ec"
        break;
      case 248: /* virtual_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4169 "expression.ec"
        break;
      case 249: /* class_function_definition */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4176 "expression.ec"
        break;
      case 250: /* instance_class_function_definition_start */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4183 "expression.ec"
        break;
      case 251: /* instance_class_function_definition */
/* Line 1393 of yacc.c  */
#line 188 "expression.y"
        { FreeClassFunction(((*yyvaluep).classFunction)); };
/* Line 1393 of yacc.c  */
#line 4190 "expression.ec"
        break;
      case 252: /* data_member_initialization */
/* Line 1393 of yacc.c  */
#line 186 "expression.y"
        { FreeMemberInit(((*yyvaluep).memberInit)); };
/* Line 1393 of yacc.c  */
#line 4197 "expression.ec"
        break;
      case 253: /* data_member_initialization_list */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4204 "expression.ec"
        break;
      case 254: /* data_member_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 206 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMemberInit); };
/* Line 1393 of yacc.c  */
#line 4211 "expression.ec"
        break;
      case 255: /* members_initialization_list_coloned */
/* Line 1393 of yacc.c  */
#line 207 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4218 "expression.ec"
        break;
      case 256: /* members_initialization_list */
/* Line 1393 of yacc.c  */
#line 207 "expression.y"
        { FreeList(((*yyvaluep).list), FreeMembersInit); };
/* Line 1393 of yacc.c  */
#line 4225 "expression.ec"
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
    { (yyval.specifier) = MkSpecifier(BF16); }
    break;

  case 188:
/* Line 1787 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 189:
/* Line 1787 of yacc.c  */
#line 614 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 190:
/* Line 1787 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 191:
/* Line 1787 of yacc.c  */
#line 616 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 192:
/* Line 1787 of yacc.c  */
#line 617 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 193:
/* Line 1787 of yacc.c  */
#line 618 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 194:
/* Line 1787 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
    break;

  case 195:
/* Line 1787 of yacc.c  */
#line 620 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 196:
/* Line 1787 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 200:
/* Line 1787 of yacc.c  */
#line 625 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 201:
/* Line 1787 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 202:
/* Line 1787 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); }
    break;

  case 203:
/* Line 1787 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); }
    break;

  case 204:
/* Line 1787 of yacc.c  */
#line 632 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); }
    break;

  case 205:
/* Line 1787 of yacc.c  */
#line 633 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); }
    break;

  case 206:
/* Line 1787 of yacc.c  */
#line 634 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); }
    break;

  case 207:
/* Line 1787 of yacc.c  */
#line 635 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); }
    break;

  case 208:
/* Line 1787 of yacc.c  */
#line 636 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT128); }
    break;

  case 209:
/* Line 1787 of yacc.c  */
#line 637 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
    break;

  case 210:
/* Line 1787 of yacc.c  */
#line 638 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT16); }
    break;

  case 211:
/* Line 1787 of yacc.c  */
#line 639 "expression.y"
    { (yyval.specifier) = MkSpecifier(BF16); }
    break;

  case 212:
/* Line 1787 of yacc.c  */
#line 640 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); }
    break;

  case 213:
/* Line 1787 of yacc.c  */
#line 641 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); }
    break;

  case 214:
/* Line 1787 of yacc.c  */
#line 642 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); }
    break;

  case 215:
/* Line 1787 of yacc.c  */
#line 643 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
    break;

  case 216:
/* Line 1787 of yacc.c  */
#line 644 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); }
    break;

  case 217:
/* Line 1787 of yacc.c  */
#line 645 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
    break;

  case 218:
/* Line 1787 of yacc.c  */
#line 646 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); }
    break;

  case 219:
/* Line 1787 of yacc.c  */
#line 647 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); }
    break;

  case 223:
/* Line 1787 of yacc.c  */
#line 651 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); }
    break;

  case 224:
/* Line 1787 of yacc.c  */
#line 652 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
    break;

  case 225:
/* Line 1787 of yacc.c  */
#line 657 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 226:
/* Line 1787 of yacc.c  */
#line 658 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); }
    break;

  case 227:
/* Line 1787 of yacc.c  */
#line 659 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass((yyvsp[(2) - (4)].id)._class, (yyvsp[(2) - (4)].id).string); }
    break;

  case 228:
/* Line 1787 of yacc.c  */
#line 660 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); }
    break;

  case 229:
/* Line 1787 of yacc.c  */
#line 662 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 230:
/* Line 1787 of yacc.c  */
#line 664 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].id)._class, (yyvsp[(3) - (6)].id).string); }
    break;

  case 231:
/* Line 1787 of yacc.c  */
#line 665 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); }
    break;

  case 232:
/* Line 1787 of yacc.c  */
#line 666 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (5)].id)._class, (yyvsp[(3) - (5)].id).string); }
    break;

  case 233:
/* Line 1787 of yacc.c  */
#line 667 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); }
    break;

  case 234:
/* Line 1787 of yacc.c  */
#line 669 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (6)].specifier).nsSpec, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); }
    break;

  case 235:
/* Line 1787 of yacc.c  */
#line 673 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 236:
/* Line 1787 of yacc.c  */
#line 675 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 237:
/* Line 1787 of yacc.c  */
#line 678 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass((yyvsp[(3) - (3)].id)._class, (yyvsp[(3) - (3)].id).string); }
    break;

  case 238:
/* Line 1787 of yacc.c  */
#line 680 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass((yyvsp[(3) - (3)].specifier).nsSpec, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); }
    break;

  case 239:
/* Line 1787 of yacc.c  */
#line 684 "expression.y"
    { (yyval.specifierType) = structSpecifier; }
    break;

  case 240:
/* Line 1787 of yacc.c  */
#line 685 "expression.y"
    { (yyval.specifierType) = unionSpecifier; }
    break;

  case 241:
/* Line 1787 of yacc.c  */
#line 689 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); }
    break;

  case 242:
/* Line 1787 of yacc.c  */
#line 690 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); }
    break;

  case 243:
/* Line 1787 of yacc.c  */
#line 694 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; }
    break;

  case 244:
/* Line 1787 of yacc.c  */
#line 698 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
    break;

  case 245:
/* Line 1787 of yacc.c  */
#line 699 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); }
    break;

  case 246:
/* Line 1787 of yacc.c  */
#line 704 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 247:
/* Line 1787 of yacc.c  */
#line 706 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 248:
/* Line 1787 of yacc.c  */
#line 708 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 249:
/* Line 1787 of yacc.c  */
#line 710 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 250:
/* Line 1787 of yacc.c  */
#line 712 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 251:
/* Line 1787 of yacc.c  */
#line 715 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 252:
/* Line 1787 of yacc.c  */
#line 717 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 253:
/* Line 1787 of yacc.c  */
#line 719 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 254:
/* Line 1787 of yacc.c  */
#line 721 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 255:
/* Line 1787 of yacc.c  */
#line 723 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 256:
/* Line 1787 of yacc.c  */
#line 726 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 257:
/* Line 1787 of yacc.c  */
#line 728 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 258:
/* Line 1787 of yacc.c  */
#line 730 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 259:
/* Line 1787 of yacc.c  */
#line 732 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 260:
/* Line 1787 of yacc.c  */
#line 734 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 261:
/* Line 1787 of yacc.c  */
#line 737 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 262:
/* Line 1787 of yacc.c  */
#line 739 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 263:
/* Line 1787 of yacc.c  */
#line 741 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); }
    break;

  case 264:
/* Line 1787 of yacc.c  */
#line 743 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); }
    break;

  case 265:
/* Line 1787 of yacc.c  */
#line 745 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
    break;

  case 266:
/* Line 1787 of yacc.c  */
#line 749 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 267:
/* Line 1787 of yacc.c  */
#line 750 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
    break;

  case 268:
/* Line 1787 of yacc.c  */
#line 751 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 269:
/* Line 1787 of yacc.c  */
#line 752 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
    break;

  case 270:
/* Line 1787 of yacc.c  */
#line 753 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); }
    break;

  case 271:
/* Line 1787 of yacc.c  */
#line 754 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); }
    break;

  case 272:
/* Line 1787 of yacc.c  */
#line 755 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); }
    break;

  case 273:
/* Line 1787 of yacc.c  */
#line 756 "expression.y"
    { (yyval.classDef) = null; }
    break;

  case 274:
/* Line 1787 of yacc.c  */
#line 761 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); }
    break;

  case 275:
/* Line 1787 of yacc.c  */
#line 763 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); }
    break;

  case 276:
/* Line 1787 of yacc.c  */
#line 768 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); }
    break;

  case 277:
/* Line 1787 of yacc.c  */
#line 770 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); }
    break;

  case 278:
/* Line 1787 of yacc.c  */
#line 772 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 279:
/* Line 1787 of yacc.c  */
#line 774 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); }
    break;

  case 280:
/* Line 1787 of yacc.c  */
#line 776 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); }
    break;

  case 281:
/* Line 1787 of yacc.c  */
#line 780 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass((yyvsp[(2) - (2)].id)._class, (yyvsp[(2) - (2)].id).string); }
    break;

  case 282:
/* Line 1787 of yacc.c  */
#line 781 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass((yyvsp[(2) - (2)].specifier).nsSpec, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); }
    break;

  case 283:
/* Line 1787 of yacc.c  */
#line 786 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); }
    break;

  case 284:
/* Line 1787 of yacc.c  */
#line 787 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].id)._class, (yyvsp[(2) - (5)].id).string); }
    break;

  case 285:
/* Line 1787 of yacc.c  */
#line 788 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].id)._class, (yyvsp[(2) - (7)].id).string); }
    break;

  case 286:
/* Line 1787 of yacc.c  */
#line 789 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass((yyvsp[(2) - (7)].specifier).nsSpec, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); }
    break;

  case 287:
/* Line 1787 of yacc.c  */
#line 790 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass((yyvsp[(2) - (5)].specifier).nsSpec, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); }
    break;

  case 288:
/* Line 1787 of yacc.c  */
#line 795 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); }
    break;

  case 289:
/* Line 1787 of yacc.c  */
#line 797 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); }
    break;

  case 290:
/* Line 1787 of yacc.c  */
#line 802 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null, null); }
    break;

  case 291:
/* Line 1787 of yacc.c  */
#line 804 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp), null); }
    break;

  case 292:
/* Line 1787 of yacc.c  */
#line 805 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (2)].id), null, (yyvsp[(2) - (2)].list)); }
    break;

  case 293:
/* Line 1787 of yacc.c  */
#line 806 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (4)].id), (yyvsp[(4) - (4)].exp), (yyvsp[(2) - (4)].list)); }
    break;

  case 294:
/* Line 1787 of yacc.c  */
#line 812 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 295:
/* Line 1787 of yacc.c  */
#line 814 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
    break;

  case 296:
/* Line 1787 of yacc.c  */
#line 816 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); }
    break;

  case 297:
/* Line 1787 of yacc.c  */
#line 818 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); }
    break;

  case 298:
/* Line 1787 of yacc.c  */
#line 820 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 299:
/* Line 1787 of yacc.c  */
#line 822 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 300:
/* Line 1787 of yacc.c  */
#line 824 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 301:
/* Line 1787 of yacc.c  */
#line 826 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 302:
/* Line 1787 of yacc.c  */
#line 828 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 303:
/* Line 1787 of yacc.c  */
#line 830 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 304:
/* Line 1787 of yacc.c  */
#line 832 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 305:
/* Line 1787 of yacc.c  */
#line 837 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 306:
/* Line 1787 of yacc.c  */
#line 839 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
    break;

  case 307:
/* Line 1787 of yacc.c  */
#line 841 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); }
    break;

  case 308:
/* Line 1787 of yacc.c  */
#line 843 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 309:
/* Line 1787 of yacc.c  */
#line 845 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); }
    break;

  case 310:
/* Line 1787 of yacc.c  */
#line 849 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 312:
/* Line 1787 of yacc.c  */
#line 851 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 313:
/* Line 1787 of yacc.c  */
#line 852 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 314:
/* Line 1787 of yacc.c  */
#line 853 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 315:
/* Line 1787 of yacc.c  */
#line 854 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 316:
/* Line 1787 of yacc.c  */
#line 858 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); }
    break;

  case 318:
/* Line 1787 of yacc.c  */
#line 860 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 319:
/* Line 1787 of yacc.c  */
#line 861 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); }
    break;

  case 320:
/* Line 1787 of yacc.c  */
#line 862 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 321:
/* Line 1787 of yacc.c  */
#line 863 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 323:
/* Line 1787 of yacc.c  */
#line 911 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 324:
/* Line 1787 of yacc.c  */
#line 913 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 325:
/* Line 1787 of yacc.c  */
#line 919 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); }
    break;

  case 326:
/* Line 1787 of yacc.c  */
#line 921 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); }
    break;

  case 327:
/* Line 1787 of yacc.c  */
#line 923 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); }
    break;

  case 328:
/* Line 1787 of yacc.c  */
#line 925 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); }
    break;

  case 329:
/* Line 1787 of yacc.c  */
#line 927 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); }
    break;

  case 331:
/* Line 1787 of yacc.c  */
#line 933 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 332:
/* Line 1787 of yacc.c  */
#line 936 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 333:
/* Line 1787 of yacc.c  */
#line 938 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 334:
/* Line 1787 of yacc.c  */
#line 940 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); }
    break;

  case 337:
/* Line 1787 of yacc.c  */
#line 948 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 338:
/* Line 1787 of yacc.c  */
#line 950 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 340:
/* Line 1787 of yacc.c  */
#line 959 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 341:
/* Line 1787 of yacc.c  */
#line 961 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); }
    break;

  case 342:
/* Line 1787 of yacc.c  */
#line 963 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); }
    break;

  case 343:
/* Line 1787 of yacc.c  */
#line 967 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); }
    break;

  case 344:
/* Line 1787 of yacc.c  */
#line 968 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  }
    break;

  case 345:
/* Line 1787 of yacc.c  */
#line 972 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); }
    break;

  case 346:
/* Line 1787 of yacc.c  */
#line 973 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); }
    break;

  case 347:
/* Line 1787 of yacc.c  */
#line 974 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); }
    break;

  case 348:
/* Line 1787 of yacc.c  */
#line 975 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); }
    break;

  case 350:
/* Line 1787 of yacc.c  */
#line 980 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); }
    break;

  case 351:
/* Line 1787 of yacc.c  */
#line 984 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); }
    break;

  case 352:
/* Line 1787 of yacc.c  */
#line 985 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); }
    break;

  case 353:
/* Line 1787 of yacc.c  */
#line 989 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 354:
/* Line 1787 of yacc.c  */
#line 990 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 355:
/* Line 1787 of yacc.c  */
#line 991 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 356:
/* Line 1787 of yacc.c  */
#line 995 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); }
    break;

  case 357:
/* Line 1787 of yacc.c  */
#line 996 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); }
    break;

  case 358:
/* Line 1787 of yacc.c  */
#line 1000 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); }
    break;

  case 359:
/* Line 1787 of yacc.c  */
#line 1001 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); }
    break;

  case 360:
/* Line 1787 of yacc.c  */
#line 1011 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 361:
/* Line 1787 of yacc.c  */
#line 1013 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); }
    break;

  case 362:
/* Line 1787 of yacc.c  */
#line 1015 "expression.y"
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

  case 363:
/* Line 1787 of yacc.c  */
#line 1030 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 364:
/* Line 1787 of yacc.c  */
#line 1032 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); }
    break;

  case 365:
/* Line 1787 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); }
    break;

  case 366:
/* Line 1787 of yacc.c  */
#line 1055 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); }
    break;

  case 373:
/* Line 1787 of yacc.c  */
#line 1069 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 374:
/* Line 1787 of yacc.c  */
#line 1071 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; }
    break;

  case 375:
/* Line 1787 of yacc.c  */
#line 1073 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 376:
/* Line 1787 of yacc.c  */
#line 1077 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); }
    break;

  case 377:
/* Line 1787 of yacc.c  */
#line 1078 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); }
    break;

  case 378:
/* Line 1787 of yacc.c  */
#line 1082 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); }
    break;

  case 379:
/* Line 1787 of yacc.c  */
#line 1083 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); }
    break;

  case 380:
/* Line 1787 of yacc.c  */
#line 1086 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 381:
/* Line 1787 of yacc.c  */
#line 1090 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); }
    break;

  case 382:
/* Line 1787 of yacc.c  */
#line 1091 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); }
    break;

  case 383:
/* Line 1787 of yacc.c  */
#line 1092 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); }
    break;

  case 384:
/* Line 1787 of yacc.c  */
#line 1096 "expression.y"
    { (yyval.context) = PushContext(); }
    break;

  case 385:
/* Line 1787 of yacc.c  */
#line 1101 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
    break;

  case 386:
/* Line 1787 of yacc.c  */
#line 1109 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); }
    break;

  case 387:
/* Line 1787 of yacc.c  */
#line 1113 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
    break;

  case 388:
/* Line 1787 of yacc.c  */
#line 1114 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 389:
/* Line 1787 of yacc.c  */
#line 1118 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); }
    break;

  case 390:
/* Line 1787 of yacc.c  */
#line 1119 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 391:
/* Line 1787 of yacc.c  */
#line 1120 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 392:
/* Line 1787 of yacc.c  */
#line 1124 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 393:
/* Line 1787 of yacc.c  */
#line 1125 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 394:
/* Line 1787 of yacc.c  */
#line 1126 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 395:
/* Line 1787 of yacc.c  */
#line 1127 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 396:
/* Line 1787 of yacc.c  */
#line 1129 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 397:
/* Line 1787 of yacc.c  */
#line 1130 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 398:
/* Line 1787 of yacc.c  */
#line 1131 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); }
    break;

  case 399:
/* Line 1787 of yacc.c  */
#line 1135 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); }
    break;

  case 400:
/* Line 1787 of yacc.c  */
#line 1136 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 401:
/* Line 1787 of yacc.c  */
#line 1137 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
    break;

  case 402:
/* Line 1787 of yacc.c  */
#line 1138 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); }
    break;

  case 403:
/* Line 1787 of yacc.c  */
#line 1139 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); }
    break;

  case 404:
/* Line 1787 of yacc.c  */
#line 1143 "expression.y"
    { (yyval.string) = CopyString(yytext); }
    break;

  case 405:
/* Line 1787 of yacc.c  */
#line 1148 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;}
    break;

  case 406:
/* Line 1787 of yacc.c  */
#line 1150 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;}
    break;

  case 407:
/* Line 1787 of yacc.c  */
#line 1155 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; }
    break;

  case 408:
/* Line 1787 of yacc.c  */
#line 1157 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;}
    break;

  case 409:
/* Line 1787 of yacc.c  */
#line 1159 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); }
    break;

  case 410:
/* Line 1787 of yacc.c  */
#line 1161 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); }
    break;

  case 411:
/* Line 1787 of yacc.c  */
#line 1166 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; }
    break;

  case 412:
/* Line 1787 of yacc.c  */
#line 1168 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;}
    break;

  case 413:
/* Line 1787 of yacc.c  */
#line 1173 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 414:
/* Line 1787 of yacc.c  */
#line 1175 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 415:
/* Line 1787 of yacc.c  */
#line 1180 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); }
    break;

  case 416:
/* Line 1787 of yacc.c  */
#line 1185 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); }
    break;

  case 417:
/* Line 1787 of yacc.c  */
#line 1190 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 418:
/* Line 1787 of yacc.c  */
#line 1192 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
    break;

  case 419:
/* Line 1787 of yacc.c  */
#line 1197 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 420:
/* Line 1787 of yacc.c  */
#line 1199 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 421:
/* Line 1787 of yacc.c  */
#line 1201 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 422:
/* Line 1787 of yacc.c  */
#line 1203 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 423:
/* Line 1787 of yacc.c  */
#line 1205 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 424:
/* Line 1787 of yacc.c  */
#line 1211 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); }
    break;

  case 425:
/* Line 1787 of yacc.c  */
#line 1216 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); }
    break;

  case 426:
/* Line 1787 of yacc.c  */
#line 1220 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;}
    break;

  case 427:
/* Line 1787 of yacc.c  */
#line 1221 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
    break;

  case 428:
/* Line 1787 of yacc.c  */
#line 1226 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); }
    break;

  case 429:
/* Line 1787 of yacc.c  */
#line 1228 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); }
    break;

  case 430:
/* Line 1787 of yacc.c  */
#line 1233 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 431:
/* Line 1787 of yacc.c  */
#line 1237 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); }
    break;

  case 432:
/* Line 1787 of yacc.c  */
#line 1238 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 433:
/* Line 1787 of yacc.c  */
#line 1239 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 434:
/* Line 1787 of yacc.c  */
#line 1240 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 435:
/* Line 1787 of yacc.c  */
#line 1241 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  }
    break;

  case 436:
/* Line 1787 of yacc.c  */
#line 1242 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); }
    break;

  case 438:
/* Line 1787 of yacc.c  */
#line 1247 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); }
    break;

  case 439:
/* Line 1787 of yacc.c  */
#line 1248 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); }
    break;

  case 440:
/* Line 1787 of yacc.c  */
#line 1252 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); }
    break;


/* Line 1787 of yacc.c  */
#line 6968 "expression.ec"
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
#line 1254 "expression.y"

